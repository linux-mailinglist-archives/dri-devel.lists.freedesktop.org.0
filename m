Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7ECA24F9
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 05:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826D710E060;
	Thu,  4 Dec 2025 04:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BzPTFa71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB6B10E060
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 04:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1764822245;
 bh=BXE6hn5nq8j4ofoVYk0Rc0dzUxB1lF/vr2l2CPMdU1A=;
 h=Date:From:To:Cc:Subject:From;
 b=BzPTFa71aypDUSq0CHs67l7MLu7rSjiH12xJm2LlrSWvFN+yjHV8YQR1iBwhsmX5X
 xRKWX5UTfAmkSqkanvKobiv1tSilAQbS/LI1LTSpMLWnmuBwS9Ha3Rhh1UYEUyRogy
 2qsb85FxGVHoBxbG9cQhxqxabWbFsTelh9hyFj6Th7Eq1x8mcTPjhE/zBm9vyJnTbs
 9s86r45nyUeoSMxj+h3eb+RLCnNZb4S85qHilME0uYQZ51vT24poUKFS/2ouYdAT+K
 cPpPM9N8UWfyfzL9tZG7WcBNlRO6ZZT67uXTJuoEtsZ0FgCGUtlPOugFBmOHJM4ECd
 Pjjkx9muHhlmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMLxJ1Qhpz4wD3;
 Thu, 04 Dec 2025 15:24:03 +1100 (AEDT)
Date: Thu, 4 Dec 2025 15:24:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ivan Lipski
 <ivan.lipski@amd.com>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20251204152403.256c135a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yvvg16X6cGoLP2a/za_lWTP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/yvvg16X6cGoLP2a/za_lWTP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4026:13: error:=
 redefinition of 'are_sinks_equal'
 4026 | static bool are_sinks_equal(const struct dc_sink *sink1, const stru=
ct dc_sink *sink2)
      |             ^~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3935:13: note: =
previous definition of 'are_sinks_equal' with type 'bool(const struct dc_si=
nk *, const struct dc_sink *)' {aka '_Bool(const struct dc_sink *, const st=
ruct dc_sink *)'}
 3935 | static bool are_sinks_equal(const struct dc_sink *sink1, const stru=
ct dc_sink *sink2)
      |             ^~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4058:13: error:=
 redefinition of 'hdmi_hpd_debounce_work'
 4058 | static void hdmi_hpd_debounce_work(struct work_struct *work)
      |             ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: note: =
previous definition of 'hdmi_hpd_debounce_work' with type 'void(struct work=
_struct *)'
 3967 | static void hdmi_hpd_debounce_work(struct work_struct *work)
      |             ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: error:=
 'hdmi_hpd_debounce_work' defined but not used [-Werror=3Dunused-function]
cc1: all warnings being treated as errors

Caused by commit

  c918e75e1ed9 ("drm/amd/display: Add an HPD filter for HDMI")

merging badly with commit

  c97da4785b3b ("drm/amd/display: Add an HPD filter for HDMI")

from Linus' tree :-(

I have applied the following merge fix patch for tosay.

=46rom 1be223e7e9978a416cbdb835ea283da95abf7b58 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Dec 2025 14:43:35 +1100
Subject: [PATCH] fix up for duplicate commit "drm/amd/display: Add an HPD
 filter for HDMI"

merging badly

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 91 -------------------
 1 file changed, 91 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8b43d49dffcd..740711ac1037 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3949,97 +3949,6 @@ static bool are_sinks_equal(const struct dc_sink *si=
nk1, const struct dc_sink *s
 }
=20
=20
-/**
- * DOC: hdmi_hpd_debounce_work
- *
- * HDMI HPD debounce delay in milliseconds. When an HDMI display toggles H=
PD
- * (such as during power save transitions), this delay determines how long=
 to
- * wait before processing the HPD event. This allows distinguishing betwee=
n a
- * physical unplug (>hdmi_hpd_debounce_delay)
- * and a spontaneous RX HPD toggle (<hdmi_hpd_debounce_delay).
- *
- * If the toggle is less than this delay, the driver compares sink capabil=
ities
- * and permits a hotplug event if they changed.
- *
- * The default value of 1500ms was chosen based on experimental testing wi=
th
- * various monitors that exhibit spontaneous HPD toggling behavior.
- */
-static void hdmi_hpd_debounce_work(struct work_struct *work)
-{
-	struct amdgpu_dm_connector *aconnector =3D
-		container_of(to_delayed_work(work), struct amdgpu_dm_connector,
-			     hdmi_hpd_debounce_work);
-	struct drm_connector *connector =3D &aconnector->base;
-	struct drm_device *dev =3D connector->dev;
-	struct amdgpu_device *adev =3D drm_to_adev(dev);
-	struct dc *dc =3D aconnector->dc_link->ctx->dc;
-	bool fake_reconnect =3D false;
-	bool reallow_idle =3D false;
-	bool ret =3D false;
-	guard(mutex)(&aconnector->hpd_lock);
-
-	/* Re-detect the display */
-	scoped_guard(mutex, &adev->dm.dc_lock) {
-		if (dc->caps.ips_support && dc->ctx->dmub_srv->idle_allowed) {
-			dc_allow_idle_optimizations(dc, false);
-			reallow_idle =3D true;
-		}
-		ret =3D dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD);
-	}
-
-	if (ret) {
-		/* Apply workaround delay for certain panels */
-		apply_delay_after_dpcd_poweroff(adev, aconnector->dc_sink);
-		/* Compare sinks to determine if this was a spontaneous HPD toggle */
-		if (are_sinks_equal(aconnector->dc_link->local_sink, aconnector->hdmi_pr=
ev_sink)) {
-			/*
-			* Sinks match - this was a spontaneous HDMI HPD toggle.
-			*/
-			drm_dbg_kms(dev, "HDMI HPD: Sink unchanged after debounce, internal re-=
enable\n");
-			fake_reconnect =3D true;
-		}
-
-		/* Update connector state */
-		amdgpu_dm_update_connector_after_detect(aconnector);
-
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		/* Only notify OS if sink actually changed */
-		if (!fake_reconnect && aconnector->base.force =3D=3D DRM_FORCE_UNSPECIFI=
ED)
-			drm_kms_helper_hotplug_event(dev);
-	}
-
-	/* Release the cached sink reference */
-	if (aconnector->hdmi_prev_sink) {
-		dc_sink_release(aconnector->hdmi_prev_sink);
-		aconnector->hdmi_prev_sink =3D NULL;
-	}
-
-	scoped_guard(mutex, &adev->dm.dc_lock) {
-		if (reallow_idle && dc->caps.ips_support)
-			dc_allow_idle_optimizations(dc, true);
-	}
-}
-
-static bool are_sinks_equal(const struct dc_sink *sink1, const struct dc_s=
ink *sink2)
-{
-	if (!sink1 || !sink2)
-		return false;
-	if (sink1->sink_signal !=3D sink2->sink_signal)
-		return false;
-
-	if (sink1->dc_edid.length !=3D sink2->dc_edid.length)
-		return false;
-
-	if (memcmp(sink1->dc_edid.raw_edid, sink2->dc_edid.raw_edid,
-		   sink1->dc_edid.length) !=3D 0)
-		return false;
-	return true;
-}
-
-
 /**
  * DOC: hdmi_hpd_debounce_work
  *
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/yvvg16X6cGoLP2a/za_lWTP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxDOMACgkQAVBC80lX
0Gz8DAf/YT+SCynk/0I2YXXGSjMXHjBQIBFdMbIM7aRoIReabnqxVtP8caXVgzl1
TTG6akcdDJfWk1Xy79tJVJSZIdpfU8Y9ogk12f/N2FOMnqirZA6ATrRT/pN7IUwT
HIMwFYVT0UHhDZ09WrsvHEwbeipeDAp0KTNU0uub3Qa6yxysEQw/r2aRcrCUM6ze
eUF8ObOfHEBCBozlwxxMAEXZE17rpqFEOwT5+eey+2xsDp3QfoGWZaPvIjEupCJF
aLBzlEPRwWLPJWqUnnv1Zo60d6kPOG9/f6LqqyoDcJbws1QJM612LGbXSBSHQfTz
rnqamEaB5WSmfYr/+iMdADY3uhyK6w==
=Tflq
-----END PGP SIGNATURE-----

--Sig_/yvvg16X6cGoLP2a/za_lWTP--
