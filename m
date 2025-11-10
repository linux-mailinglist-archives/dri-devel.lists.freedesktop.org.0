Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E7C4809A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005BD10E493;
	Mon, 10 Nov 2025 16:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkyHWAyJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzGBajiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD42510E492
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAG1mYu1808952
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=; b=BkyHWAyJEbEj1Kf7
 5qUO9kdpU6Q/9UbvpvsTyHJ39ZOeI2MRNpXnJaQUXsm5g9sVIg75ajCTwI3RChyC
 sYOfyBwNRjbFV+GiZo1TNoEuwP0pxYtPZk71L85dTL4NOoVD3eMf2kVsTkcsuoY/
 n+eZijX6DcMj+LmlINZaeDdMPdkFn3NocFqjGldaKuVSBKh5MgUsUU/UPnGS58Cj
 aSHqLKMdDner/Iu+JnY0wkKz6Q9Abb29pE2Sr5uXN0e6f0nQn+7q/M46YxpxBpBE
 0PXXJE86u8oR9CBACBe82+DgM3FM6YdDDx+MTRkL57pui6mYaevlv3g9v9gjctG0
 yLP97g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1jm4n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3438744f11bso2025758a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792836; x=1763397636;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=;
 b=NzGBajiBWRsKIz42q5IndhrcG1w1cSxR5JREUINF7vMSBuaciMpyhDAM0Xch54g/7i
 tIIEO6VBTct/bfttuZkUDMfUlI7YbEqgR1ZHZBR1Wb/2NXYaqluUNwJFPbxbf3rJofqO
 pwSFoSKS+1ylS4/ZkZhsGzZ5j2NNAgP97QToSwn/E7+cxVqBJwBjkLmSxg1nA654ybXp
 5keXS9BtWioAZX9C0ryZlNKB/4fPEAFn09KTgr2vyk0ddb0Ndhaei0D3DCNvkhGzRBCd
 4qrbKk1E7R07PXR+UTgwf6lIz1qm7C6QdVp+jYKO7Sp4IZ5UNnj14n/1KB9zEw+r3b78
 l6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792836; x=1763397636;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=;
 b=GFqmwh2af082YtCZ0vH+AHfYUqoIgXcvYDzno/u2/nGn3QFvfa5H0M7uVm+Y4vvC2q
 v2SziJ2Poa2oGxbQo6ZW7Y1gEH1ZVkXAnFJZ6vL81846UK5JqM4Vh9HIOKvtZHb+5w6l
 roXUVZyjomx0/b9FELFmcqbyloxnyIjCb7PMZjSsYYi/o8hVDQOoAoIjzBRFXv+Ps9eg
 s5+7IJulXtx8IGxisau0HSBP838QrDet+W0kqAVfHtjQD+pBZkEWquQfYMxoV4n0PywQ
 UIPNR8XBQaaFOLMOezF++IiKKNqeutD1W7zXqFYis7WRkZ72/GTRKJiEhDZrQKwf4xDq
 Kv3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAiy097JXZ19abuZrqmuqlwuukS/Zu3VL2GdR5qBIXjh3Nl/GkciFkLfk5UD2I6bnXaLReyKKvAOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdqevtuLazmLtDnRL6F++F0BAe3rN1RXWovmGXiBrgCbIDG8yE
 x45WaHManG43Nmam8Dk0402gNIO6NOZ8edxpUY8Zgs7SAbZt2XTADmd6ap23CIkqXfKIFrCxPQD
 izKURvj0G4H90WbX8w7owzMuLUgwm0/15VOlS2umHiI3DUDiufBKawO74XYA5ZhS7iN+QUzA=
X-Gm-Gg: ASbGncub949h/K7pLytL0jP2GBjFp6FvTmj/sM3UI4LnO4ypvcCPFvV1sGU9wK3xXDa
 sBNdVzJWgmfMd+ShY7egpCdc/JxziR5bMtyu5MBVqjmRQ/rfRcxT94N8O3dnznkZPsaZ/SkRef5
 PglmnvqZ22rIhQ1c4NoG+bhJOaRltTinf3dfp8XQ1T+XKlp2PX+PGYFRRJOlkFZjpKHnShW/IXC
 ZsGO4zsstMwkygJWB4K0j5UnIelh7hJqoA+aTD+ONZBq/uoqaXBks7WAiWBm5Q8ufFLsUvvbNjP
 u3FZnfYaoMB1g6CVR9WeZ+iXFfJRrz2T3lnHbpKGkdj0b4chXWRNWQgfPMcm5tLjwKRlEposMaw
 SJ7LW0dKqA6fBUBOGQ55dA48=
X-Received: by 2002:a17:90a:7786:b0:343:87b1:27a with SMTP id
 98e67ed59e1d1-34387b10381mr5172085a91.10.1762792835078; 
 Mon, 10 Nov 2025 08:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFnJwABxwEcbzLA4NNn8jcaHApPxbRaToXFtfQE+N3nOzqp3Zff9UTtgGElCKztEpfLbq5A==
X-Received: by 2002:a17:90a:7786:b0:343:87b1:27a with SMTP id
 98e67ed59e1d1-34387b10381mr5172042a91.10.1762792834452; 
 Mon, 10 Nov 2025 08:40:34 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:34 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:24 +0530
Subject: [PATCH v2 18/21] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-18-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=916;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G2l2DvQ06Sbowus5yA4dZFnVkOMl0ih94brxKuiwNUI=;
 b=i58PaWIJhvP983kaIcMBq4mEfOd2Dd/WK27M8EkgEPM8e2wRt8CP0MDcNjfuquTO36mYLtIal
 +hsVHf9IYi5DvmUiLKDu5icK9arFAWOyRczHm6SeqUfsEgpnR1BfIU8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXwkL0p0JDbc5f
 vgEwAzE/hqZlo8G3rRa5cKpkWLMHLkErYgisF92jLCXUT4ujubj0D5tcNp43Y5DFSybEeiSHzhO
 vaoNO8estOJIV/ViPLI4yVoECa37pHqzhe2pkVpnvtZb4U+R50AR5B2cFUjYEJ92XPBbuJCJOV0
 pCBI/MNOUhdHTkdjofX54XnsKfSFrBzxbrB4xBZ8FLwGmdeDic2zFO3DU+s3vXsLgXMTQu6PsoP
 XGmzNsEBusBR8Mv3AlE/6ugEbDPX4ZJqGrZGqmuCGeRCpJ+7Iw4QMTVYhOQKLJ9N9zwkNGU2awZ
 RNVQW+etGD/qKiayo/ND5G3Kwbbp5IlskFwVBSdICGog235QxWwuOpAOLXnaHvdIxQKekRfhUUC
 Cel+9JuIgt0/Z2HPtEBZji8Vaq1Rag==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=69121584 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mFHhPm7ftKKhVARBLukA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ldT4mSkrsU-eLD0xm_YKEdQLIR6shw-l
X-Proofpoint-GUID: ldT4mSkrsU-eLD0xm_YKEdQLIR6shw-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Update the devicetree bindings to support the gpu smmu present in
the Kaanapali chipset.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..14a9624e3819 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0

