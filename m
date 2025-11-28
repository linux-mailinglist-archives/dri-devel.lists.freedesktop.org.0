Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD164C91A88
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B7D10E126;
	Fri, 28 Nov 2025 10:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Or54hgXc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="am91jNvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269810E126
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS8PX9k3797404
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=iQkb+hB6br9wMh4Wb2OdpOJc1CoG1Ifteks
 1A5xKA6A=; b=Or54hgXcwNALe5b9f99mOl+7H/yS49XyfogFyOojkT13tfQayE2
 1BaBy5XYvplt9r6ZBP51/rMO2Jb5s1Z2XopWKpRUs2nmBGQ3S21613f1Apg+w93w
 fz2vEC2R6DLsd0lQxij/pAyIOq0QuF9pFp7R3gJKkNEilxe9NfUzLOoR+74ls3u3
 MkVddsf8xl8+M+Se89cCw+JZUh27ZgEg3kRKrBsJdMsnxoqjTpEtVg+QfET8Xhnf
 lb1M3cECziZ6+Wi5t1UEb7dqMVemlfvUjlx7E71iS8bIP3NJBOB3EP8OhsVx2tE6
 vmgoX/zix5Z/34+ZT4QMwgKIxkHdbsviRbg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudau5v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29557f43d56so19747165ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764326073; x=1764930873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iQkb+hB6br9wMh4Wb2OdpOJc1CoG1Ifteks1A5xKA6A=;
 b=am91jNvMO2RsDfn5XZG8l2j2GQIKPvPZCDmBSuIxtIlS87f6ERqMDvyZa5sy3/6eWe
 ntSrX+q01dq1a4myad66Ima8YneDHEfRJcFaTVwX1JQr9uOY27cl72yVlDJmfNywt4qg
 YijDpsiPAAnxXRQ5+s622PoBC+70jv8md6sgRPQ8TOcOtKoHMl7o4AS84aZv/Q/Xidyo
 cHdOIIaT9zZHPn5ZQl47kVBT90t6mkZJiijPjPHFhIYr0LF7VxhNaClWfSIC3LezL2XE
 hMKUThsYKoXD+9wkpKnkKhjhVBxUpSkPLQ5Pc7gZFrz30yVRJ2cRIZQrve9K9D9yrJCp
 zhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764326073; x=1764930873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQkb+hB6br9wMh4Wb2OdpOJc1CoG1Ifteks1A5xKA6A=;
 b=VRxUH6N6GpjPbfTWpWNH3d5dpDhImht75rYD9ddK3ywxTygF+qfXXLriLsn1TPFn84
 P75Bkw0AWA9BNXRfZ+7x21Y6NWJIZvJK1Np1yowrDBLKmjeYzhJvLHe+i1qGs/+wBzEB
 uE6PN3OLoF5piG6Y3uDZAccQtzNp6P2ESVxdHjB5uT90iuIGXCSrTpwHV9ukbxqRjd1U
 HLdLV+JkdP79Zdy2x5CvjjAcWxAgtQLWC4YVV9nm9ij5BMDqK7uXIbQRKMkSiQ+raJli
 ykzecCEmH1VrI5B6r07EP8ghiOOyIbIpSVOBJ+SHy1OwNHqxyWCmoWpzSG17O9rnMNAu
 cumA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkEKqe9F2VNSvz6iNfV36P+MM0pQauRoeicgcZInhoqX0/OEpJ+SFYLd0B7FKMK90vk9U9CUb98Fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY8b05UpBQXIT0JMYxKUwwBWCqIvV9dbiVYE8aV9/vzpgdilrd
 j+9tiYx7I+IqUSeWZOxAYtIugQGswHBFv0sErPWWqjhGHNXuo9PKHvIl+06MqNA+lR4wBfM7ob6
 0WCD2j3GDZA+zwQ1TC9yL6tSBbq31TrF37QwZuUuAK76nc5dKzt8JhdQw784E8ECHiY2AwcE=
X-Gm-Gg: ASbGnctrtQLQ7pu+QPfsyDQtRxFmR+UTgeK6C9HZWObQbYD7rYHFPNEqoqhp1RiZNON
 nSonOVENp/E2tKZFCY8hhWhtMTi+AefmYmIZOENGfpkxJfdanV7usrMuuPspOYkLcHSENYTORaE
 2jXltOgIySp/vwbRrZ1906IdvI5wzaySzYmYkD6phUiub/rG4kXtlIcLPLuxPaL7dDLX2koPZws
 81PfAG3BlnjkLd2h2ucBrcFzwBFHEzaHF0mhYfuir9b9ixaufg4MWwzSNWfehiTCembX55u+3cC
 CpdRagdHZnjRbcTobvpAphs2xyMXvtg0ZDRdtTwT5Xv7j3naN/hZArMeLwVLwSP0gc59uzRSasy
 jMf6TNBGNl/KUNf38QAT2t+BOazYORNLKSnd3RWhA3g==
X-Received: by 2002:a17:903:1510:b0:297:c048:fb60 with SMTP id
 d9443c01a7336-29baafb7bdamr175809495ad.25.1764326073197; 
 Fri, 28 Nov 2025 02:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL2Urteh4mBeitadW4tKMwngg0RqL0mlSONaWNQQ8b4oSmJQhHKhaNzkjKfFpFVZdOWcgHIQ==
X-Received: by 2002:a17:903:1510:b0:297:c048:fb60 with SMTP id
 d9443c01a7336-29baafb7bdamr175809065ad.25.1764326072707; 
 Fri, 28 Nov 2025 02:34:32 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce40b993sm43098195ad.14.2025.11.28.02.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 02:34:32 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 0/2] misc: fastrpc: Refactor and add userspace buffer
 support
Date: Fri, 28 Nov 2025 16:04:26 +0530
Message-Id: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RhZtSWTtSiYkysK4scYfBjgCWzJ5v-5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX2D3TYqM8W07i
 LbI63GlFvWDXFiFIn/1WV0F5Mn9xQcehn+JaG/faAnZM6a39JaQmAoLhz1hX4hcVchCY36fkn6D
 sk31lwlFkiwrFfA/Ybk3oFOpXYwvyAEs8iF79oqOCDkcNwH9x6pHIMsznevyZyIB1my/GmpPfhc
 JjAH4g+4WR7kiTmXOCrUMjMl0s7r5P4uxZarVf0p+IshnQ4rZOElEMHntWtcA6KPJR69Yca4L9l
 3GWUBEQB3PBKZQoJiDgrowq6tzAYmghym69Y6/EiIYXcJ1NEkax/4Xts+xBrSyPAVG0tRYcpg8Z
 2G/USzy1k7zAEdyyENS1EhbVQ8HC7Ym0HyL/SnYp3vHD5LMivMQhW0IJTJ6njFucHwsZ+LLlTCf
 NXMHUBpxT3JehbK9u0wWrdA7C/ab8A==
X-Proofpoint-ORIG-GUID: RhZtSWTtSiYkysK4scYfBjgCWzJ5v-5T
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69297aba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=na3UML1GMWht-DHXVPAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076
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

This series improves the FastRPC driver by first refactoring mmap and
munmap logic into helper functions, and then adding support for mapping
userspace-allocated buffers to the DSP.

Patch 1 introduces helper functions for DSP-side operations, improving
code readability and preparing for future enhancements. Patch 2 builds
on this by enabling applications to share memory allocated in userspace
(via rpcmem or DMABUF) with the DSP through SMMU, improving flexibility
and performance.

No functional changes are introduced in the first patch; the second
patch adds the new feature.

Patch [v1]: https://lore.kernel.org/all/20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com/

Changes in v2:
  - Split change into meaningful patches.
  - Replaced uintptr_t with u64.
  - Fixed commit message.

Ekansh Gupta (2):
  misc: fastrpc: Refactor mmap and munmap logic into helper functions
  misc: fastrpc: Support mapping userspace-allocated buffers

 drivers/misc/fastrpc.c | 190 ++++++++++++++++++++++++++++++++---------
 1 file changed, 151 insertions(+), 39 deletions(-)

-- 
2.34.1

