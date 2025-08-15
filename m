Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8893B282BA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 17:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5B010E984;
	Fri, 15 Aug 2025 15:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDAEzWqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C981D10E984
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:12:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIlkP027630
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pQvr31n7tCN4up3plvWxhLIp
 NLbMAvSecLvMsmNHzoU=; b=VDAEzWqTc4aFHjJtTA1K5Zt2si0qDygIFr/4dxTP
 IWwjvYBCfdCNH37BiXHc+LD/K1mNnYDBYAtOSN7m7ma2vk870zXvcZ82ISSXlFbA
 fEKtuGYvVeyN8C+FfMvAMnOfJEG20elPyeR9a/186AQygXkSCffm444FxDXNXSRB
 bKBUIWasIpVNFWwpqIce/hR7+TUm1Y50Lcxu0UpXi1dX1E3aQmVpmrt1ZetxernR
 NDGqOTre6eoxeO/TpMtq5KgNh0jV5HfuOo1d4ILrZVCQpcnSYv551OoEOBmguWBh
 pAQUwd+/FpOFL3zmSIi5kUE7FfmZEgmqpRaz1KE1FnaGTw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjy6t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:12:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-50f861c6218so275075137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755270721; x=1755875521;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQvr31n7tCN4up3plvWxhLIpNLbMAvSecLvMsmNHzoU=;
 b=EwSaqpbXmNUz7pZpRoSGBHscirz9I/0F4Q6iCN3lohvlAMA7cu3L3Dc3rrpI6ncDJ2
 weLYJhXhLrTLurt22vynsDpcYuKPtAB1OguAWi7EjTF7xh9wo+UeN8K/k97Wa/UmmITN
 Dnf6oqrWaAVyWmxktlaWqPSL0RGWKhgy4VChr9ghMqzhnS+ZKu1EZVEYbnjxGmP9IbtU
 RYTrbEsMQP7PB0HE6P6j/LLdIusaMS8ijz+HE1Rsytba47SkJ6E5+gYBUmSKRcBQnSuF
 IM9G4LqjTAXElpZSkCcctObyb5QopKHMpPAKfwJXJD4IZhNJWr7VZMbKW/t+nuYsIlOF
 jo4w==
X-Gm-Message-State: AOJu0YzRBjcQ9hwrU1RG2nxuheHQ2FYsHnzcLtBL5mIjzwJXUVxDgvJb
 Gu5/secWZXT97wqnvMfYnkFowCpxp7STeCxP43hIuClFEaFjlaAACHuai2HS0KoASYBUVsK3dgx
 qU5n64ZSBL1LTEpQx8vn9Q8oBjuBSX/sgXjYYJx3ODelTAvtAOrTg2mZ6tXxc9GOZYYSjE7o=
X-Gm-Gg: ASbGnct6Eb4FTHZFgbmef06IPNJjYKWpi1m8XcepWOXy0+NPMNT59kOTfB86vCxMMh4
 lgUvISl+kwHp1ywDxqd08PFWtmvXKIE6nWqjuwfLDEdn4cw2cm92OCBBNo1yQwl0+VazzxIuyoM
 4zTuVeFAloz0EAsn40Tpu6xJ2x7yShocI7Am4XqugI9sOrqzYtJ40jroKKbc1zL5fIjE4Lo7HNe
 hH9lvbTfuDwhah3frgGXRzVkWzEWQexv0nxvk7OayjhhlEaaNQOX+eR68Mk5GOiN0OX7P+TppAa
 T0W80+4LHkZgzB00JMH9UKf3Mf8pTrIXh6TOt4QSz5KP32kjqTR8HmBWc9oXBTBncLjln7dYMqa
 8SLbXVHPBQAUKWFuZQAYIXuAFEePjV5dYj8HUOuX2PNfIQoh1ZOvR
X-Received: by 2002:a05:6102:6891:b0:4ec:c548:f953 with SMTP id
 ada2fe7eead31-5126cd3887fmr843547137.17.1755270721026; 
 Fri, 15 Aug 2025 08:12:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2tJ+kEbGySiNX8BGOfeA9aiGUSDtWwX7qz7beS8LBiMUWDN+aqqPSPCUpy9yJVSNdquHzkg==
X-Received: by 2002:a05:6102:6891:b0:4ec:c548:f953 with SMTP id
 ada2fe7eead31-5126cd3887fmr843472137.17.1755270720456; 
 Fri, 15 Aug 2025 08:12:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3e91sm325962e87.124.2025.08.15.08.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 08:11:59 -0700 (PDT)
Date: Fri, 15 Aug 2025 18:11:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <pz5luqbagulactqp7h237apoostl64rcrnvmu53eauvtb6cqly@nsmzsvbfixrr>
References: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX5OSV7AiIU6or
 FmUT1kGog/jW/r4WLPsZCsU1g8tM+gO8DcpJu7UhqdiqpPB6bgtL6lxrFNgKlvfTUr+zlE21gNH
 gE9HyqW04vN4y0aZIekYzDjq1Vrf98Je+fNDL1KYUp9G5DQoH+HdwhDlHpTG57UY138xj+TSFFk
 HX3oItnPNM9p8VFgreBaXmU2VSdv8aeV4Pydi+fEMlWX8LN+9qI4F2/s4rmZZXEWXeG3bNgh6Fb
 0hnNMLBDrU+cuikKgjrfQLGgEFIw4Ae2wpi6uvOTRODZ3TH6jge8/uv3/cmg4bUPKFhTQy2bukE
 GlcMlpLr9L0NXZC++yNkqbWKgROjutQ5DdtByBq9y0Ts9bmyNiFPhBKOGeSyoebc0fMHxq/Bs4u
 CvZC6+gP
X-Proofpoint-GUID: t5it9EqLFtfLSxCDPU7-3VepGcpMKz81
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689f4e41 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=EEIU--A85-CMqN2ZW2gA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: t5it9EqLFtfLSxCDPU7-3VepGcpMKz81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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

On Sat, Jul 05, 2025 at 01:05:13PM +0300, Dmitry Baryshkov wrote:
> Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is a part of the HDMI CEC rework, posting separately to let it be
> tested by the maintainers.
> ---
> Changes in v7:
> - Dropped all applied patches, keeping just VC4
> - Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com
> 

Can I please get Tested-by for this patch? It has been R-B'ed, but I
totally don't think it should be applied without testing on the actual
hardware...

-- 
With best wishes
Dmitry
