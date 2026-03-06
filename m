Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOKWKITCqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAB22006C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D23810ED15;
	Fri,  6 Mar 2026 12:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkPEPXlF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKEFoiF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5110ED14
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:03:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Bb1l61188890
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 12:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3psHZCSU7hjtlT9gY0OP3vXiVKFHZurgCIluoZNxIHY=; b=DkPEPXlF1UXfWEJh
 0pQrcGxtK99Q82+fJ3Th8Cr/dyghFzF3dKPgzN4HBCzcSC6706Ss8uSZbm2jgXUG
 RTRPbuKJ1r4hyyzbXavhVFiCPaO6rOViOhS9fWAF3eMyYlpQgEO2Zk86aaeTAA4x
 G9HeRiTvshvQbJq2YlBmBMpzoQP8I4kThMyyMK6xjevnDgX6rGRydDvhx1DTPy8M
 5n45pGnBV1lMqsuzyBZq8F/ezGp3R0ZKUIG4FcxparqcI/w3xL2pld8Ne/pQpnI/
 LQbSrx7cJ1T+i1bzzZZkJ/JQs4BS5uTcRLLC2x5lbBwDW9wbS8sz/wZ/sB5m+OTC
 vyDp3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14g3gv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:03:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3ad1b81aso1496915285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 04:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772798592; x=1773403392;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3psHZCSU7hjtlT9gY0OP3vXiVKFHZurgCIluoZNxIHY=;
 b=bKEFoiF6FV3pVMSKyN8/CJDhc9qt6gEW4y+ir8zSsd8uTJDF1Yipy2gQP8blDrIOR1
 zL0Hf5Ro7VdXG2r5G5rwFmCSisnTf4RTbyOwh5aSujdQCAbCYF+8asb2BEvU2U7q8oDP
 5/ZdebvsIL8bgNHSbBDXQ8Kkj7j5zO57VIUxufdb7KYuFGfTedh2Pgd/G64rcG6IkNCw
 SH8NHjhLNUOX9WAPKv0dm7mhCXp/ZQg4iOvYzKm2NohahlU2uR/6QA5KYZIQJI8yO3Ix
 cWbtFGE1hLc1qu1ZM4TFGUr7PywvS8qtrf/1uu+mCO8yyqMIIZXfU56l+jkj9ouk0ZM1
 pBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772798592; x=1773403392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3psHZCSU7hjtlT9gY0OP3vXiVKFHZurgCIluoZNxIHY=;
 b=DlM/NDS6MRJD28sn0cP9sbXyaL1a4sD0cJuhVqb1qsVk9DKz+AGSlKTt5HvLVCtipN
 lnt6rI6n4JTb2QROplj15G4qtjddxL7/X4/FR3cqyOXKksafpLHGcUlTX0NJiN4zs3N6
 BFcO3v+v2dZx37F5HTK1+Pc1UKKkRfU24BtI8WlZVMmKIiS8exhAoFHapE1neQnN8Lzd
 LG5o1w7a/ckfz95KUTM/zl7bBI1DnDndfnpIecFcknaqJGrYpaGCIA9uTPn6/Yn06M9h
 wGJjlzkas5OQLOd5/GVlrYbvixRtdzROWarj2LY2GxPIgdAUmNc0pVFMkTX3EmlXlfTL
 2eYg==
X-Gm-Message-State: AOJu0Yy9FZlKoez8y4RV9xcc2VNIYEVWjEQN5Ht9x0SoGXHZ0mMdqJ35
 6Oyy7735I5+olxgFOID17/wsIDk9k1EkhRfF0KWaiLOJnhPFF71s+UYu/enXP61uAC0nRNCAcIz
 y1UdeGir1z4dyZKG8LjHV2qoav4iqKkvN57yrJ8iqqUeXNS4H5lU6zca5EBQ0bncoy6c/0CU=
X-Gm-Gg: ATEYQzyDn4ZINmtEHPmutAcMxunS/lEDtKhkaq5pBOmBEO/+GYQ0wnKK1No3tvqSbdp
 VHsrktMpHca1iNM756MB4T15NRm8OdO7XXaub3BNpA0qunRDXtqaD3RAN0HEWm0yUJMWd/+fTgi
 65w1GEEV854m9AxQAGK0EoXGC2aRzAC21BmI96DMrmnqSzMX/QoEYgAF4rhtv5kFIG2ERCaKbO6
 OYpIJozkGoED0A6ikxk2QRVs9UPQ7MPfu+xVwwAa+bPpdP1TOnJH1bCGOoK8fHus9FoSHZzWXCU
 l3q5FiWkbY2B8r656Wvf4nXL6mMG+sNDPEqJeRPq0guXsvc43H0DZMRCmfai+BIS8WHC00P1+aD
 NnWogRFHb2cKCr4CO0Y6XV/vPZjC+xDrDhxHIrSLMZL79
X-Received: by 2002:a05:620a:269a:b0:8ca:fe7f:7324 with SMTP id
 af79cd13be357-8cd6d4cc3c4mr203249985a.53.1772798591673; 
 Fri, 06 Mar 2026 04:03:11 -0800 (PST)
X-Received: by 2002:a05:620a:269a:b0:8ca:fe7f:7324 with SMTP id
 af79cd13be357-8cd6d4cc3c4mr203241385a.53.1772798590915; 
 Fri, 06 Mar 2026 04:03:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:03:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:55 +0100
Subject: [PATCH 2/5] dt-bindings: display: innolux,p097pfg: Document ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-2-3086eda1efaf@oss.qualcomm.com>
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
To: Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5rYSy2QI21ctfU/oCE4ETdDO/pmYEesEULMS5ouIYTE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJzy431khzS3DOx1z3tVtIB44NshwZ52yODg
 NLqdDBx6ySJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCcwAKCRDBN2bmhouD
 1x6kEACKC5cSAcuL+ePWXVnGd79cDsimOTN4Np84yaB/jd/p19+BeOsp6pBs70D7OrBHgKrdvAd
 19grj3flEm5dXc74jCuv5ZPH82yAa/AhGQTXgpPwdLD7jpXC5HoQ8yqKVBdF+OQbow9+GIWCSPU
 o4dY/IGtkmzxVp38kOEYXF3oqpSgAjkQMFJairKxU18NpifwiT7gMA/1aUwsBHldJH6PYnjirMq
 IEUqeCoo3QUWpkniLyM/4l8BR/76weyzv29Yo3vMzPNl+lov1XLh7ob51u8aeNnkEQmun3Egysl
 DQbnCqRFdS5fpa1pqqSjKGY3i6cQ9GU5I1Tpmx4a4tms3omtQ/yDEJgfSwu2vevng8I8hsbWzBH
 v4hT2R5YJE2VzCo8sd2/Oc3cE75/PfKW2K8+0uoz9ytahT3o1Y1N4cib1vNqWAtwfWiNHi1eQvS
 DOnQbyJ7nZhrr6hTZdtAAVNpWEOnf7Zzp2oW3zk95HcT2GU5pxGzpaind0xsYqkA4iKuru+ii0l
 h1YXKUEq+JpuTdV0Q8FrI+oVkEhDrQgUtibfQXYFgy00Znb0W8esJTHeAF1cGW5UIgi3CdGCHkC
 W/IGaVhbKQ0Md2qpJWqb8DmUrHh/XfJrJKKxinQ4p5YrOVPm5BxNIg70CGmwQe/kZaIndGAq1qb
 xhRSY0kvE3C/7LQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX9AKySjYyqnQn
 JQnqr9fTk0cxMo+PI7IF1fl2BNsqkz/ubAxl3nAXNrTbFAXj2pz1/FBo1dDRFR6Tpb8CQXNhez4
 8E+w049HoFgU8otOGf98VCtPUZSzGejVczilyI8HRIcnJ1o0SrpXLEC6SM+VAHk83pg/WzYYZCZ
 JjbdPYYkJ3y4eva8n8qKiRiMje5HEyKYanUc3335ItGJVT6+Kfk+IBXob9tvX5swbWTJUG0rpZU
 xRz+qLmG3Wern/XRCqwSjtLDYD41VvON4GM2G/sb2eGcTB4OKy0hy/AB+8yMlYHoqPI7FTdcVDu
 TGNpLOtXxi+iX7FVnpktzKOGNzL0ztnkqwx+3uFCUEoWGo4Xy5UMEyAwMruwO8JmmioxpaQVo1P
 oJds5p/dB+LXxAZ/yVYsIKmQhUIUbYQH0LA9yxBO/WOgJHCKOnrYiPit0NP97ekYtE8y52B4M0R
 mE7qsOiBQHwRa2/2Kdg==
X-Proofpoint-GUID: lBpEL0IfPlL7WzwJkg0RFc-3sKgDPvFg
X-Proofpoint-ORIG-GUID: lBpEL0IfPlL7WzwJkg0RFc-3sKgDPvFg
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aac280 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8 a=C5Vx6WpDZy5qlzGxMHMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060115
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
X-Rspamd-Queue-Id: 39CAB22006C
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
	FORGED_RECIPIENTS(0.00)[m:aweber.kernel@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dsankouski@gmail.com,m:tomi.valkeinen@ti.com,m:laurent.pinchart@ideasonboard.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:aweberkernel@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
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
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,rock-chips.com:email]
X-Rspamd-Action: no action

This MIPI-DSI LCD panel must be connected to something.  According to
scarce web data it supports two channels and it is already used like
this in DTS.  Reported by dtbs_check:

  rockchip/rk3399-gru-scarlet-inx.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/panel/innolux,p097pfg.yaml    | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
index 4164e3f7061d..7c75e01797f6 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Lin Huang <hl@rock-chips.com>
 
 allOf:
-  - $ref: panel-common.yaml#
+  - $ref: panel-common-dual.yaml#
 
 properties:
   compatible:
@@ -28,6 +28,9 @@ properties:
   avee-supply:
     description: The regulator that provides negative voltage
 
+  port: true
+  ports: true
+
 required:
   - compatible
   - reg
@@ -52,6 +55,27 @@ examples:
             avee-supply = <&avee>;
             backlight = <&backlight>;
             enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mipi_in_panel: endpoint {
+                        remote-endpoint = <&mipi_out_panel>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mipi1_in_panel: endpoint {
+                        remote-endpoint = <&mipi1_out_panel>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.51.0

