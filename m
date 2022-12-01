Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA363EC51
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9D410E596;
	Thu,  1 Dec 2022 09:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCD610E592;
 Thu,  1 Dec 2022 09:22:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy37so2671778ejc.11;
 Thu, 01 Dec 2022 01:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbApf1anPXhkyL1eMhU3x4CauZkX++vBii8PykYLja0=;
 b=QZsc+anXmpwu6POr+6D9Nn9OjPEpMot3211JfomV93JEayXGnUjwqnbnYsuH2EqZ8J
 3QXZCMWe/ss5ahcWqWboFLZL3vqDH7B6puPa4VC80uGyOA+XWxAZSpNvpk3nBom9288C
 +MXcRRHO4kjisktIB490p1q2A9l115vmJMhbwvAeG7wihz8OmuT0nllQW/QTj4LEF9jH
 IclppEXhs/6UYUPsFSzxNyc5NapjHKT2wg9uAk0fqwtaicRwaXL6M8pXSWYpWnukA9au
 4O0yxq1pVanNzhwssbcok9cAVk1PkfZXjBxWXXqq+6AoALKAocWg/5c180e2YCREbuO7
 8UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbApf1anPXhkyL1eMhU3x4CauZkX++vBii8PykYLja0=;
 b=C2B9pkzleBmsxMbTP59Xdffd6EBMEgjB4/T/65JuZHnKg2Y3EjA37Qr5Cwa1jr5tyH
 +Ktd8lfsbFAunF1mEhfQ2QrTgkC4QUaTCgjnESQ0uztCu+nFCvUJz4/F+aiJcHjicQeH
 tuTM0pBCZrF1cE7eB49uA9ZEtJG2SdoTi7C6z7FK5BCF13rzJ+vMQ3q6muN6kDtR99p7
 HlkTmu0bhIHo4TEfheAzFzGrmZOUqQoiRfQ0FRZPARXa1zcW7Q1JtMm/bgWlGqd/dP6q
 dbSFAV2q6kJhZGjoolc8faeo6EF9tAnWVOPbDTMSDCBriW524X/XUaSvSi5wsvPGkEuH
 IC5A==
X-Gm-Message-State: ANoB5plFxtrYTzFFF4DWzMz6wjzxsYImDvhfzq4YTN/3CGga7+3VIZAU
 2vXmagElK5Vdksf/lkXd2kQ=
X-Google-Smtp-Source: AA0mqf63rBMYzHT+zaT6/ZqAZm1tCS3bBM8sYXQ79N+62wzUyKjm+3MLrgRd+/tgyNUfskRVnPOAVA==
X-Received: by 2002:a17:907:76e2:b0:7bd:f424:b1da with SMTP id
 kg2-20020a17090776e200b007bdf424b1damr20991045ejc.306.1669886528176; 
 Thu, 01 Dec 2022 01:22:08 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:22:07 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v4 7/7] drm/etnaviv: Warn when probing on NPUs
Date: Thu,  1 Dec 2022 10:21:28 +0100
Message-Id: <20221201092131.62867-8-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
References: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace is still not making full use of the hardware, so we don't know
yet if changes to the UAPI won't be needed. Warn about it.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..3cbc82bbf8d4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -765,6 +765,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto fail;
 	}
 
+	if (gpu->identity.nn_core_count > 0)
+		dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
+                                   "for which the UAPI is still experimental\n");
+
 	/* Exclude VG cores with FE2.0 */
 	if (gpu->identity.features & chipFeatures_PIPE_VG &&
 	    gpu->identity.features & chipFeatures_FE20) {
-- 
2.38.1

