Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3961264083
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A126E45F;
	Thu, 10 Sep 2020 08:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD876E45F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:50:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z17so3123879lfi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 01:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=YqsKluwy1xuCannxukwKrtvr5btKflVIozfo8NE6y30=;
 b=Xi7hOFhfhle+nH9+TKR0UHFIvJHW4zx29sJQGmiEGewKthcsQ9gs8tmjtDfK1zW+h7
 MdjB+Y3VJCgDhKvK6Uu/obSaVV4fDgUOdg++y0NAaWKeZPqQHc3pvMVQ/+KnUGc4bLm7
 aPTjaqtdL0+XJ8nenHLPNY+5aMFM7WQW6u6Cnnf+Tla0zb83q0jJbxrGwJ93DttQB2JD
 bGoUD4PKLyzRM66M+EpOh8SxfP5M4fU2JYjqCwcTI/9LBlfUmn9sh/F1GlBZrIMOq2Y0
 T/+FDsnoVJz6dqg+NB1FW6dnNQgnyiy4d1f8UxfYCOUN/pkGRvDAqjXZKQhcSj6tom+U
 MWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=YqsKluwy1xuCannxukwKrtvr5btKflVIozfo8NE6y30=;
 b=Mo7MLx9fr5J/RR9gL261ZS8zkQFO9QybjlItDBuW4P/7C7ekwfsH6l241C4mhGxdQa
 dRSokliGO50kZLyxnnRo5gqG3SqjWFQOmJvPLgPQZxmbigsqKQeQ/Ame/Iy9rmV++OMp
 Mugm/914Q74qv4fQ5wXI+Udm9BKV0xKzWc83ZSYY/K9mKdlB+sFov7xGLHJBeFz2i2kq
 Ep68NSfjCq2E5d9Euc21Lmwy35TcEKElZvQoAXtMv8EnQdmVRwzwNp8mu1wxYkq6WJqV
 APFEJZIpsFpVcej2uaAkYiGxJvkEQSXNFyKc4wZef0aaalP5ihO0qWAZOrOkNh3blSdn
 NbUw==
X-Gm-Message-State: AOAM530uRHfDmBABdF1P8sSqZB145DPLLuTHYEBrHNaeL9RSggtUMPfK
 s872KsshIZbhG7k1wVCFuAE=
X-Google-Smtp-Source: ABdhPJxmH55KHcjIErHb+8C+l9cDUqxviDQYQzfiTtP8mjB13WN/UxdADS30ngEIWcAne+lzZ9SujQ==
X-Received: by 2002:a19:be0b:: with SMTP id o11mr1291610lff.117.1599727830301; 
 Thu, 10 Sep 2020 01:50:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 18sm1194503lfg.29.2020.09.10.01.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:50:30 -0700 (PDT)
Date: Thu, 10 Sep 2020 11:50:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu
 <laurentiu.palcu@oss.nxp.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910115026.58dffaf1@eldfell>
In-Reply-To: <20200910075226.GF438822@phenom.ffwll.local>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1099955642=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1099955642==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jiKl=kv+VUMCh=PELc7xHRX"; protocol="application/pgp-signature"

--Sig_/jiKl=kv+VUMCh=PELc7xHRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2020 09:52:26 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
> > On Wed, 9 Sep 2020 13:57:28 +0300
> > Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> >  =20
> > > Hi all,
> > >=20
> > > I was wondering whether you could give me an advise on how to proceed=
 further
> > > with the following issue as I'm preparing to upstream the next set of=
 patches
> > > for the iMX8MQ display controller(DCSS). The display controller has 3=
 planes,
> > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after=
 the LUT
> > > respectively. Then the output from those 3 pipes is blended together =
and then
> > > gamma correction is applied using a linear-to-nonlinear LUT and anoth=
er CSC, if
> > > needed.

Hi,

hmm, so FB -> CSC -> LUT -> CSC -> blending?

Is it then
	blending -> LUT -> CSC -> encoder
or
	blending -> CSC -> LUT -> encoder?

Are all these LUTs per-channel 1D LUTs or something else?

What ever the KMS UAPI for these is going to be looking like, it
obviously needs to define all this. So I'm guessing we need to define
the abstract color pipeline of KMS in general that includes everything
any driver might want to expose. Then each driver picks the blocks in
the pipeline it wants to expose and the other blocks are assumed to be
"identity transform".

Without such general abstract color pipeline defined and documented it
is very unlikely IMO for generic userspace to make use of the driver
features.

All blocks must also default to identity transform. A block
unimplemented by a driver is the same as a block not used or understood
by a KMS client.

Userspace that does not understand all the blocks will need to use the
"harmless default values". This then ties in with what I've discussed
with danvet before: when you are VT-switching from one KMS client to
another, how do you reset the full KMS state (including blocks you
don't understand) to the same state you had before. The other KMS
client may have messed them up while you were gone.

All this default value talk is to ensure that the abstract KMS color
pipeline can be extended without breaking existing userspace.

...

> > > So, how should I continue with this one? Any pointers? =20
> >=20
> > Hi,
> >=20
> > I can't help you, but I can say that we are currently in the process of
> > designing a color management and HDR extension for Wayland, and I'm
> > sure in the long term I would like to use per-plane color space
> > transformation features of KMS in Weston eventually.
> >=20
> > IOW, one more userspace that is going to be taking advantage of such
> > features as long as they are not too driver-specific. =20
>=20
> Personally I think best to wait for userspace to come up with color
> manager protocols, that should give us a much clearer idea of what the
> kernel interface should look like. Since hw is pretty special in this
> area, I expect we'll have to do a bunch of impendendance mismatching in
> the kernel anyway.

Speaking of that, where should we scream if we feel like we are missing
KMS properties to get the best out of color management and HDR in
Weston, assuming we're not kernel devs?

Who to Cc?

We currently have intel and AMD hardware at hand if that makes any
difference.


Thanks,
pq

--Sig_/jiKl=kv+VUMCh=PELc7xHRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9Z6NIACgkQI1/ltBGq
qqfxvw/6AngPBkZ9Wb/IUkbKtHGP2sT6Eaul/xRNsuQ27YXmy7gR3PASdqRdLpg/
abvYadJk21Zjsyl4Y9MEvJr9kq7jzE4hsUlT4HlC4R0w8vrvRj3oVjeHURU0sPgY
7Z9b41DDvypl5gn4JA1pN68gOQGmwt8zGt4wzmEASNhQoERNsQtJtTPJoU4lNMfp
JnbCUog2yQmxS5v93+DbflvP5f2dYwmKYOASnUGHbwGpgxGuXeAgPoFoVPhTXjLi
LHvQoEiRgMXY2LKNmNzJj+ZBJLhCsczaw1wAvs8D+PbZj7mmards8qoiHME5vM2l
iTVfEpj+W3QjDzyOde3xOogxZu7Otf3tIvknrzsFC5WaLN9v1WWDxvKu4R4WOKuB
E7nJv7gq2slySjQGjqVvVt+HSSbPNOGeuGKk0VI7cNFgmsXGVI5uMX3M/9NLCzqW
BCRcVD5I/PEWorIv6J4BIpVcmcScmJMeP51fCDKK7mYPs1cUGriQ1HdB+Qj0FUi+
ioryZTGU8jnPqsMceEcaYc7e6+EvcrnGP97WVM5upB7FFaIqZM+Zm1XtlWIjyOP0
Z48impBFJ0Mthe7BLumvau9ewPoNUrvoBiD3r/vogndDtZ8b3jC33UsvjGrhEN4U
OhztduewVjYeROKdLSkQ08lfQLIk0p1e7IxftgXYSTP+aXuk398=
=55In
-----END PGP SIGNATURE-----

--Sig_/jiKl=kv+VUMCh=PELc7xHRX--

--===============1099955642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1099955642==--
