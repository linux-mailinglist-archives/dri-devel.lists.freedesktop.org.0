Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D61C2A54A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB488981B;
	Mon,  2 Sep 2019 11:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9EE8981B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:10:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so4769204wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ku7E1Od0+MHjCQxZ9pIpRgNhXa/dFmEZ4GP0pHOacUM=;
 b=pAMd4UIzfl4PgvNKCg5uFl3ftzvVdKcNH/KGrnYk+Rrz6/yIRBXWFHCXV51sxa4NMv
 z0OMcy3MPIM3tOsCUyoX8CBL2WJwOYrHNYcN2bqWP0/wZbuWm7PYzcVKpinoiUJc/dZt
 nYZnQm06ydP7xuQ1ClpH6U+sZ6zyxt/3lSRKCrPQ1RPep81yd6q0/QUyG81Kq0V7MB8Q
 RUU4V3nbRcex3sflvlGeOBl2qH17aFBwZJn84d5yjSMTVlORrnCH9bghYwC0ankC/2YO
 yptWcGJZgsVG9hFnfp2kTZT/TDUOa7D7D5MJTzr+SB4RHeNchupOR04lauHoBmgVGZeX
 DhDQ==
X-Gm-Message-State: APjAAAUf3KrnrdUjyHJyUekelmocle35aoZhVraySKnFcef50vavRgGl
 YXZasR5zuuB82Ts6lWo8AvV/xypj
X-Google-Smtp-Source: APXvYqzVyyZBQyc8ULpSsCugKyO93bIsOmsJbF1NSwoYDw11UqlWqWxLR7MPBvDCpMajVs41IbdViw==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr4278429wrj.44.1567422642366;
 Mon, 02 Sep 2019 04:10:42 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id m17sm14673974wrs.9.2019.09.02.04.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:10:40 -0700 (PDT)
Date: Mon, 2 Sep 2019 13:10:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 20/21] drm/dp: Fix a couple of whitespace issues
Message-ID: <20190902111039.GC19263@ulmo>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <20190805122350.8838-20-thierry.reding@gmail.com>
 <1565270327.3656.12.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1565270327.3656.12.camel@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ku7E1Od0+MHjCQxZ9pIpRgNhXa/dFmEZ4GP0pHOacUM=;
 b=riPiyRhq98WtXO+uF0hc73y8pK69Ms9NhAy+V2tjrd65OitjgMIJnJ+6lsDzf7d1a0
 s2JWxdjIRDzQHXDNiqBKP7gBvLJQWfxkZCb2l18tf98h0q2RtkMpNI/FFS7ll8viUS16
 cFWgfYI6ZP5OsiGRM5G+JmF1lJyjMmoRU6mdBfTVJT/u3xIix4z8udFj6+dPdokXeFPH
 NmD2CxEidqCUUY0UZCqyE25UjHBNfj+0fB4bTDrx4DChWiaK3nlApKdZN2mLh4HXMrK4
 9v2bE6Svie9Q/ZrYQ5Qk6XvrtCN9crosEwtW46PssfqD1L150J0Uo5l69iqlyRdZY5HR
 e0Pg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1346602326=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1346602326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:18:47PM +0200, Philipp Zabel wrote:
> On Mon, 2019-08-05 at 14:23 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Remove a gratuituous blank line in one place and add a blank line in
> > another to improve readability.
>=20
> Seems like the comment description is outdated here as well.

Indeed. I've had these patches in a development branch for a very long
time because the hardware that I used to test DP support on stopped
working and I only recently revived this on a different platform that
also has a DP output. Looks like that other blank line had been added by
some other commit in the meantime.

Fixed in v2.

Thanks,
Thierry

>=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_h=
elper.c
> > index 136ee609f2ee..6b4431bade3e 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -216,7 +216,6 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *au=
x, u8 request,
> >  		}
> > =20
> >  		ret =3D aux->transfer(aux, &msg);
> > -
> >  		if (ret >=3D 0) {
> >  			native_reply =3D msg.reply & DP_AUX_NATIVE_REPLY_MASK;
> >  			if (native_reply =3D=3D DP_AUX_NATIVE_REPLY_ACK) {
>=20
> regards
> Philipp

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s+K8ACgkQ3SOs138+
s6GXHxAAg3pcrfEaDEisDmamrKHC8cY2Au33nC3kT9Pj6zda83Qg9AmS/c+1Dtrs
SUP4geXY+/aJ65Nk7FCHVDcG5zlsJfKl4Zv4IbVn27EkuEIfJj8xt79zJKP38ck7
AIb7EyUMg/rzrTyRklDrmhB3uHsjm0spWhAn4+41m9/QtKCMUsoqILtMMfPe4nO/
H/FhSSnv11UnqGNMKptb0dYWhBJ5dW2EwI/yY88q8kTBKnhWqtNeYiKRsHocivq/
5ubBo7wfTdwRkasjokMuiQHu+TZVtFeeeJD3Hdy+s1cb8YpCvzCI8WtcOxRizmG8
rn60KBcs6Unt0mxTN9ayUE0OWzuIJ6WlHIi6vb8ZDVpiKTk9S/Ljv8Kqq8WWzodg
Fr7aRnaYFaNHWjeu1TOACVxfBwtz1SmTmVyKqvTIJeykoyCjtRxMJGMpZ6XgdpQD
Mfyx1ICv7HQGZ9WEU02l4fTS7+NSRKEeI2AyDKzsK8WN1qKVMxIXgAeTpVV9ZqZ4
BxbB5lLN7x0DzMbaG7j98SZuzmgiG1M2Ye0EIbjGouxF0hQl3igeBvHYGP5ApC5u
IqB7oOO+lFXIO5JtIgr9hJpuBrkQHZ8kNnzDl4kPic1aJcL5OOTpprbXx0Imdecm
r+sAtE90rQSF9WbrdBqKHmeXWR0JtXLKYSHM6OXecL54Uf4JwHM=
=7y9I
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--

--===============1346602326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1346602326==--
