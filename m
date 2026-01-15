Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4FD231F0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E6910E6E9;
	Thu, 15 Jan 2026 08:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7K9OY9L";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaOy9gkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46B10E6E9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fjdH1581930
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gjM0kaavbOL
 Ce1K3pLI5wzYI8dV9tn4xiVQbvJTgorA=; b=Q7K9OY9LXLBfPW2UdgGJqwWByaT
 tUOaOgB+54qFJ3fnanp5m8+lSTn+zP31zBW18qwyb57/vmUheE3sQr+0N413IEti
 F15QCJ210ELt5ug3bt1u00kkMhcB4Ija5l9N74t0Vr+FcNngJYwCVCYWXVO3DFdF
 yq+cJg4aXA8GP16cvGZtR200bJlodB98ZwWreYjqqSDJWMvzC2Y0ZgcjAmdOYvAN
 m1LzFj7X26khhLhMNzvqlZe/VLzkwOPeVZP1gSbmGW7N8HuqY/1eFJzMQa/LcM8c
 r2uQWqqrlkeTwsq1aOrzKqOEw24X2orFJUF91PebyfjnGP+7w8GboHuFe6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pst3n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c549aaa796dso1172659a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768465781; x=1769070581;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gjM0kaavbOLCe1K3pLI5wzYI8dV9tn4xiVQbvJTgorA=;
 b=iaOy9gkDWXqPvNU0MCPlGkJEwknOTHwnLPUy4MFHZYICZRjMARAiySZzMQ1wHRVLoa
 csbfm+wUaM2Sq+8VA0EqDEfg7w+W2hEkijRuQBUegvq41XCK1rzFyfehX/7ffsy/a/gm
 MDodDoFJjX42BEL15w+9EnXilPq5BBNO38x2WfVQFYfJS6dY26eEI9gNX6/mNr+XcNS8
 8qzO9XGroXmSi72PfLR7KHtWfEAbUD/NjDIemnqLM/m+lBXpCmCP2YL9f45lVk5CBWke
 NssAnHLQyL82Y7Kdd/NJwmVzPSfQzhrpnpUxbUNnqxsRx9877q2j4/5u3PoYXxpZH5a5
 75AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768465781; x=1769070581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gjM0kaavbOLCe1K3pLI5wzYI8dV9tn4xiVQbvJTgorA=;
 b=h9t3ohCvL4PeE7JaSvTkCnol9XWc/qISRm6SHAI80moz+YyvdVLhiomgqcG0S7SDtb
 4uCnbsBDJw8RJPs8rRBASHWXR6qls6YN14D/L6I/34RLWjHN3HY8QPLKNlT0JrcI5us0
 X+310XGDgiTGRgtvsT6z009NcNUz3A8H2WNgEMsE5hKuxjSMs9ZDuAEQwQfi1AMFHQJE
 zpKX2lhPrOAl4STuVGbpOM9/KDXJOV/2LFXlh6dCQAicNhjf2HfnFhJf0iqDqww1s3gP
 rtcEjb/WRnkmkJAgMYkFn6RAV6WSyJyil3Ay/MWy+lG7Nn0MotevPnU+QGJP8O8Mu9y5
 Kexw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0gG2Dgw3BlZ3i4VG3d6b4HR1dqekxDSVTVwn4+JCKgCJuVJfCZOaKPA2+C30dAYdlim9HJ+NlYQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzREMxAgSVc1RuZSSq/v9HC8DdwJy97WvI4o4ZtR8MtIm2xIAne
 WYW1noVGD0el/Yogc7QqfNd8r7ZtNcc6AximARGEHL/EukX50nxPOYnT3LM9CxJ/cnhLfQpETNx
 3hKrEjeVgRhJ2GjEThT46upzs2QuNrw9smrNjySqri15HcI2pOs5zETnDNtA1hB+FMQnxybE=
X-Gm-Gg: AY/fxX63Qj9nMDldDf55KvelNzk6c/4kBn6YP0eGPi9aXD8RmaZCbJdsbyRIoJiBWX3
 srhbLr6vWVPFVe8/9dZEyF/JnhnhdBHmu9avDjgBd9Bi5zrIdKCfTCKU7hYyA5kDZ1D4bVpCMQL
 ZMzYwwMw3vBy+B1wtS3sATOD6uh6Yh1zVaAI0mrIrhxqGOnlQIkSZpCnMAKRoxxMS52ulqe126W
 m3w2OxdhYchV62OGadyemPkHsoKAnDuuTewC14GH+7L5UTFEgjatJ1eF2SSv2dISg6eI72+YVrb
 +NO425P0BrAkZwlTqFCH1bTFmrliSPfODwRpFVzTRrU4rh2mKju2B5QypdHxEccWMyyTLM7f6WB
 7oDYNnlEPayl6uPKsB10ioPp4Whkm/teNiJhaiphV
X-Received: by 2002:a05:6a00:1d0a:b0:81f:1610:709a with SMTP id
 d2e1a72fcca58-81f81ce46f9mr4520955b3a.5.1768465780916; 
 Thu, 15 Jan 2026 00:29:40 -0800 (PST)
X-Received: by 2002:a05:6a00:1d0a:b0:81f:1610:709a with SMTP id
 d2e1a72fcca58-81f81ce46f9mr4520930b3a.5.1768465780354; 
 Thu, 15 Jan 2026 00:29:40 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 00:29:40 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, thierry.escande@linaro.org, 
 abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v2 2/4] misc: fastrpc: Fix initial memory allocation for Audio
 PD memory pool
Date: Thu, 15 Jan 2026 16:28:49 +0800
Message-Id: <20260115082851.570-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX+234NZre04bj
 tEkr1TEmw77Asx4IHcRd1v5Ju4I61eeMmkWfPWWKhKraXuzfOlq0joJmIekcQh6OK3oeC2gbUt9
 hfZ6NOHyrlwRHUJUkH/zWeHfHA+JkAxgHE+ui6cAvgSQgKuEhti2QIP8ci3DDdRhxqxKZKVzbZW
 t1cy3InyBsQm0MNCbLag+eDTz8UqW7mL1op9HEEYSwK7Ne2H+XcG0y1yzc41PXyFqyrXvsFx9d3
 JirC4gO96tnAaT4CyLN4DX8dlVHCIp6qlLfZaIyXBHzXU+w3x97GiCXI7OoRtcE35bUYZxXWrHO
 QxFwI6Erg1NDsMiPz0zU+CNas+y2COz9xuSoAnLafDe4K5+7itPQsVKxLw+Urz6v2K/fTVlDBfM
 bz6sDSg2LvK2nklxh2RQBfsIIoWOZ0DkmnJJlPR+BDL71eAHdGKmHUoAjK/8sN/H0YZBYBJnTSg
 dfZrEdOW8txszGtlSwQ==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968a575 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ZVl1zHRMohSAP8BG0tcl5w5ZdAEUT0Uq
X-Proofpoint-ORIG-GUID: ZVl1zHRMohSAP8BG0tcl5w5ZdAEUT0Uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150057
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

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The initially allocated memory is not properly included in the pool,
leading to potential issues with memory management. The issue is
actually a memory leak because the initial memory is never used by
Audio PD. It will immediately make a remote heap request as no memory is
added to the pool initially. Set the number of pages to one to ensure
that the initially allocated memory is correctly added to the Audio PD
memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 515a43c9d95d..4f12fa5a05aa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1328,7 +1328,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		err = PTR_ERR(name);
 		goto err;
 	}
-
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
@@ -1351,12 +1353,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 				goto err_map;
 			}
 			scm_done = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.43.0

