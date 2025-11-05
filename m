Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB88C36C77
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A228110E2E5;
	Wed,  5 Nov 2025 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/tK9eKu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDQVMxlm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD7110E2E5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A57xCsE3164792
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=; b=B/tK9eKudBTYKxsy
 GSJZazGbThxCm0WBUyndiev8r4z8jhWTP6pW/IYl9tjJfGSmqnqnrC4k47IXzLXl
 +qDshDQgToQnMCynZBISGfRPxSD2uk6HT3k74Sg7afo3L3xNpnh6QWoKyywu6bXS
 5eOXUnMRsIaGHJvoiYeWCsioEgID57sVhjJa4vBj2FJiNmYb4CSyW4wsymx/EFxy
 5GqdKKpGEH6N8XfqqlN1LRcP1TF0lWgXH0IVu3CtezCclvXytndKe0Q5O6DimzBx
 NaOGNCDGD00BUWdOoSFX/z4tVcp5K5u7jL7dhHNbv6rpsdanuHKkGc4mpjOroNWN
 ok3T8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ketm99p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-340c0604e3dso71378a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361202; x=1762966002;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=;
 b=IDQVMxlmb2s7zx9Ls1XFQY+OpGFDzjk6GaTPWOYQ9trHtwhlIy+TbYbRyr5xdERMhK
 ov+AMU3H+s75o726zv36VbH2b2aHTVyxG/2Gfa5njFhoRi3gfmugjos92sfmg+lcrvM+
 3ytqUyqKelbAr+wmIIqPI649dtAXPXZPFor4zA3mwwoGuKNGC2Lag3wSambyakoSvXgY
 TrKhO756gMJJ92EjycjReZC/xnnZJQtXav0IrE5XKcciHAKeBXYgUBafIzGiNPxWfFq3
 UdCiXW0DbgHxS70JRxBAvcOaDJOSLvraiphfMbMaLrXkQ6IcHzy17d52oE8+ykS86Qo6
 r4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361202; x=1762966002;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=;
 b=osR0pY9/3YnFRdDm+DESdc3CRbqF3wLGvvtNAVLDe6P/OvTdd/iSnFBzXio4OHjUIK
 4LZF2ZQDLVSDfLFrVa9SWMJMjGpwvwYXbCqJJe60P0fpt60tnKv8Co7sZwY40OFRpB+J
 LC6+bWNOGQ9wOBFEw2wiou3WHfJcCFZkArv/2bI5eAgiew3BPHhibFjmmV77GE4gLkAa
 +PpRZc37+Bsy2bnixlUfRqJIRGgfMUAJzK9V40PjiBWmGvaTPREjez27E0MDZhoaKM+v
 KuZColDWwOljn65UzlFuSFDuULyl1bV9Ui7W/CcAawfa/Iv6YYBcgUKF0zg/EtDew3q7
 kmuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9AOPSBmn0WTZkceKVzdy91yzi5Ry6dkdw2+ZWoZswXO3ia1ZJh1xLBqezvYjnbDdp2q9NmyYvtj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGWKoLSlLzONs/XsleYeUAkU4YZN79ePpuQC2Ki62ULpTnn0Dq
 LHtr4T0UM6DmuwcpGuQsJFOk3F2coc++Vzp1oL9TRzaWbFCc11jk1tfpPSDc/DxH4tlH9QN33c4
 OGhPZos7Ir0O1tTQx5ngm/99k9vp8VCRSj+gYIh9+Xo9yrWh9LcInoUhiClAk3xBp/Q+GINs=
X-Gm-Gg: ASbGncuQRMIGqYXFKRE2nkO8BMFuRS4b+XLnjczSkdfeopXOD5O0kCSDuKlAUHpiuD/
 O9Wd7U0QwHK+SIkK/KAIC57tpJ+PCbc4NWe7lLMXSnTmHQYzDGVAxFQmSf0zaRkUgCDPWF9n6Oz
 jBHDCDafiYoI1ybStfHimrCa6FBYco/jVlWpJznoc3pr0IUuJa0WdFtrnf7xuie+visyyBeXL1/
 U8i80U5bBXBJyi+DtpkmjJg3SyObmUN5MX+gYCLmnnobxQmKYFC/+IpTml0MC25LOku1zcLPYZi
 bHmlM/E0115xl0oJifJlHwi0iBBH9IPDWA3PI5cw+95iECZB6zv/I+vZimkS239OcDtxuc/xgmh
 zj0hi2seG0mqvunjKXGDeMCI=
X-Received: by 2002:a17:90b:4c4e:b0:340:d1b5:bfda with SMTP id
 98e67ed59e1d1-341a6c1e216mr4653704a91.3.1762361201675; 
 Wed, 05 Nov 2025 08:46:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPMHWdFNyWZRvVuGCjzCiFHWvN7Lxhr/hcgMjghCYGwwHQXJqqOAm/zVy06oneEFZN1o9qQA==
X-Received: by 2002:a17:90b:4c4e:b0:340:d1b5:bfda with SMTP id
 98e67ed59e1d1-341a6c1e216mr4653661a91.3.1762361201169; 
 Wed, 05 Nov 2025 08:46:41 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:40 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:49 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-5-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ya263B/ZSqT4MVjFdASA/QB9AUBc/m4QKS8TyGIHwqI=;
 b=llOeky1gtFuawhG9bs+RtN9AJEm5cGH54p+7rKBb4K2jSRLfFXnSsDFNa7H/0GucTQiOl1U8O
 TqCKRb3pmwlBVep2hTZjSzoGPxup8rkI0zoDUg+2wlrR6CpvDwnbTIg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMCBTYWx0ZWRfX1LYxZmoGRWzA
 vADFrZru9ifDcuBlqEb7zmYNvigUe22C+QcldA//0nEPv4cm/ukD0RvcmKANG30oRn5ZBGLGmcI
 OyA0+M8x8QyH0TBYtQNsdMRO2xzbOP0hu1YRewqyX8RVE9X3/o/+uKqbce5p4HQgQHCLv/B5yxQ
 fyCTGarh8BEXTPO6JLmdoGbyLIjonWJ/6220L2tZbMeT6wfykkljnQZeoVvXI7/gr/+XyXSLTqs
 BNel8SU8N9Dhw1optd9afBNV3QtX6admkkqNhbSXt9MdK0mCyCXE9QAEkwaIf2Gc2a70W3eYVok
 iSLmfxxrsVnGakHltrwagsgzX44TFFDzIvsBAo8v7uUDTlP70SeR/eUHLLWtajbwgWIJZT8SUzY
 UjZKclpD+1pQy2jf0LZuwh/JCo83Hw==
X-Proofpoint-GUID: I2J5iUGLBwTucaYSCVaTW-piz5sShiDR
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690b7f73 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: I2J5iUGLBwTucaYSCVaTW-piz5sShiDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050130
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

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..8fb7d1fc6d563288288d24eb5d8288e7748f2c16 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0

