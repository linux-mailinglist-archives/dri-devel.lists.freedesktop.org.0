Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7919713EA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEF710E357;
	Mon,  9 Sep 2024 09:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="U1ctQX5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC01E10E357
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:36:30 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1725874588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ac7MnXk0+4OmEaGl+o2m4y/0M5iH7c+3GKkl4Qy3D8A=;
 b=U1ctQX5eIeSZpzL1FGOk+YNq1zfqhAuIOYZnZk4KkZeMNWuidAVb0ZgcLHt3miY80lhy3h
 N2+P20Z6umpmoxsROgk+CpQp0Ti6yzJWVcaQbzXjVYPTlE76xnPUMHDNsBIOnA4EOMdbTi
 THbjO7xFXzRxHPYbD5S2Qe+nEbWOYAoFn1zgj2mtmpyF9m491GZOCkH+3zHw4BwCGQmx05
 ox/AUJvJnH4OulTrG+t2f/zonHSyo2pjhgY5h97NVrxiXw3t55o7lLDK1MzF8jFQbkN3d1
 xctqBIVEWLNbfql6B43xP4nZe3k8Df2lsVV7vTOfxG+D3sdTzI6kx9lffNlERA==
Content-Type: multipart/signed;
 boundary=8c1b658f7c448cb5c0b613f89153b15bab673f392c82b551568fd1d1d6ee;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 09 Sep 2024 11:36:14 +0200
Message-Id: <D41NH5VO0A7T.26F04WDY1UTCR@cknow.org>
Cc: <detlev.casanova@collabora.com>, <heiko@sntech.de>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <hjc@rock-chips.com>, <mripard@kernel.org>,
 <sebastian.reichel@collabora.com>, <linux-rockchip@lists.infradead.org>,
 <sjoerd@collabora.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 <krzk+dt@kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/rockchip: vop2: Introduce vop hardware
 version
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sascha Hauer" <s.hauer@pengutronix.de>, "Andy Yan" <andyshrk@163.com>
References: <20240904120238.3856782-1-andyshrk@163.com>
 <20240904120238.3856782-6-andyshrk@163.com>
 <ZtlZgKcDQFF_WnCn@pengutronix.de>
 <2326e2ea.8264.191c13bab93.Coremail.andyshrk@163.com>
 <Zt68U6hnPA0KrxXB@pengutronix.de>
In-Reply-To: <Zt68U6hnPA0KrxXB@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
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

--8c1b658f7c448cb5c0b613f89153b15bab673f392c82b551568fd1d1d6ee
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 9, 2024 at 11:13 AM CEST, Sascha Hauer wrote:
> On Thu, Sep 05, 2024 at 04:09:58PM +0800, Andy Yan wrote:
> >  At 2024-09-05 15:10:56, "Sascha Hauer" <s.hauer@pengutronix.de> wrote:
> >  >On Wed, Sep 04, 2024 at 08:02:32PM +0800, Andy Yan wrote:
> >  >> From: Andy Yan <andy.yan@rock-chips.com>
> >  >>
> >  >> There is a version number hardcoded in the VOP VERSION_INFO
> >  >> register, and the version number increments sequentially based
> >  >> on the production order of the SOC.
> >  >>
> >  >> So using this version number to distinguish different VOP features
> >  >> will simplify the code.
> >  >>
> >  >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >  >>
> >  >> ---
> >  >>
> >  >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers=
/gpu/drm/rockchip/rockchip_drm_vop2.h
> >  >> index 9b269f6e576e..871d9bcd1d80 100644
> >  >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> >  >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> >  >> @@ -13,6 +13,15 @@
> >  >>  #include "rockchip_drm_drv.h"
> >  >>  #include "rockchip_drm_vop.h"
> >  >>
> >  >> +#define VOP2_VERSION(major, minor, build)     ((major) << 24 | (mi=
nor) << 16 | (build))
> >  >> +
> >  >> +/* The new SOC VOP version is bigger than the old */
> >  >> +#define VOP_VERSION_RK3568    VOP2_VERSION(0x40, 0x15, 0x8023)
> >  >> +#define VOP_VERSION_RK3588    VOP2_VERSION(0x40, 0x17, 0x6786)
> >  >> +#define VOP_VERSION_RK3528    VOP2_VERSION(0x50, 0x17, 0x1263)
> >  >> +#define VOP_VERSION_RK3562    VOP2_VERSION(0x50, 0x17, 0x4350)
> >  >> +#define VOP_VERSION_RK3576    VOP2_VERSION(0x50, 0x19, 0x9765)
> >  >
> >  >What about the RK3566? Does it have the same version code as the RK35=
68?
> >  >
> >  >This new version field replaces the soc_id mechanism we had before to
> >  >99%. You keep the soc_id around just for distinguishing between RK356=
6
> >  >and RK3568. It would be nice to fully replace it.
> >  >
> >  >I see that the VOP_VERSION_RK* numbers are the same as found in the
> >  >VOP2_SYS_VERSION_INF registers. On the other hand you never read the
> >  >value from the register which make the VOP_VERSION_RK* just arbitrary
> >  >numbers. Wouldn't it be possible to make something up for RK3566, lik=
e
> >  >VOP2_VERSION(0x40, 0x15, 0x8022) to get rid of the soc_id thingy?
> >  Yes=EF=BC=8CRK3566 and RK3568 share the same VOP IP block=EF=BC=8C so =
the version code at VERSION_REGISTER is
> >  the same, the difference between rk3568 and rk33566 are introduced at =
soc Integration=E3=80=82
> >  So i would still like to keep the soc_id to  handle situation like thi=
s=E3=80=82As we always have such  cause=EF=BC=8C one
> >  same IP block=EF=BC=8C but there are some subtle differences in featur=
es across different SOCs.
>
> Fine with me. You could leave a comment in the code or commit
> message that explains why we need both.

Also (or especially?) add that to the commit message of patch 6 of this
series. Patch 6's commit message talks about RK3576 while it changes
code related to RK3566 and I (too?) thought that not using VOP_VERSION
was an oversight, while it turns out to be deliberate.

Cheers,
  Diederik

--8c1b658f7c448cb5c0b613f89153b15bab673f392c82b551568fd1d1d6ee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZt7BlQAKCRDXblvOeH7b
bjNCAQD75I99I8eQyeyxfrEV5TDf/AH75sfVSERvC4tYJYmhUQEAzK6ErqvvskFA
GFfJz2HXP1a+zRS/z7wpv3XGdG83eQ4=
=9uHr
-----END PGP SIGNATURE-----

--8c1b658f7c448cb5c0b613f89153b15bab673f392c82b551568fd1d1d6ee--
