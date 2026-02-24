Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LPNKjTmnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:56:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E318AD06
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB7F10E60B;
	Tue, 24 Feb 2026 17:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUcEFd9j";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyCerOk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CBA10E609
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:56:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61OHf8722560769
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hYJgXTA2R7z4h4lRZ8hroPs3UT7gAkIOfXYTE+ORk8E=; b=eUcEFd9jxoz/TL2M
 NJhrXnhp/E3jah66QBRaNNqPT4/HLIoMedFteCVUOfcSAbOiY0GfX/KLfVhSmjob
 RtFycf0Nsvc2gTOPgYDUsiqm2CV8nXQEUbWY1JBk80L3dGlhrMBa3F+1VcGPkQw5
 HS8wBX/sBuUlwEPK+teg7EmiCzCnNBePPmZSBXck5i43KZ3QQnL87Pp6Xdl1WckG
 4YohnsdFzHtT9Hv2izNLuMBah8laihPcG6nfJcSmROIZv6KQcgdaImMJCpZ5Y5sF
 vNShouOy5BI5sNpuhR1JqsHCitVHURc9pZIhIGgl5sA8joiEBA/+MM5dGj79Wsdg
 gSF49g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e3afd1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:56:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-824ac1996bfso1858578b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771955758; x=1772560558;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hYJgXTA2R7z4h4lRZ8hroPs3UT7gAkIOfXYTE+ORk8E=;
 b=dyCerOk2wS4gV9gIJ37mhW3cmQ2DCQsqSj7vQ8lYGPDX68ell5DleL184CGcEesFhh
 wSF6EgM4G/07+vVITiw5m73n664QE1LQKXB4aiMpBWNi2IB2wuE0pQvhWNtmTmLMmNLL
 uG0uoj6XlC28RzWoUxf6JVozcnk/a0PdGysDfG2IAcjn9+ALPJNjzz+rX05vdACV+E/b
 WgbIMyVO14OsodpFq25JssMDdV9uiMQzwhwdpgEdq22MTi0oEKZOD8v5jjyeJS7CRwZ0
 vZDZ9FFjW7VWcV/Qw13zr9qUaiA86L6TfucIc4BesW3GgdMa/wuyKrTfYWmNlpMFw59K
 wmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771955758; x=1772560558;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hYJgXTA2R7z4h4lRZ8hroPs3UT7gAkIOfXYTE+ORk8E=;
 b=sq4U5qAnfmctjeL0Lkj1RnQtCLwDDBvt0RGRG+hNKfYXu36b3c9c9AOC30k30bKaS3
 7pY5XZnkgYsiNT/ZB5o6HJtpuo3Sk6JTOCqEVYF5o06V4U56wS794PUYhfPR6tKuoJDJ
 qYum6xaCXqQR8wLA8qTxfr4MGiS4cP4VpeBI41nMNRXZeKkq5y99W+QlTEtN4eY+Yu5a
 Unkwp9wtDSN4WRza9iH9zuI0l7+6qjso5FaPwcq2B8dlsuXaGY++AN9VT6Z0oyezUMY3
 eZEP16wBrZtF42eyxsDbMRVb0TuxN7XCU+cf4ggIOzkePXAZLRUAncH5fqS9yt+O2FS+
 fHNA==
X-Gm-Message-State: AOJu0YwSKHtAOK2FNz724J+ZVxwl1uEnT6kX9gG3g+DRIMVa9Y55ekR6
 eXtSpilP0aRFCi5VhpfWKbX5vzVT4icjVDnw2tclE3CN41dv7CmsKtD52UVb1WsC2amEOD/840K
 KYIJICLW+JncL2wiHdM/+qBJgt+go80JpVOILjSwLoBMHe//wLRRXUMxJLccu8RzR6wPQ+L0Iee
 xDEY4=
X-Gm-Gg: ATEYQzyuHGAWhnBY7LBJ61w3j0xfgvxBhY05RctJWa3gAxJ42czUxteWSji6eh2bvj/
 IhQex5f+pLYeQ/lUkZnsmg3fiI7Tlokf9TO6T4pn0xFctTQRVH/RsOYNj+pytKm0024nEz5jB/P
 yETi7FWumLIcdBd23oc19JbGVTGwxqhV1+ACme/90asjguiv3+GPNmjEbZZdo5Yq4bfA3z6SDZK
 1obIMZlZ7+Zhjeqv+zCx+X/JBOkfYf+Z7NN4WyInbBggeu+T7Kq7wasLRf/pbl+hxoa7n2lWhl0
 yJ7ZAwdxuicJvpb1tawap5F6gCqwRsJ5JSnreylH8lCRIlZSW3ObN4IpEs/W8FhLv4gPg8zJxFK
 60PniAniVugRW+vNHUlzCuQFzMpLKP7zeaM689Ghx4npcLbd7SK3KzErOdbil35P5bNNSdQR2B/
 nzSGaAFNcRvk2wJY/kbB4Nl9XNJhAQY9n/bbFOKbF90g==
X-Received: by 2002:aa7:88cb:0:b0:81f:3920:77ed with SMTP id
 d2e1a72fcca58-826da8d7a31mr8271228b3a.2.1771955758006; 
 Tue, 24 Feb 2026 09:55:58 -0800 (PST)
X-Received: by 2002:aa7:88cb:0:b0:81f:3920:77ed with SMTP id
 d2e1a72fcca58-826da8d7a31mr8271199b3a.2.1771955757519; 
 Tue, 24 Feb 2026 09:55:57 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd68e147sm10338005b3a.19.2026.02.24.09.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 09:55:56 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:25:35 +0530
Subject: [PATCH v4 1/2] dt-bindings: bridge: lt8713sx: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260224-lt8713sx-bridge-driver-v4-1-b5603f5458d8@oss.qualcomm.com>
References: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
In-Reply-To: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
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
 Prahlad Valluru <vvalluru@qti.qualcomm.com>,
 =?utf-8?q?=E6=9C=B1=E6=99=93=E6=98=8E?=
 <xmzhu@lontium.corp-partner.google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771955743; l=3760;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=9oh1sckkh2C1ohYEAQGEpWZlxZnkblry8brMY0fXOXo=;
 b=pvOYgVgi/C91rA+xLa6Ak2CMkfXozjKKLF7VPMMdziKUACA3JQG6ASNvS1SurtKWaxBaG5aJf
 DCQhBVPOOHADSo6ngmrWWkWW2fuFWOoVBAi9ByIoFU+vgGXnYW8zVJn
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699de630 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=Kz8-B0t5AAAA:8
 a=u03R5FaqcccxyDpVlScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: T39YIejak4QStcEyMn4GcLVK2XcS70sk
X-Proofpoint-ORIG-GUID: T39YIejak4QStcEyMn4GcLVK2XcS70sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE1MSBTYWx0ZWRfX/BjLdrD9gWS+
 4ODkBiFZBdvu5YNBDb11/HY9vL3ARodDzoRjS6zrQgFos01krK4JCLyWIAcZq21wF9O+wiA1zjh
 iGtMjHjBq6SQZenJ4a799LkvGZ0YrHandowOlYYskMHDkJax1DMujEYFeg+RFHf3q/WbZhNwKzg
 pH4aXV732foO2TeibCe8VFTtt0dc46SpSecC+dhONvAupRsCP6b4rqqt8QJKNIqjeTCr41R6wKg
 hlGSpC7brZjrckprFCDUPfv4hxOQLYskpNkwCfat46/rkRdp+dn8NwpM4Z6ynfF+MD8dbqFuocK
 JcfHusgbYg6HyGVCAV04NTnblgwusrfv8G9lanRMWum+/FbJbrAEf5/075B8IaliINLpES0pbRf
 q56sG+iLDkKIxqGtq0l/RFVUfOiauDXc2chjsriN22MXBV3fWHIlcfINseSIHirRvk5fesCO+5X
 nB2nIg+FiGSnNslkycg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240151
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@oss.qualcomm.com,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,4f:email]
X-Rspamd-Queue-Id: 093E318AD06
X-Rspamd-Action: no action

Add bindings for lt8713sx.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
---
 .../bindings/display/bridge/lontium,lt8713sx.yaml  | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
new file mode 100644
index 000000000000..29a773154b39
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
@@ -0,0 +1,113 @@
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
+    description: GPIO connected to active low RESET pin.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DP port for DP input from soc to bridge chip
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DP port for DP output from bridge
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional DP port for DP output from bridge
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional DP port for DP output from bridge
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - ports
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
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    lt8713sx_dp_in: endpoint {
+                        remote-endpoint = <&mdss_dp0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    lt8713sx_dp0_out: endpoint {
+                        remote-endpoint = <&dp0_connector_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    lt8713sx_dp1_out: endpoint {
+                        remote-endpoint = <&dp1_connector_in>;
+                    };
+                };
+
+                port@3 {
+                    reg = <3>;
+                    lt8713sx_dp2_out: endpoint {
+                        remote-endpoint = <&dp2_connector_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

