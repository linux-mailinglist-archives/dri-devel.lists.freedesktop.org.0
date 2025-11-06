Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCDC3922A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 06:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93F410E0C4;
	Thu,  6 Nov 2025 05:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVuEwHUU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYnNtVFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACC210E0C4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 05:08:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A61O3p82798824
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 05:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=r8L+4z8APhk7U2v3WAHFQD2xA6qb4gja/TO
 OH3ihkxg=; b=lVuEwHUUTQ7RPaToFb7JlKKPvAR74HZAzJw60/9R+9b6+huNx2F
 YM+FKckiFOAHyrhsdywwvuJQ9muXCCUX84NF3AmrZZQ96a8QvqbwwlKh5BRxiQH5
 TgSslpmbAER3NKcp7BljLHlumdjW0G2S7LzqMhS81i7CCz8Dkx/OFxb0j94DJ6rZ
 n9C0wxOmtISuM7jZIy6/8EOAa/1cAFp/l9JEcUVSNWaViP98KitgUckb+qNBYTuJ
 WMjeXZONHmoeXJExP2iHvSmHM/7XN+io5CAHmJKR+ZtvwgBZ3aOJUfHG7GRYNUFc
 ISFi+eR+WrfCvP9SW5trjQ9dyFQdvoa4oLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8hytrgsj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 05:08:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2955555f73dso6091795ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 21:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762405724; x=1763010524;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r8L+4z8APhk7U2v3WAHFQD2xA6qb4gja/TOOH3ihkxg=;
 b=bYnNtVFsWj65PotwGrhiFEFMr7ZDOnNuhILPmNjPaQDeOOyqg8zCuzhzkJtLj02tYV
 XXly01F6pLaETolLF1htiHYvPs/f8epCF6n2Iqd5mgpD18nySniqXmKm0cxAHJ1QhmjR
 0UrIMI2flM1yp0CRvwXS+qaA7QFzqKWjLK2dC+BszTOifW7RKWSkGNc7ibLIvbU7UDmc
 5ul14xfAW30H+gRFTOAmVazBSsPxuUU+pwFG6lL/k+d4C9+oLv7y9vT2Yv/XW9MF7GaS
 mqqUWD0wVn8jMZKDeTmrsk5tQpGhh8AjzbWiuCWj0pnMVMtaC6eNaXE6FnYmUSndY+ZI
 rrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762405724; x=1763010524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8L+4z8APhk7U2v3WAHFQD2xA6qb4gja/TOOH3ihkxg=;
 b=rtH62EdJjP5YbPRCSZrdOAVowGByM334H9rBF3ZphHaRyQzk2KkGHGYuIcNzcKUWj3
 uPMdTU0oNOSmqo99UYF8i8Vrph9a9w0tKmb6SilhPzS7ThJKDlrhr2w40ls+mHIVoU5R
 66oowaY2HHUuVEL9uapHL80sxLUk5MuIlzcFQHbiG7QmCezXkcLPUgdHvD0qtFhS99iR
 Orln+AEwQ/2aaWgSb0XSSN/Lq2CXuhsaUUEZ+BwGMB0wiWZ+9rwetH5k4WEllrQ/YSpK
 sJhPr8Mc4OFfsiGoDdxY81U06e4xPUuDwDWgktxA+thRT/05YduF4PJS2j1Kde2KFvpM
 hUNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV47bT+wR4B4d0LrTRKAgHHofUlBsMpKAaCr/gh8UH536o3iHH4Pz7BokxeeqwYoN8gL3VcevcGOqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvpVJ7vjY6L8ejD/zDdM3vSoCfzVXXVTJkt23n8+hNZ1+fxbSu
 5avsuPzCDbg1AZ4lBkh4c6Cno3V/GHNV29n1NxGz3eR//ZgGtAaDiT5DGc1GAJ38CU+ZXfg9Saj
 LD873YN5rImTo6a3iqjbrzndEs2N/256+d6/gSLa/M9sz2jc12z3HSyoqGQNuZggdg8Rlqi4=
X-Gm-Gg: ASbGncvXpSjeNHCNAkUKHFs9d+v7rSi4kbv+b0yTrkoJyu6ursIApfGtxrYSu6fF22W
 DtPl/i7PYPsZd1/7dOLg8xNPVj+FfEi1tNM+mD0UJDxYPHqeLcTS4OIaxeoiOdjdu2CC4uMrByX
 tMO7K+/Xhc1A07WqkbNMS8alNl4ubSObjzZJywUJoUIVFLiPJsF/Y3LlcS6Hgor6tQsMOvSJxrg
 HbP4WMT2HE2wrb7LpGUNIuV0u711kj3VkYci3nT5g5afH7HGXZgty7lvcvdDyuxrrEXVL2uzHbg
 k9/WkAujsIn5bX5+UzFFpy5aLLAlZEu9EYbnfzd9N/U6rp7HjDQkM0DlruNIA1L4md+vPR28hjr
 BqogQ0E0Yy28QQ2+HdfzlGMyg5R176vM=
X-Received: by 2002:a17:903:32ce:b0:295:8a2a:9595 with SMTP id
 d9443c01a7336-2962ad88c0emr76617635ad.39.1762405724036; 
 Wed, 05 Nov 2025 21:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH2W7Ox4LBdRQy7Jqcvx8fvhElVG278cxX9vJxU+qzFQyiFeoBJXgP1NGiLANNDtXNF5uegQ==
X-Received: by 2002:a17:903:32ce:b0:295:8a2a:9595 with SMTP id
 d9443c01a7336-2962ad88c0emr76617305ad.39.1762405723578; 
 Wed, 05 Nov 2025 21:08:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7af7fd5238csm1185862b3a.17.2025.11.05.21.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 21:08:43 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 0/3] misc: fastrpc: Add polling mode support
Date: Thu,  6 Nov 2025 10:38:36 +0530
Message-Id: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MKt4jAqL8gYyh0R4kcwuwuVZ9yG3C9t5
X-Proofpoint-ORIG-GUID: MKt4jAqL8gYyh0R4kcwuwuVZ9yG3C9t5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAzOSBTYWx0ZWRfX/tJMyKcOKMMi
 SUFLmKMu1cryoKpOlb7yXqORQwDuTJOQgIVObvbCi6HnqDYL4bQD7zGp8StGaPgTAIt9G3HJaCI
 4cyCJYFIPuhEwm047vOmPMv8na4fUrZs0WG0b9kInRDPhY9Q9RGwFofwKOjJLp3GBTGvtQN8HtX
 tw+LYbqQJq+FF8lcsiC1sTVkXMS5NoYtlX3UNkhybAKri/LuK3izXDpgWx3fu0nmqHzKkR7nIcZ
 yDU+Pyfa5turNJHPnWHkRH0Aj82o6LAX/yUBlS5hGhVPLng6irPdUqLTWlbq1ci4JPIgtG/bVBJ
 dyVa7mwCWMO/Xm4pVY/Evzs/hRp5Wj/x3OHUESak+exb8QUIm22KH+Ox+HTsifpBUnrWzZzgLl2
 tYFwU4CjQq5LphPmPkoDOIs6Bptr/g==
X-Authority-Analysis: v=2.4 cv=X+Rf6WTe c=1 sm=1 tr=0 ts=690c2d5c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dFrkBzGdCdqBpI6tlPwA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060039
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
Patch [v1]: https://lore.kernel.org/all/20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com/

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (3):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Update context ID mask for polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 163 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 150 insertions(+), 22 deletions(-)

-- 
2.34.1

