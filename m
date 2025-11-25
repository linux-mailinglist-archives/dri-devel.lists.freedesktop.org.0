Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B2C83881
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07610E34C;
	Tue, 25 Nov 2025 06:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot6/TizF";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDsscwJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBFC10E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2hLrv1848838
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uka3uTpmYpZ
 zlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=; b=ot6/TizFawuhqCorhRmo/gQyZj6
 VFo7AI9lo/yMIhbdPyB/S+xbkrQrg1giT+G6mEEZCLmmjT4hgvpkoF+qyovlhFAa
 IH518rDNSYr41qi8eJpzaYz0JfCjQEsDO2RoYoKVR3NEvBk72OHMqsP5Wgk06ibr
 A7D91rDIGnLI30PSXji2rBcGo4eB5b5ql3NXiNd4TlWl9DkM24QrEG0HC9ldISAn
 NVEZvp6VZV+dVbZA8Yq3Mao26lE3miXPeNLg1ICjoamPGk2ArZwED65uAzKAk5Uu
 BDqwwbE9DV46QfECcH4pyzHquzUbnLlOg96Yj9i2gN1kLLqlL5G99/1TQ1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qa1qb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b19a112b75so1318794785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053316; x=1764658116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uka3uTpmYpZzlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=;
 b=cDsscwJssRbmV+sTyOs5Zm0Ixyok4sXV6JFzJMfK/n8PuG2d68tB0YZk9VihOTVgK9
 Dx9tWaua7u8lBHl+Tg7kGmLTsDWRDIrUBAL7wCPVPbeWx00XIYCqbY0nlWOHKnYbGD1B
 +b4okwpu1Y85h30vURsFzOWdVIPXsnjCiwn2mHWyZBe61ZRKUvkoUBClgHIQ+/mzZe/Q
 yjr24fWCXuBb1ifUWyhX8U0wZWE6kb2xHUaH6kJgvCzPp0yripadNN811xGwKAxByiBK
 ut4SHAP95v2bgMePBQBidduxDPv+0fXoARB2eqqdz5RLSF0vYHKVP5Fn2nHw0BMVqeuK
 sn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053316; x=1764658116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uka3uTpmYpZzlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=;
 b=UQFLUh1n10ONn52PufgRT0wdcL7Bx1VWAi+XOjYZM01JWSO8zLqy38I7NQGeO6i651
 f3Rrh8Z7Ih53f+3O4CiTMxgIFxkYNa+0Pv/uNS9iXEb00zIc9/Mnmn/byCnNW1mA16xl
 S2hKykAFOUtsRXGwRIp3wnO4B+jxFkJe72SIpk6ySMoKdUl6cSYAZ5z1BMRJcA9w7hNc
 JAFWwKuxpWyIQ972WKmaMmbq2VwjqqVjhR5mfVXvlBADM6zhlYNQkiTRl0yC7YbpPknd
 W8qBiZRsz3uiHY6oPAVW+zjT197wdG9MGfe1jv3tudiKWY5utbGN0YG2+VQlKbxBINxX
 U69w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSKPzNoTpB97c9X898rqg3MC7YNFeESEpxiIKhFGrwxQcifPt8UrshYJveodPB9ZOacUZ+7bl9jxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmhcIZIi/1UV4bWPkfSedAOhJltlAs5EHFnymEUR8mN9UeiI9r
 K4ICC4iqMf8lDpKIdZZCVq5tZ8EF2UstrhyDx7Hffpkk18R/eknpOU1EFHV7710AiM+pNhw8Pgv
 Z/lUmrhUhZkSkPRr4RFxWF8JJ3ubk+jieVNl2U9hr+j0cYzSdrrXzqg6rdX+B2XAIOSH8A8g=
X-Gm-Gg: ASbGncssrOupAFeCWGZwwmMWOEzeGAUQwnfOC3fTHDQJv876taB3FHbazu0PvsZcRo5
 DFXJCSkTxwXjmanOe8pzeP6Z9WfSqfMwGgJMxuSYFPBKEFCnhKSlOl7zgwgHZ5jtYsLOnGOkv2a
 zWykwlf2FJsnp0qaYojExbIR84GQZvq1rw0hgZcNcu6Qktu7F6Y44xMuxM3NibHWLCTu2yWkl2n
 LZQ6qr9fB1Gi9Ll2WtUlMYfF8AY6kGTF24Rln+VTq/wza5K3sqogj0KEL/hUE0lT2uwylXOhBAC
 XP7UhhgF12gIe9wx9ERuwBGHUP2R+ap/f04OJRLlOKGmV0O6Bxq/FXvj9vy4n7kw9OTgHY8aLn4
 G4hBUiUj+XV4UpZQTLd/VokHiWRD3Urr1zD0tYzhvJyez82S1avSunno6NtH1fnrYuUfeiWw=
X-Received: by 2002:a05:622a:286:b0:4ed:62f2:8f03 with SMTP id
 d75a77b69052e-4ee5891e11amr213003691cf.81.1764053316362; 
 Mon, 24 Nov 2025 22:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Jw2MQLBvzFRC89v824DN/Tc0cUmEGvEmhJxMuJaT6Mxnhfg0N3B9zzancdtKnis4GzykTA==
X-Received: by 2002:a05:622a:286:b0:4ed:62f2:8f03 with SMTP id
 d75a77b69052e-4ee5891e11amr213003551cf.81.1764053315898; 
 Mon, 24 Nov 2025 22:48:35 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:35 -0800 (PST)
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
Subject: [PATCH v2 01/10] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Tue, 25 Nov 2025 14:47:49 +0800
Message-Id: <20251125064758.7207-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: slwLxNYBDJ30qi5ue9HSZ_G70B-cSw1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX6R5fan1H6TPz
 E3V6BQMnrHb/unAe/Jx55uLR5m0kOFdKAqXRNQ73lcnz4u4ZtNP346HTV2a0M7Q+sTUqXot7Fl4
 73iOCIDGXMFjHXmPGBDC1nn8ibSyGlXKcYjbdXwvfwKMnuVk3itjvJG6QVc3QZ0vFAPq7mrtPR8
 LyBJFviIP/qyJt+dI7EIW0UacJihUD7s7Oauzkc3sDubtRWvyX53Wo2WoQDa3sqBHxFBlZ6xycM
 cZzSof2olYocilZfPZvYPSjIBCAuQlsSiStP1ZRw0HTk0gsmigXqEj7jM1iMMW+IpKPGHOzAUBS
 HE7h1ForYDeruFwATflQOyu+RuWUQOE/XFK7ZTApQlfeZs+7IjLaYMEZsFh77GgT35mysDgvdNP
 u0kihnZDmF3Pi06C9CGnBU436GEqhw==
X-Proofpoint-GUID: slwLxNYBDJ30qi5ue9HSZ_G70B-cSw1S
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=69255145 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

