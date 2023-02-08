Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C085568EB4C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2410E6E1;
	Wed,  8 Feb 2023 09:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC9710E6E1;
 Wed,  8 Feb 2023 09:25:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id m1so7170659ejx.7;
 Wed, 08 Feb 2023 01:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=llfEBKRvQZ31KGFhCC0+qU+MYcdqjvaZJKtkQ2OM66c=;
 b=Um6RbfX3+ZOsWULMklSkzUg9n0Oe94ta+1BqSuWwWuzFMmEU3CK16ieFrBVuSC1opJ
 VIqlP7oPCmm3MizKs8Zj37SG9W1zaMXTak2kV6d7LXFH4hIsjfPGCT0fnpe2Q6hefB13
 p1pm8InMVUFsmA1yKwwnReNw3i/QApN+1Ff+5NqMABZu1jE3PTqWjVkutkT+0m+QAuFw
 DMyZjaxIKbtK7SvGrPX+2vYjWP7ZYJoPlGbOWFzQgPE4vvOxiM3YuQPtzv3n1EQJgEJt
 nIt+AnDvocFSfIl3T6BJZcpM28+xrpLyoOglo/gn2285q0sNBAtwEia+kJVTLX3OCwaN
 BVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=llfEBKRvQZ31KGFhCC0+qU+MYcdqjvaZJKtkQ2OM66c=;
 b=EpHQieitWmQPqtvw8a5TmjxGeIfiIKrHrTK8cnqhvVFQQqJ1Lw+wff+yR3DboDMkTG
 apMfKRwMZJR04OVoFsI4KhL6+xjIPGSMdtkJ1Tig3NnWYn0DB/EtYTtBTySzdNM1sIBu
 EseAKQABPquCFWTvUYg/yhQzzegTYXwkbvJdRNJsoNEEDSEzfeIcTIZrFK6wXvMKLGan
 BIshB+uAHZfhEPg4H3K0BFXg1rUiCaPwr43yZlfBes1crYt+TKm6rzk20hV9JoF/I4KY
 y2JpkCGP/fEhinUEQiiVgcIdfcN32LZ5xzH7I/pWBPRlSQlHkTfSvNFQa53lvnmTYaVN
 YZQQ==
X-Gm-Message-State: AO0yUKXSZeqxPAGIIWF0F4rDszELviYeWzp2phxeCrtt6/qAnc5GcPT/
 clLM0edYJW+1U2K5cOBC5oI=
X-Google-Smtp-Source: AK7set/pl9srdj9xnQRhw2pxHJH5l5DS6/MCj3F+rSds4Df2jJ48J+hLhThpRlOU59wy2yrqoO9s5w==
X-Received: by 2002:a17:906:ca04:b0:880:e6d0:5794 with SMTP id
 jt4-20020a170906ca0400b00880e6d05794mr6287823ejb.58.1675848329858; 
 Wed, 08 Feb 2023 01:25:29 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j2-20020a1709066dc200b008787e94c5ccsm7986774ejt.184.2023.02.08.01.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:25:29 -0800 (PST)
Date: Wed, 8 Feb 2023 11:25:25 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230208112525.6c147047@eldfell>
In-Reply-To: <Y90vrEa3/1RbaGOV@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z.CTMTvwHpNyXmRZ_wpxb_1";
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

--Sig_/z.CTMTvwHpNyXmRZ_wpxb_1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Feb 2023 18:00:44 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
> >=20
> >=20
> > On 2/3/23 10:19, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> > > On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote: =20
> > >>
> > >>
> > >> On 2/3/23 07:59, Sebastian Wick wrote: =20
> > >>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> > >>> <ville.syrjala@linux.intel.com> wrote: =20
> > >>>>
> > >>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote: =20
> > >>>>> Userspace has no way of controlling or knowing the pixel encoding
> > >>>>> currently, so there is no way for it to ever get the right values=
 here. =20
> > >>>>
> > >>>> That applies to a lot of the other values as well (they are
> > >>>> explicitly RGB or YCC). The idea was that this property sets the
> > >>>> infoframe/MSA/SDP value exactly, and other properties should be
> > >>>> added to for use userspace to control the pixel encoding/colorspace
> > >>>> conversion(if desired, or userspace just makes sure to
> > >>>> directly feed in correct kind of data). =20
> > >>>
> > >>> I'm all for getting userspace control over pixel encoding but even
> > >>> then the kernel always knows which pixel encoding is selected and
> > >>> which InfoFrame has to be sent. Is there a reason why userspace wou=
ld
> > >>> want to control the variant explicitly to the wrong value?
> > >>> =20
> > >>
> > >> I've asked this before but haven't seen an answer: Is there an exist=
ing
> > >> upstream userspace project that makes use of this property (other th=
an
> > >> what Joshua is working on in gamescope right now)? That would help us
> > >> understand the intent better. =20
> > >=20
> > > The intent was to control the infoframe colorimetry bits,
> > > nothing more. No idea what real userspace there was, if any.
> > >  =20
> > >>
> > >> I don't think giving userspace explicit control over the exact infof=
rame
> > >> values is the right thing to do. =20
> > >=20
> > > Only userspace knows what kind of data it's stuffing into
> > > the pixels (and/or how it configures the csc units/etc.) to
> > > generate them.
> > >  =20
> >=20
> > Yes, but userspace doesn't control or know whether we drive
> > RGB or YCbCr on the wire. In fact, in some cases our driver
> > needs to fallback to YCbCr420 for bandwidth reasons. There
> > is currently no way for userspace to know that and I don't
> > think it makes sense. =20
>=20
> People want that control as well for whatever reason. We've
> been asked to allow YCbCr 4:4:4 output many times.
>=20
> The automagic 4:2:0 fallback I think is rather fundementally
> incompatible with fancy color management. How would we even
> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> that stuff is just always BT.709 limited range, no questions
> asked.

The difference between 4:4:4 and 4:2:0 is purely the sub-sampling. It
has absolutely no implication to colorimetry nor MatrixCoefficients at
all.


Thanks,
pq

--Sig_/z.CTMTvwHpNyXmRZ_wpxb_1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPjaoUACgkQI1/ltBGq
qqeXExAAk8T8BslqYHVmqDR1FKjsoahJQNGRsiLSsECCns7diWH7gp9iKV3l57Fd
2ytivycVudwR2c11ofTKujDDObCbtYfr8SoGyTfwj3DZQPuJ5HWmfRgv58nKfLzR
PN4MEnVZ/QECf4yzCA1EoeCe/19dhiUMurIDV95AQjv/InqPn8nLZ3jF6jZ4GRQf
zHAZEjjH39yVkzF3ls2L7GKvSvq2WwoJmlK9ruNDG6xN3rSQcZaLPvVuw5vRgqKt
uia1Cw6WUOgI7Q9vvx76yhr0JE+nGj3s7j8zXlk6ZoIn3xszTiUpF89Tlt59qwTO
5En3yeL+76t1wp3tHPBLRIcX+DvnIcMsFRrMntRc1cCLkJBd0HK1+LRx+x/Ch56O
yd0YhxBMovseUeeMUrORLSl4r3TQNFeYOOg1iW88IUHlsdI6ozmUJxSTO0FGNGl2
l32osH30ip9x5pq+vXus3d8sL/L1fQMPd/k+MxLjyL1Zmh0l9T+/igLDv8EhVF2j
l4+s5uoMTe6AOGTY848wXCCKTpiowMbWIQ6ogKuGGzHkiiP5Eecd/1/CrOUubBKw
RFfO1KTXOJZilnh3+fGiOC3Rg/eYUdIsIzkqafK5p6omWrXqpt3uffNR1zEJ8qX/
8fMkd3oTGJnB3ihxDmsPWmJbe6UV9AXOSP2XsVyXoHvFMrF2DyM=
=nfZr
-----END PGP SIGNATURE-----

--Sig_/z.CTMTvwHpNyXmRZ_wpxb_1--
