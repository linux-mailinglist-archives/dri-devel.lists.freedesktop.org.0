Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6B985561
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 10:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE4810E7B1;
	Wed, 25 Sep 2024 08:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pmDHUe1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB3F10E7B1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:23:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so4574029f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727252590; x=1727857390; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wzg7D4oKky5+3kPOwN3vVZTGu28S/XV+QD50k2fkJd8=;
 b=pmDHUe1P/u4egw2V21IhKZnRu9CwIQPeD9eWoLAAfMcF0Ft4Lcg0D9MaWvQ33OOMP9
 7tajj1GuqZoAnnne/vsPm50IxuqTOmSY2wP1v7q8ZqVWs4ZcTXrVM4Zk5/9EVC4IhHGk
 xuBbU/x2iI1zM6NRTZDWpKvlbgVZem62M0lgjgGdsK1epCUDO/eSINtpjWNy5zUYLL9T
 t+MtmQNA3KQBs9WSqXFzpsNhoLQQQ87h1H1uDub+RrKHvuDf76mua7t2Om6EGR5gpNYn
 OvB7EAoMbkHdfddZKeXoHfhy9sm6YdvdbXyBL0Dy5QmuU/LhsV8ZtyuEXIkkz4/CusA+
 OGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727252590; x=1727857390;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wzg7D4oKky5+3kPOwN3vVZTGu28S/XV+QD50k2fkJd8=;
 b=J3neqGSNeByD3hWXG8VqyuZ//b/Mwd+L7u6+gKQAz9ZtqS/wkgndJJdiYfUq1tpBe4
 b3zFbREhOS4/kjR845gXuMzdotrNCMIoLwFS0ZwXIJLzGpR/Y3FybQl8z5Ss7jqygt/x
 qJnMh0tvO+0I+IloP5rJR9Ez0mW3n6MZtw2qNjL+Q/dgLCqxi4Cn/E97jbPBamoChr5x
 DPRcs5uf3diAGemTycBcwU1f3hIqbKPf+WK0QS32f+nnIx4Ckx/yfjcPRfU9QPJ5/Q8D
 13gJ4o4C0sE5Q+vSqmrYFULfog9ve+X6KPiOcpvjPu2t9h19LJb8/vTSaASKyOcYY1an
 Y4WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEgX2kukPO+kwYCPTznEM7Tm1hr1sPDmLNu5tNJlojPoHx/cDNbqs0mZMUyfQHIUvIZ/Ml6PwlIfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVUf8yd+y5oXDrz/sPE8Ko8qFwg2DADMLY+rin1csJzmUBc51j
 pGZ2Qqr4qOvbb8DGDjSs8BJxB089knAJ+RAiC5l+K9IoAY/Uu5oGtwancxyUuhY=
X-Google-Smtp-Source: AGHT+IGETHE/X4esE42miSDoeNFaK9g9vbG+kkIWo8WUvpwJ3K+Mdg5qaJEHKAV4EV3TkiFYuWA+mw==
X-Received: by 2002:adf:fa90:0:b0:374:bf1b:1c20 with SMTP id
 ffacd0b85a97d-37cc24760dcmr1190372f8f.23.1727252590318; 
 Wed, 25 Sep 2024 01:23:10 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969ddfc9sm10949145e9.5.2024.09.25.01.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:23:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:23:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ryan Walklin <ryan@testtoast.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
Message-ID: <cfb1d4c6-9414-4880-9edb-31e5af9f951b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-19-ryan@testtoast.com>
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

Hi Ryan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Walklin/drm-sun4i-de2-de3-Change-CSC-argument/20240921-175532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20240921095153.213568-19-ryan%40testtoast.com
patch subject: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230531.ZMb79p9h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409230531.ZMb79p9h-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sun4i/sun50i_afbc.c:236 sun50i_afbc_atomic_update() warn: right shifting more than type allows 16 vs 16

vim +236 drivers/gpu/drm/sun4i/sun50i_afbc.c

757b2767d5472c Jernej Skrabec 2024-09-21  230  
757b2767d5472c Jernej Skrabec 2024-09-21  231  	regmap_write(regs, SUN50I_FBD_OVL_BG_COLOR(base),
757b2767d5472c Jernej Skrabec 2024-09-21  232  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
757b2767d5472c Jernej Skrabec 2024-09-21  233  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR0(base), def_color0);
757b2767d5472c Jernej Skrabec 2024-09-21  234  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR1(base), def_color1);
757b2767d5472c Jernej Skrabec 2024-09-21  235  
757b2767d5472c Jernej Skrabec 2024-09-21 @236  	val = SUN50I_FBD_CTL_GLB_ALPHA(state->alpha >> 16);
                                                                               ^^^^^^^^^^^^^^^^^^
This shifts it to zero

757b2767d5472c Jernej Skrabec 2024-09-21  237  	val |= SUN50I_FBD_CTL_CLK_GATE;
757b2767d5472c Jernej Skrabec 2024-09-21  238  	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
757b2767d5472c Jernej Skrabec 2024-09-21  239  		SUN50I_FBD_CTL_ALPHA_MODE_PIXEL :
757b2767d5472c Jernej Skrabec 2024-09-21  240  		SUN50I_FBD_CTL_ALPHA_MODE_COMBINED;
757b2767d5472c Jernej Skrabec 2024-09-21  241  	val |= SUN50I_FBD_CTL_FBD_EN;
757b2767d5472c Jernej Skrabec 2024-09-21  242  	regmap_write(regs, SUN50I_FBD_CTL(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  243  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

