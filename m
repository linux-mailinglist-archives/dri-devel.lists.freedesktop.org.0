Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D968EC43
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2A610E170;
	Wed,  8 Feb 2023 10:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A53310E170;
 Wed,  8 Feb 2023 10:03:10 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ml19so50054635ejb.0;
 Wed, 08 Feb 2023 02:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WhHYovaEnkE0xdr2DTUgrrcUFCE1KO271GBYTSET2gM=;
 b=gdtbRV6iyRqLCNHOKoAW8NuGI67WBArJG4/E6jaNxTCxputvnVK+1G6n2u1yVMpVm7
 8W4VszihZ1MyzGH7h+ar5+mjeJE5g2pzKqC9VPSDFMtk7IMyHKUjExQT7P49alc4RyeA
 t3VfbFC8d3L2kypISFxhACVrQPxH45zI6aM8/QaAHeM4ss0cGixnovIzTG2m5dliGz2W
 dZDW5e3Jafi6hH/X62xwOp28YWja2BrvflOptFvvR3oS53IAH7/iGgYR9xx03QOg6lRq
 ATyGd0ONkDwWFGgI5H4QOhvP4Vy8dRZ7sQLbPEehDVYrJRSfoUyHUbzCP1fUODsbZraz
 sM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WhHYovaEnkE0xdr2DTUgrrcUFCE1KO271GBYTSET2gM=;
 b=SvWYxQUCLFl4N+pdhuxBqTMIEOIcX8nzL8qJR69SiEJ+NEIcY3kFZmcnXx/hxnWahr
 t44q3vih6K0g0G2h/7ejAORk43fnJVI81/6ithjt4cc4u1uAENPbbKpyVkaEDtKTYIVC
 SKfMN+q8lzOWRTjOHLgs0+s5poATPhupYs2xC6IVNLhtfm9aklP7cqjH3sy7PVM1o2Fs
 q+mM0xh4DNJxi6MNjcacufe/ExCc4j5UWoRvr3WFaLF2FOy/m174sHT34iQUQYGv/LYh
 dsraVMe/B/uElC0ZE/EVnV1g1WRSILo48F/pYzpbIMP+aVtXWAzS4mLFoo61j+N47Sgc
 Tosg==
X-Gm-Message-State: AO0yUKVuW6M+LhWMR+upm8MTyNQtUj+/JZIIB16GtxomJnHghsFl6atL
 XqACqFyl8LJ7QYMzTp8fP5Y=
X-Google-Smtp-Source: AK7set/bwiAovsYZsUh/IPMzteHBeLMbj9/GDHduMnhrdqoLsjWSK/md64483Q8jaZ0E6FZiQ5y07Q==
X-Received: by 2002:a17:907:a582:b0:8aa:bf4e:7b2c with SMTP id
 vs2-20020a170907a58200b008aabf4e7b2cmr4093899ejc.21.1675850588991; 
 Wed, 08 Feb 2023 02:03:08 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o12-20020aa7c7cc000000b0049ef70a2894sm7643237eds.38.2023.02.08.02.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 02:03:08 -0800 (PST)
Date: Wed, 8 Feb 2023 12:03:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230208120304.6a823f1e@eldfell>
In-Reply-To: <8420f701-45e7-6a05-56da-9616e2800293@amd.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com>
 <Y91Y98jyOimabC3O@intel.com> <Y91fsmgAx65koWI5@intel.com>
 <8420f701-45e7-6a05-56da-9616e2800293@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LJ8BA/EvLBTiJ04dDXl92K2";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/LJ8BA/EvLBTiJ04dDXl92K2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Feb 2023 14:33:46 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2/3/23 14:25, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote=
: =20
> >> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote: =20
> >>>
> >>>
> >>> On 2/3/23 11:00, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote: =20
> >>>>>
> >>>>>
> >>>>> On 2/3/23 10:19, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote: =20
> >>>>>>>
> >>>>>>>
> >>>>>>> On 2/3/23 07:59, Sebastian Wick wrote: =20
> >>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> >>>>>>>> <ville.syrjala@linux.intel.com> wrote: =20
> >>>>>>>>>
> >>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote: =
=20
> >>>>>>>>>> Userspace has no way of controlling or knowing the pixel encod=
ing
> >>>>>>>>>> currently, so there is no way for it to ever get the right val=
ues here. =20
> >>>>>>>>>
> >>>>>>>>> That applies to a lot of the other values as well (they are
> >>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
> >>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
> >>>>>>>>> added to for use userspace to control the pixel encoding/colors=
pace
> >>>>>>>>> conversion(if desired, or userspace just makes sure to
> >>>>>>>>> directly feed in correct kind of data). =20
> >>>>>>>>
> >>>>>>>> I'm all for getting userspace control over pixel encoding but ev=
en
> >>>>>>>> then the kernel always knows which pixel encoding is selected and
> >>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace =
would
> >>>>>>>> want to control the variant explicitly to the wrong value?
> >>>>>>>> =20
> >>>>>>>
> >>>>>>> I've asked this before but haven't seen an answer: Is there an ex=
isting
> >>>>>>> upstream userspace project that makes use of this property (other=
 than
> >>>>>>> what Joshua is working on in gamescope right now)? That would hel=
p us
> >>>>>>> understand the intent better. =20
> >>>>>>
> >>>>>> The intent was to control the infoframe colorimetry bits,
> >>>>>> nothing more. No idea what real userspace there was, if any.
> >>>>>> =20
> >>>>>>>
> >>>>>>> I don't think giving userspace explicit control over the exact in=
foframe
> >>>>>>> values is the right thing to do. =20
> >>>>>>
> >>>>>> Only userspace knows what kind of data it's stuffing into
> >>>>>> the pixels (and/or how it configures the csc units/etc.) to
> >>>>>> generate them.
> >>>>>> =20
> >>>>>
> >>>>> Yes, but userspace doesn't control or know whether we drive
> >>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
> >>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
> >>>>> is currently no way for userspace to know that and I don't
> >>>>> think it makes sense. =20
> >>>>
> >>>> People want that control as well for whatever reason. We've
> >>>> been asked to allow YCbCr 4:4:4 output many times.
> >>>>
> >>>> The automagic 4:2:0 fallback I think is rather fundementally
> >>>> incompatible with fancy color management. How would we even
> >>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> >>>> that stuff is just always BT.709 limited range, no questions
> >>>> asked.
> >>>> =20
> >>>
> >>> We use what we're telling the display, i.e., the value in the
> >>> colorspace property. That way we know whether to use a BT.2020
> >>> or BT.709 matrix. =20
> >>
> >> And given how these things have gone in the past I think
> >> that is likey to bite someone at in the future. Also not
> >> what this property was meant to do nor does on any other
> >> driver AFAIK.
> >> =20
> >>> I don't see how it's fundamentally incompatible with fancy
> >>> color management stuff.
> >>>
> >>> If we start forbidding drivers from falling back to YCbCr
> >>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
> >>> amdgpu and will see bug reports. =20
> >>
> >> The compositors could deal with that if/when they start doing
> >> the full color management stuff. The current stuff only really
> >> works when the kernel is allowed to do whatever it wants.
> >> =20
> >>> =20
> >>>> So I think if userspace wants real color management it's
> >>>> going to have to set up the whole pipeline. And for that
> >>>> we need at least one new property to control the RGB->YCbCr
> >>>> conversion (or to explicitly avoid it).
> >>>>
> >>>> And given that the proposed patch just swept all the
> >>>> non-BT.2020 issues under the rug makes me think no
> >>>> one has actually come up with any kind of consistent
> >>>> plan for anything else really.
> >>>> =20
> >>>
> >>> Does anyone actually use the non-BT.2020 colorspace stuff? =20
> >>
> >> No idea if anyone is using any of it. It's a bit hard to do
> >> right now outside the full passthrough case since we have no
> >> properties to control how the hardware will convert stuff.
> >>
> >> Anyways, sounds like what you're basically proposing is
> >> getting rid of this property and starting from scratch. =20
> >=20
> > Hmm. I guess one option would be to add that property to
> > control the output encoding, but include a few extra
> > "automagic" values to it which would retain the kernel's
> > freedom to select whether to do the RGB->YCbCr conversion
> > or not.
> >=20
> > enum output_encoding {
> > 	auto rgb=3Ddefault/nodata,ycbcr=3Dbt601
> > 	auto rgb=3Ddefault/nodata,ycbcr=3Dbt709
> > 	auto rgb=3Dbt2020,ycbcr=3Dbt2020
> > 	passthrough
> > 	rgb->ycbcr bt601,
> > 	rgb->ycbcr bt709,
> > 	rgb->ycbcr bt2020,
> > }
> >  =20
>=20
> Is there a good reason to decouple the YCbCr encoding format
> from the colorspace?

Well, they are two completely different things. Even more.

Using the CICP terms:
- ColourPrimaries
- TransferCharacteristics
- MatrixCoefficients
- VideoFullRangeFlag

Might also need to consider even the other ones:
https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/cicp_h273.md

In the narrow color gamut, SDR, cases, I believe getting the
MatrixCoefficients right was the important thing that people would
notice if it was wrong. ColourPrimaries did not really matter, who'd
use those anyway. VideoFullRangeFlag was really important to get right.
TransferCharacteristics was just about getting gamma in the right
ballpark.

Introduce WCG and especially HDR, TransferCharacteristics became really
important, and ColourPrimaries could not be ignored anymore.

The problem is that most of the relevant BT specs define all of these,
or even multiple options like BT.601 ColourPrimaries or BT.2020
MatrixCoefficients. Well, that's not really the problem, but the
practise of combining one thing from one spec and another from a
different spec.

Even if we restrict to BT.2020 only, we can choose between non-constant
luminance (simple) and constant luminance (complicated)
MatrixCoefficients.

Then we have BT.2100 ICtCp which uses BT.2020 color gamut but different
other things.


It's really tricky to come up with properties/enums that both fully
describe things and do not hit internal inconsistency.

One approach is to have single property enumerating all the practical
combinations of everything. The other approach is to have one property
for each independent aspect and accept that not all combinations are
practical (the CICP approach). Any kind of middle ground or combination
just falls apart.


Thanks,
pq

> > and then if you leave the colorspae property to "default"
> > the kernel will pick the "right" value based on the
> > output_encoding prop.
> >  =20
>=20
> How would you fill in the AVI infoframe? Userspace would still
> need to set that to BT.2020 if the pixels are in BT.2020.
>=20
> Harry
>=20
> > That would leave all the weird stuff in the colorspace
> > property alone and thus would still allow someone to
> > do more than just the basic stuff explicitly.
> >  =20
>=20


--Sig_/LJ8BA/EvLBTiJ04dDXl92K2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPjc1gACgkQI1/ltBGq
qqc8Tw/9FvuONvcZnowICa4xZ3mQ6PTjAS4r5Dcbwd2ZurhV/4jCb+oaoIV8+Ing
ndH0ShznDNFMV0z/7MgavqvQy0iAVGbJTE83KGRSbviN6JTZ7M1dzqYSeXAcOO1J
O5slmAc2X/C4C1wc/afZjYcOtoiraYzLdNWqRd4VKr5tegm92pnE4fNi2MzgUb9J
r/9dv660bdT/zVcM1zbbMTI2yaL+b1ceJNRru/+/Kzd3geunnKZo5KtLSJ6XwzG5
6Xw19yNq6RuQMzsXMcaSDhx/z3uUZ9/OEA5a49bWNJG2Dv9YJHDpiM7SKW1ZZxD1
hpbr76N5BXx8ryb7VFwliXw24YhQsgbjA9uOv2K4WVZzR/ktq9UHvghRrDXyDpQl
1TzEQt2qSey43vIp9/iEmf+vFkfTq+gTvXzoC5K+fKNdup22AwKBlx9korF++hrR
9IkozcSZN7/Bncwdlr12MLVAoQY9eN8abGs06Y96lXqZ6NHkT/BeqiTApWItwtQ/
+koQmBcaacXThfLTzfF0V7KjRmWfTQPIIcq5y6McPYJQudNhsbSjatYGSRVAmEEh
67c7zqAaYqrmEl8RlRMjT0GD0rtUoCdmT+aVpfAGiaG1Xx9Enq22bYauCQi2jFzz
O4m8YFsRPYrwQBmBYiDpASvZh3++p5Z3Mhyi/jv/B7Q66JmbbL0=
=Eo3D
-----END PGP SIGNATURE-----

--Sig_/LJ8BA/EvLBTiJ04dDXl92K2--
