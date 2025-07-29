Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E4B14FB6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3753510E3E8;
	Tue, 29 Jul 2025 14:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwrQamTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467C710E3E8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T96qT0023471
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=r5UPSy+ehArJ0kieZ3fL0Y0tSoDuquiGCGJ
 +T2zz/U4=; b=iwrQamTTYmbGr5OuuQJyvBsvyoBJHBz7WmIenzJNu2bJlTmmqUt
 14wBqLSUfgr3VZj6ZS7/vDOFRcQln0hnbbhSMXXMYlJePJLhCvjqeAqCyaRcHT18
 vF0eqM7eyZJEkgMZzDot1ZGpOqGhT0sEe/Vt9zqQqDfVCQuY9wvN/f5UA2fZeFg7
 wR3VV2bc8cP2zA0Auyal7KvfwJsdnTHh1Jbp3BYDyRQG6+Fr1ES6FMMmv17vWw80
 Mem4gyOpU7iLgGoUntkNLusn5OtOUMd5vMdhAi13udf7EAnCsMS9EitRv7PrfOBv
 Ax4VJQ5klh29ZlNctBDciBlm9va/9P34R1Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qrfvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2400b28296fso34889305ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801059; x=1754405859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r5UPSy+ehArJ0kieZ3fL0Y0tSoDuquiGCGJ+T2zz/U4=;
 b=rME35uYdmrKK8sREzMTLp5lOwI/UuqE3xTN3ijlT7GQrGODXr3ZnoTuich1regb5ch
 VRjpClClUzOLepdeBnKqkj8eb2yWUNmhilImgdG8VKmbhVPWlUFZVc+HrQRM3UtMCcYi
 ypMPXdBx+lGN+6sZpPat31neZLFNJTbNdNCXXsF7m5O4RytzXFNT58zzvC5tTG1H6LLu
 jW3Yvqb23k6cpbrQxrPDESpus8SvULKAcNiWf1JJvMU7wQ5rxLa7qvPPk+dnF8zr9Prh
 WLujTC0yBg18eMv8fHnZt8Ohx+Znfqz+18Kj0yncqGIksgNFQfzn5ucPGwaRS5NJczTe
 j2zw==
X-Gm-Message-State: AOJu0Yz37Lxz87vQyOyDKO82uGv084CXmej5yy7jkx6GwdqXvYgZ8tLy
 19Tdf9zLAFNZGQmqGCCMoSxoP59njr1lpDHTwUf5BPQiYxsvrROvnSdXIvHXVDuJpdbxArplOWM
 LPIPUrQBGqM9S+A0J9vdyhdARfFBD6ky2XSLG1yciYbjtTITDRs+7XvTH/9p+cadm48iWWKwdAa
 24AUs=
X-Gm-Gg: ASbGnctmfRFFzhij1KVzfc/NDsy+tUOvVabPL7uuFPoCE84/Ye9PnhVPrWR7zAY8exK
 r5ysHzG6ZbUUwE6168iWHpmrXhn5UCP7tVb+P2Zfd72Bb6M6DNcTZNlGVCq76mrYOgIzvR/5xqc
 FwOYg3gHZGSixdMZ9V2AKTTtEmUdX0+/HmLcm3GAuEDjt4pns7Kmllq9x2tlbP7wjO7dBhtQXKb
 jhe09PtI9CacLZRtro96uks4tJbEzJpSNPLeOvCwuuOup+udsDLff4BUVv7zq800omdPq8YYYTu
 NevplUnsTwpJztZXzwGzpAURpg3yvIknw+Ok2SQHMTFeCV/gno4=
X-Received: by 2002:a17:903:283:b0:240:6740:6b11 with SMTP id
 d9443c01a7336-24067406f22mr49778135ad.40.1753801058408; 
 Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFQovZlrhwFov5F/FdQdGq2gSTgHMjBMBeH8Fux2H9TUnRq58+154f4BSUz7QjrZqjwgo7yA==
X-Received: by 2002:a17:903:283:b0:240:6740:6b11 with SMTP id
 d9443c01a7336-24067406f22mr49777165ad.40.1753801057121; 
 Tue, 29 Jul 2025 07:57:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2404483f5a0sm38202595ad.191.2025.07.29.07.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/7] drm/msm: Various snapshot fixes
Date: Tue, 29 Jul 2025 07:57:17 -0700
Message-ID: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMyBTYWx0ZWRfXwuLQRSNDQYh2
 +PcThAJGZxGTHisqZCpqBptqQK/HhvUFfUaA9WhX0vfDBunmF2x+rgzoWWKmqhbnqIypWdl1onl
 t6ygfODt77S46KMW43eFMLiOMtZnTCyzQZmwnZbzO8m3B/egcPWtuhDvb8OWkopclQG/YP5LeuW
 uaamSUUvLvxOZMPqXjvfdzOxD/u0YWymX+gUesDC9mWrzsirz8oKu6BIV1gl4aFIsjTzRhJcp9l
 HrKI0D/+Z9kkUuIyEPLuQF8ko3hoANVgJuPegrpIQLRi/ha+B4fnxytBxAviU2SirL7FfC8davc
 K1t8GM8rTPJieXZWEKhqdT78pNWVSqjVz0F7PqpkWp3gwYZ2F1DxH5kECCUto3nghwpdYanc3qr
 mGCXaFOtuOtHkVw3Z3ziLTwc6tYp9wjbetppkUKT1BdtuKHT2nvSpQGuCbFIVgyCo87fibTO
X-Proofpoint-ORIG-GUID: _3xEp9a4raYQle-84fgdRWSpN-j_GLki
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6888e163 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _3xEp9a4raYQle-84fgdRWSpN-j_GLki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290113
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

Various fixes I've found so far while ingesting upstream devcore dumps
into internal tools.

Rob Clark (7):
  drm/msm: Add missing "location"s to devcoredump
  drm/msm: Fix section names and sizes
  drm/msm: Fix order of selector programming in cluster snapshot
  drm/msm: Constify snapshot tables
  drm/msm: Fix a7xx debugbus read
  drm/msm: Fix debugbus snapshot
  drm/msm: Fix a7xx TPL1 cluster snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 26 +++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 +++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 ++++++++---------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  6 ++-
 6 files changed, 78 insertions(+), 55 deletions(-)

-- 
2.50.1

