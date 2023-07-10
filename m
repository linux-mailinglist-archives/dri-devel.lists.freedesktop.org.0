Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D074CCE6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 08:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3993F10E0FE;
	Mon, 10 Jul 2023 06:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB8410E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:29:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3159da54e95so270207f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jul 2023 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688970563; x=1691562563;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OrXPJg8GBlXSU+DbVmnylwEb6LHm7Kdw8/J/gy1bqXs=;
 b=XxFgliT8pqkR5EITYiuflL334XyeUC3C/EyYO/DEwbXmnQ8VGJ9LKOHZknpQKKnYXf
 GCuDthtWRmxFtMvxv/w5wm46gLXcW0JOB6D++dR77j42+5/AIZ4VLDkOqBMbPCVtHJ0P
 wEwDWsC91PHe7dr/JM2qO1/HWAvtJCR2zmJR65/rrNR8HtEUwDHraA6EtCYay6nfjvar
 KsqfgWWnBL2qzshg09DhLuCmJtiKqN4AMrnilLdBcVKZllIMd5kkb1zdKxsPIkmjU0iS
 xR9WufAAkscCJokhSwsb8onElhBACzOguwaGlPu/14uVC6LMnqv4J4yqVgUkTrvqM01H
 P6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688970563; x=1691562563;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OrXPJg8GBlXSU+DbVmnylwEb6LHm7Kdw8/J/gy1bqXs=;
 b=FU6upwKE329q+YNVS/39qzMnBWX9rVBJc19nVORCH7NKxYROvPfYpllNa2nj5UO9iZ
 LlL512gzB+Be4+GGfTH2Fx9pHE1clO7uaEMKFTAa7oKn22GlcLfM+mr2vnqOBOzlAP5g
 kgMUp+pIbNHzAUvhBaDO7We0lBuvmd4V3IGvNI6V1SlBIlhbSHkuLdvcbOzKlHY6YfjY
 O96P7ZwyeRgw0i2ROfFnjFXhRpwpiEEP2qBQCDJ5XQzQk9LE3/j728Y4EHnziqOwf7T8
 swh9z9Xkv8dLF7UjVH8I0eaVLjrz+w8572tYlSzxFcLOmSCwuS+hWD/BPQI9g5z9ETIJ
 64SA==
X-Gm-Message-State: ABy/qLat1QOZIkf/DGrJ8ApKjDlmoX6tP+Rg/wqZSLmuyBTTQehWz5Xt
 SCtuCY5tc8fEPPhyJK2ipP0ZySF41tR5TsjNvMw=
X-Google-Smtp-Source: APBJJlEAzVL/a7fYEBCU9JkNKXEKtwQrlGX8YesTP7Xg4hexC3dxMg0akIma3DKTysx8nxFThJZdLg==
X-Received: by 2002:a05:6000:923:b0:314:10d8:b483 with SMTP id
 cx3-20020a056000092300b0031410d8b483mr10964508wrb.64.1688970562805; 
 Sun, 09 Jul 2023 23:29:22 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f7-20020a5d58e7000000b003142439c7bcsm10754880wrd.80.2023.07.09.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jul 2023 23:29:21 -0700 (PDT)
Date: Mon, 10 Jul 2023 09:29:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [drm-misc:drm-misc-next 2/3] drivers/gpu/drm/loongson/lsdc_plane.c:199
 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before
 check 'state' (see line 180)
Message-ID: <ff8f09e7-d8c3-4b02-ae76-47dbac830cdb@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: lkp@intel.com, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8d1077cf2e43b15fefd76ebec2b71541eb27ef2c
commit: f39db26c54281da6a785259498ca74b5e470476f [2/3] drm: Add kms driver for loongson display controller
config: i386-randconfig-m021-20230710 (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307100423.rV7D05Uq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/loongson/lsdc_plane.c:199 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before check 'state' (see line 180)

vim +/state +199 drivers/gpu/drm/loongson/lsdc_plane.c

f39db26c54281d Sui Jingfeng 2023-06-15  174  static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
f39db26c54281d Sui Jingfeng 2023-06-15  175  						struct drm_atomic_state *state)
f39db26c54281d Sui Jingfeng 2023-06-15  176  {
f39db26c54281d Sui Jingfeng 2023-06-15  177  	struct drm_plane_state *new_state;
f39db26c54281d Sui Jingfeng 2023-06-15  178  	struct drm_crtc_state *crtc_state;
f39db26c54281d Sui Jingfeng 2023-06-15  179  
f39db26c54281d Sui Jingfeng 2023-06-15 @180  	new_state = drm_atomic_get_new_plane_state(state, plane);
                                                                                           ^^^^^
state is dereferenced inside this function

f39db26c54281d Sui Jingfeng 2023-06-15  181  
f39db26c54281d Sui Jingfeng 2023-06-15  182  	if (!plane->state || !plane->state->fb) {
f39db26c54281d Sui Jingfeng 2023-06-15  183  		drm_dbg(plane->dev, "%s: state is NULL\n", plane->name);
f39db26c54281d Sui Jingfeng 2023-06-15  184  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  185  	}
f39db26c54281d Sui Jingfeng 2023-06-15  186  
f39db26c54281d Sui Jingfeng 2023-06-15  187  	if (new_state->crtc_w != new_state->crtc_h) {
f39db26c54281d Sui Jingfeng 2023-06-15  188  		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
f39db26c54281d Sui Jingfeng 2023-06-15  189  			new_state->crtc_w, new_state->crtc_h);
f39db26c54281d Sui Jingfeng 2023-06-15  190  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  191  	}
f39db26c54281d Sui Jingfeng 2023-06-15  192  
f39db26c54281d Sui Jingfeng 2023-06-15  193  	if (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
f39db26c54281d Sui Jingfeng 2023-06-15  194  		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
f39db26c54281d Sui Jingfeng 2023-06-15  195  			new_state->crtc_w, new_state->crtc_h);
f39db26c54281d Sui Jingfeng 2023-06-15  196  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  197  	}
f39db26c54281d Sui Jingfeng 2023-06-15  198  
f39db26c54281d Sui Jingfeng 2023-06-15 @199  	if (state) {
                                                    ^^^^^
Checked too late

f39db26c54281d Sui Jingfeng 2023-06-15  200  		crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
f39db26c54281d Sui Jingfeng 2023-06-15  201  	} else {
f39db26c54281d Sui Jingfeng 2023-06-15  202  		crtc_state = plane->crtc->state;
f39db26c54281d Sui Jingfeng 2023-06-15  203  		drm_dbg(plane->dev, "%s: atomic state is NULL\n", plane->name);
f39db26c54281d Sui Jingfeng 2023-06-15  204  	}
f39db26c54281d Sui Jingfeng 2023-06-15  205  
f39db26c54281d Sui Jingfeng 2023-06-15  206  	if (!crtc_state->active)
f39db26c54281d Sui Jingfeng 2023-06-15  207  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  208  
f39db26c54281d Sui Jingfeng 2023-06-15  209  	if (plane->state->crtc != new_state->crtc ||
f39db26c54281d Sui Jingfeng 2023-06-15  210  	    plane->state->src_w != new_state->src_w ||
f39db26c54281d Sui Jingfeng 2023-06-15  211  	    plane->state->src_h != new_state->src_h ||
f39db26c54281d Sui Jingfeng 2023-06-15  212  	    plane->state->crtc_w != new_state->crtc_w ||
f39db26c54281d Sui Jingfeng 2023-06-15  213  	    plane->state->crtc_h != new_state->crtc_h)
f39db26c54281d Sui Jingfeng 2023-06-15  214  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  215  
f39db26c54281d Sui Jingfeng 2023-06-15  216  	if (new_state->visible != plane->state->visible)
f39db26c54281d Sui Jingfeng 2023-06-15  217  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  218  
f39db26c54281d Sui Jingfeng 2023-06-15  219  	return drm_atomic_helper_check_plane_state(plane->state,
f39db26c54281d Sui Jingfeng 2023-06-15  220  						   crtc_state,
f39db26c54281d Sui Jingfeng 2023-06-15  221  						   DRM_PLANE_NO_SCALING,
f39db26c54281d Sui Jingfeng 2023-06-15  222  						   DRM_PLANE_NO_SCALING,
f39db26c54281d Sui Jingfeng 2023-06-15  223  						   true, true);
f39db26c54281d Sui Jingfeng 2023-06-15  224  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

