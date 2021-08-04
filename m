Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFAB3DFB3F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 07:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82B6E9C8;
	Wed,  4 Aug 2021 05:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A75D6E9C2;
 Wed,  4 Aug 2021 05:48:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="201040672"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
 d="asc'?scan'208";a="201040672"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 22:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
 d="asc'?scan'208";a="479969434"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2021 22:48:14 -0700
Date: Wed, 4 Aug 2021 13:26:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210804052606.GG13928@zhen-hp.sh.intel.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="1SVgZ+3xbDF9VW5n"
Content-Disposition: inline
In-Reply-To: <20210803143058.GA1721383@nvidia.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1SVgZ+3xbDF9VW5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.03 11:30:58 -0300, Jason Gunthorpe wrote:
> On Tue, Aug 03, 2021 at 05:43:15PM +0800, Zhenyu Wang wrote:
> > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> >=20
> > Thanks a lot for this effort!
>=20
> Great, do we have a submission plan for this? how much does it clash
> with my open_device/etc patch? ie does the whole thing have to go
> through the vfio tree?
>=20

I think Alex would determine when to merge open_device series, gvt part
can be through vfio tree without problem. For this refactor, I would first
merge for gvt staging to do more regression testing before sending through
i915 tree.

Thanks

--1SVgZ+3xbDF9VW5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYQok3wAKCRCxBBozTXgY
J5caAJ40TmBXSY9oMyHAvup4EhMUzcv+fACgkIVPVmaSfgOPAjUn4UZv/iNQst0=
=tcld
-----END PGP SIGNATURE-----

--1SVgZ+3xbDF9VW5n--
