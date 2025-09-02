Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1087B41015
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 00:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D210E055;
	Tue,  2 Sep 2025 22:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vkdHkCoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D054310E055
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 22:38:00 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5607c2f1598so2253039e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756852678; x=1757457478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2Z2q0BkPqIY+E04bVXl2gU0zLZQjMNqg1qcdhYoTFM=;
 b=vkdHkCoiAenrMN4KYNFB+Q7hed3M2hBfpmw8MyPLfE/AVy+laMRaUZFYkTwZqK22NI
 AKo/kN1io0Q6OG2UheFLo/pjnyoOqP99KSWUy5bjX+wh9fkUBLPT92lvTHoOqilui3qY
 qLLrNYkfNHH+qzwubF4WHQNr9Bp1isZ9QLcuyOdY0ne6SYsK8E5qzbSty7WJXgBYsjlB
 Qa2rONVH1JeBtwYk3OX5UkbOWkIGdy/5ESnHd/SXRzOF1anVF8/4X1d0H1QeSHUnfaED
 +KgxDh+ag51nhGIzK53uwf25rxfhvHrMS+VFvK2kvndHNq5JUdogpA4vyVUk9s7UAQGm
 HgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756852678; x=1757457478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Z2q0BkPqIY+E04bVXl2gU0zLZQjMNqg1qcdhYoTFM=;
 b=WQRqttwf+s8MTt1+uIlaWYPi9Qw5elMdhYyDK2nU1YpUnOUVJwwxGncqQG8bvbO0cz
 zy5kPhup9md1D1WuvBgBrs27Qg6OEMG2BNfPBUPK2oW6AYEVlV5cM8/5u6NxsSAucWRd
 y31RPWkaFhECrGSmnR2YOjQE3qLzdu82rrmuJCA0uTfcSC+a2GLmRkXvukL7Z5Hk5vO0
 3Yr7rW9fGPfNFy4+i9xYe49GSyacrt4J0w7ko1YRAmWT+Yda8DDmanCKfDq2a8wT6nu1
 Fu6Ezq4Z0Ekj5Ad6O2WnrmLGfy228pUI28p2Cr4ipa8nIw89wnWsHAVuh5c16BNUM1h7
 noCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwZ2ufZbkAP6bTQxkITQagG+8+TtXLrGqFgM3MppssiBL5us34EwRwiZyQfTmP1PxF1/NosZD35M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNBFxNZElP5MYwLD4Q0okLnTdbA1zQ32FuHsNLFNjdP+W6iXNY
 i7XbR+YxEZIrk4Id7g9aK4SOqheIqlcFrzvyKLYpQa2POcsCWJGi8vFx+ikAG14x9+emCn4z8JA
 UK2/ulJY4Y4koY3xQlCeoomp7pZ/YHtwZgt96WWEo/7NcvcSzds26PnA=
X-Gm-Gg: ASbGncu6TFQcUseyYIWQiIp7Cvk94b5U+MmNIG4eL2EPrOBlFBO1sKqSsIsZC4o8mik
 o+P0m9GgEFZc9wLaGFcbXtlx6n0mfxwOrZlIm2KseW3BAP49n5JlRc7f2m7aSeg3lOGftEqtadk
 kBtvuzr6D1IcXWnGdrnQFacWV8K0SiUMF0mg1Er2vtzFD9XjSL5YpTYEx0KaNvKy4QE07Hbc+jP
 o93BsAovRq1SLUr9H+ZyqAkZrHjWg5oiIdcKSzJU+tKVscdnGyrQx+WhRRJIlhv
X-Google-Smtp-Source: AGHT+IGmWy6Aq1ZCfTZaoiG4mkrbhZY4MfRXR19EYAWZXvoUsJvrpBj01w+uPYMLT8d4w27jw93YIe/anSgqxv5w//I=
X-Received: by 2002:a05:6512:32cb:b0:55f:3bca:b161 with SMTP id
 2adb3069b0e04-55f708db526mr4266129e87.27.1756852678372; Tue, 02 Sep 2025
 15:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
In-Reply-To: <20250902154630.4032984-5-thierry.reding@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 2 Sep 2025 15:37:45 -0700
X-Gm-Features: Ac12FXwG3iNj8EaL9OuUHyuMyacZ5I_i_Y3lylzCsdPDiddwbaDN3qJymljUZSU
Message-ID: <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
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

On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Add a callback to struct dma_heap_ops that heap providers can implement
> to show information about the state of the heap in debugfs. A top-level
> directory named "dma_heap" is created in debugfs and individual files
> will be named after the heaps.
>

I know its debugfs, but this feels a little loosey-goosey as an uAPI.
Is there any expected format for the show function?

What would other dmabuf heaps ideally export via this interface?

Is there some consistent dma_heap-ish concept for it to justify it
being under a dma_heap directory, and not just an independent debugfs
file for the driver implementing the dmabuf heap?

thanks
-john
