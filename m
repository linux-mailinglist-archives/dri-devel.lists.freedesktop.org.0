Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06573BB3F44
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E310E19B;
	Thu,  2 Oct 2025 12:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qlGpBkdS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5310E19B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:57:38 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-43f8911522cso1290544b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759409858; x=1760014658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=;
 b=qlGpBkdS1oS/7ggGQmlMSj1txklpWfu2Q6WGdek3VltbCv7dI0niRoCYHq7GL7WeRW
 Qij/djUfpfLmxnIvMkn1oGDFnvVSvb8738mzuI9+l7OYQLJ2wlR+YV3GhrwGb9p243c4
 FLmkUXYa15qseMen9Gt9OM2YsUdNp4mxNP9u9iM3SMEXX1lswIz0q/rEL7whEGEvqpvo
 gvHJYZ8PguWK25g4Fq2Jbj9R8OiBacedhB3j6hJm+g6g5Zi4t3nYIk+gjhyns9aB6/L9
 q4hfIT662PgiGf9UWBwLS9D4bdXcEDycciqeTPJwZ/S3r4bLlPINBxmM6MUzB5Qch2pC
 Uzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759409858; x=1760014658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=;
 b=OR0zPBzdmA0QLsvwXdhqPJdfxbs94s8oqomV+8n+Us6ToupO9aa8AOP62c/XnbTDc6
 k6XsLKamAH09A3SHYqGrvEY0wx8LFFf0TuhSazUANPRRItWjJHXh/tZl7D0tV1RPy4g0
 G/rM3kKJYy/BS0O/P+Tbi9bEur9e6yZ/XnVBtJZKSdUHKwFwwA8CrLL5pG5pHjZ6ojy7
 xUt3UN20CtRu+ZzfHEVKF96HGbaytGxHLSQQnNyaolsNSsBZiMSBhaJC+i8a9uSKIrSX
 EpytRDbR1ir+9JaRHSQwkpqZTfj9nDSSQ4Dij5XCakMlc4wXVqImWRiBOqW7+ygRREYy
 MM+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXPgbyd1HhIHLq8UMeMQTL/mH9cBGkdGcxGqqRpOPcPHMMVSVSWnOQOQV3bNn7b8dvf+lUIG3Rw68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7aslqvvxI/cQgqa4o7mJAqoKe4wRScbYj8h4zoi+iHChM5LZE
 LeZ0K8GI+mjFSos7FeZJx3q4zQ95dfwyKtZC9FJPF9A2YwuO2ACgWFIqWxzLAJLEqTALeFlfFrv
 0S2dM0huYDh0ElbZJT9NTofuDFI8Aha6BDIzeKdgbKeyS51oERowAzEM=
X-Gm-Gg: ASbGncuWFfjJ8p87H3Q2Li5Uoc2ki6dlRqi2EtA4GjTVnRItf+0rLO/tqy2DVpoT6WO
 XvzFIg/OKaFJWjdJF4s18hDJaNlgRIvgoe7Ibh+zpv87LJXIKJEKfxD5b1Wkby4pCDV8FysproL
 Q/Ehd3tWNSAO6tIWB7OK87OKGhYsHgbWGXhizRHBuhU4OLKxoj4b0lnlrRGxABsdh3ZKWeoIr5e
 Mf40f5cVO6ZPW1ZLI+i4mE5DSvtT9Xf4gSO
X-Google-Smtp-Source: AGHT+IHYX7pg60feCJITkUMOxMprgz6P5nDIrUPJazgK/QAWeqrWOagX4EH5hYzH12fx7NdLiTURGQeRt8nyhXDnw20=
X-Received: by 2002:a05:6808:2385:b0:438:23ad:5dbc with SMTP id
 5614622812f47-43fb15cb75cmr1662193b6e.20.1759409857632; Thu, 02 Oct 2025
 05:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org>
 <20251002-sceptical-goose-of-fame-7b33d6@houat>
In-Reply-To: <20251002-sceptical-goose-of-fame-7b33d6@houat>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 14:57:25 +0200
X-Gm-Features: AS18NWB-MzLg3sZZl_om3Nb3U3T2KFc8NTfBmABGN9BozXUUDdedKeLjWJJE67A
Message-ID: <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
To: Maxime Ripard <mripard@redhat.com>
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
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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

Hi,

On Thu, Oct 2, 2025 at 9:54=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> > +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> > +{
> > +     switch (id) {
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> > +             return "protected,secure-video";
> > +     case TEE_DMA_HEAP_TRUSTED_UI:
> > +             return "protected,trusted-ui";
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> > +             return "protected,secure-video-record";
> > +     default:
> > +             return NULL;
> > +     }
> > +}
>
> We've recently agreed on a naming guideline (even though it's not merged =
yet)
>
> https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0d=
fd@kernel.org

I wasn't aware of that (or had forgotten it), but during the revisions
of this patch set, we changed to use "protected".

>
> Secure and trusted should be defined I guess, because secure and
> protected at least seem redundant to me.

Depending on the use case, the protected buffer is only accessible to
a specific set of devices. This is typically configured by the TEE
firmware based on which heap we're using. To distinguish between the
different heaps, I've simply added the name of the use case after the
comma. So the name of the heap for the Trusted-UI use case is
"protected,trusted-ui". What would a heap called "protected,ui"
represent? Protected buffers for a UI use case? What kind of UI use
case? If the name of the heap is too generic, it might cover more than
one use case with conflicting requirements for which devices should be
able to access the protected memory.

Thanks,
Jens
