Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9C303111
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 02:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6B6E3E5;
	Tue, 26 Jan 2021 01:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777926E3E5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 01:18:23 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id a20so708580pjs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cW8krSz9Suh27i3kFLRH+rKbVyIy/nSf3JAVtiB3NGg=;
 b=OMcAX8e+LPP25ZJuWYYSgfhNFgcP++z9OXPz3H76Ovwj4lxCkaDbAt80h+rthknDrq
 iJuS3q9mOu9ltZ1mqU9i7psDGke7EPWs5StZWbYFBwnQdv6EuQAYuIrrSMk00/dCcYP8
 TXAomikkDj+f0/yxJkFL1lBn852p9TZcaJI+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cW8krSz9Suh27i3kFLRH+rKbVyIy/nSf3JAVtiB3NGg=;
 b=HhQQbQHuSV00CQ+VCZR4LSRCobCxc1ONXDOcYFu+u6arxhCt5Y3wqMO0wEjfjX6f4b
 622EaJsBE7QGcxTNkncVmrRXqxmaVzKFE8/grJ2wC+Q7b17mQ1Z+SEIaq8A1Lrjpprem
 BtXEqjxcA7UHrnj5REHYOZ/qIc9kS7E9ME7TfSVOCdmGSYza/VqkWcZSlZhgYPdUjM7Z
 p1hpnWfKk3CecOQnVMhMNj660Xb7iKTtCQnUHLxeC0SNBU+Adt5qmLMp9r1GEclpDZRQ
 /E+JGiKCKr6bxeY1mX7apFBsCfpP3SixV5j5qwv8T43PXdZfcPBFFo3/0v79QkSlJVr9
 oo5w==
X-Gm-Message-State: AOAM5314qabB9XOnQqaWqF0SSc4NNs2ggydM2V0eti4Ei58N5IBseSwq
 UcfIp1T1a8RcHlKBhvhcLfJsBg==
X-Google-Smtp-Source: ABdhPJz1KwRDKhFH1+4vA/V0bCaojV/wBSjNoY/yJR26q15uQ6o7lk+MBQ0LDf1TE+A2gIPGNnJuTg==
X-Received: by 2002:a17:902:bccc:b029:de:8483:506d with SMTP id
 o12-20020a170902bcccb02900de8483506dmr3201535pls.53.1611623903115; 
 Mon, 25 Jan 2021 17:18:23 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:22 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Tue, 26 Jan 2021 09:17:59 +0800
Message-Id: <20210126091747.v11.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210126011759.1605641-1-drinkcat@chromium.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
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

Add support for MT8183's G72 Bifrost.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---

Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7:
 - Fix GPU ID in commit message

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

Changes in v2: None

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
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
