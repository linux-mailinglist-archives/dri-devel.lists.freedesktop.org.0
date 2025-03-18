Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE10A680EA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 00:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2683110E185;
	Tue, 18 Mar 2025 23:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Il35Pecz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0273E10E185
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 23:52:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHs6Ai014906
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 23:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kMxy2l4lpFdhOKtsEKPPqQJK7FR0tn29jLDAH13JBdc=; b=Il35Peczt5Bu9Xhf
 QCuWBSnnO+8hzC4GEeWlvgfuCsshYCs1LCWZF5m0lgVacbwVTi7i7K6wBkSXE2SQ
 1hvVe1ctJo8rCHMt30mG78DrI+knb8PxISUc/37g9Er+DS9TGNlJI6GLVKBtUHz9
 lmQBAwkFYnHE8EwT+BxFOtPAIojEO5ICgnM/jBp2Dd0AE5Go2sjGHXYVGhWi7fl4
 h366ssdSJwN7wcBQIFEMhO0fnqFp/Isra2QGI9ExfkgPLqoYD51nTyS+bqctsEJV
 TqzUF+oRcqjE3cF24kpKPKZcse9Nh6srgzjgVjkzX7TT1LHPrxEBtoxcfQwvhWym
 YRLaMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwrq50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 23:52:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so1006219385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 16:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742341966; x=1742946766;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMxy2l4lpFdhOKtsEKPPqQJK7FR0tn29jLDAH13JBdc=;
 b=xOF9vK8r+gtQiZI3b5DfEiJaXe2m+h3TDweIPfhtY4AwIrSvP7sfKY/B39DrZMH8PD
 am7qXUiQ/D1G6HsM3DS1HOW9jAue627fSuy+tJ8HGwgh+WnwiAULMrBggwLtk5EMB7+2
 GkaOf4DgwIJKpooDXGBCZlodpCzHaJguZ9AH0CFnINe4mC9MPVuipV95xlqYrXAHeiPV
 hB61lKs0fkBLVbNIDQ1BPPu59/UHE3Jq4AEs6WVZvTgJsRMydoGLIZQqFPxcsID1+NhB
 p9zg1B7Oka5dZf2YKx/+uy4OyrrGf68ThGOOBGlzU+mdj8ThyEOqJqgIhr/O9zT7Gcq2
 w+Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOAejzc7/A0QVcGVrh/Rqe2lU3j4SgcYc9FadlJZSI2/knZM92R2HB+fIm3hQLAi0v8aS5jPp78iQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMs91HUMDh/WzzkGgvqu/EvI45J5PNm/A9TzKVjaUu2c3NcANt
 l+bGVurYydyEc0dx0e5OpujivmuFdo2SIASoY6r9KCPe0FXHi+I5Dhm7ZM4FE2o4K+RpoE7Rae3
 RYftgg5w7GjuOoEsJyh3hONLMFrm5QzI6jLuGEeUziCiI3YTrBNNFW3ar1IgIBFCe0vY=
X-Gm-Gg: ASbGncuuuS7kssPyevUVI/cCcbCiVa8tFq4aPtOzzfO1uCMBu8bvejo96J6rV2MzeuN
 M48XV3GKH+RkDC5ImDrG5wXjltwU/QXFuE9rq4XfB2cq0/2skIdfENKmIbKgemfOg3nDf/2eSoH
 OxH285eqbDHG+aI4X6P7kHzEcYtgweeKEgWbTHQa2UuUR/9vuKhc/VQDKWFEG+fjOOqFqUNvYhr
 1TDZLZ4+JQjn/jF4Krg6+ki7t1jgI77TkGNTojJqrG17UFEfZOo/DMB+Z3sGHYCuh8xpwhxUr61
 kKFtbCGd/HmeW/V6meGVdmkqaN9z52iVhBIUcRbhedjl0ms3JV73fRwm7Urd42zWU7iQm5HYsvs
 T5SE=
X-Received: by 2002:a05:620a:4005:b0:7c5:467f:d130 with SMTP id
 af79cd13be357-7c5a8476bdfmr128698185a.36.1742341966542; 
 Tue, 18 Mar 2025 16:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsZLpGILgkoF9IHZR+sIkZJewr/d7N1/CnLDO40+U7MRxwn9eB1zt3/hkbTmYe/Nj6Vo9Vfg==
X-Received: by 2002:a05:620a:4005:b0:7c5:467f:d130 with SMTP id
 af79cd13be357-7c5a8476bdfmr128694185a.36.1742341966167; 
 Tue, 18 Mar 2025 16:52:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864ec9sm1847027e87.110.2025.03.18.16.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 16:52:45 -0700 (PDT)
Date: Wed, 19 Mar 2025 01:52:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 0/9] Add HPD, getting EDID, colorbar features
 in DP function
Message-ID: <d5ql3fozkdbbad6mfpz2eta6mwssgwihyydjkcpk257ocqsi6l@nyqpzq36pr27>
References: <20250310040138.2025715-1-shiyongbang@huawei.com>
 <3e872ee8-a537-4e47-90fc-45fe06f85220@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e872ee8-a537-4e47-90fc-45fe06f85220@huawei.com>
X-Proofpoint-ORIG-GUID: XrbAHQB-han7gDLuOKP5_Pj2zqeXPYtr
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67da074f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i0EeH86SAAAA:8
 a=vDggtHR7Q3xBfYhfKjgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XrbAHQB-han7gDLuOKP5_Pj2zqeXPYtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180173
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

On Tue, Mar 18, 2025 at 10:50:10AM +0800, Yongbang Shi wrote:
> Gently ping！
> 
> Hi, Dmitry. There is no more comment for this patch set for one week, I wonder,
> could this patch be applied, or wait for more comments.

Currently FDO is in process of migration, so we have a cooldown period
of about 1 week.

> 
> Thanks,
> Baihan
> 
> 
> > From: Baihan Li <libaihan@huawei.com>
> > 
> > To support DP HPD, edid printing, and colorbar display features based on
> > the Hisislcon DP devices.
> > ---
> > ChangeLog:
> > v5 -> v6:
> >    - fix the DP_SERDES_VOL2_PRE0 value after electrical test.
> >    - move the detect_ctx() to the patch 7/9.
> >    - add detect_ctx with 200ms delay, suggested by Dmitry Baryshkov.
> > v4 -> v5:
> >    - add commit log about hibmc_kms_init(), suggested by Dmitry Baryshkov.
> >    - fix the format of block comments, suggested by Dmitry Baryshkov.
> >    - add hibmc_dp_get_serdes_rate_cfg() to correct transferring serdes cfg.
> >    - separate the vga part commit, suggested by Dmitry Baryshkov.
> >    - remove pci_disable_msi() in hibmc_unload()
> > v3 -> v4:
> >    - fix the serdes cfg in hibmc_dp_serdes_set_tx_cfg(), suggested by Dmitry Baryshkov.
> >    - move the dp serdes registers to dp_reg.h, suggested by Dmitry Baryshkov.
> >    - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
> >    - fix the comment log to imperative sentence, suggested by Dmitry Baryshkov.
> >    - add comments in hibmc_control_write(), suggested by Dmitry Baryshkov.
> >    - add link reset of rates and lanes in pre link training process, suggested by Dmitry Baryshkov.
> >    - add vdac detect and connected/disconnected status to enable HPD process, suggested by Dmitry Baryshkov.
> >    - remove a drm_client, suggested by Dmitry Baryshkov.
> >    - fix build errors reported by kernel test robot <lkp@intel.com>
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202502231304.BCzV4Y8D-lkp@intel.com/
> > v2 -> v3:
> >    - restructuring the header p_reg.h, suggested by Dmitry Baryshkov.
> >    - add commit log about dp serdes, suggested by Dmitry Baryshkov.
> >    - return value in hibmc_dp_serdes_init(), suggested by Dmitry Baryshkov.
> >    - add static const in the array of serdes_tx_cfg[], suggested by Dmitry Baryshkov.
> >    - change drm_warn to drm_dbg_dp, suggested by Dmitry Baryshkov.
> >    - add explanations about dp serdes macros, suggested by Dmitry Baryshkov.
> >    - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
> >    - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
> >    - split the patch into two parts, suggested by Dmitry Baryshkov.
> >    - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
> >    - rewrite the commit log, suggested by Dmitry Baryshkov.
> >    - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
> >    - change binary format to integer format, suggested by Dmitry Baryshkov.
> >    - remove mdelay(100) hpd function in ISR, suggested by Dmitry Baryshkov.
> >    - remove enble_display in ISR, suggested by Dmitry Baryshkov.
> >    - change drm_kms_helper_connector_hotplug_event() to
> >      drm_connector_helper_hpd_irq_event(), suggested by Dmitry Baryshkov.
> >    - move macros to dp_reg.h, suggested by Dmitry Baryshkov.
> >    - remove struct irqs, suggested by Dmitry Baryshkov.
> >    - split this patch into two parts, suggested by Dmitry Baryshkov.
> > v1 -> v2:
> >    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> >    - changing all names of dp phy to dp serdes.
> >    - deleting type conversion, suggested by Dmitry Baryshkov.
> >    - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
> >    - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
> >    - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
> >    - using debugfs_init() callback, suggested by Dmitry Baryshkov.
> >    - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
> >    - optimizing the description in commit message, suggested by Dmitry Baryshkov.
> >    - add mdelay(100) comments, suggested by Dmitry Baryshkov.
> >    - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
> > ---
> > 
> > Baihan Li (9):
> >    drm/hisilicon/hibmc: Restructuring the header dp_reg.h
> >    drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage
> >      and pre-emphasis
> >    drm/hisilicon/hibmc: Add dp serdes cfg in dp process
> >    drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
> >    drm/hisilicon/hibmc: Getting connector info and EDID by using AUX
> >      channel
> >    drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
> >    drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
> >    drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
> >    drm/hisilicon/hibmc: Add vga connector detect functions
> > 
> >   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  10 +-
> >   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  91 +++++++++++-
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  36 +++++
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  97 +++++++++----
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   | 130 +++++++++++++-----
> >   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  71 ++++++++++
> >   .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 104 ++++++++++++++
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  75 +++++++++-
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  87 +++++++++---
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  12 ++
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   3 +
> >   14 files changed, 635 insertions(+), 102 deletions(-)
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
> > 

-- 
With best wishes
Dmitry
