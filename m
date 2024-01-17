Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C259830248
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185C910E611;
	Wed, 17 Jan 2024 09:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFE310E611
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D91996155C;
 Wed, 17 Jan 2024 09:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3650DC433F1;
 Wed, 17 Jan 2024 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705483598;
 bh=1DCjJH54rV/tEEn68lwaeQDLNsZ2ay4x/ceIAvvm/cY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJON6iLKiEC+Ah4ul4Q7K8vRk+XPUIrWurVASdbmOV4eum3M7H5Ps2yaOIq8huoDr
 keWgVV5b2DqC5csfWzDqLgdlx12QqXujg0w3UJAsDaz0jl0JP4JNOi1t1ExK0twrtG
 iqAf6xJbrvp2B1TxWBK4Ru0UJlVAi9frWwHdovmzXGbunXNTN+Vt0jFpKl0Xhp3s8m
 72vMdYCky8h5yDTJntZBPmWB4xAYR9aGUsMNuaIfZbPi2B7gKsAvvgVDQ4/0jX2U/f
 eR6glTnjel4GswwhYvvc1+4ySL1x0GolZN03BFs0ynIjaIeMs02xSUwiF4/iN7dFCy
 qvbRnPgxdLiyw==
Date: Wed, 17 Jan 2024 10:26:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC 0/4] Support for Simulated Panels
Message-ID: <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tpb5itbob25r5zbr"
Content-Disposition: inline
In-Reply-To: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tpb5itbob25r5zbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 16, 2024 at 02:22:03PM -0800, Jessica Zhang wrote:
> This series introduces a simulated MIPI DSI panel.
>=20
> Currently, the only way to validate DSI connectors is with a physical
> panel. Since obtaining physical panels for all possible DSI configurations
> is logistically infeasible, introduce a way for DSI drivers to simulate a
> panel.
>=20
> This will be helpful in catching DSI misconfiguration bugs and catching
> performance issues for high FPS panels that might not be easily
> obtainable.
>=20
> For now, the simulated panel driver only supports setting customized
> modes via the panel_simlation.mode modparam. Eventually, we would like
> to add more customizations (such as configuring DSC, dual DSI, etc.).

I think that it's more complicated than it needs to be.

Why do we need to support (and switch to) both the actual and
"simulated" panel?

Wouldn't it be simpler if we had a vkms-like panel that we could either
configure from DT or from debugfs that would just be registered the
usual way and would be the only panel we register?

Maxime

--tpb5itbob25r5zbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaedSwAKCRDj7w1vZxhR
xcXFAQC2vlK6rC0kPPMhQNqaVADKPb9+jP+ijLXYrxyObs4hdQEArKGgOi6aBD8m
0s6XBa7wPWL+OiwvdJJBXlcRYS7anwo=
=pZtR
-----END PGP SIGNATURE-----

--tpb5itbob25r5zbr--
