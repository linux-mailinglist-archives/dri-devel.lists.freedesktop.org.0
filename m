Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C13CE4B45
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 12:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2710E19F;
	Sun, 28 Dec 2025 11:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUUBY1vP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FbwScVvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3C110E19F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS90JWC2107565
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fUR0TY8MxXOYQCJYnFgknl
 uYKFQYWHGWfbmokTmDnuc=; b=QUUBY1vPukRrRhhd+kCpLaVBr192uy7s7IpjvS
 m34kgl2vyb6rS87Dvx5sqmzX6mK1Y6nhBs/J7YCtDvzL5W75rbPlVyPMx0myiX+L
 yihQsyI48JnR53UMYM97Y3vSf6yAHm/vrMkBDRVMW911F69u+zqjLeV7M1N3sV74
 06xRO5r+8pnQrU+I67WWahes1QHzo7aXhF7Ky3QquBks7UGBcEcJ1W0dDlmRNyIH
 mLoGalhI9A+hHojcDfkR7+abOtnT7JaGUY+8VVI8ztfIiDuDc/k5YqlhyExMRESQ
 4RQq29T6q2X1jawDzCo2Gga50VRf8id9KQKdl1YIrqkGWQig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1t4sp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a0d0ae4b1aso29511045ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766922083; x=1767526883;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fUR0TY8MxXOYQCJYnFgknluYKFQYWHGWfbmokTmDnuc=;
 b=FbwScVvwM/sb2YTY6q87zoXYXzoDbdFifPV9h+yB7JPO0SG8GY4V3t97T+qJ7TVRGE
 gQQTTckkWq7p06tIy3NRmrsCYK0/VQ7k5WnvnCNkshPO/vFGuI044LsUzkoT8DPsT1FJ
 HtxVChAnqLOzTOY8qAZkrBIzf9GtQCcY/4G5pcAwf2+ILqp4CEdzDtTlokPa5rer+Okt
 8EeaY41oQeQ07/Dnnxb6f8Js+qfy6/l9HWAmlY4MFg7XejTMdmxnAoqecAa36h7XgKPH
 Zisn/vuwensuxURZCahM+b8rnu5VGbAEEcugC49jZQvYwUwektdYjK2X1r/p/bUiZiM/
 yEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766922083; x=1767526883;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUR0TY8MxXOYQCJYnFgknluYKFQYWHGWfbmokTmDnuc=;
 b=eb4IPqpLPnfswm2bMYbmvHan2Kp7mYoe31wdStAU0r57rZ6ROGlwvoFwhF0KbpnooI
 wSDz/qP1LVfOswjf9CIKHj0b9gL5Hd2v/5gfRLxW6RnDJyxNtxouICNDh63XE1Z1M+IO
 sj4DVbxGODkmuxCIk4HylCwFxWnB38rYw0hGFgMLZIdanwUDXQkaYQirL9ZjiovI7E2V
 pyQ9ZUSJyd7ahpQaAgzBvK8Ai9lIEkrf9pFkGyPe5efj/p7HDS9fcVsG3WUcYEc3WlqO
 WLfy/kj2K4kcHM+V5ZN0lcTSxsQGgT9ARptldVLEfnUZDQ1RVbW22iWE2nR1JDHqb9aj
 PUvA==
X-Gm-Message-State: AOJu0YwQYS8SUigc8HzvsHHB916TpaxySjPPBGkYB8TCT4W+FnP2aKbc
 /mvXneqCTyWfxHQ3d/8sOcBX1zP24GnysNgy4ffvfypTEX+3kVDN57VdNs/wgE93jifjwT5UblK
 tSQu6e3Z55xerZ3YjXLiRFLl9CqqHdvk6M7K3uPoklOYQa80n1fFxijlebwQxS87Il14KW1s=
X-Gm-Gg: AY/fxX77+hkVlqqEWBOZbBWsjc3ASWF2YKWQdr1XhrFUS+ZQ/u8XQAUfpyBUATejhI8
 iIYTo+oov+BMhEWDkhsRGq/I2Arq4xJqD0CjJguxbPRb4qW5jxuvpJU39t68r7rBjkNM7uWpHdv
 gTTINI5M2VsQCzWKdoJctbIKR5QE7wmEK4ELdw4WoUcIX3zNwy+z6oE5w2vIstGHIDYpiRLCGkj
 meZkCSjt/fhLoZiVs8NSUekG8yRr6bcqThNuoEdByrSIbmK05NxkwylVGg9SuIh/Ojs7HkqES6g
 mqMNL03FHb2EBGnodLgkaSZdj/QsGzsUdFmRfTAW+dZ0rzwmFTp/8P1Fk59vK3C17foheuTXN+X
 CZIkpssVRzA7GV6dQGW2xUMQp3fQcoPO2W91Q71fV+TLOpTNJ6mykq8C38InKZtukpb0lYyRSKU
 wxbb5gpys12fNhT6E2CFhlLwk9B6uLDg==
X-Received: by 2002:a05:6a00:3cc7:b0:7a2:861d:bfb with SMTP id
 d2e1a72fcca58-7ff6725d1bcmr19674801b3a.7.1766922083012; 
 Sun, 28 Dec 2025 03:41:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq1kNWMT21gOafP3VFkjsQB2ou9zxqk4R4DSnAS5FwYhGu4ix7NbZh7wgZ4M+zfDEIn17D3A==
X-Received: by 2002:a05:6a00:3cc7:b0:7a2:861d:bfb with SMTP id
 d2e1a72fcca58-7ff6725d1bcmr19674774b3a.7.1766922082493; 
 Sun, 28 Dec 2025 03:41:22 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e197f9asm26214067b3a.43.2025.12.28.03.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 03:41:22 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add lontium lt8713sx bridge driver
Date: Sun, 28 Dec 2025 17:10:38 +0530
Message-Id: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYXUWkC/4XNTQ6CMBAF4KuQri3ptDSAK+9hXPRPmQSotthgC
 He3sHKhcTPJm5f5ZiHRBXSRHIuFBJcwoh9zEIeCmE6NN0fR5kw44xIAJO2npgYRZ6oD2lzbgMk
 FKnjNqkpKbVpF8vE9uCvOO3y+5NxhnHx47X8SbNu/ZALKqLZSgQFTC6ZOPsby8VS98cNQ5kE2O
 fFPrfmp8axxqWzV8oYpgC/auq5vd6liahEBAAA=
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
 prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766922077; l=1646;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7TTi4A73GfIqwWPUldZxJtQUczzPUsf7Jx4OIIj7lc8=;
 b=MEuXcEwXsnZvWAPGAwgxBgUU24vC2HtZM/SDbmBst6uhwaDa+V+OqVebIj0alicDctvhdOgnw
 3WpjgKpQsUpB8CZEMZvAUNCMgTsgwKaqu9eUdaFutpyY0fGRe8AfnJe
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: x2zPaxjgo0HKwQlwNuje76GWZV-Sp4hD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEwOCBTYWx0ZWRfX41DvGxl6+sDX
 OCZOX0Hp3tlISJKDUGLkPH7UuUwr3HekO1l8DzjFsZuKqHU4J1BCRfpqRT+TSKA4P1tDEf+beZH
 BVoC3XCnX5SMxOXZJmQ3Qvt5kXPE1drc23JdLYB7DoDK4EpaeypItqezqorY4UAhcS3/VOl+A24
 We/zaGxRBl+eNGm5bANSm90Lcdxk0f34oRXlJetoSs9BqSCin0WxNxgSpfhlmYnVnHuR6g+hMeP
 xVqcJ28XglZbM4Ne4nBPz0mk9gHnNLxsBPkFyrgsmZLlcwzsMUh1kuQmjMs0+sqxqTVh6ES/63O
 1tca8iCkDc30VUY75I294YTvvUyXwltIFfH2zLY09YmUIji48jE5+15cbLcxGGKVSxMPx11iyBy
 1ygJslOlXIAL3RweC7mGqyjFYdmLgS0o5PcEjBIX1l4nghWEHgPvI6IGPIcatC5rq9e2lRckm6X
 3ikexZbU1eqyt9b4gYQ==
X-Proofpoint-GUID: x2zPaxjgo0HKwQlwNuje76GWZV-Sp4hD
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=69511763 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QxBZ9i5KDo26hP1ghMIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280108
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
Changes in v3:
- Used linux/sizes.h header for size definations.
- Used linux/crc8.h for CRC calculation
- Added Basic drm_bridge changes to support corresponding ports handeling in dt
- Ran coccinelle, smatch and sparse checkpatch.pl tools to improve code quality.
- Link to v2: https://lore.kernel.org/r/20251118-lt8713sx-bridge-driver-v2-0-25ad49280a11@oss.qualcomm.com

Changes in v2:
- Addressed review comments from V1, majorly:
- Fixed DCO chain.
- Added supply in bindings.
- Handeled deferred probe in lt8713sx driver probe.
- Link to v1: https://lore.kernel.org/r/20251115-lt8713sx-bridge-driver-v1-0-bd5a1c1c730a@oss.qualcomm.com

---
Vishnu Saini (2):
      dt-bindings: bridge: lt8713sx: Add bindings
      drm/bridge: add support for lontium lt8713sx bridge driver

 .../bindings/display/bridge/lontium,lt8713sx.yaml  | 101 +++
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/lontium-lt8713sx.c          | 682 +++++++++++++++++++++
 4 files changed, 794 insertions(+)
---
base-commit: de0d6e19d2ef33ba34be2467ffdf3595da5f5326
change-id: 20251115-lt8713sx-bridge-driver-32704455bc9a

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

