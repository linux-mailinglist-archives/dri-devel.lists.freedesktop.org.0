Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821278C6C47
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 20:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709F10E622;
	Wed, 15 May 2024 18:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tdOC9MBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5E10E622
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 18:43:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41fef5dda72so328675e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715798592; x=1716403392;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYw08SuW0XGtCkslQ7Pr4vhaF6oLwiqfmnivOAxBqiQ=;
 b=tdOC9MBAd4SbaIWx90PwCqfmDhFNAKKYF8H4PduM77jfT/K251g3JSHcIr8F1rDbk8
 ZYTwSaN6FhqToRJdAbzdMiPmGF7u7lWpgFCDPMrgBlFKV2O0ckFfb9JRsSDYdmDa80tX
 r1W3GzkXMpb04lnQ6UXKA8Ug+fl3x8c8Y47MBiuOAcYxJzaUKStvNct9H+pB6uuPCUEt
 I2LD7S9FzMEniLpV5ng4fmq70jQ39Q14KB6oyGqWj4Q3H9EDTBZDNUWJSA7DVhvA1bvp
 htWqgRPDO8m58NrXD22Yf5oryak0+Oz2oNgtEnk4VcMK7VmCb0Nyw2zLLgcmPQ2tZnEj
 bGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715798592; x=1716403392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYw08SuW0XGtCkslQ7Pr4vhaF6oLwiqfmnivOAxBqiQ=;
 b=ljNXpFM361AvoeYq+wdyE3NDk2LnK2kilSz6SEKuTzw6awXORGaV8NcH4neDDUQTc7
 XxMdtgD44lC2+eQVXksAPX7XFSaKB0ThgbKevcdcjgACMUIgvKoXu7/JxQ8MSwU1aMDF
 gw3YWWa8CnHi+ayuE5P2UCH1ru/dkmY8PYSpfUdT5uDjsObUVMkeqjwYe0YpL8TxeWnZ
 avy0svk41kdyvoTXrgiYMg1kLVIAm7P49ywsrJneAZU2BAbp9Vmn11/kjkMgs1TKYfBS
 0MAHK90BC34znruN/noCExupYYxDiq8C9Xq604a5y4bIi6dD1ykek17v8BRG40t6NoD4
 7jzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAlhJV/Vu7f5nYfRXNfWNcp1Mh8PN//YHgSitmHrnO+QnlWHxHKHwb325W+7rMV8hrgG7KwVQodsiq1HBYz2toMtveNjRXVGiwelqhHH5x
X-Gm-Message-State: AOJu0YwnkvG6mN55DtqNcI/aMgAnlKf0QLhLPAdAn0h1q2mWX1CYuM7t
 XApB+/1oAJbWn89HXMhLs04HCEpEFAMEO73ocl4oE8d1Gvyc6zD9dLjBf/GUW16dj6myeCboCiL
 wa7Kmb+tFGIfbjSv0Z1sX7sDldyMmYspKmiU=
X-Google-Smtp-Source: AGHT+IFXSyoRhWYZAyF4PDyMeovRDQKPGnBFuRGgfH4SBcREIVqL7zoHTwvnfnjWyp/GpdS9YamBKyr7G4+ZcxRuOuI=
X-Received: by 2002:a05:600c:3d9a:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-4200ebea389mr9541355e9.0.1715798591515; Wed, 15 May 2024
 11:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 15 May 2024 11:42:58 -0700
Message-ID: <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
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

On Wed, May 15, 2024 at 6:57=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> This series is the follow-up of the discussion that John and I had a few
> months ago here:
>
> https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqy=
rroCMQ@mail.gmail.com/
>
> The initial problem we were discussing was that I'm currently working on
> a platform which has a memory layout with ECC enabled. However, enabling
> the ECC has a number of drawbacks on that platform: lower performance,
> increased memory usage, etc. So for things like framebuffers, the
> trade-off isn't great and thus there's a memory region with ECC disabled
> to allocate from for such use cases.
>
> After a suggestion from John, I chose to start using heap allocations
> flags to allow for userspace to ask for a particular ECC setup. This is
> then backed by a new heap type that runs from reserved memory chunks
> flagged as such, and the existing DT properties to specify the ECC
> properties.
>
> We could also easily extend this mechanism to support more flags, or
> through a new ioctl to discover which flags a given heap supports.

Hey! Thanks for sending this along! I'm eager to see more heap related
work being done upstream.

The only thing that makes me a bit hesitant, is the introduction of
allocation flags (as opposed to a uniquely specified/named "ecc"
heap).

We did talk about this earlier, and my earlier press that only if the
ECC flag was general enough to apply to the majority of heaps then it
makes sense as a flag, and your patch here does apply it to all the
heaps. So I don't have an objection.

But it makes me a little nervous to add a new generic allocation flag
for a feature most hardware doesn't support (yet, at least). So it's
hard to weigh how common the actual usage will be across all the
heaps.

I apologize as my worry is mostly born out of seeing vendors really
push opaque feature flags in their old ion heaps, so in providing a
flags argument, it was mostly intended as an escape hatch for
obviously common attributes. So having the first be something that
seems reasonable, but isn't actually that common makes me fret some.

So again, not an objection, just something for folks to stew on to
make sure this is really the right approach.

Another thing to discuss, that I didn't see in your mail: Do we have
an open-source user of this new flag?

thanks
-john
