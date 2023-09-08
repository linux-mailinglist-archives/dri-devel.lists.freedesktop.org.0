Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC1798416
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 10:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FB210E098;
	Fri,  8 Sep 2023 08:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB57610E05D;
 Fri,  8 Sep 2023 08:31:44 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-501bd164fbfso2909216e87.0; 
 Fri, 08 Sep 2023 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694161903; x=1694766703; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=B3wgL5aaMJlqDZoTPUBZvdCnRXbPhwqQ4Gfn6k4f15g=;
 b=KSTCNPmTqQtOF2H7h3D/WR9ZawqrH3e9dPuwk3y6pkgVAEUzV5nHvtNGUREpaNP0Ty
 AnTKjOYJd3laQXtztSxWkRPsz2mM/WgSTI0aKuPQeYtobvLKjal/hEzk4FhDqOGrD2Ep
 7oyzGFCfuoevVqy2BHoovRP0dsk9wJhwlurAaEGo34rOyQq95S86S13DBtQ7UrS6WWBB
 qWbZqRQ8Sb1e1p3MTNNGgnmg5c33mEspoEK+1XWGdlLEMA2Y22HAzBdBNQr+TmVLoIYG
 9bC1D/nRicdrJYizmmwLyKCSzQbFgZ1UZ3qMsUuMan2+Q/HUNDkKeyWO5o0KaUo1HsZG
 erwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694161903; x=1694766703;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B3wgL5aaMJlqDZoTPUBZvdCnRXbPhwqQ4Gfn6k4f15g=;
 b=Vcjzr3RUSvgQwpsgjwnql/a/RNx+5tVCgNPc4iELJwiaCCZqdDmH3WehIdp4XIvt3J
 DfZbTsZwrDjbnp1KvfNoegjcYXSm2EQXAGjVn1ay9c1rhqn+a+2RL/9v5hPJMLwGoVSM
 fMVY2Cibi4rJd8qA0JVoUdMvCAbsTLxnpzMd1ozDmAQrYkWsJOM3sG2L1vS1VMqr8Joc
 H326bxsXyHLxEpdxKYxJ2NGE4AxaZFJNUyxcb/bljdz0LgaXXGVEr7E3oFExiCrTmRhS
 rngkcu8G8KXUmHlX4OluGgySvcDsYTNsa7VmFVZxXZjSmeFTX4/BJi3zB0o0NKcg2bsw
 7+hQ==
X-Gm-Message-State: AOJu0Yx4eESctO4sdQf6zr0D5A5uPJGqONobEUsfGScgHzceAUV+MMKU
 oDGOOAC+iJ6BCkvE6MEoglc=
X-Google-Smtp-Source: AGHT+IH2TaJjgtpFRvnVZ1OutjvA1ZadAo4tS2JINb4IuEn6RC+2WCMhjoJyTyy7uKpVCaNOgXif9w==
X-Received: by 2002:ac2:4f06:0:b0:4fb:ca59:42d7 with SMTP id
 k6-20020ac24f06000000b004fbca5942d7mr1420966lfr.33.1694161902480; 
 Fri, 08 Sep 2023 01:31:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x21-20020a19f615000000b004fe38e566cfsm211356lfe.280.2023.09.08.01.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 01:31:41 -0700 (PDT)
Date: Fri, 8 Sep 2023 11:31:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Plane
 Color Pipeline
Message-ID: <20230908113139.3ce91984@eldfell>
In-Reply-To: <DM4PR11MB63607D9EAEEFC9BA0DAFFBB5F4EEA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-2-uma.shankar@intel.com>
 <73c0d398-63fe-4ce1-92db-f0f1f5e839a3@amd.com>
 <PH7PR11MB6354303E054759387403CFF1F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
 <20230830152832.59312231@eldfell>
 <IA1PR11MB6347B6B8F4E51862B0CC235DF4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
 <20230905143245.4e6d0a06@eldfell>
 <DM4PR11MB63607D9EAEEFC9BA0DAFFBB5F4EEA@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hMumgNN/FtlDjU9I9jvoACq";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Jonas Adahl <jadahl@redhat.com>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hMumgNN/FtlDjU9I9jvoACq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Sep 2023 12:31:47 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <ppaalanen@gmail.com>
> > Sent: Tuesday, September 5, 2023 5:03 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; dri-devel@lists.freedesktop.org; way=
land-
> > devel@lists.freedesktop.org; Harry Wentland <harry.wentland@amd.com>;
> > Sebastian Wick <sebastian.wick@redhat.com>; ville.syrjala@linux.intel.c=
om;
> > Jonas Adahl <jadahl@redhat.com>
> > Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Pla=
ne
> > Color Pipeline
> >=20
> > On Mon, 4 Sep 2023 13:44:49 +0000
> > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > > Of Pekka Paalanen
> > > > Sent: Wednesday, August 30, 2023 5:59 PM
> > > > To: Shankar, Uma <uma.shankar@intel.com>
> > > > Cc: intel-gfx@lists.freedesktop.org; Borah, Chaitanya Kumar
> > > > <chaitanya.kumar.borah@intel.com>; dri-devel@lists.freedesktop.org;
> > > > wayland- devel@lists.freedesktop.org
> > > > Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed
> > > > Plane Color Pipeline
> > > >
> > > > On Wed, 30 Aug 2023 08:59:36 +0000
> > > > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> > > > =20
> > > > > > -----Original Message-----
> > > > > > From: Harry Wentland <harry.wentland@amd.com>
> > > > > > Sent: Wednesday, August 30, 2023 1:10 AM
> > > > > > To: Shankar, Uma <uma.shankar@intel.com>;
> > > > > > intel-gfx@lists.freedesktop.org; dri-
> > > > > > devel@lists.freedesktop.org
> > > > > > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > > > > > wayland- devel@lists.freedesktop.org
> > > > > > Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for
> > > > > > proposed Plane Color Pipeline
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 2023-08-29 12:03, Uma Shankar wrote: =20
> > > > > > > Add the documentation for the new proposed Plane Color Pipeli=
ne.
> > > > > > >
> > > > > > > Co-developed-by: Chaitanya Kumar Borah
> > > > > > > <chaitanya.kumar.borah@intel.com>
> > > > > > > Signed-off-by: Chaitanya Kumar Borah
> > > > > > > <chaitanya.kumar.borah@intel.com>
> > > > > > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > > > > > ---
> > > > > > >   .../gpu/rfc/plane_color_pipeline.rst          | 394 +++++++=
+++++++++++
> > > > > > >   1 file changed, 394 insertions(+)
> > > > > > >   create mode 100644
> > > > > > > Documentation/gpu/rfc/plane_color_pipeline.rst
> > > > > > >
> > > > > > > diff --git a/Documentation/gpu/rfc/plane_color_pipeline.rst
> > > > > > > b/Documentation/gpu/rfc/plane_color_pipeline.rst
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..60ce515b6ea7
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/gpu/rfc/plane_color_pipeline.rst =20
> > > >
> > > > ...
> > > >
> > > > Hi Uma! =20
> > >
> > > Thanks Pekka for the feedback and useful inputs. =20
> >=20
> > Hi Uma,
> >=20
> > sorry to say, but the overall feeling I get from this proposal is that =
it is just the
> > current color related KMS properties wrapped in a pipeline blob. That i=
s not the
> > re-design I believe we are looking for, and the feeling is based on sev=
eral details
> > that are just copied from the current property design. Also the "privat=
e" stuff has
> > to go. =20
>=20
> Hi Pekka,
> Ok, got the concerns in general.  We will try to evaluate in deeper detai=
l the
> property based design and come back if there are some issues or inputs.
> =20
> At Intel we don't need private as of now, but we thought of having an opt=
ion to
> enable any custom hardware or vendor. But we can drop the same for now if
> community doesn't feel the need for it.
>=20
> > All the varying LUT entries, varying LUT precision, 1D/3D LUTs, varying=
 LUT tap
> > distribution, and parametrized curves are good development, but right n=
ow we
> > are looking at things one step higher level: the overall color pipeline=
 design and
> > how to represent any operation. Most of this series is considering deta=
ils below
> > the current attention level, hence I'm paying attention only to the fir=
st few
> > patches. =20
>=20
> We will need to precisely describe the hardware in userspace. Number of l=
uts, precision,
> segments etc.., we can't just pass EOTF's as enum from userspace and let =
driver put
> hardcoded values to LUT. This will be nothing but an extension of descrip=
tive behaviour.
> This will be needed as there are multiple colorspaces possible and even L=
UTS can be
> used to perform tone mapping. So, we need userspace to be able to program=
 luts directly.

Hi Uma,

yes, we do need to expose freely programmable LUTs when hardware has
them. That's why I say it is good development.

However, this is not an either-or situation.

We must also be able to expose fixed-function curve blocks when
hardware has them. Please, do not confuse this with a descriptive
design. This is not about saying "this FB is using PQ encoding, convert
it to NNN for me".

This is about defining an operation, that is mathematically defined as
"the PQ EOTF with normalized domain and range", for example. This is
prescriptive, because the exact mathematical formula of the operation
is defined, and it does not depend on any properties of the block's
input or output. It contains no opinions on how to convert something to
another, like a conversion from a color system and viewing environment
to another does (e.g. sRGB<->BT.2100/PQ). Every driver exposing this
operation must implement it exactly the same, with a small allowed error
tolerance.

There are no limitations on how it can be used. Userspace can choose to
apply that formula on anything it likes, and use the result in any way
it likes, even if it is an utterly non-standard pipeline not making any
sense *to us*.

You could argue that an operation to "convert PQ to HLG" is also
prescriptive for example, and yes, it is if implementations have to
adhere to a single specific formula for it. But if implementations are
allowed choose any formula they believe is the best to implement that
operation, then it is descriptive: "I have PQ content, I want HLG out,
do whatever, I don't care".

If you really have a fixed-function hardware block that literally uses
one specific formula to convert PQ to HLG, you can and probably should
expose that as a colorop. It is prescriptive, because the formula is
fully known to userspace, and userspace will choose to use it for its
formula, and not because it converts PQ to HLG.

However, if you had to combine multiple hardware blocks to achieve the
PQ-to-HLG formula, then that does not make sense to expose as a colorop
(other than for backward compatibility if your previous hardware
generation had it as a single fixed-function block). In practise, it
would be too rigid to be useful in more than few specific situations.
It would be much more flexible to expose the actual hardware blocks you
have, and let userspace use them any way it likes. This is about
finding the right balance in abstraction for UAPI.

> This is something we must expose to userspace. We will check if this can =
be fitted in
> property based approach.

I'm sure it can be exposed. The trivial option is to define a colorop
with the specific operation type that defines a property that will hold
the LUT configuration blob you have designed.

You do not need to force literally everything into a million
properties, you can still use blobs where they make sense, like needing
a variable or great number of elements of some type.

As such, the overall color pipeline UAPI design has little effect
on how you would design your LUT UAPI structures.


Thanks,
pq

--Sig_/hMumgNN/FtlDjU9I9jvoACq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT62+sACgkQI1/ltBGq
qqfjVA/9FX0a2KrWTJvxKraJVWo9CnOcvWnLWfzEm5hvIXXs4Wi/Yyn2HJk8yLJS
vI/EjuYvIiYgE2HILwgeLcoYVb31WXgFCwriEL6oj8eRsfuN+VYgRxBIcng06Izp
3DNqxpJNi3WIJ166H93AVS7TdZEC54WD8zz0IYPYIs9rtgeukuIvlhjxKxq+Jb0S
yPHkTl+CiGXLONpan6u5ec+gUh+28eXMLv+1BYOEB8ty26wEJjgd+RhM5FgaGwVE
mb1AvbFE9BRyrrMsszFgUy+7w1RWSv4bwbbfEFdg26IZ0mImCuZyeGKjr2wNoGfZ
wLDZy4/9c3F1whefwxiwncpd4XSfuUpZv94oKrkJGYYJb/bLSHoN6cm8Wv6TSp1B
WlSgLM+3AuN2pUWMjIt7RZqhsy5yHeLBK4NOFTjEycKrm8Gs1QK6f/5TmSSB3hsf
hYJb0bCB0ZoDhtYyH6fz3YN4+WiFQ3uRC2Dwu9vVqN+48ZUWqbuTZwUzVJSiI+Sw
oSTokw15XxZedoqtJpSeOlRmxwFSfCLn1EExsjMaQm7bj6pEAhRBg3plO7X/8mRH
Zh4HjFoHCKBlwrO2W46gTz/WHp2OQIEdfKZVJ+Rq9JD7JJJNpcQzvKYXVbCHrV2T
rBOTE5vCP8No1A8CbIsFc3cZGjsuq3XsDmpIsEsQf59KnPgQOpM=
=Isgl
-----END PGP SIGNATURE-----

--Sig_/hMumgNN/FtlDjU9I9jvoACq--
