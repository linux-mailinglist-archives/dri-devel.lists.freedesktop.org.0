Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F16DD560
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DD710E4E5;
	Tue, 11 Apr 2023 08:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CB810E4E5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:26:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id q5so3987781wmo.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681201590; x=1683793590;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=T2lPXKJbj1gOdKUQSI0raAvBDZgbuEz3CuHg5A0q854=;
 b=GNQ+eU/Gplw59qh8MOKQ+Sd0Nh68rFXe/gBl2WngTdlIeiS6CGDZ8LFIE1ivQmZPgX
 AmwwRII6L4CHkH7aQw36LzN0yWAfcyo4bERHAC0XxC8+155QjTAqS6ClgcOF4kiF+Xj1
 liDS6MOBDEFEcCtjF/ABa+UipjcNLaeFzXW5xQzjA0euanRizTcELJYSUVJN/jn50Gyi
 h7PDRjbtnTzLFUPxq5mpcgyAc1XGpKZqvpqvm59nMKnzNOQUnGtVxpCJ9mSJv0OmQgqG
 YsjKQAKBOj48WCATbrCp8Ty6Nm4FLGJchl4emYTAUhtTpVGACZkzM2zGGQIHnrLt3mNR
 BJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681201590; x=1683793590;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T2lPXKJbj1gOdKUQSI0raAvBDZgbuEz3CuHg5A0q854=;
 b=Wms/Pdoc/uUYrqPpBjWX04pwGtrZj/Mp8ulhp39fq+SrHqwsqVrqJ4e0fsZve3EMbp
 izP+p+klL29jfhBi/chd5wdnnNFsrCN/YF20Zyjto6AbtTaLnl5+ePIlGHpG+lp6aWEj
 4II6a1oJNTl88eUP1suCFbY1z6FdDzJZmlLvh7Deh08UaN6ZLiefW1wMpUxf3pJBoVtv
 n/ioGDVQxeH8uivansukDLpluVO70c7CBHRajVA7WzqX8IxZfNJmz95WIsA5xINmRWeG
 7aU92pDEwo0WwE6ZLA1cqP2Fl7wb1Yzxj67OTJLrvaeoSFQJmhtUuH9pTprUK51Wdw63
 IKyg==
X-Gm-Message-State: AAQBX9cVi1voCe7l2CCLKmrtcf9CyuOBDY4Khz504RBdsgdEAi/iSrIh
 E+Sp6qcClLMP6UVsjSnEh78=
X-Google-Smtp-Source: AKy350Y+rmcfbwhQ0jNjSuuWfWfCcYmdMv5e4TlRIv7zyyjHwxfb9z/QM/N5EhrEf6WpUUd0WKMf+Q==
X-Received: by 2002:a1c:7407:0:b0:3ee:5d1d:6c2d with SMTP id
 p7-20020a1c7407000000b003ee5d1d6c2dmr8784586wmc.35.1681201589916; 
 Tue, 11 Apr 2023 01:26:29 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b003dd1bd0b915sm19784816wmc.22.2023.04.11.01.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 01:26:29 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:26:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH] drm/vkms: add module parameter to set background color
Message-ID: <2d60f63e-f29c-44cf-8f5b-bb3cd98d0094@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406172002.124456-1-mcanal@igalia.com>
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
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, lkp@intel.com,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maíra,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-vkms-add-module-parameter-to-set-background-color/20230407-012233
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230406172002.124456-1-mcanal%40igalia.com
patch subject: [PATCH] drm/vkms: add module parameter to set background color
config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230408/202304082018.PXAwWhse-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304082018.PXAwWhse-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vkms/vkms_composer.c:93 blend() warn: right shifting more than type allows 32 vs 32

vim +93 drivers/gpu/drm/vkms/vkms_composer.c

d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   82  static void blend(struct vkms_device *vkms_dev,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   83  		  struct vkms_writeback_job *wb,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   84  		  struct vkms_crtc_state *crtc_state,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   85  		  u32 *crc32, struct line_buffer *stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   86  		  struct line_buffer *output_buffer, size_t row_size)
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   87  {
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   88  	struct vkms_plane_state **plane = crtc_state->active_planes;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   89  	u32 n_active_planes = crtc_state->num_active_planes;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   90  
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   91  	const struct pixel_argb_u16 background_color = {
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   92  		.a =  0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  @93  		.r = (*vkms_dev->config->background_color >> 32) & 0xffff,
                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This shift always results in zero.

d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   94  		.g = (*vkms_dev->config->background_color >> 16) & 0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   95  		.b = *vkms_dev->config->background_color & 0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   96  	};
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   97  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   98  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   99  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  100  	for (size_t y = 0; y < crtc_y_limit; y++) {
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  101  		fill_background(&background_color, output_buffer);
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  102  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  103  		/* The active planes are composed associatively in z-order. */
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  104  		for (size_t i = 0; i < n_active_planes; i++) {
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  105  			if (!check_y_limit(plane[i]->frame_info, y))
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  106  				continue;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  107  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  108  			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  109  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  110  					    output_buffer);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  111  		}
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  112  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  113  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  114  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  115  		if (wb)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  116  			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  117  	}
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  118  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

