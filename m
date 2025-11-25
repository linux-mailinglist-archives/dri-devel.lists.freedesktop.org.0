Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BEC83887
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCB688BE3;
	Tue, 25 Nov 2025 06:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1D1Gbnx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5eCItV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBBD10E350
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2geed2216811
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sav2JkTpiNB
 huDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=; b=A1D1GbnxrdrPX9Y0bwmMKLo4dFs
 fFcNRG5yVSj3H47kfpiA86myucLWrR3KLKMz4tT+i21R+R3Z2NK+d/LgBTI30MIS
 VkE5tCBOxj50Vg2sbjAtmLWbFGCUbNff3EO4aN8xBgCh3Svq7vaGTB4R4AG/UTHk
 qIypC24v/Z9Fkgf0t5R4YL7feMMwv5YK9PDbMfHn2VIgxHzT8kXp9oEdAOWRqhMO
 fHVsz53H90rNSAxaee4HG0jhtwtH7DYSWEC1FZqQxbCLH2RQ08Y6jDH2oEpiC5pO
 fhqCZpLJm1dcxZeKUWrV3fo0Qv2HOZACnIwbqLLWJRsUmV/6GgknLvhUVZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsk6adct-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee168a520bso119060331cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053326; x=1764658126;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
 b=K5eCItV51dccy/f+Z0i0XHr4sA0o6ZhSkswgSTvVZaO9ZX1TPlxXLnhUt3vQWK4btV
 YvOmp7+PS+7YUpQvfSZUPliHtjs+mW2O8oXqsGkR9hq0rGe003nfAB1qyxEQX8X97fs2
 bNzKIUYo9DkTxPEKuwhnosx9l+jqMiyjT8v04mg7lPekLHPIkcTCdQ9xLwI2GS7UFrVl
 bVIYa+YFqy+OplK13wpkSPe3nfMoP5q2ygvtvKPpX5DYiJjcsKAhGOkfjwl44ZP2IQIV
 aOkCSv6Bv6tArd36KU4wZYxuP4p6L3kYkmyrhJPcLmlp50NY3z1Qhe8FnuCRB+Md75sF
 fo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053326; x=1764658126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
 b=kUa32Q6e0xIg8qoFfdc4gVhDub5cl5BngWs7wIsVyd5SfuK6DdGZCwta9hMITBROW5
 P3RhXZxGqkJItjaft8toHutF1ZHW/Urz1Ln/e/+oKdIIJG99iwhumEk+Jsv4Xt3Ow2Y9
 XylncDB1wosM+jXymdMTMharODs110RdgszKmN0WN9WtJ6q8DDlPHHI+XAswA977+8fa
 TX8Z63G6DtZ1/aJi6SmYSsWYnRz6BK3h2dtj1jKWrvKv8yHJhaGwmLFlBpCEIB/aKwtW
 MCcURXqaFGYQOLy0+eAXKS8XPMIQSzpBCyxGx1JRyW2WzIHDCupjqSJ3LYUzuGqtfUlW
 yobw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxUFDNTgE++tjqikj2Yvvv8bLJyhPzN9lpagtj3KsoN4o1qEPGYZF57julQWfHaoGCiHuHQMkWrio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSIg9ScHp3QcaPuw9dlYd8FP0VVhHMHiKclAlwHf2w4WMtW5QO
 /6ydf2vSLRsGFBUhUoMVPA5r0cO03mUfrUjqN7SWNBxMHRhW435NtLFILDpPH5RBoQGbyEekNuG
 F4Q+NxHRCIangQkdSdGTlDpiwQkjcHMnvQwafNSNPK6WfJW94kISzc7UCykNVnr5UiGCOpUQ=
X-Gm-Gg: ASbGnct8n+kFGw8OU9KHZiXRiwQlTSknjxpjeJ9Cpxv45DqFHRxAKJLMboSDUyqm467
 nu8qT+FT47ktS7fr6g49dU+BtZG8x1DQi19gm1wbm5IjAuBuQlh8fVz946I9LlAlrz2E2o0Bg+D
 aHFYiUcxPd5HRXCMHsvlaOxRdhNIPoA/8WmTMn6KFaNLZ5U+yoY3JLKOrVtblPE5dpcFEztmgdr
 xrznMAQimN+jC+3K7JLVtZFkwaecZN58O2mgO5jFSki/X7d7kzEVsZKSu17s4dqSXnPMGWHTB8W
 JiSBTLPixJMzY0u+koWjVfUS1/p7uMRJ40Cofq+I4u2lDScDEMc65xk0jusEpVpqn6gG6zz+FHp
 sHxqfSoOm8ZepgISJ5kqrBN+GYob7q98oYlxG7ZaDGnSBS1o7tPsfh7TT3jta0YOokWu2O90=
X-Received: by 2002:a05:622a:303:b0:4ee:15af:b934 with SMTP id
 d75a77b69052e-4ee58b0644bmr207487251cf.79.1764053326283; 
 Mon, 24 Nov 2025 22:48:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH71783JNIvrMRVHdGNlmiZuEs7Iy0PRRr9PWxHrAh8mFu1oAwTLpeENpq76fFhnnNwxFIx6g==
X-Received: by 2002:a05:622a:303:b0:4ee:15af:b934 with SMTP id
 d75a77b69052e-4ee58b0644bmr207486891cf.79.1764053325783; 
 Mon, 24 Nov 2025 22:48:45 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:45 -0800 (PST)
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
Subject: [PATCH v2 02/10] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Tue, 25 Nov 2025 14:47:50 +0800
Message-Id: <20251125064758.7207-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8bGI70tO_h0uV5Bl6ToAkx-FA9jakr5-
X-Proofpoint-ORIG-GUID: 8bGI70tO_h0uV5Bl6ToAkx-FA9jakr5-
X-Authority-Analysis: v=2.4 cv=WL5yn3sR c=1 sm=1 tr=0 ts=6925514f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXxsZ08qQMNt9w
 aBKdVQ1Xd3e9S5+GoZI/Gynuv43OvivtKxWGC2sUb4Yy8VqRqGoEVhyPJG1zD5bl/sVxktsT7jJ
 ivLTVL0xf216w5CfKkSPDoTUzEoIwF64lGhAPmtSpaqtGkF7BaQNe5JaBheNfqFKv3U7yLS2Nvm
 qPbdarS5GXIAc/xkGLVY+Ai6duu9S0JbAcrzWP06oFqz4GgXsJW1HeltXyOhYMMVYHGieqHgUNX
 9Tsyamz/cNF6XECW+g4FQsI7NpmPyAduw8HpkHZq0w9rI4IdDCtyzH35G3tXw9YrMg8m1qLGVW9
 oUuA42SN1+oPLcvt8tHetpAjveBeWVB1x+3Vyze5Iv7iuPeZeIlQfMPruCusOLKmLTQ0R+se/s7
 VsEvcXsi4vmHChxr9w/lGtK4es3UmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
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

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

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

