Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC33FE91A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 08:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A33F6E440;
	Thu,  2 Sep 2021 06:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E666E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:07:53 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4H0BqX3KM7z4xC4V
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:07:52 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="Iy273D2u"
Date: Wed, 01 Sep 2021 18:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630519637;
 bh=uir4PzcrAGtJv0MOdHgIa+arRXdiTMZ57zGd4NlaWNs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Iy273D2utq+j9HfHAKnRbLZ2eW5jhWvz3Ox85lJtkns6/APwMt/ChNwdluULYoacj
 /aMn1Ssk71m520VWz9Q9XMRifom5KyYYMZJJBjvVnXJHOuVJiyedEgXXkdQtW7FdNP
 DdIBrUBj4gCV0LfmvsKNZTfQfELf/IVgzjYdGaZM=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/panel: Add support for LG.Philips SW43101 DSI video
 mode panel
Message-ID: <20210901180644.248177-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Thu, 02 Sep 2021 06:08:04 +0000
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a driver for the LG.Philips SW43101 FHD (1080x1920) 58Hz OLED DSI
video mode panel, found on the Xiaomi Mi Note 2.

Yassine Oudjana (2):
  drm/panel: Add driver for LG.Philips SW43101 DSI video mode panel
  dt-bindings: display: Add binding for LG.Philips SW43101

 .../display/panel/lgphilips,sw43101.yaml      |  52 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lgphilips-sw43101.c   | 331 ++++++++++++++++++
 4 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphili=
ps,sw43101.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lgphilips-sw43101.c

--=20
2.33.0


