Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D798FCD58D5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E8B10E59C;
	Mon, 22 Dec 2025 10:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi+/en7J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF6mAE+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982A10E334
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM83fAx3823070
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NRZ5PDF9RBE
 hUcKxfeiWyFu1TAhirkb+W51QleGLBP4=; b=Pi+/en7JmzqHEhtNNjN4BaO3fVI
 fe0veAIN+Mf3FEVvdd7rpOfCq/qVUbP3MdGY0b3Hyz3lqQ+ppELeEYScJ+N9Naem
 y8c035mmqrlzG0MO8q7aNze91Gdhl5USmnrENYJbtKMnGbzcXS7RvFJROYgIzLR5
 8+yKLZ/ddwBIaCjfaSTO7mkcCTqj1ol9UAozTCuJsGRsquJrTMjngJRHZ96udxwB
 zHk1GKiQk4xSBAi1EdPJtiwrugUI7V1sa7uFm//dFfkI0g5l8cyHmCpW19RI4JNr
 skhmE2l8ggVq4RLLJMCYQrXaBaYoWTwZm0FLU3rzz6/tmO4EBvTDdojdM/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcnvp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2194e266aso873195085a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399081; x=1767003881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=fF6mAE+EoqeWVVNJqkB49tsD9dXUSQxsEHPO0SpuMVXReClD34+8/G5yHER3kyPp7F
 N003SN4Q2jWJKuL77DbhuP6imKWxDcJP91gvgP47FHjg0H60tXCXoFnYF2+RYWl2TQ+B
 UvivwrI9rYu4nvnCQgmO23+GFQy+a0om8Vx5u0umY5PzNLEE7Bs1z8y4+yQMCojNxzLc
 fcUxpXtgAmGBl2f8oPfyZY/iiZlSNH/LauwjDgwABVvqtjBZA88iZggwun7MmBxXxqGm
 5QSqjminy2y47L38DyCXWKEPoeSSJS4irxWYJ1p+pH2kKvh7t4W2IZa4psSuemLJJoNT
 t9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399081; x=1767003881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=o4+jiLyRjYq+piJBjFWOt0P/8WvtXXuOhakFrfC4XRqwC4Cs3/tTAAPNoHNxB4lzUq
 oEDzScE1452dFC+Nm9iAxzH1DExuLxuCsO2Fk8EWKY51c7aGmCRE0UEAH8AxGvn4ZaD3
 KDOkRbz3Tp/kWnydhm8iyMNUChlgSMB8eMiXVo+6ziVYWtGsHzoNOFbSazH//8/0++dA
 nlnuwkl5R+M4RCsXimlodgQ4gghwVubNCJpCa0GBE8Ls5lGPNuKmvYWK1PcttkTaqz4Z
 MswT48wbRaZYGdX7VNeI+XHB+xQO5JFHr1W/Rine/GVsGfLcZoBcef0YE7p3sBqrw+kP
 enOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/NCCr/v63fLBvOomhZ+3urNybrf9Fn2vgz3uCeeT8aNe2pjDxp4lKg9+w/h/3zu7Lb3Rwlk+tbus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQHwPjgaYQTXbYpW3r7cuqe6/W93BxyR63w65n/oJ4L6L82DQw
 DTto726CnWQKqOPoueJWu7JtYVcPW+YYWvV8JbroM0PL4X4NZzEvcO3K1oT4TH7hhc3XAaKh654
 ZgvpGjyRAH2wpO7EYNYquDHrhit6phEOKoRH+cB8/qIzlShhTUUurL3UmE/EmzNDiQ0g4Wkk=
X-Gm-Gg: AY/fxX6+n5A+BBc7NeS9xvcM5GWZNAA2/n8SYMj5jCnB1wvcgKgJBxPPo10GePPL+P/
 PZIAyocNUawa2FfTsgjeGzHGN0fCwdBcVkKOPPQmrmoeoUDm/W3M1i18oXotXhlMH/aYPfiMg2x
 X1wTGCYOU4bwVM1ZdKZ7LuEGCDKOiCFrU9ntRPSoNhuqa+z4vFuF6vIkn1PNTXDxHubNNb6wgfe
 CmxjF9yjaPVBugfgJ1Eqe4J9DWcIwWbAZMSnmXJlmbaByrgTutvXC8nrInURbKfHPcWy4Y5oQGR
 Q+H/ZRDQjJ5pWuEFqIv6tS0ma1vVMgpVDykzlBMCqUBHq1cFRjrOLUUFhJR/d94uwb/ZEqUGf5f
 QvlTlkfX750WeQpN8ee1P1PJKSq9N14nwCUNvmML7INRuNEeIm81SHuVRI1MKqQdN7a0=
X-Received: by 2002:a05:622a:652:b0:4ed:b94c:774a with SMTP id
 d75a77b69052e-4f4abcd2a19mr170343821cf.5.1766399081249; 
 Mon, 22 Dec 2025 02:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElR4leQwKpUsE2f94dJm6zAV38uLrNz/vxGBS2C6iTgg7iedIsxM/lTMmm2L260FRmeEi26Q==
X-Received: by 2002:a05:622a:652:b0:4ed:b94c:774a with SMTP id
 d75a77b69052e-4f4abcd2a19mr170343561cf.5.1766399080783; 
 Mon, 22 Dec 2025 02:24:40 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:40 -0800 (PST)
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
Subject: [PATCH v4 03/11] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Mon, 22 Dec 2025 18:23:52 +0800
Message-Id: <20251222102400.1109-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xXvqIIUpqhIlGUeiIocdjrj4o0bbMEcO
X-Proofpoint-GUID: xXvqIIUpqhIlGUeiIocdjrj4o0bbMEcO
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491c6a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX+sf52AX8/Kbq
 xs59OoAkAjt9txtVSq19afAWgdomD9WKqWzpUa8vLDFNyGk2NrxoC9EHnH3vCKyZpO7Zxh0c957
 EJpa+/sC8PK8h9mqDdYjeevArZyBNdWJViLK5d1P826SvhVwRMFqEig14nYpNT4eYiOVu/cYATQ
 oCvm94+NSE3fQYExjIP/7kAL8uJ2Pf1nmJYEzRUy9kRTkGY04EtjKySW6RdNBJqBQZq8QDV34M7
 DGyLAHVgU06m2aoiU0mky2/bLNtHrtjBZjKRyFv/FMhkOTqMVOAZ5eBpmq3uUbxdjti8296e7Q6
 wzKQFViEpfugMe4KZrAQbE47FoVn6ywz0s6kCl43Xn97NfXfY2H/GNTBNy88LzNxbkZb4VoPOaH
 xL0DhOQyenFZvJkP3n9vevaoxQBqsqplRJjkOQX77KXsiKLp0FfOPigD0iBEzCuO8sdj73eHUVP
 6mUIz79CAL+tN3PUP6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

