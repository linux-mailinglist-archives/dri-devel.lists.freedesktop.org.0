Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F6B53460
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204D410EB36;
	Thu, 11 Sep 2025 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rsHUhrFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BAA10EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:51:03 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6045eb3848eso430751d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757598663; x=1758203463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YC/jPvTDCH7V0MdE5QEYPuycikAgoYKWyE534nDYx4M=;
 b=rsHUhrFvxkWMay/w7mTIbPq9s/6PVdtqs570wVnis5uWRWbfEFzONOGvMTjMjIVOj3
 gKrdu2kVr2i/t8oKQkqsQXqCJEBTgSbFW7uH9gx1pc4JAh7fzL+61U2xD1/xSsSVPdyH
 lypJg0sW6Si4LrAjr0H0fWxcVDMIjfoPAnY11fHfM5g+1hGsG2qOwkB1isoG48ioDsUd
 z3l8UBy1TaUGZoe2I8lNulAwzGaxefTtdkLhSwklH2/VIq/JnMe+ZBJQAUssxnqkwjna
 yAdN2EJx3EgsA94LUbzv1rslz96tAQdUb6cQFnfUgUsYYesD8r/VaSeDubl94/jLwV+o
 4Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757598663; x=1758203463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YC/jPvTDCH7V0MdE5QEYPuycikAgoYKWyE534nDYx4M=;
 b=AWASDgoHnu8OiTf3kPwXRjhonuggXyw+pIdv8aoErhks/+atrwk1kWeXUeY0M18vlM
 XHGRJIDLElJogCJ+Cxhqp1SmNVvySN9cuqW6B+Cklax2Mp1MQvE/X+2tqa7jJV0p1Wst
 xZh40NHtNYfCZWitwc39Nna38CIakEyjATikT4/NPYXA+JrEcQhS9GZGoelfl0naEYz8
 lBhKDryknHcdbyrWxHc1fCml8h5TkOKIpiwtkDeUxy+SAZ2Hje4nLFOv4k51GJIBts5L
 EjGLwBPf4fxbXkJIzruSmZb1DW2Vs5BvH4BkGNppUhMCViDqRz0ccDaqStbFK/1YsuSI
 R7mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV13NG9F/X8SIStd1LrbdvPhyU2jh2xHax9vnjdAxeaGJGlOWsRNkJqKhhWS1C/zZwOwSR5F5vQ55g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1uivSN8zm7xlUeWdIoVy34POWNeBce+4qGAEhZ+XolOanTGtW
 kawuehoBl/IAfAcT/mYLCA1xaQS0kvY5NFLvqZ7inAFNCMt9vK4l5/0YlGBdSiYJMBw=
X-Gm-Gg: ASbGncuyDSigbhvSCtfwOTNx2bRzpAUiqxwRgOn7PspM2LLMqVuL1z0ukd2VeRfmxAu
 BGUMr0nvvOZ6L6Ja6r+hkIP8xUfL70srJP8/sTt76dvvBxd9/BhNtSoflzKt/7k1Kib3MfAKTwt
 l6xqeo+YB1U90G9NIlLDv8ZPCPau+tZiqVB/151PBbKWUHfavMT4TZ5w0h2ilhlACoXheifLWiq
 vtza2rhUmeB7d2V0uYG4xfZjqqhS19fKn1lghIRbBU1WZHX16jwdZZV7V2YvcxfbsjG7l0XpaeL
 mJu7Rv5PH7P9XzeC/TydSNRm22ZftwF5/P+o8DUTM2VDQMTnsgrybyoxv7AB5Z0alvubtdsqYF8
 QrCdhASCqEu9c9Lb/3VRD++lcTKGlqpGxHO9TPbjHsmNkh1Jsfc0dDnjRUN99gQon6Cco3OvyhL
 s=
X-Google-Smtp-Source: AGHT+IHZBm0VWF5Q2HiB0+9X7Vnwcu0dm3iI+l+WvOP7Jt3IX2w3wk8CNJ5VHY3b6oDMOP/vs9Jw5w==
X-Received: by 2002:a53:b3c8:0:b0:5fb:957d:d74f with SMTP id
 956f58d0204a3-6102163daa0mr12706114d50.3.1757598662617; 
 Thu, 11 Sep 2025 06:51:02 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:51:01 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v12 9/9] optee: smc abi: dynamic protected memory allocation
Date: Thu, 11 Sep 2025 15:49:50 +0200
Message-ID: <20250911135007.1275833-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b4c007ed3b94..0be663fcd52b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u32 *mem_attrs, unsigned int ma_count,
+				  u32 use_case)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
+	msg_arg->params[1].u.tmem.size = protmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	protmem->sec_world_id = (u_long)protmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_protmem(struct optee *optee,
+				     struct tee_shm *protmem)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS)
+		rc = -EINVAL;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
 /*
  * 5. Asynchronous notification
  */
@@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1627,14 +1693,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
 	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
-	int rc;
+	int rc = -EINVAL;
 
-	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+	if (!protm && !dyn_protm)
 		return 0;
 
-	pool = static_protmem_pool_init(optee);
+	if (protm)
+		pool = static_protmem_pool_init(optee);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
 
-- 
2.43.0

