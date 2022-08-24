Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F659F9DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494EB3B96;
	Wed, 24 Aug 2022 12:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135ECA2DE4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661343462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbidEuEmj0ip+acThUaZ1lCAqpjH/7g5iKO2PKg0/CQ=;
 b=V97fIiKTPHNU3ufbo/kKpxRlY9YhVoJ3i96m2XEPbdpjIdgYMFfU31nOJcPpzJt0+TjnaK
 sV9Ur4qY6TJWxs2lOvLbjHrRb9ct1ZiKKvBtTv/XAfmDfMHvZGMvnn6I5EReXqMLBW99uE
 LWaCP7zhNgGlwcJDKPPnRirwUScj2VE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-lBH7e1d8McaHr1w8U31DYw-1; Wed, 24 Aug 2022 08:17:38 -0400
X-MC-Unique: lBH7e1d8McaHr1w8U31DYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A52E294EDF4;
 Wed, 24 Aug 2022 12:17:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C92C15BBA;
 Wed, 24 Aug 2022 12:17:33 +0000 (UTC)
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
Subject: [PATCH v4 29/31] ACPI: video: Drop NL5x?U,
 PF4NU1F and PF5?U?? acpi_backlight=native quirks
Date: Wed, 24 Aug 2022 14:15:21 +0200
Message-Id: <20220824121523.1291269-30-hdegoede@redhat.com>
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
Cc: Werner Sembach <wse@tuxedocomputers.com>, linux-acpi@vger.kernel.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

acpi_backlight=native is the default for these, but as the comment
explains the quirk was still necessary because even briefly registering
the acpi_video0 backlight; and then unregistering it once the native
driver showed up, was leading to issues.

After the "ACPI: video: Make backlight class device registration
a separate step" patch from earlier in this patch-series, we no
longer briefly register the acpi_video0 backlight on systems where
the native driver should be used.

So this is no longer an issue an the quirks are no longer needed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215683
Tested-by: Werner Sembach <wse@tuxedocomputers.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 92 +------------------------------------
 1 file changed, 1 insertion(+), 91 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index af2833b57b8b..789d5913c178 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -609,97 +609,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "N250P"),
 		},
 	},
-	/*
-	 * Clevo NL5xRU and NL5xNU/TUXEDO Aura 15 Gen1 and Gen2 have both a
-	 * working native and video interface. However the default detection
-	 * mechanism first registers the video interface before unregistering
-	 * it again and switching to the native interface during boot. This
-	 * results in a dangling SBIOS request for backlight change for some
-	 * reason, causing the backlight to switch to ~2% once per boot on the
-	 * first power cord connect or disconnect event. Setting the native
-	 * interface explicitly circumvents this buggy behaviour, by avoiding
-	 * the unregistering process.
-	 */
-	{
-	.callback = video_detect_force_native,
-	.ident = "Clevo NL5xRU",
-	.matches = {
-		DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "Clevo NL5xRU",
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
-		DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "Clevo NL5xRU",
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
-		DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "Clevo NL5xNU",
-	.matches = {
-		DMI_MATCH(DMI_BOARD_NAME, "NL5xNU"),
-		},
-	},
-	/*
-	 * The TongFang PF5PU1G, PF4NU1F, PF5NU1G, and PF5LUXG/TUXEDO BA15 Gen10,
-	 * Pulse 14/15 Gen1, and Pulse 15 Gen2 have the same problem as the Clevo
-	 * NL5xRU and NL5xNU/TUXEDO Aura 15 Gen1 and Gen2. See the description
-	 * above.
-	 */
-	{
-	.callback = video_detect_force_native,
-	.ident = "TongFang PF5PU1G",
-	.matches = {
-		DMI_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "TongFang PF4NU1F",
-	.matches = {
-		DMI_MATCH(DMI_BOARD_NAME, "PF4NU1F"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "TongFang PF4NU1F",
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
-		DMI_MATCH(DMI_BOARD_NAME, "PULSE1401"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "TongFang PF5NU1G",
-	.matches = {
-		DMI_MATCH(DMI_BOARD_NAME, "PF5NU1G"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "TongFang PF5NU1G",
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
-		DMI_MATCH(DMI_BOARD_NAME, "PULSE1501"),
-		},
-	},
-	{
-	.callback = video_detect_force_native,
-	.ident = "TongFang PF5LUXG",
-	.matches = {
-		DMI_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
-		},
-	},
+
 	/*
 	 * Desktops which falsely report a backlight and which our heuristics
 	 * for this do not catch.
-- 
2.37.2

