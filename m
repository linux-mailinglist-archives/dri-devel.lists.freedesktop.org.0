Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9E9F53F7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530310E428;
	Tue, 17 Dec 2024 17:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OJbB4Giy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA14B10E141;
 Tue, 17 Dec 2024 17:34:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4FB15A41EDC;
 Tue, 17 Dec 2024 17:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B153C4CED3;
 Tue, 17 Dec 2024 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734456875;
 bh=dbq7HRtwAuOWYe5ZaidZLWtsSdiMIrwx4jElfMk2ARE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJbB4Giyw0ORE0BgfGD0ZHSRO0iXESRcAdMzAJbq1KRFw/D+h6giknSBbW9GdwRso
 WxuRcExuLtBeKI4cQVwz+paA5r52feGdpc1dQU48wdmf236bVp9hh9KL+9m5/ftKlc
 wkoaVbxCwcFZDqh88tLzPeplCe4+FDMB598RmX9B6varI4UZZxcLynAsFcTSybsohV
 rruP1bt9ZfFt9ikxp88w36+P43T9qvYgat6Uf8g+I+hycmDWXTpOuU5lUisSNuZlqj
 TfgQufN0v5eVKHYlEVccRN0TvqRjkRMZZfY9357Wt+LKBqFfhPYAzWDfP4lgaiMmnA
 mANNfZWT7krlw==
Date: Tue, 17 Dec 2024 18:34:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org, 
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
Message-ID: <20241217-marigold-cat-of-influence-64bcfa@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
 <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
 <20241213-gentle-glittering-salamander-22addf@houat>
 <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
 <20241217-meek-bullfinch-of-luck-2c3468@houat>
 <a69a3500-be17-4899-bdb9-c6a63bf8dc81@lankhorst.se>
 <Z2GwpOQDVshpv-ml@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="c6tq2wqscpnuxkrk"
Content-Disposition: inline
In-Reply-To: <Z2GwpOQDVshpv-ml@slm.duckdns.org>
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


--c6tq2wqscpnuxkrk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 07:11:00AM -1000, Tejun Heo wrote:
> On Tue, Dec 17, 2024 at 03:28:50PM +0100, Maarten Lankhorst wrote:
> > Now that all patches look good, what is needed to merge the series? Wit=
hout
> > patch 6/7 as it is a hack for testing.
>=20
> There were some questions raised about device naming. One thing we want to
> get right from the beginning is the basic interface.

We decided on the previous version to use dmem and I believe this
version has switched to it. Do you have any concern still?

Maxime

--c6tq2wqscpnuxkrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2G2KAAKCRAnX84Zoj2+
dhcUAYDu7JUd06yF9dtpAtSY2xgUUyKiBfittjG2LbIT1/c9CnioooqRQDaKdWa2
o3i7wn4BgIG6Ni/zuzXo1ifLLIxisPArPduBae8x5MlNmXKB8A3GnNvPKtItE9PR
FXyNEY9XAg==
=mI6D
-----END PGP SIGNATURE-----

--c6tq2wqscpnuxkrk--
