Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D0C156F6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD0210E5ED;
	Tue, 28 Oct 2025 15:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFzvOHuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E21E10E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SEnvJT1886891
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SgQcI6nkUnBLoLSFlYf5nq81TfhQzj6LqBeVf4PPgVk=; b=pFzvOHuh4nCGHeWN
 /GU7fuhzd72e7qhZ0GRl2PfyS1MvWyuzvWKsVs7NTplKuxYIZgbPWlzZFXNpfwPn
 n3gVhWsWzrZbRmgiIShuRgD0WoFNUTUigMC3QQxAfulytvvnm4MmKOKGpPKCd6wJ
 seNnKMS4KWXJr+oJUwjXzqb+rqasuWGSNo72QTY5qrfw2+CthmxaTZYdO8W1IWUq
 MQOKfSfX4+Fr2pIvuy57fbAcPv4jaixzDDDASfM3bJa8AuSwaiI1Lbm9i8yx37uq
 sBhtfhYVp8Jszvgnd6lPnW/jkZWxSvCDGqZCdqiM0UmA/2TIb5g7I1tsPIg7Qs6T
 vOIFQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrt4st-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-294baa12981so24608805ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761665228; x=1762270028;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SgQcI6nkUnBLoLSFlYf5nq81TfhQzj6LqBeVf4PPgVk=;
 b=hSQdA94mzGb5HCDppzh4kK5r0W2yoobbtzWwjg9jQqm3avcBZu75om+a4PPRohBbpM
 BXymwBqhFVzhTW3h3l+cQNp1eiOWdYALFP3eVI4aCTPqJEGU8fOFY1ZC6L3eecughFOT
 AZwEYoNSRQP8ke2oh0/H8spCxgKhaT/TyJcnP4r53mJVAuAl/sve+0s9IzDdct91ZghK
 S1CHMEhqOfJShqTKzLyHdMp3XpZCqGswlRXm3JjEjHb9pZ4kKJLzKriO114O0wxSIPNp
 OHCcF6N45yU3V5XEQn5H9bQhCGFQi/JxCl1M7WKafmnba/rS45qTB9V2urBFWo4Nw5iN
 Oa6w==
X-Gm-Message-State: AOJu0YwQfMYqPr9NOULqDsJiuvrZUj0VIktKnxk0TGE21U9NZjXtR3X1
 bOKRE5YPgmR1QiCtvtIyK6nNxJ1pnQub5p7TYqAjDU6ZbGN3RNF7y6Hbnguuy5UA/pNMuldj7zk
 im/lx3dyJcFnFLK++lK6y8Th03wtjdIHfdkIq+6u2G6R+fgSGiSebidPOvNDqknh0lxEx4BE=
X-Gm-Gg: ASbGnct7CZwkShJMRHTIi+J//vE++wO48QWIgSw5CXKXVhL1NRT7trYGjw4/kZIPdQl
 VBXkE7OEhyuyhJK/9GzHBdzRM7s/SrlUcRDf395RITW1xEmdBWAqS4T+nmEvbyWpS/zIhzDjkml
 WKNq3gZ5wSuKp2FTuFLkW+8aWzk/T3EOuXS1EMTfdRz1xy5XM3FFgiPwjpElyM/r8cB60cSHASh
 JdfNvpwyytVk540EgGfKOM2iZ/WmB839wme4ZQCIYDohkd1ojMzkG4pbk++QJRw2JrgDs5caMov
 m59G00Po1RTCDsNJnvpQhrjXQ21iOWP14Yx5VgFz5OcnDl9aZ52oaRLbCNhIbXlmk6ECrXcGZ1h
 ad+Vndo0PWu2OOSMQAJQVEd+pjnxl7qc6qGo=
X-Received: by 2002:a17:903:1c8:b0:267:8049:7c87 with SMTP id
 d9443c01a7336-294cc70eccbmr43094205ad.14.1761665227284; 
 Tue, 28 Oct 2025 08:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr3oiAmNZooz/nfH0CRpP85CU5ciJ7wKCzEgD0BM8YcfRozU3AQY5O8zEhnyFkgZ8zfF4Sig==
X-Received: by 2002:a17:903:1c8:b0:267:8049:7c87 with SMTP id
 d9443c01a7336-294cc70eccbmr43093825ad.14.1761665226706; 
 Tue, 28 Oct 2025 08:27:06 -0700 (PDT)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498e4113fsm119490755ad.90.2025.10.28.08.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 08:27:06 -0700 (PDT)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 20:56:49 +0530
Subject: [PATCH 1/2] dt-bindings: dp-connector: describe enable gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-enable-gpio-dp-connector-v1-1-2babdf1d2289@oss.qualcomm.com>
References: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
In-Reply-To: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761665215; l=951;
 i=venkata.valluru@oss.qualcomm.com; s=20251028; h=from:subject:message-id;
 bh=HIse2/6LjXjNvqZLf8SY4sWJTdhbA7cCdS1xQrYMFgU=;
 b=q0dbkVCREQhWewqq8/EKUDSgVvCuBEABQSzKjyuiLuCHJTRuASfPE1UfYiG3XGad8+8c19CTg
 CG2gaZhBbFlA8k1HaBK2J9OLlFQ1dZyrE3JE7nzag9kJemdz+dLXLc2
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=KEpJdy7/I8HDmNSf6B83x+sFHUNr+mjMNJ2qe4G/zXI=
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900e0cc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PexBTdYITyibd1_YPJUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cLhcD8bmX1np-5YI-6avkmwC0K6yUNfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEzMCBTYWx0ZWRfX0vj0sLeid/WZ
 pyvjlYbgnUiQyeSOmeuNjdyxNVWGRJoQ11kURn9i7/7qTFEgJM45tYnV96dJCb8Sv8X10gAD8Tv
 MmIBsFGmY93AxLXCMh3U7m5SY2u0pRhMYrQKkDhWsEU/msT38SO78VOs24ylBfPOFEdcWRdaWhC
 bkfj3AZ9Ci4ivgILbBvty5G4qpXFoUj5+w5vdzOQK4FDoT1UUg9DNo7MQl0xSfSQLd7GnOD2Vk+
 Vy99aPf9bsipCakORBuirjyp3NHE1yuhRhkKIfr/DsUAMsuryBuWQZzsY9ONJdMO135CEu4RuGL
 A4toe/KIHuRi2wQ7h65pu/yt3SS4WdpF9iL2Q4FQASG4/0sJQCK/8XwsrNGYvh7gGYqrnnlm9GF
 CQ0sID2ad07N4+aAkQwt6euINcGwTA==
X-Proofpoint-ORIG-GUID: cLhcD8bmX1np-5YI-6avkmwC0K6yUNfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280130
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

In some cases, dp-connector need a gpio for
connector to be enabled. Currently, there is no such
entry so, add enable-gpios for such cases.

Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/connector/dp-connector.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
index 1f2b449dc910..e703b19b7168 100644
--- a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
@@ -20,6 +20,10 @@ properties:
       - full-size
       - mini
 
+  enable-gpios:
+    description: A GPIO line connected to enable connector
+    maxItems: 1
+
   hpd-gpios:
     description: A GPIO line connected to HPD
     maxItems: 1

-- 
2.34.1

