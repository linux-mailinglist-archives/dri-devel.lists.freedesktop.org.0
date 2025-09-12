Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC4B54988
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F2210E19B;
	Fri, 12 Sep 2025 10:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="A4tbBKe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2324 seconds by postgrey-1.36 at gabe;
 Fri, 12 Sep 2025 10:22:18 UTC
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A443410E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=References:In-Reply-To:Cc:To:Subject:Message-ID:From:
 Content-Type:Date:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=06HXAgLdpsP/SC9+twR7VnMUYtG9ZyIOmFcxnLcxqjc=; b=A4tbBKe1WK9w2X4fSwqh2wTEt9
 0XCgrooqXO2aA7iA3qBkUjCqS6c/6fsePvtZVF+J8VOAzwzwlRfj+x30PSf1y/OrITsVO4swJZbss
 h7/y9L5oLteUUhJI87s93mT8CpA0OOiDPCiwLt2l0E5SCzVq6vxiJfbuikdQp8RaeCTkuSocuySBp
 B0i+h5pJk8RBCp6di1qGP22e6D8XIMY/RmD1HdU4/o/cOOX/RRQxmB4/5uMvRS7QB5gaPd+tphDUi
 5S9GOG4+bvVLT1f6oRiyEGZ8yfbHXAcqRnYW5HHLZcs2BG3MX3QIGn7DWe0RAkBrXB3JqCfb4IOhI
 TyTej8Qw==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1ux0JL-0019RO-2w;
 Fri, 12 Sep 2025 12:43:19 +0300
MIME-Version: 1.0
Date: Fri, 12 Sep 2025 09:43:17 +0000
Content-Type: multipart/alternative;
 boundary="3d322c36-5783-44f4-a605-28263d12021f-1"
From: "Jyri Sarha" <jyri.sarha@iki.fi>
Message-ID: <af4566dc7d87b05137de68f86dec6b719805ce02@iki.fi>
TLS-Required: No
Subject: Re: [PATCH v3 07/39] drm/tilcdc: crtc: Use
 drm_atomic_helper_check_crtc_primary_plane()
To: "Maxime Ripard" <mripard@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, "Maxime Ripard" <mripard@kernel.org>,
 "=?utf-8?B?VmlsbGUgU3lyasOkbMOk?=" <ville.syrjala@linux.intel.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-7-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-7-1c7a7d960c33@kernel.org>
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
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

--3d322c36-5783-44f4-a605-28263d12021f-1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

September 9, 2025 at 2:27 PM, "Maxime Ripard" <mripard@kernel.org mailto:=
mripard@kernel.org?to=3D%22Maxime%20Ripard%22%20%3Cmripard%40kernel.org%3=
E > wrote:

>=20
>=20In the tilcdc_crtc_atomic_check(), the tilcdc driver hand-crafts its =
own
> implementation of drm_atomic_helper_check_crtc_primary_plane(). And it
> does so by accessing the state pointer in drm_atomic_state->planes whic=
h
> is deprecated.
>=20
>=20Let's use the right helper here.
>=20
>=20Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
Acked-by:=20Jyri Sarha <jyri.sarha@iki.fi>

Regards,
Jyri
--3d322c36-5783-44f4-a605-28263d12021f-1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><meta http-equiv=3D"Content-Type" content=3D"t=
ext/html; charset=3Dutf-8"></head><body><div><br>September 9, 2025 at 2:2=
7 PM, "Maxime Ripard" &lt;<a href=3D"mailto:mripard@kernel.org?to=3D%22Ma=
xime%20Ripard%22%20%3Cmripard%40kernel.org%3E" target=3D"_blank" tabindex=
=3D"-1">mripard@kernel.org</a>&gt; wrote:</div><blockquote>In the tilcdc_=
crtc_atomic_check(), the tilcdc driver hand-crafts its own<br>implementat=
ion of drm_atomic_helper_check_crtc_primary_plane(). And it<br>does so by=
 accessing the state pointer in drm_atomic_state-&gt;planes which<br>is d=
eprecated.<br><br>Let's use the right helper here.<br><br>Reviewed-by: Vi=
lle Syrj=C3=A4l=C3=A4 &lt;ville.syrjala@linux.intel.com&gt;<br>Signed-off=
-by: Maxime Ripard &lt;mripard@kernel.org&gt;<br></blockquote><div><br></=
div><div>Acked-by: Jyri Sarha &lt;jyri.sarha@iki.fi&gt;</div><div><br></d=
iv><div>Regards,</div><div>Jyri</div><div><br></div></body></html>
--3d322c36-5783-44f4-a605-28263d12021f-1--
