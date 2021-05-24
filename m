Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397538F3E6
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 21:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4742A6E0B7;
	Mon, 24 May 2021 19:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC74A6E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 19:55:50 +0000 (UTC)
IronPort-SDR: XcQHqzsznzrt0Ko9j/E8VC6NYmO7BnKculh36oXFBGXIfuPR/0APc8np7ShfxPfmVx71NfA0EB
 BMh6WQhycAXg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="263226416"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="263226416"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 12:55:45 -0700
IronPort-SDR: 5wuHrl5PCMRm6gGdIP/QDuOkAizDtw78Zkw+m6UHm3+EnM1vcrqlEUbXKzwwXCAFOy9rmv4ajm
 rDSCnfGnno6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="546483737"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 24 May 2021 12:55:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 24 May 2021 12:55:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 24 May 2021 12:55:43 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Mon, 24 May 2021 12:55:43 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Topic: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Index: AQHXRkJlkjlIGKft2U2cLif8N5l39qreigIAgAA0UeCAAR7tAIAAcFhggAL10ACABSHcUIAKu3aw
Date: Mon, 24 May 2021 19:55:43 +0000
Message-ID: <6fcfd28560a246b0928fcd53f595d218@intel.com>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
 <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
 <8dc2bbd037964224bcc6609fd47b5698@intel.com>
 <20210512064410.infyhtac2bc35xr4@sirius.home.kraxel.org>
 <2ce75952e24349e5a787919a55169779@intel.com>
 <20210514103834.vvfgjvfnc2hphr4f@sirius.home.kraxel.org>
 <9725d763e1474713adf5021a87df26a2@intel.com>
In-Reply-To: <9725d763e1474713adf5021a87df26a2@intel.com>
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
Any further comments on this?

Thanks,
Vivek

>=20
> Hi Gerd,
>=20
> > > [Kasireddy, Vivek] Correct, that is exactly what I want -- make the
> > > Guest wait until it gets notified that the Host is completely done pr=
ocessing/using the
> fb.
> > > However, there can be two resources the guest can be made to wait
> > > on: wait for the new/current fb that is being submitted to be
> > > processed (explicit flush)
> >
> > That would be wait on resource_flush case, right?
> [Kasireddy, Vivek] Yes, correct.
>=20
> >
> > > or wait for the previous fb that was submitted earlier (in the
> > > previous repaint cycle) to be processed (explicit sync).
> >
> > That would be the wait on set_scanout case, right?
> [Kasireddy, Vivek] Right.
>=20
> >
> > And it would effectively wait on the previous fb not being needed by
> > the host any more (because the page-flip to the new fb completed) so
> > the guest can re-use the previous fb to render the next frame, right?
> [Kasireddy, Vivek] Yup.
>=20
> >
> > (also when doing front-buffer rendering with xorg/fbcon and then doing
> > a virtual console switch the guest could wait for the console switch
> > being completed).
> >
> > > IIUC, Explicit sync only makes sense if 1) the Host windowing system
> > > also supports that feature/protocol (currently only upstream Weston
> > > does but I'd like to add it to Mutter if no one else does) or if
> > > there is a way to figure out (dma-buf sync file?) if the Host has
> > > completely processed the fb and 2) if Qemu UI is not doing a blit and=
 instead
> submitting the guest fb/dmabuf directly to the Host windowing system.
> > > As you are aware, 2) can possibly be done with dbus/pipewire Qemu UI
> > > backends (I'll explore this soon) but not with GTK or SDL.
> >
> > Well, I think we need to clearly define the wait flag semantics.
> [Kasireddy, Vivek] At-least with our passthrough use-case (maybe not with=
 Virgl), I think
> we need to ensure the following criteria:
> 1) With Blobs, ensure that the Guest and Host would never use the dmabuf/=
FB at the same
> time.
> 2) The Guest should not render more frames than the refresh rate of the H=
ost so that GPU
> resources are not wasted.
>=20
> > Should resource_flush with wait flag wait until the host is done
> > reading the resource (blit done)?
> [Kasireddy, Vivek] I started with this but did not find it useful as it d=
id not meet
> 2) above. However, I think we could have a flag for this if the Guest is =
using a virtual
> vblank/timer and only wants to wait until the blit is done.
>=20
> > Or should it wait until the host screen has been updated (gtk draw
> > callback completed)?
> [Kasireddy, Vivek] This is what the last 7 patches of my Blob series (v3)=
 do. So, we'd want
> to have a separate flag for this as well. And, lastly, we are going to ne=
ed another flag for
> the set_scanout case where we wait for the previous fb to be synchronized=
.
>=20
> >
> > Everything else will be a host/guest implementation detail then, and
> > of course this needs some integration with the UI on the host side and
> > different UIs might have to do different things.
> [Kasireddy, Vivek] Sure, I think we can start with GTK and go from there.
>=20
> >
> > On the guest side integrating this with fences will give us enough
> > flexibility on how we want handle the waits.  Simplest would be to
> > just block.
> [Kasireddy, Vivek] I agree; simply blocking (dma_fence_wait) is more than=
 enough for
> most use-cases.
>=20
> >We could implement virtual vblanks, which would probably make  most
> >userspace work fine without explicit virtio-gpu support.  If needed  we
> >could even give userspace access to the fence so it can choose how to
> >wait.
> [Kasireddy, Vivek] Virtual vblanks is not a bad idea but I think blocking=
 with fences in the
> Guest kernel space seems more simpler. And, sharing fences with the Guest=
 compositor is
> also very interesting but I suspect we might need to modify the composito=
r for this use-
> case, which might be a non-starter. Lastly, even with virtual vblanks, we=
 still need to make
> sure that we meet the two criteria mentioned above.
>=20
> Thanks,
> Vivek

