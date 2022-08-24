Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A159F9DE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FD7B3CC6;
	Wed, 24 Aug 2022 12:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8936AB56D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661343468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPWkXqG/dkFynN2yzybx6rf6xgee1LF0KIfwbNO4jV8=;
 b=NuNEacCIM1WMfKUQ3p1wGe4hl17pGVC5dQrQALULOzECJgREiiiPCGJ51mVr960TIcPgcp
 825LEhXOUL/LqNLLSdYxk9hPDASy9RgwVqr3xrDkahjpNhDh1ca5up4fQah329SFR0moTX
 LeRgtIzPBd69QQXNPjDMezNI4t+24X4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-xo5zdgXaNje8d4LNwok-xw-1; Wed, 24 Aug 2022 08:17:42 -0400
X-MC-Unique: xo5zdgXaNje8d4LNwok-xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9828285A58B;
 Wed, 24 Aug 2022 12:17:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0E08C15BB3;
 Wed, 24 Aug 2022 12:17:37 +0000 (UTC)
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
Subject: [PATCH v4 30/31] ACPI: video: Fix indentation of
 video_detect_dmi_table[] entries
Date: Wed, 24 Aug 2022 14:15:22 +0200
Message-Id: <20220824121523.1291269-31-hdegoede@redhat.com>
In-Reply-To: <20220824121523.1291269-1-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
index 789d5913c178..db2474fe58ac 100644
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

