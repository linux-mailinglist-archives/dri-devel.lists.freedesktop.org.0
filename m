Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42B40760E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 12:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561A16EB6B;
	Sat, 11 Sep 2021 10:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CDD6EB6B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 10:24:49 +0000 (UTC)
Date: Sat, 11 Sep 2021 10:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631355886;
 bh=L/K4/jorgJT5Es320hdZ0tOOfasmztX21ayderAi+iE=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=EYrabftUFhiXioX7Keo3CJXGCuY7Rph8ZVig4sXY+71y89COsFYWrIPiRNj5HqO1Q
 z8jNMZLH4ejtJykqbrF6XZd0Me2pXnRdp2eeBubei5fgRC2UuIv45pKG0bq9zzX0Y0
 PYwtAgxI0fCo0Da3MDcM0YfFdIXsY2MFQWJeKp0UuS57aCEzSR6THU8cAX4P21TAwH
 JyyEutM5AlgHXwx9EiTcuMrw/hpgYW79/z6yi/e2niPAwtJjLR6OqgHceoSmNEy+PG
 nOvRGUsuk14L2wpkyjsZtNTpSMqZ7Pc9YQT/Z0zTIazdOigxZPMJOOBv0mQqEDFwt2
 T5WMscAFJx5dQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Jared Baldridge <jrb@expunge.us>, Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] drm/panel-orientation-quirks: add Valve Steam Deck
Message-ID: <20210911102430.253986-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Valve's Steam Deck has a 800x1280 LCD screen.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Jared Baldridge <jrb@expunge.us>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/d=
rm/drm_panel_orientation_quirks.c
index f6bdec7fa925..3018d1dcd271 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -231,6 +231,13 @@ static const struct dmi_system_id orientation_data[] =
=3D {
 =09=09  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
 =09=09},
 =09=09.driver_data =3D (void *)&lcd800x1280_rightside_up,
+=09}, {=09/* Valve Steam Deck */
+=09=09.matches =3D {
+=09=09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+=09=09  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+=09=09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+=09=09},
+=09=09.driver_data =3D (void *)&lcd800x1280_rightside_up,
 =09},
 =09{}
 };
--=20
2.33.0


