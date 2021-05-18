Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E152387165
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 07:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF976E808;
	Tue, 18 May 2021 05:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4906E808
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:45:05 +0000 (UTC)
IronPort-SDR: kIcQ7mIVz9WBX7tTaqAkgJY/2tTExXXRwwC2wNauaBEXb7HWzbZOoQPn7C8kI7YuFzDnNqzNCn
 DWm23tvkIlsg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="200682117"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="200682117"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 22:45:04 -0700
IronPort-SDR: b1oPnBPbeSZLN5SCuBnDZgizPGOEx5r6MzHS3eGr3lzsEe9U3COTkffh8sVwfHOCA1k33hyfnd
 pZjmFNDhB+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="626949021"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 17 May 2021 22:45:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 22:45:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 22:45:03 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Mon, 17 May 2021 22:45:03 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Topic: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Index: AQHXRkJlkjlIGKft2U2cLif8N5l39qreigIAgAA0UeCAAR7tAIAAcFhggAL10ACABSHcUA==
Date: Tue, 18 May 2021 05:45:03 +0000
Message-ID: <9725d763e1474713adf5021a87df26a2@intel.com>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
 <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
 <8dc2bbd037964224bcc6609fd47b5698@intel.com>
 <20210512064410.infyhtac2bc35xr4@sirius.home.kraxel.org>
 <2ce75952e24349e5a787919a55169779@intel.com>
 <20210514103834.vvfgjvfnc2hphr4f@sirius.home.kraxel.org>
In-Reply-To: <20210514103834.vvfgjvfnc2hphr4f@sirius.home.kraxel.org>
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

> > [Kasireddy, Vivek] Correct, that is exactly what I want -- make the Gue=
st wait
> > until it gets notified that the Host is completely done processing/usin=
g the fb.
> > However, there can be two resources the guest can be made to wait on: w=
ait for
> > the new/current fb that is being submitted to be processed (explicit fl=
ush)
>=20
> That would be wait on resource_flush case, right?
[Kasireddy, Vivek] Yes, correct.

>=20
> > or wait for the previous fb that was submitted earlier (in the
> > previous repaint cycle) to be processed (explicit sync).
>=20
> That would be the wait on set_scanout case, right?
[Kasireddy, Vivek] Right.

>=20
> And it would effectively wait on the previous fb not being needed by the
> host any more (because the page-flip to the new fb completed) so the
> guest can re-use the previous fb to render the next frame, right?
[Kasireddy, Vivek] Yup.

>=20
> (also when doing front-buffer rendering with xorg/fbcon and then doing a
> virtual console switch the guest could wait for the console switch being
> completed).
>=20
> > IIUC, Explicit sync only makes sense if 1) the Host windowing system al=
so supports
> > that feature/protocol (currently only upstream Weston does but I'd like=
 to add it to
> > Mutter if no one else does) or if there is a way to figure out (dma-buf=
 sync file?) if
> > the Host has completely processed the fb and 2) if Qemu UI is not doing=
 a blit and
> > instead submitting the guest fb/dmabuf directly to the Host windowing s=
ystem.
> > As you are aware, 2) can possibly be done with dbus/pipewire Qemu UI ba=
ckends
> > (I'll explore this soon) but not with GTK or SDL.
>=20
> Well, I think we need to clearly define the wait flag semantics.=20
[Kasireddy, Vivek] At-least with our passthrough use-case (maybe not with V=
irgl),
I think we need to ensure the following criteria:
1) With Blobs, ensure that the Guest and Host would never use the dmabuf/FB=
 at
the same time.=20
2) The Guest should not render more frames than the refresh rate of the Hos=
t so
that GPU resources are not wasted.

> Should resource_flush with wait flag wait until the host is done reading =
the
> resource (blit done)?
[Kasireddy, Vivek] I started with this but did not find it useful as it did=
 not meet
2) above. However, I think we could have a flag for this if the Guest is us=
ing a
virtual vblank/timer and only wants to wait until the blit is done.

> Or should it wait until the host screen has been
> updated (gtk draw callback completed)?
[Kasireddy, Vivek] This is what the last 7 patches of my Blob series (v3) d=
o. So,
we'd want to have a separate flag for this as well. And, lastly, we are goi=
ng to
need another flag for the set_scanout case where we wait for the previous
fb to be synchronized.

>=20
> Everything else will be a host/guest implementation detail then, and
> of course this needs some integration with the UI on the host side and
> different UIs might have to do different things.
[Kasireddy, Vivek] Sure, I think we can start with GTK and go from there.

>=20
> On the guest side integrating this with fences will give us enough
> flexibility on how we want handle the waits.  Simplest would be to just
> block.=20
[Kasireddy, Vivek] I agree; simply blocking (dma_fence_wait) is more than
enough for most use-cases.

>We could implement virtual vblanks, which would probably make
> most userspace work fine without explicit virtio-gpu support.  If needed
> we could even give userspace access to the fence so it can choose how to
> wait.
[Kasireddy, Vivek] Virtual vblanks is not a bad idea but I think blocking w=
ith
fences in the Guest kernel space seems more simpler. And, sharing fences wi=
th
the Guest compositor is also very interesting but I suspect we might need t=
o
modify the compositor for this use-case, which might be a non-starter. Last=
ly,
even with virtual vblanks, we still need to make sure that we meet the two
criteria mentioned above.=20

Thanks,
Vivek

