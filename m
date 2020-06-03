Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192D1ED1F9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 16:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424DC89C08;
	Wed,  3 Jun 2020 14:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0548289C08;
 Wed,  3 Jun 2020 14:20:10 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gl26so2340953ejb.11;
 Wed, 03 Jun 2020 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brk2U8DSU4E7P9UsEsDcp0iVP2I5n96xwIrVhsO2D0U=;
 b=O3Hc7B/C+hhE0kIURHDPGIQom3B8NcaK2/PBXIHdaKszf4Shr2XwE/CY7e3K3X9un7
 bunwidpWUmEKcYQ1+DyovPB6Ss6ilCeqcQ08x4EQjzR8XyyYqwz/Ka4UKJQ4lUHrSSpM
 UHfXsDtK5Y4CtSSURVBI0x02U4AdOU02Bj41bKnGK2vTB7kQSZrGcKnOXatYMQolqilO
 xCyzgl8avJ0ILIK67XyJppKrJbmKdazxxb4M4E2N8uaImFg6Kt99NQStQGn4TxJzFZ+C
 FfnCUK9sHHPZOOE2xvN8K1wDNSa9YBLZfhshse7L2EPgQe3TPqAv5IxCBdCNgm3h27yd
 7q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brk2U8DSU4E7P9UsEsDcp0iVP2I5n96xwIrVhsO2D0U=;
 b=KhUmJAXhOTtnx7oDumvWbH64haDgXtDgI6px5vhhQs8aDhVe0pBcCwIhAxR1iCsO71
 IX/FlpEwlDhnAy8yAzDNNGsi5h0a6fouFoXIkKn6O/2MRPSaJSnEQ7AuoDvKV9cmGjiI
 gL7kcLq9RdGNEolGO6GeR6fs9KF186VNG7zPqzksE4j1AIHfosD1CGLqXPQV/Q7n+UfH
 MxI+bEGV62gJABHmlq8ZPbuSLKjN4p+8dPu7Uzu6wkqtnXnNHHCKTsk52ZdR6qOSce8e
 rKA77cTDPyI9WsIxdNfOe5zmpJDh0W2+8jamIouKolfHu71i1TM3+NtSsq5imfmK593t
 1DYg==
X-Gm-Message-State: AOAM531xWmDr9sxYo3KF8g2gZmkcorKUvoK6L3tW2MjnsGSgRwJ1V0Gy
 3SsxLFKnyZ92257xgrGbxlI=
X-Google-Smtp-Source: ABdhPJybWenTiub6eisJLN+mdRwASGIKTFULXH9VQVTeL1bG9nxCvoga0C3ZtE7cqaD3yXClqEsFtQ==
X-Received: by 2002:a17:906:3289:: with SMTP id
 9mr6777119ejw.316.1591194007599; 
 Wed, 03 Jun 2020 07:20:07 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
 by smtp.gmail.com with ESMTPSA id qp16sm1181788ejb.64.2020.06.03.07.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 07:20:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
Date: Wed,  3 Jun 2020 16:20:02 +0200
Message-Id: <20200603142002.3776672-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Tegra firmware doesn't actually use any version numbers and passing -1
causes the existing firmware binaries not to be found. Use version 0 to
find the correct files.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
index ec330d791d15..e56880f3e3bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -352,7 +352,7 @@ gk20a_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 
 static const struct gf100_gr_fwif
 gk20a_gr_fwif[] = {
-	{ -1, gk20a_gr_load, &gk20a_gr },
+	{ 0, gk20a_gr_load, &gk20a_gr },
 	{}
 };
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
