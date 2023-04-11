Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CE6DD624
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04010E50F;
	Tue, 11 Apr 2023 09:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803B10E50F;
 Tue, 11 Apr 2023 09:03:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m8so17779007wmq.5;
 Tue, 11 Apr 2023 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681203825; x=1683795825;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VhbjHS7f684AMrsrL5Er1DA55AW7x3S5l3rSApeJOqk=;
 b=Nu//j/rS3LtN3X2i17tHZhPw8EHilSW+C2VbUpolr9AHWgc1pp8iMooPiN7xqtsD+k
 aI+zn+htnOginSj+ExUxrEyJQHuyW4677GTQuvPjsGPBBCBtTZkxvrDC9FGFcDnDSz8R
 F1h6baNxvTROsUw3nyHNktusiJS6Ef7tVxsSnL/5hXbNLWjwlFG9eKcXBTjIPny+B1XP
 PzYxsrZNvT6sVZ8ZLMo9iGR+LL+nMJMV3aqBH9IIYXy9hhtHHZEIU5Ekn/kSsj9L9umV
 wU2cK3ZRXqoY0vtkUYBIHoxj7BnZ6kA+Xv7/vvcWQwPfcHr6Np1NwpCSsK/5nA8rXQzV
 ZMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681203825; x=1683795825;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VhbjHS7f684AMrsrL5Er1DA55AW7x3S5l3rSApeJOqk=;
 b=bs9pzlz9A1sIPKRujJTk0jUU3/Zr3hRYerEZxFDDBbCJaUFZ58EWjwBp4aP3N4nlAk
 C6aX0ArML1LOxl5TkvmEkCFNVKMnVjKp8UQTi6LeDTua1Qrs8/3mVfCTbelL3btYwglX
 xhxjHJT2eTnwJB9CcDAC4ByEHLQl/Sv7UUCvYR7wmhD50/7i564Y6MUCt5cTwqFHAIM8
 zNPmRQ5gDsDvHubDtvYSdVHGXboIZZw7kiQ/c1l6HgkmXfohXRyckZv1B9ilu2geDuzV
 L6wROHFbmu15Lmxth1JXmolt74K1uBPv4q9IKNmmyTZ+A0aI+/u2C3oAdx5FOYG/YRWR
 7lQA==
X-Gm-Message-State: AAQBX9fZdINjj9bmPYLCVRNTKSfP0C0W/6wBdQwXc3SGDk5V0idjc/WP
 QvDCIEwCq/W9mOB5Mxnhdrs=
X-Google-Smtp-Source: AKy350bgg5RwSlOXMKRI4ovS6rDs7ITa/A3clS+O5rtifEu1hG9ZuyjaxXafENTRSStFwgtTrOIKDA==
X-Received: by 2002:a05:600c:298:b0:3f0:7e02:a159 with SMTP id
 24-20020a05600c029800b003f07e02a159mr8881545wmk.15.1681203824036; 
 Tue, 11 Apr 2023 02:03:44 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003f080b2f9f4sm10959042wmo.27.2023.04.11.02.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 02:03:43 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:03:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for
 reading IOR state
Message-ID: <7d0bca47-db75-4a68-9565-7bdb5995d1e3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407222133.1425969-2-lyude@redhat.com>
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
Cc: lkp@intel.com, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/drm-nouveau-kms-Add-INHERIT-ioctl-to-nvkm-nvif-for-reading-IOR-state/20230408-062329
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230407222133.1425969-2-lyude%40redhat.com
patch subject: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: csky-randconfig-m031-20230409 (https://download.01.org/0day-ci/archive/20230409/202304091929.Sr0CfHlN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304091929.Sr0CfHlN-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/disp.c:2518 nv50_display_read_hw_or_state() error: uninitialized symbol 'head_idx'.

vim +/head_idx +2518 drivers/gpu/drm/nouveau/dispnv50/disp.c

a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2477  static inline void
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2478  nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2479  			      struct nouveau_encoder *outp)
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2480  {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2481  	struct drm_crtc *crtc;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2482  	struct drm_connector_list_iter conn_iter;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2483  	struct drm_connector *conn;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2484  	struct nv50_head_atom *armh;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2485  	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2486  	bool found_conn = false, found_head = false;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2487  	u8 proto;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2488  	int head_idx;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2489  	int ret;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2490  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2491  	switch (outp->dcb->type) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2492  	case DCB_OUTPUT_TMDS:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2493  		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2494  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2495  	case DCB_OUTPUT_DP:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2496  		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2497  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2498  	case DCB_OUTPUT_LVDS:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2499  		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2500  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2501  	case DCB_OUTPUT_ANALOG:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2502  		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2503  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2504  	default:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2505  		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2506  			    outp->base.base.name);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2507  		drm_WARN_ON(dev, true);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2508  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2509  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2510  	if (ret >= 0) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2511  		head_idx = ret;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2512  		ret = 0;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2513  	} else if (ret == -ENODEV) {

What if it fails with a different error code?

a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2514  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2515  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2516  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2517  	drm_for_each_crtc(crtc, dev) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07 @2518  		if (crtc->index != head_idx)
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2519  			continue;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2520  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2521  		armh = nv50_head_atom(crtc->state);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2522  		found_head = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2523  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2524  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2525  	if (drm_WARN_ON(dev, !found_head))
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2526  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2527  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2528  	/* Figure out which connector is being used by this encoder */
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2529  	drm_connector_list_iter_begin(dev, &conn_iter);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2530  	nouveau_for_each_non_mst_connector_iter(conn, &conn_iter) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2531  		if (nouveau_connector(conn)->index == outp->dcb->connector) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2532  			found_conn = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2533  			break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2534  		}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2535  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2536  	drm_connector_list_iter_end(&conn_iter);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2537  	if (drm_WARN_ON(dev, !found_conn))
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2538  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2539  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2540  	armh->state.encoder_mask = encoder_mask;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2541  	armh->state.connector_mask = drm_connector_mask(conn);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2542  	armh->state.active = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2543  	armh->state.enable = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2544  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2545  	outp->crtc = crtc;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2546  	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2547  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2548  	conn->state->crtc = crtc;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2549  	conn->state->best_encoder = &outp->base.base;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2550  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

