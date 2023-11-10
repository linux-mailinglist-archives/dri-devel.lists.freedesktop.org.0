Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F27E7C8F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 14:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF0410E059;
	Fri, 10 Nov 2023 13:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C910E010;
 Fri, 10 Nov 2023 13:27:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c6ed1b9a1cso25248191fa.3; 
 Fri, 10 Nov 2023 05:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699622856; x=1700227656; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bsqp6QDbnl+BZbpxh5DVbVgFfmrykVj8TNvlrU1xFaA=;
 b=K8ComweFiKAXhDP44UcDV0jTbV4XG09Hgqq9t64U8tBZVy7w7b2btlml4DnIrE8Zo8
 nW3mnFrrENc8hvxbM/TwZbuVimQ+p2qBHFtHPDiiTSd7t7M8cMutqqi2LWNwtq12Q510
 4PaPWgUjbpILGeAVceIYTaBMQwN0NynDdNwQ+JgN7EfJUY2RNVP367xkul16udUBsKsE
 kyQqJ9jc4a1oSnk42747cI/aN6A6pqlyOCHVhpjbQekbPKSSXrzK4tniUNnm8GPTF0qH
 9032oRFNMieAwIbv4sTyl4wxxC3gQjbFkhA2uBGHzoDvSDOd8UTZG9jUw7vIoXKKBeFQ
 jCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699622856; x=1700227656;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsqp6QDbnl+BZbpxh5DVbVgFfmrykVj8TNvlrU1xFaA=;
 b=N1H6WZ3PWkuHWtnrnOSxGVq9ZWiab7fjT3aljvlb17uGmnL8xGxFHfBv4xQsijAje+
 67v1S+gvm1y2QMASTYmRNa7cFiiMbLExoX/Ww8J3HC8JdgjNSRoYUbMokjzg6EoMBOo/
 YGEaqDP3jIw8ieBxD9vMtVz+Eaaxge2L2XYkmzT4RdOsQ7rqoBKL10UrteAatJC90mXG
 WwDSf7rlU7FOrpANYVuVoLmBmIe3mM59AzXJTO+Ya4Yyje/Zzv/xRYye5PYYFMgZ52Vt
 JPd/Zu9/lxsgZDkZDGzRX31qgVXk0dvHlYqe5xWNVXjT1KCscOV536saTXf8BdkzxLJm
 pU0Q==
X-Gm-Message-State: AOJu0YyBokaeAmfljZ06j62MwjPQ5lX7TlBvrWfdXYxrK+aJIQgrbTvC
 +0IIOEFUBnUUauvo1jNid/Y=
X-Google-Smtp-Source: AGHT+IE8uxeTTWa9kYakpqn1dNmkRGUSZ7dpOLgaZ5twLObPycuuYk28u4U0cPaG//mzm5e+qQGXQw==
X-Received: by 2002:a2e:8084:0:b0:2c6:ef19:4658 with SMTP id
 i4-20020a2e8084000000b002c6ef194658mr6987888ljg.48.1699622855595; 
 Fri, 10 Nov 2023 05:27:35 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 bi12-20020a05651c230c00b002c6f50d277esm277983ljb.135.2023.11.10.05.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 05:27:35 -0800 (PST)
Date: Fri, 10 Nov 2023 15:27:18 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231110152718.7ed30873@eldfell>
In-Reply-To: <CY5PR11MB63440D53FA45D3E5419279C7F4AEA@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <CY5PR11MB6344A6C878FBAF5E66EFCE1CF4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
 <69ff5fd4-3c19-469c-bdcc-8fe54d681904@froggi.es>
 <CY5PR11MB6344784A745F5BB2032D2B3CF4AFA@CY5PR11MB6344.namprd11.prod.outlook.com>
 <20231109135552.1e93ab62@eldfell>
 <CY5PR11MB63440D53FA45D3E5419279C7F4AEA@CY5PR11MB6344.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aj3VCmtkRMxi10e9sd68p=+";
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aj3VCmtkRMxi10e9sd68p=+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Nov 2023 11:27:14 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <ppaalanen@gmail.com>
> > Sent: Thursday, November 9, 2023 5:26 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: Joshua Ashton <joshua@froggi.es>; Harry Wentland
> > <harry.wentland@amd.com>; dri-devel@lists.freedesktop.org; Sebastian Wi=
ck
> > <sebastian.wick@redhat.com>; Sasha McIntosh <sashamcintosh@google.com>;
> > Abhinav Kumar <quic_abhinavk@quicinc.com>; Shashank Sharma
> > <shashank.sharma@amd.com>; Xaver Hugl <xaver.hugl@gmail.com>; Hector
> > Martin <marcan@marcan.st>; Liviu Dudau <Liviu.Dudau@arm.com>; Alexander
> > Goins <agoins@nvidia.com>; Michel D=C3=A4nzer <mdaenzer@redhat.com>; wa=
yland-
> > devel@lists.freedesktop.org; Melissa Wen <mwen@igalia.com>; Jonas =C3=
=85dahl
> > <jadahl@redhat.com>; Arthur Grillo <arthurgrillo@riseup.net>; Victoria
> > Brekenfeld <victoria@system76.com>; Sima <daniel@ffwll.ch>; Aleix Pol
> > <aleixpol@kde.org>; Naseer Ahmed <quic_naseer@quicinc.com>; Christopher
> > Braga <quic_cbraga@quicinc.com>; Ville Syrjala <ville.syrjala@linux.int=
el.com>
> > Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptiv=
e color
> > pipeline is needed
> >=20
> > On Thu, 9 Nov 2023 10:17:11 +0000
> > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: Joshua Ashton <joshua@froggi.es>
> > > > Sent: Wednesday, November 8, 2023 7:13 PM
> > > > To: Shankar, Uma <uma.shankar@intel.com>; Harry Wentland
> > > > <harry.wentland@amd.com>; dri-devel@lists.freedesktop.org =20
> >=20
> > ...
> >  =20
> > > > Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why
> > > > prescriptive color pipeline is needed
> > > >
> > > >
> > > >
> > > > On 11/8/23 12:18, Shankar, Uma wrote: =20
> > > > >
> > > > > =20
> > > > >> -----Original Message-----
> > > > >> From: Harry Wentland <harry.wentland@amd.com>
> > > > >> Sent: Friday, October 20, 2023 2:51 AM
> > > > >> To: dri-devel@lists.freedesktop.org =20
> >=20
> > ...
> >  =20
> > > > >> Subject: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why
> > > > >> prescriptive color pipeline is needed =20
> >=20
> > ...
> >  =20
> > > > >> +An example of a drm_colorop object might look like one of these=
::
> > > > >> +
> > > > >> +    /* 1D enumerated curve */
> > > > >> +    Color operation 42
> > > > >> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated cu=
rve, 1D LUT, 3x3
> > > > >> + matrix, 3x4
> > > > >> matrix, 3D LUT, etc.} =3D 1D enumerated curve
> > > > >> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> > > > >> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB i=
nverse EOTF, PQ
> > > > >> + EOTF, PQ
> > > > >> inverse EOTF, =E2=80=A6} =20
> > > > >
> > > > > Having the fixed function enum for some targeted input/output may
> > > > > not be scalable for all usecases. There are multiple colorspaces
> > > > > and transfer functions possible, so it will not be possible to
> > > > > cover all these by any enum definitions. Also, this will depend on
> > > > > the capabilities of =20
> > > > respective hardware from various vendors.
> > > >
> > > > The reason this exists is such that certain HW vendors such as AMD
> > > > have transfer functions implemented in HW. It is important to take
> > > > advantage of these for both precision and power reasons. =20
> > >
> > > Issue we see here is that, it will be too usecase and vendor specific.
> > > There will be BT601, BT709, BT2020, SRGB, HDR EOTF and many more. Not
> > > to forget we will need linearization and non-linearization enums for =
each of =20
> > these.
> >=20
> > I don't see that as a problem at all. It's not a combinatorial explosio=
n like
> > input/output combinations in a single enum would be.
> > It's always a curve and its inverse at most.
> >=20
> > It's KMS properties, not every driver needs to implement every defined =
enum
> > value but only those values it can and wants to support.
> > Userspace also sees the supported list, it does not need trial and erro=
r.
> >=20
> > This is the only way to actually use hard-wired curves. The alternative=
 would be
> > for userspace to submit a LUT of some type, and the driver needs to sta=
rt
> > guessing if it matches one of the hard-wired curves the hardware suppor=
ts, which
> > is just not feasible.
> >=20
> > Hard-wired curves are an addition, not a replacement, to custom curves =
defined
> > by parameters or various different LUT representations.
> > Many of these hard-wired curves will emerge as is from common use cases=
. =20
>=20
> Point taken, we can go with this fixed function curve types as long as it=
 represents a
> single mathematical operation, thereby avoiding the combination nightmare.
>=20
> However, just want to make sure that the same thing can be done with a pr=
ogrammable
> hardware. In the case above, lut tables for the same need to be hardcoded=
 in driver for
> various platforms (depending on its capabilities, precision, number, and =
distribution of luts etc).

Hi Uma,

you can do that if you want to.

> This is manageable, but driver will get bloated with all kinds of hardcod=
ed lut tables,
> which could have been easily computed by the compositor runtime. Driver c=
annot compute
> the tables runtime due to the complexity of the floating math involved, s=
o hardcoded
> lut tables will be the only option.=20

You do not have to do that if you don't want to.

> So we should just ensure that if these enums are not exposed by a driver,=
 but a programmable
> lut block is exposed instead, userspace should fall back to the programma=
ble lut. Having the
> fixed function enum should not become a mandatory norm to implement and e=
xpose even for a
> programmable hardware.

I agree.

> With this we will be able to cater to both kinds of hardware with a gener=
ic userspace.
> Hope this expectation is ok.
>=20
> > > Also
> > > a CTM indication to convert colospace. =20
> >=20
> > Did someone propose to enumerate matrices? I would not do that, unless =
you
> > literally have hard-wired matrices in hardware and cannot do custom mat=
rices. =20
>=20
> Not currently, but there can be fixed function matrix for certain color s=
pace or
> format conversion like BT709->BT2020 etc..
> However, we see this is not proposed currently and if not needed, it's fi=
ne and
> don't want to bring another non-problem for discussion.
>=20
> > > Also, if the underlying hardware block is programmable, its not
> > > limited to be used only for the colorspace management but can be used
> > > for other color enhancements as well by a capable client. =20
> >=20
> > Yes, that's why we have other types for curves, the programmable ones. =
=20
>=20
> Got that and agree, it's fine as mentioned above.
>=20
> > > Hence, we feel that it is bordering on being descriptive with too many
> > > possible combinations (not easy to generalize). So, if hardware is
> > > programmable, lets expose its capability through a blob and be generi=
c. =20
> >=20
> > It's not descriptive though. It's a prescription of a mathematical func=
tion the
> > hardware implements as fixed-function hardware. The function is a curve=
. There
> > is no implication that the curve must be used with specific input or ou=
tput color
> > spaces. =20
>=20
> As long as we don=E2=80=99t mix combinations it should be fine. But all h=
ardware's may not
> represent these fixed functions with single mathematical operation level =
granularity.
> It would be tough to represent such color blocks with a single enum.

If a colorop does not fit for some hardware, then the driver should
not expose that colorop or pipeline.

> > > For any fixed function hardware where Lut etc is stored in ROM and
> > > just a control/enable bit is provided to driver, we can define a
> > > pipeline with a vendor specific color block. This can be identified w=
ith a flag =20
> > (better ways can be discussed).
> >=20
> > No, there is no need for that. A curve type will do well. =20
>=20
> Agree and aligned here.
>=20
> > A vendor specific colorop needs vendor specific userspace code to progr=
am *at
> > all*. A generic curve colorop might list some curve types the userspace=
 does not
> > understand, but also curve types userspace does understand. The underst=
ood
> > curve types can still be used by userspace. =20
>=20
> Issue is with combination operation in hardware. If it=E2=80=99s a single=
 mathematical operation,
> it would be easy.
>=20
> > > For example, on some of the Intel platform, we had a fixed function to
> > > convert colorspaces directly with a bit setting. These kinds of things
> > > should be vendor specific and not be part of generic userspace implem=
entation. =20
> >=20
> > Why would you forbid generic userspace from making use of them? =20
>=20
> Issue is that it was not one single mathematical operation but a combinat=
ion
> as described below.
> =20
> > > For reference:
> > > 001b	YUV601 to RGB601 YUV BT.601 to RGB BT.601 conversion.
> > > 010b	YUV709 to RGB709 YUV BT.709 to RGB BT.709 conversion.
> > > 011b	YUV2020 to RGB2020 YUV BT.2020 to RGB BT.2020 conversion.
> > > 100b	RGB709 to RGB2020 RGB BT.709 to RGB BT.2020 conversion. =20
> >=20
> > This is nothing like the curves we talked about above.
> > Anyway, you can expose these fixed-function operations with a colorop t=
hat has
> > an enum choosing the conversion. There is no need to make it vendor-spe=
cific at
> > all. It's possible that only specific chips from Intel support it, but =
nothing stops
> > anyone else from implementing or emulating the colorop if they can cons=
truct a
> > hardware configuration achieving the same result.
> >=20
> > It seems there are already problems in exploding the number of pipeline=
s to
> > expose, so it's best to try to avoid single-use colorops and use enums =
in more
> > generic colorops instead. =20
>=20
> Yeah, this is how hardware will implement and it involves multiple mathem=
atical operations,
> controlled with one programmable bit to enable the same. These will be to=
ugh to generalize.
> What should be the type of color op for these would be an open.
>=20
> It would be great if we can address this generically.

We would need to know what those four things actually do. Your
description is very vague. Are there curves involved?


> > > > Additionally, not every vendor implements bucketed/segemented LUTs
> > > > the same way, so it's not feasible to expose that in a way that's
> > > > particularly useful or not vendor-specific. =20
> >=20
> > Joshua, I see no problem here really. They are just another type of LUT=
 for a curve
> > colorop, with a different configuration blob that can be defined in the=
 UAPI. =20
>=20
> Yeah, agree.
> And the programmable hardware can be easily exposed and generalize for al=
l vendors,
> so it should not be a concern.
>=20
> > > If the underlying hardware is programmable, the structure which we
> > > propose to advertise the capability of the block to userspace will be=
 sufficient to =20
> > compute the LUT coefficients. =20
> > > The caps can be :
> > > 1. Number of segments in Lut
> > > 2. Precision of lut
> > > 3. Starting and ending point of the segment 4. Number of samples in
> > > the segment.
> > > 5. Any other flag which could be useful in this computation.
> > >
> > > This way we can compute LUT's generically and send to driver. This
> > > will be scalable for all colorspaces, configurations and vendors. =20
> >=20
> > Drop the mention of colorspaces, and I hope so. :-)
> >=20
> > Color spaces don't quite exist in a prescriptive pipeline definition. =
=20
>=20
> Yeah. For driver it's just a LUT for programmable hardware, OR mathematic=
al
> operation for fixed function hardware defined via enum =F0=9F=98=8A
>=20
> > > > Thus we decided to have a regular 1D LUT modulated onto a known cur=
ve.
> > > > This is the only real cross-vendor solution here that allows HW
> > > > curve implementations to be taken advantage of and also works with
> > > > bucketing/segemented LUTs.
> > > > (Including vendors we are not aware of yet).
> > > >
> > > > This also means that vendors that only support HW curves at some
> > > > stages without an actual LUT are also serviced. =20
> > >
> > > Any fixed function vendor implementation should be supported but with
> > > a vendor specific color block. Trying to come up with enums which
> > > aligns with some underlying hardware may not be scalable. =20
> >=20
> > I disagree with both of you.
> >=20
> > Who said there could be only one "degamma" block on a plane's pipeline?
> >=20
> > If hardware is best modelled as a fixed-function selectable curve follo=
wed by a
> > custom curve, then expose exactly those two generic colorops. Nothing s=
tops a
> > pipeline from having two curve colorops in sequence with a disjoint set=
 of
> > supported types or features. If some hardware does not have one of the =
curve
> > colorops, then just don't add the missing one in a pipeline. =20
>=20
> Agree, I think we are aligned now here.

Awesome!

Thanks,
pq


> > > > You are right that there *might* be some usecase not covered by this
> > > > right now, and that it would need kernel churn to implement new
> > > > curves, but unfortunately that's the compromise that we (so-far)
> > > > have decided on in order to ensure everyone can have good, precise,=
 power- =20
> > efficient support. =20
> > >
> > > Yes, we are aligned on this. But believe programmable hardware should
> > > be able to expose its caps. Fixed function hardware should be non-gen=
eric and =20
> > vendor specific. =20
> > > =20
> > > > It is always possible for us to extend the uAPI at a later date for
> > > > other curves, or other properties that might expose a generic
> > > > segmented LUT interface (such as what you have proposed for a while=
) for =20
> > vendors that can support it. =20
> > > > (With the whole color pipeline thing, we can essentially do 'versio=
ning'
> > > > with that, if we wanted a new 1D LUT type.) =20
> > >
> > > Most of the hardware vendors have programmable luts (including AMD),
> > > so it would be good to have this as a default generic compositor
> > > implementation. And yes, any new color block with a type can be added
> > > to the existing API's as the need arises without breaking compatibili=
ty.
> > >
> > > Regards,
> > > Uma Shankar
> > > =20
> > > >
> > > > Thanks!
> > > > - Joshie =F0=9F=90=B8=E2=9C=A8 =20


--Sig_/aj3VCmtkRMxi10e9sd68p=+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVOL7YACgkQI1/ltBGq
qqdmLQ/+NWSdWYkKhaoVOXf/7jqt3j+jBxw/0gG9sWpnZeawhhttUwaHoWbvm7WM
1+VdlsEbdI5TUR3NLId+Lzyj+8cFAY3Lv4B5RHjq9/MVW3gnzff3tGuj/0Jts5Bb
OCn09iJWDVn8pKQm5o/o3wVIx9oluV1dNoMHptXQK886Tk4Yuse0UXkwdc3sTT95
ZDazmGh+zz+nS1u+EhB5P1bQHoQJ3R1aFUhh7NO9i3Vl3DnpAeRR5PnOzrKulNaI
SXivvk2kGezdUaRyMHyWGxpa7F14tnXCjsV3sJZ274DA2b7WrBpbuIL/w45a00hV
tEwP7hqc1cGF9HhDhAZ5VPuiMdAfDpkh3eONCFwFhVMIuf5Mp9+6i1BHcfOuv+eD
SXhDJWAuiIOEh5OmaBnPGrqt8VZrg1nVwPrfMHBtY10KEx48LMLHbPS551vblRHA
lYfGCYzWYmy5AHiSvceJBvjiEZ5TUrL4sooOwp/Qo6QTs/jXyiCos690Td5EF7iI
kkvxx3ECHQxSYqZdOh1M6QCo19XlkOfmkVgeuWK0jlXY82/ZB1XZv9TXmtMbzP09
C0U2YYf3p1CllFVnFxEFOhreHMtM7X3n/fROTT0dPtV0lkvOth7SWUFeeEORsyWl
/1v28P9gcxU5hjcQmkWIxB9BWjjLb/wxpQo2YUyRFgx0Lcnl6Cc=
=eeSH
-----END PGP SIGNATURE-----

--Sig_/aj3VCmtkRMxi10e9sd68p=+--
