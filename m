Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B6EC7AC60
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3F810E8E1;
	Fri, 21 Nov 2025 16:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXXDDJ3k";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnMbieVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680AE10E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALC60hR2759593
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=; b=UXXDDJ3ko3ob0puT
 +Jil2HT6VickYGkFpBQ3gs9MGhKNU6vDQIg+5koKpnP19JyjLY9uzULkSsYyR9zx
 czLajeBswWBTc60MvibKWzcl5vr7s+fPome07Iq9a/kGwTehA71+8g1wQsX8eBYo
 1Wq0EXqW/lgX+09QOyC1N27Xrriwo05SWIwCZxLp9qnTZLTPG7jAzbegLHHbXumX
 eCknGuMvdrh+UKjiQA0ZA4MYDRauXZxlC8uWG/TZoNiBBvX4xyCZ+NP4YRn/LgbC
 iG0WExA4tRXCIuQp3Hkk3b5G8495zv/CBCjeWj6AbvNZl2skHa5IXmGgWAhGs3Iv
 lAHb3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy623nc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-882376d91beso63100196d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741641; x=1764346441;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=;
 b=VnMbieVE6JMIKtdLTu1+Cv6x2F4LROtM650qH0bWsmEfwcTG3BWeogCE1WfBfX0oLE
 g096HFREVw/V/Eo6fCCbPeTntvTBh+l7Wb4dgnmmcAIRz+TUp1U7EWN74w/48zrThpUF
 kiKYoONQ62IdP+H+oGOoF9zq2z1p9QSpEqaqUXc91/EXoFbRQDBtui6zOJWFc9bw+2l7
 l15wYJkhX4X0yrVUDLa+IdnMBHmjE4zgJVhVTHe8N5X6Vf5s/+p7M4B81gD3997+YWZV
 rGLSLTPx7GuksmsdP+EzNbugH9uOVIPNPDA5vf/4CQshu/aoW4588Eqwu/C2FaTti3KN
 x2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741641; x=1764346441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=;
 b=WiS0bbgCfdGPNYxr/uhrpTS6BAf5JVmayWcDQOHnNQ4yjA2tG6WQYx1kuZ/ejpjPkB
 G6Duy4W8QqjuCXQFqo1QuHedU6pehGn1kULwnWXhQwh1wPw9KIQHYAe/me5bDKb/s8M8
 sEgMMQq3LSgvlGrtXGQdwEGIKvbcxc5b+0ABTUwAV1cNcEpPkQ6hZhcCPSqiOSDEbdDF
 3zPrpbh8Fbah/D1+X1ogA0xLhyh+/0OBTLqi/gR1Mc80t7+dqcgllg9YuTJNVzZsYOjC
 En0i9JKfCiisnFNJDHvq17tEcyO3exV/xM/K6819/nAhfckXrOAYiaVExbITeMa9G2Lc
 LxPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEsf5Ly1Hqv30P5ztZlNTZUwEi0Rj0eDPmVQceRQZ6HVNwUx1vw76WGWSvT0vCsLZBz7qfAjYnWb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4FGYxWoaxSIlpSQGLli98HEicWKjTkwr6R5OSxmn2yqPxQLBM
 Esfr3/f0cYHUZ8xuhd2OyM+PkT2XZmrboCaGnxW1uzB1l6EckGh8c+FsDgCw2AzznAI7dq9FEMd
 kvxhl7uyjFc2Dz+Kn5ahMpsYRvUFNcKLJq7AfQHcTL87DA2K//JyPXjaS9euB1dXUJnxNJKY=
X-Gm-Gg: ASbGncsZ8RFWviijlgKaCiVvhyNOi0ym0u3EVl2d+OkkAafjao/OjuJzX8PD3luPK0u
 sXlqbLSZvScTl1tCm7D1CdsoGmZA6mWPrb+pZRk4/UvCAimOWK5pIQjQgpR6FtRL5R67L23A7uk
 632ce6e4UtajomKYkcZ98uDqsnqgebpHrD/0M1OXqTvJ5LNugzKfljkqhy0fC3bXiSMOeDoSsLp
 K1WDGRf7MBE4tBW2qQrUQIdw9XweAit8HVK0WvQWnFuNPZkG29m+NF5Boc1gwMXK66O7vopIBfl
 8HAQDw0W3eNw1MgKKIB+7qyiDsIRRRkxNJlEUpkOvgMkn4d6SRRv92DA8N+Oz8Bcg9ULt4V0iZq
 L4QT0eXES+kRNxlygphb7Yq4epI1UJ6nRCysj8Iz1f2iab2RSG4AOcqsAt9cZtuXJMWp6n/iHl8
 lPkz4yU8MQBJ8qWyv4uHHi+xM=
X-Received: by 2002:a05:622a:1b88:b0:4eb:a24d:8c17 with SMTP id
 d75a77b69052e-4ee58857093mr42765621cf.31.1763741640725; 
 Fri, 21 Nov 2025 08:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAIs2qyphslDLXjyugoIM1u3+WnSU6pjdnjBnlzJcuugOQIwBcaGVpTnyDZE8HITlUANo9ZQ==
X-Received: by 2002:a05:622a:1b88:b0:4eb:a24d:8c17 with SMTP id
 d75a77b69052e-4ee58857093mr42764931cf.31.1763741640196; 
 Fri, 21 Nov 2025 08:14:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:13:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:13:03 +0200
Subject: [PATCH 1/2] drm/msm/a2xx: fix pixel shader start on A225
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wor0QQBjW7uFHNAj5exz5jDPpLBCWgszpFcIUarhCGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/DDhToi3FIm5e9ggO1WO2Eeev6bAFVK9fD/
 vvDzsbiVhCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPwwAKCRCLPIo+Aiko
 1fIyB/46mSe2/PTw12rhQ0CKyh7vD1D2EZAJbZBsQry1nQPNa7OaMm+VuzTZZaweeq1mSbyoVES
 F0B1HjpLvOOLhyh6HrhyVVQVburZFkT4TkoDstG7xydvnW+AjuUu6VAanFzxfaQLR1If/BmEGvk
 MH9Ea/9ZCbgdYupVpbu1QRMQfQNDLCm/Gt7oWe1LnmgV0YFgC13w8M38x3VmR2vpvtyaIhfdoB0
 r/4rr/tSepRlBFIvz50zGGVyjKA7qMMtrY7epkmaXCu6SnW1r0RA+lJrxdndEcxUmCP6kViAYyz
 sx/IDKC5n1BNPCFNeDJCdGKZH3XpsY0N97sFhU+9Q6dSZLrC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=69208fc9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QU57kMg87Go_-yqhfaEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: rHLwRPlwralO_V4fPM3aZA-dmZEJ8LrS
X-Proofpoint-GUID: rHLwRPlwralO_V4fPM3aZA-dmZEJ8LrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfXykYgHWDJga69
 SuC8aNKhUYAbpcnKzhQNMbNbjCRm7c0/OqVZwd/eX4H4cRcNMhLXsWEx0LvEihUUIBGxgA8enuI
 5tzgfDkBWuQ5RUgHaYPCz8a8SFu4jn5yNOuOs8RNZgTv76yxyRtMXKV7nIXrWk86iinCxkNMgUi
 cGWpg1glht2xVPSubpwya0AW1e4QtxZxZY+2+ejb4ZyKuabFsbLdQ6TiF8GyXSt1L+SpsBoAURN
 zGzFqPYw4S0oA7wLIV2fpQGFxh6i1naXNc2Dn7WB9gY2zFy4IHq80v7avd5iP82yMOo4ReItDuX
 S38OlvNYcAO4L5z/wThfm3tWvvLbMU877Tqy+pwUHTM+w8D45tcraELoVNWiBJGRHDzXdy5D+z5
 Fd+T5u+YkSy+870TPGCz/EUUrmKyhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

A225 has a different PixelShader start address, write correct address
while initializing GPU.

Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..cdc24b3b7b81cce6b01aa14a74bd8e512cd8be90 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -77,7 +77,10 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 
 	/* Vertex and Pixel Shader Start Addresses in instructions
 	 * (3 DWORDS per instruction) */
-	OUT_RING(ring, 0x80000180);
+	if (adreno_is_a225(adreno_gpu))
+		OUT_RING(ring, 0x80000300);
+	else
+		OUT_RING(ring, 0x80000180);
 	/* Maximum Contexts */
 	OUT_RING(ring, 0x00000001);
 	/* Write Confirm Interval and The CP will wait the

-- 
2.47.3

