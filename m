Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC46C90DC2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 06:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50FD10E04E;
	Fri, 28 Nov 2025 05:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXVOfY9E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/s+t2QV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C6B10E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ARKtbX52113514
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=uhrEIbweefDleZHY8SlZRuqlAF2tHqjBzep
 W5abz4kA=; b=gXVOfY9Erzr5FXV1YE5oXUyu0a1oEUMTgvwfCn4xd25RWdPJxNq
 GUCJUsgjA4Ii70wWZhxv4UaRcEWc5KqcBwHA19D/cp+QXsIXKk5+nUPPWt/v1C4I
 8lAnSIoaSjYlY3P63pgG9BrFgD5NGxlLYw3pIE4euCssMxKift8mYbCBYfzqbNVu
 sE/J7HYNUilHSSOoMt3utDRpVsaOyFrg5YccozFNTuk9NhiG2geM3i2Vz4slWLqP
 Odrmyb1s76aHQiKnMIUVHNp2yc8f+Otg05HzI7az0pc+SGfbfEpHAh5bPt4WEZkj
 /2Gh2W1bdhbSPGqvm4eFr3yxJrqxMVzukfA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rt9w3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471737e673so1654089a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764306340; x=1764911140;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uhrEIbweefDleZHY8SlZRuqlAF2tHqjBzepW5abz4kA=;
 b=a/s+t2QVTQpy7q3NDk2CS2CT5feCTzrk+7XpTYMh1ot7DH7nbLKiDJ6b+zEliOlZ2+
 fAIwGqYmfoSMuV+cyGxeg5d8crEcx2qTYF+6kj9uAN3JPhF47Ncgm+y7CVLIb7xLkQq+
 qCPJppp/rUlCcwlvrJqdOjPcU38X2IAi8UfuCx/nLvU2KbnabqTPpD0o0/Ij1OZlZRd3
 IM/aASLqapxbn/BevpRusZVb9qOF1cs7dKjmVjh6pqd4//x/O1z5Zq8IkDiXwj4xxH2k
 ZtFFAD5WbGkROXDVoO1GMge66aP6WCB0lXV1jCnESTbi791uTJGTsjEoPATih5ApVpJs
 XZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764306340; x=1764911140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhrEIbweefDleZHY8SlZRuqlAF2tHqjBzepW5abz4kA=;
 b=orlmef9dRiE2335r2uKSAPdtaFPSbJVJeVLLF3CCwT6P1oJa71Swz3YwlA99G9EXe/
 A6azdnX4ocXDTIoQrMGoRGG8gQJU1hMK4C3uFnc9nz+uRwa3kxi/d/puFC44zQr5+pJG
 i/oW8ZuI3E0ALF6z5hMtKE5u5DxJd5FTDGUz/7W3aAJ+MzVS7Q35/ybT9hDFjGGk3pSU
 O4siH/Tea8YkjlR5pGv2iKwfCWqRNMOet4RPICal7bCF+O4PhgWo+669bcioqsKUpP0z
 z5x6F7Is1QaGfBIlN8w2G6tVDAxwKmzbQz4bT+1Boza0JWYqqyld/dqAGtZVY5pGKsik
 AIMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK0o9vufl3H+B8fjo1pWrSkK+qkU/Zp256+YRmD/2sKqgicEcAf+mv0x7aNn0Cuubts/OollShoec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVpusqoSsIYzLV3PX7lX8gTP0TN9Ids6cr0wlI/CutxMnEtzm1
 UtMtUUv5t2ApGgBSw/WuKwHV3+4LaGBNO5PPlU9LYDHSWD+da80o3/4FJw7j81zvR4LoTRfNfUN
 WyHEpr0KDupKZJ2R7Zoj95bBokGw/R22WX/u6zwktRkS9SHNNw4Htzgr4u+l7zWLz+MRTOkc=
X-Gm-Gg: ASbGncvum7+Y1E3/k3a+W1wtD4ifWbwGvtXDtQF29IEHsR5tpcIS8ccFdayHKc+w5mi
 K6SNwZF7zlZv4+yoIZ7ENHJ8eq8nn/h9GZCbv1/usfIulw+f8FSV11QLr633iSyCrMfIj11+JEk
 h+mLNilKUqb+xRRrLiPeWEkqi7F30qUoRR6+MtJpUPt2pWd0Nn1bKDMLqTN/Z6McUBchXPYR1ww
 5tRTG2+u6aR9dV11PvCN8FTqqsP8+7e0hl7dqmvvE63RPqEPHBbYwMJUMElhKqnXO3Ky6y1l5PZ
 1TKsKux7RLftNtCjDFAxppOni/yvP1ROvq/ZPxkg+xqh8nRdFfUWMyLIBAa5PWZi1XdbXR/0gI4
 InAW6WZsW6z97ju48Gc4HecX/hCM9BYVTLYvGvCjtdA==
X-Received: by 2002:a17:903:90c:b0:29b:5c65:452b with SMTP id
 d9443c01a7336-29b6c684a86mr268933105ad.32.1764306339807; 
 Thu, 27 Nov 2025 21:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYfJG5NZ59k+42ZSt3Hm0ltG3rQQsZCieF28EnpH8Z8aRhgspolw7qsjm1QCtLJ6iPlNJzmA==
X-Received: by 2002:a17:903:90c:b0:29b:5c65:452b with SMTP id
 d9443c01a7336-29b6c684a86mr268932825ad.32.1764306339366; 
 Thu, 27 Nov 2025 21:05:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 21:05:38 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 0/4] misc: fastrpc: Add polling mode support
Date: Fri, 28 Nov 2025 10:35:30 +0530
Message-Id: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfXwuxUNX5Q6uTk
 +G/KLmszSroc8dUwu13yzvAmqH2z66NiRMBOlwkyzOWAvsFRJMj66BgHwdph1K2dtU+hFok7+PR
 vEblFpB5yoMaosznWhK3a2XYEaAXNjYwwjqiLZvqSbMkas2zXqaegjP8Tvhv8p8V8VFYMRtaQBK
 s72yroxIH6qPSNfW40MVrcNybmhmwNCB2FOJJM6Hpt94/SyOS/fSrjQUXnTflh8dPa6KoGVWrzR
 ctzAIBVS1ve0V7OdwgGxzblRRZ3pO+pgjbLs1y6w+ZXfqOn4Mbh2IfYerAhKDVZv9ly2qttQtg4
 U28qLhhFZ5L/hYpVuBn3oOqtflzJpJFUYzURfxeRwhM+aKU+oqImfsfeCLhy6wBoqkpWRZxnG7u
 rJIPqM0cRwLAdFbThh/7g9eiocolRQ==
X-Proofpoint-ORIG-GUID: sanwSsWCYr5C7-D40pZ1SZA0s_0bas9K
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69292da4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=66tqkxcFYQ9a7oDX834A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: sanwSsWCYr5C7-D40pZ1SZA0s_0bas9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280035
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

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v3]: https://lore.kernel.org/all/20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com/

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 164 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 151 insertions(+), 22 deletions(-)

-- 
2.34.1

