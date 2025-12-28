Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E89CE53C2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20311AF26;
	Sun, 28 Dec 2025 17:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/F//Ujv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/SQ4DSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3011AEC0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSHEBCd2626804
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YkjBaOunrqEoX2Aau4llqSA27ldPBblRpj5Ewz68DB8=; b=T/F//Ujvln3gn+P3
 xOTPowAJSfTTwwFxlzL0T2R2oiXeryHK+Fyk1S2VBZgd/Io0JkZezo6cU2moSey/
 udFWpNHB54jXt7AEDoqh31Ruc3b7T5vc+ADw2SWF/Mg9S6ysnJuaUP81JYmrRCu4
 H9FVAxSXaT4Bzy0xLNEy+/mj1E6FJG4MGH1JVMBMY1BGJfQWo6UozKjtPnjljYkK
 UzA40jm1YBofWOfWF7bm3KI3TPGcWdAwnx71TKo2+nPJOREOPLkporxuoMlW04tn
 soEjaZKTAdzcLUwpsnS5diHPQB2DBYtCH11dq4sCsog0tUU4dJLryMgQg1OW67Gw
 EeSbYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tntp9f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a360b8086so208362676d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942502; x=1767547302;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YkjBaOunrqEoX2Aau4llqSA27ldPBblRpj5Ewz68DB8=;
 b=G/SQ4DSKwGfjO+/ezerzyz7bpQKeCxxuOfBc7oLSgiEuTkv1L/NAWd2uZRa4rUV5WC
 K7ubsIhWMLq3IH5t8JQY3ISt7rsWVBXKBcU0P8eSA9knn5VPu+TvBLGqjc2pHyOzYQ8p
 mwaO0H499dZl+jRzNK3knOQmnVLeJCXNWUD329Zg/vDcvnqOwF7JXoWfbaADe/zyWQHe
 oTq0hfUhEtle+bn1fcYNrRD4W+OGz0p3MsUHuwHA/aDbnRWb29skzI5CmCRBnrj3/5hm
 MaMHLv0r0fXC4UeWau/UnKxUeM7v4s0rhhigWTbEut9EZeeOypwuD5UatV3FaCUjs94z
 DS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942502; x=1767547302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YkjBaOunrqEoX2Aau4llqSA27ldPBblRpj5Ewz68DB8=;
 b=brr3/kDwjzZySS6aGrJ3c1FMLm4qGT5myrLfpaHlhGClLAPe6NIubYcO2VmZ278VFZ
 GZ4Q3usraPDtL3STkjePX6cpbwUAenQUG2PJLJogqJdbItxAzCO7+Dy2fdWsw42G8W+y
 1IKhXD36wuK42mBNF1rwpCkbfk+1r6ycPq6AY63iGvbNnBRumeCgrHn9uvEtwoDetG/X
 snBTjGfOg9PfIWXLUpe5ZUd5tBAyHXTJfo24eypvone/KVXi+AfqyykMKcMYYD7RInJ4
 jIn2POCrCf1pZVgv5dVGYDbdp5yn9hHOCNugF4RQH0o/Jn8qqg7GolhZhByMYvWpm68q
 mtaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO6bIwthEgxO22qhKTuCMPFlfMea5YzkbZXH8WD5S6C2cn5GpMNrcQ3eC6oqf0zcXFO9adpMY+vMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/IaSeQfMbADSvkS51H0kMIoN1Sua20PkFucSICBzVRkgTz0AH
 ArtPNUM2knWVSA0MLSW2yr9KvAQr5FJFPr/rdj9NxoD3ts434ffuvIeAhtfDbQufr4hAdKuVfhT
 DltVUOefec9pLE22h3di734sLmEOQ1ffw3azb8zBsP36USsnKe1iXSF+y/yxtukSxxFE9NGE=
X-Gm-Gg: AY/fxX6fjwwQPPnizO2s9VymgZ2zexw8v/3Jr7kssjP4PUNCWjdsjw/779tOlbA2j15
 nSKMN4OIDBiFfSUQ3kh64l4Ba0/IDK3nHRgCwq0pKf6Kq4BYgO9SXrIs9RBsKd72klsAuUkIGEm
 B6ZUWxI2ggy2DL6QJgDVHrW2xsEAdbpFq8jjSbCE+7CuXHs3xe85sBr2kRnuJmiPN2euhX9Ibqw
 u3cjK+mrFVStQ2nicbKTNV6yXjS07/T3iPXB5UldkdhafxAW1iLWXTeLyCRN1Aa+SgnnYnSVWu7
 4qUQdZxjMoAopnaO2KZhU4QALc4RlsH3Iyrsuy4FGMOzBLvWVwmE7qR59+Irx8pOkF0jZ1jDh7G
 jLPD4ZPbtgZ3DUMks20T7k62mV+GHeLN7vI5cG5d4T4QNBS7dCbbxK9bwRNGQx69GuuE/GtQmv9
 PgQiPcqwYZy23Tn0nPZbDfolc=
X-Received: by 2002:a0c:f807:0:b0:880:501f:608 with SMTP id
 6a1803df08f44-88d83983b64mr336330966d6.46.1766942502093; 
 Sun, 28 Dec 2025 09:21:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg43kpYtqQZC5vFkhsCgSUI1Pebt5euGVk/sNLrkaiCbN3dCq7BIF7cHpcCE/NR34DsmS7ZA==
X-Received: by 2002:a0c:f807:0:b0:880:501f:608 with SMTP id
 6a1803df08f44-88d83983b64mr336330486d6.46.1766942501641; 
 Sun, 28 Dec 2025 09:21:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:33 +0200
Subject: [PATCH v4 1/8] drm/msm/dpu: don't mix devm and drmm functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-1-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N79ubxZoT9CfhEWVCl9adki2rUcnDYw7kQ2VYonzkiU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZgumJldFiuRbQyP4/3zJUTcu747q2+ukG72IgpoPrMo
 t3GCgqdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIhhL7P+X/QXtbmFRSF3G/
 enRO6WLlSfcCx4q+Dy9WTttzNlYztvRzWNqmu2r2XAl6zAm/NtvMrpOuli368lZN7r1CZeFtYxl
 73u+SLg0r35oyiRYeVDBn/NxhPMlYKaRyfnlYmHZk9yF14cQdG6WEdn+ZGzDnd2bk7vkGV+U7FC
 0XLeqb1XfGYWrVF9k4NofewBzWj4FfvS+tVFF8v/lWXmqagcOFKHPzq98XPnh/+WV10FmeS3JF3
 y2OqGdHfXrT9CK2fe1UyckNDHLs1y7nfOmaXrybP2TV4RO8e050r74mWe0/obqO9Unq7fMqm5gL
 Ag/yLp+jbV6hfFZ/3VfHkCPWjeuiz3+ZcnzhY5H4Q+l/AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69516726 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LvVPTXtSEabqDirTlLwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: tam9M6xtON_pXw78juR_baU7qWenv-g2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX3pBCwOkg0wsA
 lumnL9dwtWzB3QLt6EcpstShooFyQ/sirj6vjQHLtf2thwFznHJLv8sQCNc3rTXOEopQDz2RmQ8
 Gv+VGelElwTjKY5K50GFBXuBt5wU1RYaHl7guu/M1FYbPxrp6QFvfzF9FDe/jFPwRbx2Lqk/WQh
 lP3DqMPNmgFQieLRsU82FATPi1tANb9NNK4jwFGGwNlpILtKVU7+9cJYMNftUTYzCcs7ln/NGKs
 dzdyscEI0HKCptKoJqyky39XqaxLTb3i1mA02q2hGnlyAHtS3pFo9xcn029yw6GRkExJYQ5Kh2E
 8XVWW8ty/XuzXvLc/2LGkIXjtTpP3QMfVaG82qfwxwwQkmaq+zV1FFWOMLJJXsVX/l5ix6rRuWq
 xXLPnFAUHJ9/6IbnT604qA9Sv+gnI7Yh0dGIt9PutUY0vyqtH8eb4U7+d7DoneSVjkFqZf5tOfy
 YRdHay5bVnkXiSSB6+g==
X-Proofpoint-ORIG-GUID: tam9M6xtON_pXw78juR_baU7qWenv-g2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159
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

Mixing devm and drmm functions can result in a use-after-free errors.
Change dpu_writeback_init() to use drmm_

Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..6f2370c9dd98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 
 #include "dpu_writeback.h"
 
@@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
 
-	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
+	dpu_wb_conn = drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 

-- 
2.47.3

