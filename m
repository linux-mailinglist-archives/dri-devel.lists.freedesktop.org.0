Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318969A1F76
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A618B10E7E3;
	Thu, 17 Oct 2024 10:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TLG0k9Kz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4161510E7E3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729159732;
 bh=gNxCP4LTddSqQR/vywbTZFfk8O9GMEfuAZqGuWCng1M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TLG0k9KzuGOUY+W4vXdPyES3svCfpaIDN5FiJYXj4DxW/OzX9yX7e4iSSeekP1ob+
 HwVCY/XJZIMY+koD8DvxhI6dnXRQ/mYgIkQZke/FBQPvdHQ7zJub1sDiWaLVXbbtBF
 wIA/KdpEqR0a22Z1A7CDUykXjgxzSwaX7Fju48PIRkAjXUeaDR88TjUlh+EjQNg/tJ
 0rZ2CsFg0g7y4sh7HVqiwbtdcUPYdapY8QQGvF9ng3/siXLDF+kctlfefYVRjmnMKF
 EU3IzQ1uBunbKatvJiRAU2wwOVS4k/v7J2nTgkZYD1SiNYDg74Hg9tHX6lh/2HGinH
 X3ZzDqvC3tvXw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BA2417E1366;
 Thu, 17 Oct 2024 12:08:52 +0200 (CEST)
Date: Thu, 17 Oct 2024 12:08:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen	 <ketil.johnsen@arm.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
Message-ID: <20241017120847.02b6db35@collabora.com>
In-Reply-To: <e4cd985a471f4ab787ac002ae67e957ee85ede85.camel@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
 <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
 <abded30f-3333-49e5-aac2-8da6ac64903b@arm.com>
 <da2c1dcbefcc25760d6a452e04d870987daf0a27.camel@collabora.com>
 <20241016161833.574494ee@collabora.com>
 <e4cd985a471f4ab787ac002ae67e957ee85ede85.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 17 Oct 2024 10:51:32 +0200
Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:

> On Wed, 2024-10-16 at 16:18 +0200, Boris Brezillon wrote:
> > On Wed, 16 Oct 2024 16:05:55 +0200
> > Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:
> >  =20
> > > On Wed, 2024-10-16 at 15:02 +0100, Robin Murphy wrote: =20
> > > > On 2024-10-16 2:50 pm, Erik Faye-Lund wrote:=C2=A0  =20
> > > > > On Wed, 2024-10-16 at 15:16 +0200, Erik Faye-Lund wrote:=C2=A0  =
=20
> > > > > > On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:=C2=A0=
  =20
> > > > > > > +/**
> > > > > > > + * enum drm_panthor_sync_op_flags - Synchronization
> > > > > > > operation
> > > > > > > flags.
> > > > > > > + */
> > > > > > > +enum drm_panthor_sync_op_flags {
> > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK:
> > > > > > > Synchronization
> > > > > > > handle type mask. */
> > > > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
> > > > > > > +
> > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > > > > > > Synchronization object type. */
> > > > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
> > > > > > > +
> > > > > > > +	/**
> > > > > > > +	 *
> > > > > > > @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > > > > > > Timeline synchronization
> > > > > > > +	 * object type.
> > > > > > > +	 */
> > > > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ =3D
> > > > > > > 1,
> > > > > > > +
> > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> > > > > > > +	DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
> > > > > > > +
> > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation.
> > > > > > > */
> > > > > > > +	DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u << 31),=C2=A0  =20
> > > > > >=20
> > > > > > Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit
> > > > > > signed
> > > > > > integer, so isn't this undefined behavior in C?
> > > > > > =C2=A0  =20
> > > > >=20
> > > > > Seems this was proposed here:
> > > > > https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfb=
f1d23@arm.com/
> > > > >=20
> > > > > ...that kinda sounds like bad advice to me.
> > > > >=20
> > > > > Also, it's been pointed out to me elsewhere that this isn't
> > > > > *technically speaking* undefined, it's "implementation
> > > > > defined".
> > > > > But as
> > > > > far as kernel interfaces goes, that's pretty much the same; we
> > > > > can't
> > > > > guarantee that the kernel and the user-space is using the same
> > > > > implementation.
> > > > >=20
> > > > > Here's the quote from the C99 spec, section 6.3.1.3 "Signed and
> > > > > unsigned integers":
> > > > >=20
> > > > > """
> > > > > Otherwise, the new type is signed and the value cannot be
> > > > > represented
> > > > > in it; either the result is implementation-defined or an
> > > > > implementation-defined signal is raised
> > > > > """"
> > > > >=20
> > > > > I think a better approach be to use -1 << 31, which is well-
> > > > > defined.
> > > > > But the problem then becomes assigning it into
> > > > > drm_panthor_sync_op::flags in a well-defined way... Could we
> > > > > make
> > > > > the
> > > > > field signed? That seems a bit bad as well...=C2=A0  =20
> > > >=20
> > > > Is that a problem? Signed->unsigned conversion is always well-
> > > > defined
> > > > (6.3.1.3 again), since it doesn't depend on how the signed type=20
> > > > represents negatives.
> > > >=20
> > > > Robin.=C2=A0  =20
> > >=20
> > > Ah, you're right. So that could fix the problem, indeed. =20
> >=20
> > On the other hand, I hate the idea of having -1 << 31 to encode
> > bit31-set. That's even worse for DRM_PANTHOR_VM_BIND_OP_TYPE_xxx when
> > we'll reach a value above 0x7, because then the negative value is
> > hard
> > to map to its unsigned representation. If we really care about this
> > corner case, I'd rather go full-defines for flags and call it a day.
> >  =20
>=20
> Yeah, I suppose it can get ugly for some other cases.
>=20
> If we rule that out, I think there's only two options I can think of
> left:
>=20
> 1. Using #defines instead, like Boris suggested
> 2. Using 64 bit signed enums (e.g "1ll << 31" instead)
>=20
> Again, #2 here would be the smaller change. But I kinda think I lean
> towards #1, because... These aren't really enumerators. They are flags.
>=20
> ...Yeah, sure. In C the practical difference isn't huge. But if we ever
> wanted to support using these enums from C++ code, we'd need to add
> overloaded operators, because C++ doesn't allow ORing together enums
> out of the box.
>=20
> I'm not saying I have any plans on using the uAPI from C++, just saying
> that if we're going to tackle this, we might as well tackle it
> completely...
>=20
> Also, expanding the enum-type to 64 bits might have some additional
> consequences, like needlessly needing more stack-space to pass values
> around etc.
>=20
> Thoughts?

I'm leaning towards defines, because 64-bit enums are uncommon
(FWIW, 'git grep "1ll << 31" include/uapi' returns nothing).
