Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540CFAFA08D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 16:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F53010E220;
	Sat,  5 Jul 2025 14:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Cck8wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB66510E226
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 14:52:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565DiMeK010009
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO
 9kNt3NIs=; b=N0Cck8wtDc7EnrDCJbHToUUiXO9o792UiS7byJnGVwqTEWCP9+3
 Ma0xf2YeIegYB6D8EUc8+QQhKVtIK54YRoRAxmxLYCmtgDy3HAYokW/HtVqQi9Gj
 iayIZQFEwXzdGsMv5Swh/gKeBcNjnyX3pf9yFPRmoJflMMW6Re+noQ84cEwDURJh
 +36WB4YX2wglhashcF3KLJN4VMgeqOoExc7kd4KmglP6yx3WAB3H6W3nb0AbaTNF
 5kErsDqtUg9g2OpmQjRYnYzHUQw2b6eObBI2IX72ENoVO319ApXK4GdpH3JVzX2T
 hDfqZc8CsatkYVXzCOVJe/ou05yQLE6uzFw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk15ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 14:52:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b3184712fd8so1315809a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751727167; x=1752331967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO9kNt3NIs=;
 b=ZlO+bYuzQDRAEbS2bcuxsXQ+cjDBNx16vKK75fVHUkVuNdvVfiE7Y0NLjJDZCpG+Hu
 oAYHH6NsJIiaLq/R+yLOp6wX36gBbOXJFw2XfamcdZJ1XKaHZzJFj/jQHCbsQw0dLqgX
 IuNAgkVCOayvAE/qXnsSghxVdTtYq8gB3ZjWsu7k28y2eDSKxiZslf1VkVxdyXyJ//XC
 SLMKyPOayaMpbTQBXYcFiNEfVMWXLgGsJLd+2eIbLPBuZ+8eH0zY9l6TIPRtnb7vNv2Y
 +MwdFXH5LOZgGtQeZbS8meou/Wyw11iNftjYCWQSM5S5yOdf+ygODChidO3RnnhHz2mQ
 0zJg==
X-Gm-Message-State: AOJu0Yxc6HI9cJrkxRjlo6wI6orlPpKnyc3L81Jv8kvxonwmPBmqkU9M
 9/k5OLrINvdmKFv8rhx/0eLE8QsyuhnqiQVO2z/E68SwweHzlxxh+7SxJ8Lid3KbpXniDen6Fum
 ZkYNVLJaM8kA0BWTcXDtQwFkix7F7B6eH2werrn0ZEqqjym4nr5nN7yJTzkmB1u7rsd8rr+q4PD
 zUsJ0=
X-Gm-Gg: ASbGncs55Vdcv9HSX3kMzSHchJMUNLSDAWJQaeTYkjk1iY03smgMrMblH7aJIlL+Bpr
 RFDAPIAUgnSpuw2ixbMLIVrnqC7uiE/ZCwo9yjpi6bbbGCOxxysW9clIGdUWtIqDREwT+DgLU9K
 RX7D6Rm0tHD8P+3vLk9TqW8cXm1g2+JC/ehtuIod/6ykV4qbeKPICwYo6Nf2k74DxaVn6jhjfFb
 LS2Vs07Xw1jZ71GMkejvnAT0n4q5kwH4cHELpq5Fpq9W7tMqA7Qt+ILK5ELJEIYD7qrAaUmp2E8
 SWCI6WJQnqPjiekxVdO9IAqEyH6F09DmJA==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id
 d9443c01a7336-23c85d8feeamr79343425ad.9.1751727167236; 
 Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGToGgDP5cFnl805R/32fydbC1Sf0Tg5kRY7KHuPW6KsQIBThC2Hu6p+geYPeaz7rf08KyEeA==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id
 d9443c01a7336-23c85d8feeamr79343145ad.9.1751727166863; 
 Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431a527sm43190135ad.26.2025.07.05.07.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Split gpu/kms cleanups
Date: Sat,  5 Jul 2025 07:52:39 -0700
Message-ID: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX3i1ayTmJ85aC
 1nA6TlMaEE1/WUNeto6Rere4uKDx5I9jcycN3m/aKehBkh3JK8ZC4RMQnIp/Xr8NF+wfnib7JuS
 NKH+5inuu5nwafsWzRxcDcq3ZS4OJYM/xTVFnQMPyNc53eFX9kgvbdo+8cvO6HwKeFk55FrG3DK
 fbiagCwy6hgLl+cPg7lLVBS+lS4qlqqxNmWJ+fWhV+HWfANcDFtO4FshaGqJLFdf0RNawm+KSOG
 NBpo4Ndf0WZVwZ/Y4DBPf99ejcmy2fbcLMi/bvup2YB6uxZn1MyNl84PKj/pQB97Cc/4EPJQ3Gk
 iJK7/urZsAJJ4wHgIXl/Xg1Hbj0oBUYHf4usydLyC8ZQJRGuZLfMTukYkQ9B4RzaV0Wwg2bqgKn
 vBONHDuGRg5xXXppB5I9owliRkgAX+ozeoY+YjBSJnbA0+FeHa26ogjlu/KWpZEgwhTJl7R3
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68693c40 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xicTdwmnyVa0YEs4s9gA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: p29NY3Aut878JOrRwGcso5GVJ01qEuYR
X-Proofpoint-GUID: p29NY3Aut878JOrRwGcso5GVJ01qEuYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=864 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097
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

Applies on top of https://lore.kernel.org/all/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com/

Rob Clark (2):
  drm/msm: Clean up split driver features
  drm/msm: Take the ioctls away from the KMS-only driver

 drivers/gpu/drm/msm/msm_drv.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

-- 
2.50.0

