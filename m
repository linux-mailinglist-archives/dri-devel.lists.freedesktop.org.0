Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301DB3D8CB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 07:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8210E30F;
	Mon,  1 Sep 2025 05:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNSYt1eM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E049C10E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 05:33:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VLxq3D010062
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 05:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=5Gj2fHHRocveNDazOUaXByhIdsQ04V2LnYy
 pYBX7Xjo=; b=UNSYt1eMUffl5Je3IUB9dBx76rP80PA92HfPuqDlXM6uDgiLRLa
 5x5KfUiCzlzBLMciXwynnq97r0hmx8ZKBkcp/b5Z0iiVf6SrxXP0hg0MCnH58dt7
 aTNOPtKA0aXqE96x+OmxgbArAkeTd0FzZQLRbj+VTT7ST9BPquydqM+urEShdfXJ
 BRSbYTQfCbmREhohkJ3KSsNTM7u2Ir+744cyJRW5T/yQ9B0xHZF0P6skiA2J+CTw
 kBMb1IQ2blZnvnQl3bgOif54UvwPG6DMVgho/PYT5XxJ+d9oS/aJo6+Y/uMMZ/Rj
 Kvuk9AL9fAlztZ9GwxCX5UYj1l/1SzyK4Qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyubxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:33:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2445806b18aso45379315ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 22:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756704821; x=1757309621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Gj2fHHRocveNDazOUaXByhIdsQ04V2LnYypYBX7Xjo=;
 b=W3JTApEUfVMXqLMbgEpRbqOC6OBgyAd6jImaQYNIu++5XgJMqtMDk3zYLs4DysMhhX
 2ViqrYmEZ9Du33myElWyo/f1lW+obWRSMU2EOTA1V4OBouLxKOOMbtA1oP9SPHt86PlC
 8uwlgX+rHXUUyZwpy8bsrqwPGR8r5dGuY6Zn0f9VXZ0e1YHIjbsAxpeAxz1iQ+DVSeZD
 62XpfpKgGE6g/b8uoxjZPZfsDvEB2Mn8oG+eTGN7ggcUVnAKRDauJ7uYldbL09hJ5Eye
 Gu4PFglws4M9Phaukt/pj1lcXq21LoAkOtI2gTxIepaivTnvJR+z4ln3DlgS6iyulxGl
 Q6Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsrGO+rqIG8DctK72Nr7fYNGdLrZiu7u770isKedUswUzPea9pgLJa75jB/X5mbKLsgrX59NiX4X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvZOaJ8mW6CD3zbSZVjgJN9iwzw6rQ0bR4JVHXYxNZNi2MwfHe
 En6mEHO2Rfz3T9aJzDHsybEF4L1E8r7c0x8kk8V4mBeGALs+h9qZ0S3ZOPadkDnBRErMmD2iSsT
 iB7KMQcUJ2c9iBakWr1t+RxpZo4VUl3iC9OcC2tvg3LO87gWRRKS3C51voWRyF8HRvuFN8KA=
X-Gm-Gg: ASbGncu2hjtpO1EISqA6MbpyNezKlMLmtZZy+m4Y+ZKa1GSIaXqsPpV6zD5nflaW6U6
 NZ9mW+2/3+a142ajrQaiLLxmaj9DawaKSxoTLA5+joph8XyZdo5mGa7c5bDka8Ed5qc+uKnoHg/
 BO3KaU8KQ5+fXLMuCBe2YhZ4mzX94YXbBDNI5FZc7Z8cNa1IAYBRDs5jSnzVkP21wjAdeNdj8Ro
 OfGYbjm4xVFAMoLf5YMArDA3t5j38+rVsGg4AYGJNoqo6NA8ZCKVddko77SJwLioWAAGumA382b
 84MNyRsYC084QEfjP/Bv/Wexh0QEQ2dW0sIQishxQ6AZfEXqh6atkCmhas0hSbjmlahXbPO1
X-Received: by 2002:a17:902:d2c7:b0:249:d3f:d238 with SMTP id
 d9443c01a7336-24944a1b54fmr104707315ad.27.1756704821452; 
 Sun, 31 Aug 2025 22:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT0lCSPA0prHCF1BZxoGfFc43i8lpaZz8hGnkqmiBs1T6OVS1NVSTdRMrSKkgif461D57Law==
X-Received: by 2002:a17:902:d2c7:b0:249:d3f:d238 with SMTP id
 d9443c01a7336-24944a1b54fmr104707015ad.27.1756704820968; 
 Sun, 31 Aug 2025 22:33:40 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24906589986sm90575215ad.111.2025.08.31.22.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 22:33:40 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1 0/3] misc: fastrpc: Add polling mode support
Date: Mon,  1 Sep 2025 11:03:33 +0530
Message-Id: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: me2NuRoOc9OqsxK0HcEUoWL4HbsvlPVn
X-Proofpoint-ORIG-GUID: me2NuRoOc9OqsxK0HcEUoWL4HbsvlPVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX0Z3kMgL6yP4J
 BnfgUJPx4xSoQGZ33KVg1q1Yq5TRteLTX0Y0j6anRZ0LbmWN5VhpZ7iSGSDJC0yJ6Dq5bWX7Lp3
 VVe5PKb6nXu7JqkclzEQvMU95mg6vyrzcybOW7Mu4i5gtgyZoiZ432spFncm1wR2cUk/EodqjMV
 btGcLo20S+A7MF84p6BQJRbiNZM0MRJT7Y4dExFMPCI40zGV0iV9ZrSpixn/wf3OOQwE/krUZw7
 8BSFYyKdPgHvith90oVcP8Rqp/YoDBEP5AOUgduDgSrP7VZBPNiXhHCuiPiTsEKFYz0w2UM319a
 oZotXh1X91g/Z4TyJ3rW4ZzPbxi3vtPPzxbib7R1KCNtNl1Y34hQNomU6jQfzn/yWNR/U94drfE
 UIdTdah8
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b53036 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=qQG2SJLAMOdS_Cv4HkgA:9 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Ekansh Gupta (3):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Update context ID mask for polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c | 145 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 123 insertions(+), 22 deletions(-)

-- 
2.34.1

