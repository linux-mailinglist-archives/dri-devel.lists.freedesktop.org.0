Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF38B337E1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 09:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7D310E3DA;
	Mon, 25 Aug 2025 07:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="te/YdRrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDC910E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:35:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45a1b0d224dso20069995e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756107322; x=1756712122; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
 b=te/YdRrSb+O5SYOIb37mwsHmO/WbzZm1DFfa+TulEKtkK04Ybt1ybvWv8Xyrb/fgA8
 GWoBT96GDfFpkS3kVfoN9bhUiEAYscKT4fa3WMClpy1j7V2EkhY/GKQ+vwiszOQgvBjf
 cDpTXd3M6zTNVbNRSlGfid/ChqiXiQm6KMGQ7KqsxYWkqlzHawumXlZBrcaYHNiGeWuw
 tCg8mLsrgoPIEcffhumCoPkSThFjf2L1HDxO8+IKGkL7SYu7KfaTURlJtzpbQp16Q96m
 89q04nIItqgu83eD0VAZfxhGspbkqCvwn9nQl6UEpXbUF1Cw0zcdjR9e6Nv3ca+JRTGH
 nP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756107322; x=1756712122;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
 b=FoVgYi8cqTX4QCWFhQnm0GLiNWlELmg1G1HM7cG6KgS1TibOdztqsNHWOK7g5ppOJz
 WCTHUP0zvt+V9sDnRElTot9PPMvBZ4iltuU+pohFGjgZzTUVJ+zXKb64LyUeB1WwnecI
 OIQwK9+RFQtnDROTAut6OJew/VeHJUz/dyACS2JScCdHXpX5mk6Bkv4gXFtMCO49Qz+U
 yKP4B+iwOj4bAC3c9xhOuMEzKSylP3PWT6vAvxfSOVmzT4jsaH7nKf+o7AtgSgMeoKkc
 O3G0Sdbu7icG2lxmQ+IUkTmmNnFb1Rdku550NIDsWl+SZB356Vm5i3jFXPaPy/oamyD4
 Fv6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJVOhrGyo5QwJl/PlUp4OdlnuSL+RLl01adBNoahseIU8stL88UPiP6E+hTKq7I5SJMxwUKeQTuXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfx+KxtmU6eHrsiRoY2DiGgJbXx9C7yp754KrZbjsy8aYUJGg3
 o7T+0Sg9qf4JuzGr/RfosLXhkVaZj5ClXOYGcWMVA+qD2fqzxm1KqxKvP04MfQ2qFTY=
X-Gm-Gg: ASbGncvjExqnIgCX1LGfbEQTDddCC/b/IT3f5qWl4PgGIln4PAspOhHsn3qJY+KHvYa
 cgio6eWAcVp19kDDnCV5VU/05TRK0f6sQWHSAVvuWdqQf7x1S7DZX9VMe5sPLGMYUfUMYkUk8W2
 b3aXPrjvsMI8nWCrkR+qYmeSSCTsF3ogXj/1wsLVuDMKCfb7iUr+LUqLr498MQ7D40GXxCA3Enk
 84rtRUyOI+dMcuYWBMas/evC1B0+9xDWEcgKpMP4C11vI3ACADMwRaTDTd1wP0v4EH84oDwFtyB
 K/Lpf16eFygPvgdGMkrusN4IOISwP4f74OIdUb5rFi5si3JEvmqVqM61QRtSAT4fsh5f08wFQSd
 t5/e35ZIJhD2GgWaA5Q+JzOVRaks=
X-Google-Smtp-Source: AGHT+IErURa0Xlnp2EqAvu9MT0KYK+YicwHUY5MOLIbTG3b7xCaO3SGy7MLRfklR+AK/4jewEFfrgw==
X-Received: by 2002:a05:600c:3155:b0:456:21d2:c6f7 with SMTP id
 5b1f17b1804b1-45b517b99ecmr101326305e9.23.1756107321591; 
 Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b5748e743sm99362065e9.17.2025.08.25.00.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: ltdc: unify log system
Message-ID: <202508250637.nLxtkS26-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821130356.883553-1-raphael.gallais-pou@foss.st.com>
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

Hi Raphael,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/drm-stm-ltdc-unify-log-system/20250821-210930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou%40foss.st.com
patch subject: [PATCH] drm/stm: ltdc: unify log system
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250637.nLxtkS26-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508250637.nLxtkS26-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1150 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1148)
drivers/gpu/drm/stm/ltdc.c:1174 ltdc_crtc_verify_crc_source() warn: variable dereferenced before check 'crtc' (see line 1172)

vim +/crtc +1150 drivers/gpu/drm/stm/ltdc.c

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1143  static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1144  {
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1145  	struct ltdc_device *ldev;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1146  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1147  
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1148  	drm_dbg_driver(crtc->dev, "\n");
                                                                       ^^^^^^^^^
Dereference.  A lot of the time people would suggest to delete these
types of printks and use ftrace instead.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1149  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1150  	if (!crtc)
                                                            ^^^^^
Checked too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1151  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1152  
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1153  	ldev = crtc_to_ltdc(crtc);
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1154  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1155  	if (source && strcmp(source, "auto") == 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1156  		ldev->crc_active = true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1157  		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1158  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1159  		ldev->crc_active = false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1160  		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1161  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1162  		ret = -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1163  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1164  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1165  	ldev->crc_skip_count = 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1166  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1167  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1168  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1169  static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1170  				       const char *source, size_t *values_cnt)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1171  {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1172  	drm_dbg_driver(crtc->dev, "\n");
                                                                        ^^^^^^^^
Dereference

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1173  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1174  	if (!crtc)
                                                            ^^^^^
Too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1175  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1176  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1177  	if (source && strcmp(source, "auto") != 0) {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21  1178  		drm_dbg_driver(crtc->dev, "Unknown CRC source %s for %s\n",
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1179  			       source, crtc->name);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1180  		return -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1181  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1182  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1183  	*values_cnt = 1;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1184  	return 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1185  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

