Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB3B52316
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21B210E1B5;
	Wed, 10 Sep 2025 20:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXDapsa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9E710E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:55:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgFs6021203
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u053Z73zkai4Xa8yTebTvs2P
 Y20porEuaLkDE+bAlMY=; b=hXDapsa8K+egvdzRMaEhilqeP0yTemicIzJ0URnN
 wgwkvRdsBx3kxYKkiQ3s1OSx/KfUXHO0+Xmx3ndGS9iJmP79m5ufXz8HUQ2Ub00W
 utwmBv2RzHjZgjgiMd5RCs6cqzRxOjqk5hXRjudiGAvfOIbVX0qt2YZcC9oQMO2v
 9+Hv7SD7QbmaWyHwArB7ep33Xqu/dZeSn9oXyKrAdEkpPo9XCq4hXo8CnuFfgmxv
 uMgRHDw2kKWIeGc4ZqWfh6Jq7uvvmyRZVqdCzGAbnhDvHI9MTNHrEvRNi3RJd89e
 oyPv6e9Jpsmz/SO/UIj+MdQ3i6R/4KwFA2hPNrFgeNvUYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by959fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:55:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f818eea9so1354741cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537715; x=1758142515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u053Z73zkai4Xa8yTebTvs2PY20porEuaLkDE+bAlMY=;
 b=oOTB0PVeWtGxJfmFaJMBxThbSYFbXgFEh4jfvj+b5y9n6a7z+kZ3uLn+0hUATiJSFZ
 NDTd1qvQj8npFiLeIOzCHUXRtyHvlwML5PwcF3wVIih9MN3Dn3R/j16J/Xe/SEYyJ4zA
 uO5FWNO/1MdKIGB9Vv2w7Nd3d/S7Weo7ncYa4arHClWgPK6eDRB5Z4NAnt5pDdRgsq/M
 eY1Vxyn8S9CAymNXsSOgr4AF/FFkMjSzu2/oiWooYQ7KhnPrTzk3wQaKmcXMiiD6j1HQ
 iMwhg5O97kMsXXOCUfal9eo8QT3h8YbewnGw4VlJJshAoNHkQ4ysUHBFSHBEO9TpcVL+
 U2Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqPepzTqLjtjKpdvS0K7LPZajWW3tHuqM6w16CUntD/hAr3AdSTU/ZfTW2NSep6kSS5RX+kIr5U0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ5e/8vyUyORP92OIs2woVMpr79Qt+qoK8Di8B3sbJ98gXiv/E
 6OEQjvGGqaqsseaEZ4FftgG4luGIzxwOpi/USAXlbMIFhvF0NQOO4KvmUObXYlh1xlL8ZJjX4U6
 kVQIiuDUemJm98FiEmcQImCyCl6S0hZJYMik/YhHXd9VqsRL8hI9i5BJb6jpK1GL+bejL52s=
X-Gm-Gg: ASbGncsuZZ+hVTU8MQm7t/KvlrVB2Pt7ytfMNNFTCGef4ApiVasQ5STkkuaay7ncABT
 2a5nTTkPUWCzGCweqBh1Q1WjRy9e4LGgLrKJ8WqdtflrqfwVKvS03+h0tEzhWl/e+Nd9mdiS39B
 KoVuYmGxm2iute3bnGosb0GmXZ/7zQ6NRIyjVzjzlMhaCWUFSmYLsCNBvW/Je9SMtFEVCW0/3Eg
 NnpgAv+DztfTdnAszwwTicmLMbMKY8DunQjLWgYWzsXCrE5p44U9rn8b2z5pPHxNzhNeTUOiGb2
 X6G8CSrMpEMc6nLn2GcM7uovyw3FWAV4aiQP1hLjMMVYNfiQyAUF8PWZU7RCBnIqHoubw+zmJIT
 vxHDIqfI0njCVxV8Mk2/UK3XKEdAZxyhoOQSb62oWzG2E+nOUf+JR
X-Received: by 2002:a05:622a:17c3:b0:4b5:e606:dc0d with SMTP id
 d75a77b69052e-4b5f8464f56mr172407881cf.64.1757537714487; 
 Wed, 10 Sep 2025 13:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuuiI0Sq3dAwccCIQjFGmfMsKB4O9JNHlu6WabCdhUocfd0ddszBa/a1EYJO1myy3iU8qHCg==
X-Received: by 2002:a05:622a:17c3:b0:4b5:e606:dc0d with SMTP id
 d75a77b69052e-4b5f8464f56mr172407211cf.64.1757537713811; 
 Wed, 10 Sep 2025 13:55:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50332cdsm47364151fa.36.2025.09.10.13.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:55:13 -0700 (PDT)
Date: Wed, 10 Sep 2025 23:55:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
Message-ID: <7vs4f2cofte5jkvoh2dzd6hm7pwqaiz4holt7fosjo5uwsavrb@oigtd3lozmgt>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c1e5b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ui4H84HzkJsvguT1G-cA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: sW9rj46rmWXlvCI1Rxc9WxuPz-Cfy--6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/ppRhxKnYVQT
 pKfsUTL54vflwcdmQXmeuQztTJ5jnbjvsZ/hj8JgVKXDrKleoaxfdj77x42s0WFOEXbKfCn5mqJ
 nNqYEMpgupjnL8+wq2IWYwzrx7KaDjwisnn1+d8U71G1uX2jfA/4lf3tiZ/r9rN1fdfaiic67v4
 YZ67Wv30MMstT9adrOjsWx+Skp4KDFAI5Po1/Q+vSJC419bQ3ik7cwcYdPLDImIQ4HgLXZBJsqD
 +tlbydhMBTro0TvD6WZDYglgvXdGpspSdwVRwdYyjfcrZniWUW4imDqTUTUbVEiaGzTAWzqITzs
 4so9sPI7w72gfgCi3T6dFTVijCQsUdepA3sJ5aFlCLN8C+xJjIAWxFtNoYGds+jFW7r9OoGoN45
 6OV8re9c
X-Proofpoint-ORIG-GUID: sW9rj46rmWXlvCI1Rxc9WxuPz-Cfy--6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Thu, Sep 11, 2025 at 02:14:03AM +0530, Akhil P Oommen wrote:
> A few changes and fixes that were lying in my stack.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Wink-wink

> - Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (4):
>       drm/msm: Fix bootup splat with separate_gpu_drm modparam
>       drm/msm/a6xx: Fix GMU firmware parser
>       drm/msm/adreno: Add a modparam to skip GPU
>       drm/msm/a6xx: Add a comment to acd_probe()
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c              |  1 +
>  include/drm/drm_drv.h                      |  3 ++-
>  4 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
> change-id: 20250901-assorted-sept-1-5556f15236b8
> 
> Best regards,
> -- 
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
