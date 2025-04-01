Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA36A782F4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8710E677;
	Tue,  1 Apr 2025 19:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="uxPvljF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch
 [109.224.244.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856E610E676
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743537216; x=1743796416;
 bh=W8tVSECA3wGFJRO7/CI9pHZECxu/bdeLCEdE5PriXlQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=uxPvljF0tSQyPdqiZuP5A4k6GZiyXh/JPFV5UVx46Kp7cSlX3v44vRwH1kqujU91U
 lrB4jFkBNAlUBAXjVn+tUPxZ2GnY3B2vHBRFVHKvQPbm7sAA95/DjMdPJbqDHwW2Kn
 pPE9mvPQHDVLSmGNP8Df382LUuKhzqZMPQ6WJnBWdjsVykNilZanpCZ5yK9e+I72/T
 mqq2N2CfO3cODEbhXpcYJ9LTrYTdRT8566yMp4UjuWWxA/sTycPr0gvUdEh/6oGo7f
 6yVQFWdLSiIB8wdZc51ngYPUBDAvSDZjQwGMMRW0YKPJQwEVIonROYsBXCqpSvi7kA
 bjKjs0zVYCoFw==
Date: Tue, 01 Apr 2025 19:53:31 +0000
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
Message-ID: <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
In-Reply-To: <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 682d023465909fa9e420aa6b1b00dfbe1ca1c30e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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






On Tuesday, April 1st, 2025 at 17:14, Daniel Stone <daniel@fooishbar.org> w=
rote:

>=20
>=20
> Hi Alex,
>=20
> On Wed, 26 Mar 2025 at 23:50, Alex Hung alex.hung@amd.com wrote:
>=20
> > +static int drm_colorop_init(struct drm_device *dev, struct drm_colorop=
 *colorop,
> > + struct drm_plane *plane, enum drm_colorop_type type)
> > +{
> > + struct drm_mode_config *config =3D &dev->mode_config;
> > + struct drm_property *prop;
> > + int ret =3D 0;
> > +
> > + ret =3D drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLO=
ROP);
> > + if (ret)
> > + return ret;
> > +
> > + colorop->base.properties =3D &colorop->properties;
> > + colorop->dev =3D dev;
> > + colorop->type =3D type;
> > + colorop->plane =3D plane;
>=20
> 'plane' seems really incongruous here. The colorop can be created for
> any number of planes, but we're setting it to always be bound to a
> single plane at init, and that can only be changed later.

I don't think the current design allows a single colorop to be re-used
between planes? I think as-is, drivers create one set of colorops per
plane and never share them between different planes?

> 1. Is it guaranteed that, if any plane on a device supports the
> COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
> (Given the amdgpu cursor-plane discussion, it looks like no, which is
> unfortunate but oh well.)

I don't think so. (They could all expose a COLOR_PIPELINE with the only
choice as the zero bypass pipeline, but that sounds silly.)

> 2. Is it guaranteed that, if a COLOR_PIPELINE property exists on a
> plane, that BYPASS will be one of the supported values? (The current
> implementation does this, which seems sensible, but if the plan is to
> not make this a uAPI invariant, e.g. to support planes with mandatory
> CM steps, this should probably be explicitly documented.)

Yes. This is a hard requirement, mentioned in the design doc IIRC.

> 3. Can a given color pipeline potentially be used on different planes,
> i.e. a colorop used to represent a separate hardware processing block
> which may be used on any plane but only one plane at a time? (This
> should be documented either way, and if they are unique per plane, igt
> should enforce this.)

Right now, I don't think so. Could be a future extension I suppose, but
I think we need to properly sit down and think about all of the possible
consequences. Maybe using the same pipeline ID isn't the best uAPI here.

> 3. Can a given color pipeline be active on multiple planes at a time?
> (If so, the implementation definitely needs rethinking: the colorop
> would need to have a list of planes.)

I don't think so.

> 4. Can a given color pipeline be active on multiple planes on multiple
> CRTCs at a time?

Ditto.

> 5. For a given colorop property, is it an invariant that the colorop
> will only appear in one color pipeline at a time? (I believe so, but
> this probably needs documenting and/or igt.)

I don't really understand why that would matter to user-space.

> Either way, I suspect that clorop->plane is the wrong thing to do, and
> that it maybe wants to be a list of planes in the drm_colorop_state?

I don't think so, for a given plane, there can only be a single pipeline
active at a time.
