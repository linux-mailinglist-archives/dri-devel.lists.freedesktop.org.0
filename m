Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E500EABBBBA
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDB710E04C;
	Mon, 19 May 2025 10:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHd7AOVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3EF10E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9YqSH014902
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=SHd7AOVs/dj+b+CH
 C0DqMZTpuZePwmK8MfQxgGgSX62LuWE60uRxDKBJXXvPecR3Ouc9yzNv2R4TaL0T
 yycGhVWuYVoitxHTUEZ3vGsGRjSQMekr6lXAtrTC+qIPAcy2307UcnuOEBm5+X3L
 RbqlZMGaH7Y0DJ0tvTygIvDw/o65/Qf0egGyymBhuegpGq2hXUljiNYr5+YC6q8m
 qgWXBxAjsPDDWC5JvcEmoLpYA25AhBOKoA//7A3tPt7AiVftM9kOcu5eqvdU69B0
 igmNlV2HsNiP7goxxfQ0yhsu3Yr3xPmJSeCiqVPwE/FoZE+c0X3585kMF5jsMbfD
 tm1gSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsv292-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caef20a528so1200282385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652328; x=1748257128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
 b=uDw/elCq6K/7ctynMQ9334V8jKFQH0z6neJpL56QCv1+trVUbSSkvPg5xzyjGKtuOU
 o7WPJV+K97hsD4101/2iH62aj4/9JvBCQYZrY9I/CKM5Muj6VtZKWEmjCOiVXHFDiVG0
 CYJmUmR6peIC+SI+E+9k7mVlGvpgtg6iueXCAuV4zkIERGTaQqCl0GWsOmDD0IFqwlw/
 8uMgEObhunHjJ6eSEvLp49vyqXplOY+KSFOE+327JPbAr4w5Ocw5EjS1NkwgDsAulqMd
 TiSExMfkGS7JCWmftXOxSiAeTTIx2lne3sxLrhBI6iJpG69Cba26Ez/04qivDajIGCnI
 4wDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkw69JgSQJ0llZsZ/pL5RjTUGJkw9AaMgQAvdy0qNL+RM+21CbLrMKhOS/pyr8GQaIYrV+FFCFrDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG4Cc5Zxqx8/+R+I+IUq4Gf6hlEDcK1w+FEiTwqnKg3CxGSqwD
 mPt+GSGEO9UvqGl5czjXdq3fKEeL3YySf3WaPpHkwmnDOYTJgpUBFViYR5PxE4C1dQ/LCrjM8X/
 hODwsTnscPAuOIuc6jQmHbUxz0wX5R71RodRG1cqQ9VwKisEaU/IbuLL7SeMgeeBBOhUeRb4=
X-Gm-Gg: ASbGnctgmU7F/eSfFtV/IKXrFsWzI6gYkwG84kL4WGyTHdqVuzeCswEkrLsnJKquGHZ
 TGOM0BWbYIeX7ub6osm3K+7OpbBZWVz68zz8FirsAmChebL52y/j/xFro2rH3VsPs7d5qgqBr/K
 FvV2qaNx5tViL3e3hrqGgq74qShWbawCWCvnGzAgYZiku5XHFcu3y6XPHa8rKNOrswXl3pbw45C
 uioLGMbRG8DNruRx9OtfxxRihjp+Prckt5AbTxkRytXEokjSag7AYk8IrkCSPeBI/j2z+zKAPqZ
 TBG0Dwxdiu/aIKuPUojRQw8bQ7bmv30Gsa2wZxUJnJffJLy9pFjeFPX/lxT+ctsbA6G2RBii0ck
 e9AfRLKOAFwk9NUyuO5c02S3n
X-Received: by 2002:a05:620a:248c:b0:7c5:562d:ccf4 with SMTP id
 af79cd13be357-7cd47f0004amr1688582985a.4.1747652327968; 
 Mon, 19 May 2025 03:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0Dkz5uT81kjybYAt3wNQ4m8l4BP7fLJQGKLKFt5m0JWT/MZxJVQhBDzIpWZrb3G3Vyxmbw==
X-Received: by 2002:a05:620a:248c:b0:7c5:562d:ccf4 with SMTP id
 af79cd13be357-7cd47f0004amr1688580085a.4.1747652327658; 
 Mon, 19 May 2025 03:58:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Mon, 19 May 2025 13:58:33 +0300
Message-Id: <174637445761.1385605.15776598312432418446.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g_WrXP7cZTdNXogytE6_YWM34sqaF3I7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX0vUWMcHfaNtr
 AHQLL3HKgq5raj8cDIMYzVmdIagvXcGVfLHPPLnXFmVJLBExeRT2oPSg9Nn4eMrGeVuGvxCx2/L
 d/X8j+PyrDYqSL8zn5ezqViw+rO7LvodCxw+9OUZDBg1k7BLxpLDSGZ9l//uUa+oOf1j7vTaaFc
 8xFiHSXlmomabJuMl5zBmk+tq4OHKyZ7/9ET4bTjrBb0OymCEYAVWe6FxhLTifUHV/vjdwgWRa4
 stge+QLRgVGrIopSkliX06gSfxu6RP9R/eYMpS4ETw3LT0EB7aZ8xa16Dg68bsMd4SlQ8lDynch
 2hgxyAn7IyEtIzH67mlJcUUc25kNW10g7Cx0IxtnMxiibnBeO7kTQJkX6ctVoFq3KvoWwY8JDPm
 drDTcE1w/ksb69WNN5ukD0W173E/960BMsl1s1G3xavmUmDd46XbDoKAxI1rwh6lxxhlqsyk
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: g_WrXP7cZTdNXogytE6_YWM34sqaF3I7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Fri, 25 Apr 2025 12:51:50 +0300, Dmitry Baryshkov wrote:
> The LCDC controller uses pixel clock provided by the multimedia clock
> controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
> clocks properly, taking MMCC into account.
> 
> MDP4 uses custom code to handle LVDS panel. It predates handling
> EPROBE_DEFER, it tries to work when the panel device is not available,
> etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
> to follow contemporary DRM practices.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f1d131147aa
[2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6720d64d8eb
[3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9c2f63da6a70
[4/7] drm/msm/mdp4: use parent_data for LVDS PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b641bf534cf4
[5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f26b80359bc7
[6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b565edc44b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
