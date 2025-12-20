Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F1CD342C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 18:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DED810E30C;
	Sat, 20 Dec 2025 17:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwxzYt1m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NF7sCKsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1BF10E2CF
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:05:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBOpwO086543
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tE7IIBbTtFjvkImZs4r3P5wE
 RLLfG813si5ungSPtEE=; b=XwxzYt1mE4t4k9vQds7FpkAycB0XLAr1zCUNz1rF
 JIthdbI9c82fdcwYottbt63Kj697ohqVo0HfwzrvNTmGt7wGWDtw0oKH/Vplfmhf
 m2pHK28OEvf/zjB+KbYZ0yS/DavFA4kgN0QJQmx2jH2wOSOjSSR35UuUNW76d3QW
 nKimxDKdKm6eifDSqrSvIg9NzRoeDkn6feYnlUsXCee2hdQ4w9XB01dBlpY2zY6o
 HWkjC7RbG03b1laVkqnmbZdrKrPlDuxbtoJtzwxAgOyGisXnBRqKac0/P5omSoOi
 HA0u6WSwFyRVP4lDuV7N6gA/8+z7c9bLuqwmmHGorjtccQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mra8ytt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:05:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5df0adc95b4so4993994137.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766250339; x=1766855139;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tE7IIBbTtFjvkImZs4r3P5wERLLfG813si5ungSPtEE=;
 b=NF7sCKsCpl+ryTfIRruE4wNRWq2++9d+NFl6Eby8T18emLBvDv96YqGtst9CVh5m2f
 TJLkKmmSGWaho4tus3LJOjzKOtOc2YlldqrzyYibmHQ45SV9MYCghyfsR5gIpPwY0IRY
 yQtx8PaOWQM/Xvbt5vfCfePyK5meguUq3wog9WrEKXDQ2Vt6XV8YV+ZFXgIh4aLErJBx
 +ge1/RboasoRiZny5YkVa8uBSrHKERSxCX8UuhVenYaYBf42H4UbdviUphzvkSXv5UHX
 KzdWYVEgD98Pb8auQQXrtOBJ1dJ208J3mu/ePsToSgz0AMi3DNx4LKPHM2YRESJI/ggx
 s5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766250339; x=1766855139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tE7IIBbTtFjvkImZs4r3P5wERLLfG813si5ungSPtEE=;
 b=emz8huxWPFjOU7WEKLDEkIx0m0gQQWHXAFi9YlwjlTgt+bY9LATIPxp6WHZ8MRvPwy
 su5RtSVZ1+1dxtCLcNSIUTkRV4SkduzV8MF6/H0gLZiVPiIX3eQ7nr575rZGxVIaWbNp
 2RWLjJf06dpN6Hc5+1N9zpGtKmkaYTNqiXFlJDBNICA0thELo5930fXkon5MxtTtdl7g
 QuEaZAi1MwkYqE2kj23Ce4sduc6ZdYT9utuf3yJdPIkfuoj00txX7i7JxnNiUKHW2cNp
 WVid66vKrq0V6ShBPdN7PtvVs8qGKzCyk6s9olsL3jQlvQGy4AKTRDsPV43Cj6MecF8M
 ouzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPymgotU6G2zAhJUQh2olWMcDiRvTc8S6zpQpYwpoCeF+Whdwjwuxkh5A2I6IGsl6Bs6hvdSMN7Qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJnWpHEG4jD36Mx4ahBhQfclN3nrN3kEZcFVTaxbcQ4dM/SV41
 mEenc5VzP5Dspvc9ruID8KYN4M0ZnwWc5who4p4SrnOvoZgzMphzyGRpvotOHYwg5U/WUHT4UQg
 lthRe3wMtOYY0B6c0EV+xRzL1D1cMLCEAKOsP6ay1gJWgOph5e9jTvl8TzCVbZPv6Cvqfg6Y=
X-Gm-Gg: AY/fxX6v+RXhzb0Six3OVcmktXpz6pYh2611WVtMCV43eAZzDXWnxnkU2OtJEgAX9n7
 hY1cGMLXJq8i8Z5MkBdtaUjgGQMBI7v2JZgSfc2Dp+a1T3H3Kb+tNHEC2EL6gCYXZBSjv667KSp
 ybMpCC8vaztNVo8skkRdya5J6+KAev6brFqnR7Qqsnu9Ois08Z6H+0ml2HSa90MEWftABsCX4wk
 nkdLh93q3g+b1G4wwLNLgM3iH0qoNlBVeiV+zRArx0DDWoOErBO9Op6v5vFhQAraEiRyKOpaF07
 Z5zG6Mm60nNhRrIYPWvvoAxj3QFNNy1stNnnGPme19ODdoc4Re5TT40ZFIZPg8xClrKc0/CA12v
 jS1SbKcaJ+/qSiKsJLUVSntkjOrOPKttYYyfRcRUi+zrhYIqxT90b0gmBi2Ce4+taDkV+4C5CDo
 vcGBjpnide0SPhmqjwQ5c28O8=
X-Received: by 2002:a05:6102:2c07:b0:5db:f352:afbe with SMTP id
 ada2fe7eead31-5eb1a628602mr2176414137.6.1766250339058; 
 Sat, 20 Dec 2025 09:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyHZedOYxx+7940C9jGCMIGZYssBAKQO32fe2sN5azssAD/dadKKB494vBGqtXBoQPo0x+Yw==
X-Received: by 2002:a05:6102:2c07:b0:5db:f352:afbe with SMTP id
 ada2fe7eead31-5eb1a628602mr2176392137.6.1766250338615; 
 Sat, 20 Dec 2025 09:05:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b0d1sm11972901fa.24.2025.12.20.09.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 09:05:37 -0800 (PST)
Date: Sat, 20 Dec 2025 19:05:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Attempt to bring up display on Milos SoC
Message-ID: <qo7aqnnsguk6u3xuyrm56aw7r3sacmzjxb4tuquveurihzuhpi@3nrengxofekn>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
X-Proofpoint-ORIG-GUID: FYoaJDn9LWqVAVxfsuOF7uWJopZBtZwv
X-Proofpoint-GUID: FYoaJDn9LWqVAVxfsuOF7uWJopZBtZwv
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6946d763 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W6naqKN7AAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=xmEa5mADQUDEmEBAgy0A:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Xp8b5NkTPdl8jt_qJiRs:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0OSBTYWx0ZWRfXwf2NjQteKBn7
 bFV4qdLU0lAsCZ0z6Cc5Rn7VEwn1DhMR6e47zHKDnrStlRZwNG2rhmnrQQq4debY2zLy6H8yGFB
 NP9Gx3Jdxzvaw11LDTxgj4t0zjOc5RMswHRUa2bynX2uWfu+WNPwGiKgr12v3H9FflIRZylIR+P
 dFFWAVpf1cBPf2Fd1PDV/5Iv0XYUbFFw1B3H10Kjel1ziKNVi9E/m1KVlhgr14e1opzQwiVZBwB
 DxxAV0ad3P5aSM7H2CXTbpo8sxEIfBMTIXSBkc5F29Ekc9qW60px+v/bW4qtVK8Erw23/Ck2ikS
 pg6muRlLjZ+Wxoi8DivZUSDniRb9wZWbSo88DjoQx+vS+XzmfXaAHJoiR3ZzPIGBbjAIXfkAy0w
 aylTTtHX54KQPGfvod59H767Rcit+xMSBQDm+OEosTanKJ2JXDd8/oxRB5oX685f4WgpVOcl4H9
 JpDCv3jZvVQGKbTiQFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200149
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

On Fri, Dec 19, 2025 at 05:41:06PM +0100, Luca Weiss wrote:
> Hi all,
> 
> This is a very WIP RFC series that attempts to add display support for
> Milos, in particular on The Fairphone (Gen. 6) using the SM7635.
> 
> I have excluded sending panel driver and dt-bindings to reduce the patch
> count, since they should not be relevant for now.
> 
> The data in the patches is mostly derived from the downstream msm-6.1
> kernel for this SoC, named "volcano" downstream.
> 
> https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/display-devicetree/+/refs/heads/odm/rc/target/15/fp6/display/volcano-sde-common.dtsi
> 
> While I'm fairly sure a good chunk of the data is correct (marked "OK"),
> there's still many unknowns (marked "TODO" or similar) that you can
> see in the patches.
> 
> Unfortunately it doesn't work yet, with the screen staying dark and
> these errors appearing in dmesg repeatedly.
> 
> [    6.541696] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
> [    6.587091] [drm:_dpu_encoder_phys_cmd_wait_for_idle] *ERROR* id:33 pp:2 kickoff timeout 0 cnt 1 koff_cnt 1
> [    6.587387] [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:33 ret:-110 pp:2
> [    6.589509] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
> [    6.637482] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
> [    6.680077] [drm:dpu_encoder_phys_cmd_wait_for_commit_done] *ERROR* failed wait_for_idle: id:33 ret:-110 intf:1
> [    6.680356] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for commit done returned -110
> [    6.684517] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
> [    6.729507] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout

I guess, that it doesn't fulfill your needs, but I'd start with checking
that WB works (you can read the image back via modetest command and
verify it manually with imagemagick). Then if your platform has DP
support, it might be easier to get it enabled.

For the DSI CMD, I'd suggest checking the clocks and then getting IRQ
traces on the downstream kernel.

> 
> The panel is the BOE BJ631JHM-T71-D900 with a Novatek NT37705 driver IC,
> running in command mode (not video mode).
> 
> The vsync/TE pin should be configured correctly:
> 
> ~ # cat /sys/kernel/debug/pinctrl/f100000.pinctrl/pinmux-pins | grep GPIO_129
> pin 129 (GPIO_129): device ae94000.dsi.0 function mdp_vsync group gpio129
> 
> A full dmesg can be found at https://public.lucaweiss.eu/tmp/milos-mdss-log-2025-12-19.txt
> 
> Schematics of the device are also available if somebody wants to take a
> look, starting on page 109:
> https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf
> 
> Please let me know if you have any ideas what could be wrong and how to
> fix it. Thanks!
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (6):
>       soc: qcom: ubwc: Add config for Milos
>       drm/msm/dsi: add support for DSI-PHY on Milos
>       drm/msm: mdss: Add Milos support
>       drm/msm/dpu: Add Milos support
>       arm64: dts: qcom: milos: Add MDSS
>       arm64: dts: qcom: milos-fairphone-fp6: Enable panel
> 
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  71 +++++-
>  arch/arm64/boot/dts/qcom/milos.dtsi                | 211 ++++++++++++++-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 284 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  22 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  24 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   5 +
>  drivers/soc/qcom/ubwc_config.c                     |  12 +
>  11 files changed, 627 insertions(+), 7 deletions(-)
> ---
> base-commit: 167013d059d5c4a09d49068408044c7a65a26cee
> change-id: 20251219-milos-mdss-fa0763693775
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry
