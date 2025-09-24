Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087FB9CB41
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AEA10E813;
	Wed, 24 Sep 2025 23:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj3FZfxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1110E25F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONaxDc018026
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Dkr9LBIM7L/Tb1+wbxP+5Z
 hY7imalm4QZNmOXTdv8NY=; b=Yj3FZfxJh/3w0j8KbM2OpeHpueRIM/67jVCOnE
 tHudpFDdhzm0G0Ip0xDdRIV36cY2vLgX6H9/zDyAgxMMEWeDAnLLkcgwY2Y5TGPx
 D3RutdbNl2bp1msAqrCSJtzj1Zdb6k1H6MfozpqaxvkZxKU6aq2tCZP6O9SIG/fP
 bIcOE3MxswB7z8bI+rg44W16etGp/ewW/4MkD/xdbiI/GgcH6XFamLGOzmLUBNXF
 mDRJgE3wTZwcZAIJQPQM5N4AYIsgw8fcduqQjslbo8YtKmpaQLcXgbwkOfT98oCK
 zBpwUphMxh4Gqkn3DSd1uInBG1G/Dwyb1KZsaA4L2WZoe85Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka1p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24456ebed7bso3480945ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 16:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758757603; x=1759362403;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dkr9LBIM7L/Tb1+wbxP+5ZhY7imalm4QZNmOXTdv8NY=;
 b=AKuWVJoeCDtpKc7vdPMDyea9NORnaT5JZuXNkq7mZ2o1CmW3jMrllrbCioHf2/7AYq
 nWf+GT79tdbmgTpKMeJjGMZI4CFIkzsJ3yQi1+QtB5p6xnP9MWuVm4CT4NmpVgmssA5J
 jQ5nlyKKCxNGtwtpxEx7PS1267gLouzssnyBnE74eGRHVSX4lYwPROHMHlsvtPUWlVrO
 bkWrllSXUr6gMpJ91sZkjEWgWFOXmzkSGDkcbcYQ8T4rKUtv4gJpsTdPzm5j0BHb49eY
 onn226r3sZnmXDW6dbIG2o1iCOqnyL+FALa/S7LD7vfR8qNQo/0xddcszxT1GFTG2lcv
 mGkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Ta9ZEWIGyK4iNOff6A9pcFFncqkddNBi2lDalTMniU3N6PZxTq/LpMJt4nxgLo4i+PHZ2aDt9eM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH8CWIvtY1MW3ZbRn/Z7zI/aAGP62P+FilxMZ4iShvzOXY0euQ
 64hhj8s06YXmK9cKmaV7uNch0iB9OHf0/cPNQzp/XxkaGU9uofSGrlt8mMrH/xqqGO2hR6nk0hs
 3c8kqD88CzbIYGgl5gir+XibeQ27N4GAvfV5NlDzSW957wqxQkY9A0LTWzOhTIWEJjRd0AR0=
X-Gm-Gg: ASbGncu2M3qdkJyFs3OAOCSyCjhN5puIatC/swSKmCuRpsWIvPEbvoCnRSiceOYhqn3
 CiJdxXHVLq5784ZcMevxm1OksOqrj44GZJxQu6ArOuHZnUIcOmcCBxkl0kCY9BW8jNUvcIran0+
 mZNmJIFIQhUPC9dq3mJDmw8l2mLvhQIkfgnfqcF+7ws1kOQe2AoJVNHVM5cFP+4DlGRRB5cTvTk
 CmN8muHFCYFU/jytLdn7GypTkKtNVO4SkK0RAdkS+lwu17Rs7mE1w3xC1ubZ8pwfO8cqYcZPzI7
 tvcpoWIASechoDgdGmddvSCRmxQyfB31i8kZu0LHGRuycOVR9YcRBDrd5eJLLf3WhOhCL69R0QO
 xZe4DPemYuDzLOHA=
X-Received: by 2002:a17:902:ec85:b0:272:56e:e296 with SMTP id
 d9443c01a7336-27ed72a466dmr8014965ad.30.1758757602811; 
 Wed, 24 Sep 2025 16:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMymjaREBsLIvKLNW+Q7vB6DhWGdnvzEkvxiVNd5Mt8P3KBP//WZcxe7JlYHiq3FZD3j2kVQ==
X-Received: by 2002:a17:902:ec85:b0:272:56e:e296 with SMTP id
 d9443c01a7336-27ed72a466dmr8014695ad.30.1758757602323; 
 Wed, 24 Sep 2025 16:46:42 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69959e1sm4318405ad.103.2025.09.24.16.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:46:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add ADSP and CDSP support on Kaanapali SoC
Date: Wed, 24 Sep 2025 16:46:35 -0700
Message-Id: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuC1GgC/x3MQQ6CQAxA0auQrm1CAUW8inFRhiKNcZy0xpAQ7
 m51+Rb/b+BiKg6XagOTj7q+coAOFaSF811QpzA0dXOsBzrjIxec2d9WEjJ1/XDqu4mohSiKyaz
 r/3a9hUd2wdE4p+X3eEYmBvv+BUpq7sZ2AAAA
To: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757601; l=1302;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=j+o1N+A6cz4DNX+PHP8QLZuXZ4/y6YVjvv721Z3nnPY=;
 b=EmWcrgX4X8FINHrxR1Fmsl/nVUiOel88JAClsPVDeVGdbyZfFBF/h8NWT/Ts00OBJxkBCt8/r
 1LCxMua0IJBC6ABjjncQERh3jKdNcEX02B1At/cAu63tz98ftIfJ7bR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: H1R0UsW7shESsJ1T0G0QesVczRmkQJPu
X-Proofpoint-ORIG-GUID: H1R0UsW7shESsJ1T0G0QesVczRmkQJPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX0plA1MFbohVE
 M4BT2htSlO6A4Eq65Oz5P4muEuXtXwFFJ5fD/buXDFHGwBKNwGbufG0htEHwS76rX6ZKh23pxh6
 T8L6Py8K+EyrdMsG/gj9LLmLCLOINT7Nbeo4KbdC3lcKZzOTLucJMQZ6+2BT4rTssz7OvNFb4rg
 yUC5PiNzopkutK6YCM1SjeoXSW3dIFqtMFPzepmuFLsF86XM6YyW8mhsPG0sWM27QEcbHQ4QiOX
 ve/M5RSwnyvhckrWm30s/ruOEOfcmYRMDggX7RIIrqMwkzfFAFAolCuchrkBzucrl0yER2l/Nzp
 wR2Y/XD9fFUTTmYy925x4ssWb2dn45vLBfqRMv/sU/N288rIkFkplW0Lu8v/sWwizOLm6VH78Cd
 4hK1QMYL
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d482e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cuHX0V8jOqVKnLf0s2oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

Introduces support for new DSP IOVA formatting and hardware-specific
configuration required to enable ADSP and CDSP functionality on the
Kaanapali SoC.

Add support for a new IOVA formatting scheme by adding an `iova_format
flag to the DSP driver. This flag standardizes the placement of the stream
ID (SID) within the physical address, which is required for DSPs to operate
correctly on Kaanapali. DSP currently supports 32-bit IOVA
(32-bit PA + 4-bit SID) for both Q6 and user DMA (uDMA) access. This is
being upgraded to 34-bit PA + 4-bit SID due to a hardware revision in CDSP
for Kaanapali SoC, which expands the DMA addressable range. To support CDSP
operation, the series updates the DMA mask configuration to reflect the
expanded DMA addressable range.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Kumari Pallavi (2):
      misc: fastrpc: Add support for new DSP IOVA formatting
      misc: fastrpc: Update dma_mask for CDSP support on Kaanapali SoC

 drivers/misc/fastrpc.c | 86 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 10 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-fastrpc-a1479674d113

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

