Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A67E69F6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 12:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3434710E8B3;
	Thu,  9 Nov 2023 11:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5462410E8AE;
 Thu,  9 Nov 2023 11:56:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507a98517f3so921024e87.0; 
 Thu, 09 Nov 2023 03:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699530965; x=1700135765; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tpwt0SatMItV6HwNHF+yFHK2o4z+Cl6ZCBQyXttShr8=;
 b=JzZF9Me6nYvIC7FocUYjMV6VbK9c3C238OlQPDp6ZCGFaLH3t09xkVB/a6e5msTjzd
 LQ6H1A6cquffmKMCTsUvLxjQ/vlXG1KsQkZnpQSCWaQ1/i2QQVXkWL+BNizvwKNdGLXS
 OgD5Is617X5M8qJH3BK8A9L8wMCT4tieNkEqMVKvzV6iuQPKc6S0VjAOMDnza3L+GrZn
 jpzDFnA3ICuBKGpZkigxok/jBKdP8Si2lzEZp6cR/NitlKoPEhbJKUtS3aAW8EsRFARk
 KS5SDZBpFC2JPBb/jxpbU5Ycpbkjcn/tjzOyx3ckbhQQl5BfQfDKht/SZTFpqQO/ktcv
 D34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699530965; x=1700135765;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tpwt0SatMItV6HwNHF+yFHK2o4z+Cl6ZCBQyXttShr8=;
 b=PhVqnyqjbtYZixeFJiEqn0dmfBUttwlDYukKYDZblzLv9pLEbUT+oxXY3QAqjVZWJW
 w70HmKfMPSImBaQp2Rf3ll57PkRjMCddSCL2DbuLuJMaRgodHmsG04iKQyqt9Vz6dOb4
 2N/VjiAAj77/BD3mod528Y7lUVBP98593C6P9HlE6yFPb5zht1SH26lMp+EOV3lj1oDS
 QRhfF/tVWAjk9uBZCXEwkGCW8rCiMMu7VJV8p6roxiMML4B5Uy8WWzP/1NPMcQov7ow0
 dHwup6wLLo7cntcs/Yapf+MRqdbT+v3MYtpwSXk5rPOfBEmLcM/aauUqSJST/UzUIOQt
 aVtg==
X-Gm-Message-State: AOJu0YyDAYfEkuYiHZT+mx7fx0VmZp2z9wX9zazcs4b5yQ++2jBtjZZi
 HXxbPjJA8OOu1g3yz91t6+s=
X-Google-Smtp-Source: AGHT+IF8zuMDgZ38t0Y/GMoeIqW86BJPiAgqAkFG8pTkfBSA8z5UZVFxVhzcQ5wJCYAskQ6OaBx42g==
X-Received: by 2002:a05:6512:11c9:b0:500:9dd4:2969 with SMTP id
 h9-20020a05651211c900b005009dd42969mr1019815lfr.59.1699530964980; 
 Thu, 09 Nov 2023 03:56:04 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b0050097974ee0sm1035749lfp.224.2023.11.09.03.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 03:56:04 -0800 (PST)
Date: Thu, 9 Nov 2023 13:55:52 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231109135552.1e93ab62@eldfell>
In-Reply-To: <CY5PR11MB6344784A745F5BB2032D2B3CF4AFA@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <CY5PR11MB6344A6C878FBAF5E66EFCE1CF4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
 <69ff5fd4-3c19-469c-bdcc-8fe54d681904@froggi.es>
 <CY5PR11MB6344784A745F5BB2032D2B3CF4AFA@CY5PR11MB6344.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S1JpCo4vQZkwE9_Ol+DN3TE";
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

--Sig_/S1JpCo4vQZkwE9_Ol+DN3TE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Nov 2023 10:17:11 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Joshua Ashton <joshua@froggi.es>
> > Sent: Wednesday, November 8, 2023 7:13 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; Harry Wentland
> > <harry.wentland@amd.com>; dri-devel@lists.freedesktop.org

...

> > Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptiv=
e color
> > pipeline is needed
> >=20
> >=20
> >=20
> > On 11/8/23 12:18, Shankar, Uma wrote: =20
> > >
> > > =20
> > >> -----Original Message-----
> > >> From: Harry Wentland <harry.wentland@amd.com>
> > >> Sent: Friday, October 20, 2023 2:51 AM
> > >> To: dri-devel@lists.freedesktop.org

...

> > >> Subject: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
> > >> color pipeline is needed

...

> > >> +An example of a drm_colorop object might look like one of these::
> > >> +
> > >> +    /* 1D enumerated curve */
> > >> +    Color operation 42
> > >> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve,=
 1D LUT, 3x3
> > >> + matrix, 3x4
> > >> matrix, 3D LUT, etc.} =3D 1D enumerated curve
> > >> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> > >> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inver=
se EOTF, PQ EOTF,
> > >> + PQ
> > >> inverse EOTF, =E2=80=A6} =20
> > >
> > > Having the fixed function enum for some targeted input/output may not
> > > be scalable for all usecases. There are multiple colorspaces and
> > > transfer functions possible, so it will not be possible to cover all
> > > these by any enum definitions. Also, this will depend on the capabili=
ties of =20
> > respective hardware from various vendors.
> >=20
> > The reason this exists is such that certain HW vendors such as AMD have=
 transfer
> > functions implemented in HW. It is important to take advantage of these=
 for both
> > precision and power reasons. =20
>=20
> Issue we see here is that, it will be too usecase and vendor specific.
> There will be BT601, BT709, BT2020, SRGB, HDR EOTF and many more. Not to =
forget
> we will need linearization and non-linearization enums for each of these.

I don't see that as a problem at all. It's not a combinatorial
explosion like input/output combinations in a single enum would be.
It's always a curve and its inverse at most.

It's KMS properties, not every driver needs to implement every
defined enum value but only those values it can and wants to support.
Userspace also sees the supported list, it does not need trial and
error.

This is the only way to actually use hard-wired curves. The
alternative would be for userspace to submit a LUT of some type, and
the driver needs to start guessing if it matches one of the hard-wired
curves the hardware supports, which is just not feasible.

Hard-wired curves are an addition, not a replacement, to custom
curves defined by parameters or various different LUT representations.
Many of these hard-wired curves will emerge as is from common use cases.

> Also=20
> a CTM indication to convert colospace.

Did someone propose to enumerate matrices? I would not do that, unless
you literally have hard-wired matrices in hardware and cannot do custom
matrices.

> Also, if the underlying hardware block is=20
> programmable, its not limited to be used only for the colorspace manageme=
nt but
> can be used for other color enhancements as well by a capable client.

Yes, that's why we have other types for curves, the programmable ones.

> Hence, we feel that it is bordering on being descriptive with too many po=
ssible
> combinations (not easy to generalize). So, if hardware is programmable, l=
ets
> expose its capability through a blob and be generic.

It's not descriptive though. It's a prescription of a mathematical
function the hardware implements as fixed-function hardware. The
function is a curve. There is no implication that the curve must be
used with specific input or output color spaces.

> For any fixed function hardware where Lut etc is stored in ROM and just a=
 control/enable
> bit is provided to driver, we can define a pipeline with a vendor specifi=
c color block. This
> can be identified with a flag (better ways can be discussed).=20

No, there is no need for that. A curve type will do well.

A vendor specific colorop needs vendor specific userspace code to
program *at all*. A generic curve colorop might list some curve types
the userspace does not understand, but also curve types userspace does
understand. The understood curve types can still be used by userspace.

> For example, on some of the Intel platform, we had a fixed function to co=
nvert colorspaces
> directly with a bit setting. These kinds of things should be vendor speci=
fic and not be part
> of generic userspace implementation.

Why would you forbid generic userspace from making use of them?

> For reference:
> 001b	YUV601 to RGB601 YUV BT.601 to RGB BT.601 conversion.
> 010b	YUV709 to RGB709 YUV BT.709 to RGB BT.709 conversion.
> 011b	YUV2020 to RGB2020 YUV BT.2020 to RGB BT.2020 conversion.
> 100b	RGB709 to RGB2020 RGB BT.709 to RGB BT.2020 conversion.

This is nothing like the curves we talked about above.

Anyway, you can expose these fixed-function operations with a colorop
that has an enum choosing the conversion. There is no need to make it
vendor-specific at all. It's possible that only specific chips from
Intel support it, but nothing stops anyone else from implementing or
emulating the colorop if they can construct a hardware configuration
achieving the same result.

It seems there are already problems in exploding the number of
pipelines to expose, so it's best to try to avoid single-use colorops
and use enums in more generic colorops instead.

>=20
> > Additionally, not every vendor implements bucketed/segemented LUTs the =
same
> > way, so it's not feasible to expose that in a way that's particularly u=
seful or not
> > vendor-specific. =20

Joshua, I see no problem here really. They are just another type of LUT
for a curve colorop, with a different configuration blob that can be
defined in the UAPI.

> If the underlying hardware is programmable, the structure which we propos=
e to advertise
> the capability of the block to userspace will be sufficient to compute th=
e LUT coefficients.
> The caps can be :
> 1. Number of segments in Lut
> 2. Precision of lut
> 3. Starting and ending point of the segment
> 4. Number of samples in the segment.
> 5. Any other flag which could be useful in this computation.
>=20
> This way we can compute LUT's generically and send to driver. This will b=
e scalable for all
> colorspaces, configurations and vendors.

Drop the mention of colorspaces, and I hope so. :-)

Color spaces don't quite exist in a prescriptive pipeline definition.

> > Thus we decided to have a regular 1D LUT modulated onto a known curve.
> > This is the only real cross-vendor solution here that allows HW curve
> > implementations to be taken advantage of and also works with
> > bucketing/segemented LUTs.
> > (Including vendors we are not aware of yet).
> >=20
> > This also means that vendors that only support HW curves at some stages=
 without
> > an actual LUT are also serviced. =20
>=20
> Any fixed function vendor implementation should be supported but with a v=
endor
> specific color block. Trying to come up with enums which aligns with some=
 underlying
> hardware may not be scalable.

I disagree with both of you.

Who said there could be only one "degamma" block on a plane's pipeline?

If hardware is best modelled as a fixed-function selectable curve
followed by a custom curve, then expose exactly those two generic
colorops. Nothing stops a pipeline from having two curve colorops in
sequence with a disjoint set of supported types or features. If some
hardware does not have one of the curve colorops, then just don't add
the missing one in a pipeline.


Thanks,
pq

> > You are right that there *might* be some usecase not covered by this ri=
ght now,
> > and that it would need kernel churn to implement new curves, but unfort=
unately
> > that's the compromise that we (so-far) have decided on in order to ensu=
re
> > everyone can have good, precise, power-efficient support. =20
>=20
> Yes, we are aligned on this. But believe programmable hardware should be =
able to
> expose its caps. Fixed function hardware should be non-generic and vendor=
 specific.
>=20
> > It is always possible for us to extend the uAPI at a later date for oth=
er curves, or
> > other properties that might expose a generic segmented LUT interface (s=
uch as
> > what you have proposed for a while) for vendors that can support it.
> > (With the whole color pipeline thing, we can essentially do 'versioning'
> > with that, if we wanted a new 1D LUT type.) =20
>=20
> Most of the hardware vendors have programmable luts (including AMD), so i=
t would be
> good to have this as a default generic compositor implementation. And yes=
, any new color
> block with a type can be added to the existing API's as the need arises w=
ithout breaking
> compatibility.
>=20
> Regards,
> Uma Shankar
>=20
> >=20
> > Thanks!
> > - Joshie =F0=9F=90=B8=E2=9C=A8

--Sig_/S1JpCo4vQZkwE9_Ol+DN3TE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVMyMgACgkQI1/ltBGq
qqf/NRAApiIbGPlQLl1Gg3ORYBkj9JU2Kh+INjEHUwtqHxZlFDyQfcXewvnNmJiy
umckOf1Z+m2dkA8FZNfip/8OOxeehz6Mzb7Yi4gfasL3AtltKUzWi4gnplEZQS+d
Sy6ixxQXHjiye3aj0z71qSmqf0l49hO8RMIBOSElnvQWoZ86TrdmhkXtrtMFk519
mdI2F0vayvzViOKdDteYtfNbeK4ImzYhhGrSPRtdQYM2qYqIQbjTlljsA+CCocP9
ub2EUKy/6BiZidgppEVx1RmwFKS0gyRvKcEEpXggnrwW45tLab7IE030+4RybHec
JS2yeO+3IqlFXTy7gCjrnDV+FCCEUpZeFNMQVykUcJlgDNibx5KcniVWodVt4t2o
0U/OoS/dKMifMZh0fKCDrTcq1iS7DTjgJovT4Y2D0RLidvA+0s3lfHJH7ceH+CLq
c1e3WNiHcsigkghWDW3aNKZGAiLFOiFj0Tu7dtQMcoTei+WMCmdZcXaTn8NZvq0n
VGRpXYGurD7i/ogaobyGADpab3Q+K78lvuhEL/6fmHMstSN5zfn08v8KGSXMHBJX
78aRHNHqKzTHLwmluCoPZydnQg2Q9PFucGEu1/xBrmLuaxtdtKM8nNiRR0bhv6NP
ZT2294SiW0Q2KohLXGBJAYUjUrXRmhmZG2/gYtjhvwVGFPRdZc8=
=Kjcw
-----END PGP SIGNATURE-----

--Sig_/S1JpCo4vQZkwE9_Ol+DN3TE--
