Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF2D0AF61
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E46A10E8E7;
	Fri,  9 Jan 2026 15:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2O5xSPP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bg6QqWZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D611510E8E7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:37:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098XOPn822831
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 15:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oH2Jz/3QNtM
 hbWAoaj888UhChyiTdqT0RZuFRUtMRPY=; b=b2O5xSPPY7ellHQlCETxG+Zj5EF
 dcYNlWT4aDTaRXFcSXwFCxLV6epMtXKjrftpvzHF5DbO7Mr4icX/jSFy6emZsGyH
 yBi5FPmOK4/uqSXLk5Eh+VBo2bowNWf1toc+yQF/5ETpglw9RrGi6sn/sc09I5Ju
 ZLrPf22ovwUmOBdZSzku9dzXJty61Zmf6MpFuNXYRqQPJjOhe5fNrE2uAkeovPSB
 W44UW/hGcQXZ8Un/WM7LkPyvQvL+LwrI01lvRUrn7iOs/l5Pui5jH1e+YhKEDSzd
 HG7DYG2H3pNGOx+Kcl9bngmmdjoc+s76fTMrbGwqxJOIYMAxlupZqvTRygQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94h81f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 15:37:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34ab459c051so9819372a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767973057; x=1768577857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oH2Jz/3QNtMhbWAoaj888UhChyiTdqT0RZuFRUtMRPY=;
 b=bg6QqWZZdDixpe0+hbUUX9AkEeJAGQ7d3sBgVEuY0z/1aUraz0A59wzS4pVZ5ew8XU
 ZHNDxBXvinMd7xxRZAQAfKuk0Jxhj3RAf7UjX1anN/qgIGo5DV2UQW7RINrRdDnYOacL
 6cq6drykTbh1S5QNOlMTYlWmjiiGINRn4doWfQ4wXP1KCEyxsv2kK17KbTZvFmqT6JKj
 e45/MrOpqjcmEqf+Kkx9vmWWArwXBozm5zh29MFUAIsnnJJJj/v+971aeOyEcRRXSbGE
 3bPksrCJopz5/3XmPNQOJAa5c30jTzQX55YoMfNWqVhbJON/BhSCUcDmf2AJJwT/mtor
 cWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973057; x=1768577857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oH2Jz/3QNtMhbWAoaj888UhChyiTdqT0RZuFRUtMRPY=;
 b=jx3g1oRWbqMWMV7o8hlW+J3w8H0e1+UF/J+4ifIDwZ4EVcCko6pWx37EmJt2RlCfj5
 Mxt8a+O+hPKRife4CWXPbPe+RKah8vb/ZTkj9/evId0zOzOvZOoqOebUN94oMx58iEmS
 N7i3duc4Jel///I5ugPno1bTITk0SimNXtab1884xR5ygqSsjL5c70BT8edPsYwBiPiI
 uNBg8zwybOETsbCpfUdxX8LIqLVYIiMSxzdfNDjxZFv6pJV8YvEOvGq74iHs20zfCmB1
 J6ylhVKPQySEWxzX8x3o9TCMkY3dqvOLZGsC6ZI9JqZpzi5tfaITWtUA01RldS8SL2+Z
 yv7Q==
X-Gm-Message-State: AOJu0Yz09Y7pxagqFmNqMPzP1k3rrPNM0LMV0IYQEr4Sxnri8UOHsz7m
 L+VnrnjeoopqUPs0H9JmJmm9UQCeHn+Q5aSsa1BsJvgGyO3E3zHez2z3IeKHEFNldxhwHoaxcOD
 7PqIEFeKvuqvRyPGBQ/WWayqgaTE97ApOHI2kZu880Il/OD773+TQx69laS21Liyq87jvRf+0yN
 itTm4=
X-Gm-Gg: AY/fxX7oyiE0mCcTSSSdaqpmDQLWmkmF2fLuUcjxiAbUu6kBm4M3VaY/Za81tQRkb5j
 hLCxqPCHJBnIVxKV8DSDZYAKr0beNUOG0waCc6nI2e9Cgmu8s9Tj08Bw6AOAA/fhhrxwk1N7NFt
 a5v6aM/ntO/AgpDhJRD7fwAeeUxOhcwwH9xfWkoiDmhoV5MQrbEWgzAx1yr21abiqdZZEwpPiFG
 YnIStxHahgJbvdl7XqfandON05UGwxytEd34y8wSRMnkRztlP6hVOStjsErlsAO7atbMm4MdtSc
 VDdTS4OY9mwatv7SNUOLQL93RHVI0PqezKFdXsNx8NYNRsK3gSag4k2WFQQ3ZBLN52pL8LhDvE1
 7AGh6w9x2xsbdBdjr8KR51IV25KHf8Y/l+ZNEDH2Kj3QjcaYeEnAu9h+A
X-Received: by 2002:a17:90b:3c09:b0:349:2154:eef4 with SMTP id
 98e67ed59e1d1-34f68b83d71mr9042670a91.5.1767973057484; 
 Fri, 09 Jan 2026 07:37:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2Vfrv2/tYoqBOeDYVP7zcrLmd8CQkCkn73TF8rwpP1iUQcrfHCONENcD+YG4c21pg7fTQgA==
X-Received: by 2002:a17:90b:3c09:b0:349:2154:eef4 with SMTP id
 98e67ed59e1d1-34f68b83d71mr9042647a91.5.1767973057024; 
 Fri, 09 Jan 2026 07:37:37 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f6ae3f033sm3725145a91.0.2026.01.09.07.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:37:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
Date: Fri,  9 Jan 2026 07:37:29 -0800
Message-ID: <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=696120c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rta67SEPMMT-BrgIBlQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: j5tJwhyrgV2xbX9nBeoIgYmWZVTR-yDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX01F6IWZa0d5N
 Xd0eHBdNn7hAhFv/QLCox1yDtUUFBCF6bOubFuoNbABrdAG87HP1GAhab15/h+sF/b9SVrdd4Cc
 btCduWrtHihnion04IVbBdbIxlKsHMGLakFgXtN8uprSV3QhAVcCZNPySj/AZjOjwRnONlaaUAm
 0ycyoBJwGsBgAliU7h/rGgqpOt0V6rSPo9hCb/gC2Tcfmsci3GzzQrAwjlhEyeH2FoIkK0DYo2V
 wcSlXpI3RsU5hBa9e9IHyBgVcrcTeZbAdi+Um0w54aS0mDZY9PxaExeQJoCuFJNf8dfBG7nFh6W
 u99vJ2UT5u1opGe2NmspgYNo7gKTTkTFGRVdoYxbOmsW2v0pOYEqBk4/fIXZXqyya8ul/VTmlT5
 qD9GvoqukH77vJ3vM4ZazsTQA9WOBAEfedCFSm2sN35fJb7rHy/n9tYx3OZmEGNrCrgvhtzSswe
 naqrng0mfRcTfJ0mZIw==
X-Proofpoint-ORIG-GUID: j5tJwhyrgV2xbX9nBeoIgYmWZVTR-yDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090117
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

This should also be zero for gen8.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c80909e63ca..d5fe6f6f0dec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_is_a650_family(adreno_gpu) ||
-		    adreno_is_a740_family(adreno_gpu))
+		if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
 			*value = 0;
 		else
 			*value = 0x100000;
-- 
2.52.0

