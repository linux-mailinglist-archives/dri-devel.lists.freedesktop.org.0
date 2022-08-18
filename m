Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBAC598BF3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8E10F25E;
	Thu, 18 Aug 2022 18:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D47A10EF50
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YzMej/8MO0+IXN3an7AmTVswM/jhEN+N0PC0nPqORQQ=;
 b=ew0F2m35VMrCWnWV0z9F3VYWv7U9X/1iL/ZdLo1DLJHyyM9N2Z9Z7igCox0g2OV/tgquOx
 OmUfl666zGMng63gRktFosaO+MPfGisbYnikuwaa1eTNVarUucTNc+Fe+xLnqf6NQUs5uP
 Ziuno2dE8s3sf6sRKo7nwVuXDXqDqNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-fRO_3F_rNAKxaOavvoA-MA-1; Thu, 18 Aug 2022 14:45:15 -0400
X-MC-Unique: fRO_3F_rNAKxaOavvoA-MA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FE96811E80;
 Thu, 18 Aug 2022 18:45:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6F8B492C3B;
 Thu, 18 Aug 2022 18:45:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v3 30/31] ACPI: video: Fix indentation of
 video_detect_dmi_table[] entries
Date: Thu, 18 Aug 2022 20:43:01 +0200
Message-Id: <20220818184302.10051-31-hdegoede@redhat.com>
In-Reply-To: <20220818184302.10051-1-hdegoede@redhat.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The video_detect_dmi_table[] uses an unusual indentation for
before the ".name = ..." named struct initializers.

Instead of being indented with an extra tab compared to
the previous line's '{' these are indented to with only
a single space to allow for long DMI_MATCH() lines without
wrapping.

But over time some entries did not event have the single space
indent in front of the ".name = ..." lines.

Make things consistent by using a single space indent for these
lines everywhere.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 48 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 150ef8214c73..9b84657f8f6a 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -142,17 +142,17 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 	{
-	.callback = video_detect_force_vendor,
-	/* Asus UL30VT */
-	.matches = {
+	 .callback = video_detect_force_vendor,
+	 /* Asus UL30VT */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
 		DMI_MATCH(DMI_PRODUCT_NAME, "UL30VT"),
 		},
 	},
 	{
-	.callback = video_detect_force_vendor,
-	/* Asus UL30A */
-	.matches = {
+	 .callback = video_detect_force_vendor,
+	 /* Asus UL30A */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
 		DMI_MATCH(DMI_PRODUCT_NAME, "UL30A"),
 		},
@@ -198,9 +198,9 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 	{
-	.callback = video_detect_force_vendor,
-	/* GIGABYTE GB-BXBT-2807 */
-	.matches = {
+	 .callback = video_detect_force_vendor,
+	 /* GIGABYTE GB-BXBT-2807 */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
 		DMI_MATCH(DMI_PRODUCT_NAME, "GB-BXBT-2807"),
 		},
@@ -233,17 +233,17 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 	{
-	.callback = video_detect_force_vendor,
-	/* Sony VPCEH3U1E */
-	.matches = {
+	 .callback = video_detect_force_vendor,
+	 /* Sony VPCEH3U1E */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
 		DMI_MATCH(DMI_PRODUCT_NAME, "VPCEH3U1E"),
 		},
 	},
 	{
-	.callback = video_detect_force_vendor,
-	/* Xiaomi Mi Pad 2 */
-	.matches = {
+	 .callback = video_detect_force_vendor,
+	 /* Xiaomi Mi Pad 2 */
+	 .matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
 		},
@@ -551,25 +551,25 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 	{
-	.callback = video_detect_force_native,
-	/* ASUSTeK COMPUTER INC. GA401 */
-	.matches = {
+	 .callback = video_detect_force_native,
+	 /* ASUSTeK COMPUTER INC. GA401 */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 		DMI_MATCH(DMI_PRODUCT_NAME, "GA401"),
 		},
 	},
 	{
-	.callback = video_detect_force_native,
-	/* ASUSTeK COMPUTER INC. GA502 */
-	.matches = {
+	 .callback = video_detect_force_native,
+	 /* ASUSTeK COMPUTER INC. GA502 */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 		DMI_MATCH(DMI_PRODUCT_NAME, "GA502"),
 		},
 	},
 	{
-	.callback = video_detect_force_native,
-	/* ASUSTeK COMPUTER INC. GA503 */
-	.matches = {
+	 .callback = video_detect_force_native,
+	 /* ASUSTeK COMPUTER INC. GA503 */
+	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 		DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
 		},
-- 
2.37.2

