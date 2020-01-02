Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04C12E4BA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE94089FCC;
	Thu,  2 Jan 2020 10:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794689F6B;
 Thu,  2 Jan 2020 10:02:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so38673632wro.2;
 Thu, 02 Jan 2020 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=er9/v9hYbfqIgu2voF735eSDEeNVgwGUORwc3VQPHA8=;
 b=jgLF3vSim1KrWRJOj4EfWsQqcPwmV0YZhC9zhHKWrNIZw48tFMCHKbi94hebV0Mhkb
 OjFxxXO2mHT75XsQ6Edjl3la2rofkgQmByIZK6MbEU4CWfQ+5YVOE+BYP5DNAjnDTyR6
 WJwJjwzYj6vFm/2avoicIS2UYt/ahARybLBg6x0OgKtUxTUWQrcKvF8EUMhjqD8QvX14
 WFEzOROS17m4l1C4Nhx778xYd38VpS/eAicGEA9Udn++xI68g/9UfbnTpy2X5ieQY9uW
 lWoU983NrWn5s5Q4xER5m99DTNrr8HrbW/HLkt9/7BWmDWGrRqkjOxFoIIYinyDtzk8O
 cx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=er9/v9hYbfqIgu2voF735eSDEeNVgwGUORwc3VQPHA8=;
 b=ZdCNs0NAuxYJWBrgCWzus9phogI1qLpYXCo2x+HqKG8X7ZbLT8uzq2Gq8F5Hznplo+
 jiHqftInjwfQc4ysXuG8gUE9hW5AkY6we1XOre9X0QxUFwHnSl25ObKYY2YyUKnC6B4z
 oN6st6ziJQNMtMxPMn1edHC+6au+PZ6X40C1Fbh/FQfPSDxzWB1lP60xvl7qSZuuy91K
 4iaJ7RrB+sKWsRaeobXzTowmBi1tIXAU0vJfSV2RtrQ/0KRiX0/JgXTAIfNgYxxEWxil
 k2aX4h5fStkcpvRcIhGDwBSxUTiwL4HZ1qT2BDRF/ojU31DIzVQewjf4RuxOwYWV2yCY
 fcfg==
X-Gm-Message-State: APjAAAWX8Ufi6HmnHU/bgATaWT/oJDM+jcFLRQz5iQ6lB9QqpKN30OFF
 186wKn1r91cr/k9HfMUvCc8=
X-Google-Smtp-Source: APXvYqxBt6oHDq9LLKZN2xnzF2RUfaONzQj75vvMhHVT7sEcmHf2BmDO0H8AfCt2i0o6w7vlkaMvww==
X-Received: by 2002:adf:fd43:: with SMTP id h3mr44281177wrs.169.1577959367619; 
 Thu, 02 Jan 2020 02:02:47 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id r6sm55418683wrq.92.2020.01.02.02.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:02:46 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/etnaviv: show identity information in debugfs
Date: Thu,  2 Jan 2020 11:02:17 +0100
Message-Id: <20200102100230.420009-4-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102100230.420009-1-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 253301be9e95..cecef5034db1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -868,6 +868,18 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	verify_dma(gpu, &debug);
 
+	seq_puts(m, "\tidentity\n");
+	seq_printf(m, "\t model: 0x%x\n",
+		   gpu->identity.model);
+	seq_printf(m, "\t revision: 0x%x\n",
+		   gpu->identity.revision);
+	seq_printf(m, "\t product_id: 0x%x\n",
+		   gpu->identity.product_id);
+	seq_printf(m, "\t customer_id: 0x%x\n",
+		   gpu->identity.customer_id);
+	seq_printf(m, "\t eco_id: 0x%x\n",
+		   gpu->identity.eco_id);
+
 	seq_puts(m, "\tfeatures\n");
 	seq_printf(m, "\t major_features: 0x%08x\n",
 		   gpu->identity.features);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
