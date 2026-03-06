Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Bj6GozCqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39E220093
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ACA10ED1C;
	Fri,  6 Mar 2026 12:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdXcIVPc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RK0GUwC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A69610ED1A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:03:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626BbGFf2022593
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 12:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qsIhiDYqrYhyPHQhfvVcO7ffM//NdCFDfvQA4djkeYg=; b=LdXcIVPcF6oBAPeL
 ppHTobtohVIPcESYYqfiTGnSkzigTSitfQsaVJDYoKkeOZeiCXvxUuKpGmeSWjV5
 BAMq+rVvT1QNpGWsvzTl7BtyOfBRqitIcLN02Gr9vAARLuyjxRbh8znuRY8lF7Zz
 KRfhI22YgQYKXftPUp4Va1VxviUCs6SeSBByzJ0dUJuTuN9wLVSuITMzzAQ4kfOc
 fMlYevq89sF3MAKKzhI+ac8HKTVO0ayJrQ9nKuSxCjdrcDMitm530tsaORlm+HAi
 H0V9LotCfxrR+OsyYLCpj1CXOV4bEDfO+rdypjBa4zvLI8zwytsoy5aV1nModZY/
 bCBsuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6b1px-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:03:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70b6a5821so4366328785a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772798599; x=1773403399;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qsIhiDYqrYhyPHQhfvVcO7ffM//NdCFDfvQA4djkeYg=;
 b=RK0GUwC5fc66MeffjZoptTru+Gd99aND6F7XjhhR2rkxfEAAA3g7QzMJDVuimqZN9F
 VCXRpRH+9diAPznpulKFW/wkYel5GJAr9ki0nvPa4PJ50Ck7l9clmt8QGGndQoxYeM5j
 cSOMoPYC5iFRhGuDA6Mjm3Td6ttu3Mpip81e3fg4pW7orZTazAJ5iPT6b7TMsmWXqmKr
 4PqCxp0fMRAktODBvcGBCTkQoV+zVUKgBfR2JI1/P3pIpV9vifFZFVha2sVFumZ/WRfk
 d6kCR46DqF5Aecmlqg+xj+k6vG2s1a+X6jTSWD9dGXgr+UZjF7zkJpVuEUUsObZD2gfn
 6hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772798599; x=1773403399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qsIhiDYqrYhyPHQhfvVcO7ffM//NdCFDfvQA4djkeYg=;
 b=my/oHbOj5gWr32g5j1lKljdyDyruW0B2JAJWqON/UvgaCjiBAtEkVtRzXlA3VViBte
 tVlLfbVHkwlDoLp9DtQymJU2pg/U06YWJvRcWKzNl3RThe+xATYiv89SFAMXxsooWtx9
 alMrPmbeF/sXhWgY5cARRLSgmmvzT7eyeTCJPtnDUY6dKM/NCrHxcCMohueyeXAjazTD
 Jielu45B6iUu2ObBMSYh3wapTHqe1vERwfMzElYSbbgV6GMBn/+by3XlnYmd28RaPNcA
 /YNFxx9NQALXEirki/A7sSFhJbfui5lRQjkfR5JfSQR37fl7sXYUoJTt+w3BZNKlh//e
 bKxg==
X-Gm-Message-State: AOJu0Yz1JX14lioO47cf7iKow7lFNZFf7bIs06d6dJaN9hHiNxTzLXSA
 HHJRZvKpsSRoG2j/V9VeXgCqi+zq1hxYxit/o4wKavDIBlLNP2fSBJY/MVT+42j0lTAuZgxsnVR
 S4dEU9XhKDar1QXASgA1mltxTqpJigDWLwXsO3aaD6JXfhyTV6aLVrsTNXQHYiEUaez82OjU=
X-Gm-Gg: ATEYQzyoA9c3pnSXOSK4GtUQYuNcakutngRs17Rp1N8SulFRMTRdo5cjI/lt0Xce5AV
 Pu8l9EtligP1ZcI4JPjR/4b4Wj91WVQrhU7LAO01n9cPJPdi1/6pqMGjQO8sXojJMGyLv9o2xba
 N37t/Q9hsVa+UxxFgSpyGoFO/4Z22RNustW39IAoGHnAMrbePq6Iddie+Xz+JErmVmYUqFxbzCE
 tBI+pwOJX0GbXtDl3S9i11p3LC5B5zorvzjOdZ0FE6PVjE05TDICvJxUtciqH9LUG4u7Gv10N7z
 CGUCgoArCw9esA1tknbj1Z1YpScxxFXZ6wDI4VkrhR/aLeROGIPvwGtaAcCXt43L0bVj3ebqrGP
 jo2l2m6LIi32v/E6VGfOVIMXCey2FcvhHMjKnabvszAUQ
X-Received: by 2002:a05:620a:4691:b0:8cb:3a1d:79f9 with SMTP id
 af79cd13be357-8cd6d40d2f4mr232420985a.6.1772798599070; 
 Fri, 06 Mar 2026 04:03:19 -0800 (PST)
X-Received: by 2002:a05:620a:4691:b0:8cb:3a1d:79f9 with SMTP id
 af79cd13be357-8cd6d40d2f4mr232416285a.6.1772798598558; 
 Fri, 06 Mar 2026 04:03:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:03:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:58 +0100
Subject: [PATCH 5/5] dt-bindings: display: panel: Align style of "true"
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-5-3086eda1efaf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8793;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eOMtL1pudAxDLN8GeGr6PmJf215rpqL51x1GL5PbJIc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJ2egJADa1wD/I3+dbMeZPrxGfxjU6pK3X3Z
 HOZtmfjJcGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCdgAKCRDBN2bmhouD
 16ASEACankKcaY8YWF8NbeZ0RXRJtmVxWwnfhbOAW8jOU2YvRF9BuWTEmIvLeiSs0aT4LfsxbnJ
 rXKcqHapTug3l5fQs0Xavf0/iaPKEQtbRT/wS4dCy16ecZzybwigHyyilQlYbrQjzAZjDqtE8XX
 KYaJZHUQl3XurOX1AEQMT1t+QE9LGEaYMK//y5ESuUO3mrDAgF/YYrJS+Sa29mu8Z36dluxz1Xc
 fiEesnABLeS2I3fjDsG2K66mNoiFF0zTz0y3oQVKHWRpzoQ36G0J+sE6MytRYyBzqg0C73TyOrr
 sYR1JDrUUHkKcnBojPAAlegsfr7nJfr6ZYQL6BASi8WS+cqH0wFro0ciGTHIKDyNjsvXAmK8tHh
 lXOcOvzaawDizbkaq3xyWgAkEGuEiEcARRSAOyS6i3qPo/RjQ7jdRMuCrQf4QFiipT/9Srrswww
 qpIHIaLW3otUe/BhPch2hwnCkcsWE8464mWYSs0VzDNQSuNlXaj4r3gBr7/mOWvS2iGtaCuo+oN
 7uoed6sg0XzbX5GpNH6unrSdwCcAlzGpfsqfs2fgTVowZBZrT5+XrhZbASSgPvbmtLNXypqTWFq
 +kX3I/DfFkM/mInvRZCd/kuQGBeiBYO/2dp0kIy5aRU/kYE7Jd9dbJVgcYVgp0Q2GhI4+dGKhFl
 OfmsXAoc0VgIa5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: o3FbxbFLdeOwK9I_zFTBTtyPyaZhoyMf
X-Proofpoint-ORIG-GUID: o3FbxbFLdeOwK9I_zFTBTtyPyaZhoyMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX/BU5yBK3k5Xk
 KKp8CP5dkf8s0FYK8+muxnvu409b74ObgjKQgx4zA4YkXUbVOACiv9eOl9TaBOjNyVSGWkaAUP5
 SFZD5yxQrpZAvw/FM+Y7H5O/3ZJeFBgFVoNwmKzFrIMKbHTxaXgETfAGXXEC+zRUsEdRDYzA3Ec
 5vPeOeYH+F1BxL4F5Gu4gUZKG3bIR7vn0q5YyZrRFOUGV1L0zi+snSe3/sGjVZbEFN8cZyRn7WH
 WFCDgD7vYiTaRQO1CkwU3lVq6SMK3NhHEHXhPkdOsKiO7I6vpO8FVW7nH2pstdwxnALiv+6zEOR
 jKBQP3okqNwImJaQRTGOjreLbIMJXMkwnAPCMXnppm7cJbmRxATU1/F7kqyaDdJ43SRTyuODX53
 82ZeC3s6RHrGsicP7xQO8gy4NV4QapkQsJP/rnIJG/7lSXcUtCR699/BUPGInMU5MkEHdXAwE8A
 vBACXmsVg7ISjFLn99A==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aac288 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y7DYbA0_Xfvc-Urf_C0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
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
X-Rspamd-Queue-Id: 1D39E220093
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
	FORGED_RECIPIENTS(0.00)[m:aweber.kernel@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dsankouski@gmail.com,m:tomi.valkeinen@ti.com,m:laurent.pinchart@ideasonboard.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:aweberkernel@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

For code readability, several bindings which list allowed properties
with ": true" syntax group them in one place, without line breaks
between each.  Align a few bindings to match this style.  No functional
impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml | 1 -
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml  | 3 ---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml      | 2 --
 .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml    | 1 +
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml    | 1 +
 .../devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml    | 5 ++---
 .../devicetree/bindings/display/panel/novatek,nt35510.yaml         | 3 ++-
 .../devicetree/bindings/display/panel/renesas,r61307.yaml          | 3 +--
 .../devicetree/bindings/display/panel/renesas,r69328.yaml          | 1 -
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml    | 5 ++---
 .../bindings/display/panel/sony,tulip-truly-nt35521.yaml           | 2 --
 .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml   | 7 ++-----
 12 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index 92df69e80a82..f288fa2390c9 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -28,7 +28,6 @@ properties:
 
   port: true
   reset-gpios: true
-
   backlight: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 182a2b825e1c..84e840e0224f 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -33,11 +33,8 @@ properties:
     maxItems: 1
 
   reset-gpios: true
-
   backlight: true
-
   rotation: true
-
   port: true
 
   vcc-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 5802fb3c9ffe..2fa07ec55b08 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -35,9 +35,7 @@ properties:
     description: supply regulator for VCCIO, usually 1.8V
 
   reset-gpios: true
-
   backlight: true
-
   port: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
index 5fcea62fd58f..2f49a6bbf3d7 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
@@ -25,6 +25,7 @@ properties:
   backlight: true
   port: true
   reset-gpios: true
+
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
   vci-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index b0e2c82232d3..3f56047f4469 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -24,6 +24,7 @@ properties:
   backlight: true
   port: true
   reset-gpios: true
+
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
   vcc-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
index 74ff772973d6..b8b153a6e6cc 100644
--- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
@@ -22,7 +22,6 @@ properties:
       - mantix,mlaf057we51-x
       - ys,ys57pss36bh5gq
 
-  port: true
   reg:
     maxItems: 1
     description: DSI virtual channel
@@ -36,13 +35,13 @@ properties:
   vddi-supply:
     description: 1.8V I/O voltage supply
 
-  reset-gpios: true
-
   mantix,tp-rstn-gpios:
     maxItems: 1
     description: second reset line that triggers DSI config load
 
   backlight: true
+  port: true
+  reset-gpios: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index b39fd0c5a48a..43d134daf0ac 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -28,13 +28,14 @@ properties:
   reg:
     maxItems: 1
 
-  reset-gpios: true
   vdd-supply:
     description: regulator that supplies the vdd voltage
   vddi-supply:
     description: regulator that supplies the vddi voltage
+
   backlight: true
   port: true
+  reset-gpios: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
index 90cce221c0d1..3d7761717b74 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -33,8 +33,6 @@ properties:
   iovcc-supply:
     description: Regulator for 1.8V IO power supply.
 
-  backlight: true
-
   renesas,gamma:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -51,6 +49,7 @@ properties:
     type: boolean
     description: digital contrast adjustment
 
+  backlight: true
   reset-gpios: true
   port: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
index 1cd219b510ee..740185f778a1 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -33,7 +33,6 @@ properties:
     description: Regulator for 1.8V IO power supply.
 
   backlight: true
-
   reset-gpios: true
   port: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 4ae152cc55e0..ebfc825b8346 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -33,7 +33,6 @@ properties:
       # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
       - xingbangda,xbd599
 
-  port: true
   reg:
     maxItems: 1
     description: DSI virtual channel
@@ -44,9 +43,9 @@ properties:
   iovcc-supply:
     description: I/O voltage supply
 
-  reset-gpios: true
-
   backlight: true
+  port: true
+  reset-gpios: true
   rotation: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
index a58a31349757..85c5dee65383 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
@@ -31,9 +31,7 @@ properties:
     description: Negative 5V supply
 
   reset-gpios: true
-
   enable-gpios: true
-
   port: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
index 0819f38a9d2c..7fd9364fa385 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -16,8 +16,6 @@ properties:
   compatible:
     const: startek,kd070fhfid015
 
-  enable-gpios: true
-
   iovcc-supply:
     description: Reference to the regulator powering the panel IO pins.
 
@@ -25,11 +23,10 @@ properties:
     maxItems: 1
     description: DSI virtual channel
 
-  reset-gpios: true
-
+  enable-gpios: true
   port: true
-
   power-supply: true
+  reset-gpios: true
 
 required:
   - compatible

-- 
2.51.0

