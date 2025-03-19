Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9CA68C29
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 12:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E210E31C;
	Wed, 19 Mar 2025 11:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESNTuoEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951B10E31C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:54:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lmKp009864
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=m1wVp3ayMkhsdP5PDoes/pSj
 xAH0RQ5XhKprMPoSjj0=; b=ESNTuoEsj0GW0LOBiKZlO6XnSbLiinR3dxBfFfKA
 cYiHH5GxDRtnagMvlLapAzc9rythdZDuVQTjiWa104Hl0KlZ5EqYuMtqfvnAZc8K
 WpAXApTxZKj4v4EodbLEAI/Rj6k4rJKx21Xnp/kCtvikKA22bLdVCRwPcP+bU3+N
 nad4F674adhvlPltB+q6LtZYHLO7+3JNQ3ij6BZ/40oiZWLS8l2rgSQZgLYslPQh
 iEf/QL93cCk5y0ipxvT7Df7ecVB1IhRCmgq6qB4bFHdTzxTxtEttRreXvHg4g5P0
 KkHDX29lY8MzRraBArKVvg/ttIZYhjdojGhjBO/Q8ltCtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxjbdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:54:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c3c8f8ab79so1123608785a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 04:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742385271; x=1742990071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1wVp3ayMkhsdP5PDoes/pSjxAH0RQ5XhKprMPoSjj0=;
 b=M//AJFo1XiBooFwZgXFv3O69+6dITCpAq4KfHs2Q0nTL9ZygQg3GNJhxRF7CzHjDoW
 wLGyQP45XPMqpQmhVRRZCmtjJgJMvFs9LOC22K2Cj5knN6TT/ayry9zZRtr2/1E7XIGf
 2iID5RnH/tVUtn5MIG44mgm8idav+p76majJnMO419nbjM395dXKLe+rLOTWycVLtYrh
 VrfRuQ4ONSHqWw13zqyVtSJEaj1ur0frg34Lc+WGVlNT7F2jkV5/rqaLWITX/7hEn7PY
 leZYEDbZKKQOOd5hPy1QWImsoboQ54cYUvsYbVnShILjBgAYSwCY4t5LOk6VPEiwPdOU
 5gcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf0o467ZlA2BlttwYN2Ou9PTIcRx31Sqpz0/8EslKLdGHpaHsgvA2l8u+hJ/eDVOn0KKizrXpW3E8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywap/cU1eIeLTp03ZVlhEYjA6EFPFKxEv2UpzRxSTSHtV5l5YOm
 P//htUzeeKyW4WX2EUGvAkzm1IEVT0FUgMoObsXrCfDu+yC/1dQOxTdbtKtNuPHhtOdfdGoZ2pq
 34Hl843F2z3Khask75SIkbXCrs7BsyQx6p/8nT3DYG5xKZInIL0CyruHye6Ej9UdKh7A=
X-Gm-Gg: ASbGnctkKW94XLoWgzKz8YG1TFLW1QW9bWxWz1zQ9XuWToNRKF3Z4oSAxBSh5Gb/Axo
 4kWhioXgNLCieBbprra+2jFC6Gztb9KiCr4Vm9x9V/Db/v0V7It1asapuTOKJjwbq7NgEha+TtW
 BqW93cN5oLLD6ItjzcMufE9XFvvqhLowhxbZR4Xr/fvSOzyAfcia+clD5cWBvQGybElx7D0R7bD
 nh9GpCdXfp/wFwf5qdVmgOJZ82RUVIZ5WrTqc34tvuetAxwXrR3OTs9pcbTqbhGN2hDDX4bTPbJ
 xLBO8CsLus+1ZbH5EVSJOIEIiGybEJOmUqep4HhMgtbmEzA9bWQEdMjbiUpvNuR+huVl9JH/cHI
 zkus=
X-Received: by 2002:a05:620a:454e:b0:7c5:a55b:fa6c with SMTP id
 af79cd13be357-7c5a84620e1mr304858785a.38.1742385271517; 
 Wed, 19 Mar 2025 04:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp9lvt7Q0aLMIolPL2+xrZPtBlFeLVP+h8L4UOLPcPOwLwkMyFNsvohYJ6wdFLYq9DY5XjMA==
X-Received: by 2002:a05:620a:454e:b0:7c5:a55b:fa6c with SMTP id
 af79cd13be357-7c5a84620e1mr304854185a.38.1742385271046; 
 Wed, 19 Mar 2025 04:54:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba882793sm1963795e87.179.2025.03.19.04.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 04:54:30 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:54:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 drm-dp 0/9] Add HPD, getting EDID, colorbar features
 in DP function
Message-ID: <eazroq6fccuklkzps2e5med3bn655od7qjbkyahryzpimlytzk@j5gordvuudg4>
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319032435.1119469-1-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67dab078 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=QyXUC8HyAAAA:8
 a=flXVKZ_LIo3tZOgc874A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3EVmIc98EUycdoWQxPsOUlbL5_zvHBgv
X-Proofpoint-GUID: 3EVmIc98EUycdoWQxPsOUlbL5_zvHBgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190082
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

On Wed, Mar 19, 2025 at 11:24:26AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> To support DP HPD, edid printing, and colorbar display features based on
> the Hisislcon DP devices.
> ---
> ChangeLog:
> v6 -> v7:
>   - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula

Where was that suggestion? Also, would you please implement his feedback
regarding drm_edid_read()?

>   v6: https://lore.kernel.org/all/20250310040138.2025715-1-shiyongbang@huawei.com/
> v5 -> v6:
>   - fix the DP_SERDES_VOL2_PRE0 value after electrical test.
>   - move the detect_ctx() to the patch 7/9.
>   - add detect_ctx with 200ms delay, suggested by Dmitry Baryshkov.
>   v5: https://lore.kernel.org/all/20250307101640.4003229-1-shiyongbang@huawei.com/
> v4 -> v5:
>   - add commit log about hibmc_kms_init(), suggested by Dmitry Baryshkov.
>   - fix the format of block comments, suggested by Dmitry Baryshkov.
>   - add hibmc_dp_get_serdes_rate_cfg() to correct transferring serdes cfg.
>   - separate the vga part commit, suggested by Dmitry Baryshkov.
>   - remove pci_disable_msi() in hibmc_unload()
>   v4: https://lore.kernel.org/all/20250305112647.2344438-1-shiyongbang@huawei.com/
> v3 -> v4:
>   - fix the serdes cfg in hibmc_dp_serdes_set_tx_cfg(), suggested by Dmitry Baryshkov.
>   - move the dp serdes registers to dp_reg.h, suggested by Dmitry Baryshkov.
>   - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
>   - fix the comment log to imperative sentence, suggested by Dmitry Baryshkov.
>   - add comments in hibmc_control_write(), suggested by Dmitry Baryshkov.
>   - add link reset of rates and lanes in pre link training process, suggested by Dmitry Baryshkov.
>   - add vdac detect and connected/disconnected status to enable HPD process, suggested by Dmitry Baryshkov.
>   - remove a drm_client, suggested by Dmitry Baryshkov.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202502231304.BCzV4Y8D-lkp@intel.com/
>   v3: https://lore.kernel.org/all/20250222025102.1519798-1-shiyongbang@huawei.com/
> v2 -> v3:
>   - restructuring the header p_reg.h, suggested by Dmitry Baryshkov.
>   - add commit log about dp serdes, suggested by Dmitry Baryshkov.
>   - return value in hibmc_dp_serdes_init(), suggested by Dmitry Baryshkov.
>   - add static const in the array of serdes_tx_cfg[], suggested by Dmitry Baryshkov.
>   - change drm_warn to drm_dbg_dp, suggested by Dmitry Baryshkov.
>   - add explanations about dp serdes macros, suggested by Dmitry Baryshkov.
>   - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>   - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
>   - split the patch into two parts, suggested by Dmitry Baryshkov.
>   - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
>   - rewrite the commit log, suggested by Dmitry Baryshkov.
>   - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
>   - change binary format to integer format, suggested by Dmitry Baryshkov.
>   - remove mdelay(100) hpd function in ISR, suggested by Dmitry Baryshkov.
>   - remove enble_display in ISR, suggested by Dmitry Baryshkov.
>   - change drm_kms_helper_connector_hotplug_event() to
>     drm_connector_helper_hpd_irq_event(), suggested by Dmitry Baryshkov.
>   - move macros to dp_reg.h, suggested by Dmitry Baryshkov.
>   - remove struct irqs, suggested by Dmitry Baryshkov.
>   - split this patch into two parts, suggested by Dmitry Baryshkov.
>   v2: https://lore.kernel.org/all/20250210144959.100551-1-shiyongbang@huawei.com/
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>   - changing all names of dp phy to dp serdes.
>   - deleting type conversion, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
>   - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
>   - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
>   - using debugfs_init() callback, suggested by Dmitry Baryshkov.
>   - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
>   - optimizing the description in commit message, suggested by Dmitry Baryshkov.
>   - add mdelay(100) comments, suggested by Dmitry Baryshkov.
>   - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
>   v1: https://lore.kernel.org/all/20250127032024.1542219-1-shiyongbang@huawei.com/
> ---
> 
> Baihan Li (9):
>   drm/hisilicon/hibmc: Restructuring the header dp_reg.h
>   drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage
>     and pre-emphasis
>   drm/hisilicon/hibmc: Add dp serdes cfg in dp process
>   drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
>   drm/hisilicon/hibmc: Getting connector info and EDID by using AUX
>     channel
>   drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
>   drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
>   drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
>   drm/hisilicon/hibmc: Add vga connector detect functions
> 
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  10 +-
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  91 +++++++++++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  36 +++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  97 +++++++++----
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   | 130 +++++++++++++-----
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  71 ++++++++++
>  .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 104 ++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  78 ++++++++++-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  87 +++++++++---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  12 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   3 +
>  14 files changed, 638 insertions(+), 102 deletions(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
> 
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
