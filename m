Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269193DFC12
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 09:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063176E9EE;
	Wed,  4 Aug 2021 07:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716F46E9EE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 07:27:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="299456546"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="299456546"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 00:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="441570038"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2021 00:27:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 4 Aug 2021 00:27:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 4 Aug 2021 00:27:00 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Wed, 4 Aug 2021 00:27:00 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>, "Zhang, Tina" <tina.zhang@intel.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgAA1+gCABGu4gIAAPeQAgAASv4CAASwBgIAAjWCQ
Date: Wed, 4 Aug 2021 07:27:00 +0000
Message-ID: <48d7f260adcc4c3e8dac28ec19bcf998@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
 <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
 <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
 <bede286bbe80421585cc9b9dd798bfe6@intel.com>
 <20210803075147.n5rbmdsrbhh5auk5@sirius.home.kraxel.org>
In-Reply-To: <20210803075147.n5rbmdsrbhh5auk5@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

>=20
> > > virtio_gpu_primary_plane_update() will send RESOURCE_FLUSH only for
> > > DIRTYFB and both SET_SCANOUT + RESOURCE_FLUSH for page-flip, and I
> > > think for the page-flip case the host (aka qemu) doesn't get the
> > > "wait until old framebuffer is not in use any more" right yet.
> > [Kasireddy, Vivek] As you know, with the GTK UI backend and this patch =
series:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06745.html
> > we do create a sync file fd -- after the Blit -- and wait (adding it to=
 Qemu's main
> > event loop) for it to ensure that the Guest scanout FB is longer in use=
 on the Host.
> > This mechanism works in a similarly way for both frontbuffer DIRTYFB ca=
se and
> > also the double-buffer case.
>=20
> Well, we don't explicitly wait on the old framebuffer.  Not fully sure
> this is actually needed, maybe the command ordering (SET_SCANOUT goes
> first) is enough.
[Kasireddy, Vivek] When the sync file fd is signaled, the new FB can be con=
sidered done/free
on the Host; and, when this new FB becomes the old FB -- after another FB i=
s submitted
by the Guest -- we don't need to explicitly wait as we already did that in =
the previous
cycle.=20

Strictly speaking, in the double-buffered Guest case, we should be waiting =
for the
sync file fd of the old FB and not the new one. However, if we do this, we =
saw that
the Guest will render faster (~90 FPS) than what the Host can consume (~60 =
FPS)
resulting in unnecessary GPU cycles. And, in addition, we can't be certain =
about
whether a Guest is using double-buffering or single as we noticed that Wind=
ows
Guests tend to switch between single and double-buffering at runtime based =
on
the damage, etc.

>=20
> > > So we'll need a host-side fix for that and a guest-side fix to switch
> > > from a blocking wait on the fence to vblank events.
> > [Kasireddy, Vivek] Do you see any concerns with the blocking wait?
>=20
> Well, it's sync vs. async for userspace.
>=20
> With the blocking wait the userspace ioctl (PAGE_FLIP or the atomic
> version of it) will return when the host is done.
>=20
> Without the blocking wait the userspace ioctl will return right away and
> userspace can do something else until the host is done (and the vbland
> event is sent to notify userspace).
[Kasireddy, Vivek] Right, but upstream Weston -- and I am guessing Mutter a=
s well --=20
almost always choose DRM_MODE_ATOMIC_NONBLOCK. In this case, the
atomic ioctl call would not block and the blocking wait will instead happen=
 in the
commit_work/commit_tail workqueue thread.

>=20
> > And, are you
> > suggesting that we use a vblank timer?
>=20
> I think we should send the vblank event when the RESOURCE_FLUSH fence
> signals the host is done.
[Kasireddy, Vivek] That is how it works now:
        drm_atomic_helper_commit_planes(dev, old_state, 0);

        drm_atomic_helper_commit_modeset_enables(dev, old_state);

        drm_atomic_helper_fake_vblank(old_state);

The blocking wait is in the plane_update hook called by drm_atomic_helper_c=
ommit_planes()
and immediately after that the fake vblank is sent.

Thanks,
Vivek
>=20
> take care,
>   Gerd

