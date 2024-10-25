Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F889B05EA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 16:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689F10E2B8;
	Fri, 25 Oct 2024 14:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lF7+sW2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD56310E2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 14:34:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4314c452180so21969105e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729866880; x=1730471680; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D2Yr8EEmNPRUroD+TTomt6XCtgwDN7DROHjTn3fuIzE=;
 b=lF7+sW2Pu8PgvDo3vCvV1mo7T68XLmKPPpWlcy+U7Q/UFhrIwIS4FvkTRbtyCt6wrS
 w5uz32+fFAR/6fLDNtiVR4q9lEB5b+Ps26zeJDR3Loy/9/ICMr76F3FPoukoLNZOQ4Xz
 FCnAs7Saju3FZBJ8wQSfY7TYhx+FiyaD2+4lixclIXa10o9w7HlOsyUhSNt+XpCACr5i
 6SeVLUxw1pm79ej+p5C7mxpsZj4bTFxwxq/tFvsW4pikaGSkPipVkx4lEfq/+1Xx2VJJ
 XbH418YHfYPcEPegdFANFpAZh1H3Rv42k6aIOCY4pXV7Y+/XW+OeDYvXHX+7dlthDUM4
 eBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729866880; x=1730471680;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2Yr8EEmNPRUroD+TTomt6XCtgwDN7DROHjTn3fuIzE=;
 b=fUIEz0vvPeOm5h8rJDYQhW2v8sgSnjkbnlEFJB8ZjzX3akPlVqI8FnZt7VjGsBPHTy
 nQPx+FeDpI+P0V4VfLcv6ffB00uKIutfwA4VdWlQ2blbcnKMzWykeYrDH1o9g0RhM650
 cnZ9vVKclIm+Jbj7mAabSN20iyTb6JJ0nSkx2DfdHxpBZwlVsTKxLa4kmEWlWm02QrAC
 XDhmy0AwtvbZ/qZXTN+zkdkLEyedLIiQpvD0TKWbnXciud7BH497Lk2lZV14EZSe2zSK
 WatRjtW3CzWedcqsSn8kitIbczbgjlUQeETtrlOAfA60CdItjLW2ZaVuwu2WDFXYBWDZ
 TsHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoqaiciuyCFd9Oka1A66KxDF8dvrtj736yuGE2NX4Kd6eT6mKN5v0ht+ItWB4Dl7Zku0Sf19T0/1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3yUoK15PJ2M4+/YVrj2MBmsgcuIK1M3uvpjPZQVftBmo5ccqD
 q+WlKo3wWX/V4IYneRcE+RV15MFhxi+Z9CIgDgyyK8uLHvcA8JbwGxr0MLfEhR4=
X-Google-Smtp-Source: AGHT+IHQ51cd+qtz6SSuTLjdY9C0RA4c2ssPpUrMmivHkZkhJ9GaBbiBnAO01CUGDbjejVQB64JqHg==
X-Received: by 2002:a05:600c:3b9e:b0:42f:84ec:3e0 with SMTP id
 5b1f17b1804b1-4318b5b301bmr49162895e9.9.1729866879999; 
 Fri, 25 Oct 2024 07:34:39 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b56ef06sm49777565e9.30.2024.10.25.07.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 07:34:39 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:34:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
 Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
Message-ID: <47f88a3d-52e5-4645-8a29-880123d58b57@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023124411.1153552-3-r.czerwinski@pengutronix.de>
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

Hi Rouven,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/dt-bindings-display-panel-add-YAML-schema-for-LXD-M9189A/20241023-204826
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241023124411.1153552-3-r.czerwinski%40pengutronix.de
patch subject: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
config: nios2-randconfig-r072-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252201.QglvauIC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410252201.QglvauIC-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-lxd-m9189a.c:193 ek79007ad3_probe() error: uninitialized symbol 'ret'.

vim +/ret +193 drivers/gpu/drm/panel/panel-lxd-m9189a.c

a69b961abc36b3 Rouven Czerwinski 2024-10-23  181  static int ek79007ad3_probe(struct mipi_dsi_device *dsi)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  182  {
a69b961abc36b3 Rouven Czerwinski 2024-10-23  183  	struct device *dev = &dsi->dev;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  184  	struct ek79007ad3_panel *ctx;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  185  	int ret;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  186  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  187  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  188  	if (!ctx)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  189  		return -ENOMEM;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  190  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  191  	ctx->supply = devm_regulator_get(dev, "vdd");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  192  	if (IS_ERR(ctx->supply))
a69b961abc36b3 Rouven Czerwinski 2024-10-23 @193  		return dev_err_probe(dev, ret, "Failed to get regulator\n");

s/ret/PTR_ERR(ctx->supply)/

a69b961abc36b3 Rouven Czerwinski 2024-10-23  194  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  195  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  196  	if (IS_ERR(ctx->reset_gpio))
a69b961abc36b3 Rouven Czerwinski 2024-10-23  197  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
a69b961abc36b3 Rouven Czerwinski 2024-10-23  198  				     "Failed to get reset-gpios\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  199  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  200  	ctx->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  201  	if (IS_ERR(ctx->standby_gpio))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

