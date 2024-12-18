Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78A9F6889
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5778B10E34E;
	Wed, 18 Dec 2024 14:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="No8DRBih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9B410E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:33:16 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4678cd314b6so64217571cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1734532396; x=1735137196;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hV3DIp6RmS8KTTomLMUpan5WTpqJUmt3bncnfXMh8Wk=;
 b=No8DRBihEdiGqOEJjolai07jIJ0Yy8MgzXZ607iyY0RM9uSMAT3f0bVE97rGgr+9jy
 ubFO2HeIbDBxhtGI3wYjanBqyklh0CG5+4jZHiNgFxwl+kvefjYCuqx7i1JxRRlRvKZf
 OVoiV7+zgVZN3hjM3Leg2vZNSprnQqRoLpHat94irozy2ad9RuinGEWRwBTM+0f+YJFz
 KRBl5Ay0jUh0p5KpeWfnC0e14/K8D7osqtg01klt+QdOT2+Do2u8J/16Pd41MxPfxC2z
 pBRMxYjEbf6FVamRlvSYFv1/R9i9X83h1oHhzFZN1TjPus1XqQr+ZCpvgzUr+MiTzgnv
 gd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734532396; x=1735137196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hV3DIp6RmS8KTTomLMUpan5WTpqJUmt3bncnfXMh8Wk=;
 b=ecfYcMpnqMc9c7cgkbLnFjFLHTISXsOjKwpvi7oeGxVX8jTtgrAtpIN9JT+6cvmGye
 CHBD5Fu7LUmYzGiiRN5N9j301e1oTsHB8c05uYaO+BWNEzGkGigFitE8o1Tf3fRZCPML
 0Q/BB5a4ouvgquRIn/tvN5z9cPXZ94TnRP/fz79lG47A1zctnvY+2FyqeNqlN6KGjUrU
 tARE0xTJQSTsSISw0SHY/kxRbg4npf4snCEZUhlU/tGahFgAfWoHHcP2iJW+61QMKhdq
 qkwlZIHMoNw7D0j3iGqpTa2i8PA/T7AXn0q2XhKVQ9EKle1No3YthgTngaN0aZurumAJ
 6UXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAXPAVeIONGlBVGldHBOClNGLnNh4clrALALh5fiSsLiuCNJ5Ug8TjvqWvprkR9MinMnHhK6AhyXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypNvCR3uyDcQ9KONYqUSyPLDeP3grWSP1ugQ0ByGu1dnsOzc3B
 EfhSD1yD7ffD6wKqhLHsZSCtyCW+KQRlh8kbupZsWnUQ0S0ofV1cqFEH6LThwmivqUjChjjL8S2
 Lid4i32LW3c1imIY7HYK5E9jqZbA8zBJcWnmkkg==
X-Gm-Gg: ASbGnctxVfouKaGNCZOVMDI7F2+lsXXEbcVAY07Vv3c/G7hcTEWymftJrwpJR3rlNYQ
 MEYM+2r0j23NBfquBCLIvWbRYEZz8wusKWE0=
X-Google-Smtp-Source: AGHT+IEW2VF4sm13ZcBZ8NQVIt7GKcHDw/1VD5n63JkkOhkCWojqa6SwsmVYpNbpZLaMqmNOL8rkBU6l4P8Dhojf1F0=
X-Received: by 2002:ac8:7dd3:0:b0:467:8526:f280 with SMTP id
 d75a77b69052e-46908e785f1mr41679031cf.41.1734532395856; Wed, 18 Dec 2024
 06:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20241213184705.317138-1-eric.smith@collabora.com>
In-Reply-To: <20241213184705.317138-1-eric.smith@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 18 Dec 2024 14:33:04 +0000
Message-ID: <CAPj87rMT-YsUj2gyfoCUFUPx0BWxAhcz8LgvAhco0-JzhKeXxQ@mail.gmail.com>
Subject: Re: [PATCH] drm: add modifiers for MediaTek tiled formats
To: eric.smith@collabora.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi Eric,

On Fri, 13 Dec 2024 at 18:47, <eric.smith@collabora.com> wrote:
> MediaTek (MTK) uses some unique tiled memory formats
> for video decoding. Add these to the uapi drm_fourcc.h
> so that we can use them in Mesa, GStreamer, and other
> tools/libraries.

Thanks for pushing these upstream!

> +/* MediaTek layouts */
> +
> +/*
> + * MediaTek Tiled Modifier
> + * This is a tiled layout using tiles of 16x32 pixels in a row-major layout.
> + * For chroma planes this becomes 16x16 tiles.
> + */
> +#define DRM_FORMAT_MOD_MTK_16L_32S_TILE  fourcc_mod_code(MTK, (1ULL << 0))

I think this probably wants to be something like the tiling mode
defined in AMD/Arm modifiers, i.e. reserve a few bits in the range to
select the tile size, rather than using a single bit here.

> +/*
> + * MediaTek Compressed Modifier
> + * Indicates the planes are compressed.
> + * Implementation may be platform and base-format specific.
> + */
> +#define DRM_FORMAT_MOD_MTK_COMPRESSED  fourcc_mod_code(MTK, (1ULL << 1))

Ditto for compression.

> +/*
> + * MediaTek 10-bit Modifier
> + * Indicates that the 2 LSBs of the 10 bit pixels are stored
> + * separately and tiled.
> + */
> +#define DRM_FORMAT_MOD_MTK_LSBTILED    fourcc_mod_code(MTK, (1ULL << 2))
> +
> +/*
> + * MediaTek 10-bit Modifier
> + * Indicates that the 2 LSBs of 10 bit pixels are stored
> + * separately in raster order.
> + */
> +#define DRM_FORMAT_MOD_MTK_LSBRASTER   fourcc_mod_code(MTK, (1ULL << 3))

Ditto for 10bpc packing.

So this would ultimately look something like:
mod = (DRM_FORMAT_MOD_MTK_TILE_SIZE(16L32S) |
DRM_FORMAT_MOD_MTK_COMPRESSION(V1) |
DRM_FORMAT_MOD_MTK_10BPC_PACK(RASTER))

Cheers,
Daniel
