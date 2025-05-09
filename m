Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D6AB1B69
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 19:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2113E10E11F;
	Fri,  9 May 2025 17:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UQOFNQo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC1410E11F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 17:13:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43ef83a6bfaso1225e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746810818; x=1747415618;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VaVuUlmTBwUGFLDmqnTpZ1Y04NZbtvxnB5A69BImEI=;
 b=UQOFNQo72bhU75XuJooe6baP95Ax9R3DV96UbQdSvBRSop5aLQf4aknXHUBmweYiFh
 DteI/lk9cunMvcqef9l9g5MNlGMqOY9zvM8dEsRBafI5N1TMRlkglXqztDRNaKde4DB/
 ZPfYSv1QXWoMzhE9QHpNUgxva4EP9BTrLWY+F8HWSwE1lm6vTsJGx4tx7V8t1o1XNSG+
 b4nsbmAf/z5HRae5m822+wHHu3J67jhyPEpj5kLrxPTDKc0hfKjVdjtAJZlapvNj6zF7
 YcJhM7jekO6mcJVh06Qgb/mzrWaboP+6q6oTw6QjJ0wWoP3gYrzDPgPY0ynHmWLrLfcB
 Uqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810818; x=1747415618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VaVuUlmTBwUGFLDmqnTpZ1Y04NZbtvxnB5A69BImEI=;
 b=HzgxtvxTTvvWAKoFeqHrUegdBNyVdjEj407xaGc/TvuPbrGuLoMrUKx8fAIOYoF9h8
 szl5sAKml8Z2X3ruX3di4BtwnMRaci8OR7zapDy6+c6asRI0/aSidsHlMwzveT/zXuVT
 H0JnhbF6Bt/zLUdiKUdkSp8BTBCCPYs6xtlM6xr3bqiIp8NTmxMNa4IQzo5ufYQc6g3O
 OPHT2SRrmgCJ0XRYlvVTTgu8u5zB2iKlBFX5eBp6bYNkRrKPBOmDwP0BvLfG+B34r+sz
 pI/zRiUeSF8qdCKw4bJoKOEhCv85wKMIHMkk3EhkcPx4eCURnMtb+PWLX61FAY27iaqg
 upXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz/7fWfzT47STo6YzU+jVxH+Br/UduDup4HHe56hu/t8AYlRYh2HCBHCM/tgbWZmh099DJQhgV55Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgIRAvvn6iYV7i59xcQVYks4dVyqnPVsDQbFcHBRpwUO+HVQqc
 yt/riEX9kcSF2SlbgLnFIxpBeFZS54SBvbCR3Tnb7W9+pH/AmurcyxsfGJNrLRrn3o8coX1WWI2
 wF+6pjhJaD7IbM7hjkVUVCrsQEZQgpuNE2CvE
X-Gm-Gg: ASbGncteKBpxiTLMm0wB3MF421fNuBOkoxHbf9miJ7iMsqPrcdgS0CyE1+uYXCTwXUH
 wNolFTYrdhbDz0ldGRNoHTFRbaefdC7ZnF6+Yb/hssENoQ5ySaY28TKLrgp7y05IDACJRX9i3sd
 35MXG/pJDd7cEga5NtvW1Z
X-Google-Smtp-Source: AGHT+IGT/ZF46/GjI2YJV8SislyLWmjgR7bh1R7xJkwAOUVe7U8oq9t1ZWPW+aXIicMtdoBOVsn4uE7XK6SJT8ETH7c=
X-Received: by 2002:a05:600c:3789:b0:439:9434:1b6c with SMTP id
 5b1f17b1804b1-442d7c2cb4dmr1036775e9.3.1746810817854; Fri, 09 May 2025
 10:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-4-tjmercier@google.com>
 <CAPhsuW613T4biUPER9zR9DdQA_wscN4-i3vV4efoOKUZ7pkTeA@mail.gmail.com>
In-Reply-To: <CAPhsuW613T4biUPER9zR9DdQA_wscN4-i3vV4efoOKUZ7pkTeA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 10:13:26 -0700
X-Gm-Features: AX0GCFsAmjlDFEArBqLUnLS1jyLR63E5yA91kW0eDQ-Z7yMddq7EqrFUgFenMYg
Message-ID: <CABdmKX0t-ng2WJPUdjXUgtbyNks4vcp3rVNbQOGPNFRF5kTQGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 3/5] bpf: Add open coded dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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

On Thu, May 8, 2025 at 5:28=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > This open coded iterator allows for more flexibility when creating BPF
> > programs. It can support output in formats other than text. With an ope=
n
> > coded iterator, a single BPF program can traverse multiple kernel data
> > structures (now including dmabufs), allowing for more efficient analysi=
s
> > of kernel data compared to multiple reads from procfs, sysfs, or
> > multiple traditional BPF iterator invocations.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Acked-by: Song Liu <song@kernel.org>
>
> With one nitpick below:
>
> > ---
> >  kernel/bpf/dmabuf_iter.c | 47 ++++++++++++++++++++++++++++++++++++++++
> >  kernel/bpf/helpers.c     |  5 +++++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> > index 96b4ba7f0b2c..8049bdbc9efc 100644
> > --- a/kernel/bpf/dmabuf_iter.c
> > +++ b/kernel/bpf/dmabuf_iter.c
> > @@ -100,3 +100,50 @@ static int __init dmabuf_iter_init(void)
> >  }
> >
> >  late_initcall(dmabuf_iter_init);
> > +
> > +struct bpf_iter_dmabuf {
> > +       /* opaque iterator state; having __u64 here allows to preserve =
correct
> > +        * alignment requirements in vmlinux.h, generated from BTF
> > +        */
>
> nit: comment style.

Added a leading /*

(This is copied from task_iter.c, which currently has the same style.)


> > +       __u64 __opaque[1];
> > +} __aligned(8);
> > +
> > +/* Non-opaque version of bpf_iter_dmabuf */
> > +struct bpf_iter_dmabuf_kern {
> > +       struct dma_buf *dmabuf;
> > +} __aligned(8);
> > +
> [...]
