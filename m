Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F438B708
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AE96F4F2;
	Thu, 20 May 2021 19:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A9E6F4F2;
 Thu, 20 May 2021 19:16:11 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u11so17423636oiv.1;
 Thu, 20 May 2021 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8IA4EK6QCZUPS2VJM/CthWGQXD1VY0qEbTyCJO+YaKI=;
 b=IB7FUTa3Fm9U+stZPo8LH03erUcgUmfhx7Jry7EQ7Jtzc3Ac1SG4eaPkgQitM1UHr0
 jpEDSZeQG+skg4Dwxxv/gO/wLl867g1RwV0EN1QvM6I+Djtd7951uvKVrQnx7hOJfg+o
 miEzOj5wK5zSDduqudgNH7DiQDBvLljTQapNLDsAXmkfTZOF02r1LiNMkbwwlPnnVFIH
 VvXftcgZxL+5WaQrD86+D4UAPJ5Dp/4yu/z0PNs/LeQ8/NuzS0R31Fk8I68nEDKmDGjP
 5zohz3AsNpNBp5VfyqmlQ7bZTKU3kL7PcB/G5XVu3FrGbBJHk7ejRMG4qU8InVWmjbpW
 rw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8IA4EK6QCZUPS2VJM/CthWGQXD1VY0qEbTyCJO+YaKI=;
 b=Z5BeqQjMH5EdTVDS2UKBNGair9sr62afoxfyMTpIdDcKeTUpwT82fg85/edDeulLvf
 TLw+A2Xu8EjVkexKh/mVY6WoMH+w95TrrvM93Q6rAzueImcQVtV7d8jhr91QmUMfIL1c
 EkAxU/cvD3koNIblDATPFFdKCzlqbDffrFiyvlWJJGS3n7InKGg+bBwndRbhoiUni7cR
 GKoLiNSzY7Bo/RItmxXClCDjwMmFqsSzKQsK0L3+Ulrb9gaMPWpN71NhClzY1VjqTz9L
 7tJ4ZPKvLhe8dL5JmFcBACHNnzYvorfSSgwedTXrcZsUhjGOBiGRTjAHtSWQqYabgCU/
 kj7A==
X-Gm-Message-State: AOAM532fbAOEF0evJfJhzuXOVetjxDZE6bmxFgmr+FtWaGqhiqg233Os
 8JjhbvlQdX6PfG/lvfy6yuQb/qKnS31//ER6Oes=
X-Google-Smtp-Source: ABdhPJyjZJXNvUa5xHZWnGMQdRLZVinC4OBHnKgEG8wYkwieJ5ywWJUtdKBa3zvbFenStYoZkol8ak3wmyzA1Ffu+LI=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr4194241oie.120.1621538170961; 
 Thu, 20 May 2021 12:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-20-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-20-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:15:59 -0400
Message-ID: <CADnq5_OZR3qTX2hcDQyhgSGUyWAgCdUiJu3ODD_owJRip_RMOw@mail.gmail.com>
Subject: Re: [PATCH 19/38] drm/radeon/cik: Fix incorrectly named function
 'cik_irq_suspend()'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/cik.c:7450: warning: expecting prototype for cik_=
irq_disable(). Prototype was for cik_irq_suspend() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/radeon/cik.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 42a8afa839cbb..73ea5189dfb1a 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -7439,7 +7439,7 @@ static void cik_irq_disable(struct radeon_device *r=
dev)
>  }
>
>  /**
> - * cik_irq_disable - disable interrupts for suspend
> + * cik_irq_suspend - disable interrupts for suspend
>   *
>   * @rdev: radeon_device pointer
>   *
> --
> 2.31.1
>
