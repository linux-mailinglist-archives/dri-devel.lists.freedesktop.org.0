Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494F9FEAC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 11:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AD6897EB;
	Wed, 28 Aug 2019 09:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07132897EB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:38:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g8so2263186edm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 02:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=flt9IxTDXpAAINorBs+AmhNQPGibX4knZjBXudoTqJ4=;
 b=fC/R1LU6e3BFdon8v5WPeKvVykgV1l4PVo/zK2v1aSL6CKlFzHRkBwda+eJKA+CMlT
 HubTdIiSpyoaRaWasXeBQVfUz95aWaf0iet7lEFODTNK3o8paqJuv1kBqRZTNs8/JvRc
 mO0ZoOgI3VS0O6H3l+hotx3CY3a8JejBl7JJUofkfydWsVV6cTpzykdG4TZg8a0Vm1ge
 OriWl9XvT/69F8sabxsvj9CQjAVtFS/ShdPSgZUfs66TA4jMVluWQDqnxYPq1VXpWGxg
 QpK9sjwtsh/oS9Y4x6IyvPINyWEITEm+m6c7Hs21z5XLcThdIzkqCKF0xt811HIdCAxK
 PDuw==
X-Gm-Message-State: APjAAAW+d0oB7Gs6sNwwyLOKPxQkK3nRcfMDgQqAIO7Ma+8brm8OwylP
 +vGNxzKl2HfMm/QyWCAt74o=
X-Google-Smtp-Source: APXvYqxRLGxga0d1nTuNK8TzJOX1G7Yg77gfwljepMJBzvd+Kbne+6dSBmtKBoGGAAZDPD+0b4iOMQ==
X-Received: by 2002:a50:ea8d:: with SMTP id d13mr2949950edo.83.1566985102474; 
 Wed, 28 Aug 2019 02:38:22 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id gs21sm303630ejb.40.2019.08.28.02.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:38:21 -0700 (PDT)
Date: Wed, 28 Aug 2019 11:38:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Message-ID: <20190828093820.GE2917@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
MIME-Version: 1.0
In-Reply-To: <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=flt9IxTDXpAAINorBs+AmhNQPGibX4knZjBXudoTqJ4=;
 b=mHCK2iBPcn4RtNqJIa+r3p4rW5ZGIZOZvbTBwUB3Rmirj/XeHZinLNpDMorcZRMk1n
 VS9CVZ6FmYUTjw9dlo5SJ5r2jpYufzwgYIFxtkiNCQ+4C7TRGeOj7jb7p2a9Klzo+HZC
 w84j1JjGM9b0NJJ1KKKwBxQFeSw51ULZx+inQhieR6vZFbBbWfBxcAyh5pMVQzJFcgZo
 IMbJ5AnDJDOYBEpRsXnPfkwV2ESCRS0UxYBzfwXpJhRfRAYIPJssFuY03qL33u3Vx1l4
 g9Ny+1jNBQ8S9IuMMb3R8rRoaXS9IhA+FjWZ44n8lYeIXd1PRnzYWB46lbDq3LeX3I9F
 2aVA==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1530728680=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1530728680==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 10:09:30AM +0200, Hans Verkuil wrote:
> Thierry,
>=20
> Can you review this patch?
>=20
> Thanks!
>=20
> 	Hans

Did you want me to pick this up into the drm/tegra tree? Or do you want
to pick it up into your tree?

We're just past the DRM subsystem deadline, so it'll have to wait until
the next cycle if we go that way. If you're in a hurry you may want to
pick it up yourself, in which case:

Acked-by: Thierry Reding <treding@nvidia.com>

> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> > Use the new cec_notifier_conn_(un)register() functions to
> > (un)register the notifier for the HDMI connector, and fill in
> > the cec_connector_info.
> >=20
> > Changes since v4:
> > 	- only create a CEC notifier for HDMI connectors
> >=20
> > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> > Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/out=
put.c
> > index bdcaa4c7168cf..34373734ff689 100644
> > --- a/drivers/gpu/drm/tegra/output.c
> > +++ b/drivers/gpu/drm/tegra/output.c
> > @@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *=
connector, bool force)
> > =20
> >  void tegra_output_connector_destroy(struct drm_connector *connector)
> >  {
> > +	struct tegra_output *output =3D connector_to_output(connector);
> > +
> > +	if (output->cec)
> > +		cec_notifier_conn_unregister(output->cec);
> > +
> >  	drm_connector_unregister(connector);
> >  	drm_connector_cleanup(connector);
> >  }
> > @@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *outpu=
t)
> >  		disable_irq(output->hpd_irq);
> >  	}
> > =20
> > -	output->cec =3D cec_notifier_get(output->dev);
> > -	if (!output->cec)
> > -		return -ENOMEM;
> > -
> >  	return 0;
> >  }
> > =20
> >  void tegra_output_remove(struct tegra_output *output)
> >  {
> > -	if (output->cec)
> > -		cec_notifier_put(output->cec);
> > -
> >  	if (output->hpd_gpio)
> >  		free_irq(output->hpd_irq, output);
> > =20
> > @@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *outpu=
t)
> > =20
> >  int tegra_output_init(struct drm_device *drm, struct tegra_output *out=
put)
> >  {
> > +	int connector_type;
> >  	int err;
> > =20
> >  	if (output->panel) {
> > @@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, stru=
ct tegra_output *output)
> >  	if (output->hpd_gpio)
> >  		enable_irq(output->hpd_irq);
> > =20
> > +	connector_type =3D output->connector.connector_type;
> > +	/*
> > +	 * Create a CEC notifier for HDMI connector.
> > +	 */
> > +	if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > +	    connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> > +		struct cec_connector_info conn_info;
> > +
> > +		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> > +		output->cec =3D cec_notifier_conn_register(output->dev, NULL,
> > +							 &conn_info);
> > +		if (!output->cec)
> > +			return -ENOMEM;
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
> >=20
>=20

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1mS4wACgkQ3SOs138+
s6Hukw/8DvWhMV7uYDCsZIDHgnNF+l4WXu+x1XIy9XFt57KVfkbBW6YyYhAos1rx
4JSvHvWIdlB1AdTJacEqnxYynrMmfDrBNikG+0kFuUUwIeOdT+wRuOODFzGg7gZC
OvN+cADPyEDP0XyPZjv29B5+heSJnnLV6ziIENuVQaJA3QECOyx+K1hBheCLUXjE
fBUH9B6CpuGHvYtAqNu5i10kkL5sGIG/xjnHresWTHxrxwDHEIVBeryREjPdaYV7
fpafk17crGKST65cyIU0Be7h6WPEzCuybE5653TI4qM71ISJvhEsPnWY4ZSHBZXk
QWaKd8FtIuSuh6T/zkhzkfCBRAMyD3hluP2lPKOQLrw/oZqRTtyu4hyTFhxAIema
OeQeVY7aQyawoT3bSfWvhruPZ4r0wDxXCu0j2eD3so2AgGYBz/5WadYsCoZxGOS0
hzQayaCick670ZmDPJV/CiyzybkDN21gKpRzp/0+DXB837yCBlCK34bU76b9rd0e
J4Gy5wy32ja6KK2TxqiHBuPKyASjadwW5dYxDH2iNnSJxWbg82z15/ZBaUpYeIvF
mDhLxA6Cz49/iFXDsfTZcUpVf5JTADqNYYa0Yy1kBjFNXw/pwvgvp6wL0N5x20eL
mItPhPmbflgIE0KJvBp0S0h/sgJ4dxUTjPsEVFKD2KFLn7xbYJY=
=2whG
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--

--===============1530728680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1530728680==--
