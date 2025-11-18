Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15821C67466
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 05:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55810E1DE;
	Tue, 18 Nov 2025 04:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk+D9Xp9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTzPiVFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D8B10E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:37:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHJIkY44107630
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=a7tOSam0QBGfSIMY8ZveQl
 A06s6WFVjc+TTPafZavTk=; b=Bk+D9Xp9q2qUfR7aTyhzCJTPHx3DXXZH2jVNHC
 7MyzcjGeQelLxnOARwbY4vltJgnfsWdGp0DG7FJZNOuIKEMcbr2TKB3aoL6xmXjt
 fG+OKA9Xyl/Gl2PSO23YVe77V+2K4WTymmACLdS6SfepAKZ3ggAT8pbpXfQS8g6h
 eerfNz0Audj5UgXyacszkVhpEtV7LVWCU/qv4eLvoMyYt+WzIfJ4jmZo7hd1qlln
 qhh0qM0Tgb8+V5STk5PayKkGf0BahWz0b/K4LX80DaGhMcJ7s5s45Pfj6OZPDaKu
 5vy7qNsdCDbOjhlW/upC86HxHvsnTdIW3Bzz4nUdSoe+9jwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpaqg4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:37:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2986704a337so14308385ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 20:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763440668; x=1764045468;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a7tOSam0QBGfSIMY8ZveQlA06s6WFVjc+TTPafZavTk=;
 b=OTzPiVFFJyoMrit8IU0w6/rkxy8JDXh2e4jaYf1APRVcTvCj+sFyN01CQQwS7SVrLI
 06H+RkVJQzDlN0LWoKGLq/gPqSKUq+jqvdKHE70PUpmEnkpWALVC064BKXJkqTkMfXNm
 W3Lhzp9C7rrn+MMi2gFQVwYvvVza5S3s8bR0fwlvt0hl1C1OYdASytrXUa0wBT3phVaf
 ot0p5q2d9N5oIGtMaD4gKbwUExXdcjBPxvEQ0s5nKBfOrPIexr1quIjdyJWSNnTF6sR4
 C3eQWmwSh+OxNCVOMqv3xSfk4zZE66xrxyYZTFQJ7Q8sjMy62YVe5r4cFDP1I4opwuii
 MA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763440668; x=1764045468;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7tOSam0QBGfSIMY8ZveQlA06s6WFVjc+TTPafZavTk=;
 b=HEnjoCHnT9RfRW2sA2bjeOgKrkOgzPuqBcm7jQiZjXOjxhZf1Kt+Dek+gqG93bvR0V
 3Y1Fjx6Nuw7lahDIX88f+xOLKQaEnFVEzbOPoV/8tfBVEdgUgE2TYf2VvFVHRrxRvN9p
 xKlL9Cmu3cbLAmyhaKoxdg7goI3XfnYEktVB2jBor4MnjhjJhW14JS8zZN2H85zGzDk2
 Pu5uNFRoS6bUoeWPOccld/myJFOSx7Ytuu1Yfx7GTyfpisu3OfE8J2ePTA1grpRlB0Yp
 pTy3F59jr4A70kTLhpu+xBNANf4aNhXY0I8i+4dWUv7Flp4ESeFWdm9TjFCossHiI1yC
 ekLg==
X-Gm-Message-State: AOJu0YyorNtc2SMg4/f3fYEQrkz3jgmrJnU5pK1Zd69s2L7ep+XRQCvM
 sO4R259kadsT+1cXuHq/DKMJ3nNWYPiG/4c1H9zybxrKIrktPCoiIFWjYgY1E8lGntnZSA/k9D7
 udneDtWm9+ehgm2MoehbyhS00h2M9QZsw4pke953yiwIA7/Xss2Q4R8kJF8WgsB9YSjiokpA=
X-Gm-Gg: ASbGnct1noVS1gode/VEKWW6WkEjgm5RlkZVh3jMbwYLMBE9uMBiYKAXAiDBNuoDPF6
 o4/+j0DyrsGTzVNtygUtJ6tuzI/yV2L73Fw8yJtThnochgncvK6+mr27fnUzLnyGDqlMcilVzIK
 8zZQqfjea+X/UNl6PnzTvPlXjrEj2nyHnXfpmjmidvG8TCtO0N3V0+qZwMRryDTUZYwELFq4cn2
 MpO7JjhUdWzBGimbunNJPjwbAG2JmsPbPqNQvqKlBSXpsfi4TslLjex5CJvb1gqIOsBG8nSd6sI
 R/4ZQ0S+xUp3pBcRrH0FyZGZpHhG0UiitGIil8o6WVhPekHI86tVg0swOIYsI5NK6yVzXHsL6hk
 hm9mb9gInsR7a/HXVVCgV+uARiVkBO1Ql3EnIKw4GVMwxPQrb/Phc3FJVrVGLd7IcJTGrwHw93i
 6oy4UCo+KDe8w9xpcfsn8=
X-Received: by 2002:a17:903:182:b0:298:371:94f1 with SMTP id
 d9443c01a7336-299f651e44fmr12145065ad.1.1763440668407; 
 Mon, 17 Nov 2025 20:37:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtTY88As4AoB7Z5UtIz0zKfIxsT+larl9yVkjoVYdRp4bW+u5rnIYlZnwgfh4sdMsAXv8wvQ==
X-Received: by 2002:a17:903:182:b0:298:371:94f1 with SMTP id
 d9443c01a7336-299f651e44fmr12144895ad.1.1763440667963; 
 Mon, 17 Nov 2025 20:37:47 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2ccafesm157426315ad.97.2025.11.17.20.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 20:37:47 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add lontium lt8713sx bridge driver
Date: Tue, 18 Nov 2025 10:07:07 +0530
Message-Id: <20251118-lt8713sx-bridge-driver-v2-0-25ad49280a11@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPP3G2kC/4WNQQ6CMBREr0L+2pL+QoO68h6GRWmr/AQo9mODI
 dzdygXcTPJmMjMbsI/kGa7FBtEnYgpTBnUqwPZmenpBLjMoqTQiajEs5wYrXkUXyeXYRUo+iko
 1sq617uzFQC7P0T9oPYbvbeaeeAnxc/wk/Ll/JxMKKTqnDVq0TSXNLTCXr7cZbBjHMgu0+75/A
 WYb17DDAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763440662; l=1372;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=eYntB9cM32oNKNfNcv7GAaypc4YEZOINwwB69UtDnnQ=;
 b=6pYSAo8NfEQZpa5Z8fUuLDD92Fs2piN4uS8PQECz56RTN80+33ThWxd1E6ckC9AZyZiEKqimJ
 QSdhrb48OT5CmWJ/NFcdWIbHx5GgM67TrmLxf2Y6m5DSDQJDUtBkvYK
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 9JP-8eEoKyfLHcGlmdRn7lJwn962NQvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfX21Gn7AsLrXni
 YH1d6k6X3Oh5yEqan/K5iA5qYzcz/02dmYsXqR6e8b6WCKaoKPy3Ubcmemv4MiFNBmIUfj9AQvg
 AkybqlJMC6OJtvOPMdjWtb+uBXwCPAQJ+d00c75P8Oj5jYXWvfd+zR2PK8rkv+j0rsfg+vaUfUO
 cJu1yOu/i05TnnIFjR+Rw5DTDHjruht0dOb2Sq6LXenQ/AQQJa7JPH8LgpVEAGbn2G+jKiTs5Tr
 6veuJaLPBFrQd1FkBuFPjj4QAX6zIyDVpv3HuQlg+H4O/Txr37ZQBAQP49ASTRZYS8gC7I2Sf5z
 WowBJuhiTckpruFoezNqmXA0ceYvac7tghn7rsN2coyRPt31K+J+Dh2tdIHn8AIJnxJN8M+glRO
 mJmhjKzJ8cE1EDHUJlWL842hci+rfg==
X-Proofpoint-ORIG-GUID: 9JP-8eEoKyfLHcGlmdRn7lJwn962NQvt
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691bf81d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QxBZ9i5KDo26hP1ghMIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180033
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

 Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml |  52 ++++
 drivers/gpu/drm/bridge/Kconfig                                         |  10 +
 drivers/gpu/drm/bridge/Makefile                                        |   1 +
 drivers/gpu/drm/bridge/lontium-lt8713sx.c                              | 713 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 776 insertions(+)
---
base-commit: de0d6e19d2ef33ba34be2467ffdf3595da5f5326
change-id: 20251115-lt8713sx-bridge-driver-32704455bc9a

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

