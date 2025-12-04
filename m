Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956D5CA2CDC
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 09:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E75C10E1C2;
	Thu,  4 Dec 2025 08:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nTZE1eM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A78D10E1CA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 08:25:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42e2e167067so307533f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 00:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764836751; x=1765441551; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LQ4deDu2Meder/E3u1q2UwJGtT40AuQX8y3SfWXWIf4=;
 b=nTZE1eM/r1p5PONpmdEzlHKBY11iYGVmxSj0tkuynyjEGD2k17FyIbUQkkufFuKXS3
 6Fet5eMiOD602oWmo/dS85W0n/tRINW5fJ5Oezl3MDGdKFeLzuQXt+PNigiS8OJK2MZL
 Y2glCVRxlNM8CG9kdRXgioxERBwDZkx1mLHtyZvGRNZ/C2QrW+4b7X2O3sk3PGaZjcqY
 KCL+LjJBiUP34RrrjuMYGEBM4rCxkQ4Tb5/xb/THpjA65c1flePS4+5946adQw2OYZC0
 8bYQ0pJB+fNCykxSSS6wN0ZVlO5wFYEhQl4dd5dHFCJcsPCUathOVP027GEoXzk4USKL
 B5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764836751; x=1765441551;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ4deDu2Meder/E3u1q2UwJGtT40AuQX8y3SfWXWIf4=;
 b=oEyk8NkwooM4LmbQOxAaJHrHN6pe7F9dwxaAl7OGEunaG6d3u0mxYvUD0lGlN2iuQP
 /FV2ICRuoA1mK3/9spEdWTP2vHp/Q8etbX73YpDQINmHSkrWvMK1wJUtShNjeWUCAlt0
 hg5XpR2a63WkdRnyOv6MfyIX/f8LZjzSLBIL+5+y8WnfiFZoFDIU0ltfj8QoPQx9pIlZ
 mIBR++by4k+UkX60HM4TmG4T6I+M2h0tzVURQiioO5Ud44lVZ4M65mKjoHEEixea3XYl
 ed0ALfFo4ZCnGfPLe7Iu79G6jufd2T/XxHKdCbVRBi2XI6Z2oRjF0LZ2TK919jRSvHd9
 tV/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0t1bT7bNcmGRIj+Adq6ZKvg/l1now8F3rfsgucs2GKC5Gs5XE8Bz3amVZYFeWI/K0g7V6Ha+tQKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3RTlMxH5Nk8eGCmZEDDWElHbs5sgTDdDUMFGOI2WtF2WHPR9/
 RfzBQDFSBpVS9r6XbTw7RfJBQc9IcB1fmHYQ9rJZpiq2lL1gyvehK6u0hrUBuSwAtAY=
X-Gm-Gg: ASbGncuLM5/s/6Z3lhupS10gLkFYtCDZAMKdjb/Yj3850ZN+EdG/7t3wEYdvxdoWRt9
 ScWZaVzgkpuDK8mcFQem8PLS/ovsLteOIYFG5Duh2B6se9fPdm6RSe5iZqG0tI+Feqs48ssMw01
 SK8x7c6ZrqED44i3hFBkViOCb7z00pkv+p9YqwhBdJraEEX5CPlsJrW9ahXLnHSfWl6w7ROEdYo
 FJkyvb+y+RY7PIXatxqMd7IiE3KAvrXbpgwThu0YmSc5em/H2FQBOwk2lYo/5aGsjR/phqFeAFb
 d+GpgR9gE9BiFO0LLZPX3sDJ3aSPHWYmdvkROryxDYxN7IjVGduG47DmSzU1D4ClURWihUm46M/
 hnheKDe9bjvwx3ngP2riOz+vbPEFG/qOlbcroR2fjRJc8aSY8dMN635ugLpviGpY8QxdzEGfrbP
 H6FxqIN4d8aJDa1h7C
X-Google-Smtp-Source: AGHT+IFqPjsWxMKuAwr/tYTZtrbROcoydreYmSrR+FokvUIODLoD32s0/Ejyc9FIKKndz+AO6vzyDQ==
X-Received: by 2002:a05:6000:1889:b0:42b:41dc:1b5d with SMTP id
 ffacd0b85a97d-42f73187286mr5177890f8f.25.1764836750665; 
 Thu, 04 Dec 2025 00:25:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7d2231dfsm1807493f8f.26.2025.12.04.00.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 00:25:49 -0800 (PST)
Date: Thu, 4 Dec 2025 11:25:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, sunpeng.li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com,
 Nicholas.Kazlauskas@amd.com, simona@ffwll.ch, airlied@gmail.com,
 Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
Message-ID: <202512041153.nYks4oYu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201231807.287414-1-sunpeng.li@amd.com>
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

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20251202-072501
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20251201231807.287414-1-sunpeng.li%40amd.com
patch subject: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
config: nios2-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041153.nYks4oYu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512041153.nYks4oYu-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_vblank.c:1527 drm_crtc_vblank_on_config() warn: variable dereferenced before check 'crtc' (see line 1519)

vim +/crtc +1527 drivers/gpu/drm/drm_vblank.c

0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1516  void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1517  			       const struct drm_vblank_crtc_config *config)
3ed4351a83ca05d Simona Vetter 2017-05-31  1518  {
3ed4351a83ca05d Simona Vetter 2017-05-31 @1519  	struct drm_device *dev = crtc->dev;
3ed4351a83ca05d Simona Vetter 2017-05-31  1520  	unsigned int pipe = drm_crtc_index(crtc);
                                                                                           ^^^^
Unchecked dereference.  I'm pretty certain crtc can't be NULL.

d12e36494dc2bf2 Ville Syrjälä 2024-04-08  1521  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
38bd1e412d0aa4b Leo Li        2025-12-01  1522  	int ret;
3ed4351a83ca05d Simona Vetter 2017-05-31  1523  
5a4784f49b2dcff Sam Ravnborg  2020-05-23  1524  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
3ed4351a83ca05d Simona Vetter 2017-05-31  1525  		return;
3ed4351a83ca05d Simona Vetter 2017-05-31  1526  
38bd1e412d0aa4b Leo Li        2025-12-01 @1527  	if (crtc) {
                                                        ^^^^^^^^^^^
So this NULL check is too late, and can be removed.

38bd1e412d0aa4b Leo Li        2025-12-01  1528  		ret = drm_crtc_vblank_prepare(crtc);
38bd1e412d0aa4b Leo Li        2025-12-01  1529  		drm_WARN_ON(dev, ret);
38bd1e412d0aa4b Leo Li        2025-12-01  1530  		if (ret)
38bd1e412d0aa4b Leo Li        2025-12-01  1531  			return;
38bd1e412d0aa4b Leo Li        2025-12-01  1532  	}
38bd1e412d0aa4b Leo Li        2025-12-01  1533  
92cc68e35863c1c Lyude Paul    2020-07-20  1534  	spin_lock_irq(&dev->vbl_lock);
02149a76d32bd8f Sam Ravnborg  2020-05-23  1535  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
3ed4351a83ca05d Simona Vetter 2017-05-31  1536  		    pipe, vblank->enabled, vblank->inmodeset);
3ed4351a83ca05d Simona Vetter 2017-05-31  1537  
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1538  	vblank->config = *config;
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1539  
3ed4351a83ca05d Simona Vetter 2017-05-31  1540  	/* Drop our private "prevent drm_vblank_get" refcount */
3ed4351a83ca05d Simona Vetter 2017-05-31  1541  	if (vblank->inmodeset) {
3ed4351a83ca05d Simona Vetter 2017-05-31  1542  		atomic_dec(&vblank->refcount);
3ed4351a83ca05d Simona Vetter 2017-05-31  1543  		vblank->inmodeset = 0;
3ed4351a83ca05d Simona Vetter 2017-05-31  1544  	}
3ed4351a83ca05d Simona Vetter 2017-05-31  1545  
3ed4351a83ca05d Simona Vetter 2017-05-31  1546  	drm_reset_vblank_timestamp(dev, pipe);
3ed4351a83ca05d Simona Vetter 2017-05-31  1547  
3ed4351a83ca05d Simona Vetter 2017-05-31  1548  	/*
3ed4351a83ca05d Simona Vetter 2017-05-31  1549  	 * re-enable interrupts if there are users left, or the
3ed4351a83ca05d Simona Vetter 2017-05-31  1550  	 * user wishes vblank interrupts to be enabled all the time.
3ed4351a83ca05d Simona Vetter 2017-05-31  1551  	 */
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1552  	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
5a4784f49b2dcff Sam Ravnborg  2020-05-23  1553  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
92cc68e35863c1c Lyude Paul    2020-07-20  1554  	spin_unlock_irq(&dev->vbl_lock);
3ed4351a83ca05d Simona Vetter 2017-05-31  1555  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

