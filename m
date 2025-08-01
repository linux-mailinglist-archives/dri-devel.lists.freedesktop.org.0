Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8438B186F3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E0010E8E3;
	Fri,  1 Aug 2025 18:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW2Ja2EY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28F510E8E5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfbNj002878
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=iHQTKYkj0qpzUWY7+WEgpg8wdP0WoJQ6dPs
 zuReeFiA=; b=EW2Ja2EYQ2iz82iQwENTK1cE6hsXSob9TuTFT78v5DR4od4kq0l
 bNpMMTYnpLdAR8uTpw3w8ELN2i9GnUHFAkdCmdUYlMiNKUon42n8B4senmalZrpP
 cvNJHyOOE5+O0xqN3mcb5rlLMmraYuS6GmXye3YySW9UG0XCnv8jhi0wtpSDO0ZW
 +D2XPZJLwn/Jf4CjLj3ZXcz2ymo1I4sYq1P6ioognzMkn4eWcPoVcyE2aARzQdlA
 3kmkZnYfdlwejawSvbqrVR1QN4CHuEFAEDu6obhRcCPrKWEavBBiJ+QH8NQZx0yx
 UPxkFdW1u8LQCAA3k4RyQq6dW3KgG2Q1/pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xtckn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2400499ab2fso19954715ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071214; x=1754676014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iHQTKYkj0qpzUWY7+WEgpg8wdP0WoJQ6dPszuReeFiA=;
 b=NxLi8zWgu4Of+XtguwUqYfbmUmnMSBI5Zz0JAwpw0cHLNQNJ3VvOIDLVG/Bk5C6RHI
 nvjEG82Wa4Z9XkDqWs5qEKDPZqntzbgAD/N7Rzk9KD+aucVzo+WC7hyf4g5TV7x/v4P9
 Os3CuivAxf7PjXz2NufyC8Woe2Zfcm48le4SSZNz0mfvnwAHRqCXoCJNSgj4FDXGo62N
 X2YA7VTPk3dxmI3bwjeGoSyX7dMhmC+dRWKbUN6v9zrb+X5GiinoHl8YIybEiljDH4pu
 HnpwO9QhLGthiqeEtV+Krpz8okLOnnKcfY51t+bu9oSOxFKYsLQPBThRyLeNi94krg7r
 8qVw==
X-Gm-Message-State: AOJu0Yx6ogyHVh8JvXotvGxmysUzt3wtJqMpacBJEowx7Zu7FqC4WGKg
 6+cceSvUrijibIGGlRf6+BuXcK5+76jWzI6WwM9mowknpKhUmX/Y8Ff0v5ChTaVqRZrPYqFzKDe
 ay2Wvy1HUe1W1imyDEuiSeoR0+RtwQEHp5HEMVrgN2FTDxSWksLQgGCNbv88PV74r+1hKKB5UGA
 k/2rs=
X-Gm-Gg: ASbGncuNk9/P49LeQoBzWj3T0R06MInmiQW2f27cB9n7u9qJA8tE9pHqcgdMMzYYD0c
 xIckPIJc5sIORAE1ly+SMztAccZVggKzInEYAYF8Ous8byrayh4CorW+oZbvBww374ogMfAGNkL
 +ukOI5nTMWGd+v9UwITh+D6ZetLK12Au2+oMiSRCJWCoxF54l12DxHhbKpqxSUjI5mu1T6B0O08
 HSfVRi+GZonWSQREwGyc85SlxsgPZIfmmaW9dQkX6dPxH7h7XgxELQLPYyQ8t95xVb5J9g/KGIx
 OmjYaMmBsR5D6q8+R1Lp8NhoMysJpkxQYODJ9qm5Q985pP0kgm4=
X-Received: by 2002:a17:902:d415:b0:240:417d:8115 with SMTP id
 d9443c01a7336-24246f595eamr4151485ad.16.1754071213711; 
 Fri, 01 Aug 2025 11:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIiS1uNtFlKO/TgDqfd33YVLs9CK624JVjnlxU52duE5nqqItwb0e7s0qZCDfogQasU+SoRg==
X-Received: by 2002:a17:902:d415:b0:240:417d:8115 with SMTP id
 d9443c01a7336-24246f595eamr4151005ad.16.1754071213205; 
 Fri, 01 Aug 2025 11:00:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7562sm48517715ad.24.2025.08.01.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:12 -0700 (PDT)
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
Subject: [PATCH v3 0/7] drm/msm: Various snapshot fixes
Date: Fri,  1 Aug 2025 10:59:57 -0700
Message-ID: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688d00af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: dhviGU1OJ-trpj3DDMAZnHBGAbrUPGt1
X-Proofpoint-GUID: dhviGU1OJ-trpj3DDMAZnHBGAbrUPGt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX2UNuw73Ej+WM
 IutobJSvUs0ODvayxDnuKQNerK7A9s7QR9EWboagSZ0+P6pIM3VPfqC6VwshXH64E98BbWbyYJF
 amrNkwGITMzm7ExhY2XOaBAH49//W3MNVGS2rYG1qO5YPAmCxVwzswlaZEiXjEJbplepxnofdUq
 rk+Dzng7fekJqAi165bU+uqDyim4JBwRABL4uZt8klam6rW46HRaNl9qNVLGX4kWfkC4TISfuXw
 IXlgdrv+DO3CWjuxjqYns40wPWMTd34Ax87Ldb36TZ8sHJWSLV6K2i1OTWJkFZNHg+aeHlCDtTO
 RrVzWx3pwFcqznMyIMtVnkiuQ+rT9ExX6Pm4JsRWh4T4+xXxWRux68kVXh6n83kLfkKNhdx+9gF
 sNp+aW2BEVD1huvEAmAXlmdgZUnW812RN4aicXbHCP9K683BCSkgWB+ArP6Dcp45jN6SurxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138
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

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 47 +++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++--------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 ++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 +++++++-------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++-
 6 files changed, 101 insertions(+), 61 deletions(-)

-- 
2.50.1

