Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJk7E8IOkmlJqAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFF13F5D2
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152A010E370;
	Sun, 15 Feb 2026 18:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQBHR3PU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTTcmsdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D674510E370
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61F5Xoks126165
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Q9Y1cdwy9BG
 TV0V5PwHxjZOzyujS+TRJsJwWN1L6Km8=; b=gQBHR3PUylcBdn5Qs0sf2f1hk3n
 XmNVeuHtfMQwyyvqoqsDfgFa92d9yf+TQ+Hw0rO0i9ReHIPqKG8KO2yiCbSIgPFA
 6HGnKb4XPaV2MABg0B3iWc9ypHBQh7Mj0FfEHWB6WYnrlXdumXg5TYpbbh9jXG37
 pNaODDZMkFPP8Z7CAMNX5dKfTFnjTdDadK4icAyRjg0hZJPuDvapJLbFYirKQ+x/
 BXp+JIxu58o1MRp5vKMh+BbT33qOCf43nDx8iHyNMZAl0M6lbzZR3o13165Czs8t
 BlII2dYs/Ci8DgMeSg7BQMxPO0yTbU0Vucz1wWSpU7gWxet4Uzt8L1iXW+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bugxq5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2aad3f8367bso29061825ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771179710; x=1771784510;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q9Y1cdwy9BGTV0V5PwHxjZOzyujS+TRJsJwWN1L6Km8=;
 b=eTTcmsdRLRsXqbBMTcNhRycvfpe4qhiPJJqhoVQtmnvvVk0X91abOmLUkWhmoxlTmn
 V4IWPFq93KfLW4+tBTuE2oZpsW+hi1cfJCNjpDVVrWhP7FyYNRof4FZdwwpCT5vKgtdJ
 H4HMYhOXzMlDt29J1CrsIpBAb4b8H5WJWT9KknKufhIoRX36cMqv/9cV1QPUtfSHBrCJ
 B6VsifnlUAwp5kPpuKzC0ip9jlItKspV01JDcG8cEBMAMFs1+OLgN7+IeOYpy8mCbAbr
 U0yaWHTE47cpbdB1tY6aTTqC1KzapZI0dilpU07uVyq8HYtpaes96w0QQhvn1sHliW8n
 /VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771179710; x=1771784510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q9Y1cdwy9BGTV0V5PwHxjZOzyujS+TRJsJwWN1L6Km8=;
 b=FjPP1DLrAiduVDTKp4Pp89tMitfnHACFyybZ9JkceYCrYogoLSePuocq4qGkrxA2dt
 sgx1he8evgI9IUXo+Br7iqwCbpjqr1FhU9S4CyzHmV9Q32vp5zMNmR3bPStTN5majS/M
 fFdz8aQu45IAjatmpWNauVD26CekoY726ARve+2W/ufqvzNRF698pD7fCDPTVIno0KmU
 KYieaIhnZcyxRBLdISlPKCmpnwuZR3xgBD//84vqCacEm2A5Va2PMyqWNr7KeiFO3xO9
 qAnogs4c2qZhsRinCED//8sigtDE3an14JGnq1IC6rFLUaa0Ek1MsDxP/0vJvCS5BsdI
 /x8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSCbLJlj8IbiShxRqWuaKWXkYeHVGuCsEkAEGzJyvcAbJLKJ2OIGY7sbSPe3Qig4L4UsjU6NPUPHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF6scPTWxllSVS38T69uGP07yVZwb2Dbnl6Uk/jgUBujNknC2l
 Zshd6lZWCFRx3Vh7byY8w/QiO0aHSFhjrMgQdCbrYUfv1OqZW8pWNJfXRuqSt3Pw3p0vahRoSrr
 6IX9Xaw8vwyVp/K2OqHahwZV2y0gQuWNZeFMiqn882Usf08B9JggJyTknNu72v7eJakIwE4o=
X-Gm-Gg: AZuq6aK12jyMYr0J6Yz3EloecbH6B2fMHMsKvkSVAAcfsVDsxH/cG1+jQmdCJ/iS7N3
 8aTIvjcDy0eAvfM1KjZvEa78fazBWS1AOh8YiwzUnz/7b6DPNupr/3vovTr+Z5YRhn6Q1hrksPb
 eT+ICGOCP3m8TPPz46hRC/w1mUE9RD7rKRPlrFpuo85BhFY8Evk5iVp218quBaSxqZ9BCpBaDWW
 vywOaSavZ2JuVllBn7O/Mtk5BnYJgRNL6Sr8IOp0rx6o6NwIYdN7qAVvgUF19yJIR2h3EFbu66Q
 polKxXw+ZvjL/VqCq5HEvBsIZnxAZ09TVIgAIGd3et5KHl8oljcW+Ego4GrqEfMRR513XbOK5Vn
 5V//o95w4wMcdmbuLYuFnx8GvzOsRIm+9kgR5hTXCDTM1r99b2TDnHw==
X-Received: by 2002:a17:90b:57ce:b0:356:22b5:704f with SMTP id
 98e67ed59e1d1-35844a4f70emr6013775a91.15.1771179709677; 
 Sun, 15 Feb 2026 10:21:49 -0800 (PST)
X-Received: by 2002:a17:90b:57ce:b0:356:22b5:704f with SMTP id
 98e67ed59e1d1-35844a4f70emr6013761a91.15.1771179709203; 
 Sun, 15 Feb 2026 10:21:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 10:21:48 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
Date: Sun, 15 Feb 2026 23:51:33 +0530
Message-Id: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P7-S1FXhnuWlFjOIsGssPmtN8I6nwCA0
X-Proofpoint-ORIG-GUID: P7-S1FXhnuWlFjOIsGssPmtN8I6nwCA0
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=69920ebe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9Nm459TXYEgc-GpAQpYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfX7c5V7VqqFxX4
 bnQXCbqxOzGef47VjGP+Ir7nwMS+iCm3SOID+pA6pQNeC9+FlMRNCVG8ZNAPyo41gqyekVQTcwL
 mh5Gr48rq7X814NOPda0V+pI9ueHKFudarPWnncnZizWkNr+kidQJkcefQso3BLFpiloUA/Ca3x
 TygySPuVWTub2P4R5596ADRCT+rz02WXPSXNVKGebTgk2X8AirAdfFUAhkp+AmhLnXh5umpW3Ys
 TbM1Fya6AV+siot7sCgLh5BnF58HYtN/txmxxtkxRooMMXjm2UB18sfbsUc2PLkYJqjJEzSSskB
 qvzuIxJIxewuDypOqaFMBna0eSR0mWJC4kOu468In5bRI8bYdn+BcVEhGN0NPIOoGzRZDF8zTAr
 ZyQCFMTz5X5Nt1SNbSJVNr9TE5GbdclFLydeuY46+1/gXnNJ7tkWmNOS1CNH1Do9jOTIAKLpDnd
 oJiKYqmk1rKxTsloFzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150154
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E8AFF13F5D2
X-Rspamd-Action: no action

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ce397c687161..0d8d89a2e220 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK GENMASK(11, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -515,7 +515,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -651,7 +651,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2506,7 +2506,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

