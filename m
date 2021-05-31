Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E73B396946
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 23:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81FB6E7D2;
	Mon, 31 May 2021 21:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE65B6E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 17:48:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so401743wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9w+YOLhPg3i3Tr1EsuxBv3pkuCJqmFu4aSsxCc9Nllg=;
 b=NX6RyzqHzZhU/yIIz7B9KT5+g+rgrWNPPRSQdULQOAxLuBVwLJXpVT7bzRRTZKsBFQ
 twzZ87IbRqaI1WHftl64DjZvuTj4XS/GlpH1f4xbKoYozxD0y49k11DnVy+/lk2dHsYw
 T55Drhmxdsam7SDId2NOy/FaGXShBw1pk1mqCTsmmXOstxGULD61fdcigrI7hUVbJSFr
 4V042gFckuIhw6/WXdE7GbgV+bkojxo0MKlkifNPwINeWBzo72aAgfSFQnyyg6tUNCOY
 Lk6mYOfufAxBYze4FpLzrDWx8MgYDJJq7GV1iq6QehaZ4k5jhe22lG9EybUfCTcT3ljJ
 KXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9w+YOLhPg3i3Tr1EsuxBv3pkuCJqmFu4aSsxCc9Nllg=;
 b=oo5sDi7Oyi8AejBwALgZaVZD/TLRyrTWoXv3Tey2Gxq6CSQV3O1zRsTT8GKld+AOgt
 id8LM7FCByjmiTvG3S+oVVXJk9fZK5kr6Obk//FqqoQS02RLXQrgyeP2eEwcd+7Y1HOh
 FUsImL+5J78z9EQmCF2Ptnp6I91W1GJEJbqnmHYO96s4+zBnuI8oDZcNa7BCAfyBocgC
 XoPa/jR3r7XY/j+yrhvZ+JaQxmzAorhiOIEwQfu6xuGwJDLuq7LXnqWSWZ51bO1dA7Wn
 GfKSyKXo79VAAcQK1B3zfzEs42wxNG0aenTtaFrrIjqw/YVLMZkfoAfrPNb0GWnlwLya
 6XDQ==
X-Gm-Message-State: AOAM533Zpb4Pl3hC/Z/VQab8UJLIBpYh0+RfJvhHTk/Z5NZwZJrammGC
 vg+8Tj6ELHtrVwNDtqfCNzQ=
X-Google-Smtp-Source: ABdhPJyTOSC1nGUD6dnIYOxZpbs2gIZbcBHca9HSf0byj5/DSMTfCcobUatRnm8e8k1vz2XWrX2Z+w==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr252246wml.84.1622483315353;
 Mon, 31 May 2021 10:48:35 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id v18sm463950wrb.10.2021.05.31.10.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 10:48:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: Re: [PATCH v4 1/2] drm/sun4i: Add mode_set callback to the engine
Date: Mon, 31 May 2021 19:48:33 +0200
Message-ID: <3374256.1yKYrUSprD@kista>
In-Reply-To: <2404786.ubhusWIBXB@kista>
References: <20210528203036.17999-1-r.stratiienko@gmail.com>
 <20210528203036.17999-2-r.stratiienko@gmail.com> <2404786.ubhusWIBXB@kista>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 31 May 2021 21:20:10 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 31. maj 2021 ob 19:24:40 CEST je Jernej =C5=A0krabec napisa=
l(a):
> Hi!
>=20
> Dne petek, 28. maj 2021 ob 22:30:35 CEST je Roman Stratiienko napisal(a):
> > Create callback to allow updating engine's registers on mode change.
> >=20
> > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

BTW,  update my R-B tag with gmail address and fix issues pointed out by Pl=
aes=20
and me in order to use it.

> > ---
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c   |  3 +++
> >  drivers/gpu/drm/sun4i/sunxi_engine.h | 12 ++++++++++++
> >  2 files changed, 15 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/
> sun4i_crtc.c
> > index 45d9eb552d86..8f01a6b2bbef 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> > @@ -146,6 +146,9 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crt=
c=20
> *crtc)
> >  	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
> > =20
> >  	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
> > +
> > +	if (scrtc->engine->ops->mode_set)
> > +		scrtc->engine->ops->mode_set(scrtc->engine, mode);
> >  }
> > =20
> >  static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs =3D {
> > diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun=
4i/
> sunxi_engine.h
> > index 548710a936d5..7faa844646ff 100644
> > --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
> > +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> > @@ -9,6 +9,7 @@
> >  struct drm_plane;
> >  struct drm_device;
> >  struct drm_crtc_state;
> > +struct drm_display_mode;
> > =20
> >  struct sunxi_engine;
> > =20
> > @@ -108,6 +109,17 @@ struct sunxi_engine_ops {
> >  	 * This function is optional.
> >  	 */
> >  	void (*vblank_quirk)(struct sunxi_engine *engine);
> > +
> > +	/**
> > +	 * @mode_set:
> > +	 *
> > +	 * This callback is used to update engine registers that
> > +	 * responsible for display frame size and other mode attributes.
> > +	 *
> > +	 * This function is optional.
> > +	 */
> > +	void (*mode_set)(struct sunxi_engine *engine,
> > +			 struct drm_display_mode *mode);
>=20
> Mark mode as const.
>=20
> Best regards,
> Jernej
>=20
> >  };
> > =20
> >  /**
> >=20
>=20
>=20
>=20


