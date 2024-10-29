Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A89B482B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 12:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611F410E62F;
	Tue, 29 Oct 2024 11:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="GxY7fYel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803610E152
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 11:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730200971; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M/YXkNSekdWtjQOx9xWba/yRcFA9dZiW/xbUbDqfYEW0kewPrJwh/7lhViqCJsaQnkMGw3WhpaYi0PHCdZ6PsEDXO6kgQVz/T3nqCgKWPzX6ccSq//3fJrQprL9HhmlMMrwuuEM22AdO97n2JZvukL/ZBypQyACxnOMPkHCVUxE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730200971;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=63uqfVLYYayNBvJEIoYogcy2jvvKTIQK12xtHviD8X0=; 
 b=fltZONsG3ZcWyh6LZFsbinjSUv1vgMdlqhCmW38GJ378ujR9i+cupVaHUx2JFZZMO0W8cVWO5ACdjfC+Ba5dBNXAsfFBAlTnpeR4dPwXYStv4ylUDAhB/qGsLab/PWhdmjj5IpjyMNpMVc5tEoK+t9fSckqiC9CDQOyOWo2tmrY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730200971; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=63uqfVLYYayNBvJEIoYogcy2jvvKTIQK12xtHviD8X0=;
 b=GxY7fYelyy1V73w9lrRYZqD7Yd2Mp5b+fuwWBw0X8AR3EkfXHtti2dPsGX8HQH7Y
 h6XDEizBSpKMCNmZ5UEMq3T9s60XKXhgkGOPZtISqQ2lXgduvJuMOHtl3Gf/DlXCxG7
 F9yIl48rJGynbRO5DvgKls+zCAUSW55PhOSY4/vc=
Received: by mx.zohomail.com with SMTPS id 1730200970627340.98927256099466;
 Tue, 29 Oct 2024 04:22:50 -0700 (PDT)
Message-ID: <3992ad8a3e1f6dabde46ba0d5428c793dcf49647.camel@collabora.com>
Subject: Re: [PATCH] drm/panthor: use defines for sync flags
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, Boris Brezillon	
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, Robin
 Murphy <robin.murphy@arm.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 kernel@collabora.com
Date: Tue, 29 Oct 2024 12:22:46 +0100
In-Reply-To: <ZyC1y1dSh1sgalLL@e110455-lin.cambridge.arm.com>
References: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
 <ZyC1y1dSh1sgalLL@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (by Flathub.org) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Tue, 2024-10-29 at 10:15 +0000, Liviu Dudau wrote:
> On Tue, Oct 29, 2024 at 10:46:29AM +0100, Erik Faye-Lund wrote:
> > Enums are always signed, and assigning 1u << 31 to it invokes
> > implementation defined behavior. It's not a great idea to depend on
> > this
> > in the UAPI, and it turns out no other UAPI does either.
> >=20
> > So let's do what other UAPI does, and use defines instead. This way
> > we
> > won't get unexpected issues if compiling user-space with a compiler
> > with
> > a different implementation-defined behavior here.
>=20
> You're missing the signoff.
>=20

Whoops, apologies.

Signed-off-by: Erik Faye-Lund <erik.faye-lund@collabora.com>

I'll add it for the next iteration, if needed.


> > ---
> > =C2=A0include/uapi/drm/panthor_drm.h | 44 +++++++++++++++++++++--------=
-
> > ----
> > =C2=A01 file changed, 28 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/include/uapi/drm/panthor_drm.h
> > b/include/uapi/drm/panthor_drm.h
> > index 87c9cb555dd1d..a2e348f901376 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -209,27 +209,39 @@ struct drm_panthor_obj_array {
> > =C2=A0	{ .stride =3D sizeof((ptr)[0]), .count =3D (cnt), .array =3D
> > (__u64)(uintptr_t)(ptr) }
> > =C2=A0
> > =C2=A0/**
> > - * enum drm_panthor_sync_op_flags - Synchronization operation
> > flags.
> > + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK
> > + *
> > + * Synchronization handle type mask.
> > =C2=A0 */
> > -enum drm_panthor_sync_op_flags {
> > -	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization
> > handle type mask. */
> > -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
> > +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xff
> > =C2=A0
> > -	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > Synchronization object type. */
> > -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
> > +/**
> > + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ
> > + *
> > + * Synchronization object type.
> > + */
> > +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> > =C2=A0
> > -	/**
> > -	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > Timeline synchronization
> > -	 * object type.
> > -	 */
> > -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ =3D 1,
> > +/**
> > + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ
> > + *
> > + * Timeline synchronization object type.
> > + */
> > +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ=C2=A0 1
> > =C2=A0
> > -	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> > -	DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
> > +/**
> > + * DRM_PANTHOR_SYNC_OP_WAIT
> > + *
> > + * Wait operation.
> > + */
> > +#define DRM_PANTHOR_SYNC_OP_WAIT=C2=A0=C2=A0=C2=A0 (0 << 31)
> > =C2=A0
> > -	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> > -	DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u << 31),
> > -};
> > +/**
> > + * DRM_PANTHOR_SYNC_OP_SIGNAL
> > + *
> > + * Signal operation.
> > + */
> > +#define DRM_PANTHOR_SYNC_OP_SIGNAL=C2=A0 (1u << 31)
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * struct drm_panthor_sync_op - Synchronization operation.
> > --=20
> > 2.45.2
> >=20
>=20

