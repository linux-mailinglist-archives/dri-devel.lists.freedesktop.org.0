Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7CA10C8E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF410E010;
	Tue, 14 Jan 2025 16:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kSRTHb6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1A10E010
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:43:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EC449A418BD;
 Tue, 14 Jan 2025 16:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39128C4CEDD;
 Tue, 14 Jan 2025 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736872989;
 bh=Wxrr8MzmIgzc3LZ8ucJjauFZHGuWbnWzhBk89J+5b/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kSRTHb6kwjJI9cS5qVPKxZyM5UhoJmd+mWjQf50YaXXXpeaa3Mg0A9AumoIwwUWL1
 yCIDMqiHwdXBm4hsvrd2vywGAdaXgfUFsDl6Sbrl4LpSsy5rz3XSt7iZovTP5RTxET
 OBD3rcyPsSSzwSkeLgUqraVViKVu1f3lcM2bi5UuUjJzMepY+hDgladYhvYqhJ2Whi
 ddZ18dXBwYzMZs/z1qAgXrqKEUDB3mbahNNtnsV+FdomdC5AZRKBOJpDLWlbMEZWMT
 /kjWatC+JStwZkOe31ai357uWOHCvFBVH/OX/7SbJXEkbWEJfXu17Jv+B+fjKbe7+2
 MfHFDeFdY/SHg==
Date: Tue, 14 Jan 2025 17:43:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <20250114-hypersonic-amiable-seagull-2d9f8d@houat>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
 <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
 <4518320e-4699-4026-adbe-b28514bde544@ideasonboard.com>
 <4d2bf1a9-37d8-4f9e-b855-b372179258f2@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uydoytvsz2kxjpgk"
Content-Disposition: inline
In-Reply-To: <4d2bf1a9-37d8-4f9e-b855-b372179258f2@linux.dev>
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


--uydoytvsz2kxjpgk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
MIME-Version: 1.0

On Tue, Jan 14, 2025 at 10:05:56PM +0530, Aradhya Bhatia wrote:
>=20
>=20
> On 1/14/25 18:34, Tomi Valkeinen wrote:
> > Hi,
> >=20
> > On 14/01/2025 13:24, Dmitry Baryshkov wrote:
> >> On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
> >>> Move the bridge pre_enable call before crtc enable, and the bridge
> >>> post_disable call after the crtc disable.
> >>>
> >>> The sequence of enable after this patch will look like:
> >>>
> >>> =A0=A0=A0=A0bridge[n]_pre_enable
> >>> =A0=A0=A0=A0...
> >>> =A0=A0=A0=A0bridge[1]_pre_enable
> >>>
> >>> =A0=A0=A0=A0crtc_enable
> >>> =A0=A0=A0=A0encoder_enable
> >>>
> >>> =A0=A0=A0=A0bridge[1]_enable
> >>> =A0=A0=A0=A0...
> >>> =A0=A0=A0=A0bridge[n]_enable
> >>>
> >>> And, the disable sequence for the display pipeline will look like:
> >>>
> >>> =A0=A0=A0=A0bridge[n]_disable
> >>> =A0=A0=A0=A0...
> >>> =A0=A0=A0=A0bridge[1]_disable
> >>>
> >>> =A0=A0=A0=A0encoder_disable
> >>> =A0=A0=A0=A0crtc_disable
> >>>
> >>> =A0=A0=A0=A0bridge[1]_post_disable
> >>> =A0=A0=A0=A0...
> >>> =A0=A0=A0=A0bridge[n]_post_disable
> >>>
> >>> The definition of bridge pre_enable hook says that,
> >>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> >>> will not yet be running when this callback is called".
> >>>
> >>> Since CRTC is also a source feeding the bridge, it should not be enab=
led
> >>> before the bridges in the pipeline are pre_enabled. Fix that by
> >>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> >>
> >> The patch contains both refactoring of the corresponding functions and
> >> changing of the order. Please split it into two separate commits.
> >>
> >>>
> >>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> >>> ---
> >>> =A0 drivers/gpu/drm/drm_atomic_helper.c | 300 +++++++++++++++++------=
-----
> >>> =A0 1 file changed, 181 insertions(+), 119 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> >>> b/drivers/gpu/drm/drm_atomic_helper.c
> >>> index 5186d2114a50..ad6290a4a528 100644
> >>> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >>> @@ -74,6 +74,12 @@
> >>> =A0=A0 * also shares the &struct drm_plane_helper_funcs function table
> >>> with the plane
> >>> =A0=A0 * helpers.
> >>> =A0=A0 */
> >>> +
> >>> +enum bridge_chain_operation_type {
> >>> +=A0=A0=A0 DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE,
> >>> +=A0=A0=A0 DRM_BRIDGE_ENABLE_OR_DISABLE,
> >>> +};
> >>> +
> >>
> >> I have mixed feelings towards this approach. I doubt that it actually
> >> helps. Would you mind replacing it with just 'bool pre_enable' / 'bool
> >> post_disable' arguments?
> >=20
> > If my memory serves, I suggested the enum. I don't like it too much
> > either. But neither do I like the boolean that much, as this is not a
> > yes/no, on/off case... Then again, maybe boolean is fine here, as the
> > "off" case is the "normal/default" case so it's still ok-ish.
> >=20
> > But this doesn't matter much, I think. It's internal, and can be
> > trivially adjusted later.
> >=20
>=20
> Alright! I will drop the enum reference entirely, and just use the
> booleans.

Whatever you do, I think that we're at a point where the bridge chain
traversal is complicated enough that we'll want to have tests for all
cases.

Maxime

--uydoytvsz2kxjpgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4aUFgAKCRAnX84Zoj2+
dnqAAYC0ScSpdOu5aG5eiiaY3iG/orovXWY6fGpDr9VJMPpj671el+lI73x5bPOq
zNO50dcBfA0Q9Mq/caczRg7drjjxnfr1oIR98TZArOF3uBH6NqNfPYX4E4YYIqXn
zx9fBFClSw==
=/VQu
-----END PGP SIGNATURE-----

--uydoytvsz2kxjpgk--
