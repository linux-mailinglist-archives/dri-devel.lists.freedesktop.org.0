Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA9AC0660
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9B510ED47;
	Thu, 22 May 2025 07:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YZLoE4I9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087ED10ED47;
 Thu, 22 May 2025 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747900676;
 bh=XoL4gpKlHYJ+sqRIbsFdXMS7BBSJEp74ozw8/DjLDCQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YZLoE4I9cY/UqsIcAJu93aQl3QDjrLbj4NxjIHRLKR+D0r//5VekljUkuQg3jHoT2
 ae06ZpzPAf44lZMmrUr6+DghitZcioIdWx0fznBUQfJ4y4w9ky0+PXyWmnM++kblNj
 uPveNIG7fCFEUhCY3JZQr9XZ9A9LcgcrpoJpiKA1ZaADKT1EzL5qTVeDlElbnERFrE
 1kH16R1ndk2JruQolTCI6gqosf8a+GEM3oALA5zVmRp/dJtc9lNYnxLLqlyZ1wTUs2
 Kt90LF2Q6V67fykRHk7I5YPk0/cidFy0ABB1F28yVrNuR1JRewNR+WpsEcam0WBU32
 7ZU8Yz2KlCVJA==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E2DEE17E0393;
 Thu, 22 May 2025 09:57:54 +0200 (CEST)
Date: Thu, 22 May 2025 10:57:41 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Leandro Ribeiro
 <leandro.ribeiro@collabora.com>, Daniel Stone <daniel@fooishbar.org>, Simon
 Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>, Misyl Toad
 <misyl@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
Message-ID: <20250522105741.6aafc955@eldfell>
In-Reply-To: <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
 <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vC+ojhB1KZ=+fWvDp2G82kU";
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

--Sig_/vC+ojhB1KZ=+fWvDp2G82kU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 May 2025 15:48:00 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2025-05-17 07:51, Xaver Hugl wrote:
> > Am Do., 15. Mai 2025 um 22:00 Uhr schrieb Leandro Ribeiro
> > <leandro.ribeiro@collabora.com>: =20
> >>
> >>
> >>
> >> On 5/15/25 15:39, Daniel Stone wrote: =20
> >>> Hi,
> >>>
> >>> On Thu, 15 May 2025 at 19:02, Harry Wentland <harry.wentland@amd.com>=
 wrote: =20
> >>>> On 2025-05-15 13:19, Daniel Stone wrote: =20
> >>>>> Yeah, the Weston patches are marching on. We've still been doing a
> >>>>> little bit of cleanup and prep work in the background to land them,
> >>>>> but we also can't land them until the kernel lands. None of that wo=
rk
> >>>>> is material to the uAPI though: as said previously, the uAPI looks
> >>>>> completely solid and it's something we can definitely beneficially =
use
> >>>>> in Weston. (Even if we do need the obvious follow-ons for
> >>>>> post-blending as well ...) =20
> >>>>
> >>>> We can't merge kernel uAPI without canonical userspace that uses it.
> >>>> To move forward we'll need a userspace to at least publish a branch
> >>>> that shows the use of this new uAPI.
> >>>>
> >>>> Do you have a public branch for the Weston work for this? =20
> >>>
> >>> Yeah, https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/=
1702
> >>> has been around for a little while now. There are some driver bugs
> >>> that Leandro commented on, but they don't seem material to the uAPI as
> >>> such? =20
> >>
> >> Hello,
> >>
> >> Yes, there's nothing related to the API that is blocking us. It seemed
> >> very flexible and easy to use. The bugs that I've spotted are probably
> >> internal to AMD driver.
> >>
> >> I'd say that the Weston patches are converging nicely, we just need ti=
me
> >> to get them fully reviewed. We had a few preparation MR's to land
> >> before !1702, and now there's only one left (!1617). =20
> >=20
> > I also updated the KWin MR
> > (https://invent.kde.org/plasma/kwin/-/merge_requests/6600), it can now
> > use all the available properties and I think it's ready. I found two
> > issues with the kernel patches though:
> > - while attempting to set COLOR_ENCODING and COLOR_RANGE results in
> > the atomic commit being rejected, the existing values still get
> > applied if you use YCbCr-type buffers. I would've expected the color
> > pipeline to operate on the YUV values in that case - and leave
> > conversion to RGB up to the compositor adding the relevant matrix to
> > the pipeline =20
>=20
> AMD HW always operates on RGB values, so there'll always be an
> implicit conversion of YCbCr-type buffers to RGB.

Surely the transformation from YCbCr to RGB can be one that maps each
of Y, Cb and Cr channels to G, B and R ranges [0.0, 1.0]?

Of course, that's not identity transformation (Cb and Cr have domain
[-0.5, 0.5] or something like that) and R, B may not handle negative
values.

But if R and B channels can be negative too, then identity mapping
would be usable.

There will need to be a definition of how YCbCr enters the color
pipeline: the order of the channels and their domains. The rest can be
just more colorops.

We should be careful to allow limited range YUV formats to be
interpreted as full range to avoid clipping the sub-black and
super-white signal ranges. The color pipeline can be configured to deal
with those ranges as necessary.

> What we should
> do is reject YCbCr-type buffers with the color pipeline until we
> implement support for COLOR_ENCODING and COLOR_RANGE as a new
> CSC colorop.

Rejecting is fine, but is implementing COLOR_ENCODING and COLOR_RANGE
really a good idea instead of making the color pipelines handle them?

Wasn't the original plan to hide all such legacy plane properties when
userspace signals color pipeline support?


Thanks,
pq

--Sig_/vC+ojhB1KZ=+fWvDp2G82kU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgu2PUACgkQI1/ltBGq
qqcU5g//QVFAf1F1KLz0X8ehCJa9ilKukLt+PgrlU+PZk55xrvV2K37xgvQdIxa1
tRaIc0HBs6yzFABh80q86I2TImr5BHG0bgggDYOksIaWB/tfv3JpuE5QlAE7snfH
geHs4MR9NHtFCxPNAEQ5nYBk1BQnE5p4/DUHrPnBeY1WwjzMCz6Ds6UaZPbucNzy
P1Qh3ymGQsV088FuChXVfVvZyUPU3QfizLnbpTiwKLFveNArGBt947W3iXC4akn+
kJJ3GiYgYqPhXRQzD+/23psPBtlIr9RmoLfLN3d+Uh8kjEuYGfE40Q2yTxduwWR9
8PgYIAMUMaP8EQ+t+6K6VOaGHOv4sW9y4h4K6d3a1OoANPsOH+kioRghQJ1AsW8s
k1ZTwiPvWkwEp7Mzq2nGF3ifr7DZMfX7Bl+f3ozR3VH66Xs4cFFoxSlFgD3wIsxp
03nJMmtYHmC+UezVAbDbmqp2+BMXHfB+f4bxLzCUU39hBiQkIk2BOocAX1c/Kq41
copoh7OiKcG7Hl2ShjnywC+221hrOIhhxTtDXqqRRDL16vDoZGIwp9z/ZaUUMgE6
kbP5jJZH+rqoZidx1+qOxWeeQMS6egc3NgMtXBjY0irDbORbgAHsMW610xjN5SUi
ZOn+q7qKaN6yzZ7Rr4rJN3+/GjzFs2/PVhQvsZ71HCgQvg+O7E8=
=IQkg
-----END PGP SIGNATURE-----

--Sig_/vC+ojhB1KZ=+fWvDp2G82kU--
