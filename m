Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94982B4FF3C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EDB10E72F;
	Tue,  9 Sep 2025 14:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbFniPHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647510E72F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:23:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LgmX030651
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h2X4u/C0hT0ZnsZtZ5WLCYHT
 XPjaXvBzP3cbcDi/Cho=; b=YbFniPHIo9davfYh/UqJaVAPE3OtZ3Tmf1oVQHjl
 8XHy2m84sdYjmVEqBiN+4A/chC1w40DaU3jMIxVZAjmpEfoUCX1xEAB6k1kLq7Qa
 R3eLZB8jCXjDcaoGWeWHY4imbBdWc6a+bXjX3LtiWsMZvdjOVIo0t4DfZrVGqg8Y
 SiWlU928L5tuqx+8zu7MA9kmOeRTZ86zSG/yZLz+hBsoAKKDeTeVgizt4XnIkqT8
 eabIomDAS8PW64huugCjt0r//isipB0vOvPQO6AzdZshMnD1OrT5X0qtfOTwWfwX
 IHu2D0qeD4f59RMScc+eY0UD2+9d2/Vwo5/W0oaGsyu/0Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8k78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:23:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-729751964dcso110772496d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757427784; x=1758032584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2X4u/C0hT0ZnsZtZ5WLCYHTXPjaXvBzP3cbcDi/Cho=;
 b=GF5uw/e/0cBHBo86CpswZNRoXPmEgKgdPOKEm2YbOX4hTs7vcBCxON3FL1Fq/xxEVQ
 jpRCwRKBhGU87b+nUnN2OokH241hZgsiB5lrTaqW/myF4I7TqVfVscA2N4uuznmpG9pK
 LZfpWr4j/jBny9tQHPVlG+jWDwUZCTpLSAUhFy4CB5MhQgZjYdYoKEvkXNrNuZ87Niqp
 Qu4o7bNMEj2js8040w42LoVdsGgy7Sc/WG+ZB1W4+XELBk/iI2bdA1Q0AQRqECP3tKVc
 x30V4HQC7vxyfNdp2r1q3qw5mnlzuVbAYzikOad6+ocaNmaGxAMqK5I7psiAvqz8KIqo
 UwbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnI5JM0gr0TVqr+pVuDyh5FF8taAgnm+uoRD0f1juN1quVNa20K9uAZEniYI+E+NwaeiBjdeAEf4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyimhi3fDUF3bs8I1P7Mfs0g60U6kZXqtLbPkqj7CKxfdZ7sg4/
 P0SF/XHIg9/GlZ/XoVa83K5lrAly7HFYnxk0z6Pdjf7wKeSRPJ7kvUUvFWjvoK6u4h+33cbdjsz
 fSBlOykPca2YJVrDFyaLmMJlgoBSub+yHasj/ZSJGwPPva3vAkGxv/rdtgD9+/CdoEMvI31Zwgv
 MwlKI=
X-Gm-Gg: ASbGnctQi82K5xYH7L7ZhErsA6Mf+xbkixd+Yp6P6HXpB7JyT8jQZZim9BX49Rq5iH8
 /kMRJPoYmbRFeBvFEDHbQl59qXwNsOzfYWFF9A8Uzh901aszL+kXZQXRVIwDpaP6/U54EaFS8pS
 mw64JTg5CMVuR3gtjbNnM6rNaQZjlSsgl55dL59kIy53I9Z5T6gqPxEleWS0ufzEqaSvLTxkfcc
 /XxpsAWD7JoUMn5FzFbv7dAMRwLpQwfEogpCQ3ZfVeI3+uNYjbw18AqXiDYQDmH+sZWX/ibW+u0
 1Fnx0HI9hy/mP3+dUaN3dhtNAZkqSrT3ssXajiz4aSXpUo6ht6e+0/Kr2roEAmUrwiMIxhcg+17
 Oxh2gffGi8YO66slpbFG0Fdh/ttRuaApCFYABEqv446OwMPOeQ60Z
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id
 6a1803df08f44-73941de3724mr124936796d6.49.1757427783976; 
 Tue, 09 Sep 2025 07:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+8if6eNbTpzHKsyNkm+8kJ+WHyQl9Ap4iWvgtn+1Z4Nqh0b/WPPZlhr5A1An/PL5BbFnfIA==
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id
 6a1803df08f44-73941de3724mr124936256d6.49.1757427783207; 
 Tue, 09 Sep 2025 07:23:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c934besm39228031fa.24.2025.09.09.07.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:23:01 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
Message-ID: <xkzlobhynrw3ylelnzwh7u5chigtytizy6vyc7gp4un5du4lcb@nssqq3f5pv7s>
References: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX7sWch2Y/nPXG
 xTuSDb9WyWPBeM3+8dlHpg0d7neBQKENRuDartccU3tihTXwm54jZuyGmYLrhzOI+DNWyUMZrrU
 vxt3qhu8v99Cl5jAHhIEK1oraddAgRIojewuBcPyeiSa6Qd8HocZTfm36WfPlmbGCdW79jNWFJh
 VnpHd9PZARcYg0NsRwSSrkI4blUZ13fq7M8QGDomjZSDTIomHBt/wSV+ByXvH0CADnlWroWhKN7
 OsgUUxFk2LPD9Umq+ZHPaqnXFH32Pl/Cgk3SWF5RAIBCh5DmUPEIHqF5oMwI4DyDLyivRrqoyyb
 zJDmPUnrpR+hHUafXSL9+i47GeVet1eeVJvLX40XcsGfqUdwAYKHSw5VguY4C1vYPoOY4W8h3h3
 xsUNL3cy
X-Proofpoint-ORIG-GUID: p6pqm3jjwly3R2Q6ipVdUwTQP5hOxiXY
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c03849 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=p65op6kECmbMoyNqUPAA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: p6pqm3jjwly3R2Q6ipVdUwTQP5hOxiXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On Mon, Sep 08, 2025 at 11:49:51AM +0200, Krzysztof Kozlowski wrote:
> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
> were called on unprepared PLL, driver read values of zero leading to all
> sort of further troubles, like failing to set pixel and byte clock
> rates.
> 
> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
> corresponding dsi_pll_disable_pll_bias()) which are called through the
> code, including from PLL .prepare() and .unprepare() callbacks.
> 
> The .set_rate() and .recalc_rate() can be called almost anytime from
> external users including times when PLL is or is not prepared, thus
> driver should not interfere with the prepare status.
> 
> Implement simple reference counting for the PLL bias, so
> set_rate/recalc_rate will not change the status of prepared PLL.
> 
> Issue of reading 0 in .recalc_rate() did not show up on existing
> devices, but only after re-ordering the code for SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Continuing changelog from "drm/msm: Add support for SM8750" where this
> was part of.
> 
> Changes in v7:
> - Rebase
> - I did not remove ndelay(250) as discussed with Dmitry, because:
>   1. Indeed the HPG does not mention any delay needed, unlike PHY 10 nm.
>   2. However downstream source code for PHY 3+4+5 nm has exactly these
>      delays. This could be copy-paste or could be intentional workaround
>      for some issue about which I have no clue. Timings are tricky and
>      I don't think I should be introducing changes without actually
>      knowing them.
> - Add Rb tags
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> Changes in v6:
> 1. Print error on pll bias enable/disable imbalance refcnt
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
