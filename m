Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A72BB52AFE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF0710E2AC;
	Thu, 11 Sep 2025 08:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qYV/5N1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AD710E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:00:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b02c719a117so73911366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757577647; x=1758182447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1PODi6H2K7+3LlGxoQuwHZt3UE/qkC9ZdWrwkyFJNM=;
 b=qYV/5N1n8uQdEC7FH4O6w/qK8dtN4XiSYBraWrbkKI05Mxp///05/5oiDpuk6CeHRu
 Ro7rfw3P8Y61jPnDFtwV56qZKgv2GV5R3qlliWn4EO5oIbytC+d/TaxQ1g9WyZHba0BF
 wr2yBP6ndKiWAXV9MSgiynBGEN6dBJhDxnQTKSAZr/eHRpE/r9Y/3yr5eGa4SXuYQx91
 ySVt2V+5Miru0fWfH8gvs6t51N+XaD0BgzW90yT9nlOU0+Xs2jMpmN/YrYDujbr8uYzb
 edDrFUPKUZMc8QblVbSY+grDsDlQChGhl4Ed2jph/l7ansy2oed3T7ep9yAf8AzmA9C5
 6k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757577647; x=1758182447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1PODi6H2K7+3LlGxoQuwHZt3UE/qkC9ZdWrwkyFJNM=;
 b=L4i6S4KmWcQDEADSOFAwyjOsWb7wtMjAg8W1S2aXNKsEPxzzwp4pJwl8n/Ip2iNiTA
 FiWX35yHjuoYA81LItuKirtC5U8rJQmwvl92ixQsd1hTkPDw9yWeC1epm1kIbk01Sevs
 g6m2ziD1avYYHSXvloDIYcSqPOr1IWoCQ0SbcTGQPEVjt72NCurZv1MIdQGjUrH38JeJ
 i7jUv5tz0BpA1qoEC3NgeoAK98+4ZMwsGd7QZeqvLAtT0KBZZ7Tt6N7egFpMMDT0mLf4
 OvoPE5uHgMKVjcy8k3VbbBsEUlrsXt0bSRFZhSBGKX82Hzr6ao9+PFHzi0vnVVybfQBu
 sq2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCl4V9+mvU1LRWhYCgAjHuqBT4dfVDMTFw8m/NO2zq7/SXAhM4/3X9RLBH7D4gsCQXCQu9B51UThM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4JFDbq33Dxr1S3zxfHhjwNbq086gL17iIllbfc6LuH4QT54ec
 TthWEYUUTRR/OWQNacnqiBPkZA1Kw9izjg3DMS1EKUQM+PdP+V8YdrowpmeOqOXDNo4Lyd32fW2
 r0IMBWGM6abYShz7VGDSYAJ349kLTfZ1u7YQxRAjNMQ==
X-Gm-Gg: ASbGncuRFhZZJQVdNrQY7XooyC4txZOQN9maRU45FdniRLAmEBe5+T6dOVF4yW6tQtJ
 LKM4ozcdiqEZCOLDVzl/ZYCPeaG8JPlLU/6WNwogxZa0swQ2MFonSJOne4rftHZGwIlaKNr0jBV
 C4X4Jwqze3fprJcNVQiMpifH+uWe7dOqt7KgzljihQgSS2NVHFodpXr+B8Kiv2PiwJNbVa/YRva
 OWuauwNPhRv+exiNjhl0lIMu2X8G5h77rjlyb/8vYtyquNiuA==
X-Google-Smtp-Source: AGHT+IGzEzYwQLiPc3IcgYMCTY8qsO9y3WwakWS4JOu30bLWGh1BqDh6LLf50f7d7Tw863clhJFa4G2RQKg6ioIUUPY=
X-Received: by 2002:a17:907:d16:b0:b04:568b:8a42 with SMTP id
 a640c23a62f3a-b04b14bbbf0mr1838289166b.29.1757577646906; Thu, 11 Sep 2025
 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
 <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
 <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
 <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
In-Reply-To: <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 11 Sep 2025 13:30:35 +0530
X-Gm-Features: Ac12FXxwSUSxE1PNcza1ZTKnBgiGX0FqXLDfvqSE4P5WPQr00OaAEtYCSrcigho
Message-ID: <CAO_48GE=FHaNzybUxjY=igyOO1oasKb9yu_yAjJEdjTQXicaJA@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

Hi Jens,

On Thu, 11 Sept 2025 at 13:20, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
>
> Hi Sumit,
>
> On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro=
.org> wrote:
> >
> > Hello Jens,
> >
> > On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote=
:
> > >
> > > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kerne=
l.org> wrote:
> > > >
> > > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > > Export the dma-buf heap functions to allow them to be used by the=
 OP-TEE
> > > > > driver. The OP-TEE driver wants to register and manage specific s=
ecure
> > > > > DMA heaps with it.
> > Thank you for the series.
> >
> > Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for =
these?
>
> Sure, what namespace do you want in the argument for
> EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?

I think "DMA_BUF_HEAP" may be better?
>
> >
> > With that change, please feel free to use my
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Thanks,
> Jens
>
> > > > >
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > >
> > > > Can we get an ack from DMAbuf maintainers here? With that we should=
 be
> > > > able to queue this patch-set for linux-next targetting the 6.18 mer=
ge
> > > > window.
> > > >
> > > > -Sumit
> > >
> > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > >
> > > Sorry I haven't been able to participate much upstream lately.
> > > >
> > > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-hea=
p.c
> > > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > > --- a/drivers/dma-buf/dma-heap.c
> > > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *h=
eap)
> > > > >  {
> > > > >       return heap->priv;
> > > > >  }
> > > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > > >
> > > > >  /**
> > > > >   * dma_heap_get_name - get heap name
> > > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap=
 *heap)
> > > > >  {
> > > > >       return heap->name;
> > > > >  }
> > > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > > >
> > > > >  /**
> > > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dm=
a_heap_export_info *exp_info)
> > > > >       kfree(heap);
> > > > >       return err_ret;
> > > > >  }
> > > > > +EXPORT_SYMBOL(dma_heap_add);
> > > > >
> > > > >  static char *dma_heap_devnode(const struct device *dev, umode_t =
*mode)
> > > > >  {
> > > > > --
> > > > > 2.43.0
> > > > >
> >
> > Best,
> > Sumit.



--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed
