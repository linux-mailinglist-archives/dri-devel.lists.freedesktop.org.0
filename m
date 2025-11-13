Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21096C55F2E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 07:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C759E10E2E9;
	Thu, 13 Nov 2025 06:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b19Jqa1R";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAgrME3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079910E2E9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD11Wb42993654
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ujaoRN0R9JC
 yofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=; b=b19Jqa1RFOd3yfv6XD5V16zf4bs
 uapARixP4ZzMXe/yNqIXrRPgUJgfqz7l+HNWyC08kT5Ogx7SCOY70q9/rSF8kyT8
 IDFR5HWFkB7af8EMfzDEpwFqx2kWp7zlZwHmQNKxTH0SQsKqJiL6eZZCnnd2ONQH
 3/p5X/Ab4Zq1LrQIUp9WiT8TzinZgQLv4I/ViBBhPQjn1UBSp9t5eleAM0LWDqeB
 yu2mlGqF7z819Ff5lEaONP7APGQVd8RRWkuLLAQcQ3OhFnUjiwvtETCHoYNzcV25
 a2EtkFnptBUd8cWnP3cCM3zPrW1QplADmHy1R88uy5CGvOzL6L1I4cLSh5A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jh4jx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b609c0f6522so1167290a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763016083; x=1763620883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujaoRN0R9JCyofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=;
 b=SAgrME3B2ndEVuQZ0jwYK8j76R6STDw229EIYlXfDDYMvn2E+h8JBT4xAAi29OiF7A
 1nBuC+BM2JvGoWLat+7AcBYzX8uP2sX0e5ewNhIqGRc1w1LIX60B+T6BeBg18WUrpRf4
 b6XGgMWMeLZNHGqoS35vWhsifGzEOmU627ae8xW+T+EnfsSEcxp4/i77IkB2OesHyNiW
 sJDk13wdr4fFjRHIxaIXX0cSTVfUY82L14NP5jRvOJEgUxBNfRIs6BfzZTXs5gMIKS1l
 dthDA53orW+ds0sM+YAGEogw50B2ikc3LVPHtZFVZVT2hI4ovRtD5FsU61ebn8ntU7iM
 IgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763016083; x=1763620883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ujaoRN0R9JCyofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=;
 b=dwhYgykklkes1fhku7YFYrzEMsDbHfRwxmSibG3wo9gek8Vwzk37xXY8CnLoQxnM1N
 YgCp8tOQZZ2bBhhX6FjeRvrYb/IPQepqrwSd+VmgBTec5SsmLD/iGWgvY5L0EpzY+0oe
 OUvBENKu2C6dMETu6tg/W0fVhDjXtML8IWWEtyUOtdSgSn4U07IkP+WUqpU6jbATFHb5
 6fFuQ+3mJuYyZ/vkAK+hsqAI9CuPMoEax1SKcRwv9nubAnkWGIbl+Q7DWCJ8Cyw6FT/X
 2/LJQ+uaZp56FQoPY3eApwg+8/1kTfbvCyzt1BI387j5ycVkiTzk9DWwB+KRCrkTX5tc
 KlLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfOD155WNfJv4PSClouehl1+Wcobuik+LKKZ6EP077TUbv9EMRwmGabfbPXGRp/L+mAm+zgkEhdlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynBM2/p8VbCS2ZuCM9yZDbUz/Y/3eYjouK3EvH2vK1EruS9Ilu
 Ppb92V26Es2NLSziAZfEjLGZbbl8p+56RP4JkyYUReLOu2s9UpgP5hGQ2g4I/5h+yuwOaZP2RpE
 ksOj4DF3dW9djb74L6qQf5ELKx5y7KKrnETKanTJOE58/mZaFWfe5bcERvZxOpabKwJ5LC+w=
X-Gm-Gg: ASbGnctinRbeh/Nt1ca5GliKAdceWdOmma5Xl7vF/77/1n7K4l+vnCo5prxn0GQwYgt
 t4RiXV/0wepK6YONAoFrk3wPGsWJRCK8LA7Yvq+PNaiOqFw5o8JB7cyAROeE3bWa1ZHEQaUrud6
 6YzVz+7YeCbqhptzczPVxBzt7yBhcZ+4gr5ZIVEz/6Z/rOMVK9+g2qsBmvSxb73XbwHeuwuYkfD
 pyolPFEPuFVi23Lq+umkzLJBer3HKkiTbdoIdU00JRf8ZlaLjQkfJfUZBwmZNZC+e05JZZ/vmhw
 IK8f9sBaWQ8uSwls9ouNWM1bkJny16aoNpgaECJK/relHEpOOJJ9Jh663vqYU+as3YPjs7N+c5s
 BE0pxKK3t9ZUx0egUIMLBlR9MUzfdAdU=
X-Received: by 2002:a05:6a20:3943:b0:342:a7cd:9211 with SMTP id
 adf61e73a8af0-3590b21850dmr8009706637.34.1763016082768; 
 Wed, 12 Nov 2025 22:41:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF1omhOWcFP3UCNbVCU4ks3UAajf4M3m+Zx0IeTs1GLXY9LvW5xB6kXqRPzKlUs8Flbvshwg==
X-Received: by 2002:a05:6a20:3943:b0:342:a7cd:9211 with SMTP id
 adf61e73a8af0-3590b21850dmr8009670637.34.1763016082300; 
 Wed, 12 Nov 2025 22:41:22 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36db25bfbsm1138419a12.1.2025.11.12.22.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 22:41:21 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 2/3] misc: fastrpc: Update context ID mask for polling mode
 support
Date: Thu, 13 Nov 2025 12:11:10 +0530
Message-Id: <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0NSBTYWx0ZWRfXz6hsNsWfNS28
 T7TA50SLsUKHmLfekS3VvKWe7hONVIcDc6aTWTIXbFdk119EfDe92trkY8SYzEsORCQqWDRjD0h
 cN7+dnwYPVGQAPHElSxWIOTPAApELDh1Hk8QlTuOc3uBB/6c4z6e78U50afhxhkQJ0z0qWNZHuC
 KgXIqGowiyyBkcDYU1F7qZK3C0m1ayXQay5ljfPOCFyMHX2m7/2kVGGgrFGRxT/SKPXK12E/bO2
 K0GFdENEXY1vjytmj6QgpNL8oyqPTfoYc8R32Ib3RNT7I+ifsoVMEJRp8kXSvabsLGtcNoAfN7o
 +8HVI+TFI3fFOQN0WlHM70BSdpcmVBpU09y0YTwXtpuytFj4guwItKcZoHIfMD+gDU5rvLdftQ4
 khdWiiP6wyoWuMu79GBvAMic14eMWw==
X-Proofpoint-GUID: fyXwciw0_ejhEcM10B3oAQ8D6oM4LQBU
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=69157d94 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eMrONWwZx6N8dQ6zNQwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: fyXwciw0_ejhEcM10B3oAQ8D6oM4LQBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130045
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

Current FastRPC message context uses a 12-bit mask where the upper
8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
represent PD type. This design works for normal FastRPC calls but
doesn't work as expected for polling mode. To enable polling mode
support from DSP(DSP writes to poll memory), DSP expects a 16-bit
context where the upper 8 bits are context ID, the lower 4 bits are
PD type and the 5th bit from the end denotes async mode(not yet
upstreamed). If this bit is set, DSP disables polling. With the
current design, odd context IDs set this bit, causing DSP to skip
poll memory updates. Update the context mask to ensure a hole
which won't get populated, ensuring polling mode works as expected.
This is not a bug and the change is added to support polling mode.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 679cd8997a00..ccba3b6dfdfa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,8 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK (0xFF00)
+#define FASTRPC_CTXID_POS (8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << FASTRPC_CTXID_POS;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

