Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF62EA152
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 01:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502E06E048;
	Tue,  5 Jan 2021 00:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B246E048
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 00:11:49 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id q4so15411677plr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 16:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvqJReQ8p0Q2wrcytP2TtmywERHqcvpbJnQQt8vIrRI=;
 b=ScUimOvRWjQnaVl3XASbOdDlbmovU5P/7tEX4ORdNnIB9j9wH5ytoq2cCDVznY8O30
 eWgD9UXUHHlO9+50t+PPEVX+4CPMTPPcRsOA9d9fy6QHgz6DC0RWtq4zVhuKED0lX97P
 m0r1OSN/9xz2wHbXEElVpx3wFAvjk4kL5TQ5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvqJReQ8p0Q2wrcytP2TtmywERHqcvpbJnQQt8vIrRI=;
 b=DG3W1mV91sl++Ek8ai/FsDmCkyQD09Jr1J9Hyc4gPsH7pPzsa1bdqzdZA7FXXY6uHH
 bYqEd9X4xBfzkR5dic0eFwBkzDUmHZ5hoConJkiQy8y2I/VFgmSz7r1H4rHtF2W7DoXC
 b8TPP0Rxp3/Y2q2pGtylewlR3YD+pvrAwPaJz7RUqus4ydfz2M2uagt3ecnsvmysxOj7
 LNiENNtf4w04T9s6IW+x4pplVCokQsyPsQbsggCGE2c+tK3VGMVZL9U6LkrAPq3VTWyt
 asHf1pwjijJhyXiySwFzBvHi9XFVDd2cwqvPp7t1HzDjDbeoap8EmPEq8rhCOv/x78vN
 LXlw==
X-Gm-Message-State: AOAM531iK7W9hWr/S14pc8DYyzR1owk4d8axtSS2JEhw4bYhEYzvRNqX
 ZjrvIoeCiVwyDYAEDzxRbVgaww==
X-Google-Smtp-Source: ABdhPJz9/LbtEhIm8FWyQjCxzQx0i1/dDotSyolZEhpKdMauZYRkQLUTKYO5bNPm7nnBtipcZbEHrQ==
X-Received: by 2002:a17:902:8a8d:b029:dc:8ac6:a149 with SMTP id
 p13-20020a1709028a8db02900dc8ac6a149mr14187800plo.18.1609805508768; 
 Mon, 04 Jan 2021 16:11:48 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id bf3sm465620pjb.45.2021.01.04.16.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:11:48 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v6 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Tue,  5 Jan 2021 08:11:19 +0800
Message-Id: <20210105081111.v6.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210105001119.2129559-1-drinkcat@chromium.org>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for MT8183's G-57 Bifrost.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v6:
 - Context conflicts, reflow the code.
 - Use ARRAY_SIZE for power domains too.

Changes in v5:
 - Change power domain name from 2d to core2.

Changes in v4:
 - Add power domain names.

Changes in v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 83a461bdeea8..ca07098a6141 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -665,6 +665,15 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -681,6 +690,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
 	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
