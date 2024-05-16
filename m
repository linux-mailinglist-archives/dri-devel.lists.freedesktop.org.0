Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7A8C7AB0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 18:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4D010E1E9;
	Thu, 16 May 2024 16:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BJqVmyST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7310E1E9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 16:51:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-420107286ecso3225e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 09:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715878309; x=1716483109;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onRIPguZVTKnH89R9mkjKZKxwfRC8K+qmiRpCHzudec=;
 b=BJqVmyST3xX8shxnS8zYFR9Tpbl2FaTsOX8fCPPUXJuZYD4zL2dr4JYRgxTDC1jtmJ
 udifL7IeYoBWJb3vrJzSWZbPYWEveB5ybHX4yUSWV8qonvoWyIvpiLvAeu7bwqZNwYGA
 GkoHl4QTnsqK0swPbd2aaaBurV5nBGT120hViepLhsYuCw4Fyrel0kNllPOZpy9J5q7v
 XRtQEvBFNfMNvaJ4omBsuHj3AmlBZwseYOjCRiqAhTNOYCCdBzkTggVU00kdsFWikek/
 pyW4kQfvEJ1NXIi5lTH/s98aoKrqh8oQ497MB1/bAT7HiIsx6e+/RszzDQPIyhkqx7Qc
 yaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715878309; x=1716483109;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onRIPguZVTKnH89R9mkjKZKxwfRC8K+qmiRpCHzudec=;
 b=tPbLmL4zjwFa2Y+egSe6/uZAyE7aRgzD41IMP0PSdyS419vgJPIi/dfmOQ+fQ6fjXQ
 k/XZUKwSZ/p6t2iptoKjfq+J0HsssPp35kMoo6hJv3bf/59SsLvGTWHhU9pwb7C2fz93
 zhG10Qx/V7jYEoz6+JR8Uj9EIzYo//zI4I8lOcahf2CjSvQn0XN6tR0vd9Hg7YHDNHgy
 aJb0Sool9TgbxOLk07GHDsDTnEun83eYmEBTr0mdSIKp+2kSzV4qxvU6/tPGMVZ7lci5
 VRrP1NJx39569ZDji9jBxtoDNm1MidsqVxKAJQWzVma9J0Eb6dQ6RZDyG6r8PiJSxlTA
 ISvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYqlwM0cCX1k5PtzYaurGG7ASZGRZj3KPwO/kkL9UD0xAWtyoDL2Tb6dT9Ig7kHvF/Vd67b8hKZ9ECr5RWuKwBuM9nV0G0KbO2ygDwU69o
X-Gm-Message-State: AOJu0YyO7hLt4nfIysSmPon8flJdZnl0EzAiymrcunT2vXU1mN9eGJ4R
 23eHppUuT8R2Fg4so1CaAKPmwUIqI7freDD6jCnQ6HoCvVcNvI6Hv3iOnD2LUJ0/V2aCTF4vDx/
 jod1P15Lzp3cCZT6IybIfE3htP60K7wMr+VE=
X-Google-Smtp-Source: AGHT+IEtjZ9BDFF4UXQQ+nrOQN0XGRAp0bc3xjYZiRXnK81siroeleNET7wr5DctMi1WpgetmZ17HV2nwiWezX0TGvA=
X-Received: by 2002:a05:600c:34c2:b0:41b:e55c:8dca with SMTP id
 5b1f17b1804b1-4200f8c6eeamr11617495e9.7.1715878309151; Thu, 16 May 2024
 09:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
In-Reply-To: <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
From: John Stultz <jstultz@google.com>
Date: Thu, 16 May 2024 09:51:35 -0700
Message-ID: <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
To: John Stultz <jstultz@google.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
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

On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > But it makes me a little nervous to add a new generic allocation flag
> > for a feature most hardware doesn't support (yet, at least). So it's
> > hard to weigh how common the actual usage will be across all the
> > heaps.
> >
> > I apologize as my worry is mostly born out of seeing vendors really
> > push opaque feature flags in their old ion heaps, so in providing a
> > flags argument, it was mostly intended as an escape hatch for
> > obviously common attributes. So having the first be something that
> > seems reasonable, but isn't actually that common makes me fret some.
> >
> > So again, not an objection, just something for folks to stew on to
> > make sure this is really the right approach.
>
> Another good reason to go with full heap names instead of opaque flags on
> existing heaps is that with the former we can use symlinks in sysfs to
> specify heaps, with the latter we need a new idea. We haven't yet gotten
> around to implement this anywhere, but it's been in the dma-buf/heap todo
> since forever, and I like it as a design approach. So would be a good ide=
a
> to not toss it. With that display would have symlinks to cma-ecc and cma,
> and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
> SoC where the display needs contig memory for scanout.

So indeed that is a good point to keep in mind, but I also think it
might re-inforce the choice of having ECC as a flag here.

Since my understanding of the sysfs symlinks to heaps idea is about
being able to figure out a common heap from a collection of devices,
it's really about the ability for the driver to access the type of
memory. If ECC is just an attribute of the type of memory (as in this
patch series), it being on or off won't necessarily affect
compatibility of the buffer with the device.  Similarly "uncached"
seems more of an attribute of memory type and not a type itself.
Hardware that can access non-contiguous "system" buffers can access
uncached system buffers.

thanks
-john
