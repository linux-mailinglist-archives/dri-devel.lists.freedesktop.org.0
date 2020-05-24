Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0714B1E07D7
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7489EA9;
	Mon, 25 May 2020 07:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D6C89DD5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:52:49 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b6so18433423ljj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VRiXq9jvD5cunzbI/cTlKdAeJSiGSMflTkILhjo8iJU=;
 b=Y7mar+F7PxVh1S2w9HVLeu0mYCxQga2HQ7WLa/UHBXgqumDOX5nbwSU24FoeJXNXxn
 OiwLSvl6TmcY+W6PwaPPReq4X1wIto+8ki2zQDo1JtAOXJrK2iqF1Wv64iIZ+AIWPyvk
 Gj0UUIzQvmd6n6r3dO4me+iXtl/FZ8ozr1qhrLBkfh2vBOii07nTEXU7lTD+u+72kmF1
 yUM8ek4rAtXDPifI5iWWPYAlrjvXSFNgs3lA2Ah7hBoCGINwcqUlO0Oih5/UdOZkTuW9
 3uuP95ozgIXbzur1s8vL7gC+tMx+eyE0KUUriQgl3vVFNf4RYl3BRSJLOF7vlXVDQ85Z
 uXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VRiXq9jvD5cunzbI/cTlKdAeJSiGSMflTkILhjo8iJU=;
 b=YWrBk6KUe7LBXHCDxsxE5/EQGRA1SVnCa1b3aCNOdUHY4w8JHmmHgiPfC2l1dNq9zG
 vqTKVD9GoJ6Yi5VgeFh6w77WadIvTSR+Xn3ESLOmgmF2MZoMOLlwKqSdyaTiCHweW1SE
 jRMtNp8XfasnLTXYa0/dUf7SSrCAimiSnBSd/MoQnsdVB7wJLrvamSdLtHU7qQMqpwHs
 kH2rooFV82kc2qKKxpd/Dn0g+pAP63R2AVv/MlVpzUrJsoO3NMavh9CtDhJIbG+qJZ06
 jgRh9h3WZcmsf2yZNwmk8awtUewOkxXJVVesbx15I2XvlqUcc1R0do4+QF2K79q5HrWK
 raww==
X-Gm-Message-State: AOAM530VZE6sNlV55yuXvLOwZ0p7op2kaTDvlR/CQ+Ksv3yqYzpZuNaq
 xdCaUwbc/i+VLsH/Y6Si9vb0W7+5
X-Google-Smtp-Source: ABdhPJxxHYozBMeF8YxtfRr0CLbWPcGZeJW1Sz76poXxA9qB7Tx4z89RTIrDddAQ51LQn316QbIf6A==
X-Received: by 2002:a2e:3c14:: with SMTP id j20mr12580732lja.175.1590342768100; 
 Sun, 24 May 2020 10:52:48 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:52:47 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 4/4] gpu: host1x: debug: Dump push buffer state
Date: Sun, 24 May 2020 20:51:00 +0300
Message-Id: <20200524175100.9334-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When job hangs and there is a memory error pointing at channel's push
buffer, it is very handy to know the push buffer's state. This patch
makes the push buffer's state to be dumped into KMSG in addition to the
job's gathers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/hw/debug_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 02125842071c..c25c3fe0a295 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -192,8 +192,14 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
 
 static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 {
+	struct push_buffer *pb = &cdma->push_buffer;
 	struct host1x_job *job;
 
+	host1x_debug_output(o, "Push Buffer at %08x, %d words\n",
+			    pb->dma, pb->size / 4);
+
+	show_gather(o, pb->dma, pb->size / 4, cdma, pb->dma, pb->mapped);
+
 	list_for_each_entry(job, &cdma->sync_queue, list) {
 		unsigned int i;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
