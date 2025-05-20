Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B524ABE474
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43FF10E5BA;
	Tue, 20 May 2025 20:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo+n/FMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA27810E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:07:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGfbW5004263
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4+TilPmXDGw/Gtk0BqOASle1
 /UOmT/X4bq+tNDck6q8=; b=Zo+n/FMszjKFBUWpEfP52eZJPyhg4y7h1VjyQptn
 9X1oEHTRtb/0U2ZF5HaCpX3xq4i0JAX1yB5ZmxqXyKSBliCiigqjulOhXff3qJcc
 /JdtG9DuzWUM2DYKZR5aRquMgfE+Rzow5zwtpHbN8llRmKPpqJ4INUe6k+CmWabu
 YEkNKSuTQsIp7oLRHDO3DBSS5kPpQTAP2gLg8K6avYEhLg86cQQc0jddhdm+vL0o
 qz4L76TeOq9SjQ6V/NsS5wiGmqHuHCvc24JhdSEHwIYWEc8jc19EeM5zFj9+dHnh
 WevVPQU6n/7qtHLVAryGlXgb4E2z5572+nZcaEzo6x+izQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6rgwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:07:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-8782db80711so4195967241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747771626; x=1748376426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+TilPmXDGw/Gtk0BqOASle1/UOmT/X4bq+tNDck6q8=;
 b=tOTAQnlFwuvipFgWmLzJduqV4r1FeaP/m7wJXt1d6dcag9i4AtVdZ+ofDmr/NG+1cM
 8yLG+KsFC9H1V2AokcylovsI+Wl0qQPntm7arhTbZ3qKEWJATUusI1WTNIanvoH8IRkm
 vloX6fGIInjelA+5EB1XiDookSNzBVXmNDNQHmf5RK1+uKI1Ojeoz2h+Ebt26CwbFTb3
 d8F0d90LXeqJPNquBxWyMmOEPnESejKuPkIAHg9XN87MGkJ+8zI9X0EYYd/rjrBvYdUN
 yK0MOloBjVuGxInhESOOlceF88+uq98tNJfTwEP7Rc8cF1qJ2bBVdsF3jZsRCHYKVOpq
 5f/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0VlpMn38xSQnI/QDZK+kCnPY3EmnjYOd+DYCk3T7nR/P5U9eDuObfj64pAe+X2vjE0eRTk4hn3Xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM1hn4Ay/Ox5XqiL3OLEH8q4YuTkqlw8pCn3GNm05hFkBfFUQK
 ff82GC2HSw2lb461697JCOMga6aAj83vCIKTdaPYhgWQeve6KAqL2t0Y5DqvA0jW5+BCqNHoYU+
 8Cmc2LrP83E3zNYBT8gerR/ebxaL4HXWPuRIb+jZ2PvfgTg15JcqHRqFdgtSY8NCAadP2oTId5L
 zobiLVUw==
X-Gm-Gg: ASbGnct3KX52NSUoWbmBBPMtv5QKpv5+R+NBAACpumvVgpYNLhDwjpUc87g7Elxv8UA
 AOG7PiweIPYAvVKpLknC4r6o3+zvyfS9i8Yytygwj4ay4Hsm7I/h9M7rAa3NytcSu0QTfROus88
 NX4+sYdSguV5wIO5W6KjEj0c/pHxyMFWmtvY1VjaUXe9oN+yei6zBEAIMEVUpiWIKnoYllc1b9W
 9s/ZkOi8L5hSE8cL48MxQgpRRDEXWvH2Yp+IsuMPWoZpSt0ufkjtrulEVuhbCawY/7H8eJMSyLK
 c+ayKQuzuQZjb1Dz6IbdTbCxqOwSWAiS4iyDnZyIQ4NpdEVPkfVR4YVhugCSt/XGjbK5jUoEYso
 =
X-Received: by 2002:a05:6102:1628:b0:4da:e629:5c6a with SMTP id
 ada2fe7eead31-4dfa6aae329mr16623238137.5.1747771625647; 
 Tue, 20 May 2025 13:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ0ooob77YB33x3sc9TZXU71R5l2H/nFxJ6YO2AEHokNTU7hQE0QXzh10z0MZ3u3nyRxcaMg==
X-Received: by 2002:a05:6214:1251:b0:6e6:6964:ca77 with SMTP id
 6a1803df08f44-6f8b09023b4mr282754806d6.28.1747771614002; 
 Tue, 20 May 2025 13:06:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017f18sm2485042e87.158.2025.05.20.13.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:06:53 -0700 (PDT)
Date: Tue, 20 May 2025 23:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: 6KWeukH7Bt8uPmD101B3cDeqGeFz2jDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX1FOwYCHtgPsi
 jEqaKGqLtHjjaJOQpw9hF/mG+IDAAAHlDRVOOA/W7BO2rVa6N9pPnpnp5cgoixqkCwQR7NbFJaY
 SrPzrDZ36siIuJbIjD9XNdTUcFrYGXH42W+lEWNwwwFKcnHOc9Bt1RlwJOFgUE4PkkAWvjEKPXU
 PwSsxcoazts1370euVZoAzmY9Edg/9zK1/kYj1PvB7YVr1hfPM6blqu9LzyECSjP83mfuc0vijm
 +4Pm/Rr2viR8cnChGhuhlJr21dNycfldaWOZp2uNmOtAraaJoAU259Ps/apZPqNTfNfJviPLnH5
 SAi9oYw/9Pc6KDoRB2jB1lWIO8iwqfORMK8MXdE3yoQEkgsvFesVQi93zw85TEKRIhJTWUlKswK
 ht/GspSu9xqtas3fwT5Ra2Kz8wnF6bAy8FA3OVKc779o3aJ6p2bDEbY0ot6NNJHE+MnGCeK6
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682ce0eb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qeqVY09uaiYIOShEJ-EA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6KWeukH7Bt8uPmD101B3cDeqGeFz2jDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200162
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

On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_10nm_pll_restore_state().
> 
> Restoring calls dsi_pll_10nm_vco_set_rate() with
> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fixes?

> 
> ---
> 
> Not tested on hardware.
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 9812b4d69197..af2e30f3f842 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
>  	/* TODO: Remove this when we have proper display handover support */
>  	msm_dsi_phy_pll_save_state(phy);
>  
> +	/*
> +	 * Store also proper vco_current_rate, because its value will be used in
> +	 * dsi_10nm_pll_restore_state().
> +	 */
> +	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
> +		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
> +
>  	return 0;
>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
