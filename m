Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3DC8FAF3B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 11:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2507310E252;
	Tue,  4 Jun 2024 09:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bszSrf44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791B610E252
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 09:48:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a68ca4d6545so457341666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717494511; x=1718099311; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9qMw90qV+DaLaiLTgKDl1x/aOCrXowhTXsL3r0XH3mg=;
 b=bszSrf44rTUsg5JzzbvxqJRFT2HeSvdBU+afLqdOuQLDwrXde58N5AP5X/e1NL6BRi
 bjuBuEVPJhZ98l0YAoVM0DW6s7TPbPhsZuQ2GSW5Jnaz3RbL5T3wHQdgmLdkGF+GHmxN
 s1g7czAGEsunpcSRyIiXG8QaxZtOhBMHmF6zkE0J3J0CM5rnnbd5zV50HWXW8eCDvpjA
 CHmeZR7dgiGS4OMlL7rVak17YhpCwTEwzHw/6JEw9B1rrnLR5hgs5GH/bp2fVlo1mU64
 UVTjGpz8JdAoD5vS8XNKWVvhGAPic/Bzb5Jvxu3wxKNRl9NdATxh6cs1ApjkLmgwbeSt
 8BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717494511; x=1718099311;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qMw90qV+DaLaiLTgKDl1x/aOCrXowhTXsL3r0XH3mg=;
 b=bbkbjVo4iguUZcPFxvpj+xDx8GWpenkUeF1xyiK6u0Uj3/kyt0uqkuSrYOsRpARaZM
 83cWANPTCTjxuuiac9uPgbdjuRe4NCpBa6Xjv+vx81tE3VJpmqGA+5RdRDEhDCSJDnN5
 XeeAQM6Fz8BRzKbYLZm0tMOHCUHw8+VKx3rkyf4OpeIWg5nm3b5kLX6TEOH4VFiTgRZ9
 UFy2mHGH8hjpPlslfANW46cS3GRJebsY6Qnv5uwEls4bjB0VRrDrIolS8H0oE+nfzOXX
 3C7PGb5K8OaITZdgn1YqPRV6YE4heLmpL0ZAokgQO9xQ5E68bMteaR3Npp2YBmvW2gRo
 MQtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3lS/g9/W0yYAmJWwJ4hal/KAVzckz5oq9H+5IM4PUlE/lOCB7wUnrsTLUB2GFXbJgMMKRTcfX8YQjJli50dWf/w3RqBTfVdpmTGybsIAH
X-Gm-Message-State: AOJu0Yzp5B7OHPu0I6GDrHFHS5H9LnBKJurd1FINvxFTeM2STdJEdcYW
 hk5wWEfhRXMIBWaPmUsizxTKSfRzuqZouJgw5g3dY/VG+hnESdt++V/euufjuS4=
X-Google-Smtp-Source: AGHT+IEIpQByHwZPuXZwgtNKBPWh0ShSIP0NDYoquJvLNgTHtNVNVurEQAd2+XginWcAsWfQ77HMsA==
X-Received: by 2002:a17:907:76f7:b0:a68:cf34:c95b with SMTP id
 a640c23a62f3a-a695413e308mr161277866b.7.1717494511206; 
 Tue, 04 Jun 2024 02:48:31 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a35e86c36sm6901038a12.54.2024.06.04.02.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 02:48:30 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:48:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
Message-ID: <916caa58-b044-4594-9a7c-c3ca567bb6f2@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603095343.39588-4-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-only-draw-the-foreground-color-in-drm_panic_blit/20240603-181247
base:   86266829ea755f737762ebda614c59b136c8feac
patch link:    https://lore.kernel.org/r/20240603095343.39588-4-jfalempe%40redhat.com
patch subject: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240604/202406041051.KuVqtZCd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406041051.KuVqtZCd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_panic.c:531 draw_panic_static_kmsg() warn: variable dereferenced before check 'font' (see line 529)

vim +/font +531 drivers/gpu/drm/drm_panic.c

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  519  static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  520  {
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  521  	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  522  	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  523  	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  524  	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  525  	struct kmsg_dump_iter iter;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  526  	char kmsg_buf[512];
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  527  	size_t kmsg_len;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  528  	struct drm_panic_line line;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03 @529  	int yoffset = sb->height - font->height - (sb->height % font->height) / 2;
                                                                                   ^^^^^^^^^^^^                 ^^^^^^^^^^^^
Unchecked dereferences

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  530  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03 @531  	if (!font)
                                                             ^^^^
Checked too late

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  532  		return;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  533  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

