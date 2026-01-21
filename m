Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHQMH16ncGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA9550FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A38910E740;
	Wed, 21 Jan 2026 10:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="axcVtbyH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cR3QPDCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E9210E72F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L6XNZ82938563
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=; b=axcVtbyHHVD+Dxs7
 tjslYkNyKv5bwpBIOzS+mPWtB13WRf5eog3e7x3i4QlEQ6UhG8H1qfyWaxm+pdQL
 o3LQXQzj0l3VAQoyknFqSDf15MWVuRgfJd7L0PytVWCTEkeGRdK8Zzq5DITZCKyY
 gaxiHlJydHQnKuQ57cJ72WjsWc53Gi3+6s9g2VwvpiW3FhW3I4BRa/DzJ6HSfCV/
 YDi1WnzWpqGAIdpkV5c5bhSYs++PA2Pge2BIfWNK6iNoM4Jqu3eIY7GmVNU7efdP
 kaI/IbEvGS7/P1+R9ptO/zbX3tRm55bd7RO2bBcMnv1/zkgHUKoVxuj28Gk25vPl
 IOVwZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu908n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c538971a16so324730085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768990549; x=1769595349;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=;
 b=cR3QPDCwqDhyNBq4e/akaoAW1LwxkA9EXzYtlU5F1AjC+qEA2m+FuPj1xyAInNBu9h
 7eoK6EVjs8rObKCqtEMkUzpVr/Y00RgOsSJyuxJoqRb3F2m/sH+72jrI3/u0EFVIi7iR
 y+r6lr3wfVcH7MYjKOPjpHelBfWSCvdlbUkQv+AFbtpn1+dC0pwk3oD9vtq9jM0yiJIP
 r8tpAqeczNPEozsdrUgl34PC7yAYS/RgvhX78UtU2x3bLDMqTFh0N6lBUwr6nmbrmcwA
 kj7A6awGYd72GUhzPMyLxnI2lr3c2CYEVs/XnZAKpfOnVQJEJbxeyLQr/YX9E+f+oHAn
 O9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768990549; x=1769595349;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=;
 b=GFNdl5pmVkVzDVcxU8nRoyWztez+qZ+hLL8kIIMcSs8fLjGV+C7HOOKL1yLUd4mBW1
 Z1yjA0eqTp3AJVRC4BkIokD4L6Ho21xNv+LhwN4oOI7FaHwkouxb5PdzgmWfVl6TlYwl
 zgy9MzFmUf9V7G4/17NHLM+bFiVtsY0Ut0kWArodIonEVP3NvzTLbZFkRglslDDP2D12
 Hu7YzPtC9OVXjRmdBuOrC+qDS4qNuU2isplw+WCz9+9FABYFxUjHYmylf5a3+OAAuPTz
 67iXyijyfiEm9bLgoKVSbBzPIDjX2+oNrQXBPApoPqIXzfOaYX/KG1DdPcQlOIILH9sU
 UGag==
X-Gm-Message-State: AOJu0YzQiyKES72Te1Z/N11x+1xbwBjmgDBB6JiBri8u3OJ89muqQXT9
 VjTxot+xxJNIi7A8B0btB2lE/Umi2D7Lcy8DZbk8OlixrGS4FS/zhwS8pplJ8Jrl3hzqHf1O8tM
 ubmKydW8me+YxmuY3FVPaV3QNlg1rsKhZAtJreHJUn6SZaH7mnVMKXhm/6pYmS9O+4Qc5mo4=
X-Gm-Gg: AZuq6aI3B5AUSzDvF0IIpTaGrqf64KKFqis3+coj85KCtQz+X7iyKqdjgVmKYc0nZJn
 5y28/zxpbtZV5ZrD0phNJ+jn92CWXOeZ22q60/++QsvYt8hpNRm5M872ng4Z1nHJ/CKMuntZwu0
 7Igj+d2XLbke7tGZLPq1XR6bOagKLAw45eET7BQbV7i0DTc1r3DN4sURF2y8RL2uhDU5NHBN2Pf
 9k4ZHA6fbTXPvJnGw6UEeALzpJtpfAPr8XatYv6LaBQF2gP4CASSJiy4BgQQpUR03fC9nzUtgvi
 yhh85QW+a6K4ublI9LdaCUYl1OEw7J/iVekAZAYC/RQdqVz1ymblnSdy79R6HZ8vQK2/JoCqYEG
 muJvItq8jWTuX/sqonQFsU709IGTF/MJe6VnPbjCdIVyJdjFNPZrYA7tut6Yd2g1ordAZXsOrB2
 aWMA1ZkKTQ7nOqyR5C6xXBKJ4=
X-Received: by 2002:a05:620a:4096:b0:8b2:e922:5297 with SMTP id
 af79cd13be357-8c6ccdb0f00mr580149685a.21.1768990548712; 
 Wed, 21 Jan 2026 02:15:48 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8b2:e922:5297 with SMTP id
 af79cd13be357-8c6ccdb0f00mr580146685a.21.1768990548263; 
 Wed, 21 Jan 2026 02:15:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:15:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:15:45 +0200
Subject: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E9AitB4B6NLtjLJCY9zdPbtLBa3uHKEsQ+4XyMEuYiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdR/ejMpTmJ1Ii9B7nFb+DoUyVnNhJtvIBxy
 e+anW50k9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1Sx+CACIfmjAyrt203QSMmiD8hfIkTu95GnmjD5nbF6QyuUVCgwl9fSLoJbbc3/+FdXqIDQVldO
 FaW9eZ2VYep17mC4c4sERdeIlo9G9rwCkL65IzOyag5u6s1OsTjUeO9cl4clbu5gtKqzGT8QKF1
 JH3SS6UW9TTeuBqFs2m+EdzkiMc/z5nedCQGxbQs3P8vZAV7Tze6K7i6g0xu3LQYN4+vE01n2fE
 bEHgl5j+srtrlLTP70MLajLFmcKUlk6SD1zigfexjghwIh+i9BSOlo06d5yLMKGTqCK8t6SbNT9
 Paxv6s3VUbpsLnZ4h4NcEuxzvqXJSB9NULnhregFYUhDwwI1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970a755 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eOiPeOEgsxahVY17qz8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: m6UfjaGC-fpuOFI2nIj25cxs7HPRpy7Q
X-Proofpoint-ORIG-GUID: m6UfjaGC-fpuOFI2nIj25cxs7HPRpy7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfXxBZQ2u7ZvAon
 22tRUe8NAEroQAfHsnOSgeSEpbGhJGzy7rw8mrXiWLiC9+Ma10LpwhyEdXEl3dvIeZ3DBxqlIAG
 zckJch23ypEoidSEvpUUcerWq+FzZ2jDEDnwImhfY2ATL01dseF/k/+/iazsTCelV3+RlqFjfLW
 DSssbOVBzZ2Gm/UfiwC4ATlrh7fgPgxXE25TLehTHhZjxOLupChS875avpjsx+SVbrz0Xs+t2Iw
 U1kKgUJKnhX93SW/crfpPPWTIOHQKisEijZZY39ztQKPeOLmfa3xVuPRuOWA9tJHvj4SvVpbE7y
 UGa4w9q5CZKZBzWhewQRPTSYzDpJdUCTUaLHrzDf/r0A5tnp0UHG+ncFsxioicAXJfqYhxrRp5V
 AD9xA1XHg2k1Z6PiNsCuOK87Zai+bOZiub6luMxuZbHyADwHUXBHPrMxyJDtqIcPtKdyNjVdGcZ
 tcfcZFpKSke5io9wXqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xji@analogixsemi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.58:email];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.2:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email]
X-Rspamd-Queue-Id: D9EA9550FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Describe the optional connector subnode, make it
exclusive with the AUX bus and port@1 as it is impossible to have both
eDP panel and USB-C connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b..6ad466952c02 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -85,6 +85,11 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -117,7 +122,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -127,6 +131,28 @@ required:
   - vdd33-supply
   - ports
 
+allOf:
+  - if:
+      required:
+        - aux-bus
+        - connector
+    then:
+      false
+
+  - if:
+      required:
+        - connector
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        ports:
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
@@ -185,3 +211,73 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                vbus-supply = <&vbus_reg>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_sbu>;
+                        };
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.47.3

