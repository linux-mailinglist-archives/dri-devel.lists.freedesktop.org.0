Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F194FD2380A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0A10E71B;
	Thu, 15 Jan 2026 09:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Umef+Inq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoXqbmzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556110E722
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fxHI1991697
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tf4dNBy/KLh
 WAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=; b=Umef+InqOBFJnu5Z+DcXMfZ8ZkI
 llgTB2EeNIeb/ZplW98yyTUzhpYVrIy9m0v3OXsZN7fMwDeCXC10ZE53QdvqIY31
 kS/Ar0b/Krd6+JITa+SWqjx+sL3NwMhlx/77ozO0inXGoh75HzuWiGjTi5BPUl6k
 VvQ9/KUcLXojbalqEsS+yOUjUb0xA+5yf0MAv96WNXZrseN5TX952KBvlUYRNONR
 refiu8rxvWbxH6MpdmnvrKu2fSICMwQdm1/WBGzi/9vw4vwuizUXEikbAMx8VcR3
 ueT1T6jffJkQRCp4bGmia+G1cu2SWoYMKPZSrhf5gH7Bde2WgFDPYHX1N4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbudg8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a344b86f7so17306936d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469306; x=1769074106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tf4dNBy/KLhWAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=;
 b=hoXqbmzUXO2Z47jl0zItWMaXTXq/SFn3IveM/gV03lGQSmnltSKOiLBVnXRkLOuIue
 1VTwDLQclMgRglGsdX5JJhTDz9XseZdVVK1e8mJtZOLfPCd7+MieF7FXL/tSnUmMKU6e
 +XJlvQo8pxQyZqeNkrhB0yi8Dmhypco5e9WrZ9LHyNajSmJ/HNDCHIdrhsAw/UlRu8SB
 zWjI87SBfYan9k4Op9mj17u8K/tAF5rNwySvFqL6mHOSWDQG83X31AoMXTZFR5LWuLFI
 8dTXWRCc4O//VP7lo3ixDGEf3LzqKxsLfeIScjRF4GOEMxhbZK5QfABVLjmAxeuwUIZS
 lZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469306; x=1769074106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tf4dNBy/KLhWAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=;
 b=dm0A7YT26ABGQx9hGDsAg69i4TupQnzQI/1q959VUZxnbr2aI0eYk/cpZULNGvaX8J
 +O1JO1laCWhgJil72EXxekBYDjbM+eliSL2K3n+i16zTiSds0o6kVtwfefn8XbPDZwIT
 Rr+hCN6x/UIleJrCQvuF8UUNgoEQLUdaFnT2GEopK6MPqzpPQv2JO5hDdnjv8sT1hp4V
 /0m3oIh+32hfzWn347BfxkXNMoTa6xn3CaKxKemwwilCu6rr+D85w7prtm0fMi4o718H
 iJ7/X2cfi9t9aHGQz8I6PZCZo/PD/GoxCdnRD/sSX5KDfNQEP64O5N6MTm/SPJQbihnl
 dSJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5eSMyM/qoZmuJ7kqHDVbep3i3Txv/GT+AZzuHpv5/NXH1wJ4G3YKsoqVSeW6aQkCu+CQ/byKdOtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiUzTRXlNBarM8LwKAGaA305GGBeR8g7+UZ0TBm1AGJV9UMsxU
 7c4O2EtTwydYllEXk7I02hNdMkCQQlbGF/Ql7sYC0vUDzZ3OLkRr0smqtJQFgVQiKJY8abt1rii
 etxKX3jmlWHx+HeWkXJ0DOjgX3mJxuzDM98Bzu/dejjimyJgCs22AIb+eyvgLTIzaesrSXMY=
X-Gm-Gg: AY/fxX7DXxUOHm+aDJuhJwrpVwVZTmfGHW0NAByVqUfOodQR3pR5/lEyeO9NpWZBQ0k
 lwklgkWpK54fjx1HIoEOByg25iju7oP1+uD9uexUFWe6EV/vjKVPQXTCFqmRH0om3Dj7RPrIAFP
 4e5Q1+x85RWG5znkFAypSItkrgSlT5izfbbJRpOSWWUBXqMPE35hSDKYqVIuiWX4jvMymSNZjx7
 4kxK20m/7hWYdiE7x2G/nIo+7bHHubtEkt0iWOCmN8EtYk8XH9pSlrJQQ3Q1oFL/fjP/1FfeWjY
 CT+t5EDhUcshYagTDhk+V0Mm4iAr5jjpVzMwDa2ZZ9gygFT3bdiV5NLJ/3PkmNEprGFlC720CyL
 SkmI00Z4dDNxUuFjnrMH2HhBhl7X3sKRuQCX6M3cmfcYZCqxpv2Sqt55FvkME5HRRXI8=
X-Received: by 2002:a05:6214:21e1:b0:88a:42b1:2607 with SMTP id
 6a1803df08f44-892743de419mr94011456d6.36.1768469305647; 
 Thu, 15 Jan 2026 01:28:25 -0800 (PST)
X-Received: by 2002:a05:6214:21e1:b0:88a:42b1:2607 with SMTP id
 6a1803df08f44-892743de419mr94011076d6.36.1768469305230; 
 Thu, 15 Jan 2026 01:28:25 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:24 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Thu, 15 Jan 2026 17:27:39 +0800
Message-Id: <20260115092749.533-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b33a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vv4ZX1vSqPLa4hud_FIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: cgrD0LyCgIQwS_yUh29HceFlPoUOu5kF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX3ulYSba99hGk
 iv3VZ7gYKO/aBiZZSRtp9OW9Tv1+kvhNHMpt3wF5i0sw1tSYHj1997l7FLDRZi8fnlbBoTu5V2z
 go0RrC14yHQNpsAdV6drOo7JWGtpKjX10/Piy6qeRZqTWTb+KF+ok/IukcSwt2ps7wQMw5iEXhe
 Ng5JkSVHK05a+hkCrlkBrxtnrJR4msPnJap2UshHiPEWd46gOpcsr1eo6w+0Ej+hYgFTkgrw+9K
 ZWyIJ+Jarue6DnFDB/dx2m7vj2IadKz4bRMpM+Dy9+0/ADU6tMc3f7bREUvKBz6VQQDPtXUfphR
 rrQJJkI0sZhqGlaO2R5tLcmJLBXMk3FdnWB7ZjF97Y2P1aAtX0fgs4pzvZrh8uKnWHLDa/4bIjR
 R48RXLHbnSoUj5Yt9PfdxGXbysnJqGO5QB/I+Y8MHGDT6/yeP20Lw1T0Vry4qQOg75Yn8od+omr
 1C10OOZAi3Lkn+iwZ3Q==
X-Proofpoint-GUID: cgrD0LyCgIQwS_yUh29HceFlPoUOu5kF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 7a83387502da..9a9a6c4abf43 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
+              - qcom,kaanapali-dsi-phy-3nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1

