Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBWxLdUPp2k0cwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:44:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA91F403E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA310E862;
	Tue,  3 Mar 2026 16:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWjBIwnI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyiCI426";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7B10E862
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 16:44:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mmui3995362
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 16:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PMCXaLhX75BG1K4O5PlDSW8Z8GT33a6ZU42uHz3nIaw=; b=VWjBIwnIpN9xPezt
 lKkTdTDYBiBBIQbCLUyqS1ONcVy/jq5wZKPuQyyiSyL3KDjjFRdjTo9ygGV8M17a
 FFwP0S9KCb2DFYmsWX67QyfPc1DUBFQX2zHv3CrxcTrUdh8Kfd2budXiiDw5fmK+
 j5DTR02i3UQYF5rNcvqHFRX6/mxLqRQeJdtuyO1k95XoifO07Xu1dcYCMj9o62CO
 uIs2supYpmRNfvMI9t9qY1038aT9IMR7lUYSe3KkKcZNl8CyVS8WsFgLTiU1p4Kp
 2x9KQYXXqwBOurQmcNI+uMLzOSzykNVUzIwOKmVDPpdbToRRVT5DEFK9PEuna1Ur
 y995Jw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5ft8d6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 16:44:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2be2592f6c8so67743eec.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 08:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772556241; x=1773161041;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PMCXaLhX75BG1K4O5PlDSW8Z8GT33a6ZU42uHz3nIaw=;
 b=DyiCI426QKMEIuOnWSRvtEiOn0Nc9jAOjP7fd+dYw7JEn+Pc1WmeHylbC/krFKD+1I
 6638/8zjWbm1tkcODgFElbTEc9YA/VeOzWbbZUlok/2x9oGQ3DorH8VbFqChryTNjwcr
 9hqUcZe8cU6KlEkCcph7sZ6R+4JSDn4sfawT84eFx/S0+CJxxkIl4R/v3FrIOnMsrksM
 ZVeOnwYSg6b5ix6iA8ioKc/6AJ+HZWefYAK9cGfmkXGyvq7fMJB17z972vR0AjuyzPol
 KrhB8DjmRwi8SjSXZ89ECn+g8wghSxoYJoXQ36atX+XwU4QKbKIjwWWX72Gfm68DPPQH
 WWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772556241; x=1773161041;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PMCXaLhX75BG1K4O5PlDSW8Z8GT33a6ZU42uHz3nIaw=;
 b=eks87sMelfOedvpCTKZyCet3/Qh++4nTbxgzCQfna7h3ADqQGq1JG5M5apDS53/g84
 cd/RihJdGmVylq8EpcYgTK8IwGCBkSb77zqbM/ANRdD4lkoWeFj6IndWj8Rc3060JO0T
 cxXL/hQicN0hiBD0MrSXo6rAhvsoXKiVppugkGlUKPZ2NcwnWNA0Zek94RYIZU+lQwhX
 oNQYZu7FEKH/ATRhPl/XWYxVGF1Pq5gfke+wQVYHQfv/h0zvpK7kWfAv/yW7Jv92Uafn
 UhvgVm2FgHHifQnkOfNbUN+5mOxlNJz65UzgACVlJhUNGZZjc2oKzVECV8DRRKo0TsZM
 9ZzQ==
X-Gm-Message-State: AOJu0YwleM7aKBTTwDBa282BaSDAJeAVDSn3Xva/hOSkFq5yA+ne4ppv
 mSJwjZhJdces1V2sP0OezywZLgbG2tJNPP9AYq+BSJqFTJ8LElvnZZ9uXEuBEHfNOSxlKJ0glCk
 1tjKBeDdcbg764oQ7dLLL53KWkkoLIGOzTCNE22pxMpRI9ctUkf+8yI0KuyT9Op5gtJbyihA=
X-Gm-Gg: ATEYQzwfadpXWBowyMsP6FsDx0aWUidliUD1Kb5GrsTS4RMUfIW+AMIBPJd5s8xld0V
 QY3KaVUA+wpaRyMr3VxGhLHwrNRWpxXiFnsJzZy4smSykyuDxqSeskqnM1gM2epAGp+Y9ZhGv3h
 JYsioutE+Pcg9U+kY6R6TQXyVesI5/QySuC8Etlb/dVBabC1r0qYedqy/BYlWxnxklXusnTT3ai
 2zA+LwRWukkelgwbDUfhBBH+JBw4gLU/gaPX7Gsi+Yu/+71cXkuHzRPKtHErrAK2B/JTDESaYYO
 8CbBXJMKeAJjPYElBQQsfTy3zRTgN/9oXPj2WQgEIbbs1W5zyOz/03tWr6OFNHtLmvp41sF44va
 WCW7ojGAIR2IkDTpId4tcCl6TpW7i0o9k1BnP1xqxD+3VVfA/r2k9nFLfdS6NDEHbrXC1C+aQ1s
 IkWLOfnty21WMa1CyBbIqQKLsXw6ZCOEGBx9I3VEyTOw==
X-Received: by 2002:a05:7301:678f:b0:2be:6e6:e47a with SMTP id
 5a478bee46e88-2be06e6e93bmr1552266eec.0.1772556241213; 
 Tue, 03 Mar 2026 08:44:01 -0800 (PST)
X-Received: by 2002:a05:7301:678f:b0:2be:6e6:e47a with SMTP id
 5a478bee46e88-2be06e6e93bmr1552246eec.0.1772556240519; 
 Tue, 03 Mar 2026 08:44:00 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be002ee839sm8823286eec.8.2026.03.03.08.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 08:44:00 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 22:13:35 +0530
Subject: [PATCH v5 1/2] dt-bindings: bridge: lt8713sx: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-lt8713sx-bridge-driver-v5-1-6cc2a855aafa@oss.qualcomm.com>
References: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
In-Reply-To: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Simon Zhu <xmzhu@lontium.corp-partner.google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772556225; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=FTl1VHbro06Cq7dDNE2H+m42V/aparGWxyJQbf6/hAY=;
 b=4DlJUGfg7OTvxMcsFAxYYFK8fsr4HHxZr1GthVvOPc/A9Fu8Cyd6/jUVYyURPtVQG0BBDkfK1
 m8xlAKqZKOICysR2J2X8PehX4PXQqp8pj9Qp7kZtJyF7lXFyrMDWXu0
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a70fd1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=u03R5FaqcccxyDpVlScA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: MwRp9Z302JeH8K0DKTT9li82ydY_iSW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEzMyBTYWx0ZWRfX+uuYJxMGeF37
 8Rbqhz2niTvhrZSUTGNrKv1wAJqF8xvYxK6Rda4XdSw5U2LVbaN6hQhZWaVf0OXewWAd1pkndOF
 FI9x0E0X/7yAsZhfC0Mjwzn5PltO6A0icC2AwJxID4NETKP4tyDZDw7R+ciCKp6nu6EEkipFo4j
 k9qzXYFfRnxLUfE+Vx0Poc0nyLiPUy5TSjIc/4/aBR/U/Uke8TxRbOistJ3jR4itSzlZNysdBSs
 A1jTrOlxkgJ3KeMpSBstjECtgU81g2vfMEHAJJvmX5Huth29e4+xJMQNN/kUg3EmlKIeHi6IMCL
 LCS3AW/dzq4tDAC8onTcgqrggIbt9peTAOL5eXMXAZImQxrzt3+n9ptYSrRld9ogg+F6fIp3zpA
 TmHH0A3a0DqCNu56147gpb4saIAwYv3joOxmp75mCaRI6iFAx1OXuNk8yBzO1ohjdM7D1ULXscO
 9i6HD4/ie5lflIE44Ng==
X-Proofpoint-GUID: MwRp9Z302JeH8K0DKTT9li82ydY_iSW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030133
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
X-Rspamd-Queue-Id: 1AFA91F403E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@oss.qualcomm.com,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.3:email,devicetree.org:url]
X-Rspamd-Action: no action

Add bindings for lt8713sx.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Simon Zhu <xmzhu@lontium.corp-partner.google.com>
---
 .../bindings/display/bridge/lontium,lt8713sx.yaml  | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
new file mode 100644
index 000000000000..a5ba4db11a7c
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
+  - Vishnu Saini <vishnu.saini@oss.qualcomm.com>
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

