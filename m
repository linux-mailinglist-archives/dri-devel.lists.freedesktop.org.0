Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673C45E947
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 09:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A442F6E5B6;
	Fri, 26 Nov 2021 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7B46E526;
 Fri, 26 Nov 2021 08:21:16 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id k23so17301970lje.1;
 Fri, 26 Nov 2021 00:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=VWTq8iHfi0ZQc5bLZaaeG7DajEBAvJ+dF5+P1CE8dzo=;
 b=mrWY1y3Q3yQgn0Sgl+7y6PWlMWw4YLgdndkj7oYDOwDtA0007k8cLqPz55LAduBSMJ
 hZh6sN4kMVJP/8PKoR4DVCzjPMyYbmHn2LM8kbowWGlQj7o1QzC8lqc94lL9+G6w//qk
 yegD2UHxyWC6Ihfk5tY3pNMIsdatmXcF4i8kDB8oSzBn22dcxQ14wCL6CPPLIMlSx+pc
 AlGgNIGH7PBTdPxw9VQvoF/snGBBtHBvwXIsBEkYKwa8YnS83HkAtLQPHcv0uTXxnitb
 uDKk4ESjLZX8YbytfWyrOzBcKGoBR5iIlbwFRB7sDaJto8jBT44Lo5oPHjNaxgFcgMjW
 gcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=VWTq8iHfi0ZQc5bLZaaeG7DajEBAvJ+dF5+P1CE8dzo=;
 b=wOpWqDN2dXUpgsUU1vYuVvfoDiSnqvw3YVB0eNwKSaOLHAHlMmUrOBcP5iqu3Wwss+
 g5bG5hUm8wjo/HkWWRzlMMzJo52dC+HIl/eun4MjxhNVQcMXyspa0UC/ZDxZAy/b5QDs
 jT21D0M9/G9LniBwmLOjJtv0jPGgUwllu2kIaXKn/j5TV9ZlBJY60WNAWbcNGb5Pf4fi
 iX60mMfljW1Cd4NKlez12dJeRE44MbBJ7JRfbV0+nWmifKTMTek724ZpMJq8nqYJpzdK
 b4hcUWJjS9wDR1D+Q5Wqn+gCuEVV4MG84aXO3kXzdeujDCf3SGLOIYvK+T7dwROQe2pV
 boYQ==
X-Gm-Message-State: AOAM531XJjVCHtI7a5no+41UiHSVkJVRvoB6xvJo/YsOIqYo6XnqtwN/
 CGuQc5njbXYq4V1BiQYVwIs=
X-Google-Smtp-Source: ABdhPJzc6yQZ1yL2LQu0vBR3V7cbUT4GeD1R4j5XNLuKjXfgaVetAff6bbMdkBTZI9gd+zhPaxKdVg==
X-Received: by 2002:a05:651c:11cf:: with SMTP id
 z15mr28880436ljo.30.1637914875111; 
 Fri, 26 Nov 2021 00:21:15 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b12sm449250lfb.41.2021.11.26.00.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 00:21:14 -0800 (PST)
Date: Fri, 26 Nov 2021 10:21:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211126102105.567428f2@eldfell>
In-Reply-To: <062cb4bfe0d94fb9aa34845b413e9021@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <2a2684e6-f5d6-c917-6f0c-8dc3704ddaf6@amd.com>
 <062cb4bfe0d94fb9aa34845b413e9021@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j6d_irybuesop7q7mi.S57v";
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
Cc: "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/j6d_irybuesop7q7mi.S57v
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Nov 2021 20:43:19 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Harry Wentland <harry.wentland@amd.com>
> > Sent: Tuesday, November 23, 2021 8:35 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.o=
rg; dri-
> > devel@lists.freedesktop.org
> > Cc: ville.syrjala@linux.intel.com; ppaalanen@gmail.com; brian.starkey@a=
rm.com;
> > sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> > Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
> >=20
> >=20
> >=20
> > On 2021-09-06 17:38, Uma Shankar wrote: =20
> > > This is a RFC proposal for plane color hardware blocks.
> > > It exposes the property interface to userspace and calls out the
> > > details or interfaces created and the intended purpose.
> > >
> > > Credits: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  Documentation/gpu/rfc/drm_color_pipeline.rst | 167
> > > +++++++++++++++++++
> > >  1 file changed, 167 insertions(+)
> > >  create mode 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
> > >
> > > diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > b/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > new file mode 100644
> > > index 000000000000..0d1ca858783b
> > > --- /dev/null
> > > +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > @@ -0,0 +1,167 @@
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +Display Color Pipeline: Proposed DRM Properties
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +
> > > +This is how a typical display color hardware pipeline looks like:
> > > + +-------------------------------------------+
> > > + |                RAM                        |
> > > + |  +------+    +---------+    +---------+   |
> > > + |  | FB 1 |    |  FB 2   |    | FB N    |   |
> > > + |  +------+    +---------+    +---------+   |
> > > + +-------------------------------------------+
> > > +       |  Plane Color Hardware Block |
> > > + +--------------------------------------------+
> > > + | +---v-----+   +---v-------+   +---v------+ |
> > > + | | Plane A |   | Plane B   |   | Plane N  | |
> > > + | | DeGamma |   | Degamma   |   | Degamma  | |
> > > + | +---+-----+   +---+-------+   +---+------+ |
> > > + |     |             |               |        |
> > > + | +---v-----+   +---v-------+   +---v------+ |
> > > + | |Plane A  |   | Plane B   |   | Plane N  | |
> > > + | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> > > + | +---+-----+   +----+------+   +----+-----+ |
> > > + |     |              |               |       |
> > > + | +---v-----+   +----v------+   +----v-----+ |
> > > + | | Plane A |   | Plane B   |   | Plane N  | |
> > > + | | Gamma   |   | Gamma     |   | Gamma    | |
> > > + | +---+-----+   +----+------+   +----+-----+ |
> > > + |     |              |               |       |
> > > + +--------------------------------------------+
> > > ++------v--------------v---------------v-------|
> > > +||                                           ||
> > > +||           Pipe Blender                    ||
> > > ++--------------------+------------------------+
> > > +|                    |                        |
> > > +|        +-----------v----------+             |
> > > +|        |  Pipe DeGamma        |             |
> > > +|        |                      |             |
> > > +|        +-----------+----------+             |
> > > +|                    |            Pipe Color  |
> > > +|        +-----------v----------+ Hardware    |
> > > +|        |  Pipe CSC/CTM        |             |
> > > +|        |                      |             |
> > > +|        +-----------+----------+             |
> > > +|                    |                        |
> > > +|        +-----------v----------+             |
> > > +|        |  Pipe Gamma          |             |
> > > +|        |                      |             |
> > > +|        +-----------+----------+             |
> > > +|                    |                        |
> > > ++---------------------------------------------+
> > > +                     |
> > > +                     v
> > > +               Pipe Output
> > > + =20
> >=20
> > This diagram defines what happens before and after the blending space b=
ut did
> > where does scaling fit into it? Scaling can look different when perform=
ed in linear or
> > non-linear space so I think it is important to define where in the pipe=
line it sits.
> >=20
> > In my view scaling would happen between plane degamma and plane CSC. =20
>=20
> Yeah we can add scaling as well to make it clear. Scaling ideally should =
happen after
> Degamma. In intel's case it is after the CSC.

Btw. are you aware that if a plane has an alpha channel which is used
for pixel coverage (i.e. shape anti-aliasing), then non-nearest
sampling and therefore also scaling must operate on alpha
pre-multiplied optical (linear) values?

For the best results, of course.

So after degamma indeed, but you cannot degamma with pre-multiplied
alpha, yet scaling should use pre-multiplied alpha.


Thanks,
pq

--Sig_/j6d_irybuesop7q7mi.S57v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGgmPEACgkQI1/ltBGq
qqfLMg/8CLUd9qenhn72us9O1b88jX4zJaWN7oGsTQySMd0Waj75j/enJ+ztUO1q
tCRLbk07DcpEP0N2NFeNrNiW0MtQGChtNv2PwD84gnFIEktKab9/H41DYU1MUuhQ
AW0yH5d+Vm9Y06ncI9uWM4It/sU0c3XwJ2RwPiQRQYMUJSnaIrm4cVIEZ+Y6Bc0J
0WeDIR2x+xzMN1cHXaCstp9KRz112I1YU3JbTYRf6UYJcw+NdXq8DCx+65gLxxx/
vCLdfM0TSO0sdkBjCraQHGiq3snsm9prbpsgYjNrp/2fv09NLcoXC/RbCvMEMdfD
MNRuCbMZl9T8mTURLdXKiYC0KU+/AHHGAQRy+/MomNS1xp3sZM9EIaHV5rdohRde
5EaFdaq7/EHUDIkpk9hM6qF91MwzYENEEMgyGF73meeE87UsVLWjQ+abZV9em7NE
RTQ5gStBGrtfmp2Lkl01gEX/LQ7K7PKIx5+koj5Qjs+MriwSil2fKNlJoKGR3Guk
598FfN5ryaZNO+ubf5NS4TUjP6Np9ms8FZHMeo219rY2KHNbs91y8Yql/Pt/0v5g
TAbWY/AIuQgIQCgP0Au8Ufgzx9U1rCRSiMnybhyk1ubL9mEwvzHRBffmts8bX5pz
KxgHl4C3TR7gl4CsoO+bx6EKaCiHyZA1wsQGtdBWGzcOWyKN1rM=
=52fx
-----END PGP SIGNATURE-----

--Sig_/j6d_irybuesop7q7mi.S57v--
