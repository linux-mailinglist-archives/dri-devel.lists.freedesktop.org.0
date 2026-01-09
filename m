Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B9D0AF4E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9510E8E1;
	Fri,  9 Jan 2026 15:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/GZLk1J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLTKm/Kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5410E26D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:37:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 609CbFaa3019530
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 15:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeu
 Ee1C4toM=; b=l/GZLk1JvMRvn8d7JS4mmfK7QER4BQ0BVbx+q91Qp2g2WMt9LEk
 kF4WdMa9W/PDgFofIvDQCFJ6PR1EfY3MiOIhSraxLTD3vDenMcR3TQzmDEUzCwg7
 dqeEXwJxE2d1FJxRNfgytfYgOgWmW4oXhFdg2/iJ+H3TI6ahGFD+wBlNfuLge6ll
 Ctg3PG2mdIGFDP/5fnUCIxKSfZxAPJDKKk/2w7JFweXhWVQBlCo2ZKCqfW6oRr/1
 UaBTPYawZeYWJioGJb5huvqY2foIo8xL3t1/g6Y2mxfly0SV7ZT46jKjjgO4ozIo
 i9CkjSiJZYp1PUghK4mwlB1KVDQWwhiV8sg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3k7u3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 15:37:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29f1f69eec6so47959545ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767973054; x=1768577854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeuEe1C4toM=;
 b=HLTKm/KnYrcmJDgRQDbJhA07CCvzu6BIyWbIiX2VkY5CQOQ0s8298XLX235AWprTFM
 yDiER6HZoT2yzDj9rsPdRDe/77/q44LRdge5KoSCcpzGsoi7Z7kvlnYyIplo2gJDkzHz
 LYsakMeK+LQTS8ml0t2Nh2nheP7ZChStBaBW1RTeGU9LPU1y8tUkrQNy9Cph1zoD2Lde
 f6+mAIwm2rw3rfLmyz4EXT9ytZOSafWE0kFgEJdTKftwhHIzUvBWVtDzOA/YZxVU/0g2
 GBQ/79CKDLvUJ3c4lnyeqJxzj1jrDnE0pi4DaHQk5yIqy//pkw2+SnFeO8t0X3uHkoCs
 9mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973054; x=1768577854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeuEe1C4toM=;
 b=kYkVRilps2W+H4Xfrzd9DEbYjaReqk8wj0PPIa0rs9yVRdJyYM6C64lEhuk6RRUPk6
 EY9g03rAIT6Tx47dFowSWbomQZKdQ0BDReQGBPNh7I05gT4GP47bq4d7s7ggqYENpqB1
 1h/QvJuwQJIAFWM2y0C/7OJY+ugQPQVzfZ+aRGLjzkx8HAZQmYRba2fCOnmFrtjbF6y3
 gp8R0pdcTAvKdhNwjbvNBX9F+AX/wEJGJ8h3/G4BQ0xUkSh6jj3jGAGgLnvVR78pRXzC
 1NTFTbaz1S30SNtgGnywHxGRgloysUvLTkbv15Jt+gqAI3jTKfDdvu+VDZQ6XrJAyHv5
 PzsA==
X-Gm-Message-State: AOJu0YyAQE7keWOtV3fEwPZlq2mnw8YnI0loDfafFhB/BELr2oKGxE9W
 YsYJtm5Nf0e7w15xiafLmw2NEwTibEBhBg68uhYaOC8LhnE5AzfuDZ0XMxE2pcTBhO4A4QJXM0K
 GB0VUZf9/WdoQVWpb5RoG5V7sFeT0DVLiguHqBa+mY3JXwRZPslq7NiFjFyI7lVn26NMvLDUdon
 +73aE=
X-Gm-Gg: AY/fxX6oj0aFM5SyHCs1juG6qpVjnEHPBJNCju1eSdEhjReF7OhnUvUSney6dul1r4n
 BhcFn6O2wiqL4BFV2Qxi5cYJSY3n2Z+9nk9pQ3hcfnODjS+S7T3x0WOziQ8UlNdAwhOx7d2F7sM
 CyfiNn1Yhvr+ecgYMQX8gjMUPdj36P5bZPFkzc8TnKmGLQFqXvN26JvkPqyh+bGlWDNpcJlL3c9
 kmH99Weq+S9Ok+FpNSDERKG+n2PbHR2GLIfp8+U8QbuQIaUEFNCcYKIs9Obo8h1uEyFb3tktPYq
 HoLq12uW4wgkm8BZDLDK+2hkukDA/qqw2q/Qu2CjW3asrNkddqwz2pcDnviqCSwir/1GCVYfuyN
 ARqZDhsybsfW2KpB0yS4wFP8qIga/0jEApKjwzAsEDJwtl34svNUl3i/d
X-Received: by 2002:a17:902:e748:b0:295:6d30:e25f with SMTP id
 d9443c01a7336-2a3ee4a8731mr91840785ad.53.1767973054430; 
 Fri, 09 Jan 2026 07:37:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Uk7qOMBA7antJfrGZImiAYyjpfRAhu2WhMQR4Frujasbn70BkFuYzCCn8ka6umjSyUS/Nw==
X-Received: by 2002:a17:902:e748:b0:295:6d30:e25f with SMTP id
 d9443c01a7336-2a3ee4a8731mr91840515ad.53.1767973053899; 
 Fri, 09 Jan 2026 07:37:33 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a2a3sm110759525ad.13.2026.01.09.07.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:37:33 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: A couple gen8 fixes
Date: Fri,  9 Jan 2026 07:37:27 -0800
Message-ID: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LXjIoV5O837srZzGesBqs8s8iTAJLIO8
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=696120bf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ho2Lwv9vkAcMQfqMMXEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LXjIoV5O837srZzGesBqs8s8iTAJLIO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX+iQQIomhNaql
 EIqntf/wJokvpZzKOIl0t3rTWY6UMtgIf/QumbATOGUB/j1H9Lb2aLaaafNjdWEdalX0cgL8tbt
 8EdwR4bL6987vYIMjZOJ9QqzNHflpGpiM5sxP0twST6GKg7ik0UrFkVDqndDx8gz2JfxfaFEFLn
 uGIvnvxWDN9buG8liBdHp4QaFU+CmkypqkLoq0hYXv3JT4K2SqaCJP7oMTyU71rkuCxmvV583vc
 PVdYiLjFvHmgYMUs6aPes6UO1gOtkplmA4NpO8gsl3h/39kIMpD/rWihUdKkUWV5oAA1H9G86LV
 12AKGNG2/4K5/d4TGgwnJIX5Kil/vmiroy3mJZCTfjNzhN0bAOEr3eFcF7UWdrPo+MAs1Pmrexm
 TCUyZ+qlh4mdlNFyILo2Pje8B4E8YQVDSUSWs/+X6UuOJBiWRm9VKGLOijADBZcZvwYlVNEJe8G
 PIfCSodqJDSkG1/A94w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090117
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

Fixes for a couple things I noticed in testing.

Rob Clark (2):
  drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
  drm/msm: Fix GMEM_BASE for gen8

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.52.0

