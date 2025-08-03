Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74941B193EF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 13:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D8C10E1AF;
	Sun,  3 Aug 2025 11:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPjJJlHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7E610E1AF
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 11:56:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573Areux030663
 for <dri-devel@lists.freedesktop.org>; Sun, 3 Aug 2025 11:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6ugECVcJfC4IsqMv4ZT9nbZT
 Iyzca/vp2GaV07FTpAg=; b=pPjJJlHxrVxMi0liS+bqC64qi5JCp8TK5LQzX3sJ
 VD9DMFewGPp+4tiFSuugHmLuwUcyclheRg0zoROjMtQRp8Mm3NemvTlg6LuI5070
 B6E/x5w1FA/SQPWBE4lhcMPdUfZZCjN2VmNu8iZrUDfE/vsPAGuVkZP0xMY5ksHg
 /q/CLh/MXtSue2Xp70oaSOUs9kth39fTUi1Q2/F/RMDSiuHlalWSHjqG3QdzkNWP
 VzoIAhB+3VYmhPwBbckhHpyf/DIqpgdOc0wBMNsyEXIdrPeZVWbfa/W62shp53Ez
 VpqvaoYkRy0Hhrfai9yY7abqnjSAm2DgJZxDfLdVYfaDvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m29pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 11:56:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e7ffcbce80so6021585a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 04:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754222188; x=1754826988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ugECVcJfC4IsqMv4ZT9nbZTIyzca/vp2GaV07FTpAg=;
 b=digf1V2xOmbk7jGOxvHdxO2lBq/FounTb19wxZGGlG11xnig1VPgoxHHNIYUELJd0p
 uL3EyNCJZqswCPLQDJU76tvNYuULYStMf+yGh71EhsPF945laKgHDc1PggJW7DFhOtGH
 MqXzFfACd2LJKuk5XL+lPP1Nb5TqB9cpjsNMRpcjjr3yLV5ZbqBJlVxuj4/3bd149HcV
 FD+FYjkB/WEjxsW7lhOHsv5IFfg7BM0/q4Qkv6ovUvAHcEWWmTn2ir1XYUSox+DIUQfx
 58yuS7YwBj7bbAQ666/jRtM4lQDTp7nflYMXTwh8ZxKvLcLAVkDN4QC91A225pMTdzJ+
 QnRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn0Q0um+CEbY95xTTKdfZSB6dgdeo4vYt/AzfBlMrSpfMobSKGVxVEmYxDd9FvWoJvloQoeMiSZ60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRo7Cmq51D25/GeI9uwJGk8+qEzaoDebCJT7mHJ+2vF8fyuOur
 GhVtpXUT/tH6KG3NMcrrFECCZTvf27G5NKVzXycilYpVbbhkMIWAMNGLXn3MMg+1uEoLjgKPzyP
 tQKNsyIEHPX/an5NyOmDpx+ptJ8X/URWptjQIfCHHr/8ysxqT8uA6qVxweWxu4X5zMf8AKUw=
X-Gm-Gg: ASbGncvd6CX0sczpD2wZjjyAliv7fStwscuPRC1b3+TB8YoPLsWap5T1BGrnXV9rADk
 OUDIeoWZY5+1w7FFCoIP2erJk5Fn25HuPKa0EiCe9it1dYBeqdX5k+XFgM84S+VJfX2+SCihhuO
 NFUV5t/3QdZ0A5JU0g578YYCT54HPueE81f6FMGMyn1lYQlmKNhoF+7M4HVMP5P23Vxtx5IJkuf
 hlldAXs1MG3IIbo2ObeBas1qylFXlJHwviraaEeuGM1wfB4JaGdjkPIhzXHMOWMi0yezaRCFraF
 EtBVk2nQEFYpPwjDj3SRZqsrxdw7R2Cl8W7ZZTqIZZabXv4Qd3qRooE063MoMl8HS0llS/wUiuS
 yfGPlWlAxZ+ZqpmbEtQ0dLuuT62Z6WvAjRLEVTPjlXqgnIbRh3SIF
X-Received: by 2002:a05:620a:1645:b0:7e3:39c2:9856 with SMTP id
 af79cd13be357-7e696268352mr662088085a.1.1754222188232; 
 Sun, 03 Aug 2025 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6BW3ujWZkak3zpCLkrt/tfZsQQRCiNUSKNPAfRJE+y5Gbg2KICgz+ZOmYbwqk9iZpbuxljQ==
X-Received: by 2002:a05:620a:1645:b0:7e3:39c2:9856 with SMTP id
 af79cd13be357-7e696268352mr662085785a.1.1754222187833; 
 Sun, 03 Aug 2025 04:56:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm1276838e87.101.2025.08.03.04.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 04:56:25 -0700 (PDT)
Date: Sun, 3 Aug 2025 14:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sitronix/st7571-i2c: Make st7571_panel_data
 variables static const
Message-ID: <w4tlpcw6s6yogacneo4gthor5annn3qjyxswrtrisoqawdbf3p@y5r7gkrmzmdo>
References: <20250718152534.729770-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152534.729770-1-javierm@redhat.com>
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=688f4e6d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=TIRtq7bqiOsBIkxYvl4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ghIzuEqHvou3VNw68Az_YhBHOistApEw
X-Proofpoint-ORIG-GUID: ghIzuEqHvou3VNw68Az_YhBHOistApEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3OSBTYWx0ZWRfX2X5cKIa5jyk6
 spKyV+4yVb5TyYCbU07MwW0rUTgSNT50/+Ik8QwRUIylPRMH6nGNXXzrY0R6lE8wQM7pMV3USg3
 W+gaOoX0pqtuW+t7+iUhdiQszeXI9eJTUs0FKBC3SX9kcSsPm5ptd/5XusCS6HcWfRfC08Jr148
 se1CtkDqUd0qLoRFXEw9OnBnIPGhaOTY40S4bV7wGeK4/ICtN6wGRvOxXe9sj+8Ps5gaax7b2rr
 vbzhdCcFhjf28wSscGLDGPwCMzRm8lLJUVne78MkA352WCBn7FaseUE3iTcLzJX67WsyG2GeZsn
 JGeL2uaqg4hvcLIzRKkV+n+lpOCMIFfUlThjQKaX5UFlLH2Gqj9YKloSGf6CcCV7s4RTtkVtD1N
 KmGy59BGRPoff2RE4wN5/DM4gY5LcQHAlzMDcuGsSaL/YS7Kfkgwem++4CjjYwpo2eSXxk/K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030079
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

On Fri, Jul 18, 2025 at 05:25:25PM +0200, Javier Martinez Canillas wrote:
> The kernel test robot reported that sparse gives the following warnings:
> 
> make C=2 M=drivers/gpu/drm/sitronix/
>   CC [M]  st7571-i2c.o
>   CHECK   st7571-i2c.c
> st7571-i2c.c:1027:26: warning: symbol 'st7567_config' was not declared. Should it be static?
> st7571-i2c.c:1039:26: warning: symbol 'st7571_config' was not declared. Should it be static?
>   MODPOST Module.symvers
>   LD [M]  st7571-i2c.ko
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507180503.nfyD9uRv-lkp@intel.com
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v2:
> - Also make the st7571_panel_data variables to be const (Thomas Zimmermann).
> 
>  drivers/gpu/drm/sitronix/st7571-i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
