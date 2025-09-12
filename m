Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC67B552FD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 17:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1010E04D;
	Fri, 12 Sep 2025 15:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GZ3a0lNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3E510E04D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:18:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 37CC6601D3;
 Fri, 12 Sep 2025 15:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897CFC4CEF1;
 Fri, 12 Sep 2025 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757690278;
 bh=auGnyGWefW2rdn/csuD7zaZYk0J+7D/fCtjwy6rrubo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZ3a0lNtdmPMCz0I3eNxCYhcFTkhHWogqkfpuM92ZpidtDhLZ8zmVhB2yk6QHsucY
 GFMNBgBuOyIcBpIZ+f9zV7ehR6DHii1qizoMLMd6+jv/VrU/CV5emIfE7vV1+vZEme
 1fYagdh77FTNY7EnJ58BP+X+3Tk8L8tljpfaOJuKoV1yZvH6zHp6sIW74hP/lR7NXq
 wQstuswmHQH8N7BOxkzqMhxdO3TOfYzfMLCenAWVSbT92shDPYLIyvpioVGFZbRPA5
 azNg1IOdXFcfjh8gixpLKp/CsWgir8KXHV3UmOhbZk0XNFk/atNA56ysbak2UAagyw
 inQYrN76cMViw==
Date: Fri, 12 Sep 2025 17:17:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, 
 andri@yngvason.is, sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 2/8] hdmi: Add HDMI_COLORSPACE_AUTO enum option
Message-ID: <20250912-meaty-caracara-of-potency-ab81e7@penduick>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-3-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u6preyetatzrrkt3"
Content-Disposition: inline
In-Reply-To: <20250911130739.4936-3-marius.vlad@collabora.com>
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


--u6preyetatzrrkt3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/8] hdmi: Add HDMI_COLORSPACE_AUTO enum option
MIME-Version: 1.0

Hi,

On Thu, Sep 11, 2025 at 04:07:33PM +0300, Marius Vlad wrote:
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 45b42f14a750..74fe925c69a2 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -1031,8 +1031,8 @@ static const char *hdmi_colorspace_get_name(enum hdmi_colorspace colorspace)
>  		return "YCbCr 4:4:4";
>  	case HDMI_COLORSPACE_YUV420:
>  		return "YCbCr 4:2:0";
> -	case HDMI_COLORSPACE_RESERVED4:
> -		return "Reserved (4)";
> +	case HDMI_COLORSPACE_AUTO:
> +		return "Auto";
>  	case HDMI_COLORSPACE_RESERVED5:
>  		return "Reserved (5)";
>  	case HDMI_COLORSPACE_RESERVED6:
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 96bda41d9148..045402033763 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -82,7 +82,7 @@ enum hdmi_colorspace {
>  	HDMI_COLORSPACE_YUV422,
>  	HDMI_COLORSPACE_YUV444,
>  	HDMI_COLORSPACE_YUV420,
> -	HDMI_COLORSPACE_RESERVED4,
> +	HDMI_COLORSPACE_AUTO,
>  	HDMI_COLORSPACE_RESERVED5,
>  	HDMI_COLORSPACE_RESERVED6,
>  	HDMI_COLORSPACE_IDO_DEFINED,

I'm not sure we can use hdmi_colorspace as is. This is the enum that
represents the colorspace encoded in the AVI infoframe, so we can't
change it, really.

Maxime

--u6preyetatzrrkt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMQ5ngAKCRAnX84Zoj2+
dmwPAYDkdHxU/izvHhW9oRHJ76Iv9yDsC11mmdXAzFZFg2aMMPpKf9bg6VNTldQS
xjvbVfwBf1jCQjBD79Fm4MxLGwxKh84GkJ/qTrGIiYldrSQveoFZewVbHkZIJ01r
Nxfsf6ccJQ==
=1m5M
-----END PGP SIGNATURE-----

--u6preyetatzrrkt3--
