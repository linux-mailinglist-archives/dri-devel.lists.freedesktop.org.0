Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F543EE65A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 07:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9B6E102;
	Tue, 17 Aug 2021 05:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853226E0FF;
 Tue, 17 Aug 2021 05:44:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="279741496"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
 d="asc'?scan'208";a="279741496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 22:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
 d="asc'?scan'208";a="449142901"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2021 22:44:42 -0700
Date: Tue, 17 Aug 2021 13:22:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210817052203.GX13928@zhen-hp.sh.intel.com>
References: <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com>
 <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uIQsGlkY6qbVGkBB"
Content-Disposition: inline
In-Reply-To: <20210817010851.GW13928@zhen-hp.sh.intel.com>
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


--uIQsGlkY6qbVGkBB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.17 09:08:55 +0800, Zhenyu Wang wrote:
> On 2021.08.16 19:34:58 +0200, Christoph Hellwig wrote:
> > On Wed, Aug 04, 2021 at 01:26:06PM +0800, Zhenyu Wang wrote:
> > > On 2021.08.03 11:30:58 -0300, Jason Gunthorpe wrote:
> > > > On Tue, Aug 03, 2021 at 05:43:15PM +0800, Zhenyu Wang wrote:
> > > > > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > >=20
> > > > > Thanks a lot for this effort!
> > > >=20
> > > > Great, do we have a submission plan for this? how much does it clash
> > > > with my open_device/etc patch? ie does the whole thing have to go
> > > > through the vfio tree?
> > > >=20
> > >=20
> > > I think Alex would determine when to merge open_device series, gvt pa=
rt
> > > can be through vfio tree without problem. For this refactor, I would =
first
> > > merge for gvt staging to do more regression testing before sending th=
rough
> > > i915 tree.
> >=20
> > Any updates on this?  I'd really hate to miss this merge window.
>=20
> I'm still waiting for our validation team's report on this. I'm afraid
> it might be missing for next version as i915 merge window is mostly
> till rc5...and for any change outside of gvt, it still needs to be
> acked by i915 maintainers.

Looks our validation team did have problem against recent i915 change.
If you like to try, we have a gvt-staging branch on
https://github.com/intel/gvt-linux which is generated against drm-tip
with gvt changes for testing, currently it's broken.

One issue is with i915 export that intel_context_unpin has been
changed into static inline function. Another is that intel_gvt.c
should be part of i915 for gvt interface instead of depending on KVMGT
config.

But the problem I see is that after moving gvt device model (gvt/*.c
except kvmgt.c) into kvmgt module, we'll have issue with initial mmio
state which current gvt relies on, that is in design supposed to get
initial HW state before i915 driver has taken any operation.  Before
we can ensure that, I think we may only remove MPT part first but
still keep gvt device model as part of i915 with config. I'll try to
split that out.

--uIQsGlkY6qbVGkBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYRtHbwAKCRCxBBozTXgY
JyrQAJ92WESsBu++Qsz8cYKJinX8AC3VdACfYCC5M9toa7YrrolbmwD1kkmKZQ8=
=97Uw
-----END PGP SIGNATURE-----

--uIQsGlkY6qbVGkBB--
