Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63621A71A63
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46F910E6FF;
	Wed, 26 Mar 2025 15:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RriZcuFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E1010E6FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:32:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01D6C61145;
 Wed, 26 Mar 2025 15:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2593DC4CEE2;
 Wed, 26 Mar 2025 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743003151;
 bh=SPxu0Io7cx5liXuAr8Xi+OAnanZNKgiFPCAgw/m0XBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RriZcuFozA+6QY0rYZQajMOGCFMyzsBT1xUrHVw7tHBRWOhu+WqmKx15XlXLodKOt
 i3++BC6wcOmNRYZ2kf1sbJ3UgWQl4d6Wvxi0CN9NIXCtollhGB7urmdNqyAdQkAr+Z
 359fT6wBxBUldjuwdHtyVWtNUELDSUmyEHhuInCL/dKWik1wR0ClMfwSubZIAzYp4p
 2x8eoIpPOlRON/2fVGfAQnU/8nRaGqOqzPEdVrGKolvD9fwUz1GHSP6YpM+MsRiPsf
 dpvJk33x8erFxRgGLD2II05q4E0htyzvJrjL6VLwtNcSuiNh09sdW4STOLed+8UIUB
 huKnne7Z68ytg==
Date: Wed, 26 Mar 2025 16:32:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/5] drm/panel: deprecate old-style panel allocation
Message-ID: <20250326-deft-vegan-stoat-ff14ff@houat>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-4-4e2bf5d19c5d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5ozty4m4m7wvakqd"
Content-Disposition: inline
In-Reply-To: <20250325-b4-panel-refcounting-v1-4-4e2bf5d19c5d@redhat.com>
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


--5ozty4m4m7wvakqd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] drm/panel: deprecate old-style panel allocation
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 01:24:11PM -0400, Anusha Srivatsa wrote:
> Start moving to the new refcounted allocations using
> the new API devm_drm_panel_alloc(). Deprecate any other
> allocation.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 11a0415bc61f59190ef5eb378d1583c493265e6a..5793011f4938a2d4fb9d84a70=
0817bda317af305 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -74,8 +74,10 @@ EXPORT_SYMBOL(drm_panel_init);
>   * drm_panel_add - add a panel to the global registry
>   * @panel: panel to add
>   *
> - * Add a panel to the global registry so that it can be looked up by dis=
play
> - * drivers.
> + * Add a panel to the global registry so that it can be looked
> + * up by display drivers. The panel to be added must have been
> + * allocated by devm_drm_panel_alloc(). Old-style allocation by
> + * kzalloc(), devm_kzalloc() and similar is deprecated.

It's not that it's deprecated, it's that it's unsafe. Since you already
said that the allocation must be done through devm_drm_panel_alloc(),
there's not much use to mention the old style stuff, I'd just drop the
last sentence.

Maxime

--5ozty4m4m7wvakqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+QeDAAKCRDj7w1vZxhR
xXTHAQCc+DC/5rdeBP/uekSpO7skP6d+j8o6RjjWhw/KxNkDSwEApCzCZMZTIZ5e
yLjpLaIpTIXpA3IMrUaV2mCS5wP5Hw0=
=mCCS
-----END PGP SIGNATURE-----

--5ozty4m4m7wvakqd--
