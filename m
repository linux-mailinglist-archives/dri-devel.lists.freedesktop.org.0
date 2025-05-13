Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FAAB4A82
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 06:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E2F10E1F2;
	Tue, 13 May 2025 04:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPh9xN3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B8310E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIjXXe019935
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=/B9yr710kPUz2FCgJIjP6BTbuVzSWyCLgI9
 V7LIFO+Q=; b=pPh9xN3T1xK3otRbpft1PFc/2Bzr/8mylX1RawIdIeu3hJLfgb0
 jdvaKcvVTj8u5NPfhU1IiJoEKzEjqFzgsF91fnBjmHQzzWj3AJ/eT1w2x1BB7YNy
 6g3ceKhhl5EvSGtnHc48Oz4Ad9fCW408pshMvdYBxP6bjxqo3pzCWnXqPrMxtPoF
 rCYXk7kiO+26pck+FDPalI6ItLLQcayRSqVOtml+9FxhtQYqLgW3nOA2wFJiSj/9
 Fmbp5oUWZlwqRLRpogaOIDFRg2KJ0zST3kL7Mvmao9JjTPJNYV7MjOmyB+Tq2qAR
 mPoINexeP9nPZxcbYgbz8DrJjd8SOU+0mKA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qeprb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74235ee893fso6126804b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 21:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747110510; x=1747715310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/B9yr710kPUz2FCgJIjP6BTbuVzSWyCLgI9V7LIFO+Q=;
 b=b5YbLlh00AgMKkG4HyrzJSqcu+xegAjOnFmThXgzd5XrO+gxgrc9EzkctYfRXXMeuz
 n+tmgg+NQh/Aj+YfyzKEylTeN/q2W7N5ui+qTZaPgqCJBgUaObZ1sxETB38Y1skaQUDX
 jz48KnBjQcrUL5e+X7UCNwkjtC+qTfBgFZXHtLTLPxOxvp85NLkD7Y++G5tYv1N3Twab
 U94xXLy9LALStpDF6Xrm8bDKs7pxFknLYLjV2OAx7oIhmOl9EDVwey0ctib9KSRLvdcQ
 nSWWLm31oHbnqO2Zdr/O6XFG72Y1ToBPPkhZ2BLI3lybax9+j6xk+Dopt95lpwRqi781
 lxxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdmwIBMNG3MLcQnNd7C9Aq6nNVw0hTuaoUHVO4Ir2NWZPdjhp5JfdL7FQv58PDf1vghHZztxBFzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBEJGfBuutilqBWiWD6acsOu1vEQ2E2f98VEqrJTgfElIVcqwq
 caaJW3YbaOQFq/5JgX0ePX7azWDuj9+qbBf10awTAG3dmAPUl3fXPYC5hOZv3JuufyxdO/L1M4A
 Xxnlhbb5eolFdkaBICvnzA4HPMmXzo1lUlzMcEj1D7DM8UGwm2gQJltOamU1BMFcTVi8=
X-Gm-Gg: ASbGnctTZccme2uPuq42nTy5RREQXKmwoWRh/6kLTcEZuFHneKg7XFaZjmLk7ypXeYE
 MVn/75+bXkVFK/pIwuJXODvsLDEmvuSxz2IqbL5Eoa65yM/VQXiyP+ufn2ODAR55ZGS3JZxMfgG
 tAmh35xA15TZVz1tr3Y0mCo2zwZ/QA7q+5LHIGz0kvgUxtG6ExNL08VI2JOfnZgbI/dFS8ISwTf
 upUCjE4BvpeUfK3GFCYdd8vn/vFgW7zZZxtjGdXQs/PVs1cSZlMWPMoSiUbKnU0S+h7NO20emwu
 Jus7gzD/+D+5MA8U+gHaeGqZa8Wcmm2YMjiRcXh9mZI6
X-Received: by 2002:a05:6a00:a13:b0:736:35d4:f03f with SMTP id
 d2e1a72fcca58-7423bbeb32dmr19989913b3a.6.1747110509815; 
 Mon, 12 May 2025 21:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE70Gr+yrpOtCcR7nL5udcSWL2S3FfHHIHR6OnyBoeHKME3UXPIKKmiDUQAqePTdJkn/YoF9A==
X-Received: by 2002:a05:6a00:a13:b0:736:35d4:f03f with SMTP id
 d2e1a72fcca58-7423bbeb32dmr19989890b3a.6.1747110509398; 
 Mon, 12 May 2025 21:28:29 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 21:28:28 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: [PATCH v1 0/5] misc: fastrpc: Add missing bug fixes
Date: Tue, 13 May 2025 09:58:20 +0530
Message-Id: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=6822ca6f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=3nwid1PSdH_ZJRXHEEwA:9 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: D_aZH_scOhN6Yz0fph2nX7lso3PUsqxe
X-Proofpoint-GUID: D_aZH_scOhN6Yz0fph2nX7lso3PUsqxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfXyIXDOaugHJQD
 jjghdwZfnFt6EGPbah7whrERTE/ZkD+izOMl6x0nWsxY0wOXWKBbORCA6O4Jzn59/KlGTPqMPvI
 2lxyQZJEaSZG4xWwbW2QmpCOh7cwmRqtrfrUp3JxAaPpLwg4QuyxnGSWMB8DTJuqQaIwWGVrV0J
 JxYJnXT6nlCTODE7w6vmfgrxrpM/enSlkA1JKFg+GY2u6Cq9xOiBF1DH0H2Y10W6SWbNTNu45Zp
 TVPZ/Jw1bdOFXBTyyA8e4wtzlJfw3dbwMOnhx+PvRVYEunR4JNSZyWxouXFgFZAUgc1862QI5u6
 AvLZLQgBgqGtDmWLNVL5yCdveI0tZIB3Qqtq15jlaMZpv9LfI7EJRHW0OLBo4rj0tOFPrAWa/3z
 bzIla6J6efsMhsCvX7HuXEf0y3joh4kuUcEFDul128laT7xu9c4XCdzskSCGTXD96mPmGY2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=760 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130039
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

Add missing bug fixes in memory areas. This patch series carries
following fixes:
- Add proper checks to fastrpc_buf_free to avoid potential issues.
- Add multiple fixes for remote heap which is used by Audio PD.

Ekansh Gupta (5):
  misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
  misc: fastrpc: Move all remote heap allocations to a new list
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Add missing unmapping user-requested remote heap

 drivers/misc/fastrpc.c | 182 +++++++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 36 deletions(-)

-- 
2.34.1

