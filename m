Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA6F9299BA
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 22:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE1C10E1A2;
	Sun,  7 Jul 2024 20:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gxPTqWNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750210E1A0;
 Sun,  7 Jul 2024 20:40:48 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7fd6762b296so5375339f.2; 
 Sun, 07 Jul 2024 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720384847; x=1720989647; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wmhc+zRv8pLLe0u2BD2Av7AlaACzMrIvBAZzVMfblQc=;
 b=gxPTqWNxSWfVztAiqLalq2U6raoTdmFCAkY8sE1xBw84IhK2BeHPlucLoiP1A4lC1f
 q5bmK6jZ1bs91qik7i/67fjYkFuHxqDsH8p5VQxyIUI40JHYBkgPc/UBa0tXhZrVjl4B
 YZWNuIhP0a8zEYZ320GxY2x7idT0dq2PIJPhQoY/KZH4M/UX2rh0LNY9zxzbTUUenXag
 IHOIKi5+IARzN1p4zjrE8E0gArPeZoD90RjJD1+2mJeUtAXostfJbRlvPhPvqYEY6hGz
 nkX4XU8lP/cVwg+T9Q1pPLbxb0VGzqXVmhw3SjG/V4jUyclUxT/Km4kO9hjR6IW+eji0
 jwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720384847; x=1720989647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wmhc+zRv8pLLe0u2BD2Av7AlaACzMrIvBAZzVMfblQc=;
 b=UahF0PqbqU9U+tJFVqjyYlIw/C2rvxxipbNr5oXnTbnN+98+ZpO7y0bCcVxQmHUNUf
 UpFWWeO+1TAsmK45lX5+oNTVfiz6wkJojGkEQLKE64qVfZONg8HMG2+uD22xepzwPqPZ
 O9t1ehnDXU9UEv3MvXpdsxFqU0LHxRFjvErbiCW/1wRrnj/WGhQIUPRYY8NPv0K4ZQIN
 I6PB/GShsC4qqg6Q3sZwc3hIZXCknlUbVvzyRUfxpGOnp2oifGq0CpEk5zr5QqB0P9Im
 E35ZOi0fYt9EST8VWVIrY0NvaOGaElB0Me9F4QG53S/51qVokJbB0XOe78UUgijAhKKE
 +7Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9MY+cl4MHRqfGd4St+ccIvlwH6QPM0efyftEbfKc1+6ErD9doepgSLnVfAnzIuPeppkWl7fpats44QNOhut2PvSefUD7e24xQwtfH2B3H
X-Gm-Message-State: AOJu0YzWgnO0m57Jgs0IVk+YxaMZiQAyfzm5rl6vJHyyuIRXVaReTRkR
 qfjnBiBdKY5LQe4EnWC6yVCr4xJy9PPRMnNfubR5/1lECaFUOqrFeDIF45bNKdxA5rY1gkmXkE3
 hb1g1pTqARIlToxXdhEGXBTLqzQbSmgWN
X-Google-Smtp-Source: AGHT+IF0N+8688muyeK/+tfJRXNZr2JpvxV4K3V8rANm4Z5BaZ9oWE7IdFRBYwzX8ieDq5qht3hPcD46vcpQ770Matw=
X-Received: by 2002:a05:6602:184f:b0:7f9:59af:c26b with SMTP id
 ca18e2360f4ac-7f959afc527mr445880439f.17.1720384847333; Sun, 07 Jul 2024
 13:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
 <20240705200013.2656275-4-l.stach@pengutronix.de>
In-Reply-To: <20240705200013.2656275-4-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 7 Jul 2024 22:40:35 +0200
Message-ID: <CAH9NwWf9QiwwaNtXuPyiTNpTzN_7p19rrZ6czpTRCuv5-kaXew@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/etnaviv: update hardware headers from rnndb
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
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

>
> Update state_hi.xml.h header from etna_viv commit
> 8f43a34fd9cd ("rndb: document FE current primitve debug reg")
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2: no changes
> ---
>  drivers/gpu/drm/etnaviv/state_hi.xml.h | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/state_hi.xml.h b/drivers/gpu/drm/etnaviv/state_hi.xml.h
> index 829bc528e618..f7bc5f6e20ff 100644
> --- a/drivers/gpu/drm/etnaviv/state_hi.xml.h
> +++ b/drivers/gpu/drm/etnaviv/state_hi.xml.h
> @@ -8,17 +8,17 @@ This file was generated by the rules-ng-ng headergen tool in this git repository
>  git clone git://0x04.net/rules-ng-ng
>
>  The rules-ng-ng source files this header was generated from are:
> -- state.xml     (  29355 bytes, from 2024-01-19 10:18:54)
> -- common.xml    (  35664 bytes, from 2023-12-06 10:55:32)
> -- common_3d.xml (  15069 bytes, from 2023-11-22 10:05:24)
> -- state_hi.xml  (  35854 bytes, from 2023-12-11 15:50:17)
> -- copyright.xml (   1597 bytes, from 2016-11-10 13:58:32)
> -- state_2d.xml  (  52271 bytes, from 2023-06-02 12:35:03)
> -- state_3d.xml  (  89522 bytes, from 2024-01-19 10:18:54)
> -- state_blt.xml (  14592 bytes, from 2023-11-22 10:05:09)
> -- state_vg.xml  (   5975 bytes, from 2016-11-10 13:58:32)
> -
> -Copyright (C) 2012-2023 by the following authors:
> +- state.xml     (  30729 bytes, from 2024-06-21 11:31:54)
> +- common.xml    (  35664 bytes, from 2023-12-13 09:33:18)
> +- common_3d.xml (  15069 bytes, from 2023-12-13 09:33:18)
> +- state_hi.xml  (  35909 bytes, from 2024-06-21 11:31:54)
> +- copyright.xml (   1597 bytes, from 2020-10-28 12:56:03)
> +- state_2d.xml  (  52271 bytes, from 2023-05-30 20:50:02)
> +- state_3d.xml  (  89626 bytes, from 2024-06-21 11:32:57)
> +- state_blt.xml (  14592 bytes, from 2023-12-13 09:33:18)
> +- state_vg.xml  (   5975 bytes, from 2020-10-28 12:56:03)
> +
> +Copyright (C) 2012-2024 by the following authors:
>  - Wladimir J. van der Laan <laanwj@gmail.com>
>  - Christian Gmeiner <christian.gmeiner@gmail.com>
>  - Lucas Stach <l.stach@pengutronix.de>
> @@ -467,6 +467,7 @@ DEALINGS IN THE SOFTWARE.
>  #define VIVS_MC_PROFILE_CONFIG0                                        0x00000470
>  #define VIVS_MC_PROFILE_CONFIG0_FE__MASK                       0x000000ff
>  #define VIVS_MC_PROFILE_CONFIG0_FE__SHIFT                      0
> +#define VIVS_MC_PROFILE_CONFIG0_FE_CURRENT_PRIM                        0x00000009
>  #define VIVS_MC_PROFILE_CONFIG0_FE_DRAW_COUNT                  0x0000000a
>  #define VIVS_MC_PROFILE_CONFIG0_FE_OUT_VERTEX_COUNT            0x0000000b
>  #define VIVS_MC_PROFILE_CONFIG0_FE_CACHE_MISS_COUNT            0x0000000c
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
