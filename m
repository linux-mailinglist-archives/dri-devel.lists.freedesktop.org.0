Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AABB54994
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB2610EBF9;
	Fri, 12 Sep 2025 10:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="YB4PZmZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0D810EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=References:In-Reply-To:Cc:To:Subject:Message-ID:From:
 Content-Type:Date:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jp6tZJQ5PK7UkbEWMD4w6o8NkPzYqmyOtikgxlfuTMc=; b=YB4PZmZUgJma2ZpzN3O5T0P12o
 SOdYwrje4i2p7EbD/Vsu2Q2YClKrh8H9EpaWmRsxvMf1/HM7YyXv2NJ1SwpIb0j4QbOSjqvHf8fiG
 GABr7btWCvgGe8FkUNWXFt2b1P2USPAQPa7fxDRckMYdCCqwJ+cvxNk9q4hPzQSu/l4j/Nn1I5rYS
 g3E9jbDVY7ZmsXo9NwBztn//dsIOhyZss+v8lJ6Cz327B73xwLrDDlzP1auU1SgsCZ+gHbN5DSdFE
 P4+UxgQ5gmZTaAYCkEgrH9Ixe/xcRIyOwOx2ZlPteRyEuaf+pvl4Jop30NX0sYNbnacMcH1Au/G3T
 Hl1QYhCA==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sarha@kapsi.fi>) id 1ux0Mw-001AFl-1t;
 Fri, 12 Sep 2025 12:47:02 +0300
MIME-Version: 1.0
Date: Fri, 12 Sep 2025 09:47:00 +0000
Content-Type: multipart/alternative;
 boundary="f75fe12f-d9c4-4b06-a56a-74036f02732d-1"
From: "Jyri Sarha" <sarha@kapsi.fi>
Message-ID: <2fa8a9b83e3430482e546bd4d1fe20ee48d76d09@kapsi.fi>
TLS-Required: No
Subject: Re: [PATCH v3 30/39] drm/tilcdc: Switch to
 drm_atomic_get_new_crtc_state()
To: "Maxime Ripard" <mripard@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, "Maxime Ripard" <mripard@kernel.org>,
 "=?utf-8?B?VmlsbGUgU3lyasOkbMOk?=" <ville.syrjala@linux.intel.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-30-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-30-1c7a7d960c33@kernel.org>
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

--f75fe12f-d9c4-4b06-a56a-74036f02732d-1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

September 9, 2025 at 2:27 PM, "Maxime Ripard" <mripard@kernel.org mailto:=
mripard@kernel.org?to=3D%22Maxime%20Ripard%22%20%3Cmripard%40kernel.org%3=
E > wrote:


>=20
>=20The tilcdc atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
>=20
>=20This hook is called as part of the global atomic_check, thus before t=
he
> states are swapped. The existing state thus points to the new state, an=
d
> we can use drm_atomic_get_new_crtc_state() instead.
>=20
>=20Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
Acked-by:=20Jyri Sarha <jyri.sarha@iki.fi>

Best regards,
Jyri
--f75fe12f-d9c4-4b06-a56a-74036f02732d-1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><meta http-equiv=3D"Content-Type" content=3D"t=
ext/html; charset=3Dutf-8"></head><body><div><br><br></div><p>September 9=
, 2025 at 2:27 PM, "Maxime Ripard" &lt;<a href=3D"mailto:mripard@kernel.o=
rg?to=3D%22Maxime%20Ripard%22%20%3Cmripard%40kernel.org%3E" target=3D"_bl=
ank" tabindex=3D"-1">mripard@kernel.org</a>&gt; wrote:</p><blockquote>The=
 tilcdc atomic_check implementation uses the deprecated<br>drm_atomic_get=
_existing_crtc_state() helper.<br><br>This hook is called as part of the =
global atomic_check, thus before the<br>states are swapped. The existing =
state thus points to the new state, and<br>we can use drm_atomic_get_new_=
crtc_state() instead.<br><br>Reviewed-by: Ville Syrj=C3=A4l=C3=A4 &lt;vil=
le.syrjala@linux.intel.com&gt;<br>Signed-off-by: Maxime Ripard &lt;mripar=
d@kernel.org&gt;<br></blockquote><div>Acked-by: Jyri Sarha &lt;jyri.sarha=
@iki.fi&gt;</div><div><br></div><div>Best regards,</div><div>Jyri</div></=
body></html>
--f75fe12f-d9c4-4b06-a56a-74036f02732d-1--
