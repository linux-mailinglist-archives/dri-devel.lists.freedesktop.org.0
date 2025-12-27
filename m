Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BBCCDF84B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 12:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AC010E0E7;
	Sat, 27 Dec 2025 11:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqLo8btF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGKd5LnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1272510E0E7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BR8kw7u2997590
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H
 1QPu4VJM=; b=QqLo8btFJES1VeobRb7iTMJ4TDKtiKcctcNAAG13OSOj28SJRn7
 gBcW0J1/V4mDE8iiD6CJamsZgQ463b/cfgFb1G4d/4Izju2FzojMMm+Q7HE5+zSh
 0gWJH44gHi4Kv0Bu6rpf4uc7vnuxtlmBVfQzwN/PRJgaFkAQOnA5n+E+zl7hmkhl
 4oilrkGoHTqUQi7TaHqjXwTroXN/P4x6jRjCstqZEnUG8TFyxSFwZxMw8upOePKc
 Z74H4raH+m6jOUPcGEq4Jm+iNqmpR7+9wj7SiObkf06e7Q0yHQxN6OVDw9Y5d93f
 PuHpXjEDsKliTHyYSQ/b4PzFEonQuU6sHpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r68cg0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f4ab58098eso184906181cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 03:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766833516; x=1767438316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H1QPu4VJM=;
 b=QGKd5LnAgn/WVWx+MsEEPZsc38OqJS/wGJpmDh79RUTXJCs4j0OZIKzZ+M1jhZIwea
 QkYyLmlFvVqytlwxVwRvi/8pvh7YCrCng1PTcXtEZcLKPM6r6Uc1N6V/bTuMPEM+3owq
 AMfPqp2y0BhTwtJQFqyt7ov/l62sdPD+FEliZP2x1AzjoythVq0IDl7SuoCLoT6CUnU9
 qK5ALQVgnMgo1KgEIb6MpviQGL3Jkj1KWLP8otS7/qKrkRdQ/rVXGwKXiQEZlfCPm7Ff
 j1ygsQp9HorkYTMxzVtH4D1Wywuqr1C+AwoiR62BJrR+bzP3qvBftbjmAkgpT1+WKpcs
 yl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766833516; x=1767438316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H1QPu4VJM=;
 b=IapShyDx0V3Th+CFsX2EM6dcnBeOfhvM2xUWzkGdArNa7ftpQcGgZO8+63rxd91YIs
 cvehdT34egt2LF1Kj91/spUnFdxEvhyZ8+w5HpMH/hPZD5SinWyMOzl9GdkFwtDEcv6M
 S+TvTyypr98gXYcXwS2g4P7H4Xav0CKMBkvBOKTyPxjhEBpzJZ2T3A7pmpLBlcuPua0U
 Yo6O5iu0cv5Fphnn5XViKjZ/xTY4EqocQOI2MNi6WwuhLfxtIqyJW0XyUtgaKrD9G5+s
 uaNb2/gLKcwgykX16wNxfpfLBc69q+N14cEITKwWNonDqnKlx/FM4j9M4i3yHqoyAiIh
 TVZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu9vTFU42NKcEY1jaLAiphI4nuwc5mIQysin7c59ufYDd1OeZEBbFSIcly1v5jhGJlk1eZvV6LKEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHH4NEKVHHZII9w0Gf/N+tafZdpQvEMlaTBECRXY9cLh9zbVN8
 e6E4othtjeSVxcr9kioJDmsdDtkX4TUxwrYj3w8OtAKNshHgabKo4uzfvCcAkMSldMYmxJhYjdp
 NdStk+zCV5CFsjasNBah7Ld0vuS3464fgmfVsbHmNYyVtLe0JCsb1PTfoyqtBuMmN4GxyjMI=
X-Gm-Gg: AY/fxX7uh5uDtvaxT/ZHL07whqph9o5/AqcnqgM6ifxQWeAMz+ASihCdS4rX3A366hV
 n2oves/vANAO19SkEO11hP1Hj6dD46jo0C6p2TcGcomBj7yWyQf2p3VHhfQoJ8UDBCWwiqf7dKG
 2dzNbzjqZGXMdTm+FYsoDphjExLVIwKodAVJ4pSbuwyFxdti1I5eWmC93KocdDSlw84/Q3ZKeuq
 WKg7p5q2Vt/DkrRXc33l03EGBoL6VOYkOhxAvYHuBOLxipRhJEgziKGAqsv9wAqM84QxXRHOv2D
 ofv3dIgW8erEczsCyRRsQfbNrJnWUjSvNCIaFPFX5fnNx6qF07P8cP7N7BVX+wSA26NshFEGrEN
 YqcHoE33QjtVI6CUXPcYiiyhd
X-Received: by 2002:a05:622a:5e16:b0:4f1:dc5b:44ab with SMTP id
 d75a77b69052e-4f4abd75343mr340171271cf.45.1766833516304; 
 Sat, 27 Dec 2025 03:05:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0TYgsGvrtMGtuU6/RL/Z/IVORpXU+8dilniFAv/6fmEz4NBxqef+dKiYVk4jnwyH692w09w==
X-Received: by 2002:a05:622a:5e16:b0:4f1:dc5b:44ab with SMTP id
 d75a77b69052e-4f4abd75343mr340170951cf.45.1766833515845; 
 Sat, 27 Dec 2025 03:05:15 -0800 (PST)
Received: from quoll ([178.197.218.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm49080283f8f.22.2025.12.27.03.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 03:05:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and reg-names
 for Adreno 610.0 and alike
Date: Sat, 27 Dec 2025 12:05:05 +0100
Message-ID: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=D+Za4rALfTUqTsiNInx0TahyFmiPEc3D4DRCUn9Cbis=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpT71hjLcG0oDux9ARg4VrdAiDoAASVRNvFJ7xO
 KRTKDG4zVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaU+9YQAKCRDBN2bmhouD
 1+tQD/97pNqpk80f0BR+P+9aIcU0dXbS2l7pXSy1m5iLY36I9799J7z7O2+Dkc+ANvhNhvDHcrj
 9+taufqhVH616rKPRV8y+wKhoYqLEYNMy6UA7jcVpyPaSqHE7ge87zpGlqro7DjynV7BFOkfxKX
 kBrhz5M/Wb/gL01PgK4e9reY0Y8ag65gSDBdGSrDnsSVSrIPvnZYo60DiKWITN2fCq5J0rwXocE
 ZBQpU6+XdfC++IhaBOdBFgyRQHTDsI05mMOh/JJ1VwMxEgNKuqe2Ed618wTb7dDI5o62UbJ0nrK
 8Os4ZhH80z0OVPMEidaOFdQxfLOfpZgrMXRwJ6TrqLZh7ubbMmXeFfmdxmJIv8Y6+dSIcMuMw8x
 ktgtNLoVes5a6yWHwNK/uPgcl4j5DICQWxiHN4biqpKTE5ApjpZTXUihu+kkYVUD26XCeM9W7Mj
 G/uUw7ZgfDfBUt3SeBzHVHaDONICHrN2Jx7tjoKxdvASi7u7P470OvFyW9F9zzWWyz9v23928Qa
 5WVk64QQhwobL906S+iAgZXsMWk7xYEumnGjmAFqsWtSp1ehcUrJ+GqG06oQpVJdx0W4zxWsqsP
 37CQVs2eXzhuiAuOdROasUwpQymMLE+OOG2IbyPzdoWgqoQm+jNaj1qXblUKrwfk8tbiRNSlGCi
 2gaaCOofZXFUwng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=694fbd6d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HA3oLdluH4EBEQOtP_YA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Z4jt2HhzKAumXQHB9xK2yOu9yP-kLj7X
X-Proofpoint-GUID: Z4jt2HhzKAumXQHB9xK2yOu9yP-kLj7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwMiBTYWx0ZWRfX2i/xjSBMDyeZ
 rgk8Wx0PVK8iYpXwVkDQdeQstDzmTnBdCMfNttr8UaCxH+f3rZePv+ERmuDmJjgEPfX+m0tuiRZ
 4AWZoIXlArUFOoex2946345AgGbNW7GQZw0QXVu17bsSi43ToPdJz4RsD6wYiJm5bS4lYCDdvBr
 3CgJHSUvhQRISNqG48Go9EtI076ffUqsIheViejBZ0VFMt+cvFitUKUUNVwWpaB62r7n2RXbYRz
 QuGWd9FKObOzRXRH9cjlkiIWIIrZdy4GOvRm6l/eG2hZfbRRha+/BiIQpZ9vo/JOl9cpNlc3A8I
 2RRtFEJYZQ2E2oX7vH6FgdvXWsXPWaQ2v+AcwjAAfbYGfMAJGnLqddlc45T7KTJ0houcCAwzAdu
 cGeAj37/vLpsNCjQicLBZnAEmQU8bQjZ35lUq8cKdhIoCcrNuo1Hql8641MRMKrkZO3SLN3GQ9h
 XmbZeA5LBeIKDy4gI1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270102
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

DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
"reg" entry, not two, and the binding defines the second entry in
"reg-names" differently than top-level part, so just simplify it and
narrow to only one entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..1ae5faf2c867 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -378,11 +378,12 @@ allOf:
             - const: xo
               description: GPUCC clocksource clock
 
+        reg:
+          maxItems: 1
+
         reg-names:
-          minItems: 1
           items:
             - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
 
       required:
         - clocks
-- 
2.51.0

