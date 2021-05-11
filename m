Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D6F37B054
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 22:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4FB6E0CF;
	Tue, 11 May 2021 20:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A076E0CF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 20:53:35 +0000 (UTC)
IronPort-SDR: lp+SIWqPkB1sWfhjtQszmooJAmUewt4VfK4VINIzMBRTwwUIUSPH41nEEa9V187+od0pviNjy2
 j3jrXqdTffag==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="263477946"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="263477946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 13:53:32 -0700
IronPort-SDR: 3SZTDlfyjq4eWAkSHr7Ezp8F2j3HTwH9s1NgRplyOShg6yhYPriUYhZ8wCGwQ9+7kCwVownZJN
 XOszqGUdBIig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="436834569"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2021 13:53:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 13:53:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 13:53:31 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Tue, 11 May 2021 13:53:31 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Topic: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Index: AQHXRkJlkjlIGKft2U2cLif8N5l39qreigIAgAA0UeA=
Date: Tue, 11 May 2021 20:53:31 +0000
Message-ID: <8dc2bbd037964224bcc6609fd47b5698@intel.com>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
 <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
In-Reply-To: <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

> On Tue, May 11, 2021 at 01:36:08AM -0700, Vivek Kasireddy wrote:
> > This feature enables the Guest to wait until a flush has been
> > performed on a buffer it has submitted to the Host.
>=20
> This needs a virtio-spec update documenting the new feature.
[Kasireddy, Vivek] Yes, I was planning to do that after getting your=20
thoughts on this feature.

>=20
> > +	VIRTIO_GPU_CMD_WAIT_FLUSH,
>=20
> Why a new command?
>=20
> If I understand it correctly you want wait until
> VIRTIO_GPU_CMD_RESOURCE_FLUSH is done.  We could
> extend the VIRTIO_GPU_CMD_RESOURCE_FLUSH command
> for that instead.
[Kasireddy, Vivek] VIRTIO_GPU_CMD_RESOURCE_FLUSH can trigger/queue a
redraw that may be performed synchronously or asynchronously depending on t=
he
UI (Glarea is async and gtk-egl is sync but can be made async). I'd like to=
 make the
Guest wait until the actual redraw happens (until GlFLush or eglSwapBuffers=
, again
depending on the UI).=20

However, as part of this feature (explicit flush), I'd like to make the Gue=
st wait until
the current resource (as specified by resource_flush or set_scanout) is flu=
shed or
synchronized. But for a different feature I am thinking of (explicit sync),=
 I'd like to
make the Guest wait for the previous buffer/resource submitted (available v=
ia=20
old_state->fb).

I think it may be possible to accomplish both features by overloading resou=
rce_flush
but given the various combinations of Guests (Android/Chrome OS, Windows, L=
inux)
and Hosts (Android/Chrome OS, Linux) that are or will be supported with vir=
tio-gpu +
i915, I figured adding a new command might be cleaner.

Thanks,
Vivek


>=20
> take care,
>   Gerd

