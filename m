Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DFC156F0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDBA10E5E9;
	Tue, 28 Oct 2025 15:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4vajpdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917110E5E9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SEoQ1x1913160
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=+Io2duPE2jXMSZ1lsWKrQo
 3etXZ7ayZ7YjOHgmgyHhY=; b=K4vajpdbR7avXycWfIS7WbbNWIEWZ+4KpzdM8V
 pv0I75M7M3VWc5YqzOW0ebdAOhwXfnaUwqOXE8BEmz0tflBhoIHJ7qhU1O5o7QUv
 fLWSz5/aOloo8BalnPdD41zMCtzn43fvBwtfah5C1kYWTWYjnEfWbO+rvwLYpvU6
 h1S6Vb3g7kuRwI/CGqcHZdnHpCv3Bnzn5PrJgyLkGzh5bUFEPAqfP61ys4y8zdlk
 eBK1j+blDYW5dzM321T6L2lX4+/WSPexwdzkb23csCRaIq4bOrGNVHhOIYvIU3aI
 8sN7/bRuVmyFxF59uzmpMzhOr3nfz3ZxHFakBv180OuGhE9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2yxtr4uq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b5535902495so3832152a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761665222; x=1762270022;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Io2duPE2jXMSZ1lsWKrQo3etXZ7ayZ7YjOHgmgyHhY=;
 b=ZrNhLYFd60+zOCTJOJ7vZORukImVR+Fb01NmJkBInygW/pICIWHWP7Qj6rD3ztxIhs
 NqBiaNnNepwPilaCYK8lVbbVpIdRIvFvzBwiXcGFJ7v+DABKDz13IKTE8O6CzFnaoEXf
 uwJP0OMt5zHTZ1VvAReXM5DwDJNWLBU/zk31TAYSDB7H2KtWdjSE1N4Zprne+HdFl8qi
 NaZeNLyp8rzU7Rwjuq+9M5cZRYsxbL8gCWmYaxCEtjIaxpLMGpnvAeel7o+5XwfiHP9J
 mGGSbE7a3PDrp/dZrR6lpSVfJ+w7bFyhN+iv4rMCsh1NFAEbW+5/OmAg+BMSeyv7tojB
 10QA==
X-Gm-Message-State: AOJu0Yx08pqmQZFYjnzY4gphdU1UrE7elTfYRYYqotdB8MsynZ58XwmO
 WuNbRBV2mwEaZL7UOlcAMdWCMK42SyN0A2o9WHt5eHkXV29La4lScnNkxhmn3QdYsEn2eReT6Vc
 9bbC1ae1w7mDjSXbpixhsDqyXxxUESNmb/D21tqqHEDLsMoPOPsyMtys0TNddNLpgtQCfmKk=
X-Gm-Gg: ASbGncsXruKQRFBJeoup3KytXFDjcRNvI8XivpJ4T9SRi0QaVot47uVpcKIZj7m7l0I
 +m45bL4Qvi0F8EJA/k25fq8xcN4TzTbigI5vbfo7uV7ZIzvHVy3j24d2GfHJwh2s94MEqbXQFAV
 yBr8kxVE79TT0nFXNZHfv48eMlFxV6tD6PSBeMSgCKDUB2irA0j3n/34GVJNnNV+6hJPwZpIxNG
 qRu2e7PuCsiL+Enaa6XCvLSJvXGx7c39MeyatJuCYB8j3AZ+B88GRUFxru3FkbvNO2JB6PigYSr
 NM7bWlTPKHQW8+oxmzLG7aSakZlZqKvSve1h7h9sE5WxMIa3T/wd4/FvzOBASXZ6/xzAvSGmCBt
 yBaXwhOBiTldq6GUxWa3VzuJrmsRmzkAvMFc=
X-Received: by 2002:a17:902:e547:b0:279:a5bb:54e2 with SMTP id
 d9443c01a7336-294cb3d58dfmr54120945ad.20.1761665221718; 
 Tue, 28 Oct 2025 08:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8FElnofti5XZ5no/U8MitIwH09GYKVHku6MYV+kxz0l4JCe8MU17KZijSuMMWeZEsBYdcQ==
X-Received: by 2002:a17:902:e547:b0:279:a5bb:54e2 with SMTP id
 d9443c01a7336-294cb3d58dfmr54120295ad.20.1761665221032; 
 Tue, 28 Oct 2025 08:27:01 -0700 (PDT)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498e4113fsm119490755ad.90.2025.10.28.08.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 08:27:00 -0700 (PDT)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Subject: [PATCH 0/2] Add enable gpio to display connector
Date: Tue, 28 Oct 2025 20:56:48 +0530
Message-Id: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjgAGkC/yWNwQrDIBBEfyXsuYJKmpr8SslB191UaDRVWwoh/
 15pbvMG5s0OhXKgAlO3Q6ZPKCHFBurSAT5sXEgE3xi01FcltREUrXuSWLaQhN8EphgJa8pCUU9
 mUIpQGmjzLROH7199n0/O9Hq3h3qW4GyhJljXUKeu55HZazTSarZy9IjGt9Abje5Gkt3AyAPCf
 Bw/T33KQLYAAAA=
X-Change-ID: 20251028-enable-gpio-dp-connector-1e4e8611ec08
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761665215; l=804;
 i=venkata.valluru@oss.qualcomm.com; s=20251028; h=from:subject:message-id;
 bh=MCyqHlLWLAE9HlCVFokhUe3kAhu2B1NN6idBdsA21bw=;
 b=r/QICjDQytKeoRto/5RkP0cCrHOYyY3L+8H6gep+3uEoIfbft1GTKKNgjQF1t6XRoIQUP0GUf
 LBi2lLWMSyfBpz8k8Gyf3q619QrTddHu0P/+NPg+zdNSe1HEH6oFsEI
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=KEpJdy7/I8HDmNSf6B83x+sFHUNr+mjMNJ2qe4G/zXI=
X-Authority-Analysis: v=2.4 cv=ZN7aWH7b c=1 sm=1 tr=0 ts=6900e0c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gWnBJZiyT_VVvhjgOPEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SFka24ZLfiNOdAuUcvqSEuraUmO0kW9I
X-Proofpoint-GUID: SFka24ZLfiNOdAuUcvqSEuraUmO0kW9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEyOSBTYWx0ZWRfX3BnRKLjJRt8T
 /0hJ+tJOQ3/XuKnWBfLToXnx+SCSowZ0sec6E15jdt0CeFrd3xlOBIHoKy96aKsOSPo5Q0SwiLg
 jFeJvsnpi30ywQiekz+Kwu8IwSIMtl3hZS4vr4Ryis1UskxrDdrwZqWfRrUZRo0kCMGaRZbra1q
 ztbwSXgJtubVqhW8o/HzhQnZHKQ7cUde8bp9i5TWxalZ9O6WvHWXpRulPC4LFNajvMJIwuD+xAN
 TOD76fUFKKWvSt8CSyamRJGUQ7WujfZV0FerE6ljSV6ZWCSUbXzaYBni8goKBp7iwH5SmpDYJHR
 py0eyrwUmyqC3SlZJNybIPzSfc6I+zJjxyyXDMOz3u4U1RrBGUqLwU2rzb+8bf+2d6V9KbVLi9+
 ruBTXTmfTPZiP5CorBarO+ONZ7dqJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280129
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

In some cases, dp-connectors may need to enable gpios to
select or enable the port. For cases like those, we don't have
any gpio devicetree option.
In this patch, add optional enable gpio to handle them in
display-connector, so that it can be used for any connector.

---
Prahlad Valluru (2):
      dt-bindings: dp-connector: describe enable gpio
      drm: bridge: add enable gpio for display-connector

 .../devicetree/bindings/display/connector/dp-connector.yaml        | 4 ++++
 drivers/gpu/drm/bridge/display-connector.c                         | 7 +++++++
 2 files changed, 11 insertions(+)
---
base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c
change-id: 20251028-enable-gpio-dp-connector-1e4e8611ec08

Best regards,
-- 
Prahlad Valluru <venkata.valluru@oss.qualcomm.com>

