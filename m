Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB3141129
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475096F8C1;
	Fri, 17 Jan 2020 18:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B1D6F8C1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:53:58 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A857D20748;
 Fri, 17 Jan 2020 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579287238;
 bh=Ggs4OoJBCkjO8db/zcQts4isiDP4L4RjiRCqQPSG+Do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ckG2ELRNQQm99wQbw8vq+wWoAinNuDS1uWRMdwoY5ePHou+8BHw2vcCMGKAUN8cnt
 ikesXAuWEmHyUoev/Hc57X+zKChsZEh63Awa/wgJpxIhjGk0jINT32oVj2AD4iR5S0
 DS12dDaoxUdkAKnoTs+vFOzj/HyePGibWABa1HNY=
Date: Fri, 17 Jan 2020 19:53:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/5] Add support for Pine64 PineTab
Message-ID: <20200117185355.wmu3so53whvtbnhx@gilmour.lan>
References: <20200116033636.512461-1-icenowy@aosc.io>
 <20200117185012.GC14298@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200117185012.GC14298@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0949807569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0949807569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p4f53y6km3ucx2zs"
Content-Disposition: inline


--p4f53y6km3ucx2zs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2020 at 07:50:12PM +0100, Sam Ravnborg wrote:
> Hi Icenowy
>
> On Thu, Jan 16, 2020 at 11:36:31AM +0800, Icenowy Zheng wrote:
> > This patchset tries to add support for the PineTab tablet from Pine64.
> >
> > As it uses a specific MIPI-DSI panel, the support of the panel should be
> > introduced first, with its DT binding.
> >
> > Then a device tree is added. Compared to v1 of the patchset, the
> > accelerometer support is temporarily removed because a DT binding is
> > lacked (although a proper driver exists).
> >
> > Icenowy Zheng (5):
> >   dt-bindings: vendor-prefix: add Shenzhen Feixin Photoelectics Co., Ltd
> >   dt-bindings: panel: add Feixin K101 IM2BA02 MIPI-DSI panel
> >   drm/panel: Add Feixin K101 IM2BA02 panel
> >   dt-bindings: arm: sunxi: add binding for PineTab tablet
> >   arm64: dts: allwinner: a64: add support for PineTab
>
> Thanks for the updates.
> I have applied the first three patches to drm-misc-next.
> The remaining two patches shall most likely go in via another tree.

queued the last two for 5.7, thanks!
Maxime

--p4f53y6km3ucx2zs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXiICwwAKCRDj7w1vZxhR
xZQcAQCabPKDVEHD7EEKVMSsoVVvXNcUSRxlLRN7UZEzxKP8/QD/TvXs63UOJH6/
6zRTD2fYEmgvB1Cr3YJC7JpuiB5qbgE=
=a6tO
-----END PGP SIGNATURE-----

--p4f53y6km3ucx2zs--

--===============0949807569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0949807569==--
