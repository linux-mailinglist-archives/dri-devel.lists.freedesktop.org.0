Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF85C33204
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9110E675;
	Tue,  4 Nov 2025 22:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMqgrX31";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipX2FK0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6F310E675
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:02:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4Kfej32927459
 for <dri-devel@lists.freedesktop.org>; Tue, 4 Nov 2025 22:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3
 SVmsTbes=; b=VMqgrX31AcZ6G8tskHhtcPsAKSqJb1QDPVri5FJT2oZ3JJZ1uGU
 romt4jBtJVRYRcXUU6hg/t4Wb7VVd2m2gXkP/GiYFJNzF8kM2Z3f2Cgn6xJgd16q
 PBwMUhJnvr91WMjQ1frIYeuq3D+qvxa+PzKbKiOqFSzxDrqzbFy0wB1SmZBPriPW
 +6nIIQTErlFKzjiFvwSeKFTC/+nu66nqh1M1aNHGygavkn0eeImd3WQeY4XoAbi4
 oGyQtxW72vAnuLjDRf2R5ciLXIFYYPIpfH0W4SJ/d8Jk9TDMH0JpS9yyzgzAB8NQ
 QAOJEyZm8j64Ywq5+Ck00vkTtbpPrBDr6Gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5s3kd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 22:02:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-290ab8f5af6so59978045ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762293776; x=1762898576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3SVmsTbes=;
 b=ipX2FK0xAtBAUKX417qRmT6q/16AOPBrOxixoceoe9/g48eOp43pyl94Ik5RVzoIo/
 C3ew+4rI2JD1rJxioOC3g14GBFs7ehxmQCbkHcDtWOtT5vjOFVK6Rj+XHDyNcz34WuvP
 QdUL6t/QeFE4hhXJ8VLyKhdN3kTbuVItW4VQBn3Qib4Pcb0X1Dqmb7l5kEhqJsB//7KM
 BDC3rbEgl1vdvs2cTh83/r0UYd+146zNhiQE+5CXk+cHHA/gsWwRxcO1kFADKxWuvVI5
 MaM6nkjZviKnOICQ8ECCKQz7JU+OluDXE7atBOnBZ0Di0tRy6gg/t16LApwedsnoMHaq
 FiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762293776; x=1762898576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3SVmsTbes=;
 b=FTkAYa4OEqpUnZ0EMhbLXhVTVj2ng0Tc145R0M33fin7A31E6ix569ZVGQY6Ytxoel
 g6toCQx71X+/FaG2xuaZtGDsyDX1er8+uTO/fLpm7Rz4FDIXNdWL7IxyQYnf7qYy81Sq
 AL8WMIh4rNx1jn3OefBduxpYJi03Aow5YN63i/3sSW0+xJ3ewq/YR+Gt4fjvjDTXbfg5
 96oVLz2dUQ0IkvjuyAocWBzURTQFkL2NMWVgypAE1F/Opdg0JJapK2wOI/K02Wy2fE9m
 2aVyxqj3LZUbI0YgToiedLVcykGv9rxR7oDu5NNkM2RFZAS/hJJiYaUtFHZVpq/nBs91
 rlcQ==
X-Gm-Message-State: AOJu0YwvpJ0ZwJmhvmmP7RLYu5L7CRFIXX63B34ya0x+0KPOhlN4Trdt
 EE9gKID1aL0KtcpBdQCIdq/zEclEUZR6uXa+TwYH7egfoZlAxYDgw8gjvSkAa795zGQwSIyjICh
 zwpj35dT2xU2UWeA34B7N3hdjVo2H0Wj788vcFhsm/u0/OeV0gJozT68X1KPdGnwV7VZQT74JrA
 GTLFs=
X-Gm-Gg: ASbGncuas1YCgycSakpS4rVjbM6w9sO7LNR/L9MRLhvGtoO2XQfPXOi6GGy2xaeqWUJ
 V6wF3snj95yH0vHLfRqShrdTQMgSQSBIMqPL1zjoaGD99Z2C+ToQgwpxetUDKAgJYk5wpssu8nO
 j1bEwY0G2idTs1RpICGynnhfrU4gYpglsTAd/NTHjMEZvKENyBiQoiqZwrmpu6/wVaauHDB26Rm
 mPeDcNuLrfaKRtX0dtRDoqHavv1MCtm4IgrxDkL3IL87MMUm33MJX9Qa8Yrf+wiEfjIF6tTUn7X
 9z/KE2m7neDmS/jfa8s2zNQLUAcYMwfQ73tcOaEfKt9T8EF1X4YXfePkYZp7siFbAuBQsWSRk7y
 socqYZI8hLg==
X-Received: by 2002:a17:902:fc48:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-2962ad13fd2mr16326315ad.13.1762293776312; 
 Tue, 04 Nov 2025 14:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFavk35ju6KTwN78IzRXYY+q07xxAOOCvfNpXlRntG/9emf8L8fCqQYtFVa2gtfvOtl9wk9DQ==
X-Received: by 2002:a17:902:fc48:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-2962ad13fd2mr16326005ad.13.1762293775845; 
 Tue, 04 Nov 2025 14:02:55 -0800 (PST)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba1f2a80459sm3394989a12.15.2025.11.04.14.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 14:02:55 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
Date: Tue,  4 Nov 2025 14:02:45 -0800
Message-ID: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ARYkLnjhzoyg69eGbrDRlOXI91JdOo-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE4NSBTYWx0ZWRfX3pGtTQbVBhn/
 cP3Oml27fq3hcUezUb9Ujh9VF7MZRLVW1rBHZT2wT63fP0br5Cin/JcBos5ALzPXWAQqGZs5FJS
 T1md/neAnBnNmTp4/CwCRVUH/sM7nv4DmBhcp6oAbDjESbv67th9W5m69qtcVvTS04SB9UXKkvz
 6NsuXpVK0DBdk2SC//UVM8dBB7ALFhsjDBbNa0M9ffM85xCBAXhUhSQfJ6gVj17/Dovj0tA/UnO
 AMqxUlTOWVHruB8dIn8nu5/vxLh2dAXyxpWA35oDu8SClIMa7hlS82Z0yBPVJvYGIW9I9pBVQAq
 GxTSNnel2DjbjR6fYO3xoA6OGXBSxbAkC0ZpnXCqKuv57SpEqDt+BLPq4FiQ24ND7fmJXZi0QS0
 A5JzXGPxXckGHbdmq+Ij/ho3mudZFA==
X-Proofpoint-ORIG-GUID: ARYkLnjhzoyg69eGbrDRlOXI91JdOo-O
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690a7811 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=TbDdNxe2xOi8XIqjo84A:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040185
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

Akhil should be getting tagged to review GPU patches.

Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1083598bb2b6..033675aab0d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Konrad Dybcio <konradybcio@kernel.org>
+R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
-- 
2.51.1

