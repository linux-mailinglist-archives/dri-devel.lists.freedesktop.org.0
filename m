Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E25AECB18
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 04:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0797310E1EF;
	Sun, 29 Jun 2025 02:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSM9sqN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0207F10E1EF
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 02:38:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T2V72L021801
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 02:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=p/SPmqbpeLZua83wqEn3xcZI+3JQoReJBd9
 BLRDAAV4=; b=TSM9sqN1r1Vh0gZBKcM5CJVet29bKuZ0pC9G+ePvQNvEImYRjPi
 21hyd8+FfH+nWl4y8E3Ax7vC9DWKXnB9zRfJ1HoL9t4h0XL98zs+AoDdfrQJC26J
 Z+wJ4fk9upDqWw0HU0VgmDJ9at6PqbQ+FIhzzlPHRgor3aAET3fUmVrHzzpJ6iod
 GKlQFRYZe84cW/z7uKGnT9bJq6xJaL2YDHYOu16hmxcUZA5zc63vRGIQeEZz7TqU
 S+uUqyM8GLEWJlqD/U6KgyZWIL0pz+i84QtgX0RSyP0J34g6KbpGGuqpS1WMeHDt
 GGPhtCQ2DuIsWxEg4u/14l7SG5AhRzds7pQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fx9k37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 02:38:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23638e1605dso4802865ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 19:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751164724; x=1751769524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p/SPmqbpeLZua83wqEn3xcZI+3JQoReJBd9BLRDAAV4=;
 b=ecFahFPAwoKxg1IC0Qhktgxwl22FtRr+H/p2bmwCixGM2JBr/j6mpkC2/k5Uc1PuEW
 d7/Mb5yJYZG3S4mbzDCgXyNU8FAtdh8iSalmOgnAFJJ0+yopkelc9QmJPjiBYy/L+fQq
 yt4itb070SfkzzzMuXvqcKA12HoXGJ7vaqjyNfoMhGV8S75idtRXE1aYT9S3reMRvsqX
 h0jqGsZQyTlt52jGpKi2wh1A65b2R90Ba0hf7kLGdCXjahr+j06iwW8Mk7zWSOsTOj9y
 4CPEvCs1Sh8KbzMcIoj/KGBhzVTiJ0Zal8DducYn8hQg1BuY65Z3j1AEF164Rt1/XtnF
 LmDw==
X-Gm-Message-State: AOJu0Yxa1yNXxAac18QZkMxL+oJY0bK3syZuB2XUQT0k+TYHXV3k3wYQ
 x31tNfmBSdZvc+L+y3jkPvLict0ROA3WvplHzC9gxU/F9YzEaYlfwLhwiOd5pjgp+YJdrhYr4tx
 0f3hvjNrIE8LQ+pZFhub+7RqM302UbPCBKegG10dHncV0bLHHRcbCJbwN+ymenhW1jY6TtJU=
X-Gm-Gg: ASbGnctKAh+aJq5e3HFqHijTyEJ27JdkQGNJ7GWYLXLr7N2HqElq14OEpjSkAUcGqHc
 aPeQ4zOVtriZy7aSXdp6HbjG3fyHSYZ8pntyTt+6bDmivL1KnMQFnhBaBJET6vQ+6Uep75tzKJF
 3jFrCvb04FeSyQca3m4WBWxzBX8wtM5jKcr4NDkIEtGsS6lfXsl162y62yJorKovoCNhx1eKBEV
 pKyAabHrQcL27WsillxAZvcqwuBT8iI30Szea03vwlQ1AEuRyYh8NVqOHNulRDO96DOz0hqoMb8
 83hFg6FYLL4Ojnws7xXSM5FFe/E+dkV5sVEtwEDYKqHSrumROitckkbuhij+Z327b93Jk086fti
 5h97rGBdtG65t
X-Received: by 2002:a17:902:ef46:b0:236:94ac:cc11 with SMTP id
 d9443c01a7336-23ac2d86a0cmr123509255ad.7.1751164724466; 
 Sat, 28 Jun 2025 19:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr+6DJbaFlvCaIT69ugu9xCCAS7gPPWZYRHlIygX5JF152qzB84qx/0HTHAZLZ+rWeCd5JDQ==
X-Received: by 2002:a17:902:ef46:b0:236:94ac:cc11 with SMTP id
 d9443c01a7336-23ac2d86a0cmr123509085ad.7.1751164724048; 
 Sat, 28 Jun 2025 19:38:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (61-218-1-235.hinet-ip.hinet.net.
 [61.218.1.235]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bfdcsm50051815ad.105.2025.06.28.19.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 19:38:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
Date: Sun, 29 Jun 2025 04:38:36 +0200
Message-Id: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDAyMCBTYWx0ZWRfX2BKQu6EFcaEA
 Qj4g4buHoMF02MWj0bpa0QZyRdCZpRi0RqiucIliXxRZfQWE79ADl0rLD3z/8iFRJShHv/twa+5
 3J/xQ4ThPaFUlMxRtwK1I/uQiQZl+Go0cTZbkELSfWcniCCI/l3+Fx+sA7aYlGk5KYIkxVPAB6N
 6Ei3QVJqFiUpGvMv1R/Y60I0bcy6xWBm9KzqGPBIlwQhkeMDKxu3c6r9mk2L1tBM1T0sFJnjeZW
 FusFAg2g/r0w9nKLmviANQbLqbZeazbNYcJ1VLACp7v0U/HP4GcsY8lHyqITk6IKbqDiyUFOc11
 vefLDPvhaUfCnT/Nflof65kvZsv9HI6Pdau/E3b1RFECSf8mhWUUrTGfFY6PPz00Djl+oLUDXXJ
 uQMjXLVyCxAhHfK70pJUYuaOJsuUANgnjCYc1lOquc36aLtmNtZu3ZmlOyQvxDISyCEAAkeK
X-Proofpoint-GUID: Hn5sP_4HkPkMynaYW3XOxoy7EsBsmYRy
X-Proofpoint-ORIG-GUID: Hn5sP_4HkPkMynaYW3XOxoy7EsBsmYRy
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6860a735 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=T9uPOO+yMrmy5RPiWZCDag==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=F3gowxcN_wSbYo8ZTGIA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=894 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290020
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

DRM checks EDID block count against allocated size in drm_edid_valid
function. We have to allocate the right EDID size instead of the max
size to prevent the EDID to be reported as invalid.

Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8a9079c2ed5c..5a81d1bfc815 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
 		return NULL;
 	}
 
-	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
+	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, edid_num * ONE_BLOCK_SIZE);
 	kfree(edid_buf);
 
 out:
-- 
2.34.1

