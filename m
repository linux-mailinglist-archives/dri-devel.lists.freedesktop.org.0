Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F81775495
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 09:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344D510E25B;
	Wed,  9 Aug 2023 07:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3610E25B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 07:58:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso55240715e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691567917; x=1692172717;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMK/MF4QoWmTRy/7r0rvm+M3cYZZiIVGcbwV1xMbPtA=;
 b=Vc8dhEQ337HqN7x0eJ4phDB03/f2AB2NN5lkvQCHkvLd/y/o1qMKmve35y1fmkXnXj
 6XCOWfZ7W+iBw3WdwemShbMpzo8oJieUXB+gC2lWNvEDwQUdMjEYlSBIO8ElbkEi4yYS
 /3QMcjzkMS0z0v6FiVnVRVgyGp1bABtgpk0w6YHK9sqMNZ8oeFq21hnd4y2ALjEeeuvG
 fGsN9vHSFOPPE8hjRAiAd2wFRiSXxvlpEYC/vBqhsE3CWM4ImAqIFD8oLK8x2UTFcxc6
 FfMMSxwVsNLY7rnIlSbXJiZqiKXEFl1RnlBwnXKKgeMtPVYpqanYqRJLTcNzWV+i+PUd
 efrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691567917; x=1692172717;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMK/MF4QoWmTRy/7r0rvm+M3cYZZiIVGcbwV1xMbPtA=;
 b=L9aKRliNjlTR66JGyNBsij3nFYBoIbaX7JzaWeWiCjE4wuvEOh5AwDL+oF7xxRCQvr
 CujkmeG0bjSRfSpD3LW9KzWhnJ0bQ51mWEd2qpFTJNtIkPJ8JTV/IxYcU3hpR6ABl3Or
 4q14ltjwRCPgnJNdMqh5tGL+M1WgnsyKAmsgi/NOdi35MOAYsicv5UiPq4Wx8vQeLQ6i
 EMpuhvmhJj/S/OalBdhy9q3AEvZHXWLxWmplRmSkFPqT9A9AMeNMKjIl66jlaKQlLZKL
 PdUUiTENxtdt41A9IfdNzE3bvadtB8OQsS6SDNnu02jrIJRlyadzG/u0AAbW350QAOgE
 kpYQ==
X-Gm-Message-State: AOJu0YyHqxZ+x7TNdgF41AtaU6KCFVoNyPaTFcto8+6qB19vsLTtuRS3
 uBwxDN3tY8SGFaWQ7CgO+k9Ehw==
X-Google-Smtp-Source: AGHT+IH6Gfg0Ox1ijcaH3Yo/doK/gmTY3rCMIO8FuqulZi8laqcGMrnU8wQH8fU1K7v2TXfqSmiz6Q==
X-Received: by 2002:a05:600c:205a:b0:3fb:d1db:5454 with SMTP id
 p26-20020a05600c205a00b003fbd1db5454mr1563638wmg.35.1691567917371; 
 Wed, 09 Aug 2023 00:58:37 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q12-20020a7bce8c000000b003fe26244858sm1136784wmj.46.2023.08.09.00.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 00:58:36 -0700 (PDT)
Date: Wed, 9 Aug 2023 10:58:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Message-ID: <79f07f7d-1de0-4a48-961e-30b6789e3b6b@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
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
Cc: lkp@intel.com, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230802-091932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802011845.4176631-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 1/3] drm/display: add transparent bridge helper
config: x86_64-randconfig-m001-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090559.RMlH2Dl6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090559.RMlH2Dl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308090559.RMlH2Dl6-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_simple_bridge.c:41 drm_simple_bridge_register() warn: possible memory leak of 'adev'

vim +/adev +41 drivers/gpu/drm/display/drm_simple_bridge.c

abf701043719cd Dmitry Baryshkov 2023-08-02  30  int drm_simple_bridge_register(struct device *parent)
abf701043719cd Dmitry Baryshkov 2023-08-02  31  {
abf701043719cd Dmitry Baryshkov 2023-08-02  32  	struct auxiliary_device *adev;
abf701043719cd Dmitry Baryshkov 2023-08-02  33  	int ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  34  
abf701043719cd Dmitry Baryshkov 2023-08-02  35  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
abf701043719cd Dmitry Baryshkov 2023-08-02  36  	if (!adev)
abf701043719cd Dmitry Baryshkov 2023-08-02  37  		return -ENOMEM;
abf701043719cd Dmitry Baryshkov 2023-08-02  38  
abf701043719cd Dmitry Baryshkov 2023-08-02  39  	ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
abf701043719cd Dmitry Baryshkov 2023-08-02  40  	if (ret < 0)
abf701043719cd Dmitry Baryshkov 2023-08-02 @41  		return ret;

kfree(adev);

abf701043719cd Dmitry Baryshkov 2023-08-02  42  
abf701043719cd Dmitry Baryshkov 2023-08-02  43  	adev->id = ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  44  	adev->name = "simple_bridge";
abf701043719cd Dmitry Baryshkov 2023-08-02  45  	adev->dev.parent = parent;
abf701043719cd Dmitry Baryshkov 2023-08-02  46  	adev->dev.of_node = parent->of_node;
abf701043719cd Dmitry Baryshkov 2023-08-02  47  	adev->dev.release = drm_simple_bridge_release;
abf701043719cd Dmitry Baryshkov 2023-08-02  48  
abf701043719cd Dmitry Baryshkov 2023-08-02  49  	ret = auxiliary_device_init(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  50  	if (ret) {
abf701043719cd Dmitry Baryshkov 2023-08-02  51  		kfree(adev);

This needs to ida_free(&simple_bridge_ida, adev->id) as well.  There is
a smatch check for this (check_unwind.c) but I guess I plan to re-write
it a bit before I turn that on.

abf701043719cd Dmitry Baryshkov 2023-08-02  52  		return ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  53  	}
abf701043719cd Dmitry Baryshkov 2023-08-02  54  
abf701043719cd Dmitry Baryshkov 2023-08-02  55  	ret = auxiliary_device_add(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  56  	if (ret) {
abf701043719cd Dmitry Baryshkov 2023-08-02  57  		auxiliary_device_uninit(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  58  		return ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  59  	}
abf701043719cd Dmitry Baryshkov 2023-08-02  60  
abf701043719cd Dmitry Baryshkov 2023-08-02  61  	return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  62  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

