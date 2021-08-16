Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06143ED211
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 12:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2E589471;
	Mon, 16 Aug 2021 10:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9147489471
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 10:37:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1836858wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gWUqZL1LAyx0lKtXlfzyxVRcu+iASaSd2eeJ/eJQRd4=;
 b=DRibp/bDt1tUsqFrHmlUVf+UcBnb6pU9Gc9wAUr3+n1YSpnaf8oAxlqdEJ9JRPDAVB
 K+gaW2AsI7/4bk1waPQTB3GlPdMNUWpfrkt67MUZ9pp+MxjzrChABGsH/CCbG2BC7yJp
 df9z/StBBlHXP40LnMHvva/eJRgf+ojI6+971A4BjQMlqRzh5SfRhRFxBJkhcsKzv4i7
 RN59VV+uqvuFNhjKCRPyfY/Cr9uvNlwgrOt6BoeVnlMqSgWFkbG/d4uAix5LY9gI85S3
 zYFKOoKkw8RgixO+ECfnHePLP3tICGA9ZSINuwcBX8X6gx3IcvWpVVgadi8sr3nPIoV1
 UrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gWUqZL1LAyx0lKtXlfzyxVRcu+iASaSd2eeJ/eJQRd4=;
 b=IpCcnoAq5OuWqzw/l6Tfrm2SEIOLYa01GLqesaAkuC6kp4aMCPxcmCAgMHrNlGxAAL
 iSjY02/8vX19H4Rv9oBuPFs3x1vgEldGiVrMKUnr9HiHdn2o3g0MLjKbwy4+KzsH3iZQ
 U/Gf5qYz4toYoxhX5JrpBzRLYDBOa46kcg0QIh5g9U8x0lvrvVxgR0IE1+S+o2jvc7IU
 dttJ+O11PdavPiPMKTdzDKUQ+WrEzL3Rq4JX17+uUCZiut4F+y9Jf+cgWZYaaWkTuK05
 qtKZzkbjYdJgBsq/92jbhOArH1SFGUIDUBAipIIzlRTzhxtrDnHYZWqkE9kfxGQ1DMGv
 xK6A==
X-Gm-Message-State: AOAM533Ggkk/BQKM+2aTKkaYLvBbIjQMGJuTIUG3jfKzELXbiJM/OKrc
 u+Od3pYYozIrPFvimhETC55GOIeGOVk=
X-Google-Smtp-Source: ABdhPJwP162732m9N/wGR4e/Kp2Rbh4DhylZBCS4yZHid3Dv7yaAPo5RlpTyGJn9AYBSjJ4SwC7Nkw==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr14366091wme.90.1629110275511; 
 Mon, 16 Aug 2021 03:37:55 -0700 (PDT)
Received: from localhost (pd9e51807.dip0.t-ipconnect.de. [217.229.24.7])
 by smtp.gmail.com with ESMTPSA id l2sm10130540wme.28.2021.08.16.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 03:37:54 -0700 (PDT)
Date: Mon, 16 Aug 2021 12:37:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Simon Ser <contact@emersion.fr>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH 1/3] drm/fourcc: Add macros to determine the modifier
 vendor
Message-ID: <YRpAAXmFG3n0oNQ7@orome.fritz.box>
References: <20210610111236.3814211-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f3bZXJzD3jpRuiuA"
Content-Disposition: inline
In-Reply-To: <20210610111236.3814211-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--f3bZXJzD3jpRuiuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 01:12:34PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> When working with framebuffer modifiers, it can be useful to extract the
> vendor identifier or check a modifier against a given vendor identifier.
> Add one macro that extracts the vendor identifier and a helper to check
> a modifier against a given vendor identifier.
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Sorry for this taking so long, I've finally applied this to
drm-misc-next.

Thierry

--f3bZXJzD3jpRuiuA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEaP/8ACgkQ3SOs138+
s6ECPw/9HSrhnsUGh9G/f1l2geUWgbXvTx9598rCR3ZSZu98oGvUAsmVmaufcHXv
chv/fcwAS6JDiVxvJormO6osaMcPZE0HLqqWYVqv09uSuFP5YfShPHUEgjpOHZ7+
plEWfFvkO6gDDcT4JXExAdgbRiq9wCTjzBblPO10rdf10JGR6ahSfwymRAQj9Quw
TOd2DVOeqoWRwP12UUQ/Ngn9xPBKx+7C0fT8Ceqqs4h8TAhsu5BiDJlNODZTg13m
UOrHmtj/i7CREmHvqrEv6chuQtmi1ZQQTy6lP28rpmnoyTsjK7VWFIAjg+hhdyst
YUGYvglJ0N0bwqXUB4TZAgmMsuRYw7WGJLGfXohbW+AgQMYlogDdRUvwqGF95AYg
w2gBoiQ2xr6KsTLexlN/UsH97d65eMumivGI9zjtpKEnifK4v6xhzdkbLot5WTmT
5lJV1LDVw5ql858HeTFE05Ucq1EthtBEd4dG0KJRCmG6Hhrs1tDn22x+psxS7OKY
AbBvIy93+nua58mLf35laCUr41RpVJ+Xz3Xbiwfc26BqMVKVtUHjBe/3MzGhcE3f
bTlmjrjXm6Mvl+s3tUePQpvJlhVndOnZnrwcn8WMw+9AGdH3C1701MJSQtqU6UCb
GAyVXiyAsY807I2AAHCcRE2Oj1rKljuoAUUX9gqmPKeGDOUc8Qw=
=CV+x
-----END PGP SIGNATURE-----

--f3bZXJzD3jpRuiuA--
