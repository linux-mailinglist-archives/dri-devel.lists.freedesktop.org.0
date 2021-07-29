Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB83DAB70
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 20:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FFE6EE23;
	Thu, 29 Jul 2021 18:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C606EE23
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:55:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212990844"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="212990844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 11:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="518396928"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2021 11:55:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 29 Jul 2021 11:55:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 11:55:50 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Thu, 29 Jul 2021 11:55:50 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v1 4/4] drm/virtio: Probe and implement
 VIRTIO_GPU_F_OUT_FENCE feature
Thread-Topic: [RFC v1 4/4] drm/virtio: Probe and implement
 VIRTIO_GPU_F_OUT_FENCE feature
Thread-Index: AQHXhFPnf4WPYuIB7UWJ+g+lFyoJ86taK4OAgAAh95A=
Date: Thu, 29 Jul 2021 18:55:50 +0000
Message-ID: <764ddf2671c847e4b571bebbadf144c1@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <20210729081659.2255499-5-vivek.kasireddy@intel.com>
 <20210729095215.ojuojvherbossnhj@sirius.home.kraxel.org>
In-Reply-To: <20210729095215.ojuojvherbossnhj@sirius.home.kraxel.org>
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
>   Hi,
>=20
> > +	bool has_out_fence;
>=20
> > +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_OUT_FENCE)) {
> > +		vgdev->has_out_fence =3D true;
> > +		vgdev->ddev->mode_config.deferred_out_fence =3D true;
>=20
> Looks like you don't need has_out_fence, you can just use
> vgdev->ddev->mode_config.deferred_out_fence instead.
[Kasireddy, Vivek] Right, I don't need has_out_fence; will fix it.

Thanks,
Vivek
>=20
> take care,
>   Gerd

