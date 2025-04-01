Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB70A7767E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9287210E515;
	Tue,  1 Apr 2025 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JsOxi66j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C736210E515
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:33:17 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2c76a1b574cso1634430fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743496396; x=1744101196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
 b=JsOxi66jhXm5wbEmS/2PsaLmXcPsn4qqgyzUtL4YEtHZ/PlZTRG5/LLexTE98XWUyc
 57/Y3Mgp7A6Mwy+fuek3UPC7sPPV0/rKHGMcIgdAmXAtOA7swXIw9lawQjgfeJYYGfrt
 ufKUcjmlwdjcRje9hS3INqQ0DTv1dskzGBmGaR6pBo8/YgHmtcwDgPVfWOWME6vZDseV
 RsioKcL9ZKqEsuXyNdBLFunvoQCGZ7QVpmQzQp46dS/nsIimlIxr5N7uS0g6Ca9ZDGg7
 BLZFQ9ETslG00fB5ND86DqUg4cs0XChGhATMEz7JGiggIwk1JtX2gYbbulh/FTcc0EY1
 i88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743496396; x=1744101196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
 b=WTCmMWBBkS257FNYSncTcUvOHSV2T+ayjzQ75QL/uQUM68NbMfDg/SwEhlJpdHMkrR
 he2Ek7TUJliwdpzmp4qsrfivarSdg3jMVDvPeEAWmsGRYxyZJx5E+jkJBRnE2z6Aq6ep
 fqbinSi9ZmROqx9nI8zVEGcn1ZHlP1rXx23bpNAyISppW4oWSVhjbhTVwksB/RuZUp06
 BesHEjQfYuv/WF+71SEDD02gSudlY1hXgnnfGTg1LzbRM85WOXXIWySbmn6WwN2LfqQ3
 uIjGTHcF6cDIFUOU+VBQae53an8zRDOLCATqb0Zt8wO6Kw5iKiXtDIjmRrEH/5lxvonL
 v/LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN6r1QQwEOoxD+8z4kKdSw21304Wn0pjoeOay3gaik312qPnQ+Nkb14ScPNS6kUSjBjMRZ02hZ3l4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpm1x4L5bpnhr0a+TBWGPj6W27o5XbOgbOKpmeSZyyUNMQSPRj
 C8ZAA3jzcw0G/tG5aRpzuE0lDtG9ZHHSj2yC/RuDrcvyOrHA5sbXbOdnFAQ09gEYscoQMljhP71
 dHVrwEEEXC1eK2ZBrQisR0/LkNyHoBkkiP2oyWA==
X-Gm-Gg: ASbGncua7VaGJ5W+loKKJ9uLCBYXeyucmYKITdrE514LehZ4y8ooffC3o/SwsLy3Qpe
 nAvFxOc6AehNoC+pE2cuSlBQJ6gOaXhLN/yWO6MkaM6E6V1mUtS9JSELzSuyK9xqxY4cEIOg6IH
 i76KLJfMaROq9ZXUjLZPeu1lQ9N1E=
X-Google-Smtp-Source: AGHT+IH9KoU4vUjjPFFl/HpklAnLrv8QnpnI/vnq7QrGKUOSlwBJn74UzBQjYlMDiU71pl/whujtfshDhL1bJanCT0o=
X-Received: by 2002:a05:6870:7815:b0:2c1:9a53:83c4 with SMTP id
 586e51a60fabf-2cbcf755a40mr7187474fac.26.1743496396402; Tue, 01 Apr 2025
 01:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
In-Reply-To: <Z-ucuPzwz4IqVTgb@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 10:33:04 +0200
X-Gm-Features: AQ5f1JrwSW9AJKXv4JPdCzTC-p9MDUHywS1_JUmGEaiaPvfsks0gIEo3VJPjUog
Message-ID: <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
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

On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
>
> <snip>
>
> >
> > >
> > > > +
> > > > +#include "tee_private.h"
> > > > +
> > > > +struct tee_dma_heap {
> > > > +     struct dma_heap *heap;
> > > > +     enum tee_dma_heap_id id;
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     /* Protects pool and teedev above */
> > > > +     struct mutex mu;
> > > > +};
> > > > +
> > > > +struct tee_heap_buffer {
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     size_t size;
> > > > +     size_t offs;
> > > > +     struct sg_table table;
> > > > +};
> > > > +
> > > > +struct tee_heap_attachment {
> > > > +     struct sg_table table;
> > > > +     struct device *dev;
> > > > +};
> > > > +
> > > > +struct tee_rstmem_static_pool {
> > > > +     struct tee_rstmem_pool pool;
> > > > +     struct gen_pool *gen_pool;
> > > > +     phys_addr_t pa_base;
> > > > +};
> > > > +
> > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > >
> > > Can this dependency rather be better managed via Kconfig?
> >
> > This was the easiest yet somewhat flexible solution I could find. If
> > you have something better, let's use that instead.
> >
>
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>         depends on HAVE_ARM_SMCCC
>         depends on MMU
>         depends on RPMB || !RPMB
> +       select DMABUF_HEAPS
>         help
>           This implements the OP-TEE Trusted Execution Environment (TEE)
>           driver.

I wanted to avoid that since there are plenty of use cases where
DMABUF_HEAPS aren't needed. This seems to do the job:
+config TEE_DMABUF_HEAP
+ bool
+ depends on TEE =3D y && DMABUF_HEAPS

We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kern=
el.

Cheers,
Jens
