Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08EAEC87A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 18:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E46110E04C;
	Sat, 28 Jun 2025 16:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbDRBP9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07F710E04C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 16:05:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCKqRD009671
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 16:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NnXmT3rCn3NQoShP3VJ7gQzJ
 GqTXfkSk/YRgg6sZxos=; b=pbDRBP9nK/k4frMHEhMKLbk2cLGKcKiXQDh9meXQ
 V54Y+VOO3B122qwJrbc5Sd/IDar6ujM6vGHYYRb+v3Ucj9uJqSmWT+rfXG7rKA/p
 l7ZD5FQc5SMGllxeikTMUOsrXy7j7+w9VoQFZUZassbWjrzZUr1VNLD/pfBAPBSE
 o7bjhcpvmPt2MlGAZdEEbSRdfJhtoj0QmAtA2u9oswzYuEkrOsJ4E/jPcMzW/9OJ
 W586W0U1VKwtbxMdFi/zsbLrlODk5UHKc5s4H0GcumPRqKg7maoeXmhIHJqTSwDw
 S1xaGsYdULCmJItnqd/gD9YUU4wQub06xIUM0piNrBT+aA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s98tkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 16:04:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d4133a2081so458642685a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 09:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751126695; x=1751731495;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnXmT3rCn3NQoShP3VJ7gQzJGqTXfkSk/YRgg6sZxos=;
 b=WXIMBKxmQUw6C/ozwXN/FOjJMA3rdKY/4IJrNv6PaSdVbeAjR/ekyllas8T7lEA7wo
 kqWYMPZ63s0vBqNLUuMoCpywYOrlFZwe3tKApYoFWMd+3N8vTr9D05m0X/Unfp09uelW
 TQwYWAFpS3fyPpMzNMpVmYunzcpg/uyvf2hV7+fyQedNDiZcmxLyQIk5HB59udkG/8IU
 qyLck2pOt32R6dRmlflU23KKelXzBZ4Cf/FDhT7L62Vya0AJ+PFQ67gXcGEnz7WShwXI
 WMkeejUqk7HJ8tWUaphAtQorua/6Tww7OKW+xSC3QereiARZz5XAqETBX2jmRYb213Mx
 LR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPysOHhCrLUjQcSJuFH8qOxEKGM29fPhEfgrAEFKErpDiENVUrwfLHWjd7nvAMJ2TsFlXKbFtpHR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHLntJDbHyRRt1SQWOpgBJPaIMuXiMbe1TvqvUljpOOEwDpOAp
 3EGBWg4LhsoCGYMnphNseX88X+xsZXHYKYZdO4HE3JohWUwL84VslxX1a8Ltw+SjgOeZI6esy8U
 pIOv0w8Wp60V0nlcqY8II/+k8bVkLVnMUD+Uh/rFzXPyE1ADDRxKKb7INIkE0mAhchlSImoY=
X-Gm-Gg: ASbGncssRJU+dKgfi3idV9fdOfAMZiRE9OB67Np5BYMYai3zVNMRxV1hcv62zkFIGpe
 6JCzfmr2ykADUfY8ZJFQLwbOaLTeZzqqKyIauDcs5XMcuE19E9TN/Zp2o8rFETAP+eRubrQ4eDq
 Pb+jy2ns2La6SCIs1RONfZbe0R7QZfwrBphY64ZZ/xmI+vDl0ZhvGJMgUdDkKDab+M0BEU6ZhFW
 Uuv2Ar6uDdtXUYhVMTtoSgSYbSacdjQ071trN99SGRqV3vhAF+JxojeQoN3PRxxX/rFkLGcdXfQ
 kG+kcew5Qs+X0+sk1Z8gwDU71wnOywghTEHO+lgy7VfWSwDHLLWFMSt7xmvIGa0fo0UhEO4sKBs
 s2O8JGih6eZSXmgBfUVcFmuyllyPOnLM7aaM=
X-Received: by 2002:a05:620a:2914:b0:7cd:c6:40f3 with SMTP id
 af79cd13be357-7d443909e1amr1137977985a.2.1751126695416; 
 Sat, 28 Jun 2025 09:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdy5a8Tx55RpJAmUoOZR/MGx1abvyJWEF+Vq3GqXodCU/7kVhIYdrw0XbzlUheJXLUWembfw==
X-Received: by 2002:a05:620a:2914:b0:7cd:c6:40f3 with SMTP id
 af79cd13be357-7d443909e1amr1137973185a.2.1751126694934; 
 Sat, 28 Jun 2025 09:04:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2ef3b5sm844853e87.244.2025.06.28.09.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 09:04:53 -0700 (PDT)
Date: Sat, 28 Jun 2025 19:04:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 01/10] drm/hisilicon/hibmc: fix the i2c device
 resource leak when vdac init failed
Message-ID: <pkii4jibdva2ytkcancxun7jlqzc3qmcqrcp75mx5jotwodqsn@vwbst53fzb6b>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-2-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686012a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=V-znLEYDe-3e5yjPEeAA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sL_Of4pOV5Eneo25uPcOZjbyToTW4JST
X-Proofpoint-GUID: sL_Of4pOV5Eneo25uPcOZjbyToTW4JST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMiBTYWx0ZWRfXwFdV1XD1UevF
 RIbL4qa9ZGr/Kh/ZuDf3SSPPjIHg4kczQ6SzjphFmP7gEKvwb/MJtq4HHa330bwmbl7VzvHuYgO
 oS7C0ern3af6wx1CGj6Fq3qp6vCswfaeb+zuK8+J1SyVhblQ3r3crlXVvknef83L7sTVAVhudWJ
 rLWJx2LCWt3CxDJwnW22b6t5zuQkYoTfsrFnBe3DOdAXHRH63r7fTDQJ40D0k14+mLK+kE6/UCx
 okepxmehHEMbKRvPKk3Z7PU5wHFZBAtlGL+CJXEbtvLqXrH52aH+/1LzYaClR7eVcvdrY2nac+B
 uQrp0P7z+1YeMAfCIKVAuGF3bPCY5U0acpWzFJOHNFmj938XJnxXUiQ8+TD2frYYfCp46Z9Gvi2
 35DbRWU/bjQhIvtqxDmeTidSn3ox9Y4MZj4aLgDikJUSCIaVDkaeuvDYvblXsg5LEvdDVctX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280132
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

On Fri, Jun 20, 2025 at 05:30:55PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Currently the driver missed to clean the i2c adapter when vdac init failed.
> It may cause resource leak.
> 
> Fixes: a0d078d06e516 ("drm/hisilicon: Features to support reading resolutions from EDID")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - use the hibmc_ddc_del() in hibmc_connector_destroy(), suggested by Dmitry Baryshkov.
>   - fix the tag, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  |  5 +++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 11 ++++++++---
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
