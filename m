Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E0658B57
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 11:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A529E10E1EF;
	Thu, 29 Dec 2022 09:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA44E10E1EF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 09:59:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z10so16948585wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 01:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bn4HntsaKLTQdip7AHyQp+cV/Iqbq4A7mjOLHD/cq3A=;
 b=oNoV6KZk4xfXVsu7aVrk5wo+peEUiy1BbGBKo3lLCOD0E8yhWOESElxxmbxXRn2gZq
 o7HCMd72yLUzNqVSkmedEdhlu7ljV0gjwzdMlVygRedtHlTnXt8m7g3OGVEZGHX8pD9n
 jyBXCXOIPUxwxgPEDxA3TrLgHBrQ1SKWmwrWhUFjK5Qn74vnHGeBAKMA6l7VI0EVIgME
 /hrsTPL6CAUI9+mBtDCx+/2j7WGoIuXCV2v7XBZCT5d3N0PGe0xnAHcS8TmkuVjm4gVs
 Ben8ZnupFVqEfaLUos0aiKcMZfc6jZvtBX3W8gL4eTaoAspNE6RZyG45zSBZl7GWpJkU
 7cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bn4HntsaKLTQdip7AHyQp+cV/Iqbq4A7mjOLHD/cq3A=;
 b=wK9VA+v+PQms5pAn98A6wuIXkD6Cx2VrA9RrKD5zg+OUQT1W6SnHP5P8fK54JLbOhu
 jIxpj4i/RcnI1I6oB5qKB3rN/dxTNXnH+VihAeTbCPFpQGHKYZGw+vWxxGBOz+AT9zzF
 OzJiJrtv+91V3Xari4QolE0WiXTTXBcIX3AwwzVcfWCRlGGxi370Z9HgHtg9BsEysH37
 5HNBePCfFteQIsDaXDSvAJUuu/hZ8Ot07YhyyS2oCegHNxhTd+MXTcC6CY9T5/n6BD+m
 j3AHiW6zXVlm9e2a+WhkK4pjzzOYDtB+kFfa5R7F3AN+gKmsSQnlyvwWpDj5ZJANkM0I
 adhQ==
X-Gm-Message-State: AFqh2kpioYvW9dd9Cxy/Mogpo8uVI2RK9YGqx3W6TNBtsTLJPsxxrd3z
 ReXkmwXXOMCEkYJhrxyp9IQ=
X-Google-Smtp-Source: AMrXdXtLjgq2koux/A/k/d40m6+3n6ZO4eR8ZysvKNvlrc/Vyf3qeNRIG8+dUsh3OPw6Z5m501IOkg==
X-Received: by 2002:a5d:6910:0:b0:26d:a458:d126 with SMTP id
 t16-20020a5d6910000000b0026da458d126mr15698071wru.22.1672307973114; 
 Thu, 29 Dec 2022 01:59:33 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfee4e000000b002422bc69111sm21174791wro.9.2022.12.29.01.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:59:32 -0800 (PST)
Date: Thu, 29 Dec 2022 12:59:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [drm-misc:drm-misc-next 25/26] drivers/gpu/drm/bridge/panel.c:367
 devm_drm_panel_bridge_add_typed() error: 'bridge' dereferencing possible
 ERR_PTR()
Message-ID: <202212291702.rmA7NAVJ-lkp@intel.com>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, lkp@intel.com,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   941aae3263153cea91cb306cc889951486e16634
commit: 5ea6b17027810ffbdb5bea7d0a2b1d312dd1021c [25/26] drm/panel: Add prepare_prev_first flag to drm_panel
config: nios2-randconfig-m041-20221228
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/bridge/panel.c:367 devm_drm_panel_bridge_add_typed() error: 'bridge' dereferencing possible ERR_PTR()

vim +/bridge +367 drivers/gpu/drm/bridge/panel.c

89958b7cd9555a Laurent Pinchart 2019-09-04  348  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
67022227ffb1f5 Eric Anholt      2017-07-18  349  						   struct drm_panel *panel,
67022227ffb1f5 Eric Anholt      2017-07-18  350  						   u32 connector_type)
67022227ffb1f5 Eric Anholt      2017-07-18  351  {
67022227ffb1f5 Eric Anholt      2017-07-18  352  	struct drm_bridge **ptr, *bridge;
67022227ffb1f5 Eric Anholt      2017-07-18  353  
67022227ffb1f5 Eric Anholt      2017-07-18  354  	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
67022227ffb1f5 Eric Anholt      2017-07-18  355  			   GFP_KERNEL);
67022227ffb1f5 Eric Anholt      2017-07-18  356  	if (!ptr)
67022227ffb1f5 Eric Anholt      2017-07-18  357  		return ERR_PTR(-ENOMEM);
67022227ffb1f5 Eric Anholt      2017-07-18  358  
89958b7cd9555a Laurent Pinchart 2019-09-04  359  	bridge = drm_panel_bridge_add_typed(panel, connector_type);
67022227ffb1f5 Eric Anholt      2017-07-18  360  	if (!IS_ERR(bridge)) {
67022227ffb1f5 Eric Anholt      2017-07-18  361  		*ptr = bridge;
67022227ffb1f5 Eric Anholt      2017-07-18  362  		devres_add(dev, ptr);
67022227ffb1f5 Eric Anholt      2017-07-18  363  	} else {
67022227ffb1f5 Eric Anholt      2017-07-18  364  		devres_free(ptr);

return -ENOMEM;

67022227ffb1f5 Eric Anholt      2017-07-18  365  	}
67022227ffb1f5 Eric Anholt      2017-07-18  366  
5ea6b17027810f Dave Stevenson   2022-12-05 @367  	bridge->pre_enable_prev_first = panel->prepare_prev_first;
                                                        ^^^^^^^^^^

5ea6b17027810f Dave Stevenson   2022-12-05  368  
67022227ffb1f5 Eric Anholt      2017-07-18  369  	return bridge;
67022227ffb1f5 Eric Anholt      2017-07-18  370  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

