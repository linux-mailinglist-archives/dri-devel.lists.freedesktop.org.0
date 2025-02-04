Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E30A2793B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFCE10E06B;
	Tue,  4 Feb 2025 18:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L/Ihnf+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8412010E06B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 18:02:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38da88e6db0so540354f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 10:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738692133; x=1739296933; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T4z5wAQZzKrG8mW8jnRw2NXQidvYvNXR1bP88Txg4ik=;
 b=L/Ihnf+dCRZ1q13LyDEb33aOcSXRhXqwyvGbTs+cEEzPAh5fCnI977rYyfIe76HGdv
 FCEmiVnsoQwqAmnLW1xeSruUOYN2Qkl1q7+YZMM2DCAVMz//DTAnkqUzoxu3Hng9/Rky
 4mZ2xtk96Iuis6LuBKsTN5o0p4L9qH3Fr78d8hEqsr1MmItt6qyrnNfDOEzelBlqCv8e
 lHyUQw230HOUdNdb33EN59d/i4MJm9Z1NNP4YpEUul/XnMQ0kggJbL+jJvatBOqxwMn5
 HI3tbNrmjPF0weJk/OJfDD01tmFtf7rPsYMEtPXcydmDmI+gXbX8JNaih3jDJOzeL9pu
 So6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692133; x=1739296933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4z5wAQZzKrG8mW8jnRw2NXQidvYvNXR1bP88Txg4ik=;
 b=J0PSeBTpPVzkZeXUR2AcIBTKjoYXBhXzP4Ys+AzxgMjGXH2q3R7Nri65Pqe4wQP85b
 mgrChLsWYn32z4O/apQ1EY/Z7REknE3g/B4nRntEccM33CL0FRIUL+mtCjjwB8D5IgPZ
 PAs5pnBRXPMX6bvvhKBL2ASbu0OtRe1eK8IiO8GIGmeQcyrBC0lHqyLqTfJcD947+iWV
 hT3xpHpgETGo7lix2mW9nf3diFa18ANy819elvp41GcUQuuWD0uGGu379Ri97Yq9TZwp
 ESGW+2VI7m4NCamGcbwMv0pEwZva7b39/F7Dx/Fr3XCncbXJqd+BXQPgtj9KAPNXY1lP
 i58A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1SD/fSSY2yihukBSN6uZxBbVBGkLay5EjQby4RGYmOm/+IRFsrM9vfRBE6elXa9McetkxXzRfKSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH2RDVdviwo2LAKRLNRvXA9zzx+m3bD/wgme7Nq7FT4dd6fySW
 F7eSPz56/HMyrwmqWAvQ3WbjVELz23HOCxzmEjVJkXnR3fB5ga9v
X-Gm-Gg: ASbGncsQ/kfTHTkknpJiYEDCWZ9ld9oRDYRLvjaLqohhkLvDaaUFzdKY2FQLsJkAgU2
 +cx27T7SZ4KTd1qvqFuX8lP9aabOF0fJai10oNCrrk2QvJLbQwVBsxE2TyqSRnKZqUtivdfUdY1
 vLm59pwMlW3BKblGUfM4zZ50N75yialTtuDnlJt6fGCWDrmag5um/Ppkc7FnV6/yiQZiiaOyqtS
 jvdznnkaL2h/oe8DqnjeAzkyJ0+XqSoJu6XUuRi2Khnozq5wG+DTuZW2z1K/zqkU1OtAw83Gi+S
 yYJGS+HAXc7RQKWbnyrNEMvZ0iEn0Iq+7GV41niuAUkTMRodxzBxL7XXSJ+Fevskvk217mLsJD+
 f8Q==
X-Google-Smtp-Source: AGHT+IHi9W+AQaPHkr1CjugG/NXnUKiYfyTQwQx2Wg4bwuqIWZM2eYaLtkut4n/MAS1Igy54G/nAnA==
X-Received: by 2002:a05:6000:4010:b0:385:f398:3e2 with SMTP id
 ffacd0b85a97d-38c52096217mr23296233f8f.37.1738692132463; 
 Tue, 04 Feb 2025 10:02:12 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c11fadbsm16194196f8f.44.2025.02.04.10.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 10:02:11 -0800 (PST)
Date: Tue, 4 Feb 2025 19:02:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Message-ID: <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
 <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3p7xeptfzcupllfn"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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


--3p7xeptfzcupllfn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 03:33:53PM +0000, Biju Das wrote:
> Hi Thierry Reding,
>=20
> > -----Original Message-----
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Sent: 04 February 2025 15:25
> > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> >=20
> > On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> > > Hi Geert,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > > Of Geert Uytterhoeven
> > > > Sent: 03 February 2025 11:06
> > > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> > > >
> > > > Hi Biju,
> > > >
> > > > Thanks for your patch!
> > > >
> > > > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> =
wrote:
> > > > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_=
name().
> > > >
> > > > That's not the only thing this patch does...
> > > >
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs
> > > > > tegra_rgb_encoder_helper_funcs =3D {
> > > > >
> > > > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > > > -       struct device_node *np;
> > > > > +       struct device_node *np _free(device_node) =3D
> > > >
> > > > Adding the _free()...
> > >
> > > Yes it fixes a memory leak aswell.
> > >
> > > >
> > > > > +               of_get_available_child_by_name(dc->dev->of_node,
> > > > > + "rgb");
> > > > >         struct tegra_rgb *rgb;
> > > > >         int err;
> > > > >
> > > > > -       np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > > > -       if (!np || !of_device_is_available(np))
> > > > > +       if (!np)
> > > > >                 return -ENODEV;
> > > >
> > > > ... fixes the reference count in case of an unavailable node...
> > > >
> > > > >
> > > > >         rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> > > >
> > > > ... but as np is stored below, it must not be freed when it goes ou=
t of context?
> > >
> > > OK, But it is used in tegra_output_probe() and never freed.
> > > Maybe remove should free it??
> >=20
> > It's not quite as simple as that. tegra_output_probe() can also store
> > output->dev->of_node in output->of_node, so we'd also need to track a
> > flag of some sort to denote that this needs to be freed.
>=20
> OK.
>=20
> >=20
> > Ultimately I'm not sure if it's really worth it. Do we really expect th=
ese nodes to ever be freed (in
> > which case this might leak memory)?
> > These are built-in devices and there's no code anywhere to remove any s=
uch nodes.
>=20
> If there is no use case for bind/rebind for the built-in device then no i=
ssue.
> Or in .remove() free the node or use dev_action_reset()??

Bind/rebind is possible, but that's not even a problem. Worst case the
reference count on the device node will keep increasing, so we'll just
keep leaking the same node over and over again. I guess potentially
there's a problem when we rebind for the 2^32-th time, but I'm not sure
that's something we need to consider.

That said, devm_add_action_or_reset() sounds like a good solution if we
really want to make sure that this doesn't leak, so yeah, I'm in favour
of that.

Thierry

--3p7xeptfzcupllfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeiViEACgkQ3SOs138+
s6Gomg//axDIv8lDZQI+Tb6vo+p5J65aHkZXr5gCcDDWdWuJHHm6RFxVv640fN73
P+7oaTvquB52OBtcaJT4hGppK4Ai2meTIL0Dhe0EPT0Yz7WaD1GHR4IDa8ptNbDQ
81kjhAwVpRPjdP3QdnFPD0hjCBjuyFYBjlGqqI+sXP3RCDtXx3oe7F1+Qzg/8X91
PZ3jC2CeITJgnN/HTJG5qRMGBvvyjl4zr0+k2bS5dGPofpwE2Bx0dmbuv38vJQeo
QTHCFMA61P9o63hVm/QS3542WWFAIU8SyJmfniA1QiPdzeHZzOz39N9YIRl0qIS8
PEeonLhXLx+zgd3WHb4HzZJvFvvUIXxIaI0uwHFIpmbfOpf0DPGRV3nnKemgBPeK
u7p1jIdgzdeR+JjmFqTS3fEgDxsGzhuJLA2e1Sufyj8ofmrwiBj/T8ePvel+R6kb
tk5hN0Bdko08ahXeZRp9lLbaK/7ToRabZTuTEMosDc75fe/fQZG2V7SQ9zDbaCIQ
l/JnRrntXMtYrgA8ClidDTIEHOknCYRjtRhAnwO19za5QbLrQyG8o2X41ReW2sZS
xQMkZS2aABVkgnl/X/6fNqrW20YKHzur/GhHc78QsUBdUDJS7EvF9DdSB9yMPVon
/1Z7AZRCjCT+Bl7h12KdogdHEowyVcIgGTJiXExeRDDV9+n1GdI=
=CA70
-----END PGP SIGNATURE-----

--3p7xeptfzcupllfn--
