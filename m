Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C13DAB66
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 20:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEAE6EE1E;
	Thu, 29 Jul 2021 18:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374076EE1E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:53:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212679459"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="212679459"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 11:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="476515452"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2021 11:53:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 11:53:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 11:53:44 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Thu, 29 Jul 2021 11:53:44 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v1 2/4] virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
Thread-Topic: [RFC v1 2/4] virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
Thread-Index: AQHXhFPnb9rpKvlN0Eut27TVkUFkUKtaKwmAgAAfXWA=
Date: Thu, 29 Jul 2021 18:53:44 +0000
Message-ID: <6ffb3ea1b5e94af1af04b3c133c7e45f@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <20210729081659.2255499-3-vivek.kasireddy@intel.com>
 <20210729095033.js2i6bjk27itcvhg@sirius.home.kraxel.org>
In-Reply-To: <20210729095033.js2i6bjk27itcvhg@sirius.home.kraxel.org>
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

>=20
> On Thu, Jul 29, 2021 at 01:16:57AM -0700, Vivek Kasireddy wrote:
> > This feature enables the Guest to wait to know when a resource
> > is completely consumed by the Host.
>=20
> virtio spec update?
>=20
> What are the exact semantics?
[Kasireddy, Vivek] As of now, this is still a RFC version. If everyone (Wes=
ton
Upstream, drm upstream and you) agree that this is a reasonable way to
solve https://gitlab.freedesktop.org/wayland/weston/-/issues/514 then I'd g=
o=20
ahead and send out the spec updates and cleaner versions of these patches -=
-
with more documentation.

>=20
> Why a new command?  Can't you simply fence one of the commands sent
> anyway (set_scanout probably for page-flip updates)?
[Kasireddy, Vivek] Yes, I think I could add a fence (and an out_fence) to s=
et-scanout-blob.=20

>=20
> (feature flag is probably needed even in case we don't need a new
> command to make sure the host sends the completion when processing
> the command is actually done, i.e. in case of qemu the recently added
> fence support is there).
[Kasireddy, Vivek] The recently added fence support was for resource_flush =
and
specifically for GTK-UI or similar backends. I tried using the same mechani=
sm for
Wayland-UI backend but ran into the above Weston issue. This feature (OUT_F=
ENCE)
is a potential solution for this issue.

Thanks,
Vivek
>=20
> take care,
>   Gerd

