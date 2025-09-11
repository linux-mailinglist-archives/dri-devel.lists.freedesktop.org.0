Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F48B52DAA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D23A10E07E;
	Thu, 11 Sep 2025 09:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c+TuKd/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0710E07E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:50:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 210D160208;
 Thu, 11 Sep 2025 09:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A10C4CEF0;
 Thu, 11 Sep 2025 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757584231;
 bh=pE2AURsoCMkJTm1mo4lJL7qjrrJQ0/YmWX+SwCL5yw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+TuKd/PMZh9aE4lEy42hRVmlu5OM/5HD2vW1Hw8oMLhPuBINeJxUp9cuelnQcIj7
 uTFPQHYDVcYhMvfgtzRTfr1mAsH+i/b2nl7VfDYOZOMd1NEY2ywcKyEh/YwUJt+gxP
 cDzIM4qACVbgz067zS8aYhYQu+Kz868eSGDFjgglP1H7rt+s0ZJdr5aPdGUiS7nFbN
 Af3GuOe0RjtE8nYTo2JdP1ohuzT1DNZ1nFIADJyHpkTArfHiiWJxR69WTZLitBZ/6z
 jrWt63k8UIFbQaYlaGgAOyoXBkMZflHF7Rc1dC6+GRNU50ch7st3cbUMdTRX59sMOR
 069Cq4N2yk5QQ==
Date: Thu, 11 Sep 2025 11:50:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Miguel Gazquez <miguel.gazquez@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com,
 kory.maincent@bootlin.com, 
 romain.gantois@bootlin.com, praneeth@ti.com, Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
Message-ID: <20250911-innocent-daffodil-macaque-797f13@houat>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
 <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
 <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jzouzmmvozrp6xum"
Content-Disposition: inline
In-Reply-To: <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
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


--jzouzmmvozrp6xum
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 10:51:06AM +0200, Miguel Gazquez wrote:
>=20
>=20
> Le 10/09/2025 =E0 04:28, Dmitry Baryshkov a =E9crit=A0:
> > On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrote:
> > > From: Aradhya Bhatia <a-bhatia1@ti.com>
> > >=20
> > > Add support for DRM connector and make the driver support the older
> > > format of attaching connectors onto the encoder->bridge->connector
> > > chain.
> > > This makes the driver compatible with display controller that only
> > > supports the old format.
> > >=20
> > > [Miguel Gazquez: Rebased + made driver work with or without
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR]
> >=20
> > What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNECTOR?
>=20
> Some display controller drivers (like the tilcdc) call drm_bridge_attach
> without DRM_BRIDGE_ATTACH_NO_CONNECTOR, so the bridge must support both w=
ith
> and without DRM_BRIDGE_ATTACH_NO_CONNECTOR to be compatible with all disp=
lay
> controllers.

I'd rather convert tilcdc to use DRM_BRIDGE_ATTACH_NO_CONNECTOR then.

Maxime

--jzouzmmvozrp6xum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMKbYQAKCRAnX84Zoj2+
dgJSAYDdU+th+2A0F5q6ZC2ooIL5tuW/KSkDnDvtGQFsorRAhoAZKfsPOUWeNRAJ
BYvVimEBf26l9rXHppvS+ufirPVemWVrWyLWv+CKfBIRlyFXVx8oq75VNyn21Thi
4ZkctmwVYw==
=CR9i
-----END PGP SIGNATURE-----

--jzouzmmvozrp6xum--
