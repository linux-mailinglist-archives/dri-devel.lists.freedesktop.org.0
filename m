Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D03463AC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348156EB2B;
	Tue, 23 Mar 2021 15:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AC76EB2B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt15so18440071ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
 b=NUwrKMc8rrSC+eHA/HzSJExKE+kjjVRABul+FSW56sqfRpDiwccyNmaZhvaYC3/y0A
 b53QhZdBwN7NYFbgRHcO421gpHsKQZ8+S+K+BfPNh0ezYBQgwFH6iq2JWLAjDFL7cfbO
 1lmYI8ErGWEcjatruNSl4Rn9zUBdI5b9sjAG8CR2ZC54fKBXQiSG/z+58+FCpwg2hhbx
 /1My360BwzNES7yWftFEgDR+XDAuHtDZsKnhsWSZaG1FJwQtFEjOrJrzTD1TG8Bz2IQ7
 u+145jR7sVkiwPrWeS5G2PzEUfZGKpiNARWJkUzOi1kMhlfpwqpOIjkd3b6D9oPLT/RO
 a/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
 b=o1a+S4gaPSFHutbKE4yiSgDGcqnmVImC3Qdpp30TgmDy2tTIhqttHKsgGNTVJ1h2dA
 FPm4aCfq1k5AmtYDEavEJxRqn6MTY4Koc9qRqCLV2MN7gnwFp+zB44iK+owgXhmFFXjp
 6PW1bGxFgG5cQpPjGOM/VLhM1fzccsjWVN82RkNhNU7oJAJVojiPAAwxp2RWh+b/zs3r
 t89Qbg7veF5XVpbonEpmmeJImtq/xt2ZRmGx8+8HraxqecXQ5IbhH7kam6hKjDFHb1BE
 nG2HfwAXPM2H80IIyTR+MaO5TYr3gdeMmSGnmgBMvfvcpF7tN/qGPLeZEHF0y380Dknb
 hXpQ==
X-Gm-Message-State: AOAM530zhE2jTmWrAPNauCCt+1YDLPquOhJ4A4Mjv0AgrbooMxJOVCs2
 RvoYQByy2nLLOPkIpGG/DVw=
X-Google-Smtp-Source: ABdhPJwqE9dHjw9jqCC9q3tRdPTxXRT/J/y3S8CbWp8WVtOsqf/5YB3tyyFWrR7dVspq5PCyY/Yz4Q==
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr5675918ejq.515.1616514876428; 
 Tue, 23 Mar 2021 08:54:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id jv19sm11351191ejc.74.2021.03.23.08.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
Date: Tue, 23 Mar 2021 16:54:34 +0100
Message-Id: <20210323155437.513497-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Clarify when a fixed IOV address can be used and when a buffer has to
be mapped before the IOVA can be used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 19e8847a164b..793da5d675d2 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		dma_addr_t phys_addr, *phys;
 		struct sg_table *sgt;
 
+		/*
+		 * If we're not attached to a domain, we already stored the
+		 * physical address when the buffer was allocated. If we're
+		 * part of a group that's shared between all display
+		 * controllers, we've also already mapped the framebuffer
+		 * through the SMMU. In both cases we can short-circuit the
+		 * code below and retrieve the stored IOV address.
+		 */
 		if (!domain || dc->client.group)
 			phys = &phys_addr;
 		else
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
