Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E5C83896
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1105D10E351;
	Tue, 25 Nov 2025 06:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cz5ijLBl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThtR/RPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0737510E352
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP4wDp41672184
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OqlJLDbVw4T
 n78JJhjxStsJzAZqGZdEBuegjg/h0GSI=; b=Cz5ijLBlzgvJwMtMyOD7NHXmfyX
 Hqgjs1vyo3visScVH+P7oI4AnXwJkUTFxeQqjhNSZA1tLLIF7fmQ7Hct0Iywdd3/
 7hUKvCmtiIX8IG2Heu7ltdBRubzoAkPvaZTrIIRGpnTm0kQWS4L3M7CzK0Jw13qA
 TZpyp4xNxAGS2K7iJ5xzKVr0xUObZ9HIQPoYzNMRgTa1J1ZuFq7nhQkbkUKb342r
 MzxfZMwhEgqC3YSKoxdpyRwm5X1CtiWLFeusJSBTVOWmvlSi8bR2p2JYZTG/LzG5
 AvigkOvgUnYDIXvDvPz4SFhbP6WXFvYuQI8dIOGDrfXmDMnOd0SOfvnQwxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w809pb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed79dd4a47so128709081cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053334; x=1764658134;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=ThtR/RPs9f21Mb85NkMhn8WuYiqYKE6ahJhiEG5ggekztF4yg12sugfIqJ0/+Umt/V
 1+x1aYxB1b3VxER7/MHaE6gHoJN8rURAix8s+XVNl79bZL2Pk1KCqL8JqklhDUrPsfld
 o2eFsQmSzKrQ4JrnsNKwGdMcujPo9HLY55Dm8Hm24m7r70+YG0L1GB8RtPGAmxXqJtqX
 +zxXDt5zj4j9ZgcjcIUE7IkAyKa4VikjSh5QB4Gj9qv6ChgI1n1rtPXRARbKCkzzF0X2
 RkxpUIlqOlkEttHH4Cy9tJRB+aC+0tu5ugKouSJvlQ+4VS9fxcr2kiqY2xoHsDSHQwMJ
 PaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053334; x=1764658134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=U7IosePtRRD/H33cruvXdkXDD4bYA/5VZBSvRKPzC7EOSjbAkPRa734sTsBYC1c6dd
 S+GYzlEjKOW4GzWuHVBZy7zLwYAmFDjSuOl5NNYjMLdPUJN9kn+gWKjNMVl6eRXMdn+q
 pSMhNyTzC0XCv29RtktBXYjvfAdrDQjsA9G35YnCSzhwmzJI4CshtncV3zLDLPdhdUXO
 AwNZBKfgCHUYYns26WvdVLVc+XWfqb48HAkxMXNLoOuqWV6ukToqGsLOyOI+xp9HpNAv
 Hg6JNAWnyE8nGtenxc/tpx14q+Zxx0TjczWZSfslzkDR/FI1EPOoWAL/yynZG+S5Huy7
 4nkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0xcYd/7PuSwy8lIrFE7rjkteSULAszJVPX5MfE2cSql37XuPXjL9s+G49QoonqNYmmtIahwbADuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2dTo/+3nX9xR8v287AkY3vgcNOmmHAPUW4pJxXQ8acAT+TZxR
 gxD2zmE62lvzDM8UD55tJjFYKP9oy3JFW8LkMnCqSVoRfhvAcTkNmUDZ1sBMpq92XOE4kR/z0nG
 mDgW8hKm5dDv6ZQ8x1tsw/b4Ui05VMHYrLy2LF70CBN5WLzdqMu8MuCvgXapV3eGOYGM3D6U=
X-Gm-Gg: ASbGncv9ZBPVQshhgGjEpnYrH8R7GAXf6zNecpSHqu/hGVdXX6b/xZMcE12sD3yYrwT
 Pb844mUvoGcyObv5g38j3RHSO/6/emYfmwue3pSKz3AP1C3wCirAkrku8vU07gcIX2Ureq2eBFF
 A0elAzwQigSqitKbNdz0yKjnM9U/tG0ckDMNkPwdrOyQbwr9yGx1neCIFdx37PiJlHVGu7ILI23
 0mbdHVEoT2zlrYHvy6mmXENfEXu3HW+tC27XhPgO/Stn27wjed0VHsGVEZqqi6+Z/bCEQbsfYqT
 XKKDQPMLeECTvo4K+E6NDGgYVQO+Io+lUkyYcyNxevvYYkuneQVC0Pl1zoHaYhb3Kz6B4AnAbL8
 Cuf05OUMVzDHDqJr5suixipilaAWx9ce7+uWiQkP4rX2iP77rrl0vgIV4cbueK3Hmxd6PCkw=
X-Received: by 2002:a05:622a:1aa3:b0:4eb:a0aa:28e with SMTP id
 d75a77b69052e-4ee58936cb6mr191919501cf.64.1764053334586; 
 Mon, 24 Nov 2025 22:48:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaU+K791QjFnobNp/KGKhqyUiww2Up4fYHtIc8c49z3Godcl3Fl5+c/+96X7shmR8C6UrmpA==
X-Received: by 2002:a05:622a:1aa3:b0:4eb:a0aa:28e with SMTP id
 d75a77b69052e-4ee58936cb6mr191919251cf.64.1764053334173; 
 Mon, 24 Nov 2025 22:48:54 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:53 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2 03/10] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Tue, 25 Nov 2025 14:47:51 +0800
Message-Id: <20251125064758.7207-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX/hVsxGZwj8uM
 Fm/M755h+S6X7dTnKDGVonMK1KzzBjKiFAT6GarJ6ZmjrcqaD1uhN0RcDamLo4F6d8LhUI/eWBf
 TDVduKsJ2Sd61z3Q3FC+VlZ12W2/SkDcUlY0XM5JeUI08AqFfM7JyFMmia5sjQX77LOUvIeYP2Z
 T4esqpXO3NazdUJRLYE3LAp/4ABEhAkKNNJPLwy04i+jI7D+Yx708XgItaKk7Pp/MaE4eDKxGi8
 6piz6FxOcrkHBVvmBsV8L9z+Kk2E3m9Zv04FqE7w/1Nb1bRYSl/Iu8JNOMiz1l1VvRgUeGbNfCk
 Zod6Oyfyfk2CSxPdn5XUrNE24JlFj3RCMQV4LnvWGasR/5p3d0B4jJz4K6IZsaTLaS+7Splpt8w
 0voaXYn8rgBoUs80hC0SvnfqMv8AjQ==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=69255157 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7eUOUwARutqepOY9B-tCh5Sc55SmdjMv
X-Proofpoint-GUID: 7eUOUwARutqepOY9B-tCh5Sc55SmdjMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

