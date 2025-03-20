Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CEA6A785
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7A10E220;
	Thu, 20 Mar 2025 13:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lukhED5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D29110E220
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:47:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Ywkx019473
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=H46YjlJ+DKNbZ9xM2pIFspK1
 JAsXXejbR8ZjS3i17Z8=; b=lukhED5F0KZKKAV2SkH2ffNFwBb9021GOW8QV+En
 6wvLoAWXUWernsz0frUDtYTrLM5tYbNWO9vsVlKGj4bKDxJLcnPSCzhCKJJ/m++v
 xQ5gKFSOBf51LVpT9eWq0QFg15ZHOMlt3iwBJzZ4Lr4ZVNHPx4jih2ThlphsXf/b
 1m7TsDxc8JgG43ZT+UQcyawBA6X5V8TMW8MJVHbrA59G7oUWos2dceF1U2X4RXkl
 3NdujAdOKUd60YAYPXGUj45AawS66AgrebLEAYfGCF1T4LVKT4opbxHsCN0q1GX7
 9s58ZuEmqbVqoUflFkw8M1BjgIMrLakiZHx7dm/UpxK0GA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf2qqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:47:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54e9f6e00so341409685a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 06:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742478442; x=1743083242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H46YjlJ+DKNbZ9xM2pIFspK1JAsXXejbR8ZjS3i17Z8=;
 b=t/ssHo5fJrw9me7XcSTIaMfZlAEEp0KWAJ3dX8J7c8c9PJ7UQjnTTi85YxHUr4ygqu
 W15LKcPYaIhSNZ/fKYZqDmloRDRL1A9bm8vbeEMyOo5YTnrjFKHqQfnHfuuO5tff/R6C
 8VaIO0gc0fgTVdugoiP0Q/RsA1lEZ5PyFpvX+f6AGRjx7pePemlCGI9nFgeEJoC0dyJ0
 R4gzjP3k99tZnzBHAHPc2UtxPrWO8QLEXp1Ku42OoC8uPeVlXAJEqFgWPEsc/Cem7mZ9
 fmWUhJnxH0bxzHomfsVOacjaXlRYvIiY7GK0dRSTCc4zFYYqHaKtVs6d4nDRS0FHCD4O
 xYGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr1cpvAzhVcq1/7ixXnvcDu1rLTvSFrq8mMnFw9e9f4dhqGsP97aoUJjtfVYuwhdEFfUVcDn4z2XE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL4OuaFB0jPTjikhMBCmnuAJk3m0XzM9dAOU7PgFZZ5dxO6Nbk
 +Tq++vXbNqZgptGg5tJkcBZJq0+Ms+ulCJ8NWGrBoqShRnkPxUJnPXKoTeeKYWYrAyWxZck5oxJ
 udD5wNfafqO7VrTZBFgXZP/IHRAw18new+h7hOXeQq9DO7kqneUqWQ3ei8Ey0VY5WkEs=
X-Gm-Gg: ASbGnctJuaIh9dSlTKLkxlwXWx9E/70OcgrkadFUZTu3XW2ToP4NiKvvGydM3WeLQnH
 o9swnlePuEgBkcWcKddhANjN7LT9DohOnt+eVMY9YkZBe4LOcmTUGmsQUCG4BONgyfvzXJoZ0hv
 SZSwlA8vXYOQIUCHOiaCYaTrbvUIsvAmc0mf4FhxG8TXtrpFk7vrdQGQa+FBpzUcINj1yKipbuW
 P1vu0FyUA+dAbQTCpTHuGuxHHfSJrnPqyHZstjmX4aujHQu9STNeQfJTg8MlYOGDJLIk7mOPj1p
 ZE/171Huivf+VQd2dFeuwNDaQaa5k0uVPeT2XzCLsSIEB/NQg3YSytlBknXi7NnSAWJ0LKEo7Bi
 QINs=
X-Received: by 2002:a05:620a:390c:b0:7c0:a1c8:1db3 with SMTP id
 af79cd13be357-7c5b0505f09mr573402785a.11.1742478442376; 
 Thu, 20 Mar 2025 06:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiCaluWBGrZz7qLZC7V9RGm2GJ3/lRrFDVv6gAtZkmBos91xCgxre1lxltkWev26yl+SzymA==
X-Received: by 2002:a05:620a:390c:b0:7c0:a1c8:1db3 with SMTP id
 af79cd13be357-7c5b0505f09mr573399685a.11.1742478441975; 
 Thu, 20 Mar 2025 06:47:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a9c0bsm2281794e87.3.2025.03.20.06.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 06:47:20 -0700 (PDT)
Date: Thu, 20 Mar 2025 15:47:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon
 (OLED)
Message-ID: <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz>
References: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
X-Proofpoint-GUID: V6yiJgmsf2lL9BMd74ttu19zLqpGwxXF
X-Proofpoint-ORIG-GUID: V6yiJgmsf2lL9BMd74ttu19zLqpGwxXF
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dc1c6b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=Ues91wDlHQgiS4Cx53AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200085
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

On Thu, Mar 20, 2025 at 12:47:09PM +0000, Christopher Obbard wrote:
> The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
> panel. The kernel currently prints a warning due to not having the
> correct timings.
> 
> This panel appears to work with the default conservative timings,
> so add the OLED panel to the list of supported panels with default
> timings.

Are you sure that this panel can be handled by panel-edp.c correctly and
it doesn't require a workaround implemented in
panel-samsung-atna33xc20.c?

> 
> The raw EDID is:
> 
> 00 ff ff ff ff ff ff 00 4c 83 9f 41 00 00 00 00
> 00 21 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
> 0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ca fe 40 64 b0 08 18 70 20 08
> 88 00 2e bd 10 00 00 1b ca fe 40 64 b0 08 38 77
> 08 20 88 00 2e bd 10 00 00 1b 00 00 00 fe 00 53
> 44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 41 54 4e 41 34 30 59 4b 32 30 2d 30 20 01 cf
> 02 03 0f 00 e3 05 80 00 e6 06 05 01 74 60 07 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b7
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 52028c8f8988d4b771bd2604256aea4cde4f4020..56eb57c8023fbbb5ba39f5fdbfa8e577400f751a 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2008,6 +2008,8 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>  	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
>  
> +	EDP_PANEL_ENTRY('S', 'D', 'C', 0x419f, &delay_200_500_e200, "ATNA40YK20-0"),
> +
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
> 
> ---
> base-commit: 707bd8cceaac1af31d3eeeee166687bdde580fd3
> change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
> 
> Best regards,
> -- 
> Christopher Obbard <christopher.obbard@linaro.org>
> 

-- 
With best wishes
Dmitry
