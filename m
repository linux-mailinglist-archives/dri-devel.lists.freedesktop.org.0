Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A62DDFB5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC11889BF1;
	Fri, 18 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239476E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:48 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u18so59832035lfd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PvpcuwVOPMLvQDnLlBwHPl2O7D8LMz4lLmWlObCh8qc=;
 b=QON1Gl9s1kkROvQY9whWnwGgcnaB4YIR1fgk8dSyGOoCf7hTlJgAN9HZsgUyD+dKDe
 3q5wAqAi82gbM8t3Kg60W2QZvCqEJ4mZCkWVxXXUsHSy6meM8yVP2/afMaiKrpyx4gZO
 /zjzP5nmXt88kR7btX7zCTEao3FMB2pXwQXGXx4Fe1t/7t81y7lIgIMKsoJ7qHrvQtpw
 BA/UP6RzIbd2R9fpk+APa1SZfRIaSGEN9q/0joRs/GfYdpL0EBRFqNkY9DjaQIrww6eB
 6AfE7k+LCj8fUbWfERHHDHMMRLHabE/QJBtxHTsCbNF8/r9FazasHiPJgwj5/7QgpoEO
 WSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PvpcuwVOPMLvQDnLlBwHPl2O7D8LMz4lLmWlObCh8qc=;
 b=cvl/YwYMJZ2SDNmemKxhi/764KVC0QVFIS7+REBDjdowD2qEUikxoiLcWpgIJ3PykN
 GiV8mSgtzGfcXEnsdr3R+i4CBDp/LzLZJZRi8UgdFlQvN5sNxnBvk/J94nTrXTkMHBKp
 6GwcgPukc8c1e1XY6XdLt7UhDoreVTfmQrrFNI4aCzmdMzNnSx8JRT8yULhD4PXy3g3f
 ohOBV6SRCxVis1hN54BwL3OutkfwpIPwMt0k+RKW2hvD2XMr1hFr6/FRs7rVDcFPOsN4
 h0fwWPNGZHXTaP7mkepKs+e3iJBDGYcKDq+yHGmHJtO25yEHP+sMwbf/k1tSqxjgv9Sq
 tLfg==
X-Gm-Message-State: AOAM531+MtOYDPqoaNOdIUQZzZI8rs123YDfdcRpqBJiNnl7SuF32Hho
 lKUgi+GbJE58FcQM93k4ryg=
X-Google-Smtp-Source: ABdhPJwYSeEwcJLgnqbgKFMXoU0x9dR+BGXQt30RblfxNKDPJUGaANO1daCN6cf8hc1/VZhaI4+xBA==
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr233593ljk.88.1608228466606;
 Thu, 17 Dec 2020 10:07:46 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 23/48] soc/tegra: pmc: Pulse resets after removing power
 clamp
Date: Thu, 17 Dec 2020 21:06:13 +0300
Message-Id: <20201217180638.22748-24-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GR3D1 hardware unit needs to pulse hardware reset after removing power
clamp, otherwise reset won't be deasserted. Hence give reset a pulse after
removing the clamp. This stayed unnoticed previously because power
management wasn't supported by the 3D driver until recently and all power
gates are usually ungated after bootloader by default.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fd2ba3c59178..985373ce52b1 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -654,6 +654,14 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
+	/*
+	 * Some hardware blocks may need a 0->1->0 reset pulse in order
+	 * to propagate the reset, Tegra30 3D1 is one example.
+	 */
+	err = reset_control_reset(pg->reset);
+	if (err)
+		goto powergate_off;
+
 	if (pg->pmc->soc->needs_mbist_war)
 		err = tegra210_clk_handle_mbist_war(pg->id);
 	if (err)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
