Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E1D23801
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62610E71D;
	Thu, 15 Jan 2026 09:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNuYOHq9";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXXOndGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5110E720
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g06m1991718
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=gNuYOHq9bGpDJAz+gDlrdBqizrr
 RjFNsg9vKfLdoNGUvmB7/bZWY8sihQcSIKiW3J1GMA1lBHRRLiiZXcbpURN7U0Pl
 VcC7nhD9PkNAjk1W7ApzMxeF7BCqdBA43ay2lGaJD5hmeSHkY6630KsHoKj9das9
 lxqJaqhovS6RxKzNvWypOGyENgW04kbnWmr0u90UhfAsMh14oVABl+jhIPOHbjsx
 M4hnQarsGvWr8VTG4HwGpobvnGk0wPApqo/+N7q9eiITysFcOFYq1me5p/juNDpL
 ieTlvS3ZC1W8DSnh5x6lGd2DGWk8R7AfrQvD6Xa51R2FqLzbiqZt+JtZ+Uw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbudfv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8804b991976so18100656d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469298; x=1769074098;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=XXXOndGxwKBviiJYsm4rFbxbFcRCd6n1lA97qnEhflC0V5YBo5AadRnjxtLmXr1chC
 MhB/dJYxxV/tNTPN7DC8ZHtuLznhfLf4WHy3evuS3KzcaAI3Mo27o1e17wltPc+dMX81
 XDzxdNpcodMb/yITnLq/nXZQFuctIT200fwuz+4x3IsH/BiwfO7D+v9enXqyjmZyF5wk
 FS17XJbuwBoSdwUosNLi26k23Z79hu5BYIDWqcocBrkm46O3EKxD7MHuWQeSTAH5zGGs
 oznYAktvuRtd713rFjYT6mlaUC2x/vmsFK5SmQhjk/KnM/QB3keATvPTBGVyWfZFrROE
 AkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469298; x=1769074098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=GkoprOSJKlGEoCdRXdO8DxQAvzRxIphx7Qy05oZu78H3IiqYn1ohh9mxuwPhjC2kiH
 aJXp/gRVkvrjwVlI/0ByjzVIM6rJPG2chrSJlQqYeWqB1cC4hsMyjUHJsbXaofvZmm5h
 I4HPjMIt5mk5HkyN2Qye66oWIibXyePU7zHPBQMTp4RC82mFHPLCj2MVeivvNwS+WeyD
 gMXhiT1NntjP3T9iCIaUEeUpKzrreJFk9Tt5L9vYsMvSO8a+JdutIO0TLjRFw/GkpGC1
 6jJ7TMJ0YKDOC+JkvJo98vJ/WuZqSVoNoiCPFGt9RdbBonNM9O78nq71yA0cY+aX3+As
 9Twg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHt26Vak50FyQjzoTI5FTIy8uE+W4SQXvrn7dfyW2mRBp/e+bYdZEfJtPZMput/ywE4CzSoajyHyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpbF2OIRCVyb3ieNb1Qv9ao9br/QRuVKCBh27y1fWnEQptFbgq
 2ibGIqbRenNxNsjPrMllxg4pfKCckTsfBAZO7qBQ1A04sY8cZSkVjK1WhIWn22Y/PFN4c6nWTLq
 bKyYt0wrtON4iuJJz1o5R2M+ShUMoW5zNGmWAllBERV9B3+zJ+SN6gNpQ+QGX8Xu3Ac12R0w=
X-Gm-Gg: AY/fxX628WqJcJoWEcmF+P5WrdMvu6zu1dKTMnbFUu2NzhORRxYIljOfn0/jg2LEa05
 J8JK/+aBqJ7OLYXkKbcgTwegqVRMNJn3zxdtbNTmQEKyEOQX0hxjOFhPkQhpdWuQd/hrpUZM0fs
 lnAD542q4/Qv+xPr14PqBBCYajgajDV80BkTMTF4jliMCTlitxmz7ON4wGg5wp4IaTyqqpg0zPN
 hFRp3ZvVwt7RQpS7Ko8kJLWMmxFPK8JJBzwOExaWzYBTkWRG0nP2L6Y/dVzx0XLgary/PZMQla+
 NtpIo5zUkBSrmRrkMHCX5j3I7VpGxwUkKDBRyZ346gdrjuCxDOemUoH0WQNp5pLh4yJYqtbieyh
 ZWBEqPz+u3nxEWXf6+KyHFG9Q7h9BW+AKfVpFYVPIIyNP9RBzp1lTL5oHpunofbkMvUg=
X-Received: by 2002:ad4:5961:0:b0:88a:3113:3ac3 with SMTP id
 6a1803df08f44-89275ae069fmr74177516d6.10.1768469298137; 
 Thu, 15 Jan 2026 01:28:18 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:88a:3113:3ac3 with SMTP id
 6a1803df08f44-89275ae069fmr74177046d6.10.1768469297587; 
 Thu, 15 Jan 2026 01:28:17 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:17 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v6 01/12] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Thu, 15 Jan 2026 17:27:38 +0800
Message-Id: <20260115092749.533-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b332 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: SDuUmllCXJKYFdXr1Yn8FYz9AZS73T0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfXzS07bAuiKHmz
 TaDEpkwxjKuVfx89Da8tZyqLLBtOCIEZjpbXajRcrSnsVpRBOsYFNHzqwYKWdbpKDYE3wvGResV
 DYs+oHBmgdGWaqWeC4TrD8AjG33AOxmaGMwcUflu8n+QFO0aUFBAoIStH3wdvQWO+f1b+b236i9
 juj3m2FDSCxv9wnHI9rjf04oRWFFcEtiHbXnwIAS6uBt+AUU/BQt0GSFEvWj9Q1Qr/9EwPYVE81
 RHmfHnFYOiws61KbmlSWwtaSMW0gFhpvDavPJ1YHeWDUGg9oln9nyWbjIC5Pi81oFoM2myMV7e1
 hlEzgaJjrga8tS0pX1lmqT6ph42wpf6/JAF+0Gsrlzb9jmXcF1rhiE73ZRR8HAc0FwAej7+0LXd
 uh/u6eveaCOFqOmdV0FYXAzPvGXiRIwaiypzQXewFejsmSP/+Ur36abva4Jy/O5UdDNhTWFRTqp
 rcumaOjhq1gnqBl/nyA==
X-Proofpoint-GUID: SDuUmllCXJKYFdXr1Yn8FYz9AZS73T0U
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1

