Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF0842EA74
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2944A6ECEA;
	Fri, 15 Oct 2021 07:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0606ECEA;
 Fri, 15 Oct 2021 07:42:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p16so38196677lfa.2;
 Fri, 15 Oct 2021 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=3T+DYQHhY7sd9UIz2PRqgYZcpLqayYdYjcQQNFRArRM=;
 b=issLomMWrpTlYqSKVpa2Zy1gu8bY42061mNw4vf3wBtua/pVqo+3bemKswx2Pxiy3k
 dguWjPctJh+QRgBKVpzz9ZJQzuKnpfdd1MZDEmURAKo4byo4fFVLbKCim5ERixzVzCke
 m8PikbRxs6Y3EbFWNIqUuxCCHhVSNXA/3Wj6VW8nh0wH/GAg9O7u8cyJzqU5J6oT9OwB
 Zc8oskiXMJhKZO1keYXbVcubki564F8vBdeEAaw/C7vpnVvSSZm5Tip5w8mUKhqdevK2
 ceUHhXkLzf0CYU9+1f59U9hR1Z2MR7smkLCitEhA7zrcQdJvk5r8PzGFCHDAZrt3h2Z6
 SX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=3T+DYQHhY7sd9UIz2PRqgYZcpLqayYdYjcQQNFRArRM=;
 b=onoekwRxxfBbJpLL7Yc0NqI1Nvko2Om+TM+p9fLy761Q5an9mw7j1AAiHUEhpbAbZ3
 M6e/2+vDcIiVSidaxFT/psYCuao1Ryf+kDpXt+mD/0zd4onBwDoOKZ5hvI5wzGNRy/rS
 4HYKvAQHfwJ76t7UtDdeAICI4O+UCatw2zL4nD87eU+a+a6KkMahicPX2WBgeFjgP1HC
 LdlNYFCkRSshwEJUYMw8o8OzZWt+kmwIAvAGC8kE/d3R30Qt8O7f4eOvTZtRQDRs058H
 BySOkTEtr649YWK4vsVtWZq3NtAfIZqt+l7HkYI+UJDy3SVSWK3CxRbicxKZmPZ97OlH
 aRBg==
X-Gm-Message-State: AOAM533V+hsHS3XK3G9akvtNsdfBnSLucOncx1ZE1mmf+XBrcK9wL25b
 kcgBOftTJ/HTBCzfzqqNVbA=
X-Google-Smtp-Source: ABdhPJxEb1ZJDJMng8JiG8kX6RP78nhVz3pHOENq+EdMq7v10+AcENBkSmo2gTn+lOg7H9fRalkS1g==
X-Received: by 2002:a05:6512:acd:: with SMTP id
 n13mr9913186lfu.524.1634283767145; 
 Fri, 15 Oct 2021 00:42:47 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t3sm430737lfc.216.2021.10.15.00.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:42:46 -0700 (PDT)
Date: Fri, 15 Oct 2021 10:42:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211015104237.10e39a90@eldfell>
In-Reply-To: <8c1d39bf5d034595aafd8937df259547@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
 <20211013113046.7ace2dbd@eldfell>
 <8c1d39bf5d034595aafd8937df259547@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hB5Wk=2CF7F5CgQ0X+D_2u3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/hB5Wk=2CF7F5CgQ0X+D_2u3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Oct 2021 19:44:25 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <ppaalanen@gmail.com>
> > Sent: Wednesday, October 13, 2021 2:01 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: harry.wentland@amd.com; ville.syrjala@linux.intel.com; intel-=20
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;=20
> > brian.starkey@arm.com; sebastian@sebastianwick.net;=20
> > Shashank.Sharma@amd.com
> > Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
> >=20
> > On Tue, 12 Oct 2021 20:58:27 +0000
> > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: Pekka Paalanen <ppaalanen@gmail.com>
> > > > Sent: Tuesday, October 12, 2021 4:01 PM
> > > > To: Shankar, Uma <uma.shankar@intel.com>
> > > > Cc: intel-gfx@lists.freedesktop.org;=20
> > > > dri-devel@lists.freedesktop.org; harry.wentland@amd.com;=20
> > > > ville.syrjala@linux.intel.com; brian.starkey@arm.com;=20
> > > > sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> > > > Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware=20
> > > > Pipeline
> > > >
> > > > On Tue,  7 Sep 2021 03:08:43 +0530 Uma Shankar=20
> > > > <uma.shankar@intel.com> wrote:
> > > > =20
> > > > > This is a RFC proposal for plane color hardware blocks.
> > > > > It exposes the property interface to userspace and calls out the=
=20
> > > > > details or interfaces created and the intended purpose.
> > > > >
> > > > > Credits: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > > > ---
> > > > >  Documentation/gpu/rfc/drm_color_pipeline.rst | 167
> > > > > +++++++++++++++++++
> > > > >  1 file changed, 167 insertions(+)  create mode 100644=20
> > > > > Documentation/gpu/rfc/drm_color_pipeline.rst
> > > > >
> > > > > diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > > > b/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > > > new file mode 100644
> > > > > index 000000000000..0d1ca858783b
> > > > > --- /dev/null
> > > > > +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > > > @@ -0,0 +1,167 @@
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > > +Display Color Pipeline: Proposed DRM Properties =20

...

> > cf. BT.2100 Annex 1, "The relationship between the OETF, the EOTF and=20
> > the OOTF", although I find those diagrams somewhat confusing still. It=
=20
> > does not seem to clearly account for transmission non-linear encoding b=
eing different from the display EOTF.
> >=20
> > Different documents use OOTF to refer to different things. Then there=20
> > is also the fundamental difference between PQ and HLG systems, where=20
> > OOTF is by definition in different places of the camera-transmission-di=
splay pipeline. =20
>=20
> Agree this is a bit confusing, I admit I was much more confused than what=
 you were for sure.
> Will do some research to get my understanding in place. Thanks for all th=
e inputs.

I'm sure I was at least equally confused or even more at the start. I
have just had a year of casual reading, discussions, and a W3C workshop
attendance to improve my understanding. :-)

Now I know enough to be dangerous.

...

> > > > > +
> > > > > +UAPI Name: PLANE_DEGAMMA_MODE
> > > > > +Description: Enum property with values as blob_id's which=20
> > > > > +advertizes
> > > > > the =20
> > > >
> > > > Is enum with blob id values even a thing? =20
> > >
> > > Yeah we could have. This is a dynamic enum created with blobs. Each=20
> > > entry contains the data structure to extract the full color=20
> > > capabilities of the hardware. It=E2=80=99s a very interesting play wi=
th=20
> > > blobs (@ville.syrjala@linux.intel.com brainchild) =20
> >=20
> > Yes, I think I can imagine how that works. The blobs are created=20
> > immutable, unable to change once the plane has been advertised to=20
> > userspace, because their IDs are used as enum values. But that is ok,=20
> > because the blob describes capabilities that cannot change during the=20
> > device's lifetime... or can they? What if you would want to extend the=
=20
> > blob format, do you need a KMS client cap to change the format which=20
> > would be impossible because you can't change an enum definition after i=
t has been installed so you cannot swap the blob to a new one?
> >=20
> > This also relies on enums being identified by their string names,=20
> > because the numerical value is not a constant but a blob ID and gets=20
> > determined when the immutable blob is created.
> >=20
> > Did I understand correctly? =20
>=20
> Yes that=E2=80=99s right. We are not expecting these structures to change=
 as
> they represent the platforms capabilities.

Until there comes a new platform whose capabilities you cannot quite
describe with the existing structure. What's the plan to deal with that?
A new enum value, like LUT2 instead of LUT? I suppose that works.

>=20
> > As a userspace developer, I can totally work with that.
> >  =20
> > > > > +	    possible degamma modes and lut ranges supported by the plat=
form.
> > > > > +	    This  allows userspace to query and get the plane degamma c=
olor
> > > > > +	    caps and choose the appropriate degamma mode and create lut=
 values
> > > > > +	    accordingly. =20
> > > >
> > > > I agree that some sort of "mode" switch is necessary, and=20
> > > > advertisement of capabilities as well.
> > > > =20
> > >
> > > This enum with blob id's is an interesting way to advertise segmented=
 lut tables.
> > > =20
> > > > > +
> > > > > +UAPI Name: PLANE_DEGAMMA_LUT
> > > > > +Description: Blob property which allows a userspace to provide L=
UT values
> > > > > +	     to apply degamma curve using the h/w plane degamma process=
ing
> > > > > +	     engine, thereby making the content as linear for further c=
olor
> > > > > +	     processing. Userspace gets the size of LUT and precision e=
tc
> > > > > +	     from PLANE_DEGAMA_MODE_PROPERTY =20
> > > >
> > > > So all degamma modes will always be some kind of LUT? That may be=20
> > > > a bit restrictive, as I understand AMD may have predefined or=20
> > > > parameterised curves that are not LUTs. So there should be room=20
> > > > for an arbitrary structure of parameters, which can be passed in=20
> > > > as a blob id, and the contents defined by the degamma mode. =20
> > >
> > > For Intel's hardware these are luts but yeah AMD hardware seems to=20
> > > have these as fixed function units. We should think of a way to have=
=20
> > > this option as well in the UAPI. We could extend the DEGAMMA_MODE=20
> > > property to have all the info, and DEGAMMA_LUT_PROPERTY may not be=20
> > > needed based on some of the attributes passed via DEGAMMA_MODE. This=
=20
> > > can be =20
> > one way to have room for both. =20
> > > @harry.wentland@amd.com thoughts ? =20
> >=20
> > Yeah, though I don't think you can use DEGAMMA_MODE property to pass=20
> > parameters to fixed-function curves. The parameters need another=20
> > property. Would be natural to use the other property for LUT data when =
mode it set to LUT.
> >=20
> > A trivial and made-up example of a parameterised fixed-function curve=20
> > is pow(x, gamma), where gamma is the parameter. =20
>=20
> We can maybe have a parallel property as well with proper
> documentation if this helps with flexibility for varying hardware
> vendors. UAPI document will list what to use and when. May be
> platform will not even list the other one which may make things less
> complicated to userspace.

I'm not sure I got what you're thinking. My idea is that the
interpretation of the blob contents depends on the value of the mode
enum. Obviously the two will always need to be set together by
userspace to ensure they match, otherwise DRM needs to reject the
commit.


The rest of your comments I agree with.


Thanks,
pq

--Sig_/hB5Wk=2CF7F5CgQ0X+D_2u3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFpMO0ACgkQI1/ltBGq
qqdfSw/+ILo4MF8ld5NS9yqNQ1y5SunW6j/rQqTv/LnfxW9GZk+GTkD/mvdkUDF0
N/AowGOmnHqY3HC6HExvRElHMdGZ+diDG7+NIjjaciMC6yaVErSMwh0cOCcZHF8G
M7ZE1sw66zFbdpjSOCCy+U4i+Ig8+e3P5uLWgINfoCSwYAlOkRBUfVMstvrkypH0
lLrecfdUvgpJgvCBFh75/B7+mVeaO+A3zB4L266TcEJxhEGojetbwQZY3Sv0e80U
SJnW2W4Sjl3BMAH8+6ZBCjoFZRlmzbDJwNbfK7eN+DOp3NXaMdGyiQw3fGJTvdO6
F2A7RjGnFJdz3TzAOzXdqdu+Z0RhIE0K+trftwmdSgSUZqeM+dYnyvwoNUrS31um
Uemjeyfq16X2aNk/iyzS2ND/+MSCe4K1bpVWz6PjXUUhehROm/2+aUapqNzlt7ZX
AxCV3tRz/mJAqLEMxEdEy4ea2yDg5lE9M2ltOBIVSIcesHvgS8lH5t8wVYG6Ap+U
ren3wg0Q92k1CAdnYvrmHrx5n38/HFyns0BiMoZITQq140RerymYak/lJOuquPoO
gommDGz+Jb2tmeT7QpXJ+DmcfDAgLCXYN39jKcxq1o+JHo7t+nVPzPR3JZXJqu5I
HvVzZc0sF23nJBqXELJkn589ms4LXxKCOUOdptmUiP4gSFmpi48=
=8di1
-----END PGP SIGNATURE-----

--Sig_/hB5Wk=2CF7F5CgQ0X+D_2u3--
