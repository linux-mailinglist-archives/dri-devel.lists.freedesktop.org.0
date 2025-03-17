Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51421A65B29
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6E910E144;
	Mon, 17 Mar 2025 17:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ib+nkGDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B14F10E145
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA2FXr025504
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=zBUsExIYKuDXmKfSyZ4/x5
 2vF/DMlL74oBtWZxSet6s=; b=ib+nkGDXhDhWrobH8BbDmoviUA3JDACnfQOOhZ
 /ePw/HhpiLikp8nH/uge02lZoZP6jYe57jXQiZItgLvRugfteG0baVtbbVFfd9JC
 w9N6awNVkyUz+QSm8FjtlX+raILx9C9h3KFYAMqmD5k+z2F98X5bBum8sLdUlErZ
 4StwKS6aZmsKzLbBSrRE3hzkgoiMbinP2Sez+rZtdBtTBHbE3kGMWeRqwFoaQwTQ
 KWfzcEHls427Ha13cmUP2fkdRf/gLGQ00lvVMWn4pzH+1bDhc8vcIT2/DadEESYC
 fg7y7NF4S+GagRqqNak6avWkteLOiTJjiKuE8Y24Z78VcYCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx5fa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54e8ad9b3so1027441585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233483; x=1742838283;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBUsExIYKuDXmKfSyZ4/x52vF/DMlL74oBtWZxSet6s=;
 b=etyX1vlUEj9xIY15t3eqXYk8HdZQ6DG/QNxZDJTnYgnme3pI+iOY75b8ikmXz20CoW
 GALQ+XT6z17ajhq6o0FuxyqifJphfYkyaMUpfDaubPIz4fb2yLyyPXIutwol8Pb26/EP
 HWYH2sUzUWZcH7A1FEklXG+GlSU91ZfRpxldHv2P5fkwhAAbG9tk6PpQ+MchZVS8XRjV
 nFaYQyfSrMgzPuKObiqrcDYZFvi+6zcsoyPBx5URXcAE/5WOYYVSYMP1jC9UvgitpFJE
 kEgBhlfwMNmh41fzSQfZLNRgfJ05F0iY1FO2EQA6W1+6lNvPl2t2E2lDILkc4KpC0RqJ
 nm1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCwW1ok+FftTsPLczpLE06zismz6Az9qVIzfoBM9pz5t5Yqx3q+1LzIpPqWN43xSwjvWIQ4yeCjR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQggsi/qFvP0uOiJP6H6m4BLF4BX0UlIP4DyGVIWYW6AaxyXMZ
 wnfynq2zbC8ug+ztbErQZ6FUrdJ1n4GH6lai3FGcEXoCF+m2TOZEVV1wdJkgFdB3GprI7cK0QuL
 3kirbvxf3lh8DmKLGt2/vgF/3eCuiCClcpYCA9xhy2f+1jkOyooCwWkhHp3pvGA3e0wM=
X-Gm-Gg: ASbGncs2eDvaqLQDuAxP2L4Odv7d8PLLana0yRU5j9+S450cEdroW5nW0wxLkcRMEu7
 qMEE8ajBRCeBMcy/RiXZ/C4poWtEc6REN+JvlEB102FaVWgwqMy1pzos59tzNszJvbSYUZ91Lpw
 VUsTPnolkFpSzeGK7+yuItax2TKPTNCaGM2PyblchVMAHOXTC/jPviSuK7e08q+4bC+0IGhO7mv
 1kkFlP75f8TmXvpOqdzf3XX2luEqtUZWk1md129/WDa8ZP0sP+tdwItRiEKDELb3G5Agv1tnbbQ
 BbqTNJo05LUWRaxud1kDjVGV7m7zKJwXqeR2DZ50WNOU/4uK96x4Gn4SmHG7novMc2XKMCStqzj
 4gkGII02PWdUxlOYezzlITzu7PQM8
X-Received: by 2002:a05:620a:248f:b0:7be:73f6:9e86 with SMTP id
 af79cd13be357-7c59b8aaa1cmr52556085a.20.1742233483605; 
 Mon, 17 Mar 2025 10:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhfiwtI1vGLjeE5IzqOgUZWulx8wY4QyIkbO2lD/DD4nMJ83CYnPPjC1rh3t6m36OU8cMz5g==
X-Received: by 2002:a05:620a:248f:b0:7be:73f6:9e86 with SMTP id
 af79cd13be357-7c59b8aaa1cmr52549885a.20.1742233483171; 
 Mon, 17 Mar 2025 10:44:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] ARM: qcom: fix APQ8064 schema warnings
Date: Mon, 17 Mar 2025 19:44:35 +0200
Message-Id: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINf2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3bTMCt281IrSYl0T3ZQUg7RU46TkREsLcyWgjoKiVKA02LTo2Np
 aAAds/vRdAAAA
X-Change-ID: 20250317-fix-nexus-4-dd0fe3bca987
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WXxJVR7u/eEtq0VSMR7e9vL+o9y/vFO1lbnUevsiJCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+GxcQJgJPjISwSlnyJbUcpp+Z/ZtkHrXc+i
 O+VklGUppyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1dhVB/9g6cVCpjmDg/J9cGILVCTRjkxcPbPm8giIi6XatiuGR56vsEsIU5fB1ko9soln8IvtOUW
 hvgRPcnX9nEblDDmkVgd2oEMoBbCe5Lnt01zbQfEBxaz9pbvF4WWM1/JSPEfwwuXWUS9H74b13H
 s3Yy9+fSI1T3s2xptLOYackhkkS9r4AdQ6yZpzFk+EJYIi0phcak/5+w8g8U2Jduh3DJsyVBu3S
 9otEv2EiIOabC/zYtEHlKY+iaxwJE6jTLfWMIUdB2qagGZiEhyKFX38LZrGtmAe9B9juuxj9er1
 pc7jED0X7+aHUn7Z4pWgEiSrF/GrWumv3k/pANwWAPIOY1vA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d85f8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xd_227E7yWZRqRJlnwUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 29XJUKzWu1MJuRuDPBpDt_EVHTCURT1J
X-Proofpoint-ORIG-GUID: 29XJUKzWu1MJuRuDPBpDt_EVHTCURT1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=688 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

Rob's bot has reported [1] several warnings for Nexus 4 submisson,
however none of those warnings are specific to that device. Fix all
those warnings for all APQ8064 platforms by extending existing schemas,
adding missing schemas and making APQ8064 DT follow all the schema
files.

[1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: display/msm: describe SFPB device
      dt-bindings: soc: qcom: add Smart Peripheral System Interrupt Controller
      dt-bindings: arm: qcom,coresight-static-replicator: add optional clocks
      ARM: dts: qcom-apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

 .../arm/arm,coresight-static-replicator.yaml       | 10 +++
 .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  8 ++
 .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 85 +++++++++++-----------
 5 files changed, 136 insertions(+), 44 deletions(-)
---
base-commit: 2bb3cf7805af73af62ebfcbb55e350549b6a0912
change-id: 20250317-fix-nexus-4-dd0fe3bca987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

