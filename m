Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042DF8FF28B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66A910EA19;
	Thu,  6 Jun 2024 16:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cvM4dzlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5379510E293;
 Thu,  6 Jun 2024 16:33:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C74E61D00;
 Thu,  6 Jun 2024 16:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F1C2BD10;
 Thu,  6 Jun 2024 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717691583;
 bh=J4EIeduNWZgQM5LFuF+pkc025aA/Jgzn8slsa28alkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cvM4dzlD5Lmahj0VgK0rUTp4s35qgdE/OobeYuZJ1axMZw3aNqtuG/qOY2I4RtJ2c
 u0H+DCq1jHUQVUhWWBbKBKoTgK/ySxWrnWeA1BDFJNqu5Qi3YPRoyksmOXjvhfNwtp
 2DlBckNQmkNx6TrqKEjHFPxrv7kQb+A1DOBlhZBRKDVF3d4jYtTP3Bdmix7ENd5lid
 HqUhXY3Dxfxs32grRtLE3epHZbhESBnxIE5lilN0LKiLuLWAOiKAZIXcBWsvnA5a8I
 j7epTu7gNUWjYmYvY1Hbn5qUs829phlLo2oSWYH9dyX4p/TVqubwn16yxKBUYeN0Nz
 VehA4al7ZqJ5g==
Date: Thu, 6 Jun 2024 17:32:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <20240606-sharply-pettiness-7c090530c2a1@spud>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cvI1T3XU3X9BFDJc"
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
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


--cvI1T3XU3X9BFDJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 06:07:48PM +0200, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--cvI1T3XU3X9BFDJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmHkuAAKCRB4tDGHoIJi
0tXCAQDsUcs12fPLOgkac1DArtDCK6naogmrtsRLhRdX4CTCFQEA+qWNDZv+aF51
v0iE15iZ3VqHMiaYVXwOclhCbq5qpA8=
=Jq6C
-----END PGP SIGNATURE-----

--cvI1T3XU3X9BFDJc--
