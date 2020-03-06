Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A317B53D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 05:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7D66EC60;
	Fri,  6 Mar 2020 04:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962446EC62
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 04:14:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g21so448101pfb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 20:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZHNTw4SE3kOWwVknWFPKUrQ1ZVeKTfbVBIEBgdbJEY=;
 b=k1zGsGNc2op5navHqJUmfJnlqXF2SIMxGwKXMlUCnXt9rkmSdDX6Pvp4QwBWTph7zW
 UmZDgjq/YJN+aB8K4Nr8Yjp6Ctzbra3GsGawt8s/1cy9kNUlxDtcdmKYSdzYOc2ozAwR
 z7EIT/2t6q/nL/wYBvnleCud6PBMt4qDR3dk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZHNTw4SE3kOWwVknWFPKUrQ1ZVeKTfbVBIEBgdbJEY=;
 b=RO6gocZZhn2uCYgqkQR1JPZTglpJwsmFDgIKJno8iio4hDlCDoRNd0Ibh0evxFZWhm
 sF2wFVpM6hiDsFIuPlj8QjM2ajSEqbj1BoM1URWj3sGqMwDQD2LvOLFydunGvILh+bv/
 MoDBERTmCL48fO6F2cwWcGLA7G4ygs4HsSfvoUo4x33/FFwwbOh55eN6QmaKrk6bfDt/
 jGvBoLH0ehva6/2yWpzGdWDl+rnoxlkyz9STVfd4b+a/knO1ZFD8ik2Q+LwTrYtiCpN1
 eZy9uNfcsPjkXzvjJeb4dpGEfRPJJC3DmPhIbaM21Ulv/ikwHJAmcmOtN3sGiJwHOvuy
 tlFA==
X-Gm-Message-State: ANhLgQ28C1RJkQL/TiX23LryOZaGC1dcXhy19k+uuvJXohypVHqcwFPs
 O4JOyY+9Axaq2IFad8vuZvjahw==
X-Google-Smtp-Source: ADFU+vs/j6aQZZ/8TpvTzBDFwv9bk8b1y/hiw7ywm2BIyvth3q+IirQdvmZj5kxzLWmMLEiAVTW8yw==
X-Received: by 2002:a63:3142:: with SMTP id x63mr1455866pgx.138.1583468045232; 
 Thu, 05 Mar 2020 20:14:05 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:14:04 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 3/4] RFC: drm/panfrost: Add mt8183-mali compatible string
Date: Fri,  6 Mar 2020 12:13:44 +0800
Message-Id: <20200306041345.259332-4-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
References: <20200306041345.259332-1-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v5:
 - Change power domain name from 2d to core2.
v4:
 - Add power domain names.
v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a6e162236d67fdf..ff76b29b373e105 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -667,6 +667,15 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -677,6 +686,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
