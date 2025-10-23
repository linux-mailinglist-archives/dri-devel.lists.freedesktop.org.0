Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B992BFFC7F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BDD10E8AA;
	Thu, 23 Oct 2025 08:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/7J0hxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A110E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6xYiK005790
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IJq8ZteHVi/
 66D7zq8C07f3aqefDhDiFLFZsOOUaCOY=; b=j/7J0hxvXy0/VoN9aC/DOk3S369
 9ZndMDD2pApkG+uNM3VXdqkTiTpPioK0WBbr0PoYFIkTGvlrC8DTL/0vsSzOIvcV
 Yn0w+laY3HUc75NRdRgNLP9gHrru6TAIBhGIsfx1XGjLnQeqE9mdTSDxuPdZxJMi
 KhhR3iYM75xQ5KnYgcWtCpENcIW1+RvpWQ0Q6R2Z7zt+/WrAHwoeDWSffzT+YTu4
 hUFoa0BIJLkbXu30MVVP63EjN8CAOMMrnGakJz6/qZCB7kvcWAHrkr6jxi5GXaJ1
 yV5iCVGpy3Vq46ytiQ8TrqEFLz1Sxcud1xm25flZyZr3UmWPgyFwxS8jFeg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j7fyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77e7808cf4bso470141b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206851; x=1761811651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJq8ZteHVi/66D7zq8C07f3aqefDhDiFLFZsOOUaCOY=;
 b=K/o87jS4FQ9wdkmgeDF2nN0aiYkO9a+XBTPtUKPmHbQv2OhxYmwTzwsDlRozCOUXOE
 weyYG6QUbZMOB6MgROpRiQw4oZk480s2E0hBrArbgT6IaK3KPGe8EutZ3VORj4gexy7f
 TxyPTkeEzB1cMoWwkSy4MlX6F3MPgkZBTV2FhFKZ+pjOSCDCgKC20ReFeq3hD5ag9Y9t
 bMupMhR7F6J9mGUT19v0sbEA77aPGeHwFUl63Ae3gHLsF5LuaghvPh9G2WBpNT9T6rmA
 R8RzPThQ3bnRslqHWcLavwQYGXxInOjggexU+uXTSEetc7KNonITd5X+RO2ZAO3u39A5
 MydA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd8p12czGzUQdAOxa5oojBXuYd7iRn6XQodHw0XItFnUWZnyG95/U+poziuMulcPRq4v0IsXZuYB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycUgEoCoEwO//2iJTO+AAcuuUZ8Qwns+6jEZ3aEePW0kSuR5Fy
 6MKh3H2Zty5hRvOBVODAqgmwduroET/EBChD4XcvnEzPxRDYYhwGHmHhlIp295VH0UoCbk807dQ
 WM93+w1Rnfcw/BzUSbKt11zzf15iD+isod1P/NxHC3pQl4BBzRuColSIVhw2VWjFzzNofJgA=
X-Gm-Gg: ASbGncuLL1KQirw52UUYwEirMjAXlNXLBNpk894WpzMhQ8iUupFg+Fj7L39n7xNfreF
 yqBKsYj7ATKWl3HcmbPGIcBWhZ7sUALWUutRiF0BNe0+AmHVPC3P02tMRbyMJH8vUnlIrexH2Yl
 +M48XkrxG46RCr3oB5IO8P7+nrX4XxN4aeNju5iZjceI4OXqzgMD0cucTN3xjOHQoVAct71ygj6
 VPhsn28GieaKgm9qeXIB5DSzAHdCY66BEC7OPZ56viDLecf4TU1bgqogIebvCzio9CLlSrwsZ2F
 GlDU/O/5n7IyXN1RzKpS4dd3IndOY1wJls3ejnQtQqzFfa++vAb6ozup0vGoXxsfMc20KdRRexv
 t0oXmsePlUwJgCCKRkAZhf3GdttwM9rRW6EqLSYNTYENEBy4Hyg==
X-Received: by 2002:a05:6a00:99a:b0:7a1:7f3d:45dd with SMTP id
 d2e1a72fcca58-7a220130bbamr28847442b3a.0.1761206850661; 
 Thu, 23 Oct 2025 01:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyJ1rsxjg1qDnqSR6krY6mUI2Maa23+yEaD4eN6RpwTES5KZBi87GjaBN71trayEyatXK64w==
X-Received: by 2002:a05:6a00:99a:b0:7a1:7f3d:45dd with SMTP id
 d2e1a72fcca58-7a220130bbamr28847396b3a.0.1761206850204; 
 Thu, 23 Oct 2025 01:07:30 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:29 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 09/12] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Thu, 23 Oct 2025 16:06:06 +0800
Message-Id: <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8raOLP70iPXF
 v8HxfLipy6nzyTHwWvFjKcNAvakYL/9zFT6jmaSnjUcta7/0jN40YwXEe3/BQaWNH7ov89o8jie
 CdUXMTCDgaXE3IFjnrmdVntCbBgz6FfVfS4tjkiWD1YFpbllXOf5++daTC5+omw1enRSJ7IW0uy
 wL6eZkxTaWEI21QWmBLj8eGNTWyKnweAUZyV2HvU8Zz26ZWGE5WkWZXRW9vjK9CJFD5R1q722uf
 ZGj6yJwIdlNNthL9Gvq7IwE1/9KXZT2RUcM8JQxKHVDQ4fKw8DlTSG6rhTB9lByXpmuq+H7Dgbf
 jnc4Ofb9ZLOFv9VFYoMkSOjAeWkzYh/VsNvQHxLalyT0K2dXm4sSnb3gUx58H2iMK1nYotQ7xlk
 pwQwqcjsg1R1zjRGA2Muqu4hrywRiQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9e243 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=LEfPF28z9Y6gGZEU5FYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yjuRi8lBQphvPDxMbh3jdQHlpYigcmoy
X-Proofpoint-ORIG-GUID: yjuRi8lBQphvPDxMbh3jdQHlpYigcmoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..424dbda3fd9d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu
-- 
2.34.1

