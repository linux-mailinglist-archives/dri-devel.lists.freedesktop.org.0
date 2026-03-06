Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJv0EIrCqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE122008C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66D10ED19;
	Fri,  6 Mar 2026 12:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+P1j0u9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVT66jPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E46710ED18
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:03:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626BawBW3406376
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 12:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8QfJo5HK9r3xw1PIFCw+iWNIINNp809eUwF8A/Aun/w=; b=c+P1j0u99TQClv2g
 yzNuDwmXjR+Op4+iDrJ6R9DuTl8U+JYngQnYNzerJ2+/6jl27DbPjxmXCiXjT0Ee
 ehmwBPMZWiY4R8Hc4NRBza6Tu6fFmssX6e5dWZSx1DAAnwjgwtI23SMU7RyJufMk
 CiTD3P2iEZQtM1YHzdc0omzYi64/ReEmRf0dOisAfGuoP1WGwJr58FcibwsvLgcT
 zSAdMCWNCcEmlAI3PYflVeWGLuGh3koVfHPEc5+BxYIEWO/J1F9ITSTNSsloR12/
 wskaNvNUyv7wevGUkdaXSvsEfKNbqshy7HIJ7D2qL2ByX+kZdCWU8wbq4TTcy9Oc
 6vncNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8f4h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:03:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso5311137685a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 04:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772798597; x=1773403397;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8QfJo5HK9r3xw1PIFCw+iWNIINNp809eUwF8A/Aun/w=;
 b=CVT66jPHHTST0387wUH9KMIAKng+9m/GjYiWTwZF0j7x32HJHHVOB8AOdOU/Fk5Uy/
 bRWGOhqhNB1kMunkdJ11Ot1bHPA6nB1XWVKu6vBeNa0AqGxv1nEMcdUuP3R4lVnzvSpm
 tKlS8chTNBs5sjlWzINIaSK7q2EUsq40+5YVJunvwKxLPiT1hsAUhJTqriet+q978/x/
 bUcmoNptb/TH9rg6rszbTsVbQeJtGNOPchQU2VQ8QuLKbnNIGqxlOEcTX2iOzLVycTa9
 jweV6cUgETxOu8MkOkMnK1wOxAJnqFHt+yLoywJH/xw7SYBYPB7AfoFI6XRZ6q0jxhSW
 SzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772798597; x=1773403397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8QfJo5HK9r3xw1PIFCw+iWNIINNp809eUwF8A/Aun/w=;
 b=h2ap1Jt5cPc+9QIrix8tm0oNIcqJ+X6J9tO5UO9qnrIIXs0GmUfQ1krV77tDHjFvhR
 AegH90pPkhHvJDApWYa7e7DxeXD7e4Hg0cr2jo0QfvpkI7qUFKB9DeqxwlSxb2gsgaQQ
 yXRCubKVFpLaE/XS+4/UKvGW/QMCQgdF8eksdcSiRvhcUnZztQyRAfXXGsS2BwTbiduV
 MinJIMnBz2/sDDDv4NCSmHJtl3heiFfRIh6Fa1lTfVEMCzWLnJvY+Wwilb+iQwb3ln8T
 zmN/RFaUYSdR9XFh3c0XA5E1xUFMN2xcdXUfXoN21jmD8jjsGny+lv9H31jH2ugrAwBe
 +WiQ==
X-Gm-Message-State: AOJu0YzcylsUdWZpffGUL8v5XiFGCpvpN5v0V1YodqaUl1ZaU1h5y7EQ
 xUp5lT3HhLAYZ+Pv8nLvrtLJ5fNLyvorwRdw/sztN46LqS8AcXE7XIenDAX9qBZdTFTH8pagraK
 Yo1SHIpWFoCPjjVFL4s4WtaBUSmc3etLPQpZhurSul5ROZ1cSurxY1bjXF+RLqOx8/llayx4=
X-Gm-Gg: ATEYQzzd94amkVu82O3Me5NzzDyf1xUHAa0hgDn6TvdsYCB8q5HYFuIMhse61NGExGv
 oSUC6cAdnf6Qwr3UEaicYb1XtKlQg1VwAjLtLc6GwTmE9EHmANdW0xGthCHIE68fy6gGlUNyHLn
 Hd8Hl8A/NHzxXEzfx0hDKxONjYtQqPSaI0pGMcC+XTxc1+9wmb3lKZqMlrtg368DPsDCkgb/muf
 BD+0cFfA/sUhbK7XEnzHJebf1olsV3pipIEFhlCigjGmB9cbQg5arDvnLJKRdyQGtFs06m/aLww
 v5+mng1MD+7al7pdDCJ1TqlqCVeqCa1h7DTKgwSmYYc8Ycwu8UcEVGmxdTxrz4v7clylpdjKd5l
 2K39wwa60gB+a4f90wmW9p/QhOZbyBLUOFaR+ojdhw41F
X-Received: by 2002:a05:620a:4620:b0:8c6:a5c7:a7ee with SMTP id
 af79cd13be357-8cd6d4bc1b1mr204032685a.53.1772798596450; 
 Fri, 06 Mar 2026 04:03:16 -0800 (PST)
X-Received: by 2002:a05:620a:4620:b0:8c6:a5c7:a7ee with SMTP id
 af79cd13be357-8cd6d4bc1b1mr204027085a.53.1772798595919; 
 Fri, 06 Mar 2026 04:03:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:03:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:57 +0100
Subject: [PATCH 4/5] dt-bindings: display: panel: Align style of
 additionalProperties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-4-3086eda1efaf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12585;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y8BRD2ebcFiEnL9gO+I3e2ZcCGMVRz9NU3aU1YNQ+4A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJ1joJjeH50hDJmMgP5NhbKhC4tA4iN0aidv
 jytVxxZR/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCdQAKCRDBN2bmhouD
 1/A4D/0ZhzjGHdGqnai5ZhIyrbK/DQ6HMbHE9jc5JxbEfvaPBCrBSwhuWj2Notj4F83mudKCKmi
 XwuwwzVS4sea+JRrzjhNUHWug7XqkxTmbZv0/Jls3RXHKGNUzFGnrOMAQlH24LJBNVYv4k+n9WI
 cLtmB3w277rlS5iWENuLtnmrgIGIY9W6QrrBsTvq27PCM8e3/ANujICSOJ+QM8ePXVXn0omNQxu
 /azXi5+SasbU/ree3N7Dw5g+Fb1FZmU6/5CwyY6osNotjsDCmjyD6a+jClYfIR3yrV9Zazuw3tq
 d2szyvpKN80CP4n+SZC3JeZBFx2x9ClJs1B6uKwPE7DhZ7KpezkJf7PLgm7ISUsAJ+Fsq3CT27j
 VrvTaLLNlAYoVa1KMeHARCzlMrRLGTq86273uH0ddTcBEvxeIVwJN0kUOxYStfdxLkab1jWxgBs
 mk8ETDyds1BHupzxvYDqM8PrUavlrTi96VOVkBR4tV+8/iOMdUJ+W6/1jAdsXPWSRY+8e1mE7j+
 Jt3WkCgrqwVsgpVoJABAa+1XD4hbYRk7+aaQy35FooERTbaXKcOwl7aQmmpKSZbmz0GjO8bvs+b
 81YzBEBlFfIgboArrUG1FBM/Sv9OJHHQevRkxD6ZTKR1p39YDym6rY/ZaYxitRGI4DPU3TLX3uD
 WLRnrES2RgSYwEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX9fQZZ+/KrZiI
 eFPBZO9hW4mOknMGeZ38vmnG18vpxuovOA1hvS1XGtn27WBkzObFMo+kplc9rdDPmKAlsqngHBx
 WQHnl/mI8nZAPqwY++TeJ7OYDo9sund4Tjx1C5sfhmsvx2cJzMKqZMPcrh0GgrMO23BxXjJYkiP
 ClB2wz6W+RX4cBYNL3y+ekcvoLLHlUc3vDelf7DW8zeYCaR2pst2OHJsp51x4ekdnzgegNtnh9v
 2mYJmNXoqzm02CHx7EvinuNZtaRdTK3KrN0YxlnaIgSXuedhmFz5jVmzjcRJxXl/rih/sHQNQk+
 IJaY1WgjkS0CuxidhaXILOu6kU1oxmuRFlhMMCfnuOPbxu6pwFxaMIr0H98C1jK+KgZYnEMSZSr
 0/BNEw6Mp1Of2SCOgaipuODT/Xi4HrQ19ztzjdX3e6SZvzUSZeP2O+8Ng4hZZdr6bpM9oNgGwOh
 HQ2FUqfwGVspQIovoQA==
X-Proofpoint-ORIG-GUID: RFa-gP0pyOzxbaqRAJ9Ug4GQQUsWMDDw
X-Proofpoint-GUID: RFa-gP0pyOzxbaqRAJ9Ug4GQQUsWMDDw
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aac285 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tGnH7XJvyaa94d3unYUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
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
X-Rspamd-Queue-Id: DDAE122008C
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

For code readability the bindings are expected to follow order shown in
example-schema.yaml - put the additionalProperties/unevaluatedProperties
entry at the end, after listing all required properties and possible
"allOf:if:then:" conditions.  Meaning of this style is to close the
schema, after listing what it contains, with final "nothing more is
allowed".

Move the code around adjusting it to coding style.  No functional
impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/advantech,idk-1110wr.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/advantech,idk-2121wr.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml     | 4 ++--
 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml | 4 ++--
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml     | 4 ++--
 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml   | 4 ++--
 .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml         | 4 ++--
 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml  | 4 ++--
 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml  | 4 ++--
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml         | 4 ++--
 .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml          | 4 ++--
 .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml      | 4 ++--
 Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml  | 4 ++--
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 ++--
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml          | 4 ++--
 17 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
index f6fea9085aab..76b48836ddf6 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -41,8 +41,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - data-mapping
@@ -51,6 +49,8 @@ required:
   - panel-timing
   - port
 
+additionalProperties: false
+
 examples:
   - |+
     panel {
diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 05ca3b2385f8..c9b066e69e2f 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -56,8 +56,6 @@ properties:
       - port@0
       - port@1
 
-additionalProperties: false
-
 required:
   - compatible
   - width-mm
@@ -65,6 +63,8 @@ required:
   - data-mapping
   - panel-timing
 
+additionalProperties: false
+
 examples:
   - |+
     panel-lvds {
diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
index bbf127fb28f7..46e7cff5b2fa 100644
--- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
+++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
@@ -22,10 +22,10 @@ properties:
   enable-gpios: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
 
+additionalProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
index 287e2feb6533..9a2c532dbc92 100644
--- a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
+++ b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
@@ -22,10 +22,10 @@ properties:
   backlight: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
 
+additionalProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 5725a587e35c..182a2b825e1c 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -54,8 +54,6 @@ required:
   - vcc-supply
   - iovcc-supply
 
-additionalProperties: false
-
 allOf:
   - $ref: panel-common.yaml#
   - if:
@@ -68,6 +66,8 @@ allOf:
       required:
         - reset-gpios
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 3cada0f82951..aeb7cb26c058 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -49,8 +49,6 @@ properties:
   vddi-led-supply:
     description: Voltage supply for the LED driver (1.65 .. 3.3 V)
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - reg
@@ -66,6 +64,8 @@ then:
   required:
     - port
 
+unevaluatedProperties: false
+
 examples:
   - |+
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index 96621b89ae9e..43e98bb07c38 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -47,8 +47,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - data-mapping
@@ -57,6 +55,8 @@ required:
   - panel-timing
   - port
 
+additionalProperties: false
+
 examples:
   - |+
 
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
index 37f01d847aac..2af993d73619 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -44,8 +44,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - vcc-supply
@@ -55,6 +53,8 @@ required:
   - panel-timing
   - port
 
+additionalProperties: false
+
 examples:
   - |+
     panel {
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
index 1e4f140f48b8..1f697dab832b 100644
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -31,12 +31,12 @@ properties:
   reset-gpios:
     maxItems: 1
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     dsi {
diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
index ccd3623b4955..871e4c2d9824 100644
--- a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
@@ -21,11 +21,11 @@ properties:
   backlight: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
   - backlight
 
+additionalProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
index 46fe1014ebc4..8fb7c013dfb8 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -33,13 +33,13 @@ properties:
   reset-gpios:
     maxItems: 1
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     dsi {
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index f1723e910252..1bbe0da3997c 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -43,13 +43,13 @@ properties:
   no-hpd: true
   hpd-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - enable-gpios
   - power-supply
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
index e32d9188a3e0..1beb4ba92248 100644
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
@@ -41,8 +41,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - port
@@ -51,6 +49,8 @@ required:
   - height-mm
   - panel-timing
 
+additionalProperties: false
+
 examples:
   - |+
     panel {
diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
index d817f998cddc..0819f38a9d2c 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -31,8 +31,6 @@ properties:
 
   power-supply: true
 
-additionalProperties: false
-
 required:
   - compatible
   - enable-gpios
@@ -42,6 +40,8 @@ required:
   - port
   - power-supply
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
index 187840bb76c7..49ef45c03593 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -25,8 +25,6 @@ properties:
   port: true
   reset-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -35,6 +33,8 @@ required:
   - reset-gpios
   - port
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index f0a82f0ff790..f61a528c0413 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -36,8 +36,6 @@ properties:
   port: true
   reset-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -46,6 +44,8 @@ required:
   - reset-gpios
   - port
 
+additionalProperties: false
+
 examples:
   - |
     dsi {
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index d5a8295106c1..c99f4146f1bb 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -26,8 +26,6 @@ properties:
   port: true
   reset-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -37,6 +35,8 @@ required:
   - reset-gpios
   - port
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>

-- 
2.51.0

