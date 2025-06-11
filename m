Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78B0AD537F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D5910E620;
	Wed, 11 Jun 2025 11:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q28xpXfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2217E10E626
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DCXM027360
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kptoO2Aza1llV+rVNxYt5GCzthVJqYhfomZaXMsN2c8=; b=Q28xpXfRIXoriJML
 Pq8K026dk+buY4vrjTM7ND/qPGRZkUVeQUMmmN8KUd7+V1NWxuBzgALPEDv+Qj0c
 mHDvxjax79lLC7M4JMXkpMJT5+GkCT1DA0JNV5wHbhwbVfP4km5SCnr9JDYjLC2A
 vAXtuVnUczmrWgP5k6P04mpxaR9TeCpTMxfaDdbDA2gnCtJ2p1Vq3Wae2QKJwEOt
 XSva5CT4tHh7X6CWxENiqepWGq3qDbpDw8yVYroLxeyoS3LefwlbbMVcMbGRGdDQ
 90nYCx2olBY4aOrQuyv9q4+Lw7E60wmPgYCEUQ3E6PGo0dDtKOBBadp4cR0iJTRh
 tKd7DQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhbpus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so702964b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 04:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640569; x=1750245369;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kptoO2Aza1llV+rVNxYt5GCzthVJqYhfomZaXMsN2c8=;
 b=mhDk+w0JgZwYrPd9zTB/eych9tXe1NTagmebzGFuKiiw8/FIvxxfV3uKFB2UgHuMKa
 XN9Konj9MF59I5gyZx//8pDDxhXpzs+Bo14GGWgN1oZEbyxjWK+nNBgxRGQAyjcBZwmR
 fovSraG5Uy6GsE4ihRqYT6w57/0i/YOVNjWZmWKAZqLLnWzMzHkIrELpOhjK/HvQkzP+
 5pzeFo9zW+m9psxasvx1g3YiyvZKMKY5ZXfQqng5Hmo4LnrXPQVrRTHD2SrpqtYDoqZ9
 0R3lPKC1RT60QpD7s+5mCWLyGkfzhiPeC8jAWwHEKNbRrS79GqrekEamZPxIKNgWgadR
 Q+TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6b0McdPeofT2Xxq/9NrhB9BoHqzghTzONvpz63IIYN+KuKcYR5aDn6Pors+KhLQxDVYyPWrQ8zAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNuXPM3sznzh3zaVSfXOyJ6qk8H63pV8+msRDEfQ6Xrf65idkN
 JJO9dNW0pJxh67oYNFh9hX9Igra/5whgYwh7jw+GM/oyj85GcyBOFo7QLJuIAlLVGqUmrpyAlaN
 loVGdtsbewTWZ/xuFs0WEj0fOZhEq0WhL903h+FkgY4P0SQyFtEDYbhLi6lUBWw0rHrNDP8Y=
X-Gm-Gg: ASbGncupIORogixb+TtJEFRI3MjXMMXizCl0bc0/NqWCKdhn6uLfSftsPImjBsonpp2
 bWrcB53MsHnPglUSj3yGWS1aL8yjduW8AEzWc415qyw4Vb1BBLPbn3XJYdCr273xKLLnCdIUSHj
 BF731anixpZb5jG32lL0fLOmVGZnXCADmxxO6lEfylwhqLkYRnUxT/DnRMmeB0lvAJuDCfSghJS
 lSS7sUm9H6z4+8PLO0iLwMnawu139WZnmN9nYHUidpc/0Bu2s6XYwXgiGXCrJcRvQtpDr/UWbH0
 29yiZv7ckUB9gj2P1duxJK9BIvn3jEh0
X-Received: by 2002:a05:6a00:4642:b0:73b:ac3d:9d6b with SMTP id
 d2e1a72fcca58-7486d2bfd99mr4480438b3a.4.1749640568940; 
 Wed, 11 Jun 2025 04:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQv2oR9AKeWi6BvBwm3nl0UvCjpE79XpYL9hXCh5jA1F6NZ0xrqYz3otpm2s5qxPpHx5fcxA==
X-Received: by 2002:a05:6a00:4642:b0:73b:ac3d:9d6b with SMTP id
 d2e1a72fcca58-7486d2bfd99mr4480395b3a.4.1749640568511; 
 Wed, 11 Jun 2025 04:16:08 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:16:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:32 +0530
Subject: [PATCH v2 2/4] arm64: defconfig: Enable X1P42100_GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-2-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=821;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nMF9K7Auph9cWiGh0kXvvupbMizZQhoAr4irrlKWwzA=;
 b=agOSO7dfGn8dIa7XVbLlt4oDG1hgwGxcPdJ+VerIynmrzAOr5Zglz547UxQuM47URqq26uh55
 1s+Uje4N5aqC8m4jFOukj8M61J+FVNVu7dbTpIXOsh6xEwxxDjWEE5g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6849657a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-EtVc9J5eg0rhuNXUfoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: b9DAv5oLfKqhzOvYSvVwCg5JcqKAQMrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfXxtMc6GwD9cSl
 2wYvH9udej6IXT7HiJ+w19yBQZMYecTiCtX0LBIQLSefbarrRH4e9ksKSFqgm8TRu8Uafvlcis6
 gyQXZ6YYdux9x1M5O0COJ9/SGM/L6atrv+Qay65thZbq8hxiiBnKajxn+NI/FYeYNbKmuWCzZLL
 WAjNWRZW6+PYKlaIww6UdLyPOPM/y49riF6trDUP44bEMXzpo5qZSUlg0XIiIJFbQ7IVLvlXYAM
 VtJl0WlZBGT2ygCkudJOzpmRDmffmrTT6wseGS6dOlFZ8rnBtQnIahzFdEJX3LtmGgF7M4lh30l
 NZHSM/7wNXGeZs30R9wPr+ij7jvWt4wWj9zwZVeLycUB/8l4W0IkY+mI9a0/u+RRhJzuYEmg7ZY
 YTzwgErcS/5Gu5Dy4kdHrWxAdzAz85nn61Mdm5zUa5NctmmSMUuy8+dK2LXTCRTUbUrj0Dr9
X-Proofpoint-GUID: b9DAv5oLfKqhzOvYSvVwCg5JcqKAQMrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=723
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110096
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

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version found on Asus Zenbook A14 and other
similar laptops), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1

