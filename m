Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E12B25B2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 21:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8ED6E833;
	Fri, 13 Nov 2020 20:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA9D6E833
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:42:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l1so11531223wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrD3nY8cJDaosn3p5aLHlRB3L6tK9xLqGeExQ6Gq7M8=;
 b=Jvk/YXKG6HcLZi5edX2PZXUDYYh5g3oyEpBcmCbz+7TdHNH1WlRw5BIu5reFz+McTL
 6nHkQTmU9WV5dXtgvrLCoPrmEjCQ9FNPz4YSzB4hz91J80xMPSkVudbIKljdSNXic8hG
 vgM3Z6WEX1QKClGqWaVNCGhWw6oBNHrEBiPUUMgRpvObaSSvr30ThxaelbA6mrUeiT1K
 x2c+mbq0eCA/0Pmk7crSL4POzZ+GveFicHwPhHd+Cji7HEGjey/DN79pRewc1y1034+a
 H4FYlR5kmcDb+MdjSy/BXSLxvmaroR8veo/0ZaOxlWLEdzT36SwxFG3bn+DgilqO84cG
 HCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrD3nY8cJDaosn3p5aLHlRB3L6tK9xLqGeExQ6Gq7M8=;
 b=PF2uR5ufaUOyzAo0jP9K4fq6TCIWJ6YUptnYkHy40VE3LefsMr5NrMCez2Qe/C6CrP
 4wnwLM6pLIncXfqgiwIQwpRR2Ql4BQOSnlsZ4odsQMDbkjnfBol3PUNfvrLGO/dOypOj
 JFzO5yZNb42LxSMxCrb/lU8WjuMVu/Dqi1bU4MfkplVWxsHlhJfg/uI8QGQ+HByQOSxf
 HBonQQY7IzDF+luDRbSz+hVXLECsTvIDRrA8Z8oeY2ArQJH4rPzk1r5yJ5n2UGADqxvW
 QG7dlQU9kWCvtolPUhyjYh4QJ/jYQsJ7HDYZqY4PfHYGbklR4Inw9sG0f2ZAEP/ChIYz
 gGPQ==
X-Gm-Message-State: AOAM531H5jSnMxKfYIxDxVTGsGTnyNJhbDXQyH/+o78isYyIPijOO8q8
 I2y66vhEmOpCfFt3/pZi7qaREGrZzps=
X-Google-Smtp-Source: ABdhPJw3pD+6yjxQh8vumZTgEOtHwkIgj8jf/FSLiFAcA0TAhQI6qnKz/rR5d4NMekYEiWTzZtNhKQ==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr5660666wrv.258.1605300122845; 
 Fri, 13 Nov 2020 12:42:02 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id b8sm10940750wmj.9.2020.11.13.12.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 12:42:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: output: Do not put OF node twice
Date: Fri, 13 Nov 2020 21:41:57 +0100
Message-Id: <20201113204157.1942919-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The original patch for commit 3d2e7aec7013 ("drm/tegra: output: Don't
leak OF node on error") contained this hunk, but it was accidentally
dropped during conflict resolution. This causes use-after-free errors
on devices that use an I2C controller for HDMI DDC/CI on Tegra210 and
later.

Fixes: 3d2e7aec7013 ("drm/tegra: output: Don't leak OF node on error")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 5a4fd0dbf4cf..47d26b5d9945 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -129,7 +129,6 @@ int tegra_output_probe(struct tegra_output *output)
 
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
-			of_node_put(ddc);
 			return err;
 		}
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
