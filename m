Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E0875EC3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 08:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E2F10FBDF;
	Fri,  8 Mar 2024 07:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="BGymDPbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B6910FBDF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709883780; x=1741419780;
 h=from:to:cc:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:subject;
 bh=KIogUl6yzQKUaleo4f1Dbqfw0xuGtCV1uUQgHKZg8Ao=;
 b=BGymDPbieYYuGmDCNXUDsvldrq6ZKTpLXWU+N2ezKIS9wZ6CEm3F8yOX
 mX9gr9/d/mdd55QXsVOQIToe8xU0ibWunuQOOWOWAYKHhyAg/QrrlYg80
 rsv5hDM6fQ3cDUjbk31Y8CUi4jm+BsHoD/GhO6Wo+QaTlz0/0v7fItFFF
 rw0Wsz2phVno07bfxEUQnv8kcw6cPK/6jYabxY/rKlbvYT6u/Kwkhrn5A
 e5E9UND95rddMhkb8l4MY7Ljl4tXRE4tpE81U5gA0L6mFZxTNifzoEFf1
 jR0No/9x1q9BntEfV5HzMtgsX8kzd3UgCGJrFr+SINRWJtZQyfL9nfRVy w==;
X-IronPort-AV: E=Sophos;i="6.07,108,1708383600"; d="scan'208";a="35801333"
Subject: Re: [PATCH] Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Mar 2024 08:42:57 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C201928007C;
 Fri,  8 Mar 2024 08:42:56 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 08 Mar 2024 08:42:58 +0100
Message-ID: <3552711.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240306-ti-sn65dsi83-regulator-imbalance-v1-1-a3cea5f3e5b3@bootlin.com>
References: <20240306-ti-sn65dsi83-regulator-imbalance-v1-1-a3cea5f3e5b3@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Luca,

Am Mittwoch, 6. M=E4rz 2024, 13:39:20 CET schrieb Luca Ceresoli:
> This reverts commit 8a91b29f1f50ce7742cdbe5cf11d17f128511f3f.
>=20
> The regulator_disable() added by the original commit solves one kind of
> regulator imbalance but adds another one as it allows the regulator to be
> disabled one more time than it is enabled in the following scenario:
>=20
>  1. Start video pipeline -> sn65dsi83_atomic_pre_enable -> regulator_enab=
le
>  2. PLL lock fails -> regulator_disable
>  3. Stop video pipeline -> sn65dsi83_atomic_disable -> regulator_disable
>=20
> The reason is clear from the code flow, which looks like this (after
> removing unrelated code):
>=20
>   static void sn65dsi83_atomic_pre_enable()
>   {
>       regulator_enable(ctx->vcc);
>=20
>       if (PLL failed locking) {
>           regulator_disable(ctx->vcc);  <---- added by patch being revert=
ed
>           return;
>       }
>   }
>=20
>   static void sn65dsi83_atomic_disable()
>   {
>       regulator_disable(ctx->vcc);
>   }
>=20
> The use case for introducing the additional regulator_disable() was
> removing the module for debugging (see link below for the discussion). If
> the module is removed after a .atomic_pre_enable, i.e. with an active
> pipeline from the DRM point of view, .atomic_disable is not called and th=
us
> the regulator would not be disabled.
>=20
> According to the discussion however there is no actual use case for
> removing the module with an active pipeline, except for
> debugging/development.
>=20
> On the other hand, the occurrence of a PLL lock failure is possible due to
> any physical reason (e.g. a temporary hardware failure for electrical
> reasons) so handling it gracefully should be supported. As there is no way
> for .atomic[_pre]_enable to report an error to the core, the only clean w=
ay
> to support it is calling regulator_disabled() only in .atomic_disable,
> unconditionally, as it was before.
>=20
> Link: https://lore.kernel.org/all/15244220.uLZWGnKmhe@steina-w/
> Fixes: 8a91b29f1f50 ("drm/bridge: ti-sn65dsi83: Fix enable error path")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This is reasonable and explanation is great. Thanks.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Many thanks to Alexander for the discussion.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index e3501608aef9..12fb22d4cd23 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -499,7 +499,6 @@ printk(KERN_ERR "%s: LVDS in fallback (24/SPWG)\n", _=
_func__);
>  		dev_err(ctx->dev, "failed to lock PLL, ret=3D%i\n", ret);
>  		/* On failure, disable PLL again and exit. */
>  		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> -		regulator_disable(ctx->vcc);
>  		return;
>  	}
> =20
>=20
> ---
> base-commit: a71e4adac20bfe852d269addfef340923ce23a4c
> change-id: 20240306-ti-sn65dsi83-regulator-imbalance-10e217fd302c
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


