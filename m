Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6B898176
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 08:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347EC1129AC;
	Thu,  4 Apr 2024 06:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WvKgk/hC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56411214A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 06:29:55 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso77431866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712212194; x=1712816994; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+UNZae/k2EBcx5FlHf+Q0FilIMtRBcS/dSCMZEDWPas=;
 b=WvKgk/hC6/iLCSmyoMGKmOzPo5BqnL/ZeQH7k9ilq4PgCf60u5xGsnMVCnm6KF+QON
 cQ7A66GDceKN4rPh9rQrEEtiFz0wS3LkzxJYb60yu0ZZEL5GXPjQJcCcfkpJhcu5unTh
 uJBRSgVG6p5lrta/1Xid/98tgjALUKYu+PC0xxLboUwIcZ/x1wrS33tLfoXFidv9dpyW
 JEVs6jSONQCdaJMzRHSe2tnwuC3cbh7iy57AHHXo5ksvF+Y8tK+TXuTai4wL+bRS8G/O
 GtiqGcLic0t7HcbrtoAC4DWpXH9iayGQkUFa7k2hf3QBKcj5x5FMrUVBiZHMz4zsMfD3
 bBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712212194; x=1712816994;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+UNZae/k2EBcx5FlHf+Q0FilIMtRBcS/dSCMZEDWPas=;
 b=NGNE9DfWBoR096yWGxogGufGYIqzSmsluyK2WsAxK0ob8EOP4k8DgQ9UNC/bekcSpO
 1CIoMkfOGqEyMElBay1nSoc9C2wbgANMQez3hjF/ZBAZAuQxCnXeIlWE3YSbo7vkCy9V
 kgN1rcOdNWHAAncO/vSIdZh2/bQUXu9wr92LPHe+khJnhOUEh27CheuQP+17mobl5Kbq
 V8jtAvSJA0lEMbzoi0tEtbRJCwtGRA0tYgPpPuFPygnj80CS+cnKMT4mH3lbqEeisMWs
 hnRMmMSITgR+VLRwDQZLyt8bRf/RhXuzqMkeklohKOmP6ra6xOGMjwcug2SiXrqvbdK3
 IRxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT6TAubVvXLGXazbn5IzcyP1AADlQzXbpn3h9epv7CBnIbhYY+lKrwcrzVOhrkOr3uAt7fZDlH6u1iF+QTiB6QX+O3tpeUW9fjMLYopZmk
X-Gm-Message-State: AOJu0YwhfcO3h66/Xuz//vHfrK37Q51WONl54uSb8ZexSyrY57SgDVQO
 vBB/TQSySjYonhpwO1WY8nBeU/OCUCmGxtqDPOHu5BD3Aib7A1vEWZ1VMr0GNFA=
X-Google-Smtp-Source: AGHT+IEC5kYIEakGdkrA8tGW3LWmI7igo3mAP1KXlZN0cpSOuO8oBoj84PvDyIQH6wZORBgrm+VQOw==
X-Received: by 2002:a17:906:3891:b0:a4e:1035:3ed7 with SMTP id
 q17-20020a170906389100b00a4e10353ed7mr934130ejd.25.1712212193696; 
 Wed, 03 Apr 2024 23:29:53 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 xc4-20020a170907074400b00a4e5ab88803sm5503487ejb.183.2024.04.03.23.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 23:29:53 -0700 (PDT)
Date: Thu, 4 Apr 2024 09:29:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Philipp Stanner <pstanner@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v5 02/10] PCI: Deprecate iomap-table functions
Message-ID: <c59ff5c5-7551-41ca-a5cc-9c214051a20d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080712.13986-5-pstanner@redhat.com>
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

Hi Philipp,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/PCI-Add-new-set-of-devres-functions/20240403-160932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240403080712.13986-5-pstanner%40redhat.com
patch subject: [PATCH v5 02/10] PCI: Deprecate iomap-table functions
config: i386-randconfig-141-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040920.QIxhNeMu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404040920.QIxhNeMu-lkp@intel.com/

smatch warnings:
drivers/pci/devres.c:897 pcim_iomap_regions_request_all() error: we previously assumed 'legacy_iomap_table' could be null (see line 894)

vim +/legacy_iomap_table +897 drivers/pci/devres.c

acc2364fe66106 Philipp Stanner 2024-01-31  865  int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
acc2364fe66106 Philipp Stanner 2024-01-31  866  				   const char *name)
acc2364fe66106 Philipp Stanner 2024-01-31  867  {
34e90b966504f3 Philipp Stanner 2024-04-03  868  	short bar;
34e90b966504f3 Philipp Stanner 2024-04-03  869  	int ret;
34e90b966504f3 Philipp Stanner 2024-04-03  870  	void __iomem **legacy_iomap_table;
acc2364fe66106 Philipp Stanner 2024-01-31  871  
34e90b966504f3 Philipp Stanner 2024-04-03  872  	ret = pcim_request_all_regions(pdev, name);
34e90b966504f3 Philipp Stanner 2024-04-03  873  	if (ret != 0)
34e90b966504f3 Philipp Stanner 2024-04-03  874  		return ret;
acc2364fe66106 Philipp Stanner 2024-01-31  875  
34e90b966504f3 Philipp Stanner 2024-04-03  876  	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
34e90b966504f3 Philipp Stanner 2024-04-03  877  		if (!mask_contains_bar(mask, bar))
34e90b966504f3 Philipp Stanner 2024-04-03  878  			continue;
34e90b966504f3 Philipp Stanner 2024-04-03  879  		if (!pcim_iomap(pdev, bar, 0))
34e90b966504f3 Philipp Stanner 2024-04-03  880  			goto err;
34e90b966504f3 Philipp Stanner 2024-04-03  881  	}
34e90b966504f3 Philipp Stanner 2024-04-03  882  
34e90b966504f3 Philipp Stanner 2024-04-03  883  	return 0;
34e90b966504f3 Philipp Stanner 2024-04-03  884  
34e90b966504f3 Philipp Stanner 2024-04-03  885  err:
34e90b966504f3 Philipp Stanner 2024-04-03  886  	/*
34e90b966504f3 Philipp Stanner 2024-04-03  887  	 * Here it gets tricky: pcim_iomap() above has most likely
34e90b966504f3 Philipp Stanner 2024-04-03  888  	 * failed because it got an OOM when trying to create the
34e90b966504f3 Philipp Stanner 2024-04-03  889  	 * legacy-table.
34e90b966504f3 Philipp Stanner 2024-04-03  890  	 * We check here if that has happened. If not, pcim_iomap()
34e90b966504f3 Philipp Stanner 2024-04-03  891  	 * must have failed because of EINVAL.
34e90b966504f3 Philipp Stanner 2024-04-03  892  	 */
34e90b966504f3 Philipp Stanner 2024-04-03  893  	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
34e90b966504f3 Philipp Stanner 2024-04-03 @894  	ret = legacy_iomap_table ? -EINVAL : -ENOMEM;
                                                              ^^^^^^^^^^^^^^^^^^
Check for NULL

34e90b966504f3 Philipp Stanner 2024-04-03  895  
34e90b966504f3 Philipp Stanner 2024-04-03  896  	while (--bar >= 0)
34e90b966504f3 Philipp Stanner 2024-04-03 @897  		pcim_iounmap(pdev, legacy_iomap_table[bar]);
                                                                                   ^^^^^^^^^^^^^^^^^^
Unchecked dereference

34e90b966504f3 Philipp Stanner 2024-04-03  898  
34e90b966504f3 Philipp Stanner 2024-04-03  899  	pcim_release_all_regions(pdev);
34e90b966504f3 Philipp Stanner 2024-04-03  900  
34e90b966504f3 Philipp Stanner 2024-04-03  901  	return ret;
acc2364fe66106 Philipp Stanner 2024-01-31  902  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

