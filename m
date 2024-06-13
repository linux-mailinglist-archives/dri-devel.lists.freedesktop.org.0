Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE55906550
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 09:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2830610E251;
	Thu, 13 Jun 2024 07:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="luKu3yvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A3C10E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 07:37:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5EE5BCE0ED3;
 Thu, 13 Jun 2024 07:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D66C2BBFC;
 Thu, 13 Jun 2024 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718264250;
 bh=ImQIKeourXR7ChWq71b/VBnDWCOFJA52mX9HCcaGd1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=luKu3yvTIy2XOk2lmMPaECP1FftDpr6pA6SYtsDbJw8zHbyxpEfpy/WnabEI99USF
 ACFZiEc5/RRQZw8nHw420Id/bTXr9ADTRXUvl80bcWFamra239SH6rRse0Ypiqj3Hp
 zFK0Lrsi6K3R9peez2wjtrYXL5hmQM3GqXm7oNsMjc9IGvkfEH7/Ov0cymhzmAuT5f
 7ozb3rdWb/aa4XTsmXQJ0CxHefW6Q6uLTkrId7LoHHkPdmSDPTtNZzNrspskk3bjBH
 o7CtN3yIBtYb6kVipz+3ggwzE2bpZiBFHxHhpjvgliCRTHJPlqVP7N3nX72jTD6Uxl
 hIjbOioU1VgQw==
Date: Thu, 13 Jun 2024 09:37:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mairacanal@riseup.net, 
 hamohammed.sa@gmail.com, robdclark@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, daniels@collabora.com, helen.koike@collabora.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] drm/ci: add tests on vkms
Message-ID: <20240613-bipedal-eccentric-locust-91632b@houat>
References: <20240611091037.558969-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cpuibrkaoumlir3j"
Content-Disposition: inline
In-Reply-To: <20240611091037.558969-1-vignesh.raman@collabora.com>
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


--cpuibrkaoumlir3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jun 11, 2024 at 02:40:37PM GMT, Vignesh Raman wrote:
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> new file mode 100644
> index 000000000000..56484a30aff5
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> @@ -0,0 +1,15 @@
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com/T/#u
> +# Failure Rate: 50
> +# IGT Version: 1.28-g0df7b9b97
> +# Linux Version: 6.9.0-rc7
> +kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
> +kms_flip@basic-flip-vs-wf_vblank
> +kms_flip@flip-vs-expired-vblank-interruptible
> +kms_flip@flip-vs-wf_vblank-interruptible
> +kms_flip@plain-flip-fb-recreate-interruptible
> +kms_flip@plain-flip-ts-check
> +kms_flip@plain-flip-ts-check-interruptible
> +kms_flip@flip-vs-absolute-wf_vblank
> +kms_flip@flip-vs-absolute-wf_vblank-interruptible
> +kms_flip@flip-vs-blocking-wf-vblank

We should have the header for every line here

Maxime

--cpuibrkaoumlir3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmqhtwAKCRDj7w1vZxhR
xVWRAQCG+ScbgEMo6+BuqdxIkn+RGcHtaRDZ9dEXREDfww2gPAEA8mPYOf4Ta5YU
fw2ffV8wY75ewIayYsyhkQp4pA14AQs=
=/cnS
-----END PGP SIGNATURE-----

--cpuibrkaoumlir3j--
