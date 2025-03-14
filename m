Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C62A6087C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 06:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004AC10E2E5;
	Fri, 14 Mar 2025 05:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6DpXujv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960C310E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DHJV3W021900
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OzkavVZsstBwDQHn8F4CFckg
 sxXPOJSOGMUrxeWpvZo=; b=o6DpXujvXX6DCL7ULw95qPF98u+bxG5/1nBkGzR0
 uH5dmB3Be7QrR8GibF524afbJf76TNPEExcFO8Vig+qEEXLHzC+s5cHwM3wB+q3X
 DXBlo6msggxN58907+IoXTjUK4OyCAW66LT3gBDQw/Qt9Q83ov4B+Aet9d3smYFf
 K09EcqwJciQ9YMPbJBbblkOYdLZgdFL7mNM7/yADftD5ObiwQeNKCrFTzKJ93aSm
 oEDBMfwjnnkPVnPltVG4Frqq/ATZzMCdMYQa3kbHUy/iHQJAl/PsrmRd1Wk2itaG
 swyQspbag4LSzoNWP/HUBGxcrb3ewkySeVLl+h9blWAVAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07k5g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e6bb677312so27219966d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741931452; x=1742536252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzkavVZsstBwDQHn8F4CFckgsxXPOJSOGMUrxeWpvZo=;
 b=o9ZzOni8sp8h+vRyajeYXeeB50s1/zYbFYkU+O7XeqonMqpCHnqooNigubt/2sPWyj
 XZOFMe0ATrGueqojCsNK2lE217fWpV7DWtJdvFNX81TeC7MHqIO+vOAFEhE5IZprQTGT
 s7rZYHYLubhGq1PcuMpAiYdbKl/M2UycmnATu9ZmtB0Fe3WH8loEevjPehrIRD2aXNGX
 czFwEkY6cfR80dM7T/LJoHdIL6jkmBX3P3GfmHi1ni97KPPs2LnVnEj5NkqfXhZKNpaT
 lPT1hXUABZrimFpP6wefzAps/BzzPHLWX3sOWxac+8GzVkzl9J0hhGPVCQxhJ6MV4Dtt
 d3dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFRK04Lt8DSqxGoEe0EparHZymNSxnc+z7IqhkAAD3+qSBPiBSBYjB/9+jQDa1JPccIYBjCHvRGac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9M6Wmch1iQbxW+DHv7gO+zkalNNsMect0ywzZskJl18FJH1hk
 7NKFCTneRz5ywQiA3yeGEaT2m3nnGSIaRME+yU00iYWHgE1IbEYjjd5p8kS4MkmtH3Zn2S1dLAz
 HtwZcfWJsvlcHYHdaaxfPwwURO6PJ9FUjZRfLV1jd/qdaW/GUOnTPWdaAWJ/QaQY01oA=
X-Gm-Gg: ASbGncu6Fq8vIx7G8Gx584unxsDQeBjUp81JbncWOVVDtiIAJiQUuVAD5WwKyN0EH8T
 eUo1zs5wCAwnuF6QEE7TW6iGLRQxUQmcU4029LBOmE6Fv6QZv4Q4tj+zAsZf6AP0zLg5vktf86E
 MlzV+/YCVM4M05695LDwJ0XOGKk97PvbvzhDdoYM2NqlWxCxy5IVIMrRPqWRCVc8sxxC5xYPnDt
 BrM/ACQV3H+4cqjs+Hrovx/nejlotLvMwSkHynAT4bs0j/4DK+ofZD9oq9s9B15004m9NiecGwq
 qj+5iEiyHQ5w584HBqZGDMEKa+suPc4MH44glNF5DVErpJpdnNJuqlzuKUjTqfAmxjhVWNcTjO2
 FUCo=
X-Received: by 2002:ad4:5aae:0:b0:6ea:d69c:a22e with SMTP id
 6a1803df08f44-6eaeaae36f5mr14293366d6.30.1741931451825; 
 Thu, 13 Mar 2025 22:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfFi+RIJi85UCumWdBfV3/KZOuBVYrqq0wIh32Nic+7e+RF3GDbnXddiHGTfQszo36Y4MhZQ==
X-Received: by 2002:ad4:5aae:0:b0:6ea:d69c:a22e with SMTP id
 6a1803df08f44-6eaeaae36f5mr14293216d6.30.1741931451521; 
 Thu, 13 Mar 2025 22:50:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1dbf8esm4532231fa.102.2025.03.13.22.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:50:49 -0700 (PDT)
Date: Fri, 14 Mar 2025 07:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 4/5] drm/bridge: anx78xx: Switch to common helpers to
 power up/down dp link
Message-ID: <7izwo6p2pyxmbwj3mqkccw6qgczqkfco5a7ldxtyvn26w7gw5v@okuvpnctiagu>
References: <20250314033856.538352-1-andyshrk@163.com>
 <20250314033856.538352-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314033856.538352-4-andyshrk@163.com>
X-Proofpoint-GUID: gKoTnmeWmz2cXtvIhrjcJpts31BvKVkV
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d3c3bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=GH56pXrWIHJkkU-sqzUA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: gKoTnmeWmz2cXtvIhrjcJpts31BvKVkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=883
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140044
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

On Fri, Mar 14, 2025 at 11:38:43AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Use the common dp link power up/down helpers to avoid duplicating code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../drm/bridge/analogix/analogix-anx78xx.c    | 30 +------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
