Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645FECC1B00
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBD310E784;
	Tue, 16 Dec 2025 09:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ACcErCJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65A810E784
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 09:05:54 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8b9d2e33e2dso676438785a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765875954; x=1766480754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omqi83Dx+x81K7T7juSYrVfh9uoVtgWx0kBcmziIq4E=;
 b=ACcErCJAhbbxwUFwBrCzjTTH0n/AhRUVbvYW3wH5j8Z28TDbRSd/0wrOjvwCr3u/6T
 rxbmOeXEqBEzoAc4IP6y95aQKZkWbYRAIQCQixfp5Pn3H3HESpk2Q5hgi2p5N3iPZEoa
 NRBbS7hnUCpkqmZbHTPbIVlRDcZRNqp4ODeE/IhJoRPrDY9Z6Aj7qaiGVz+QTBGPmgx8
 sLDxgx/dSLG2t5C5bCwcwZb0N/HdScbzpNlvkhrpSsd9n30ZWXKMBkg0FGQ85VqYAS63
 aB1lslQVAXu57rFjKjoGZHHguzJOxQKEy2NGPEm9k9Sv7I+y2QI35B3a6QpjHfMmhSuc
 VKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765875954; x=1766480754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=omqi83Dx+x81K7T7juSYrVfh9uoVtgWx0kBcmziIq4E=;
 b=DpT9dArmS6srK6xBpQUdnHo8WaXYcvt4yyO3/lZOAdQjDWBRM3gyO7MyDphAoXtqV3
 harXYGPFI4x9HXNnWiorcWhXFcveB2q29J+Eb1hSQbFeUTeLXkh6qjd9Ri2ZAuntj7Wo
 l2BLR9wXWH/pL3oZAhBlNIIDcAsdA4YtPSvWKkADmuq46PgOAYRSn8e0aHgpVJksqgta
 6s+8Dgd1B6TsqVf2MjJ4XdTKbLveuk6CT/vCyrFnBPVo4KUWz7weOm02yvIq/yXmJMZt
 YUYwfH0S3stELOVgG7XgxHOCmt1NaTdL4UEB+CVPfOF/uOeBb7z6WZ6i3dHpmwbONbXJ
 icSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOpQM0ezDBD25YoHnVkM4hOdaH9hSNq+xxcJZ3fMelkQh8kotbd2lItf7cGG3bYAxkUf0NfOLWHWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqCrk6LXBsTWvAf++Fd1flUuDnwphuPFNhybe6j4p6Btc4QMYK
 V5RsiD1wZG0ljREhNUTQscDb42ZfGgOd8cdWT/ckK7w7Fjc7w8oDq8eU9frfRuI2IPPcrtwzpLl
 /+va0n1gwqIV5hovuF2SvsEsBvJqlMQA=
X-Gm-Gg: AY/fxX7Qr2G1gnGvS7cw0npXwdXsG/y0XuLn39r36z1fhWNog7/xbC6jIv9OOX3BXIg
 22zB67UgRHHSxyR+cHHT1Vmb03BlirMSQeMOt0adm+j56Ho3pU++NcDlojI4J0o7F2ncG2VneXW
 toaqEjgZxUPizIxDrl8Co6XlNcnlU43yRB3fIB2pkIYQwln+ndZIb/Jpufx8dOjxAIOoAg0Uojz
 RDdJ5pLHbyTO5snaLloyFdBCsZz1bAMtrPn6SDh5YpBeKxmJuqqMnxLvunkW/P8X+J/Mg==
X-Google-Smtp-Source: AGHT+IGtPCRn7o6GpcrQ+8fRciXS7VNEpBZ8Lkf23ew80RNqVMmRb7tCJfaiB2F9T8S4MmAQPN7EoUUC/1k6/pOdU/A=
X-Received: by 2002:a05:622a:5a12:b0:4ee:275c:28db with SMTP id
 d75a77b69052e-4f1d05a92b6mr191064771cf.40.1765875953475; Tue, 16 Dec 2025
 01:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20251216063952.516364-1-gxxa03070307@gmail.com>
 <7a41abc8-df47-459a-ab3e-ba7943fdd0ff@amd.com>
In-Reply-To: <7a41abc8-df47-459a-ab3e-ba7943fdd0ff@amd.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 16 Dec 2025 17:05:42 +0800
X-Gm-Features: AQt7F2ow7EPRc4zp2vCM4VRNSdM0megkZw_8cCDJsWlQEr6TXDtd8MO6vKv8G1g
Message-ID: <CAGsJ_4wbKFf68EW9vF7k6W0PPbMbjnc9s=rKBzqOnhfDwC3F8g@mail.gmail.com>
Subject: Re: [PATCH v6] dma-buf: add some tracepoints to debug.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org,
 rostedt@goodmis.org, mhiramat@kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org, 
 brauner@kernel.org, akpm@linux-foundation.org, 
 linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 16, 2025 at 4:44=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 12/16/25 07:39, Xiang Gao wrote:
> > From: gaoxiang17 <gaoxiang17@xiaomi.com>
> >
> > Since we can only inspect dmabuf by iterating over process FDs or the
> > dmabuf_list, we need to add our own tracepoints to track its status in
> > real time in production.
> >
> > For example:
> >    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_=
name=3Dqcom,system size=3D12685312 ino=3D2738
> >    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=
=3Dqcom,system size=3D12685312 ino=3D2738 fd=3D8
> >    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_interna=
l: exp_name=3Dqcom,system size=3D28672 ino=3D2739
> >      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_nam=
e=3Dqcom,system size=3D12685312 ino=3D2738
> >     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_nam=
e=3Dqcom,system size=3D12771328 ino=3D2762 fd=3D176
> >     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_atta=
ch: exp_name=3Dqcom,system size=3D12771328 ino=3D2762 attachment:ffffff880a=
18dd00 is_dynamic=3D0 dev_name=3Dkgsl-3d0
> >     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_=
name=3Dqcom,system size=3D12771328 ino=3D2762 attachment:ffffff880a18dd00 i=
s_dynamic=3D0 dev_name=3Dkgsl-3d0
> >
> > Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Going to push this to drm-misc-next today unless somebody has some last m=
inute objections.

No objection, but I would strongly suggest Xiang include a
diff description next time, after the changelog for each new
version.

I recall clearly commenting on both changelog refinement and
the DMA_BUF_TRACE() macro [1]. It would be better to mention
similar things for each new version next time :-)

[1] https://lore.kernel.org/lkml/CAGsJ_4y0zc_nh2q=3Dw4uR04vtveCf6L7+hgafznH=
uL8ByWbyNOQ@mail.gmail.com/

Thanks
Barry
