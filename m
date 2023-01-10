Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E27664218
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 14:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6099910E5C1;
	Tue, 10 Jan 2023 13:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 10 Jan 2023 13:40:16 UTC
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC25210E5EC;
 Tue, 10 Jan 2023 13:40:16 +0000 (UTC)
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP
 (IdeaSmtpServer 5.1.0)
 id 738d32768f577adf; Tue, 10 Jan 2023 14:33:35 +0100
Received: from kreacher.localnet (unknown [213.134.183.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v370.home.net.pl (Postfix) with ESMTPSA id D7E4C26294DB;
 Tue, 10 Jan 2023 14:33:34 +0100 (CET)
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] ACPI: Fix selecting the wrong ACPI fwnode for the iGPU on
 some Dell laptops
Date: Tue, 10 Jan 2023 14:33:34 +0100
Message-ID: <5655985.DvuYhMxLoT@kreacher>
In-Reply-To: <20230109205721.60694-1-hdegoede@redhat.com>
References: <20230109205721.60694-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.183.108
X-CLIENT-HOSTNAME: 213.134.183.108
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpedvffeuiedtgfdvtddugeeujedtffetteegfeekffdvfedttddtuefhgeefvdejhfenucfkphepvddufedrudefgedrudekfedruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudefrddufeegrddukeefrddutdekpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopeekpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhkrgdrfigvshhtvghrsggvrhhgsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhn
 thgvlhdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhgvnhgssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=8 Fuz1=8 Fuz2=8
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, January 9, 2023 9:57:21 PM CET Hans de Goede wrote:
> The Dell Latitude E6430 both with and without the optional NVidia dGPU
> has a bug in its ACPI tables which is causing Linux to assign the wrong
> ACPI fwnode / companion to the pci_device for the i915 iGPU.
> 
> Specifically under the PCI root bridge there are these 2 ACPI Device()s :
> 
>  Scope (_SB.PCI0)
>  {
>      Device (GFX0)
>      {
>          Name (_ADR, 0x00020000)  // _ADR: Address
>      }
> 
>      ...
> 
>      Device (VID)
>      {
>          Name (_ADR, 0x00020000)  // _ADR: Address
>          ...
> 
>          Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
>          {
>              VDP8 = Arg0
>              VDP1 (One, VDP8)
>          }
> 
>          Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
>          {
>              ...
>          }
>          ...
>      }
>  }
> 
> The non-functional GFX0 ACPI device is a problem, because this gets
> returned as ACPI companion-device by acpi_find_child_device() for the iGPU.
> 
> This is a long standing problem and the i915 driver does use the ACPI
> companion for some things, but works fine without it.
> 
> However since commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
> acpi_get_pci_dev() relies on the physical-node pointer in the acpi_device
> and that is set on the wrong acpi_device because of the wrong
> acpi_find_child_device() return. This breaks the ACPI video code, leading
> to non working backlight control in some cases.

Interesting.  Sorry for the trouble.

> Make find_child_checks() return a higher score for children which have
> pnp-ids set by various scan helpers like acpi_is_video_device(), so
> that it picks the right companion-device.

This has a potential of changing the behavior in some cases that are not
relevant here which is generally risky.

> An alternative approach would be to directly call acpi_is_video_device()
> from find_child_checks() but that would be somewhat computationally
> expensive given that acpi_find_child_device() iterates over all the
> PCI0 children every time it is called.

I agree with the above, but my fix would be something like the patch below (not
really tested, but it builds).

---
 drivers/acpi/glue.c     |   14 ++++++++++++--
 drivers/acpi/scan.c     |    7 +++++--
 include/acpi/acpi_bus.h |    3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

Index: linux-pm/include/acpi/acpi_bus.h
===================================================================
--- linux-pm.orig/include/acpi/acpi_bus.h
+++ linux-pm/include/acpi/acpi_bus.h
@@ -230,7 +230,8 @@ struct acpi_pnp_type {
 	u32 hardware_id:1;
 	u32 bus_address:1;
 	u32 platform_id:1;
-	u32 reserved:29;
+	u32 backlight:1;
+	u32 reserved:28;
 };
 
 struct acpi_device_pnp {
Index: linux-pm/drivers/acpi/scan.c
===================================================================
--- linux-pm.orig/drivers/acpi/scan.c
+++ linux-pm/drivers/acpi/scan.c
@@ -1370,9 +1370,12 @@ static void acpi_set_pnp_ids(acpi_handle
 		 * Some devices don't reliably have _HIDs & _CIDs, so add
 		 * synthetic HIDs to make sure drivers can find them.
 		 */
-		if (acpi_is_video_device(handle))
+		if (acpi_is_video_device(handle)) {
 			acpi_add_id(pnp, ACPI_VIDEO_HID);
-		else if (acpi_bay_match(handle))
+			pnp->type.backlight = 1;
+			break;
+		}
+		if (acpi_bay_match(handle))
 			acpi_add_id(pnp, ACPI_BAY_HID);
 		else if (acpi_dock_match(handle))
 			acpi_add_id(pnp, ACPI_DOCK_HID);
Index: linux-pm/drivers/acpi/glue.c
===================================================================
--- linux-pm.orig/drivers/acpi/glue.c
+++ linux-pm/drivers/acpi/glue.c
@@ -75,7 +75,8 @@ static struct acpi_bus_type *acpi_get_bu
 }
 
 #define FIND_CHILD_MIN_SCORE	1
-#define FIND_CHILD_MAX_SCORE	2
+#define FIND_CHILD_MID_SCORE	2
+#define FIND_CHILD_MAX_SCORE	3
 
 static int match_any(struct acpi_device *adev, void *not_used)
 {
@@ -96,8 +97,17 @@ static int find_child_checks(struct acpi
 		return -ENODEV;
 
 	status = acpi_evaluate_integer(adev->handle, "_STA", NULL, &sta);
-	if (status == AE_NOT_FOUND)
+	if (status == AE_NOT_FOUND) {
+		/*
+		 * Special case: backlight device objects without _STA are
+		 * preferred to other objects with the same _ADR value, because
+		 * it is more likely that they are actually useful.
+		 */
+		if (adev->pnp.type.backlight)
+			return FIND_CHILD_MID_SCORE;
+
 		return FIND_CHILD_MIN_SCORE;
+	}
 
 	if (ACPI_FAILURE(status) || !(sta & ACPI_STA_DEVICE_ENABLED))
 		return -ENODEV;



