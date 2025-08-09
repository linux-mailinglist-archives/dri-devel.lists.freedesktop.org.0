Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778AAB1F17D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB10310E212;
	Sat,  9 Aug 2025 00:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajZ4qw3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32BB10E205
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EjC3U022422
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Am8SRRlpRsUiuuIqG7X6GswUkVcm4QHsls9Y8TEI2o0=; b=ajZ4qw3AVALeFnVG
 wAats32HsPCVnTKzz7H+3cKxflvILAgpCk73BXH36NbDo8xY5ASkKU5OQTfFFvLR
 6RX4p0TkPWKIm5YejoixVToByFlcv4rGv47avigjYFcdDfTY/iF2xLlwC5r7yJ9T
 Y7Gz/JL71g/fELB/ZtVuxggsYOJDC/rfXxLOESu+FEa6BwA9ZFbuVpjaps18kSAL
 UiH9IFGBSxUCBZ78BQSGMS5TXNe3dBkjVNgDTRn8YRV8+K+0kIjmFz0TrChSU2Bj
 rkb0TVZY0AnzQiySz/KTjNlVvO8cAz22/QFZO0gv4gmMmGkZ4IJwbKjTNmzlZvZp
 nfyDqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5ndtve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so4176090a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699737; x=1755304537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Am8SRRlpRsUiuuIqG7X6GswUkVcm4QHsls9Y8TEI2o0=;
 b=Ao1PJ4rMV3jBgU9BdE8yG8rL+CdPzvdwqxVYnwni4i9JWNU6S9opaaxYQ9YCtTvkw/
 6VrnkbwK3bz9slDBgi5yNLk9XXOA8XQQcRndBQtwB8Q8/BvoFTMkStohP+J43vLjOVTI
 0Ow6r27j9JHicd2v2xoBs8FmVDSSLK2f1hWKxXUF99+5OTBvBNYVdN+Qnp47S5XhMo1R
 aywuacyO1eEjDYqJ+PpgQliqzLsOvPzbSLKQyjonv8uqvQQEIafpiSbtNz0CZL27GQve
 d429bXSdDNQL+jKj/iFCSJffqtVBR2LVYgPk4/ckR4JfXkFIkwGHnJ+ycZnXM2bb0AEe
 ac9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3wujgLc2gs+3hR99oEX89KVBNFouIMhQtd5sgJZnZkD2I6vZAxS6HR8BsW30KgHgMy1DcsR9mIEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuAaojaOYVROCtsUkO48LB9Vm1Zj/WjOFRjX4ZVZcS1bKsjWhe
 B6Pple1Fe2gbAa4Gr2YQARjXvQewwwKTCZwtS8Iof0Shr6hJ6jK3XEkyTYgPsF2yCUq1EXpzZmw
 klUJr0uGXfTx7htNDeN8GAYfZbNpPAtpSvIXBUm0ddOYPz15Dm7RzL8K9EX97F0v4CnE0iIU=
X-Gm-Gg: ASbGnctj94Z0/0sXDdgcxu76I/kN1F9Lc5vqzPo+7KrhLoxe2JbyYIcY/9tlQzS+CsY
 0ft9JUKa5omiTUXND0g9+yHqzRV9UP2Ih3Jlo7sBga6lA7BTVAY6o/QVx8DfEVFIoYzN9viC1Sf
 fOHc/W1ehXOVkC6nG40kapca3JLowOCXwQdKB6i8a9Cl+tIFkO/oUjz+KY6Nxm/noeAo7toPGuA
 F+BPB75CiuwZJx5bol4WEyHUKXp8SBvZNDxy1ls7nWfui7HA5C7UDwYXfpTieX0S2IxJMT46one
 1T0dB8jSIbVg1hquwPGZ+4ktJ8KtjcAQ7h/n/lw3Yf3rRyxe2+ydpgWXjH1mMAP5ZXGIshOWGux
 E5pIORpP4OLsRTKnfpL4J2Br3
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id
 d9443c01a7336-242c21fd174mr54617565ad.30.1754699737430; 
 Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKDv8apsZallq/K7ay2tvwcFTR/tP3fr5zCSv6TlMV9b4Q5I+msieWi+8RSFY9p8c2K/WIFg==
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id
 d9443c01a7336-242c21fd174mr54617295ad.30.1754699737061; 
 Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:36 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:13 -0700
Subject: [PATCH v2 01/12] drm/msm/dp: fix HPD state status bit shift value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1021;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=dlkqBGODh3j3sXW+PUd6RTyGAht6wmJhJ9vt60MBI2Q=;
 b=ijI/+bZvfr7WaBEdK9j7OTWq9Mt0uUE/lrcNkpvprQoAvNK6hxioFg/i7npV3sgZFasfJwhTe
 2rPCFARIkY5DEARh6P00mQa7MQ5/83Lu2BVkZld78HPNmiSTf2FE6Qy
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=689697da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jiMY0BZLP9KyD5qzzL8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: CDTEwln6i0-DrbkgnA9VQVOZX8EUOcrq
X-Proofpoint-ORIG-GUID: CDTEwln6i0-DrbkgnA9VQVOZX8EUOcrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX7Kxa+wNMkewO
 137d4RIW0Tf53Cr+mX78EP7peLiV83/wt727BQllM+TgPPkHTOC4B9c5PSn8Jm8bRReAlH1gXN2
 e72XxB8KKkQ9z0IxmoC4vj2OpRj3VTdtPOlXJPxjJSQsVSiw/h/lLiXMoisUm24RdK7lV6M8jEs
 OIjbSbevKXsj0siElnZTJS5OiCV5sj9umN2Dm+fxAqh2yEY2LLlxN8MqBsT3fwuoeVrz47WOq43
 xlUiZa8m11eJd+cxzTacE1Ca8+T4ba/3S2F07XFq+JuAQER65mzYIb1aOVi6PyNTYxCYPaCgtf6
 /3Ck6abMCe4gKKddXsgagFalc9Qg4mKX3+35xLkQ7OqYz4EhQaTjyZ2DOZsKlQS9LhjW5QUnR6O
 i0NnKxza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069
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

The HPD state status is the last 3 bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..b851efc132ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -69,7 +69,7 @@
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
 #define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.50.1

