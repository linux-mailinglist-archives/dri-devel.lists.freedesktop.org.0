Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6EC67469
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 05:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35CC10E1E5;
	Tue, 18 Nov 2025 04:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSFMwG4X";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPoqCsXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0517F10E1E5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:37:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHJ1mSa3916501
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6zDYrYdR+iycJ0sYRVFXMBXVR05ePvLN9oUY6h+GbOs=; b=YSFMwG4XQp7sdhPQ
 EO90LHMxcIs8FVq4UYUJdX0kDJbJaH+m84VQew4F5LxnBMv7zXzryzNqg1HQKuZE
 tQDjzHx8lBhDn3Oro81tKyEYn1651kcWf7IcjzYDjY8MoeZWfLl2Y2txMPhKU1pW
 rU+RS+uttR3YKO7r7oaStLWCqIVjMBVjzJrc8D9pldwG6UAmwtPrlpmXQCRABmFr
 LT37bOZCNKg5xypTzZILs2IGrX61EC0XZa94XQ2CPdvx6KnPqHw6DZNorfxQpzmY
 aCfPAwBVNUqyUTQMC0+Jw39VCJf8kV7HPrPtlLTF3N0s3dLuBejk8pva8gRI/saf
 6RxGVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fxaq0y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:37:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2953527ab18so13469705ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 20:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763440674; x=1764045474;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6zDYrYdR+iycJ0sYRVFXMBXVR05ePvLN9oUY6h+GbOs=;
 b=FPoqCsXYQzYCfxz8dTohCrdt1L3aZO9Hvq3CY1XPQRJrgzaPIBVBV6pko9yaKcACf2
 yzVKNnZzgBxyFEo9x97OxgNuTd6cctoRZfmtVgu0q3jMMWd7p8aWTxSXd3R2OkhKIDlq
 E/bVSJ/8EjqCBa1RvIOs62mjKUTb00iaQmgqIb7KpTViCfcA3vydjY1NpOd2almCSRj5
 CtbXugSGBDhBO7HprbEzA04Stcd3ozHpquoI4Q7Z9Scaaonya5lDt4R84R34hLOYUL25
 oeM3+VvPEjx7A1CdXWtyXSi34GGhl8ivIszIlP+xA2+RxQ3/v2i9uUsEDrMB6BPF+6Gj
 g34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763440674; x=1764045474;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6zDYrYdR+iycJ0sYRVFXMBXVR05ePvLN9oUY6h+GbOs=;
 b=wy3QbWbVLso0XIHdi/MdhPZaGWXQ9jXKCWpGVEAbL85YoCaabsxgTbvKcBYOzzWc9E
 JLbu3fccTFa8x+bjRKWH48QRlkm4CROQQKL8k4zxKbnOtFtobEV3feDw4oPncjMzPVIT
 IlyV2nFZwByTGJGOaJnUxSbPvhynTczFpn3TrkASnq+cSMUczT7w2Xqauk86RzpHTjmy
 XZ5oA2vCzftRWBS34wuzwFa8dE4X0XF/80M+KK3TetFG/qAOeuOgA9mx2O8K/FFPVHTh
 tehcBcHwbo1MKnm9w5Ro2XuqGip2r+t9/q7yhX+AirFGsxErX+Vu6BMQRxY8CM7NmRin
 AlDg==
X-Gm-Message-State: AOJu0YyDG/kQKWRFy6teEYQNuGDa2b8vF38sAGLXw3T7I8qEV1QhN3IH
 zLaMu+Bu6YnidJl6oF4Nd/0JMl5SbNrg5jV6WMdMfWvQekq9LBKhvVSoM05UUhHO91Bm87Qkioe
 cLwGqwQOAKszWldoAbl63ZWELHDXgTZzGondlKB0VKCL6GBxWBXYyjbEVXLG0qujMzX3KFMs=
X-Gm-Gg: ASbGncuJ6QLYFYFCF3CC5ZnCLqnszt53olG8eQ7KjdY55t3wJD8z4a9fff+Q+3lbDa3
 u6mBQU/UKe5i7TGHP+6FWnQy4oD3CRd2kZ8SuJOTl+6SLFxUPgzhE6fnWdhCQUpXfXVQ19NiehR
 nAU28U4mAsp5b1lrllH6SL942z4i/l/ttYYjsLBlzyVonGpJgmfvISpK++U3/7PoG/H9s07AHd6
 FNWaemtKG+zgcUCyHutZWXcO5r/XoLHcvT6UiB3OD0nMVafh0xv5waozoH8W27lFOmpULJKEUa2
 hswIHzxqcvH+Ec5PZ4Whjq0+VseODAJP1dP6wko53Ki6pJk2ZSDgDblvbieBs5ol7brTL7olxRA
 Wzl9QWmy09CHqJwod3wOL0YviAu8g6QEuzaxMWLWfF12kGh8sFc1YaqMYMuXXSpCv8MRPjZQ53/
 fwLi2rEy2s1J6lp3QBfa0=
X-Received: by 2002:a17:903:38c8:b0:299:e041:ecd6 with SMTP id
 d9443c01a7336-299f65b6d93mr10616195ad.8.1763440674047; 
 Mon, 17 Nov 2025 20:37:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0IvWP+z6wJPIorOdhkrTefI+9g5lpBqNUGn5qAJvKMh8WBTovxSfMz+uG47qChzgT+Aj74w==
X-Received: by 2002:a17:903:38c8:b0:299:e041:ecd6 with SMTP id
 d9443c01a7336-299f65b6d93mr10615955ad.8.1763440673537; 
 Mon, 17 Nov 2025 20:37:53 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2ccafesm157426315ad.97.2025.11.17.20.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 20:37:53 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:07:08 +0530
Subject: [PATCH v2 1/2] dt-bindings: bridge: lt8713sx: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-lt8713sx-bridge-driver-v2-1-25ad49280a11@oss.qualcomm.com>
References: <20251118-lt8713sx-bridge-driver-v2-0-25ad49280a11@oss.qualcomm.com>
In-Reply-To: <20251118-lt8713sx-bridge-driver-v2-0-25ad49280a11@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763440662; l=2011;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=qz4Xz5Ldc9/otglui7guw4sFZjWQzTzl5rBch2+0xBw=;
 b=zqsKdI0DfPPtTVM0wc2TE1ThgxYOwQljX5vANAFuXAW/JUpgZoQvCGXMaguDjdTySskvt1xew
 xCdlSxzBDaXAPbHqltM6gpMY502FChFM3NpwYj+1SaOtp6XoaVYzI7I
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: PjBocoeiozCPBdRjtMhsrMm5w9cXwazf
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691bf823 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8
 a=0rundtbkkiGdurUZRnIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: PjBocoeiozCPBdRjtMhsrMm5w9cXwazf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfXw2VtT9ixDOzF
 83FxWlT1/OjQoOWVLm9pg+0iqPyOFSCMAztwelzbtLgYFHYtSe6//deGmVbkMj2lMpLKwSwlPI2
 Xiu/SL4NR4BUsqxN2Bc8ZgHxr0H2UgiFXFdqdpnxgwXujeBPBmOjipNS1oECzxWu7Ri52KD269G
 pgfkMfAid4TcspYrWGl6+0UuoWjcRDrzd7k6wDFCYb/kchQ7QV0p5wek1r8Sa8+uzjOMNFODX+z
 j02hOa3EZEwEsaLtyt3rQq9tycYfDvoWgs+JbW3fFDO2K6wsv3f/bTqkzxZZaYoN+27nMn+Mex0
 Aany1j6Dc+gfZTZhOcZAe8qYFgsIlckSeqSLKIcTlHX/e/UBeLJEnHu16RkhvRQ8ouklAV10dcy
 WpBcWDUZdKlG9dne+lwHo99E9zfwsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
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

Add bindings for lt8713sx.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
new file mode 100644
index 000000000000..3fb7e042c688
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt8713sx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT8713SX Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0/DP++ bridge-hub
+
+maintainers:
+  - Tony <syyang@lontium.com>
+
+description:
+  The Lontium LT8713SX is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter
+  that integrates one DP input and up to three configurable output interfaces
+  (DP1.4 / HDMI2.0 / DP++), with SST/MST functionality and audio support.
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt8713sx
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator for 3.3V vcc.
+
+  vdd-supply:
+    description: Regulator for 1.1V vdd.
+
+  reset-gpios:
+    description: GPIO connected to active high RESET pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        bridge@4f {
+            compatible = "lontium,lt8713sx";
+            reg = <0x4f>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

