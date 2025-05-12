Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20370AB3CB4
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15CE10E440;
	Mon, 12 May 2025 15:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iz7u7FHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045E10E440
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 15:51:28 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-72ecc30903cso2586267a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747065087; x=1747669887; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=;
 b=Iz7u7FHt3Rg1Mz9icDLT1bj+wR4ER9DavO8EsQcend+neWD3XXF3qmrOcn8LLreJnA
 vqBATAH8UexoWMODHYMIuPR+QfPGC6Fwqd4/0kfmyADrxsm6AOLvTkLg6MSnp9R52UiG
 J/r7FMwuhPa5DyNINSQKayJLvg8b+clB+as8bUZbVjhuALFfzb5MK+Jn16wVx0sE1V42
 +d50F/iaELPuHOpxHJSi6gsAdBEDEyYKow2hDT/IM+Eu3jLKcu53FsFU9Er6ME6Q3fPl
 aF7Y3fTpLzqjDLR+J20wziyQBLsjqqdE/PlZ2JB8dluII5+Kbl2KrWCxg/9929FJs8Sg
 A5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747065087; x=1747669887;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=;
 b=xAlcUke+73kfuLRz1vLjhf48zqSEdTmqNKeJgQQ1W25Ru0zWEhIiFX9+U4eVnmi9wK
 dMGVPyV/MHPwh+WNumPF315AAnA/Wg7W+nSTQiw3zpJfFIwBDAxTByWX1FlZzaahz6+8
 rMWQjKmsyvLb86TiSHldBRX7nNeiPAOfIEwJTLovVdcwOO1hoMNuCAsh3m0o2BS/lKEh
 r2pTmXG17FqhU0OEiB+OKGkLnOS2qRyO/OESxMKEY20IB4wWJpVHx14P8Tcltw/uczCk
 eInwqbZ82nO3T3asQ9WGVXW7Flyg27L8xfkirjB5TiL772dL6pJIC1+hRUpDX2CwSTzG
 8XaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyfD9B/ROVXHnYxpOFaZQm8dkXU2oRnUKpUzVNE3PPEdVpzbsFitbFOwRYGGAA+TwmmbRy1mOxO9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpLJad1N0K7lU+UT1ID2g3fOUULNuXMtTAu0lPYrpaxiBmqMrZ
 tZBg1KiTwKj7l5GMTsVhgMyx9eCdxnbtFJKYkgqpi5G9UOxleiJK
X-Gm-Gg: ASbGncuh5LMnSwYT6qOaeF0VGbO0klwhai/Spexcih8cYurggfwHSLJd8JIrVoGAjRu
 b2jtU50Qqshoj+NXPHR5AMMipS7xnNd/DjAM27UNxeuFo4dipQqSMPEI5v1isR64rw10R0Gsyas
 CBBMiZEOWVIB/XgZMmrdRSUEtnUDlhsn3NCQ8eJrvk4sLKkXlz5e3z9GqCBOWuKr9tQ41/lkTAU
 BVvyg4rg6c5IzdB9AqUwvSVq95EljXZcCn5JvkMef+Vp5ccrMX6MX7E4Sb//CDr+BX5YNdiMUHW
 P356b1V44bKnP9cGQO7eLEoQt/XuVhGF7MMjIC+N7XIjnSko20U/Pe8EKjLUmQxVhpJFlw==
X-Google-Smtp-Source: AGHT+IE29HCnAnqJs70fjiVznu2cWndCXxPM0MBn2LaCtm8l99A+94DcdAaY4Wmxo+5EpZLx6ztYiA==
X-Received: by 2002:a05:6830:6f44:b0:72a:45bf:18c2 with SMTP id
 46e09a7af769-732269c4577mr9487337a34.9.1747065087378; 
 Mon, 12 May 2025 08:51:27 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf:25f1:2610:e3fc:c8ec])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732264dd290sm1579539a34.40.2025.05.12.08.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 08:51:27 -0700 (PDT)
Message-ID: <682218ff.050a0220.149fee.dd6e@mx.google.com>
X-Google-Original-Message-ID: <aCIY_ca5PEdgItxE@neuromancer.>
Date: Mon, 12 May 2025 10:51:25 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 00/11] drm: sun4i: add Display Engine 3.3 (DE33)
 support
References: <20250511104042.24249-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
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

On Sun, May 11, 2025 at 10:31:09PM +1200, Ryan Walklin wrote:
> Hi all,
> 
> v10 of this patch series adding support for the Allwinner DE33 display engine. This version is largely based on the previous v8 patch, with Chris's changes to the mixer bindings in particular from v9 to add names for the new register blocks. As discussed, the H616 LCD support patchset (which are largely device-tree now that the clock/reset binding definitions from v9 have been taken as a subset) will be sent separately with the rest of Chris' updates.
> 
> As noted previously the new YUV support in the DE3/DE33 and RCQ/DMA shadowing in the DE33 requires more work and discussion, so that support was removed from v8 and this patch supports RGB output only.
> 
> Regards,
> 
> Ryan

Thank you Ryan, I will just defer to you moving forward to ensure no
further confusion on this series and will help out wherever I can.

-Chris

> 
> Jernej Skrabec (7):
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
> 
> Ryan Walklin (4):
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> 
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
>  .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 +++-
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 +++
>  drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 +++-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
>  11 files changed, 252 insertions(+), 63 deletions(-)
> 
> -- 
> 2.49.0
> 
