Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3019F487D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7B910E8CD;
	Tue, 17 Dec 2024 10:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UHbHJrxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BE810E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:08:33 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso57760301fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734430112; x=1735034912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=;
 b=UHbHJrxRCrHO+e6KY2oh51DAuTxzh/ddnU4EcqqudmBryUdtw+5MRici/liG8NtoaN
 dsD8hQJ7QyVMvHo6PgAY0ETdTzHxSPneGr1M1/RTgSXsb5D5g/u0qVReOiNI4dp6NGlU
 IoKKScdsYF4CUIZ+MX9/cmLu4XgoTAmdrWYfIsQIQnXz6/BhARGWiHccVOBeeXa9iLJC
 XH/gj7hIl7Cnz1nSK1BsLs9wLrjtskhpwasws6t/xeYOnzqw1enIflzbRV7zC7TH87Zx
 bgEoMJXmBlEqsqJ8lPpnzFZbxkcpqRUf7cFyvIcs7H8+KBMzmzOvhUcOVUptSkrr0mEB
 +ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734430112; x=1735034912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=;
 b=pxZ3rcnc3wP3ZMVoCJFsQgMmzlu6Ml3NlnLIi1OI98Rk0LX2VHoZgsWYvMUHIJ9tkd
 Pz4EKeKBIMWWhEu374/O6qQBqYp8jlDjBNswVgGsyE6zK7iRR1yukY3VRLw6aK/pTLaD
 dcSM4jvfE7vqLf/MIsDE7mfSeYefTZM20amC8ODlCcd/38oGJwSvhbdEXxo9UK+laoXl
 khDCwiBD5HTpU1qeiz3HiLUZ+BmDS1hi8oStQb8v/S/f9RTWEZU1/Rry7k3fxNxCJMM9
 QS7bS+CKzvtKTWjneDQt8zraR0pIKeoS/534w/Cm+Vq6YpSNNLdoNGlqUSRk5UAHj0pZ
 AodA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgVFNhW582ZYWy7PpVqBEToRTtcfz1HsehqxzXeyTBxvWIBLSJJeW5S69YDFPLa1wjDzGO2M8/XLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWK5ENZlUCyceuCFSEPwhLaYMFQRBGSCSHAWeL+uIJnW3mtG3L
 BQwkDPWBg7ZTqh171tcdDrAH1rvmzzyrwUGvf/xwmsRlP/oZvfbrmacq4pgpclA=
X-Gm-Gg: ASbGncseLUy0Q+JrhXvf/1mBwMU5Gmt/T8iDqfWgn6x1I3cPxftp3mbqO5mN2BefirN
 AVMJz1q3wcH9bzlyjbOCUTVolwmu2Tv+M43JTCcrOI6TvUTzqHswyKfWpaKWIBHn2vrakoyvsxE
 jv+vWlAqFoWUN3M0/l5xMlhvzrBuuHzphGwqhsMZaTi7It3moY21rFJpspt1dwPbXZKyTN5q2Rh
 HKYOQKkYQ8/ciyp44Qxwgc/fMQipEPtQMNvhzgpPlMXUffOPgiRhA6RhgoCpryjYkzs8vcdItJ7
 gmDotu58OmuwYVmpaG5lowofgAnRUvwhOA==
X-Google-Smtp-Source: AGHT+IFUOf8R3oSz8XVmOSk4m+OqhuOXE2suAkhuB1hb+UqdPUyHZKSAPIv6wONSSMTF4nNdh4CWRw==
X-Received: by 2002:a05:651c:1a0a:b0:303:41ea:7910 with SMTP id
 38308e7fff4ca-30341ea798bmr37947871fa.34.1734430111988; 
 Tue, 17 Dec 2024 02:08:31 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a69ecsm12122681fa.111.2024.12.17.02.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:08:31 -0800 (PST)
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
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 6/6] optee: smc abi: dynamic restricted memory allocation
Date: Tue, 17 Dec 2024 11:07:42 +0100
Message-ID: <20241217100809.3962439-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217100809.3962439-1-jens.wiklander@linaro.org>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic restricted memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 74 +++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f5fd5f1d9a6b..25b02dbbc76e 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,67 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
+	msg_arg->params[1].u.tmem.size = rstmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
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
@@ -1258,6 +1319,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1627,6 +1690,7 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
 	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
 	struct tee_shm_pool *pool;
 	int rc;
@@ -1634,9 +1698,11 @@ static int optee_sdp_pool_init(struct optee *optee)
 	/*
 	 * optee_sdp_pools_init() must be called if secure world has any
 	 * SDP capability. If the static carvout is available initialize
-	 * and add a pool for that.
+	 * and add a pool for that. If there's an error from secure world
+	 * we complain but don't call optee_sdp_pools_uninit() unless we
+	 * know that there is no SDP capability left.
 	 */
-	if (!sdp)
+	if (!dyn_sdp && !sdp)
 		return 0;
 
 	rc = optee_rstmem_pools_init(optee);
@@ -1653,7 +1719,9 @@ static int optee_sdp_pool_init(struct optee *optee)
 				     0, &res.smccc);
 		if (res.result.status != OPTEE_SMC_RETURN_OK) {
 			pr_err("Secure Data Path service not available\n");
-			goto err;
+			if (!dyn_sdp)
+				goto err;
+			return 0;
 		}
 
 		pool = tee_rstmem_gen_pool_alloc(res.result.start,
-- 
2.43.0

