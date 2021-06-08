Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76939F04C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA336EB17;
	Tue,  8 Jun 2021 07:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D904A6EB19;
 Tue,  8 Jun 2021 07:59:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f30so30697452lfj.1;
 Tue, 08 Jun 2021 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ruTzYXs4cmLo0eXIaRmbW9FUqRDOE1BMb3UGO3NelsU=;
 b=Ec32BPiI9kTFaHeNcLUIoFazWV5ssysJbyvCua3VqOomIbvlbFP4VKqEemzu7vXf3N
 +vtnkEonLdKvINLzV/OVWGmLQT1tQIdCrFyAI1qziVPX0GIXMXFDpyQunT/0NA2asyPb
 q4DhO3sMBNhlz4OlTiDm/4nfMXJcLAd1MyXhuNh4xLi1+bjCm6WpGM9DHshCAXWPabXC
 HVLXQfwg7LBmBRjlan+p7r+aoE2/2/OCcfZ8xmDn+kNbNcXpmNLrFXX2pzHF299VTFFd
 SmxKG1K+uV1aDSCSk/pUtooHcW95dKFFG8I5yud7sGbNRZPhds95cIG981zycoyS6e1n
 9RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ruTzYXs4cmLo0eXIaRmbW9FUqRDOE1BMb3UGO3NelsU=;
 b=L6N3+u3VdDIiAakd7iKUWKisOHhW/zmn8DFM/6LtctvGH3VGbpXGWdoITZ4gj6LlyK
 wRwoWK6klx/psigkH5No8P8mr9GyuegybTNM+mSLcjEhvOEaRImmpC8rN7rVARoc8tMg
 l+IP9BKmovWH6v+NAQy2LMXb45rYEjfh+/vAhn/LM2HPnnbnYeVGNEa/xqZ7HPrBiyiD
 XKc1BrSH5H5P1kNDoldroSbFRkn06JPqfZUGeXIGi+U9/CwxEdQtieQlq+H8fP7leFaZ
 UNtKTfSyL8CEC0Z13YxaX/5Jv3oniiQcADe4NJZQoXVDUAyo3eVH/t3k+NPtq7+wfMfi
 vUiw==
X-Gm-Message-State: AOAM532VkI+uOVoiNiMqSFFnF6cCGx26fWbMmk0caTkBmYSItVb/LBYR
 26gfm5zuCCNjguJnwEHvnvQ=
X-Google-Smtp-Source: ABdhPJxjs5+fFSryiF+Uwgfr46N4BhzgbTbssI9pXvTOTy7gDRmky8RRk1av09E5yvl6HukegV5qGA==
X-Received: by 2002:a05:6512:3baa:: with SMTP id
 g42mr14628385lfv.195.1623139172191; 
 Tue, 08 Jun 2021 00:59:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c125sm1799233lfd.199.2021.06.08.00.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 00:59:31 -0700 (PDT)
Date: Tue, 8 Jun 2021 10:59:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented luts
Message-ID: <20210608105919.5067f3d2@eldfell>
In-Reply-To: <f14650b0e9734d309d685e6fc3f60e1e@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <0909131c-1340-c93b-7b80-b661497ccf73@amd.com>
 <20210607102943.5c9bceb9@eldfell>
 <f14650b0e9734d309d685e6fc3f60e1e@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+wNr5lLpREdvx0e9gwqpyas"; protocol="application/pgp-signature"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/+wNr5lLpREdvx0e9gwqpyas
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Jun 2021 18:07:23 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Pekka
> > Paalanen
> > Sent: Monday, June 7, 2021 1:00 PM
> > To: Harry Wentland <harry.wentland@amd.com>
> > Cc: intel-gfx@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.co=
m>;
> > Sebastian Wick <sebastian@sebastianwick.net>; dri-devel@lists.freedeskt=
op.org;
> > Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented=
 luts
> >=20
> > On Fri, 4 Jun 2021 14:51:25 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> > > On 2021-06-01 6:41 a.m., Uma Shankar wrote: =20
> > > > Modern hardwares have multi segmented lut approach to prioritize the
> > > > darker regions of the spectrum. This series introduces a new UAPI to
> > > > define the lut ranges supported by the respective hardware.
> > > >
> > > > This also enables Pipe Color Management Support for Intel's XE_LPD =
hw.
> > > > Enable Support for Pipe Degamma with the increased lut samples
> > > > supported by hardware. This also adds support for newly introduced
> > > > Logarithmic Gamma for XE_LPD. Also added the gamma readout support.
> > > >
> > > > The Logarithmic gamma implementation on XE_LPD is non linear and
> > > > adds 25 segments with non linear lut samples in each segment. The
> > > > expectation is userspace will create the luts as per this
> > > > distribution and pass the final samples to driver to be programmed =
in hardware.
> > > > =20
> > >
> > > Is this design targetting Intel XE_LPD HW in particular or is it
> > > intended to be generic?
> > >
> > > If this is intended to be generic I think it would benefit from a lot
> > > more documentation. At this point it's difficult for me to see how to
> > > adapt this to AMD HW. It would take me a while to be comfortable to
> > > make a call on whether we can use it or not. And what about other ven=
dors?
> > >
> > > I think we need to be cautious in directly exposing HW functionality
> > > through UAPI. The CM parts of AMD HW seem to be changing in some way
> > > each generation and it looks like the same is true for Intel. The
> > > trouble we have with adapting the old gamma/degamma properties to
> > > modern HW is some indication to me that this approach is somewhat pro=
blematic.
> > >
> > > It would be useful to understand and document the specific use-cases
> > > we want to provide to userspace implementers with this functionality.
> > > Do we want to support modern transfer functions such as PQ or HLG? If
> > > so, it might be beneficial to have an API to explicitly specify that,
> > > and then use LUT tables in drivers that are optimized for the impleme=
nting HW. =20
> >=20
> > Hi Harry,
> >=20
> > from my very limited understanding so far, enum might be fine for PQ, b=
ut HLG is not
> > just one transfer function, although it may often be confused as one. P=
Q and HLG
> > are fundamentally different designs to HDR broadcasting I believe. It w=
ould be
> > unfortunate to make a mistake here, engraving it into UAPI. =20
>=20
> Yes Pekka, putting this in UAPI may limit us.
>=20
> > > Or is the use case tone mapping? If so, would a parametric definition
> > > of tone mapping be easier to manage? =20
> >=20
> > A very good question at least I have no idea about. =20
>=20
> Responded on earlier mail in thread. For non linear lut (gamma
> block), usecase is primarily tone mapping but there are
> implementations where non linear blending is seeked (AFAIR Android
> does that), so it leaves room for those usecases as well.

Yes, non-linear blending is a thing, unfortunately. Developers do not
usually understand what could be wrong with simply blending "RGBA
values", so most software just does that. It produces *a* result, and
if all you use it for is shades of black (shadows) or rounded window
corners, you never even see anything wrong with it. So the world has
accustomed to seeing "incorrect blending" so much that they think doing
anything else is wrong and complain if you try to move to physically
correct blending, because it changes the strength of shadows. Hence
any software migrating to a more correct blending formula may be met
with bug reports.

What's worse, pre-multiplied alpha is used as an optimization, as
implemented everywhere including Wayland, in a way that is actually a
step *away* from correct blending. If one wants to do correct blending,
you first need to divide out the pre-multiplied alpha, then linearize,
then blend.

Luckily(?), non-linear blending of HDR content will probably look a lot
worse than the same mistake on SDR content.


Thanks,
pq

--Sig_/+wNr5lLpREdvx0e9gwqpyas
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC/I1cACgkQI1/ltBGq
qqfPSQ//THsM9jgvXhNW0JkJjOKN4w+blp82p+/obhLuHvawj+IGwAi5vZfwkI7v
cstN/eWH6Efxu6/Y7uHY6e0qX8EpHuJJNwrpGIFf3ipevYK+e4KSjN81X2yHRNC7
qmaO6uLHMnNLm4IuYo5va56bErB/w8YYy+kJNmOaIScSGXxFKqERoW/t/ap6BtCK
Kysib16li8M1PsrmEv9h2938rNvrGqfmQAwrDCa91yp2HQWluGWcEXikWZqY1Cgf
uOD0vczg33U2/XFaGEpgT0loE52U+BPGGPWFTx5Vv0uJjushUSPV3KZBPwHHwyDr
DtrGph/fFeE3DIUBTzrNHRvtsfPFN9XKKqpZoOZuOkrhNd4Ou1oxt4UP5NtSbsNZ
3kcccRybQN2zHB+PyxMOt84UgKbEfnntUa5j0VRl2O+o8Ijg+CVqROA/vVUYRPTf
MKWsbfy/ETp7FIIGP3JNbR2hjrjTFBtWJjRhGh54fAQazK5iHwcDNjdKtX8sEnvi
1IEdN9HibKSjD9KrXxhgDe7OwGa7Nb3/Jq1eR6EIomhmezO3QaZI0ihU182GfpRi
ZWNWzbIRmPGv3gDAMHKim2Xm0SlzAC+CHpTQGu2Z3g+vcWy9kVEsLzRAgmu4MlOB
x7DTB+J9n+NMNeg9/gmUQr8CmdOY2pDrmCK1jSDm4FQQA5l7PrU=
=TJEm
-----END PGP SIGNATURE-----

--Sig_/+wNr5lLpREdvx0e9gwqpyas--
