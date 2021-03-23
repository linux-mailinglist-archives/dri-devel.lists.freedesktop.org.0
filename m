Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C2C345E2C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC996E0A2;
	Tue, 23 Mar 2021 12:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948696E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:30:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id jy13so26765373ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gQxsCxi8R2285c9pPwuE5UM8utDDKuz2gY6X8LxszO8=;
 b=EE464Cyk2ElN7q6uAhEh9A9xnSHZfmZDjzuetEvRr5C6/ZvoZcRIQC38E2QQSO0nDD
 YHCRWrrnsmS2yDGoMLS3hVkmKOtc4fQQuejZG+ElS93oIj+w4staQKtXDSFhN/EiggWU
 We+MkEC++F/3Knv83MACS+SF/rJ27l/DV8EKF7+xMfNfCFN+Y8WZS3NIQd+Fm9NStfum
 Yh97CwZrtDkFVBEOxqzBn2fC+Yxl4aPljaA5TAcFM3U/fMcc+YtKam/7IwI3vHkw72kS
 KpwqkweRlKlXzzBTr8RllPa2T0Ck+ONckOe1lDMJUq34f4SK7GLX+Lod+HxEJ5HtpGq3
 Lhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gQxsCxi8R2285c9pPwuE5UM8utDDKuz2gY6X8LxszO8=;
 b=bJ9SaElyfoVtzKnJ1WIlCgL71eVJ2SlQBhSciGTR8iyu5P5o7uYsgjcQi1HD4Mo9kp
 FiDLdEG3irXhqjomUWNFYB16yitLscJltIpmcWkwlIOfiTZYV/z5nY9wrN6StyJ4Bm2b
 BqkMBF9hftZwOzNZhAmDzHSpBpeDZkoDDwBUqgP3pgF9stugoJX994GpiAzubQOyGJsF
 +5+rPi0azloxsUsL54tQwVtLUEjot05x40yr3h78oMLmxWoqND7bTw3AJqE5bEyiMp75
 Fsmz0+9Pcw0LFgP2mCDe6avARuhnYD/dNywue/EtFDIrsHc3nCYhsNS/sbuf8c1QxE9z
 ScEA==
X-Gm-Message-State: AOAM5338vmDFNB+3jyo1/11L67B7D/VDPhoEbLzbJhghUUoMTELwg3Oq
 S63HRzRxVOqYEaa0zrDyH3IA7+VlXoM=
X-Google-Smtp-Source: ABdhPJxDzUoBdNxvCLM1iVteyitb7Ytz4NR01CKTk3+eGqv7qiWAhrmDARGg417sHSGISjOFrDjaLA==
X-Received: by 2002:a17:906:2551:: with SMTP id
 j17mr4655872ejb.441.1616502610232; 
 Tue, 23 Mar 2021 05:30:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id hd37sm10687676ejc.114.2021.03.23.05.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 05:30:06 -0700 (PDT)
Date: Tue, 23 Mar 2021 13:30:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
Message-ID: <YFnfYsfYaKfSGhon@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
 <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1898034343=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1898034343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NdJ6qRU46jo/KUVj"
Content-Disposition: inline


--NdJ6qRU46jo/KUVj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 12:34:22PM +0200, Mikko Perttunen wrote:
> On 1/14/21 10:36 AM, Dmitry Osipenko wrote:
> > 13.01.2021 21:56, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
> > > > 11.01.2021 16:00, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > +struct drm_tegra_submit_buf {
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @mapping_id: [in]
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Identifier of the mapping to use in t=
he submission.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 __u32 mapping_id;
> > > >=20
> > > > I'm now in process of trying out the UAPI using grate drivers and t=
his
> > > > becomes the first obstacle.
> > > >=20
> > > > Looks like this is not going to work well for older Tegra SoCs, in
> > > > particular for T20, which has a small GART.
> > > >=20
> > > > Given that the usefulness of the partial mapping feature is very
> > > > questionable until it will be proven with a real userspace, we shou=
ld
> > > > start with a dynamic mappings that are done at a time of job submis=
sion.
> > > >=20
> > > > DRM already should have everything necessary for creating and manag=
ing
> > > > caches of mappings, grate kernel driver has been using drm_mm_scan =
for a
> > > > long time now for that.
> > > >=20
> > > > It should be fine to support the static mapping feature, but it sho=
uld
> > > > be done separately with the drm_mm integration, IMO.
> > > >=20
> > > > What do think?
> > > >=20
> > >=20
> > > Can you elaborate on the requirements to be able to use GART? Are the=
re
> > > any other reasons this would not work on older chips?
> >=20
> > We have all DRM devices in a single address space on T30+, hence having
> > duplicated mappings for each device should be a bit wasteful.
>=20
> I guess this should be pretty easy to change to only keep one mapping per
> GEM object.

The important point here is the semantics: this IOCTL establishes a
mapping for a given GEM object on a given channel. If the underlying
implementation is such that the mapping doesn't fit into the GART, then
that's an implementation detail that the driver needs to take care of.
Similarly, if multiple devices share a single address space, that's
something the driver already knows and can take advantage of by simply
reusing an existing mapping if one already exists. In both cases the
semantics would be correctly implemented and that's really all that
matters.

Overall this interface seems sound from a high-level point of view and
allows these mappings to be properly created even for the cases we have
where each channel may have a separate address space. It may not be the
optimal interface for all use-cases or any one individual case, but the
very nature of these interfaces is to abstract away certain differences
in order to provide a unified interface to a common programming model.
So there will always be certain tradeoffs.

Thierry

--NdJ6qRU46jo/KUVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ32AACgkQ3SOs138+
s6EUdg//YiljkCtk6TyyBho2Mrf8hWM4ZRBLZ0xncHy0kQmgFAP96ADkgcYWniDK
kgYqXxFHv3Sy8HRjxkMNmRZW4uWYbgW6PPG70e2Xb2azQ8odl8ruI2AwyPlJCY7V
U9gutWa0/hesRJ/v7N2LPX1AnjLxNXuf2uvo1HNrPfGsqY9udo7EEefWeroaCNR6
Kx/rzDMaTmThbeUnVgiI7CURpfLsebu4/gxCRE7aXQtIYETeO+rdvDlGqJM8BuW9
J5uQu3+sR8BH+8AGAr2ERT3HnN0rzclcbR00UfIudnY9kS+xevvzvR9SC7F0glXY
tQAZdVXHKCiHSjR82gydRssZSVA1MbLzh/7uUHefHsa9rj4qFgnLWrGIuYmPRM7R
fqhrBAmCj9s4gsH1VNPol511Vcg5Teur+/Yrz6oaqz0qwraoUUW7ZkzaDGrgaQiQ
4QT6wkik1y3T3wLSL3lOcyejLDJNXOklkZqJe+bmorm1BqzTkI6gNGG+JtLwVeaT
GbmtsXRk8fr/EhPhfUU7dGTl9Q6zpYZhuFY6Oj/rf6oXmXRAw/u1BcJx+Qq1XbGq
2tSHGqCkv+2yM+0GI8Hheqp+m7zVKndbZSliqAE37eZhKcgM+s4odEAL0KNvxnkx
Sxq2VZ75pN2lmw+p7hLj4GbrTkVKgPWH2DoJUVMtWuyqcAVGi4A=
=1guJ
-----END PGP SIGNATURE-----

--NdJ6qRU46jo/KUVj--

--===============1898034343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1898034343==--
