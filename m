Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F54ADB4B3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE6A10E3DD;
	Mon, 16 Jun 2025 15:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Haj0Tu6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9899D10E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8Tim2012463
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1k
 k21RgCQU=; b=Haj0Tu6M2xT442eQDTceNCrrrvqsloZgSta/oVj2dnQjY1eEU1O
 LTB7RKgx0Xpvxr05RSyqIn5AI/dRbaONgTEKXxarvHv3+kLXDbVWvTZR1YoZ/Cat
 Eva4xLN9pWtSK3+Jq4SCCnIf5dpDd5QTRe4oUMCbCJ1AiDKwGVJ8Nd5koS6xIyNw
 j4iO53knWFtI8XUsJjQD+UycKDrfzUHGsAmAVSo+iwfsUAuUvwxYOBS9WTAJDyTv
 cO5rgKLRLwPYzLLLHjSziU0frmFgOnQ9k47RpeqAZApdG0akwiLBULuOmbMA4Gkc
 wwj9iUuaSCyprJgLyNLqWeM2/oJEt4zKZYQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfd0h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b3183193374so1306859a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750086003; x=1750690803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1kk21RgCQU=;
 b=S5d+nQKPEbNRigTw9468eHOwX4s+xc48j2AP4pXwnbOv/Bqd4IOB9TSXs8/aRtCWHO
 XVdjSu2pOgE5rbHO2hEyurOJ4SkbXKEBYUf2j5pA6vwiPtL8G1hfI9t5ODVr15DXjUZ9
 eZaOc4KXPIDooZUVeZ7TIQKaB11GmEcON0MUpUDXiJKNLHpWeXNhNla2J5l9QW5jHxjC
 PxrMeEzvqYVYMhQjZVHtk+oKdEht5dH57z0daioaEK464KTKDQcx1ZlgLdPYHe58hONR
 kmreayCLeiLn6wxYPFG/AhCuZmWCW8KvJC19mkAlO0w5inQAahcYN0xpkypKJjnBJWCC
 alHg==
X-Gm-Message-State: AOJu0YxYHwA9h+Aaug10gFJ87/1pWW7dkyPjHk2VmcMLynyUlL2+8+1M
 SWSBl3C6ma98q02VnBWZduJvO9/h8J0WFCwCM1r3GmN6BDr0fFUK1fUtYYuFh2lhhaxukYVomwf
 WzOurABoQKfRI1XwxzNUeD+FaBDt8JCf/knOqW+LpkHbnF07fUyPytZ6L+AaB5MHdvp4tiBXFsG
 jJXT8=
X-Gm-Gg: ASbGncvOW/d1pAzeTi5NGhVGPTGU1HNGK02BP2atNPXUR93zFp2QMo+gvQYBl0+e4Ir
 kPRs9A7FY7kKCm7HKBGbGUD5Vma3g6Z1yEaWsMvfCqVl6ghZyysiyLkG7nW3gWJSv8SljSLPaIj
 f0LGQ0CNXg+zh6zV3zRWIWixHXxhDH1Y615JmSDY1NSMTFdgdZK4ZapHaCYEVNhh9zLOk7Gajhv
 yxPnKSVmw4maOzkRjvs5y9+Kvov8g0e1RpRDo8EN8tR8ZyWidlXJ6T0etM319VA0SEMOtaMeK+/
 /ncCNfqabh3VWq1Gi7LAh5/9mICYouwW
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id
 d9443c01a7336-2366b3c3897mr135205015ad.37.1750086003242; 
 Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByieJvQC5PoCbVHaqizg7yUTH2Fgq/z/jFnF1lZLOWUWRn/2Xz6BKqzn/JxUX+pb3is1aaA==
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id
 d9443c01a7336-2366b3c3897mr135204465ad.37.1750086002816; 
 Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb0fc2sm61892525ad.180.2025.06.16.08.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/gpuvm: Locking helpers
Date: Mon, 16 Jun 2025 07:59:55 -0700
Message-ID: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfX9oS3ExAMTuh/
 s2Xgn7hrIPs9lB4ZBnKZF6RmLCxF24VaNmhU88bk7KusTLjSODj9LeVGQNZtpQCacfptz7Zmq/G
 DNEonXpXTyz0/My4e+O2Z/6SUfbJ0aSrjlnBqktbeXf4dOsf3xk9BU64YYb5ueWjZSJhVm17py8
 GtCLEGtwG3tC3qodqUuwSRBopumq0a1h3NMTB59Wb723xF4cy5krMtksbTMWhAeNPrirA5NzoX+
 fhtr1N/WGwbZz5IoI6SrAYk86B3Y5IjyqzY7C5esxsdEckUyLw2kPNQhbdgzRzT845bDuxBAKBL
 CvoycEZo1kPPXgLGMr5m02ZiTQuomziVGYRjUyiTZkKZx23+4tUDeabGBsIiZFjesyaDCEQyJlL
 A+Yv5sRfNbJra5lnW5tDa/lNSLoGNFKMkd/SgHHKpERmuojXI0T1OB4eeODOEkXJKOxJ2/XG
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68503181 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: uxayYApGUW88EpamQSJTaVZr2RYbftzW
X-Proofpoint-ORIG-GUID: uxayYApGUW88EpamQSJTaVZr2RYbftzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=855
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160096
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

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.49.0

