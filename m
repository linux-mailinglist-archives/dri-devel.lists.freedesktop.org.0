Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9197AA87B6
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C046310E276;
	Sun,  4 May 2025 16:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PceyglrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C1410E125
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CP2N5016908
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=PceyglrV3PU7GHzr
 LuuP7Q12afGV8PbCfYTHmKQsTBtZtuXymMNqsu2dmixChR6erxqUWCPzVtzIT7Gk
 D72ayXTs04CvX8pg1yjiO3EBXBRqHRXpUYRYHBe8A6pSpkmCkApdh0vt9qhFEL2e
 qYe4qDZc0K7MXrbAPan9x/gNIgAWkQxxja4dziSbeCovgizl9DF6pVz8ML6UH7Aq
 eoxo9YtwQQTIU4OTEl7CSA938rcpLUBnFBZNRFns2Jrvjh5BT0+s8qlapBpu3x8R
 Fy23vk+CeM5ssAffU0ROjuC+FH8tK4rnDQixqbzSyXB0ON2tFzzgZIDrvggqZKg6
 mZKNhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rt81x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so411529785a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375221; x=1746980021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
 b=Kvc7bGuIRPJZAonLCf20Kjg5QFCXqDIPWbetCZ6V6FYGJ4bKBEk58d3UWVTYjCI+C1
 DzkaNEYDRGhrlnMyVIm3nkE/DnCo5G/2DFKUKgl8jmUrNYzd6EBfIEFm5SxN4SqdqEq1
 g0WM1y2gb3/UmvTNwNiqOloCbbyK3YYRAHP9ez4+u/8wyS51PXX/jgo7nb2h5TTrJ2OZ
 t7L5V+NjVSf3uTmrxr1JuTv+QNcmpcGDrJDN7S0JGHmYpDRLi6NqtcX4svqRFbsxx6xz
 S4RMyXy+PuwlfrE2LBh22Sv1PTXLSz+uW1G+ncdPCFwetveuYBs9Jui3cnaaI3/rjzUm
 KGmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlID8IFB/THNPEd40f0/v1txPd+JmwKerx0UlySfbYqb2iHV5Gl6nFlNOyqx1IJZtjV9lRq0Xgh2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPdB/MSam0WvXhpdY7CVqXdTqhYPkia+y6cZ2zFRqJam4K7MXq
 TcQMn50pSFhsWPmFHEFsz6rSEaAxcnHPuweI3SU6xQELdKxtu1rs0QesgsA1rxbizCXZaXzlp4B
 gl/yNuIQLNnb8bn+U3+3XuBxo7kzHSmhWPyEztbUyPnylSNR4p5SCkVgHJ3F2ys3/6pM=
X-Gm-Gg: ASbGncvfJT4sXMxDm/pEqoVMK7ujuIInnFXHh0LPmn/MWYsrp+yQJu8TR0a6tL6GcYY
 IXltVf6+jE6wTJgf74C04pRMi9n1dbmuNLY6lRs9/L13+bqJb4k9SBaB1+tw3aQOSOj9VReDcMF
 x8eyK7/djmL7ny0hUF1Qy0MkoCFd18S6OmJTT+OxdqdjoyDZmYRcsSvitdHNzjFhSSWSeh/E5nD
 pH3QBTP0ivqSge8zVfQL9KlUW/uypz/wfdPSId3VVRID7J59cupur1iuoa0345xtJUxQB0zH2CL
 YMG1ds71BEBUs25W0sz1cgSROeXbYh7B0uw+hl7/y+R9Im+3dh4rxfzPysVEO2cwMW9wmGf06HX
 tJwTv3m6AP3p8zytXd3naRCD1
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id
 af79cd13be357-7cae3a5a077mr572043085a.3.1746375220868; 
 Sun, 04 May 2025 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc6F2gMWEMC/eQyOndUIwlivpCZSW5Hk2df4PpYxa0HMFQ0EsGz/WEeqpDE8GrC8oyTI9p4A==
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id
 af79cd13be357-7cae3a5a077mr572039185a.3.1746375220519; 
 Sun, 04 May 2025 09:13:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:39 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:23 +0300
Message-Id: <174637445761.1385605.15776598312432418446.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bnhbs0g-fw_zErbUDZLtssH1H9I_i26h
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68179236 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bnhbs0g-fw_zErbUDZLtssH1H9I_i26h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX39xutWlMMe4R
 gTNYeIqxuVJh02fQmiNZacw44R0lDgRGZc/+tYsl2waZPKNPn60W+bUa9olBVpqNVgK4PzEjGxz
 6TAreVwSSvdWNtr5OBeVCsHU9Vk3cyNuH9yPihytuvU1JD9dM+DV64Ep5aS8W43YH1jEQE6yD/9
 kBbl6CzNuDKCUdTIdjsCtbE6RkjmLUI3BL2Mqo+G18WfDmlPOde8DZ6oEIEGomtqXwChF+XyFsz
 uJwl5CBLD5N/CP+WNtY0a+dA2L0J7QrQLRZHCwSvwBru6olojTEDWpPql8QR/FeZpUqpjPN1pOX
 svZtJExq11SdFm+iG3TJxOpVe36DrTCoxv6R4TxcMnDipY4R6WNi/foSJ8Uu8ub0wKKKhSRMxBC
 P4nYygU7OzSM2yRinIzX0+ja7TMIBHycDn8gK7nU8TqWpZgBJLBVrbHxHZrGRgYecLWc9vMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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
