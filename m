Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA71A20E0C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0108F10E6BD;
	Tue, 28 Jan 2025 16:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OW9UvuJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D07010E697
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:08:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B64205C606F;
 Tue, 28 Jan 2025 16:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31FDC4CEE3;
 Tue, 28 Jan 2025 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738080522;
 bh=+oGu49zKz70IXU8bWn/2HJkdzsMnim7vEtSQAFi+P+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OW9UvuJlvounwuNJjoCA67n2Gc+t0ZTuPmo5Rpw/oUhF8vyVTydwfF+fciruyR0EU
 B9ipjTH0qVRgUpeZFRrpf3dQHbgOpTLaTJD1Mvtt7fMaHJZQ9ioQizQVaZsTckCv1a
 Pjm2Tq8w9SKojXVmxAL4GagHFGzOouHqQOnR77Vfo9ywdy+RtLuSpFvS2hUTAYFYF3
 DP6boy4KqrkghTm8R+qXRV5ZrK+c1ZWNeNMFvszFth+0mLZcmVyceHNeoRh79AWYsM
 bhp+J6SRJXu/tNTkC8tAnIIRukWqPnoiqruD0T7/zOsHQ/gycSwS9VkR8ZIAfjgBSD
 GUI6g68pi0dtQ==
Date: Tue, 28 Jan 2025 17:08:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/10] drm/bridge: move private data to the end of the
 struct
Message-ID: <vnsysirmjatvozxgvrxg2wnlg7kltq3ugr74x7mvsg2hybiyig@zcwzphrzbfqb>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-6-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uoqiqzeefxujl7oa"
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-6-5b5b2d4956da@linaro.org>
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


--uoqiqzeefxujl7oa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 06/10] drm/bridge: move private data to the end of the
 struct
MIME-Version: 1.0

On Sun, Jan 26, 2025 at 03:29:11PM +0200, Dmitry Baryshkov wrote:
> WHen adding HDMI fields I didn't notice the private: declaration for HPD
> fields. Move private fields to the end of the struct drm_bride to have
> clear distinction between private and public fields.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--uoqiqzeefxujl7oa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5kBBgAKCRAnX84Zoj2+
dsrtAX40YuZPEB6icHIiJaVrJQHNIUN/7pkYTJ5hcLuAJvBYlkGxhqyHrejNuGKa
YFqNZRoBf3W3bHNwKOw2p0I3nb1S9v02kPKPVA45c8N/CHNhYTs632TpVL7+q24h
Ftbx36AAyQ==
=zKuh
-----END PGP SIGNATURE-----

--uoqiqzeefxujl7oa--
