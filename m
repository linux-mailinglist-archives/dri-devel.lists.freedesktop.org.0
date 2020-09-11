Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF7265FE7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 14:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7506E22C;
	Fri, 11 Sep 2020 12:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D9A6E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 12:57:59 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b22so2176221lfs.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=uVYtvG8ZxmOx10xgoCayeiiHJnIXebIhBgxM2nYHNJs=;
 b=njSjwtgbJcrgt9seprnHfENtpi5Ac4vRNGhGYKidMqg1EX24UDyVQpH/kdqPzqiYYX
 8EHSzR6xYCf0U4gAPn4nteB+DL0/ZWCrZOCPZcxuIoCpnnQxfFdKEmNzV2NFJoY+/ibw
 VNptyWwSBpzkpL9DQH/M3YvN0odi8cqHFCTKDKe2jlS7n9qlgOnHteEFIYIWdg1Kn92E
 +sgZYXuNaoltUQ1wqokSjrceoSFIiHVOVMy6UdDuy8OMa4iqvBxYWPUHulNru5dJIn8A
 2MgKYwJmi4SurTLFJdgvLXMRo4jZ9JZuUs9cZJozJ1Rxe2QIaaw8/dZcxupLkwpOBVEB
 tVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=uVYtvG8ZxmOx10xgoCayeiiHJnIXebIhBgxM2nYHNJs=;
 b=LbVOOy+GAHojzEJuPRFIUmDYdtCt99etQL/uLs77QiOww1lQtWAMnGw+Pple1SDGJS
 C9zF7iBSEIT2KZ/nYQzDCotYZq2D7bkDB2iMzESS6tX8KM+TnoplDtFJZWZ4T3pUa67D
 jfy/mzCSNZu0G/jNM4VtvTnUm7G5mAVn2gFF0x26qlo83dcPR5IsMgposgOnVk3rFM4q
 s1Xm6N3Xb1ocBHULTkBEeZRXbdV7HwXz2YnjccwQYfbhKsFgiqEEAHRdIRDWH5z1yy3d
 7V4PXot6jJHmh5OHs872u9Cpw7/gNkPiAcSWqBuV7c1Ea7eGiJHOz5LSkfp7wXxohfbJ
 s0bQ==
X-Gm-Message-State: AOAM530JUqllIL4TB9Z/HzzUuamFgWHq9Y3+x1i1ZRsLu7nnaRMUYRd4
 AWlM0sm1Mlsi9mWy18okF4Q=
X-Google-Smtp-Source: ABdhPJy4si5eGjNDVrsgcmlzPt0HiIiugJ8+6Ov5iRx9egoKb05LH6WzapG9RVcj0CCcr3gpO8Z7NA==
X-Received: by 2002:ac2:4559:: with SMTP id j25mr243152lfm.484.1599829078139; 
 Fri, 11 Sep 2020 05:57:58 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id b8sm68665lfq.144.2020.09.11.05.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 05:57:57 -0700 (PDT)
Date: Fri, 11 Sep 2020 15:57:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200911155744.5c63fb5f@ferris.localdomain>
In-Reply-To: <00ed1099-fbcb-6bd7-79a4-7b2890c78aa3@amd.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
 <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
 <20200910132803.14dc028d@eldfell>
 <20200910105618.GE3940@pendragon.ideasonboard.com>
 <5f39e5ee-bf2b-e4dc-7584-7e6cd4c5b104@amd.com>
 <20200910175113.GG3940@pendragon.ideasonboard.com>
 <536023f7-e5c1-d1fa-fd4f-e2378f1077e2@amd.com>
 <00ed1099-fbcb-6bd7-79a4-7b2890c78aa3@amd.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0906172810=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0906172810==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qXmZAoxE/QUq/7WxnDjKcxw"; protocol="application/pgp-signature"

--Sig_/qXmZAoxE/QUq/7WxnDjKcxw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2020 15:39:07 -0400
Vitaly Prosyak <vitaly.prosyak@amd.com> wrote:

> On 2020-09-10 2:07 p.m., Vitaly Prosyak wrote:
> >
> >
> > On 2020-09-10 1:51 p.m., Laurent Pinchart wrote: =20
> >> Hi Vitaly,
> >>
> >> On Thu, Sep 10, 2020 at 01:09:03PM -0400, Vitaly Prosyak wrote: =20
> >>> On 2020-09-10 6:56 a.m., Laurent Pinchart wrote: =20
> >>>> On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote: =20
> >>>>> On Thu, 10 Sep 2020 12:30:09 +0300 Laurentiu Palcu wrote: =20
> >>>>>> On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote: =20
> >>>>>>> On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote: =20
> >>>>>>>> On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote: =
=20
> >>>>>>>>> On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
> >>>>>>>>>        =20
> >>>>>>>>>> Hi all,
> >>>>>>>>>>
> >>>>>>>>>> I was wondering whether you could give me an advise on how to =
proceed further
> >>>>>>>>>> with the following issue as I'm preparing to upstream the next=
 set of patches
> >>>>>>>>>> for the iMX8MQ display controller(DCSS). The display controlle=
r has 3 planes,
> >>>>>>>>>> each with 2 CSCs and one degamma LUT. The CSCs are in front an=
d after the LUT
> >>>>>>>>>> respectively. Then the output from those 3 pipes is blended to=
gether and then
> >>>>>>>>>> gamma correction is applied using a linear-to-nonlinear LUT an=
d another CSC, if
> >>>>>>>>>> needed. =20
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> hmm, so FB -> CSC -> LUT -> CSC -> blending?
> >>>>>>>
> >>>>>>> Is it then
> >>>>>>> 	blending -> LUT -> CSC -> encoder
> >>>>>>> or
> >>>>>>> 	blending -> CSC -> LUT -> encoder? =20
> >>>>>> The DCSS pipeline topology is this:
> >>>>>>
> >>>>>> FB1->CSC_A->LUT->CSC_B-\
> >>>>>> FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
> >>>>>> FB3->CSC_A->LUT->CSC_B-/
> >>>>>>
> >>>>>> Basically, CSC_A is used to convert to a common colorspace if need=
ed
> >>>>>> (YUV->RGB) as well as to perform pixel range conversions: limited-=
>full.
> >>>>>> CSC_B is for gamut conversions(like 709->2020). The CSC_O is used =
to
> >>>>>> convert to the colorspace used by the output (like RGB->YUV). =20
> >>>>> I didn't realize that it would be correct to do RGB-YUV conversion =
in
> >>>>> non-linear space, but yeah, that's what most software do too I gues=
s.
> >>>>> =20
> >>>>>>> Are all these LUTs per-channel 1D LUTs or something else? =20
> >>>>>> LUTs are 3D, per pixel component. =20
> >>>>> Sorry, which one?
> >>>>>
> >>>>> An example of a 3D LUT is 32x32x32 entries with each entry being a
> >>>>> triplet, while a 1D LUT could be 1024 entries with each entry being=
 a
> >>>>> scalar. 1D LUTs are used per-channel so you need three of them, 3D =
LUTs
> >>>>> you need just one for the color value triplet mapping.
> >>>>>
> >>>>> A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do t=
he
> >>>>> channel mixing that a CTM can.
> >>>>>
> >>>>> So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
> >>>>> blocks exist... =20
> >>>> Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT =
in
> >>>> R-Car), having a separate CSC can give more precision (as well as
> >>>> allowing the two problems to be decoupled, at a relatively low hardw=
are
> >>>> cost). =20
> >>> If you put nonlinear signal to 3DLUT then your
> >>> precision would be improved.
> >>> How many bits each color value has in 3DLUT ? =20
> >> The whole display pipeline uses 8 bits per component. =20
> > It is pretty low , please, use always nonlinear signal in the pipe and =
it allows you to compress and 'win' about 2 bits. =20

The DRM driver is not in control of that, though. Userspace controls it
through what values it happens to upload to the LUTs and matrices.

This raises a good point: userspace must be aware of both LUT
size and precision to decide if and how to use it.

> Do you have alpha and de-alpha blocks in your pipeline?
> You can do CSC and blending in nonlinear mode, it is less accurate than i=
n linear, but it is viable way.

It may be viable in some cases and not others. That too is a userspace
decision.

> Also alpha should be removed (if it is applied) before CSC.

Right.


Thanks,
pq

--Sig_/qXmZAoxE/QUq/7WxnDjKcxw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9bdEgACgkQI1/ltBGq
qqcFXxAAmETVYqRaV6m1hk64XUZY5dYqS0A7rqOspe0f7bVADyInUm1H88wGRIbB
CIbRRhsLlu8T9CxXAaE6vawroLavfvx3WD7lo1FpmS7WEZgV/oTr/R3iEgYd/ozW
/XZdWv0lpX04iH1KgG1fNPRsHMtfZe6F8gFaOdLRRq8oL3NG61hA+PxJGVEQ5piz
5rhiJqzAZyuDr2bUUqrvI5PhuVEfbkeO2CALsOTLa7yJR+pTmC5rLrW97RX4DSi0
ylTF50rwnIEeIeYi0TB8ITLisBmx/gM8u6jtEANbESeTNVf1yKCJJyVd5G2oZwpc
cRxYFNDX16+eT0VX+GwmDROrKnlVpmVtZkGMB06V+7/EBLmN7CN8ssZiYzhIcRWA
Lns7h/VbI96qotv/TqoXpMFNMe50jLcP80ha5paxQ/alBf4Mo9qd93CC7rur+EJQ
NeYIcS7UM2IBdEvFNMGDLq7q8emsU1v7/P2xneRAjLPIvd+U3Nlpgv0tF7j5kMnY
tC+tsQKpbEEl5nAUfY1uRwD1Uifv3075xLtH/w0YU+INu3iW1UiiYljUU00AsiYR
xla/jlPWaCue2stA3CAAoLsX7FHtS5josFATMyXxFKvGBE6uzAmRb/HHIx0g104h
+XF2eo7XebF3dD9+v/AGIbUZdhgwuLXlk5+zte5kYEHaLXDTA8U=
=8Ots
-----END PGP SIGNATURE-----

--Sig_/qXmZAoxE/QUq/7WxnDjKcxw--

--===============0906172810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0906172810==--
