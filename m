Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D065A542A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE4610F58D;
	Mon, 29 Aug 2022 18:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9083C10F58D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LIXwPXe6uDCw8puUWwXJwlt9Qctgfa7237R9Ay9Rr94=; b=lEkiEUddmC83T3gPlX9iC1HPqE
 SNqV0HNvj3WohDUJb3awRux40lCfk6tyQB/y/P0NkxAmJvnLotHmUwjl8aOOgP7Mq2i6NQQK+Qfzy
 aGX/MisxWkzuPdRvBFUrgVFV5Pp5E73ZOuHT2POkj46RBMOqXiYPFKcqFeqYAz83p2JMvS2jO7pEf
 1Nfovc1pcY/rW+YbwdLiXSg03RCMaci4y5cXg2twznwbCvQHEeFLKuqBYsK06/LVq5t3DUgZOvADK
 7zf9RrPQcFL/TgKO86KFtdoAnMH8IPBBc/k4+dp4YbP4PPdWhQGbwwkVcLgx7cXqgK+UELGvisvi2
 nlmQP40g==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=60573)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oSjme-00079u-AJ; Mon, 29 Aug 2022 20:46:52 +0200
Message-ID: <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
Date: Mon, 29 Aug 2022 20:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 01/41] drm/tests: Order Kunit tests in Makefile
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-1-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.08.2022 15.11, skrev Maxime Ripard:
> Since we've recently added a ton of tests, the list starts to be a bit
> 
> of a mess and creates unneeded conflicts.
> 
> 
> 
> Let's order it alphabetically.
> 
> 
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> 
> 

Something has gone wrong with this patchset, there are double line endings.

I looked at the patchwork version and it look all right there so I
figured it might have fixed up the patches, but it failed:

git apply -v --check
/home/pi/tinydrm.gud-gadget/workdirs/tv_norm_gadget/500003.patch
Checking patch drivers/gpu/drm/tests/Makefile...
error: while searching for:
# SPDX-License-Identifier: GPL-2.0?
?
obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o
drm_damage_helper_test.o \?
        drm_cmdline_parser_test.o drm_rect_test.o drm_format_test.o
drm_plane_helper_test.o \?
        drm_dp_mst_helper_test.o drm_framebuffer_test.o drm_buddy_test.o
drm_mm_test.o?

error: patch failed: drivers/gpu/drm/tests/Makefile:1
error: drivers/gpu/drm/tests/Makefile: patch does not apply

ERROR: Failed check apply patch

pi@build-server:~/tinydrm.gud-gadget$ file
workdirs/tv_norm_gadget/500003.patch
workdirs/tv_norm_gadget/500003.patch: unified diff output, ASCII text,
with CRLF, LF line terminators

Noralf.

> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> 
> index 91b70f7d2769..2d9f49b62ecb 100644
> 
> --- a/drivers/gpu/drm/tests/Makefile
> 
> +++ b/drivers/gpu/drm/tests/Makefile
> 
> @@ -1,5 +1,13 @@
> 
>  # SPDX-License-Identifier: GPL-2.0
> 
>  
> 
> -obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o drm_damage_helper_test.o \
> 
> -	drm_cmdline_parser_test.o drm_rect_test.o drm_format_test.o drm_plane_helper_test.o \
> 
> -	drm_dp_mst_helper_test.o drm_framebuffer_test.o drm_buddy_test.o drm_mm_test.o
> 
> +obj-$(CONFIG_DRM_KUNIT_TEST) += \
> 
> +	drm_buddy_test.o \
> 
> +	drm_cmdline_parser_test.o \
> 
> +	drm_damage_helper_test.o \
> 
> +	drm_dp_mst_helper_test.o \
> 
> +	drm_format_helper_test.o \
> 
> +	drm_format_test.o \
> 
> +	drm_framebuffer_test.o \
> 
> +	drm_mm_test.o \
> 
> +	drm_plane_helper_test.o \
> 
> +	drm_rect_test.o
> 
> 
> 
