Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87EA54C5A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0DE10E9B6;
	Thu,  6 Mar 2025 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YVz5+lyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0B710E994
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B11A85C20FE;
 Thu,  6 Mar 2025 13:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC111C4CEE0;
 Thu,  6 Mar 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741268323;
 bh=PX5fatj57NAtbW6lmHYHTV8oA90gdPYnO3ZojeozgtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YVz5+lyDZd7eY3NzP2kfIOxDOaukQMak0D3tMPaaGlZsv9ur5lcZ6ozvBgqV2q/qR
 VqwmKUNW9G53wi/0mWbPhGtPhEXD0mqy5pwULi5h+Tdv1pbxm/bCUl37z+PCDIaFTS
 A4COsKl9XJdFUsTYSl9iLch2Hul4cLD2R5mbaBTfZ8HWZqyi1FNut8BkrVGfIROAaA
 iQTTFFWKoaoWPORptRHNy7qa+lbjvoWikrH+32w3td/l/KnFuc2MPLMHffHo58ptkz
 XRUVzuZh2e8aRoQxbgcGpvSJ9XR/z/k9h/bMdmpUT42uD1VlNU65WYVO3xByYZgpAE
 0gJ1xJ3b0KFYg==
Date: Thu, 6 Mar 2025 14:38:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Turner <david.turner@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on
 disconnect
Message-ID: <20250306-innocent-alligator-of-shopping-c7f3e7@houat>
References: <20250304193912.5696-1-wahrenst@gmx.net>
 <20250304193912.5696-2-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2ykclfy6v54zen6k"
Content-Disposition: inline
In-Reply-To: <20250304193912.5696-2-wahrenst@gmx.net>
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


--2ykclfy6v54zen6k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on
 disconnect
MIME-Version: 1.0

Hi,

On Tue, Mar 04, 2025 at 08:39:11PM +0100, Stefan Wahren wrote:
> drm_atomic_helper_connector_hdmi_hotplug() must be called
> regardless of the connection status, otherwise the HDMI audio
> disconnect event won't be notified.
>=20
> Fixes: 2ea9ec5d2c20 ("drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi=
_hotplug()")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

The patch makes sense to me, but I think we should also update the
documentation of drm_atomic_helper_connector_hdmi_hotplug to make it
clearer it needs to be called on any status update.

Maxime

--2ykclfy6v54zen6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8mlYAAKCRAnX84Zoj2+
dg6IAYCfrC6sfrNPQqAWDiyltbFs4IrYlvDwYEYxDx13UEWdwlUSzeshjZFEmhFj
RnqX1rEBgNE+i6Lt+rUCw/3f07q0OsFqzd4MvQyyYgZz8g9Xhq8/GhfGgs0MJ1Kz
p7eITuMV5Q==
=ksWR
-----END PGP SIGNATURE-----

--2ykclfy6v54zen6k--
