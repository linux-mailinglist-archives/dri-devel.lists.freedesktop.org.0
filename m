Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC1D01AF5
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA7E10E6B4;
	Thu,  8 Jan 2026 08:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7O9aB1P";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXuQdq61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C5010E6B3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:57:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6081E6Gk877848
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=c8PWEb0m8sW
 dkLPVou1pl3oui9KwXqV++4vSVkw9qLM=; b=I7O9aB1PNe1S/3qYGlUbDFfmmQL
 2YQl+hMVOe27gUcYM+8pYK8kwKvrB5KXl4c88iuenF7Fhtpa9YJzrt/jOYtiP9i7
 uSRLsZ3M/jJoemTvbDolsWEJlCCmDmQ6ZP568jAkVYPaQpcI3NAXBgoRZlvdCRZD
 yUFVLC1lcuKcFjWro6Q4tAU8CfI7U9dH3oTg72t0cXawMB7GueHn833Y26g2uvwC
 U8dvOEszwCaLKkxDp2nq0MYct0LD0Qk8gCj4egv34YHZozkPCieJQ1qF4e4lLctr
 YgR6rR7u2nMQoYu4G5StLrvaOQ7ORKYnMivgsXSe67zoHh6VrBToVd8sL7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r318g2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:57:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a316ede50so63006856d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862661; x=1768467461;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
 b=KXuQdq61GQAZIEp0M1KpeSkg34Y5muo55dfCDjUgn1WPYR22GzXc4z9AKW6V0a1KP2
 MXsqMfiiGhgAnfrHnVDzo8zWf4oNLpo9d9Ag0zybkN1F5ZYqEYMhK+fjQsfsx6MBkYec
 aL/e3r2Tq1yEeoN5/zXxZNM0Aw3vaWoIoYxmDdb+7WGEHFkMcxuZt5+IKmA26X9WfNnE
 a86EYIo7Wix1hp/HdCefMCcvpUXWN7JMh5z8KotGQsV0/ELSaFrx93SgVX5T5cR0/0qg
 wurkBIzTce4tC5BWeArWeJMuDCujhnFYOTVB8hkKM1fVLLnpeHNvW1br/cvOUeC3H1JH
 b35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862661; x=1768467461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
 b=XYdI3WPOex2w0/AEf3M+GxZe7dTRpS2K9N7Aw4TslNjOtsKiUbzT+eDYPYDQK5gXlW
 maJsyO8ZpigtvZ+uU03EaiFC+FaGbDsriLUX6kl3DU1ZGAp07O2HDazHWLKAsTFCDiaU
 bxcZoHcIBiOcANJ+PGa24NAIqj4ynHf2PXh1wVNQnaZryUB/+q/3qMFVa8yR1sUAJ+Ec
 1cMszNGQswqr1aq0QlUvJJuEEDMUx+SJf5F+C+e2Dakf4UCniAOGrRCcWmhn9FMnikyU
 cEeyybyvrvi/k9ComtYM0a4ph9f61VSt2lqOOclHbzEBomyYMzGSpS6wrkhWs6auPf3E
 qnTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW32SvmToRwMzJzSXto621Qtar48AjJLL6NRzpe5BdSKNkXCSquVR0oeh0pJKJ3QWHfRv/s7kuJC4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb1cyJTQ2RLDVIP9PxirjYucnyUSUlTNA6NbUlB1xSF5lNGsN2
 MGl/Xsa8rpQWUWg97k7fqxdYo+4n9Mfcf0CfSQcONXrcwfZHx+1FoqFEQw25OT7711T+EkQV7NH
 kYcmrtkJmIugq87JTOppjMxu1B1KBNKuK0/PYNSfu+VzU3u2H0FlQryMrE26G04d7R/Rb9RE=
X-Gm-Gg: AY/fxX6dLqiv7tesYa06HLwdPxjIF3K9SDVzdg2kzEd1niEOWzhgI4zKz9gHgYHY3Og
 Hh5e+Dc+L848HiBgLAzK+hlxsMzEy5Mk0AMyarT1BfNcmn725zDISX5BQ8Lu2U3dJKHPsNU17Xh
 vEMre/M3KAjRkIRprnLQGIKVNeMXc8fgkF4bKNcpLes/iLoG6XHtwW6OwM4exom1sPp6/qHz7dT
 zi5yqV5f8ABWZG2HjNOVmk9T6ODnDHm6hfbpJqvdo4JQifOyVF9Hk/Duvs0RVZkhB4eV1QRJ3k1
 uraFsM5x7z4J47K1L6h8BbkGPklvY5TNLKBqueOEvw7bHxuUUXsP68E2RNs5wTo92C0QlJDOiIM
 GlG8JHFF7EFLTOHuWAlp30VRGNUWpo8a0DfLFTP19qO5qcaREN1tcXv6qFwGCbgIDfSc=
X-Received: by 2002:a05:6214:f6c:b0:88f:cebf:f7bd with SMTP id
 6a1803df08f44-890842f5175mr77313996d6.70.1767862661238; 
 Thu, 08 Jan 2026 00:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP71nOodf5/nPXrEPkydrhdDpMoq8JxICLTshZ3OPSRTvksaFU3iM79Vsd304YJwYU3HH89Q==
X-Received: by 2002:a05:6214:f6c:b0:88f:cebf:f7bd with SMTP id
 6a1803df08f44-890842f5175mr77313626d6.70.1767862660848; 
 Thu, 08 Jan 2026 00:57:40 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:57:40 -0800 (PST)
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
Subject: [PATCH v5 02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Thu,  8 Jan 2026 16:56:49 +0800
Message-Id: <20260108085659.790-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX0UjXaWwN/exF
 aejmDMg9B8OPrt1XwfWqNOjWHfmvbX8xEYvpKcf6Bmmwjp+QS8PfBY8p5z+0tGqbtAoEBcLMKxH
 D5q7QGML7JrS283HRy4HMHHF0hD0q2+RJppKZDOXHtczLdZn2MySLY+eh/3otylXjH32qFUkm/c
 F7Rm+JMDACiZGBDPKLHbEpHB8tUYYLJ7VEPeDjhX1W4zY68GNSiI/DTVI3LFFoT/nQqpK7meIal
 Dv4iZcwMlDQakqB9b6R9pcugh4rWK4OPhyh6jYQquAEi1Adhh01yxpr9I9aZQwKWOp7bcG87dxV
 e9XjLpO/zDlqrWCKTmePJ7P8ofu47Wu3ocu6k6iJrzYYsfAL2LPcExVbceB+b8nsBSa3C09OTvw
 1wnc6wIgyNpdIKODy6pgKwLvOa1/LsMFwYMK2vPtiF88wLoF11jaWZb0Fv48IZlMcXkbX5YpgmR
 4LuCH6q0hkgkjXQWFbQ==
X-Proofpoint-ORIG-GUID: BhNmoyNTbKugEOHEHpL7i0LTc6lBurIG
X-Proofpoint-GUID: BhNmoyNTbKugEOHEHpL7i0LTc6lBurIG
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695f7185 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059
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
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1

