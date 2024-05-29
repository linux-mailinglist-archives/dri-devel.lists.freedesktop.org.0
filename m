Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B638D3B9D
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 18:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8945A113EB1;
	Wed, 29 May 2024 16:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="eM4NCV4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Wed, 29 May 2024 16:01:32 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33373113EBA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:01:32 +0000 (UTC)
X-Envelope-To: andyshrk@163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1716998143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4v4JxLcVLd8gWkKTMWCIwey80lFqT9gw7qVAp737Dzg=;
 b=eM4NCV4dS8iSwN/mOl5uzlsEI1LjYgeCgfecjsWoyo3XXG8yFFz3DVfV7jdPbn17iu7gSi
 OdUK3Gcy58sPhOhc274/8+ybpTz9LTNiBSFy7DxkRogyT5zvsAbpx00b2EgfIyM5Lmlabj
 tJFQALmxUD2R/VvbaX2jGYyyqo0bijRCJfjqCawV2B+khyJFolrhDVt7yE5LOAI8JXtvXI
 eiRGXgW6DB3CPwynNORtxQPH+2PujPvtJ6Z91puigUlg9ZormsIIiRAf9xEabIqnp1Cmr1
 l9pLLuredi+4cWZzDPKINY+nV6Qa6dPfMaAcDmXm0+wh2B4rZ9tXBNPQ7sPy7g==
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: heiko@sntech.de
X-Envelope-To: mripard@kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: s.hauer@pengutronix.de
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: heiko@sntech.de
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, s.hauer@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/1] Fix the port mux of VP2
Date: Wed, 29 May 2024 17:55:25 +0200
Message-ID: <2397969.FhQbyb98Gs@bagend>
Organization: Connecting Knowledge
In-Reply-To: <171405838036.2897712.4067984796758491640.b4-ty@sntech.de>
References: <20240422101905.32703-1-andyshrk@163.com>
 <171405838036.2897712.4067984796758491640.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7320409.ZChHLWW2r3";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart7320409.ZChHLWW2r3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/1] Fix the port mux of VP2
Date: Wed, 29 May 2024 17:55:25 +0200
Message-ID: <2397969.FhQbyb98Gs@bagend>
Organization: Connecting Knowledge
MIME-Version: 1.0

On Thursday, 25 April 2024 17:19:58 CEST Heiko Stuebner wrote:
> On Mon, 22 Apr 2024 18:19:04 +0800, Andy Yan wrote:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > The port mux bits of VP2 should be defined by
> > RK3568_OVL_PORT_SET__PORT2_MUX, this maybe a copy and paste error when
> > this driver first introduced.> 
> > Hi Heiko:
> >    Maybe thi is the problem you met when you porting the dsi2 driver.
> > 
> 
> Applied, thanks!
> 
> [1/1] drm/rockchip: vop2: Fix the port mux of VP2
>       commit: 2bdb481bf7a93c22b9fea8daefa2834aab23a70f

Wasn't this patch supposed to be part of 6.10-rc1?
--nextPart7320409.ZChHLWW2r3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZldP7QAKCRDXblvOeH7b
btUeAQC4sSMaBwRDiexmeDgGbIxjwMuMYE0XHbgLjJI+tvfh9QD/R83eqtzCIjKM
dqgg+qGOUYmVLyE8XIDN42D5ZijcDQY=
=uCK0
-----END PGP SIGNATURE-----

--nextPart7320409.ZChHLWW2r3--



