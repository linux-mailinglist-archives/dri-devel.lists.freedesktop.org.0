Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D25AC04F3
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9510EFAF;
	Thu, 22 May 2025 06:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lpoCwTgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152249B05C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:56:44 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-73044329768so6170202a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747897003; x=1748501803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
 b=lpoCwTgMJZwAjiaLJ3B8rhgteR3g/DPxwtUGPHUp0Hr1JjL+IV23kdzm2vVI+ff7UH
 mdiHvaVeqJFUOE+2Dukn1eZbkqxoZS3CSqXVBU9i8gN4vdkhArl2AIwRHHOdd1ybfNO+
 W5lMT4ncJ7hd3v4WnMCW3Ae90AFm7+tDNzcJv/rLFSjc0wKhzYFgxdCsaD2iR7b1em9R
 UitWtB8g7yCx+d6nTTlVrmNupY037sIE0tSSlcx3Gqv6wIO2om51cuwth21l0Z7BOuqa
 B/ajYU4XSJ7M0YSgjXjhGOtDsQB8ElQSfQkCW8uhVdV/qCU4k5oO74Db6i2TG8gxUih9
 hJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747897003; x=1748501803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
 b=lteFlbbI1EfNx/e1d8+/BkkLy/eWOVJRoMukOKjiGlY0RcNq06LoWgcFh0TJqMMYUK
 H6NqxX89M9uZGkDIwTHABxiY1XWBJx0gzFBG/Q2WNWkdcdGtZJVZwL5AizdI+cpYHby1
 2hXqAmSbZ3exmjI3Fi1F1qgkzrgysDxqIvNQGcJG4BSHT3JbIbZhCH3xG8bSCiNW1RVz
 f1vieHOtIkv7fQ2k4TL/05XmqLlCL8hqfpU1JpoLNv/8mzTEXh19ygJtJTOyCIIgdB4i
 W55yk79HwFnAD4F6JsgkG7dyqGBntppbX+f/KnGY4yNNxOrfcvPmsPRyeEh95u6SSGF/
 3qnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtSCOrIGR6VXfEzzCRCN0Qm4dX+JWWKKa1uXbKnB7SFZs+nK5KV3kmdH3/ABt8uo2hyIRk1c8Lxwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwrjG+Dt4BmaSLzGTHK4EUUEQpv8NrNhNi01/DPT7R0OV2VvaP
 FuB39ckD3e6sGE6M00rBLoReG+uMQ0oaqma56q3ArSYKk+BhC54MiFOKPbTmFiyiUizlXIRvd/7
 UieSTHLjhuIUKRpYkIFfQIqo8ydInLLImZme36+siug==
X-Gm-Gg: ASbGnctb1cK15Jx/woY6mEdOX/Ll4AZEr152orFIhTO2InyIRyNHnFH7pHLlGkLVFtR
 eLRsxuQw9idjRQTNysJdlrf3xa2Eg3hmhFDf8NA4gTwwrQHJpGhh27WjpxcHkz4EVeKD3Y3h3xF
 O2NXS/6g85/W/F2bIIBxVMka+G9zx7jETKXA==
X-Google-Smtp-Source: AGHT+IHkFUemf1YsBa7Ra5vRLLSyYkClMUJvfuEYqOo7C5Q/HY7RUEskcqp+LiC0Z8m9NvJveoTaK0UdZlaYOd03Who=
X-Received: by 2002:a05:6808:6410:b0:3f7:ff67:1d8c with SMTP id
 5614622812f47-404d88d532amr14478281b6e.36.1747897003075; Wed, 21 May 2025
 23:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org>
 <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
In-Reply-To: <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 08:56:31 +0200
X-Gm-Features: AX0GCFsuHYqDh1JYpWH8r8xDir4J3V2XXHJjiARqLynYHFcDQxMIIZpQ5oYhZd4
Message-ID: <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
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

On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/20/25 17:16, Jens Wiklander wrote:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h>.
>
> That is what this patch does and that should be obvious by looking at it.=
 You need to explain why you do this.
>
> Looking at the rest of the series it's most likely ok, but this commit me=
ssage should really be improved.

I'm considering something like this for the next version:
Export the dma-buf heap functions declared in <linux/dma-heap.h> to allow
them to be used by kernel modules. This will enable drivers like the OP-TEE
driver, to utilize these interfaces for registering and managing their
specific DMA heaps.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
>
