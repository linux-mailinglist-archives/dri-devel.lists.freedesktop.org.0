Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37CCB2E92A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 02:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE54C10E839;
	Thu, 21 Aug 2025 00:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGm/QCW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B0910E83B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmQci005374
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7GonE0I4O86
 IMbS9YwA1nRfKE7NxszsWoTIBBuaYOXQ=; b=oGm/QCW+yDsDLwFUlm0BTzAsCYm
 Q3CdZT4IjuaTN2G6iLwc6GW7VGglHZmkUZukV92bpXX4V5kbGIC76Cu9ZyHPWlmH
 DuGjCb+i//M4OxZdUvRD1pL5ypAUeD8M5AjOxq99w7eCKNNsIOsiEVghoMtWOkRO
 UsWIDXmuauwZPcQlh/xrHB6izFBDSdwBu+lAk/C9SkLgvc9/WtnBb7VDLGHORcjI
 XEHLWzbMzTZKuh6Fd8kuddbByOwqHQJVpnobWTOqftGoy1X1qwk9FfbwSZKoinQ4
 O6rEKr672qi1+tVLsEDEZ3NCRbVZMiSvz3A307bdxB0VdjWoB36PWgWuBxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293buc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-323267bcee2so443241a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734676; x=1756339476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GonE0I4O86IMbS9YwA1nRfKE7NxszsWoTIBBuaYOXQ=;
 b=Bq9zLJOq2I/Za/G+DDsdrcOaIlC/I3iLRR/tdt8gsyxWuKwknuN7JrJJg5TyP4a8F5
 nM5FKr7umFLfyxYFDwPBxin5aCCrnfnD/Tw9+qpaCj3tMwZtZHtCTHMR1Gde2PyDCC9g
 xE8NQNFp62SJBMnNzYUWFg/pnA5TxVo/c2E0cLNudegXQpHx+RXKUw4Z2JT90Fl2pGPK
 8uHg1lO1s/4AlKVzxCb3jt4moHgmeyQyvx7opxYHVM0Mwr+CybPsY633dNuSiKO0ypcL
 nA4AjU8+H8g7Mpq4m05nbnv2mhTH9ihH/kJ4xvMrWs9/MLA5p1FEuHNHb44vcTsr0X8+
 uGQQ==
X-Gm-Message-State: AOJu0YwxICeAniN+KEZlwG7kwS3qRdN26uYRLbLZbPV0ARxvh7N91wMY
 vltlNG10Lz93zBgzw19t6ajS0SWXomxjihPsuUIbEm9Q99X3feeijkcWhQGGM5GSdBs/q+sMI0J
 Zm9vbaHrseWBDmjBH7p8miumChpILNWELPxP2C70Ut04aZyWEZdliPkDSpk0l4oeI2s+DaNNnBu
 NPh7E=
X-Gm-Gg: ASbGncvzwyNMiNqn8S6izuB3IXrvAlXEBWBpc5WU0vPGBPUV/MOLSHE8hzvxgsT9z+f
 ztlO6SpXQRyHeI85v6CvsE5R/2Rv2aZvRPOIXTf1pW9yMscXFFvlVy1nHTwSIIwVbHIkW2VZ4Nz
 V1M4lxpPTiH8cu/dY82s5vj/GRrmk35Nv3OYUs05gBCEZag21PVpczjHaNxcot5tZ3O/ND1AqKW
 GFM306iwEOUpyJeAs8PGZYJcywYtoKGPneD9hM5jLSi6XPk/wk1id42CVxDTMa9eegtLEQ4vnIi
 f4gi/vGh9xphwa/U0BgB1S2/cUucXFlWPOral+msxf6cCBhCfXE=
X-Received: by 2002:a17:90a:c890:b0:321:c8e1:82e with SMTP id
 98e67ed59e1d1-324ed1bfb25mr758861a91.26.1755734676236; 
 Wed, 20 Aug 2025 17:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENGaAHhgimor5pJiOH4MjaweNyjNHnC1m6WbGg+qru+W8Qt7ZVMax/uq24M3YIwwpqMOR0CQ==
X-Received: by 2002:a17:90a:c890:b0:321:c8e1:82e with SMTP id
 98e67ed59e1d1-324ed1bfb25mr758824a91.26.1755734675703; 
 Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640d3e3fsm3201333a12.56.2025.08.20.17.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm: Fix missing VM_BIND offset/range validation
Date: Wed, 20 Aug 2025 17:04:26 -0700
Message-ID: <20250821000429.303628-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a66295 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xd9qGtD1qYZMgD9OdIwA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: CYVVTqlr3PbLhTH3l3zJridCYXMJ4_1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzg3THWjH9UGU
 KK2tetERLXD9r8EquFdj/DkgvagPA9iS+bWLLAepUdPDbB9UjAmCKO4Wj6ASe7iJu8GvHNzcFn3
 frbQtYwfWz4Zc45UMOPKPaHpAUchqhXixUbc7oBKO4529YkF4ugKphYTcPtAHlrCATLwbn0DSFU
 uji9D39SEY4cYlaxCWPcf5YZQNWDJnfUyBhubKs8Oug4+t+pLDEG95/mdlya5ytXLiSy5YFKYNd
 +jXexxorUqMNJnhrRKMwI1diBLBQ6WvtCjnm2yYN2bLgfi9dS095uyKYvP1IqlW/ATKrOZnGkUq
 YreqwFcczl9n8OJRCGdSj2dirCSRKaU699Uz2RLxTTQLCaMC9c7zGmpqBa4suuaUtzgxSCJswrl
 drdBmq0Vlsgup4/VU9DNbmkA7z6kag==
X-Proofpoint-GUID: CYVVTqlr3PbLhTH3l3zJridCYXMJ4_1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

We need to reject the MAP op if offset+range is larger than the BO size.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 209154be5efc..381a0853c05b 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1080,6 +1080,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 		op->obj = obj;
 		cnt++;
+
+		if ((op->range + op->obj_offset) > obj->size) {
+			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
+				   op->range, op->obj_offset, obj->size);
+			goto out_unlock;
+		}
 	}
 
 	*nr_bos = cnt;
-- 
2.50.1

