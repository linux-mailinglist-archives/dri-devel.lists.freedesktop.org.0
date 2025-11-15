Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0EC5FCBC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 02:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B1910EB82;
	Sat, 15 Nov 2025 01:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fglilPNt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJbjjkgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3710EB7F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:05:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEJVRxA070995
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=N+qD66s8DJqKc4BhTzsf1s
 FVyJk0kJSjLjKIqrGu+f4=; b=fglilPNtKH9ea4XZ8a4T/sEyEPnui5CPzwvW/6
 MgfXBXNXUvpCGKf3eBitDlB8UhZhhirH7tOwEiPIcs0yL75LGpQxgaS0nM9fPUck
 GwMvNDVFGxMk+n/UeThmheYJisXFBs+C6e3gm+SgKtGcTL3eKSEVe1HOjp32/R0I
 oICVrPlsWSGoqpjzgeOu/kQ098wL3Vh3C+oSD1KoI4EIE08RWWaK3BglRQKhPMYs
 jR8IHviwgmJZUKvTUf5T0H+yPkTZ4FdpAGAct37UlW5xGrJL2xdM8foKtzaiSqTf
 Frv0Jli6nbcY8/idiGqP8j4fC0zUoENTfBNAOEFAPaVeF0LA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeang8qwh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:05:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2957babd7aeso8464105ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 17:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763168726; x=1763773526;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N+qD66s8DJqKc4BhTzsf1sFVyJk0kJSjLjKIqrGu+f4=;
 b=jJbjjkgNS4KDN4RbZsVRSYHJZvH3F5ZpzkCI76ZgW5pzOWKSXiU9MrcsOXiBrpM3RE
 Os28piF9EvHhBc13r5/2uS7ldfUZfQ5evDwyaQOzBCHU49QcPakv0lHl0yVjEWckn5O8
 ecB59C9JuAZfuFmvC5QaPaU3KJUoPltDjORIXCISJK8e+BhUohREd2EKNchvWsJAO5Gx
 IN+hiNmtw3FfVR8/p2UzuZ/CwVlVWxM179T4z1+rVjorIIq6CUA0Lo5zRoJzJuwo+3SE
 TMALHvwkH7qUAQF0/3e9x5P7kSZg4WnQiJiFgDr3ExFWv1Ow13R1Sn21NUa6/NEC2s2h
 62wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763168726; x=1763773526;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+qD66s8DJqKc4BhTzsf1sFVyJk0kJSjLjKIqrGu+f4=;
 b=eHoyYmod0fVA82tFDzHLhbsAOFQOtHke9/alkTQjEEJ82cJNSdAib+dkE3J6bx0koh
 3w4sbwiSTM63c/zIFF/NydY6r2X7a0IkcA5LT/0SHKLngLV1UfrcyElSBS9ypiT4V11+
 ZrfJODqdR+hMsaQQ2nWh4ht4tUivfhuD+bzdixWOjXQe1r84EU1bQh0x7U+KsDJXpS3l
 amSo/Htc2vGB8nP30KFqSTneITPlohL11w8k1AkpM0To+aSmsz38rxvdWNZdbyqqFf5U
 7g7/+jzsFNeX1okf327nwtgVk47HYT718hOsbjMXzEvQK16Hpn1jaGMc0fdJz1P2R6Gh
 /Qcg==
X-Gm-Message-State: AOJu0YzW4nuCn5V00lBmfGTjuJnS/i++Hh0agk4V8ihMsfHVpOw33QSn
 UhLEQISOuJP6NdTHoz4cTzQ+6Dvcn6ucjgZp99V5s82/wAfQVaPwpjlYYNO+7OQoJ1xFyLSJG+5
 YLjMVOqADxe9mx+An/XEYyloqcwkZnBY5r5wLDzf5Pxnv9Hni0I1C+wlQMQ07D5YO7MeTUMg=
X-Gm-Gg: ASbGncv/5EVBZL/54O8ZHJuew4VD1tgyQaA4vSvJ1yMQO2oJXoxW3g5j3PIZOzuMVT+
 y0eF0djI6Ua3h4/uDdc6ePfFjp8XPS6GSklRP+zKl7pcURQav+T+ej4BfduChaPoBrp6YO1rKph
 wml1orrV4bGlBBp1778m1gz7txAHt1+a42O8OZIN1uWYdy0dvOFxy5kb9Ai0qlkWRs5cDUhz0NZ
 Q2jDm9byBN9K/R5ixpHTovek0OzD8jTjWKPkkFw1Yty7dxORq4/V8lz2JcpUZWEFCAI3FS026kX
 mGtSjm78L1njVsw/xRzG6HcaeYBEKFYK/IqYN+0DP6T8LCeR+q/3tcTqfIJnD4hijkW7QuNZdQL
 +MDVkSib42qiq3QQYtIWomHv7qtd34Ob8cdBh7dkW/lOzkO7ggbusemcN0gMzOmMuG/rrvAb05b
 C7NtdpVlUaGLBlB1rN/CA=
X-Received: by 2002:a17:902:ef45:b0:298:2237:7b9b with SMTP id
 d9443c01a7336-2986a72c718mr28380305ad.7.1763168726331; 
 Fri, 14 Nov 2025 17:05:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF85w6nkmvL8RYOxF8j3eLbr6fpMwPX2FLrGG/WNr6tuVXNYjRmNH0Pd78a/5p6SnlrxgSrkA==
X-Received: by 2002:a17:902:ef45:b0:298:2237:7b9b with SMTP id
 d9443c01a7336-2986a72c718mr28379965ad.7.1763168725792; 
 Fri, 14 Nov 2025 17:05:25 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36f42eb0esm5812976a12.13.2025.11.14.17.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 17:05:25 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/2] Add lontium lt8713sx bridge driver
Date: Sat, 15 Nov 2025 06:33:55 +0530
Message-Id: <20251115-lt8713sx-bridge-driver-v1-0-bd5a1c1c730a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzRF2kC/x2MQQqAIBAAvxJ7TmhNsfpKdMjcaiEq1ohA+nvSc
 RhmEkQSpghdkUDo5sjHngHLAqZ13BdSHDKDrrRFRKu2q3FYx0d54ZB1EL5JVK1dZYy1fmpHyPE
 pNPPzj/vhfT83Yl/DaAAAAA==
X-Change-ID: 20251115-lt8713sx-bridge-driver-32704455bc9a
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
 prahlad.valluru@oss.qualcomm.com, qc-display-maintainer@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763168720; l=1092;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=AFfOPgavFRRDHMYa2gLJOoyruIVOty8eXhise2RnkFY=;
 b=1CROhUIKlfJXhG+efmn+kz328UTx5KtOcE0ceCnaCByXAnrcowLN2A9ohhHwPO7PuSHfjTOgt
 6GFhPvUdNIIBRh4yxz2KwlLeMI52wpO5g+1PZ7Xrxc82CTOQuj5J+lB
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: TnZKxV_0uRqSuNNwSyAhPBp6w3kxx9uX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNiBTYWx0ZWRfX1dG1UDcsg1u1
 peKaxw3PDI9yUnr67RH/vkmrLEacpV+hCRhIPTI/zj+Yx7jZH6Rs/WpHEJkcCII5v5rNGzSz0wA
 tWRQfRc6FaYUIPs/wfPZl24BGNAEuqqZx2EPbiqJP04NAvkF9GmIAFdwVL3WyljIou+fcUw5eG+
 cX8KgaGADs0v7sx/0Tkesipwi4YBDuGL9axbNhO343Dulyhf110L3kdxDHuxw1ng2AFalnlwUOv
 R500SowHYbpq63vIuuBcz8t10YQXBaqHMQrxTfzSRI0M3ePR5bbrN+T1glqRRwS2fuAXEeLEG2+
 t1sBdul/H9JOK7ZxFbyRhylT9qo62D2hKyCHwI5VP+t5vCpan1o5mTlkQ3krr3dtF3BH2jYf7dN
 c/FrBZiGm13s9EhV6lm6KKBA58157A==
X-Proofpoint-GUID: TnZKxV_0uRqSuNNwSyAhPBp6w3kxx9uX
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=6917d1d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QxBZ9i5KDo26hP1ghMIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511150006
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

The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
audio output interface.

This series provides bridge driver and dt bindings for lt8713sx.
The driver is required for firmware upgrade in the bridge chip.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (2):
      dt-bindings: bridge: lt8713sx: Add bindings
      drm/bridge: add support for lontium lt8713sx bridge driver

 Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml |  47 ++++
 drivers/gpu/drm/bridge/Kconfig                                         |  10 +
 drivers/gpu/drm/bridge/Makefile                                        |   1 +
 drivers/gpu/drm/bridge/lontium-lt8713sx.c                              | 717 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 775 insertions(+)
---
base-commit: de0d6e19d2ef33ba34be2467ffdf3595da5f5326
change-id: 20251115-lt8713sx-bridge-driver-32704455bc9a

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

