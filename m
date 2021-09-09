Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED3404488
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 06:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756236E434;
	Thu,  9 Sep 2021 04:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CB86E434
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 04:39:46 +0000 (UTC)
Date: Thu, 09 Sep 2021 04:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1631162383;
 bh=s5NWYgMW/gr1MAQ0Sk66hSSE3Hd+Gihbcb6IR2JCRtg=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=V8uVIrIofsnXBpR+UiJUQD35l6muhXdAE9toZYUWv6Xw2KgwolJ+PvugbIm6Bl1Nj
 tlzKv2lMcVWgreM1e7zE8q0P5G3ZcM5I6KqO4BMnayuN7T/5FwgJAUn6Kg0krTw1Jp
 syToZsbq/bctZCWzHfn0PPy1ZlnFMyxzQwGRh3+s=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/panel: Add support for LG.Philips SW43101 DSI
 video mode panel
Message-ID: <20210909043904.12982-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a driver for the LG.Philips SW43101 FHD (1080x1920) 58Hz OLED DSI
video mode panel, found on the Xiaomi Mi Note 2.

Changes since v1:
 - Add regulator support.
 - Add MAINTAINERS entry.
 - Dual-license DT binding.

Yassine Oudjana (2):
  drm/panel: Add driver for LG.Philips SW43101 DSI video mode panel
  dt-bindings: display: Add binding for LG.Philips SW43101

 .../display/panel/lgphilips,sw43101.yaml      |  75 ++++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lgphilips-sw43101.c   | 363 ++++++++++++++++++
 5 files changed, 455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphili=
ps,sw43101.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lgphilips-sw43101.c

--=20
2.33.0


