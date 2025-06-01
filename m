Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88CACA155
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB9B10E37E;
	Sun,  1 Jun 2025 23:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NzmgaCqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38410E382
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:26:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 04111438B0;
 Sun,  1 Jun 2025 23:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF38C4CEF3;
 Sun,  1 Jun 2025 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820374;
 bh=xa9mcLquqyE8Ns9kWVvZRvCUiMOgE2o7iCSaJ0boKkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NzmgaCqZ+OSzfx4Bd2CCIReFXnElr/0ljqk/aLNWpOmUM/iMD5cOogex3xOuYjtyG
 RWO/eSXOkDPC1+sL+EkTTM27zPQDg7q7PekhV1gKp7MV8BE44zn6a3UUjvGUY8R+FD
 wPNWEzowabMYcIXD8vU0e+HiMwdqYv9dUbeTzhOifEVwRXzm+Dc9mNyP1U4x23JYXp
 MBR0SZKW815BzBdCsRNB3tvDHsindFabMuwMz3LV1GKGr8q8KtJSgaqQz3S4eYQy06
 nKdUnI/D2sF8PK+chEvVJlZhLJ9+lT2SLn4IF3vMZ7oFuv0y5fookmlQ6/CvJfQPDN
 +6UOjxNw3IcwQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>, Hans de Goede <hdegoede@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 038/110] drm: panel-orientation-quirks: Add ZOTAC
 Gaming Zone
Date: Sun,  1 Jun 2025 19:23:20 -0400
Message-Id: <20250601232435.3507697-38-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vicki Pfau <vi@endrift.com>

[ Upstream commit 96c85e428ebaeacd2c640eba075479ab92072ccd ]

Add a panel orientation quirk for the ZOTAC Gaming Zone handheld gaming device.

Signed-off-by: Vicki Pfau <vi@endrift.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250313211643.860786-2-vi@endrift.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Extensive Analysis:** **1. Pattern Matching with Historical Commits:**
The commit follows an identical pattern to all the similar commits
marked as "Backport Status: YES" in the reference examples: - GPD Win3
(YES): Added DMI quirk for handheld gaming device with specific
vendor/product matching - OrangePi Neo (YES): Added DMI quirk for gaming
handheld with same pattern - GPD Win Mini (YES): Added gaming device
quirk with identical structure - GPD Win Max (YES): Added gaming device
quirk following same format **2. Code Analysis:** The change is
extremely minimal and safe: ```c + }, { /bin /bin.usr-is-merged /boot
/dev /etc /home /init /lib /lib.usr-is-merged /lib64 /lost+found /media
/mnt /opt /proc /root /run /sbin /sbin.usr-is-merged /snap /srv /sys
/tmp /usr /var ZOTAC Gaming Zone model/ prompt/ src/ target/ + .matches
= { + DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"), +
DMI_EXACT_MATCH(DMI_BOARD_NAME, "G0A1W"), + }, + .driver_data = (void
*)&lcd1080x1920_leftside_up, ``` This adds exactly 6 lines to the
`orientation_data[]` array in
`drivers/gpu/drm/drm_panel_orientation_quirks.c:500`. The change: - Uses
existing, well-tested infrastructure (`lcd1080x1920_leftside_up` data
structure already defined at line 120-124) - Employs standard DMI
matching with `DMI_EXACT_MATCH()` for precise device identification -
References an existing orientation configuration, introducing zero new
logic - Is completely isolated and cannot affect other devices due to
highly specific DMI matching **3. Bug Fix Nature:** This addresses a
real user-affecting bug - incorrect screen orientation on ZOTAC Gaming
Zone handhelds. Without this quirk: - The display appears rotated
incorrectly - Users experience poor usability with graphics rotated 90
degrees - Gaming on the device is significantly impacted **4. Risk
Assessment:** - **Minimal regression risk**: The DMI matching is highly
specific (`DMI_SYS_VENDOR="ZOTAC"` AND `DMI_BOARD_NAME="G0A1W"`) - **No
architectural changes**: Uses existing quirk framework - **No new
features**: Pure bug fix for hardware support - **Contained scope**:
Only affects this specific ZOTAC device model **5. Stable Tree
Compliance:** ✅ **Important bug fix**: Fixes screen orientation for
users ✅ **Small and contained**: 6-line addition using existing
infrastructure ✅ **No side effects**: Cannot impact other devices due to
specific DMI matching ✅ **No architectural changes**: Pure data addition
to existing quirk table ✅ **Critical subsystem**: Display orientation
affects basic usability ✅ **Follows established pattern**: Identical to
other gaming handheld quirks that were backported **6. Historical
Precedent:** All similar gaming handheld orientation quirks in the
reference examples were marked "Backport Status: YES", establishing
clear precedent that these types of device-specific orientation fixes
are appropriate for stable backporting. **7. User Impact:** Gaming
handhelds are consumer devices where display orientation directly
impacts usability. Users of ZOTAC Gaming Zone devices currently
experience a rotated display, making the device difficult or impossible
to use properly until this fix is applied. The commit perfectly matches
the stable kernel criteria: it's a small, important bug fix with minimal
risk that improves hardware support for end users.

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c554ad8f246b6..7ac0fd5391fea 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -517,6 +517,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* ZOTAC Gaming Zone */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "G0A1W"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* One Mix 2S (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
-- 
2.39.5

