Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39A34AA77
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9F6F417;
	Fri, 26 Mar 2021 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA046F416
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e18so5921933wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
 b=iEK6+aZlJrXx8XjCJnAXlLR4InbGYUVx2dt2D4tb6J2ipv7Uq6hWX4QXYtZ/qXIdHT
 kIYC3R9TlP7L7v4kPpu/1xGzTac4zByImZwVADMw/eHuCr7PIHlWwZ5+Ho5sEM+nuzSI
 l80ke7Vy7X508jjRY1XAJc0SD6123/gqEo8RgzMsQHAY6akz+z7GH6FHkJ/s0J6RHUEe
 cMfQLWCpRB1NDb9OmS+wO/vZOGxIcjq1ipUrh6e1tvLO4aklf0uDWcr2dvi//XBkXHNi
 cWMDvkNT0wZCtHWTNApmN/g0za0pqaAkQFc+GhSziGhj1MhbYSMuMWefrOEsr5f6afLa
 OsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
 b=TsGcQmZ+IS+i0eVG/JgWTvUjUvUBZBYNAmIfS7CTmPDLEBVk8drP6hnz6d+UhNencR
 CkJeZu63xy0rxmMQSFQpx+ox5OvysxQOu+Q+suyn0U4s6+u4UAYmnS/rP8Q1B8MY4jtO
 sargg/OF0OZj6cOBSFp0WfGrHniJgury/8kJs9rTGxB3QPnpZO2VHESLXkWUOW2sQMmv
 kU3/dAyJooztuVqjEHVmMPA9keKaOurirfWirioO8l1eN6kJQSlyJ3V/kJ7NLMqoRQeA
 jZFUGxzlFn/LjiDpdSiwAoOxQcBUcDu1CjVB0Ta/5DeVav1P0zGrU/EHhEu7rJjqKNko
 sr+w==
X-Gm-Message-State: AOAM531WfGVlUoyLCpGBZgX96YeymPsjM0vq5Idyvo4sqEJLFgtkcsGD
 87ANlODsUIw+PDsKQ0InQHg=
X-Google-Smtp-Source: ABdhPJwlfUjZQv3XsgfKDmclqEDIXzXXcqW+GBTKFrjaojuEtGrfrq6RFk8w1RFXCoMn9hgvOf9zlg==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr14938857wrc.271.1616770307017; 
 Fri, 26 Mar 2021 07:51:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id j123sm10902561wmb.1.2021.03.26.07.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 07/10] drm/tegra: gem: Add a clarifying comment
Date: Fri, 26 Mar 2021 15:51:36 +0100
Message-Id: <20210326145139.467072-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
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
