Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C944A7FFD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 08:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C4F10EE6E;
	Thu,  3 Feb 2022 07:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A397F10EE6D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 07:43:43 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Jq9dn73Dsz4xMT6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 07:43:41 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="lOCf9VyC"
Date: Thu, 03 Feb 2022 07:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1643874216;
 bh=oL57e77hZZR49PdM02PnDu37Z4T12IsJ558i6C2+Ch8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=lOCf9VyCv4K0YQUo7zilZojt/cu3WeyO38ZynY2JT9sVwkW07+xABrKB42Uu8S/Xj
 znazV+y4lrl9q75tY/3BfEe+SWTtbffVO6Ng3qzBbbQG/T46/w7Lq/BLo1eI2XKM7U
 GtHO6sQNvxMoAhOnndcS/ICDNOP0TsS2mvyx5cQ6T4VhJk+f0/pRpHK4vl8WrnDmzN
 RjsvlO1Czzh+9RKKaPSOFRFHRrBE6IfNL3HDmzThL7jGWN9tB9mJjtkIt3CgszpEx0
 +QWbCPcJSuM6D5RdNVlRnlmCu3IXUk4ug7nkj2aB/4Vq0NAghy4lIm2fphVBIchWj/
 7NEw0T68NELdw==
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for LG.Philips SW43101 DSI
 video mode panel
Message-ID: <20220203074245.53322-1-y.oudjana@protonmail.com>
In-Reply-To: <20211121034748.158296-3-y.oudjana@protonmail.com>
References: <20211121034748.158296-1-y.oudjana@protonmail.com>
 <20211121034748.158296-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Yassine Oudjana <y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Nov 2021 03:50:03 +0000, Yassine Oudjana wrote:
> Add a driver for the LG.Philips SW43101 FHD (1080x1920) OLED DSI video mo=
de panel.
> This driver has been generated using linux-mdss-dsi-panel-driver-generato=
r.
>=20
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
> Changes since v2:
>  - Make the DT schema patch first in the series.
>  - Use backlight_get_brightness where needed.
>  - Remove 0xff mask from return value in sw43101_bl_get_brightness.
>  - Constify struct backlight_properties props in sw43101_create_backlight=
.
> Changes since v1:
>  - Add regulator support.
>  - Add MAINTAINERS entry.
>  - Dual-license DT binding.
>=20
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-lgphilips-sw43101.c   | 358 ++++++++++++++++++
>  4 files changed, 370 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-lgphilips-sw43101.c

Hi,

Any comments on this?

Thanks,
Yassine


