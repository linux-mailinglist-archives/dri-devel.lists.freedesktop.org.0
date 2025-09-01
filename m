Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57549B3D8CE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 07:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C46110E313;
	Mon,  1 Sep 2025 05:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZiN7Cms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C886410E314
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 05:33:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VKw4Gj005313
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 05:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6QnJVy3Cx4b
 AD5xl3mAoxpjrmiuwQjGEsSGBJTQmYE4=; b=CZiN7CmsX7PhiXDYfT40wqWPS2W
 SbWY0MVQy7Mg/xC5A6n5gvTn1Jwximf0Nyl9g0Cex9flHkrVc8U/gkJhiaLhccjt
 EQQ+KIVal5gnrPB6CCz7Ct+hDRAekoqtkm/mjQWvu4X9e821Ikvl/2AIOOggONbU
 iovEsW2CGZ3Eu8D0n28K+WYigW63ho9X2WLw933wvGPTmHXCHfzOTcycCnsIuGA/
 vvhftmRFgB2DE52ppuvqHOhC8JexTXzaCl7n6MNeNUWc7Rf9h3c3CD3OKwAI8ILC
 N1MPtIncjMPW6xpbips60hdFID2tetNABw0TZf+eKVMYYpnBFgc9yxh509g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuuc1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:33:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2445806b18aso45381075ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 22:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756704828; x=1757309628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6QnJVy3Cx4bAD5xl3mAoxpjrmiuwQjGEsSGBJTQmYE4=;
 b=s1DUrDZrMiiKtVlqg4ppqsIfg+uFtsC2MhLc1h3UrOWuHE9YRkMYn6ky49+krlr+A0
 ck+4sCJH+7n5IHw3O3qfqJebYi3qEzt/IHW1VucY0GN4vT0zc2ya8u7KvIONHQVsp8b6
 ES4quF7fSvEjIAVIN4rBPPbNj3EjwF8p7VtRM6TcngpV+HwwORxGK0mR9AAOB6N4mk6C
 81Ny6taEx/fHzaAeRsNDOctQsQteV/cujqevUZwKo26zGxqywH3AdBx90GjnrR/qM9Fn
 XdqdUBaIBVhMN7gEaeiTG4K/LhLpgyy5TZO2JChVBblD0m5Oj2dustDiwzVjG0/KUUbT
 JYwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS/DScjua/gGtF6K1o8XLl+BPjNbP26I7tsYbwyWA7Er7KSQJlZNTEWZ45yf0zIH4NsYRr5dzCYIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrr+668ZR/Tl+ax14dn4wf3M7AtbcRJ1bcFPrqFcZjLE8lJKkV
 lPHNmegLCj7RlQPuMTZVQyAlsaMw1LQM1UWKMNonfAt/6LhWfZ+Ix0SCuupCzRDuuXfwwkLOrCE
 5P5BiHLShaHPipLnvNukPCXACp1YPgu8NDAodJid7g0uJMoKlQMh/C1FWs5ECbkpp/mskYF0=
X-Gm-Gg: ASbGnctOHjzBI7EMtZi2ZAUF8DCVCCiM0H8oVPOJp30QRuc2MuDa6iZRH9zjsmdXyON
 l0vMtF99lZUudpRqPtrvf3JFA+GshIEb4t7UEkX5UQYNm3XyBp/e3h2+ds/2HLzVTsphLWQprt2
 KYmeQHXSvruOebR++a8t0hML8ngUx99hr1QjzodUDqY/M8gG8DkoPN9vFH2ZqPNSgUs+1x3+RoD
 ClfVz/TRu+6a6OCjCCcMTgm5dPkFxQMwwP34Tel2RXhMGxDYbytHFCIC9Xn6x1gayVoqUgPoPhV
 y6JFmw71x0wpC+lo+csx5eYWtLtJcu2hEH5X/Xl92ps9BL1cVlOrgReYZSfSbzbfKY25eOP1
X-Received: by 2002:a17:903:2283:b0:246:c826:bd16 with SMTP id
 d9443c01a7336-249449045afmr97734075ad.23.1756704827701; 
 Sun, 31 Aug 2025 22:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESGSlNcSMvh9kqymldfMZ4baXLjakGcjQQ0lY5ahmqYDQGtoEdo10KCkOeIjeZPCdZ3RAj/g==
X-Received: by 2002:a17:903:2283:b0:246:c826:bd16 with SMTP id
 d9443c01a7336-249449045afmr97733735ad.23.1756704827231; 
 Sun, 31 Aug 2025 22:33:47 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24906589986sm90575215ad.111.2025.08.31.22.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 22:33:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling mode
 support
Date: Mon,  1 Sep 2025 11:03:35 +0530
Message-Id: <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXy9iCm3pCXUbG
 w888VItekdccDarF2hBDubEHfeMjg5/yrROLF/T3obLPNkju+ZnkcWCVC5bM/+Yu607pHbP5ABn
 nBRog+OcUJ6/Vn8LEnkles+mZXiQroSRkp7uZNB4UJTkH0bX5ed7DGyNK5x50E1y3NDY97HrWZ/
 CFHdFVD+4cbTW2LCeH/10M3RqfyXgwHsHRSjkBZQhMTH5QXopXfKsboRKzdt+ExWSfKeycVDR4Q
 In0kTJ/Ju6Q9UprRnJWCzb/pzmwfC+NUNQdVq9/vxmyE+j4funShWrxnQoMbcWaRBuuv/NY7pgO
 pd/HxH5t0A03jxxhV86uN8JGAWpo56jUW41FSd4CtGf0RUNGM1mfLvItpJ1tSaTlCEm+jKaDVSZ
 IWyes/xy
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b5303c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eMrONWwZx6N8dQ6zNQwA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: RSbG3j2CLE_4zKf2s2AeVKLhinoo2Okz
X-Proofpoint-GUID: RSbG3j2CLE_4zKf2s2AeVKLhinoo2Okz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

Current fastrpc message context uses a 12-bit mask where the upper
8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
represent PD type. This design works for normal fastrpc calls but
doesn't work as expected for polling mode. To enable polling mode
support from DSP(DSP writes to poll memory), DSP expects a 16-bit
context where the upper 8 bits are context ID, the lower 4 bits are
PD type and the 5th bit from the end denotes async mode(not yet
upstreamed). If this bit is set, DSP disables polling. With the
current design, odd context IDs set this bit, causing DSP to skip
poll memory updates. Update the context mask to ensure a hole
which won't get populated, ensuring polling mode works as expected.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0991ac487192..57e118de6e4a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK (0xFF00)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << 8;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

