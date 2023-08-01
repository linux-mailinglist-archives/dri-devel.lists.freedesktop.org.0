Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A960176B461
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAFD10E3CC;
	Tue,  1 Aug 2023 12:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0251810E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:06:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66E2561585;
 Tue,  1 Aug 2023 12:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D416C433C7;
 Tue,  1 Aug 2023 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690891569;
 bh=s6YECtfwRWz+nn+e8dtTgfPFMuDS2G9MlvdIBiOeJvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KqMPTZxlteTlX/vW0spt/IyKiVoPJYdtMr2lPEmfbuQmmwhfCC21GhGz+yQWZ8GEd
 RJW1lK9JN1DnTZJmTBwsvxtaZhWyU6xXWtVcaFKkx5L8z9m/yft5TuURPQh/J+IL7U
 PHvcq8WNXFxjoQvwm9S5/fvJ1NcSpL5MoMmgslMiMQ5qDQ3DsuwUBL05Ll8j2x2V0T
 Fmi+ZB4B+y3YDp+rI657BSpL6UbzABRJfYD+Czas7wkqLfwlQX9ueJGii9FSPJqKBt
 8HPA9376cD/cny4bwakf8t2KopaxquTpFCkgWx5XoRWckS8rxRoyjnuCN7kB9nASW2
 lheIZ7XLLLVog==
Date: Tue, 1 Aug 2023 14:06:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v1 v1 6/7] drm/vs: Add KMS crtc&plane
Message-ID: <7sfzkc6b46izrfnhcoajllugfofh7otseocbiiftjx344hxiuf@jkjb5syqwo24>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-7-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="duuftomxabqjg5ol"
Content-Disposition: inline
In-Reply-To: <20230801101030.2040-7-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--duuftomxabqjg5ol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Aug 01, 2023 at 06:10:29PM +0800, Keith Zhao wrote:
> +static int vs_crtc_atomic_set_property(struct drm_crtc *crtc,
> +				       struct drm_crtc_state *state,
> +				       struct drm_property *property,
> +				       uint64_t val)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(state);
> +
> +	if (property == vs_crtc->sync_mode)
> +		vs_crtc_state->sync_mode = val;
> +	else if (property == vs_crtc->mmu_prefetch)
> +		vs_crtc_state->mmu_prefetch = val;
> +	else if (property == vs_crtc->bg_color)
> +		vs_crtc_state->bg_color = val;
> +	else if (property == vs_crtc->panel_sync)
> +		vs_crtc_state->sync_enable = val;
> +	else if (property == vs_crtc->dither)
> +		vs_crtc_state->dither_enable = val;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int vs_crtc_atomic_get_property(struct drm_crtc *crtc,
> +				       const struct drm_crtc_state *state,
> +				       struct drm_property *property,
> +				       uint64_t *val)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +	const struct vs_crtc_state *vs_crtc_state =
> +		container_of(state, const struct vs_crtc_state, base);
> +
> +	if (property == vs_crtc->sync_mode)
> +		*val = vs_crtc_state->sync_mode;
> +	else if (property == vs_crtc->mmu_prefetch)
> +		*val = vs_crtc_state->mmu_prefetch;
> +	else if (property == vs_crtc->bg_color)
> +		*val = vs_crtc_state->bg_color;
> +	else if (property == vs_crtc->panel_sync)
> +		*val = vs_crtc_state->sync_enable;
> +	else if (property == vs_crtc->dither)
> +		*val = vs_crtc_state->dither_enable;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}

Any new property needs to follow these requirements:
https://docs.kernel.org/gpu/drm-kms.html#requirements
https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements

Also, most of them are suspicious, like sync_mode, mmu_prefetch,
panel_sync or dither_enable. Why would you want userspace to change
those ?


> +static int vs_crtc_late_register(struct drm_crtc *crtc)
> +{
> +	return 0;
> +}

You can drop that.

> +static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +
> +	vs_dc_enable_vblank(vs_crtc->dev, true);
> +
> +	return 0;
> +}
> +
> +static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +
> +	vs_dc_enable_vblank(vs_crtc->dev, false);
> +}
> +
> +static const struct drm_crtc_funcs vs_crtc_funcs = {
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.reset			= vs_crtc_reset,
> +	.atomic_duplicate_state = vs_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state	= vs_crtc_atomic_destroy_state,
> +	.atomic_set_property	= vs_crtc_atomic_set_property,
> +	.atomic_get_property	= vs_crtc_atomic_get_property,
> +	.late_register		= vs_crtc_late_register,
> +	.enable_vblank		= vs_crtc_enable_vblank,
> +	.disable_vblank		= vs_crtc_disable_vblank,
> +};
> +
> +static u8 cal_pixel_bits(u32 bus_format)
> +{
> +	u8 bpp;
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		bpp = 16;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +		bpp = 18;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +		bpp = 20;
> +		break;
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +		bpp = 24;
> +		break;
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +		bpp = 30;
> +		break;
> +	default:
> +		bpp = 24;
> +		break;
> +	}
> +
> +	return bpp;
> +}
> +
> +static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
> +			       const struct drm_display_mode *mode,
> +			       struct drm_display_mode *adjusted_mode)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +
> +	return vs_dc_mode_fixup(vs_crtc->dev, mode, adjusted_mode);
> +}

You should be using atomic_check.

Maxime

--duuftomxabqjg5ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMj1LgAKCRDj7w1vZxhR
xcuiAQDVAHuCXQLiF4aho3J76b/1omEGtDLrJYqMFou4trNeDQEA9a+4doYz0r8T
e4MChnbgb7U5q3ndReWR8iY6I4VZ/wc=
=sNPG
-----END PGP SIGNATURE-----

--duuftomxabqjg5ol--
