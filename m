Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEFC2F463A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33BD6E11C;
	Wed, 13 Jan 2021 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4EF892AE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 18:14:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s26so4755482lfc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msnFgTIvhBhJ/63vki9LgWjLm9F05aUy7cZgdK84yvM=;
 b=s9eohj9LLXJ388upYnETYopHeoP6jkpD7tpGsDWcPe7X45I9JjcFNzQuaImJRSOird
 atbeyd8cIQFWmEDNSrHPFOLDAdE9ozyBvdB5rWYQ1hdryS4idjdqjVZ2IiM7pNxIm+EQ
 w9euvLM/I4pBFyXyeh/3WLoT/Z3nKklcjsf9fxJDhLUGIebaqpPmos85/StATf0VPMDU
 gsgm66NSUdSSr6qs+nYS9fG/maI0CtrYqtTRIi0PbGSRBBZu4gK8k/YHTLWZ4WRoyT1S
 9b6Ex+LclRNwTq1paKD/k0HMmYdfOIwzkTMpMGj4s05sd4FhyxOzw95zdtKl4VUp6PBT
 J1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msnFgTIvhBhJ/63vki9LgWjLm9F05aUy7cZgdK84yvM=;
 b=iOeeSAwvxseJMPsGR3RmEOgGXMMhwolOF+xwnlirhrIY8jZ+i4nGAHkxXpzfz0dExp
 EIetaj7cbF+Zdqde8luLUmUmKqFqDpfwQemUcl5hyUEYIQlgE8tnHRGV0ybEjrYRvCw7
 quE0wwmyzH2NUIYd+pnTxbZq+UCP4O67RJAoCUggwejFmMwwXsjMociq+xFaNQsJNrve
 uiPZqCgF5vbwANcyeJRF+Edp3u2UrM+Fz4PtMhAgKsnNyT2t8dIA7CErmMKNjLcpTDcV
 Rvlj8/VfvZIHeP/6gqlP3UVD0gwh0+jqyQIo2qRNDYOI+8AdvGjVaGQeN09In0da6xPN
 n/Rw==
X-Gm-Message-State: AOAM533fYy4/wVrbwtcq2DV6euyOcl5WIr9vknGchOvqijeS+vI3NIxe
 0fRqym2kwAx0Ozqt19zQCDQ=
X-Google-Smtp-Source: ABdhPJwhiKXJCkbclv5OM1o5nyJwcIx7TRfjiuG6ec10XAs1n/7v4CYEEXjaHxagqXQV7+Abkxmegg==
X-Received: by 2002:a19:385e:: with SMTP id d30mr75450lfj.187.1610475292261;
 Tue, 12 Jan 2021 10:14:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:14:51 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 2/3] drm/tegra: gr2d: Correct swapped device-tree
 compatibles
Date: Tue, 12 Jan 2021 21:14:20 +0300
Message-Id: <20210112181421.21293-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112181421.21293-1-digetx@gmail.com>
References: <20210112181421.21293-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

The device-tree compatibles are swapped in the code, correct them.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 1a0d3ba6e525..f30aa86e4c9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -162,8 +162,8 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 };
 
 static const struct of_device_id gr2d_match[] = {
-	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra20_gr2d_soc },
-	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gr2d_match);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
