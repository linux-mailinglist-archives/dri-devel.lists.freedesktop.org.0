Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1ECD58C3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0255110E278;
	Mon, 22 Dec 2025 10:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA0o8Cvp";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpOPNcx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8710E278
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8j4uK3963828
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=VA0o8CvpqBBiQvYYUPjvXzDQRAT
 Zf5hGMXfJIzFt7pgD59l9GVH7m65k7ba5Xomzkwx+hLTZ0w5EouGU3voEqn8IGkk
 MHlfXqOmrrVTTnrRXi6Sx3bLaMEKL8kAhlJVkWLi0j63WjVvTpDZiLfJDWzQJ00R
 HcnY/7Cn+XZHS8wbEaOWdnTOUIj7HFVmfGt27zf6iRq8YvRGd33ieNdePJ2Y99S8
 g6nVanlLNjkw7Esv9pY1JhLr9xftJUYHKeXq5HLk0eD5eRo54gDh+MNbWy5m7HhY
 q6RTflWF1CTYkf49f8Dog7nvIuVuqwuEy+k5j0G3FWtLxRRBnR/PzBQgu7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hcx2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a3356a310so102289626d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399065; x=1767003865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=LpOPNcx1Xso2uzCMiwtjvUOv7aaoZzRgxwggPPZ0J7ZgHeWocnP6tlGSJVUqhO4elM
 Npn2jC1ZaoKD61NL348QpLGdmRljVfJTy8ZPlNJiO1A66SmHhDLjMcQHi3qROhCSD/1H
 EaD1Qnj9nKTImeMXsT2QhTkBEJ5cyjiacNijFaXn+2ECiu75HO8P9NqMkz+gsn69o3nY
 tXI9i9lNg/FNWFvJoBWNhcWgtdQRK3ye7DfvGNNb+LfrhK971r+T8lGj5FBE3a0Nogm5
 e2xEku/PJ2YgOiZIhehTOLBpBK+aEM0oWb7pu5QnK++++dG4Jl1aFNr9dwCLOB6x11BM
 eR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399065; x=1767003865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=ZyOWllhBk37EHn0+d+P0uuH/4yQHK3C39mv6B32A2YBzMz+gCl7m3dof5/lM/vsZuN
 zfuYoiSEancHriHPeFosRpLxkccAnAWjky4sDjeBWgt0Kul3UD5U3DO5CLZ4ZEw3dUNa
 rjePDK/1yzElalgLIQrt+85r1D0cyVry2YCGiI2crm2T9bpb3Bleb1YMDbgxW+W+dQj5
 m3HlwO90gUdnty/OX2Qy5NY6n+TIgRpvcYnuYddvcEio7Xt4uQSZEylBaWzVOwcRlnRM
 ifZj6J5fEKsOYlxoR4o4dlgE0r5/w3cHdCwknIl2s2/C0S/NawIjkiE2IvWOa78nDdPX
 4CdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAk6/APyZktKL2Zy8UoH60yJGKU8R5YuAttM2t3tMcG9xFK6XiByXt44L2rVg2V247FLXPs2rqYl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzJXuU/Tb3CytwYjRi2bxzqYeGsF0Jt/T/1dbro9cIBh3SF12K
 4DlR2B/+KHRNhrRSceaNuDLWizKQXsyQluKmfe9MOwCd0UTk0Ux0XJJJjvPyUDj+nywLA6Mw+sQ
 qRK4IeKbYrcd60hLoF6W8Kx4uyYhVd/B4h2SEhFoVTBZDegjRFVnCiHYlyElzmuWntYO+YY8=
X-Gm-Gg: AY/fxX5JnXJgNwkNCE+uoKcUdiC+MJTDS/z2vEcxhqiZAwwySUYhmVzns0TJFm2m2xh
 k3Q9ewu0H0fFKOa5eAxvFzAd8e+IbXTZ/Z9zy14by+f6zgRkk2shaY03jihHUVJ6e3seBOgmK6W
 S36Qg+MOpTriJn5M9evAONjx0JSM3301WhvHgSmRrNmFitRPmb72VJZZFzBhFr7b0L6Wyd52Xb6
 eg9nn44BJuPBwIlVgPLcyte3Q57GY0UP4i2o6JTGvw2gF8kAZtVOQbOupz3dkDOhntoln18tunT
 ASpO+xvLEOJVOx07wfu/55Yd6wAxLGOe/+rfGvPwJDELeBAu8yJmojr1+290Up+ZKWA/iYBBm01
 Mr7wMhcqx4Zsjlpp34LRPmjZi88eT2N/ocKmfYmMMzVvwKb4Nci+KcYPc8+ASPCa2ur0=
X-Received: by 2002:ac8:5fcf:0:b0:4ee:1dd0:5a53 with SMTP id
 d75a77b69052e-4f4abde9f30mr150903951cf.78.1766399065047; 
 Mon, 22 Dec 2025 02:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+T6m91+oGsjfriTmuX3mj6iu58uoeeqOFMGa6SnGVr/aTF4HD9oscEnMvSP7CWfajySBoLw==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:1dd0:5a53 with SMTP id
 d75a77b69052e-4f4abde9f30mr150903641cf.78.1766399064651; 
 Mon, 22 Dec 2025 02:24:24 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:24 -0800 (PST)
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
Subject: [PATCH v4 01/11] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Mon, 22 Dec 2025 18:23:50 +0800
Message-Id: <20251222102400.1109-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fOrUGGvZgOFVz9gfPMa6YsRZp_AKxIok
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491c59 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX1WHPrNM64Kkg
 sClNp2rBHbY4ofJHBqKDgNK1ZXdm3vTzW1b2kMqVpoAz/niuAFYjMqwpfOg3M35wevyyPrkInZM
 a/nWZ60UI56Xsv7Ad4YWwDjEUdWFuJz/O4vftLiw4f3ats0df7ZmaEMNYpj2lZCDnFaWZCTh70A
 O41ie2AvDZpUBXGvvDg9HpzK861eNJ46ixA+Y5AyrV/HZ5b7KE+HRBw/yRblbLbB+XXjsmnvpQs
 ++D/IwLtx7Xs/Y7dcIJVAaUIay0v43AML/nFqpT1r0yoaHCNB4g+AgPdQOn/i3kfuh2ilgYt5Uo
 l4yubpOU9pDjfnxNAwEagWiHO9z9ktFUa2TwFqOSreKYCWtErACzpz3x998RiO/ay3+y8RPYsjE
 QCTHqKGzJ+JSUiYcxC5xRBN/wWSS98WXX29w8QnKSgB8iT+XgCZuwCZCWKv5MTbYWzOCvI3BHTw
 lwwXvgjkAU7/VzeCWRw==
X-Proofpoint-GUID: fOrUGGvZgOFVz9gfPMa6YsRZp_AKxIok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

