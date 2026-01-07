Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C95CFD095
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48AB88130;
	Wed,  7 Jan 2026 09:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2UzXf6Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F9988130
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:57:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B70CC1A26DC;
 Wed,  7 Jan 2026 09:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 88429606F8;
 Wed,  7 Jan 2026 09:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7BC0103C870F; Wed,  7 Jan 2026 10:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767779842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=izEt2/WHjpbUY6bvrm2DFgvpbob63v2XG6b5/OiY5fc=;
 b=2UzXf6HcDzAgbztIJOykxawHaptLE25s9Qc4dGZepcyM+1O6as1FwDlGlxF8q1micYDkff
 7bEKF3deZbVQX/7P7NDrMGD1+0+65WOFYpO/i4BrS4U6YdUeRazLG35r8Hca7NKoi8wBJo
 40RXHmUlCEO7ELu9SUIhiGLhcKW9KkAwmNkBsG8Zguj4NHDwcZL2x0uNKK/GAqHBePss3u
 7cjdQxtDhsvYllsXWbFa9/E7jKJliP1IEV8j44ADSBZB51q+SVNvV0/99LDACYipr5vr5M
 vNZAhYLEw9FSdhyjtqWuG10meoqdFiOZsl7nL3SzPnKFxAf7AFpwrgzo2y6kDw==
Date: Wed, 7 Jan 2026 10:57:11 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v3 05/22] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260107105711.695a9c12@kmaincent-XPS-13-7390>
In-Reply-To: <897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
 <20260106-feature_tilcdc-v3-5-9bad0f742164@bootlin.com>
 <897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

On Tue, 6 Jan 2026 13:38:37 -0600
Andrew Davis <afd@ti.com> wrote:

> On 1/6/26 11:42 AM, Kory Maincent (TI.com) wrote:
> > To maintain backward compatibility while removing the deprecated
> > tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> > the legacy "ti,tilcdc,panel" devicetree binding to the standard
> > panel-dpi binding at early boot.

...

> > +	dtbo_start =3D __dtbo_tilcdc_panel_legacy_begin;
> > +	dtbo_size =3D __dtbo_tilcdc_panel_legacy_end -
> > +		    __dtbo_tilcdc_panel_legacy_begin;
> > +
> > +	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
> > +	if (ret)
> > +		return ret; =20
>=20
> Looking over the users of `of_overlay_fdt_apply()` they all seem
> to start with a begin and end address, then have to convert to start
> and size. I wonder if this function should be converted to just take
> begin and end addresses instead.. (not a problem for this series, just
> thinking out loud).

Indeed, I think you are right.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
