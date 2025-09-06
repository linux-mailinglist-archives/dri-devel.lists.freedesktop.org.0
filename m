Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE57B477C0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 23:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184910E05B;
	Sat,  6 Sep 2025 21:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqZD1af1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8100A10E05B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 21:48:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5868gw7i025503
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 21:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=duMhnqfLjphXvSjGPmTHVE
 iWVH5TfJsRlnBS37ltgSc=; b=IqZD1af11hEkr87hulsqTECR3UaKxSYelzyHG3
 RwCshDicpENhAFMWWfxaWNfzXWEea9ECh+Rh2Jxn7t1vvrLzc49RqQQhD8s8SS/1
 nBxymMmN8jwz+GBlipGsHeTiSzESi02jJYlYIv8saTTHu+Y84GRg7BY7Z3lC2XY2
 jcLCfPZFnSgXllb9pug/cUztJu7W16YGlbVqYJ5u8sHkKyyjF6npuNxoy+FhU5y5
 Q8HMf/rCMXZbG4UGdhXUvO5SRskojjbalI9aBLTFB6nikjS5RXCa39qO5xUzXgxW
 x27YnA2TVK3EtdMU9+0BKKuuV28YvvCPJhgtf0lNOP/hg68Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db897bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 21:48:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b302991816so72838071cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 14:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757195335; x=1757800135;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=duMhnqfLjphXvSjGPmTHVEiWVH5TfJsRlnBS37ltgSc=;
 b=RlE5c37ZcQr1pesCNPIP4GtbFZL2I5yXHdJKMqobkpF+270g46H4kQ4Kwn2u/ufbXa
 2n/y/CAl1v87oGxZkQUEcsZB7xgJPEIoy5veG2DCtGH5bJIR6tTaDx4CSAARUaSeBUiM
 mkLR84isgSuz1gjLCGZx4kSdVwnEJDOu9ksbUA9wrKar/Yokk2eUVZeelo8IH8ii6SH1
 Sv9zfDeySCTQn/SYbCmpqGk+8G0HanTwFHYVANamQnutXfpv1EKoMTGsPlXhVDLRmax9
 nrzukUOds+MH4BY4AQmDLmEhreGswHVoP2SZG14tWOhNAMM+E0tq9R61xEKuxTyIMB+Q
 wihg==
X-Gm-Message-State: AOJu0YzuoaOyUIoJNS4whPdL5FaqkFe4Ajf/xACYIShPpTVnluiY6s/E
 TC13fEHylKTr/lqYxJgGOE5VAh2lci85Ru2X1OpibNrU8KVEBdUwCwBGD6Zsp8EwyVQZUSPHIOV
 eP4JKPiPp4fMb0Fxcy2BAQzPTJO49ZEXYhVJjcvyFGQ/m37jgrRVccFzunbiGzC3t69vBGP4=
X-Gm-Gg: ASbGncs02yVnl+hSYEpbFbiq/vdObstyKbkJWSjn3AyZP4rF0DRE5a40stbwAR6LOsN
 Gz79KTIB0ouwENSCemqvTWlAcQCEf1mYMp8bGOJI0eMqntNsO8ZCQ5l0ruBXP3EvwICjt4s7IGp
 ufyNvfRDT8TwoL/nkjsmN0gqScurWKT2P/Tuiam1hl8uF+4UWtUxgMNaaQ4zmfhpYOFuEucSjZQ
 Ak/kmWOC1h6n9M5nmTRnE6NEzAHvI8gdIHrK2hKbwG+lrcwh40DXVKeO4drVd3dis+5q0s+8cNI
 EESXOZD2jmpIWawZBdUoSklgbF7b8zLrSWJAhGx86m9932mf2ryNcPI+8PM4aLynCvGM7/bX2jT
 fU/Q4nL2R1K+0NFkGRa/HcTSJJXhdnP5AT/1TV+htOajYolWIq00H
X-Received: by 2002:a05:622a:15c8:b0:4b3:50b0:d80 with SMTP id
 d75a77b69052e-4b5f8569a7bmr33521221cf.57.1757195334713; 
 Sat, 06 Sep 2025 14:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx9lboS5t/Woj+bBQjp+nx7XVjfxf9kWYu1057+otiUbzZVI1hnBUp93/r4IT74n7N+b88yA==
X-Received: by 2002:a05:622a:15c8:b0:4b3:50b0:d80 with SMTP id
 d75a77b69052e-4b5f8569a7bmr33521021cf.57.1757195334306; 
 Sat, 06 Sep 2025 14:48:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608abc1798sm2561252e87.57.2025.09.06.14.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 14:48:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 07 Sep 2025 00:48:52 +0300
Subject: [PATCH] dt-bindings: dp-connector: describe separate DP and AUX lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-dp-conenctor-sbu-v1-1-de79c0fcd64d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEOsvGgC/x3MQQqAIBBA0avErBsww6SuEi1qnGo2KloRRHdPW
 r7F/w9kTsIZhuqBxJdkCb6gqSugffYbo7hi0Eob1SuLLiIFz56OkDAvJ7ZMzijd2s4QlCwmXuX
 +l+P0vh/V9OMjYgAAAA==
X-Change-ID: 20250907-dp-conenctor-sbu-3ecd5023765c
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zhvNXMGegR9yDlqQMy/XBI510R9HnhJWonOW2z5xNgY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBovKxFW1OreFn+SDGcBNbj5YDp1tiTmrYKC8QOh
 LRNOdYOP5qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLysRQAKCRCLPIo+Aiko
 1YfFB/96xRXM190qb0+pTgJYpZsWQibT7naZGcx3Y3dPL+uoae2fdGjO3vswImhQjRo4bX2agkI
 xzfyKV3O7ZGqN8Ew12McEVJe0wWcvMPdk9jRgUN1smnGC0gPXhyhoQqsK6WW56KPRefdRhIWEd9
 Es5Wo+xLSsXY9jZpBpSaB8VkRsoCWU7qdOJ3Jxme2p4unncD9wrtvfAJpdzEsLql1RMKXcit0x/
 hdUioxI2WwhPZVTfm55CAE3eGQ1p0R5Me9C+yfMPa1IF5u4764Lp4118IJYrCzdLNX3mQLCalrs
 U6115TK1DU3V4QUgJbWFH6z0wea7AyhpUbLT+WHeM1yl8yB0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX5fUiVK3g+9IY
 pRGoqg3uTF4A0cr8OC9RM4qACtlVvAHfzGMjsRekLWvvYKsdYGiT6mkco2gtYeIqN7BrcPOHCRX
 o3w/NZiH0u6xuw+8G8Icxq0uRKlDXkE67lO1QMJ8CIbp/80Z/ILM7KwVJZ+JqNXI3YSed6Lmlsp
 4CKlMp7FtYdBDTZC4uV2aB46HtdDshVW2Z1kR/8P2Tnb1QR/uLYnkBlq4rmWUHYcpuZvGIOAF7e
 Fj1iPnPBhFo/uTIkAoaJBTJjpc8NNbyhG+pjXJ30rw0lqkA3J9NSJZScKY+BNrmsR5j9D9muz16
 Lke4i7OGeKOwkLiRT2p+c14quDdBUJXJubwRgyRD+78uFIQAwj3TpxOJ7d4RDsznrsspU1aVURS
 d/3nN0mv
X-Proofpoint-ORIG-GUID: F3KzJaXtVRwwaxgqhWpzCV75sSCvXpCY
X-Proofpoint-GUID: F3KzJaXtVRwwaxgqhWpzCV75sSCvXpCY
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bcac47 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5inRAbP7wB7EHgTAESYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

In some cases it's reasonable to describe DP lanes and AUX signal lines
separately in the DT. One of the typical reasons is if the source of DP
signals can support either USB-C or DP connections. In such a case the
transmitter of DP signals have separate ports: one for SS lanes and
another one for SBU / AUX signals.

Instead of leaving AUX signals from the controller unconnected, add an
option to the DT schema to AUX signal lines separately from the main
link lanes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/connector/dp-connector.yaml   | 52 +++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
index 22792a79e7ce5177113f17ab472048c220dbb3c3..1f2b449dc9102c34ad015bbe7beae0d67a2df5c5 100644
--- a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
@@ -31,10 +31,32 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing DP signals
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph representation of signales routed to DP connector
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to controller providing DP signals
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to controller providing AUX signals
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - type
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 additionalProperties: false
 
@@ -52,4 +74,32 @@ examples:
         };
     };
 
+  - |
+    /* DP connecttor being driven by the USB+DP combo PHY */
+    connector {
+        compatible = "dp-connector";
+        label = "dp0";
+        type = "full-size";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&phy_ss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&phy_sbu_out>;
+                };
+            };
+        };
+    };
 ...

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250907-dp-conenctor-sbu-3ecd5023765c

Best regards,
-- 
With best wishes
Dmitry

