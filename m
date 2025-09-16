Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BD6B59448
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96A010E787;
	Tue, 16 Sep 2025 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7B0bIps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C9710E777
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:51:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABuHW020444
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2FWNiMd69SOkpVvXV5XEQpKz
 vB2oZ4Z/GeoK8cF0vYc=; b=b7B0bIpsG/JCcvNB2e1mtJylW/6MvvYxPj8AdmLC
 ieflZFyo1A83dp43fAOjOyV5DvEXR0mRAs99zMGkPdhJcwzcO8iRPBGEw1b9BVmu
 C22vowFK6Ndu46h1AxG68eC0QfHDvDxKgPHlAnU2Y4/I2Ec0m9Cg4Q5Xy4g7ZYfi
 yPWCq+cLnISH2WA8olDxyROzISdm0SVfqY9iJIzKz688waklo4GcAtPd7IncfugF
 3F4ycxVBMea/B3xLS3UCL2+XdL5/lf3WxSSjjD93m0V0W3wZefv31Zk9uMdtyarA
 swQBL8nFyrcP8EOPCc0a1R35Ym9IUrCQLv2S7phXS3AFaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm360-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:51:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b7ad72bc9dso33302901cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019867; x=1758624667;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FWNiMd69SOkpVvXV5XEQpKzvB2oZ4Z/GeoK8cF0vYc=;
 b=hwRTiIGcIqqjpq6OhXc6SJdyMsp1sSF5n9wixhfpnKxLrX5Dsr/zrsfzxYIPdlMGji
 c4qXTI+zABrN8lKf3VvOqvfCzQ9Koq7OyCj29sCF3gSK27SZv6YJ9jBgKeL/1tgbeYA0
 wFb1+XhjUNsiHlH//n4cwh9IxW5JmbFXSNMnuHvU1vpt1IPDvJx3EywllK8jqelx4x3F
 tlEe9ppbuS/7e60hkvZNXGLBzCchLS2X0/CqNMfID0eFLuquxJtjtMxhCPH6yNqQNkD1
 mx+uIdHQ9Ej/5Nl53kmCuyQOurxTE5DqLQEcI6lW/ek5qdm5zyPo/JbgzMCddIlAihca
 Rd+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFAcfSwhhqGmxu0bcF+6q6zipjIDuW2YWWB7mL6vIi0jFuRBCLjAVUV9Yb2VYBYOeUjXbGe0gGK7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdmkl/EGeB89Gk86XdOSExFSQTJ1k364BXfbaT5i2xMuGCphay
 jKyxLdxZkMLEfD3R+gBuNlLSUDaEQ5PyxEh0cgfzx5CEjJm4FMukQDbTuDh7HvxU/utTVmG4+Hc
 qaOwFaDYEij+PdErwBwchJ3RrsEP4uamoav9YrhBY6ujXEt57k7TVVc5Unl7JXM6jpLq6GPk=
X-Gm-Gg: ASbGnctHT+Fckuhqup1GV4xqggvvRH0Xh+knzK+4Kzi2ARJp142C/9OanBR76uo3oPj
 shBeI+gPhvbRj3i1N9JYcD8s/FvtqL394jf7l/L7c4hTHaIeQXnG0XHcFbH/n1iJCBehsq7ZkFv
 pNQ2O+4HhptUIgzEz4wIRub0llW0DmNwjRE5HUQqrYUgTabx0mHatcVqts2cWcugHUJb47C54kt
 ygLAjMHm64qpYpa8bkgEuI9sX0RfBLeSESuWdVAvLwbgGk+lf8Fkpdr0nOcfjazZC1jLoAE4gqR
 WPSdUsC1r11FXn47XPwN70w4jW0TPfO8PPt5FS4Eb28ts6YkGnFhGjGnjcsDS9+h4pdln5JX15j
 fu3pQDQYeULtrVOMiRw+2mvWdPsGUBjwgPf0SdwHFVCHzQvVSsmG1
X-Received: by 2002:a05:622a:2617:b0:4b5:d70a:2245 with SMTP id
 d75a77b69052e-4b77d12aedamr217457161cf.77.1758019867421; 
 Tue, 16 Sep 2025 03:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLdtaBJl4Dq2wLZch+XJIZbmZ+n7DyR5fUUJ0r2GfTbCwlwe4XzrdpDgcxuCfKBDWHawqRQg==
X-Received: by 2002:a05:622a:2617:b0:4b5:d70a:2245 with SMTP id
 d75a77b69052e-4b77d12aedamr217456721cf.77.1758019866821; 
 Tue, 16 Sep 2025 03:51:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5dba7604sm4325333e87.59.2025.09.16.03.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:51:06 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:51:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
 Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH v2 2/3] drm: panel: Add LG SW49410 Panel
Message-ID: <tu26qvyzihyknyzjeu3ycz5fm5mddlvmw776tjbqy7qpguq7hk@unfyoqd65azd>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
 <20250915-judyln-panel-v2-2-01ab2199fea5@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-judyln-panel-v2-2-01ab2199fea5@postmarketos.org>
X-Proofpoint-ORIG-GUID: zurK_lSdyteY6gzXAme4F3VBix4CMiZN
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c9411c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=XYq36MTTh7cM02dhETgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: zurK_lSdyteY6gzXAme4F3VBix4CMiZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX1jh4wUUP5Vlh
 Mv8anaL2K59QtO6WmoGksHis/t5DFL+sZ5OtGQWdVJGc2ari8A+ilgBFxjbGZknAh6qx25f2oQg
 6BUZoDbl6Wm56Y88HW/aSbEJ5pyDTIBeD4+mAGR/SNhqnVhtWBShSf33Z5qoD3LSA/QRSGLGFwc
 1H0cJQ3cYtFgrYIou779jAiVdi7mk8Ac9dnaTZOSO4/CCaYOxFIxBHC3nFF1stftZ5VBWeInOt3
 p5JkwIwSBE9Yg0nIh8oJ0rbHNJkBj+TmRzSmP3ecaxYIJHnqijchhwsUR9mtG8dG03baXrJmM2K
 Z1Fc7USFUojhVSjtlneknOiqZ550RRfNvNAdhFS7J1B8ceFgb3+Xz/FDIxtL/SYiCQGANlDbrUY
 AM9umRoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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

On Mon, Sep 15, 2025 at 07:32:13PM -0700, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Added panel driver used by LG G7 ThinQ (judyln)
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Co-developed-by: Paul Sajna <sajattack@postmarketos.org>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  drivers/gpu/drm/panel/Kconfig            |  13 +
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lg-sw49410.c | 502 +++++++++++++++++++++++++++++++
>  3 files changed, 516 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
