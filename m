Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E021805D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB0E6E889;
	Wed,  8 Jul 2020 07:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433026E212
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:37:02 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id cv18so1083152pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bmIb4cH2dMGtvHMr8FQlvNy97HPJZVEYJ99uMcxhXoU=;
 b=Wp0hPuYPNTBfQkHFnUoNn4p67iZB5+2ozxyZ3kliqMA5nY9Q04iNE3hoEJs/GpAtHv
 GyAjbzVHFfi8KBDEb7tkLyIPqoO5HmS03vFdNsbWGlFA94O9tgzoTMHTJ2VCGEi/n8Hi
 njHnFsOYwCbTZgGjwpnRsYijy+X1Z4eebvlHugPyFJ9nBRVquoyjEe5ayq0Pma8ntx1T
 j4woHGEArYUarHKF/WRSiq2l+XOKMOpeXPANnKVc0X+tMc/D6743UGgDqN69KJs0qtQM
 Mb5KFeCTs0JctQoyYqei2ledsOy0Q6KwQEeEUQD8lUGxl4Csxw+7EmDjpuj9QuiqLRvc
 zv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bmIb4cH2dMGtvHMr8FQlvNy97HPJZVEYJ99uMcxhXoU=;
 b=rvORO6cDSPX4MWvNzVGAk4sIlrNIG7yWPeks/5VZTohC0++Yizp9WsY+UXb6M6Q1PO
 C55yes0R84SPQzZ79NJZ+M7KE4v3RuPAv+RCCBnK6ucf8fsVr9HFFyl2kM/GjF0gZuh/
 lyFCsR+9tuUuV1jfMl9+neWUyWiIUO5eKCo83IixcJ/V74Za02BRUFiBT233sNsQN7Ld
 hisf/QpI1pWO8M7HO7LWSYXCj3GLiO9VDBrRXClm7wDAZwvDQZlHcTJj5bVfL7Lkw6Wx
 eHWv2oF2KcmrCXn68Z6yzueBps4wroePDOWMV6xmeE6qh42THPCzqC2M3uhKGEgGWsc6
 uLLA==
X-Gm-Message-State: AOAM5327+OKgDnvJVmVrNzrZuCEF6imrYSVj0MKvv+KajkMY+02d5wVG
 io1FRmLUDPAbK493acYZ194=
X-Google-Smtp-Source: ABdhPJyFmHLpBCDY983fqPseLSiKhKoVuE3WzXBRRWWP52glRCodprglB0nT1ljdxGPfkgY8t3nx4Q==
X-Received: by 2002:a17:90a:2048:: with SMTP id
 n66mr5435327pjc.71.1594139822038; 
 Tue, 07 Jul 2020 09:37:02 -0700 (PDT)
Received: from blackclown ([103.88.82.137])
 by smtp.gmail.com with ESMTPSA id y12sm22966423pfm.158.2020.07.07.09.36.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 09:37:01 -0700 (PDT)
Date: Tue, 7 Jul 2020 22:06:47 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/4] drm: edid: Convert logging to drm_* functions.
Message-ID: <f40659c5656da4e1e3fad9cb731ed7f72feda3e3.1594136880.git.usuraj35@gmail.com>
References: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1594136880.git.usuraj35@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1522525367=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1522525367==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Change logging of warnings to drm_warn() form dev_warn().

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 31496b6cfc56..ad7a1f9817ed 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1844,9 +1844,8 @@ static void connector_bad_edid(struct drm_connector *=
connector,
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
=20
-	dev_warn(connector->dev->dev,
-		 "%s: EDID is invalid:\n",
-		 connector->name);
+	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
+
 	for (i =3D 0; i < num_blocks; i++) {
 		u8 *block =3D edid + i * EDID_LENGTH;
 		char prefix[20];
@@ -5284,7 +5283,7 @@ int drm_add_edid_modes(struct drm_connector *connecto=
r, struct edid *edid)
 	}
 	if (!drm_edid_is_valid(edid)) {
 		clear_eld(connector);
-		dev_warn(connector->dev->dev, "%s: EDID invalid.\n",
+		drm_warn(connector->dev, "%s: EDID invalid.\n",
 			 connector->name);
 		return 0;
 	}
--=20
2.17.1


--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8EpJ8ACgkQ+gRsbIfe
746TcxAAkZNg/BfOOLgsJCdKiHfjZ+G8VmgQse7Oe491c79h5M7ehjraS2gAuXCu
7Ih7idgIH6BhEGhgTGumv+VDPHNZ1qxIGyhkxts5qDHcBnnOWwhIoT13v3YvgADp
ZccQRXRKMzs/6F1qqoUzmDWXRivdP17pao5Ybu+7+ZRlB3lE/q48zxoha6mBl53m
Y8+QZVYA6tidiCG+cc3KixVwYQEJBohuESbp9IShN8paS6OorxLOxf4ud2AvZolO
zDNwgkuHrkOY4/OMSikmcM3ydyGN+Z5OhySDDf72wmKByzRfeBATEZntzV9NugIr
+rfJddHV9COwm81g8SKEPIBagJaP2+gs3nwYpVe+Ey0mtapmKhQNe8pormdvmmMl
/ggI12SbHCNQ4dZ91biGhPTIDs7boEpPyNvfkAclY0YuWo6BlY3QGWYKvaZDnh5n
kyYpoSdA4SHy/auncAk0LPwgtaEONVTRF6oylKGAsfy4ht2l+8yZhxsaFBmPlsNO
YLURe/P24F3rfXm8vzSzw90B5vkRsttPAE6AJEoxOYXiHut8+74OkJllCCuH1ArG
xVxFV6O8zLK02PAWcdzQwBoqI+K7DrPHp/yKX0CH36PRzgQ1DeNaLp/zjKo8H8pB
o+JjSYvIVcYQkQ6nEsq9PqPLtyjndY4heDgYLUZ6vAalJUJpoJs=
=4ifc
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============1522525367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1522525367==--
