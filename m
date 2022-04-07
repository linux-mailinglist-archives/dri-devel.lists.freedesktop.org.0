Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E844F80DA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDA610E3CB;
	Thu,  7 Apr 2022 13:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6783110E3CB;
 Thu,  7 Apr 2022 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649338850; x=1680874850;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Ed54NXbJJI7Rw4e9sYio4n1il0ylHLWLAnh/F3tjv5k=;
 b=XC/JSpQRnlozXeC3iX0ddttIT13KzRcnyPSEJNOslMAhJcF9IzSb6zrN
 k3AeKNd5uNIsxtglpnduQQz572Pl9/FUokErebVJCfV22W6FNTxzCQJsk
 c36I7qeuXdJWOFluZNpY0X1aI2TnZghGEufststlZi8LtCD59vewYES94
 Nkl1mhtTBacVMkYlDR0/wgLB+chZIgn4pJJ4t8oCGI6+FJWVH93Wt+pea
 C2ltIfvq2+i7AfjqFlykGhQe7kMJDvgFvVxycC2qDVljJ34TLWvKCJ9tn
 p1OgA4yLKSucPbeyY2FHW25b5TQAKbPFXYPMlBqjRMoGvrtza2H2lJLKk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10309"; a="258919953"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
 d="asc'?scan'208";a="258919953"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 06:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
 d="asc'?scan'208";a="571055512"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga008.jf.intel.com with ESMTP; 07 Apr 2022 06:40:46 -0700
Date: Thu, 7 Apr 2022 21:20:54 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Message-ID: <20220407132054.GJ1089@zhen-hp.sh.intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Content-Disposition: inline
In-Reply-To: <20220407071945.72148-2-zhi.a.wang@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.04.07 03:19:43 -0400, Zhi Wang wrote:
> From: Zhi Wang <zhi.a.wang@gmail.com>
>=20
> To support the new mdev interfaces and the re-factor patches from
> Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
> MMIO tracking table needs to be separated from GVT-g.
>

Looks fine to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYk7lLAAKCRCxBBozTXgY
J6juAJ4/fE3Ex93O/3BhoMK0jebj1njtVwCfXDscbKT5PuPP5NWW0hwjYVTpv44=
=VtR0
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
