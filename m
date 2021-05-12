Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FA437D465
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 23:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A416E093;
	Wed, 12 May 2021 21:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129696E093
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 21:18:41 +0000 (UTC)
IronPort-SDR: iP7oYhIO+7nzCoF2wPQ5B7Ljrp3tjvDwAjq06ea9MkFDNgcGv2O/Qdg+nTPSJALAUzo4o4CRVQ
 gTQqY7Zn6tJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="220789219"
X-IronPort-AV: E=Sophos;i="5.82,295,1613462400"; d="scan'208";a="220789219"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 14:18:40 -0700
IronPort-SDR: jTOP5j/bt+kM61AZPDT8AY/t9ByWHUiZed01Wv7cQdSouqrErDC4cbGMnT4DPSYwVqS/5H/UXM
 hLLT/YZRdpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,295,1613462400"; d="scan'208";a="409397361"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 12 May 2021 14:18:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 14:18:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 14:18:38 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Wed, 12 May 2021 14:18:38 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Topic: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Thread-Index: AQHXRkJlkjlIGKft2U2cLif8N5l39qreigIAgAA0UeCAAR7tAIAAcFhg
Date: Wed, 12 May 2021 21:18:37 +0000
Message-ID: <2ce75952e24349e5a787919a55169779@intel.com>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
 <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
 <8dc2bbd037964224bcc6609fd47b5698@intel.com>
 <20210512064410.infyhtac2bc35xr4@sirius.home.kraxel.org>
In-Reply-To: <20210512064410.infyhtac2bc35xr4@sirius.home.kraxel.org>
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

> > However, as part of this feature (explicit flush), I'd like to make the=
 Guest wait until
> > the current resource (as specified by resource_flush or set_scanout) is=
 flushed or
> > synchronized. But for a different feature I am thinking of (explicit sy=
nc), I'd like to
> > make the Guest wait for the previous buffer/resource submitted (availab=
le via
> > old_state->fb).
>=20
> For page-flipping I guess?  i.e. you want submit a new framebuffer, then
> wait until the host doesn't need the previous one?  That is likewise
> linked to a command, although it is set_scanout this time.
[Kasireddy, Vivek] Mainly for page-flipping but I'd also like to have fbcon=
, Xorg that
do frontbuffer rendering/updates to work seamlessly as well.

>=20
> So, right now qemu simply queues the request and completes the command
> when a guest sends a resource_flush our set_scanout command.  You want
> be notified when the host is actually done processing the request.
[Kasireddy, Vivek] Correct, that is exactly what I want -- make the Guest w=
ait
until it gets notified that the Host is completely done processing/using th=
e fb.
However, there can be two resources the guest can be made to wait on: wait =
for
the new/current fb that is being submitted to be processed (explicit flush)=
 or wait
for the previous fb that was submitted earlier (in the previous repaint cyc=
le)
to be processed (explicit sync).

IIUC, Explicit sync only makes sense if 1) the Host windowing system also s=
upports
that feature/protocol (currently only upstream Weston does but I'd like to =
add it to
Mutter if no one else does) or if there is a way to figure out (dma-buf syn=
c file?) if
the Host has completely processed the fb and 2) if Qemu UI is not doing a b=
lit and
instead submitting the guest fb/dmabuf directly to the Host windowing syste=
m.
As you are aware, 2) can possibly be done with dbus/pipewire Qemu UI backen=
ds
(I'll explore this soon) but not with GTK or SDL.=20

Ideally, I'd like to have Explicit sync but until 2) above happens, Explici=
t flush can
be a reasonable alternative given the blit that happens with GTK/SDL backen=
ds.=20
By making the Guest wait until the UI has submitted the buffer to the Host=
=20
windowing system, we can theoretically tie the Guest repaint freq to the Ho=
st
vblank and thus have Guest apps render at 60 FPS by default instead of 90 F=
PS
that I see without expflush. This feature would also help Windows guests th=
at
can only do frontbuffer rendering with Blobs.

>=20
> I still think it makes sense extend the resource_flush and set_scanout
> commands for that, for example by adding a flag for the flags field in
> the request header.  That way it is clear what exactly you are waiting
> for.  You can also attach a fence to the request which you can later
> wait on.
[Kasireddy, Vivek] Yeah, I am reluctant to add a new cmd as well but I want
it to work for all Guests and Hosts. Anyway, let me try your idea of adding
specific flags and see if it works.

Thanks,
Vivek

>=20
> take care,
>   Gerd

