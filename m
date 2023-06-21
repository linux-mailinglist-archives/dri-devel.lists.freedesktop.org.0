Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA694737B06
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 08:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4E10E3C0;
	Wed, 21 Jun 2023 06:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A2210E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 06:11:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f8f3786f1dso60618035e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 23:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687327911; x=1689919911;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F9Z0ZKdA5n3E7YE752tNdx5GoNU7iNsBBAQ0Gt82VOE=;
 b=DRmi3gsznytDQuMMXU7YZHpZsiMECAV9ottEdKtsKzWDvBM4fJBvzk1qLYHNb0PD0/
 YEQNU8LgIu+oxmWx7ugFelR+TCf5Um9Lzt+LZViucERRjkMlJ/Jci7p2VMTb8Uc4qPJE
 ha5Kloe7R1XRpM9LKzI2N+Wa/onj33zSsYw/+45KvOTcLT4moVmbGUGyqDofOqgEYEDQ
 JcB64rKuRtZ6OVwRNzh8nrlpb5WFNIFLsTFc+U7adCMC9bAiFgKWFH5jEM40N4a1MMPn
 k9XR/SglHt0FoeqgmKOFCmqlLeg27uP8YTqNTAWVOkzqqm3KhGI58aMzv8eck5PTAFkv
 z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687327911; x=1689919911;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F9Z0ZKdA5n3E7YE752tNdx5GoNU7iNsBBAQ0Gt82VOE=;
 b=UIkUDnlTddYIBHNh3Yfvc40VoP0xBzRV+uZRF/7RRAjI/uszPzouotqnMkrot7/UlY
 PIpekPaFtciqJm2iymprGeEj70HwjW+sfcGPwl6NsGXDlZ+BiI6LKb4SduGNTvaYHkm5
 guse8UZz4QLtAqlBL+/xH/El9Du0zW7oN2QQ8Q1qLloYLXC9EkYA3n4JwvnNaGHrwhyY
 +dNVu6Ln/Tny5R6Tn0bmkVXcpRjOYW89l5VAe1Den02F1ryAY80tNISufHHyBHrJ4IIW
 20oPEUsS8qKozPj34CxXK2sKVu38VvosLJkIy0Cg9FnQd07ff45sqfK54hZQWsKXSH3V
 Gkew==
X-Gm-Message-State: AC+VfDynltVNdwUzyQhyMS07eAPmllfYlvCPW4m5Ty3HmtwsURqrLZQE
 2u6LtTkgVN3PKxHGmWk0yN3XbA==
X-Google-Smtp-Source: ACHHUZ5DW0QS3TpNIyGAdzmi9CLNjuKigdoS6JtdJYrwDa0SfRLkVj3i/ohJymd5Zir41g6uk4807Q==
X-Received: by 2002:a7b:c34d:0:b0:3f7:b1df:26d with SMTP id
 l13-20020a7bc34d000000b003f7b1df026dmr15170735wmj.38.1687327911511; 
 Tue, 20 Jun 2023 23:11:51 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f604793989sm1570024wmc.18.2023.06.20.23.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 23:11:49 -0700 (PDT)
Date: Wed, 21 Jun 2023 09:11:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Su Hui <suhui@nfschina.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/amdgpu: =?utf-8?Q?Use_?=
 =?utf-8?B?4oCcX19wYWNrZWTigJw=?= instead of "pragma pack()"
Message-ID: <34ae0f86-c32b-4d5a-be56-0654dba0f908@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620085543.576733-1-suhui@nfschina.com>
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
Cc: Su Hui <suhui@nfschina.com>, Jane.Jian@amd.com, David.Francis@amd.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Likun.Gao@amd.com, dan.carpenter@linaro.org,
 lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When there was a #pragma then Sparse just turned off.  The Sparse
warnings are places where people forgot to put the __user in their casts
or didn't annotate endianness correctly.  It's not a "bug" to forget
to annotate endianness or user pointers.  That's how we used to do it
prior to 2003.  But these days it feels strange and dangerous to see
these sorts of warnings.

Smatch also disabled some uninitialized variable checks.  These are
mostly false positives where we have a loop:

	int r;

	while (something) {
		r = frob();
	}

	return r;

Smatch complains that we don't necessarily enter the loop.  I think
I'm going to disable this type of "enter the loop" warning when you
don't have the cross function database available.  That will silence
these for the kbuild bot.

regards,
dan carpenter

Hi Su,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-amd-amdgpu-Use-__packed-instead-of-pragma-pack/20230620-165739
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230620085543.576733-1-suhui%40nfschina.com
patch subject: [PATCH] drm/amd/amdgpu: Use “__packed“ instead of "pragma pack()"
config: mips-randconfig-m031-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210527.Oxvd2Jlz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210527.Oxvd2Jlz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306210527.Oxvd2Jlz-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5914 amdgpu_pci_slot_reset() error: uninitialized symbol 'memsize'.
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2244 amdgpu_fill_buffer() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:55 amdgpu_benchmark_do_move() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:534 amdgpu_vram_mgr_new() error: uninitialized symbol 'cur_size'.
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:534 amdgpu_vram_mgr_new() error: uninitialized symbol 'size'.
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1274 amdgpu_ras_query_error_count() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:141 amdgpu_securedisplay_debugfs_write() error: uninitialized symbol 'phy_id'.
drivers/gpu/drm/amd/amdgpu/aldebaran.c:103 aldebaran_mode2_suspend_ip() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/aldebaran.c:385 aldebaran_mode2_restore_hwcontext() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c:96 sienna_cichlid_mode2_suspend_ip() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c:95 smu_v13_0_10_mode2_suspend_ip() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c:612 mmhub_v2_0_update_medium_grain_clock_gating() error: uninitialized symbol 'def'.
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1183 amdgpu_gfx_cp_init_microcode() error: uninitialized symbol 'ucode_fw'.
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1184 amdgpu_gfx_cp_init_microcode() error: uninitialized symbol 'fw_size'.
drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:594 sdma_v4_0_init_microcode() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:251 sdma_v5_0_init_microcode() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1021 sdma_v5_0_ring_test_ring() error: uninitialized symbol 'index'.
drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:905 sdma_v6_0_ring_test_ring() error: uninitialized symbol 'index'.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:145 sdma_v4_4_2_init_microcode() error: uninitialized symbol 'ret'.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:1390 sdma_v4_4_2_sw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:855 sdma_v5_2_ring_test_ring() error: uninitialized symbol 'index'.
drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:361 vcn_v3_0_hw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:222 vcn_v4_0_3_hw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:281 vcn_v4_0_hw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:592 amdgpu_amdkfd_get_xgmi_bandwidth_mbytes() error: uninitialized symbol 'peer_adev'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1011 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'mclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1016 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'soc_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1021 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'fclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1026 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'vclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1031 vangogh_get_dpm_ultimate_freq() error: uninitialized symbol 'dclk_mask'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1085 smu_v13_0_0_get_od_setting_limits() error: uninitialized symbol 'od_min_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1087 smu_v13_0_0_get_od_setting_limits() error: uninitialized symbol 'od_max_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1076 smu_v13_0_7_get_od_setting_limits() error: uninitialized symbol 'od_min_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1078 smu_v13_0_7_get_od_setting_limits() error: uninitialized symbol 'od_max_setting'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:121 __smu_cmn_poll_stat() error: uninitialized symbol 'reg'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:187 smu_get_mclk() error: uninitialized symbol 'clk_freq'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:201 smu_get_sclk() error: uninitialized symbol 'clk_freq'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344 amdgpu_device_resize_fb_bar() warn: impossible condition '(res->start > 4294967296) => (0-u32max > 4294967296)'
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2307 amdgpu_ras_recovery_init() warn: Please consider using kzalloc instead of kmalloc
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2579 amdgpu_ras_init() warn: Please consider using kzalloc instead of kmalloc
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:134 amdgpu_gfx_parse_disable_cu() warn: potential spectre issue 'mask' [w]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:614 amdgpu_gfx_enable_kcq() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1879 sdma_v4_0_sw_init() error: uninitialized symbol 'r'.
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:2580 smu_v13_0_0_check_ecc_table_support() warn: missing error code? 'ret'

vim +/memsize +5914 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5884  pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5885  {
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5886  	struct drm_device *dev = pci_get_drvdata(pdev);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5887  	struct amdgpu_device *adev = drm_to_adev(dev);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5888  	int r, i;
04442bf70debb1 Lijo Lazar        2021-03-16  5889  	struct amdgpu_reset_context reset_context;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5890  	u32 memsize;
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5891  	struct list_head device_list;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5892  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5893  	DRM_INFO("PCI error: slot reset callback!!\n");
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5894  
04442bf70debb1 Lijo Lazar        2021-03-16  5895  	memset(&reset_context, 0, sizeof(reset_context));
04442bf70debb1 Lijo Lazar        2021-03-16  5896  
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5897  	INIT_LIST_HEAD(&device_list);
655ce9cb13b596 shaoyunl          2021-03-04  5898  	list_add_tail(&adev->reset_list, &device_list);
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5899  
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5900  	/* wait for asic to come out of reset */
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5901  	msleep(500);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5902  
7ac71382e90aba Andrey Grodzovsky 2020-08-24  5903  	/* Restore PCI confspace */
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5904  	amdgpu_device_load_pci_state(pdev);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5905  
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5906  	/* confirm  ASIC came out of reset */
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5907  	for (i = 0; i < adev->usec_timeout; i++) {
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5908  		memsize = amdgpu_asic_get_config_memsize(adev);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5909  
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5910  		if (memsize != 0xffffffff)
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5911  			break;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5912  		udelay(1);
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5913  	}
362c7b91c1b00e Andrey Grodzovsky 2020-08-24 @5914  	if (memsize == 0xffffffff) {
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5915  		r = -ETIME;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5916  		goto out;
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5917  	}
362c7b91c1b00e Andrey Grodzovsky 2020-08-24  5918  
04442bf70debb1 Lijo Lazar        2021-03-16  5919  	reset_context.method = AMD_RESET_METHOD_NONE;
04442bf70debb1 Lijo Lazar        2021-03-16  5920  	reset_context.reset_req_dev = adev;
04442bf70debb1 Lijo Lazar        2021-03-16  5921  	set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
04442bf70debb1 Lijo Lazar        2021-03-16  5922  	set_bit(AMDGPU_SKIP_HW_RESET, &reset_context.flags);
04442bf70debb1 Lijo Lazar        2021-03-16  5923  
7afefb81b72cbc Andrey Grodzovsky 2021-05-21  5924  	adev->no_hw_access = true;
04442bf70debb1 Lijo Lazar        2021-03-16  5925  	r = amdgpu_device_pre_asic_reset(adev, &reset_context);
7afefb81b72cbc Andrey Grodzovsky 2021-05-21  5926  	adev->no_hw_access = false;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5927  	if (r)
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5928  		goto out;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5929  
04442bf70debb1 Lijo Lazar        2021-03-16  5930  	r = amdgpu_do_asic_reset(&device_list, &reset_context);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5931  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5932  out:
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5933  	if (!r) {
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5934  		if (amdgpu_device_cache_pci_state(adev->pdev))
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5935  			pci_restore_state(adev->pdev);
c1dd4aa624076c Andrey Grodzovsky 2020-08-24  5936  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5937  		DRM_INFO("PCIe error recovery succeeded\n");
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5938  	} else {
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5939  		DRM_ERROR("PCIe error recovery failed, err:%d", r);
e923be9934a9c5 Andrey Grodzovsky 2022-01-25  5940  		amdgpu_device_unset_mp1_state(adev);
e923be9934a9c5 Andrey Grodzovsky 2022-01-25  5941  		amdgpu_device_unlock_reset_domain(adev->reset_domain);
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5942  	}
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5943  
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5944  	return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
c9a6b82f45e261 Andrey Grodzovsky 2020-07-29  5945  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

