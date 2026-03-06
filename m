Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN0VBYLCqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6384220065
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F82A10ED0E;
	Fri,  6 Mar 2026 12:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h81yUjPZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxahYIAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB0410ED0E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:03:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Bb897865499
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 12:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K2v68JVE0LJpsqlnjF2XfsZGXl238tbP68H8kBVs8fc=; b=h81yUjPZ3x2wYqy+
 1uCNgNBIsf3talcDjRfs2lfzVXbNWQaMLHpbXXdwWGwUUCKPKVAQPfgdx9pjbtSb
 XGcNifE1I3LOgKpF5EtL9CSh5sy6qTbYF62y0vfxtAgK6SQPckkvsVT/EbAqs3Mr
 4EFAzUXOvOcim/g6IhMAmsn3xUDUYtlsbdE4cbemBA8z1Eq2neQ1OnakfJ1MkExh
 IDdcc/yW/fWhgNxV0YW9rri3KCc+dN1/sC/v+dt4VWG3IZE3u8mrLSPM74m9ADVS
 T1Vzp7NRMqhHBLYN7jUpQ70M8YNkwMj4ZUjKUexc2zRVF7ONfQOrEEU+1u0iOQ0B
 H0e2AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5saqa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:03:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb413d0002so5802042785a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772798588; x=1773403388;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K2v68JVE0LJpsqlnjF2XfsZGXl238tbP68H8kBVs8fc=;
 b=GxahYIAclf2cOAiR7SyPiMCRFXBqH/wfEKg1G4MiH/c8Uz2vduEmpLGSH1jwFVQtTd
 4UvuNM2SvhLJHyJ4vJafEJsMQywxa4wIkvLaD+wQVDVW2j1iWMAtzrkBZ8nT8emkKLHd
 rn8pEeOt9ZEy5897CARPtvS9OgjH88AOlPy1VlTjXLXjofaseIRuUEXISricxvT2N4QB
 Ku/NUkpHeJYn4+jPkK7b+nDwY/btN5UpCOjZ6hbT2TKuXyeU6zbmcfVmFElteuyCcB1j
 R4KmFKjbMeeeUR/u/NzrRm21WotR25kzo0iPHG9GLDTBFFICjAUdS3Ku83o5Qn3QzTV9
 U7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772798588; x=1773403388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K2v68JVE0LJpsqlnjF2XfsZGXl238tbP68H8kBVs8fc=;
 b=DpwhohNIKyUFhvULQm4TShrJ1TaOL0tcdYiDqJgAorxePexB269FIm0ejpv7hD90Ub
 73lot0YfX3ile/aY6BYTO6dnuWHAL99DADE0UeY1+rA02eeziarQ/AUr+01xcb3Z5det
 8cIkoTIzSLT6xs8LYsc1+JLe2v/0E6fw88qStGsHXIWONvDhiZ/K2sthWKY9DmKPNrca
 DvUROM+UaSOxq1WOON8n8tdlY13N5mAWHbwhCVWU+Yi0irASKpcMVUKGcGGAYyuUkwys
 MNWWGG4m5X3m9YxR/ioWhU+fMHdLPmoomJ5ayRTasEYjyG7L4Dfinf3zyf1Ht9UTHGpm
 reKQ==
X-Gm-Message-State: AOJu0Yxt5rLa4STe6TjME+spQaadUwYZOPXslZKC2xVHmmrynfDvomkx
 7WBGsUAWfH5UAgrCvAIymyLEsYmLmJDIuFA7C6up9GKODSbUO8eOIZiHIiH76n1jseDaEhZjf4n
 288k7NrvU5ImelmuXwLhEhLr0vnsG1SihFHygFeiRRzKIDyCGfj5uH01cRPmv/vY5/wRvyjQ=
X-Gm-Gg: ATEYQzwSKf4MvrxM7bAkl5r8BbnerC83h7SC2WkqjNBDJyM/sTBFgn3gui2HMbJHnbQ
 Hu9C10CTGjnOhcz8WXswoMXI1ZB9m9h7XIDDIcUgIIRSLSm9qC/VmZD7M5RSR22Y+c+pA+7fVvL
 NpWCxt5gJUlAgMNnIQvNewfFZy2IRZxU5XjvdgnWP9zmNGr3+uRJMRZxqRw1VNNky/FR7qytPxu
 CX4yj0PVRn0NdN6Jc6uzGMmvnnMtFgfTKgH++qgv5KYYp/RSslHJHUVkUgVEasUFyHGyE9ukx6V
 se1fhCl0wsCBSeyTnztLPuOrX9Hk+xlOpyjd3zhjBPIZ+xJAhCoYILEfDKijbMWSguT8Xosnc/6
 LqAJA8thCfdvCzkRFKHbbxjPXNQQhxDqv6ATQrgrIGsci
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id
 af79cd13be357-8cd634e8fe6mr675773685a.29.1772798588408; 
 Fri, 06 Mar 2026 04:03:08 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id
 af79cd13be357-8cd634e8fe6mr675768285a.29.1772798587937; 
 Fri, 06 Mar 2026 04:03:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:03:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:54 +0100
Subject: [PATCH 1/5] dt-bindings: display: samsung,s6d7aa0: Document port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-1-3086eda1efaf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0qU/K+Jn6p4HJpuIpj4ovomOIHxCEo+b3fXQbSBzGFY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJy6QKWs/86onDS0X79u8TjSCuYsK7kXkI4f
 X+KCSvseSKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCcgAKCRDBN2bmhouD
 14BBD/wJP1MouPXcUEseSrsnBW7PgSDQl9MEXMnvxojb/3vzTetwcO6CI7uXUONkfhNIJ4ziUQ9
 jdujvQOLNiKlWExNUhQ71FF9eC16GI6qF1T8r8uSKUjSZ4Rs3FicK35qs/AOSVqJHoIxrUc2rnn
 Sj4ScqIODBAiQOaI8HbhA5RhWbongYawwycZ7E64xZSWLeWOo0qN1FC70qGpY75YInvzoeZznAR
 I5nEorqzpdO72o6WCvI3QLRuKjBN/ywABTjPQWdPfjx6ItB71NkUa1c+2WgCDiPhLd8Te2Xmt3j
 0blJnO8ho+V5DW9RhdCSdWORui8Pw1D/1pTLetcRvnjnbvEizLRonluoHa01SXNsxO0JOfu9rox
 uR54pSsbw2RP0zR1O07btOLW1wYcMr9DHmXqtK3vyn21+i0B3sWzSrQeKwsXw5qCkMhmybpsrwx
 oa/haqNd+CKldw6U58GoHwmvebMbYHhu7uXMXfxfH6+f0Tl/AKNVV2VC7ktslpDIzCDt8yxmLig
 6ayWdArmdwMI+lASA8616o6r9+oHuUwSfQoZnxKJMO1fEQ8+vke3om5BWVKkWX6AOp39i/3E/5+
 VUu/MxrOTIZFouaUEjtalOq9Fr74bwPh8tdKXdtME/IZpmTtq2oZ0gXAC0hNcodkzB3HvghjKiI
 mdbaRN6XHx0S3ow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: BKwXVQZmLhVJZ6CK77acTHsJXdJ-v3j9
X-Proofpoint-GUID: BKwXVQZmLhVJZ6CK77acTHsJXdJ-v3j9
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aac27d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NWUlNo3lQsMGyr1Nd8sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX+S8EOEV5KKsP
 CpUGyLCq3Rf8CekH/STSOnWyXJfyhPBfp+65QKqNvbhwb0LspaiIAewhjzQ7Vpw0612buUK3dO3
 gVesJd+APIqhxjFIiQyL6jySmG3bqB2kXj54YlVMoX77/oznKaiBlzmuoQ/bo4okad7bLmn2edS
 A6PAM6eRMX3pa1wL0xZh/o7K/lOluKjIE2ZtK+0EA1y3pTCPJXV+I89ZuUL6kfHyL/w7JpUgmGU
 x63chg0asa1nGn2nVpDug0zEYgYVVWTskyKBXTyloJySCR0ugXTqfQNETOf1sJGGuAXyQRHXRjw
 s/9VVx2eR9V9PxvqwS7KbJUE6agjRuKKMWggxkUU43p2gRsbAXQvZD5zL3siXC7gNdETCjFFDZv
 t/LODekx511dgskRjCkmKinKSGqZFdgLuY7sk44H7L9dVMczsp8N86w8739W0iahkODAc23z/qw
 82Ers4B44MLbLNsoydQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
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
X-Rspamd-Queue-Id: B6384220065
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
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This MIPI-DSI LCD panel must be connected to something, thus add missing
port property, already used in DTS.  Reported by dtbs_check:

  qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/samsung,s6d7aa0.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
index 939da65114bf..1f753b706911 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
@@ -44,6 +44,8 @@ properties:
   vmipi-supply:
     description: VMIPI supply, usually 1.8v.
 
+  port: true
+
 required:
   - compatible
   - reg
@@ -65,6 +67,12 @@ examples:
             power-supply = <&display_3v3_supply>;
             reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
             backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
         };
     };
 

-- 
2.51.0

