Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2BA79593
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 21:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F171D10E11C;
	Wed,  2 Apr 2025 19:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWKsLfo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428310E062
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 19:04:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532ASksm000399
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Apr 2025 19:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gWBJkjjCygBm9fx50is0sIfTFnXUE+TQIDtlji3JDMM=; b=VWKsLfo4MC6PKo8q
 pz1Aw06MkdrWfhQSvrFnoRtooOhdVHe5D0uKDLMDDvcPd/Q934YVewQ4TO6YoIe4
 Vv0Sd841lWIQo8ayg7kDvADRq4bOWCKeXabuQYFDxEMQcmvjiSq2BajVlDIwjEAO
 p/0Fe4efK4RMD5fLAbOSAQXimMyBszuIeFNIj+qWaLMI7OzNTF88ZY11l7Zp7vZw
 EaETPZ/ymAcwMHGmjeDggea3FpN4l3wHgEeC1zFawFIl2t6iG4uyfGJB3Lmfum96
 kS91FpuBu0DVEAGfCzsMj84d4CGleOzIWYwHtI7/wdV7aFQd2Y8WQ5v5XDf3iOGZ
 WJ5jiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qms60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 19:04:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so23501885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 12:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743620674; x=1744225474;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gWBJkjjCygBm9fx50is0sIfTFnXUE+TQIDtlji3JDMM=;
 b=cgwbfqQikP5EU8qFHt8VaV6cnKmp7xXj1zbefPbNY/4xjxY7hiVykiV2v3G1lXK7OE
 M9UZcpNrlkZyDk/7WFcYQqZRdLw2V04K6ROyC3W07hJCNJEZCqfD+t4J6IscACh+uZaM
 24lpwq2ihAzGRmOScRjIdOkNWXkwQeelbcVjoUQoQ0GKk1CE8TdpiQVevUmtG8FXjOt/
 07aFI3VIFzxIuvvCrhx2ZTmDQHgS46RCOF1D4jmAfQXcKchHwdIeHPRc2dKFN0wqcVeL
 au2uDfQDYiYB/PetyM9MYt60fFgmcVSCl8B4BXpQInUG518BvVLwJ0xiDqF5gXlLVSFC
 FR5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwprNOauShRSYwk6rJtYBHC/tNGNStrOJ57UQeuvRQgG8QHmOEgcez9Doqx2nOuv4rCCRfcZqosrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq+2GQEusN8zg+nnRQrqSziawQEDn99INKUFjynPPUXIsojSez
 FjkTK7ZUWmk2kCWATx5JxkwaB5icOsQH45z40O/GEAiJkKRr3w9AoQCrEeOVVKYRFLdHX6Upit+
 vmDbWoULywT/fqyfL7/bOvcSNO7xGycgu5yhqR/tkTOMWlAnuo/u1qeRx1HeDd7inbek=
X-Gm-Gg: ASbGncsCoxvsEEG8m5/swoGrG630cjIdNHZxpLKazIR1bL4yQiM2xfC/JCTOtviX4RI
 3SKYvUogsLZplxO08RgnoztIP3x2tJXO2HIHjGZUFk1PuavfuYgX8GoFY0t2H6ltZviXoQwNw5l
 rTXbWxEOrf8CswSbmkXS9maQNBEcrPNo7EL1AyWu2g+leX4DLlqtsmIMWc053PMes9bh1DOyOtj
 NXMSx+5Bdex+SapVdkfsdyrXAuQErke3Ub7wIfhqPO4+mvIjUO8iTMWCFxqlkYmwVwABPq6rJyw
 Q1HYdIwNiV4MP4sRy1UZlWMqpTaN+FyJIXyErSwzrvF0CQUFR8MjwRdRJpRdrYbUi3HQgNDFt1I
 C1VU=
X-Received: by 2002:a05:620a:2a0b:b0:7c5:a2f8:e6e4 with SMTP id
 af79cd13be357-7c69072add2mr2438610685a.29.1743620674518; 
 Wed, 02 Apr 2025 12:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBur0fWjo7yOQcPuAucUs2xiLxZrEWFnw5KrVRkA8NKQ4OAfYtC7kDB0iXCG6T1nj+zDzWKw==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:a2f8:e6e4 with SMTP id
 af79cd13be357-7c69072add2mr2438607585a.29.1743620674066; 
 Wed, 02 Apr 2025 12:04:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0957f9b7sm1730436e87.139.2025.04.02.12.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 12:04:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: lumag@kernel.org, Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
Subject: Re: [PATCH v2 1/5] drm/dp: Pull drm_dp_link_power_up/down from
 Tegra to common drm_dp_helper
Message-Id: <174362067146.2885153.4786307891834552899.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 22:04:31 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ed8a43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=3lv0NsTm8rjeSSnkhIQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qX38mMPYNvBDc8k2m-sUqbW6MrYZboK9
X-Proofpoint-GUID: qX38mMPYNvBDc8k2m-sUqbW6MrYZboK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=995 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122
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

On Tue, 18 Mar 2025 14:34:35 +0800, Andy Yan wrote:
> The helper functions drm_dp_link_power_up/down were moved to Tegra
> DRM in commit 9a42c7c647a9 ("drm/tegra: Move drm_dp_link helpers to Tegra DRM")".
> 
> Now since more and more users are duplicating the same code in their
> own drivers, it's time to make them as DRM DP common helpers again.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra to common drm_dp_helper
      commit: 09cdda7a60f45784cebddf1fa2109d6279f9890b
[2/5] drm/bridge: cdns-mhdp8546: Switch to common helpers to power up/down dp link
      commit: 23ee8c6b34fdfed970e2fae2b2ac5635303d77b8
[3/5] drm/bridge: anx6345: Switch to common helpers to power up/down dp link
      commit: 4adde49ba497ebd376a164c517152670e4f8eedd
[4/5] drm/bridge: anx78xx: Switch to common helpers to power up/down dp link
      commit: 39f14a01994b5102bdc4632a339a59a03a2f89f3
[5/5] drm/bridge: it6505: Switch to common helpers to power up/down dp link
      commit: f09d9f921f2b7b78e73e9f192a9c08b534b8e5e5

Best regards,
-- 
With best wishes
Dmitry


