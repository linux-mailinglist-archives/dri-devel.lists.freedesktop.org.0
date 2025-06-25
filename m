Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52CAE8B94
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 19:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A6610E7B0;
	Wed, 25 Jun 2025 17:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgH7mbUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2192E10E7A2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PEZQWk011686
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
 uErvpeQ4=; b=MgH7mbUOHHW/lCffajxpilJA4qxUyYlkCLaUuiZVb8aCA7+T6Fk
 ApFjTacpyfNDUEkCVTD/RUY17c+GfU+k71KWianbgGvyPooE5tUO88cXmtk6iUwP
 EhMnT9aFRyMss5zu8jaJaIlhKEgnCs/MLtK3Rgxy7R9lCa5HhtSpdfOf1kHkrJXY
 rrhTb879sZiDhCLQ5bOpdHRFBytz0o7HdwNa3/oPQAY4pEcscwtg6oI579IWj+up
 lHLYXhcHezStN9vNbPXXe5rwgCXHgYhNbrfaEaKCRQh2TqW+xpnDGZTC45CUK02x
 rOSInZa4dzgzWZfqmAtAS3p3W5WQ3G6DZVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggs29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso102730a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750873039; x=1751477839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
 b=Q973ae5emuAvujJfH/ep8tHHtRw8LKom7wLk1mkLYOWVostVAAVIO9sVTnIADE7Wh6
 IKKofdggLG8N2fiUP14nJ2kmh32/OMBCT5RZL0RTEdYeWIAm6aQtteZhWjdbCfxzJRJW
 hyF10lTImeSxtT4T2oF5UmB2DUVoiTeC3C8a4lx629mfLF1ZkUpSW1/JbF8sBPCfbwvD
 d7wULDX2mvKfpinNZKyPbh4gtSgFQ/rMHR5IGwU5q8YPe9CQbw9gFu0I+blmvJRLvJNe
 qJNY3Z6gQUEwOeaE41A80DwsVt/ThiyWeYRZFtN0FtS+BAuWKzvWeoXbTrto8q+mtHsg
 LEGg==
X-Gm-Message-State: AOJu0YxFYZfB2wu6a5ynDXMRvAXOy0EjZOEEDQOEJa6Kef7VmcVY/pa0
 z5aQb0NSKfi7+ZzjWSuM7pZvJBYiNMgC9RbEic41jD0X8XWW8tIKElkV2pY13C7o7wl/joslTaj
 L/myhcqf939ugyvU0pFK9NHlP2uAZmJpgA2oJVzwhZRF5atbDr69O5OiGXbRE4mnAjaq7FlWyNb
 /zAlw=
X-Gm-Gg: ASbGncsVMvFcLz+7ZKBv/SyiSsqRhXJbw3d6o3xHsC8DcBa9e6uwPq0Di2Tl9RFbzcT
 SjKaobjo7J2C6rbXx3M/Bb8DRgfvAFlh3KJAAjJPw2NTQJVzjA+u+HGmPXLuXoqPOP/JhL9/1zj
 THvOsR4Iu8h1BK2e8bXBH7fg+Q808ZMgbkhWunuV+vPhOjfvZ0Azn8eYZpBY6wqWIBtrEvh3PPa
 l4sL1rc8VJr3jmVB+WQNu87LDAg7Zb1gxQa0wT+QMwOu2TzWsjR6HJkkqNTzePuv5A/kc2m0+RJ
 wwtYyohUWE3uGcCmCT7/IYeNMZyW6/s1
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id
 98e67ed59e1d1-315f268d07fmr5817779a91.27.1750873039528; 
 Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMKQs3mspG8y9JNMpqoIf2y+cWR9YznGJpkP1ouykLoRzvg0upnUv8nTz+gS2rxDvr0WltPg==
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id
 98e67ed59e1d1-315f268d07fmr5817746a91.27.1750873039081; 
 Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f53d9098sm2219224a91.31.2025.06.25.10.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 10:37:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Wed, 25 Jun 2025 10:37:09 -0700
Message-ID: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QEdCS9KsZoL4fOQhQe92O7QkXlbHgCY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX8TyfqgdIIVTf
 BsfZfdfCzeaa99ySGPcbtrIT91A42orX6QZuIpUdkNx9+Oa6GJ9C6e3F8HT1SfrwK0VfqN6+o4i
 tt1JfwE/gV8+l/TkpOXnE96vehSs/NLDSfidB77g9P4dzpoao2Kci0pzQRzDWhyQSigb+o+V8Nb
 98SNfgz/dBSj5TVJH35Ahw/+mOYPCFcbG34yqXvcfj+hurKPV2yzWLQzyfQhCaaPL3fA9zomgsf
 EW8mzZr+ZV3Mj2B5IqDObs59+B62gmPmjmorubTh04B4DFv18toRG1CeEXiHpYgVQvJSkjf2pwG
 ZEc7Y21Fj/gRnOpI6FltRb4am3cV8n8ax9Qz39twa8QM/0PSqZZAGXE9fjV9kaCIOMz3xNgF1/N
 4RC5UZ+/VYPNvqaAzIV3FEP23GPvoUfOsZWdR3fYF/2dGlPFPcHrtJlyOLRzLZfnKLFXuWkO
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c33d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: QEdCS9KsZoL4fOQhQe92O7QkXlbHgCY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=963 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131
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

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0

