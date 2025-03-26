Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167FA71A56
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B8010E6FE;
	Wed, 26 Mar 2025 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z5SOdSUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5D010E6FE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:31:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4460C43930;
 Wed, 26 Mar 2025 15:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB3CC4CEE2;
 Wed, 26 Mar 2025 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743003065;
 bh=Y4vFj9mdr7X7qQ6aExqVvI3fPQmFAtldVPv4Rkf19RM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5SOdSUXfhCwbKxTrWW8eUl2rJBc4qOkXyEII3R8KQF6pfJHDP1rdQSGxmRquhIsz
 c7kVHi/Qve23utzYR7Ux1j/2jHCb2SKM00cPy9ImYwQnfvBjYRAXPY7amnASbi3iQJ
 oKPik0gIgE4uPyC0OMhg4YhskKOKtxB+iDueoldW+DYUzkWq+g953BEOJfKOuJ5P0y
 WYjioRQJHIiCLZ+WBFx+1CQ7aQdLR05g7N9KGaarA11IqdFVGbO5IN/sWN2Myv6FHK
 rPJus8TPEh2C3PI2Ie57oKuMDm3PTkZ7mZEscMVX04hE4KSLjWVZDyX+JdXLmcV3ea
 0SW+ZYpJQ5tDg==
Date: Wed, 26 Mar 2025 16:31:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/5] drm/panel: get/put panel reference in
 drm_panel_add/remove()
Message-ID: <20250326-nondescript-imposing-termite-ef544a@houat>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-3-4e2bf5d19c5d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xljvre3piktzwusy"
Content-Disposition: inline
In-Reply-To: <20250325-b4-panel-refcounting-v1-3-4e2bf5d19c5d@redhat.com>
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


--xljvre3piktzwusy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] drm/panel: get/put panel reference in
 drm_panel_add/remove()
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 01:24:10PM -0400, Anusha Srivatsa wrote:
> Take the panel reference and put it back as required
> using the helpers introduced in previous patch.
> drm_panel_add() and drm_panel_remove()
> add a panel to the global registry and removes a panel
> respectively, use get() and put() helpers to keep up
> with refcounting.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

We should defer merging that patch until we have converted all the panel
drivers to the new allocation function.

Maxime

--xljvre3piktzwusy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+QdtgAKCRDj7w1vZxhR
xcgEAP4jVoYMoW1VilpZgQ3wYPe9tqKxZdppGc4ou9hkfMBOaAD7BXzeKqRh0ZbN
i3DeDx3A1kehMK0eKvQbxav62tLI+wY=
=kfDW
-----END PGP SIGNATURE-----

--xljvre3piktzwusy--
