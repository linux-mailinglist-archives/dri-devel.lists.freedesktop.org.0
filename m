Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAgvKAEocmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:37:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E109267609
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E9B10E031;
	Thu, 22 Jan 2026 13:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OjYMTE/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34A10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:36:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FEC943C65;
 Thu, 22 Jan 2026 13:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A39C116C6;
 Thu, 22 Jan 2026 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769089019;
 bh=2FDnlfFR2kuk4iGcDnZBPalyMLv3KJKOEs4Wqxxlk8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OjYMTE/FBf92snO8Su/XNGJ1Hw4o9A3MYD/9s/TDdRZXHVy25Orqaif7WyFkJJtEp
 AwZXELH1wGDOk97JrJIv6S76n8cPsbFwE1zqmDR1S2QfMdArfx+k/e/Y6zpp4tcigr
 BuPpmiFS5dw1gMa7VOCo0VvJbCH00555zmo04XyJT0HWVDkFsSdl3QAaMvht2JwWua
 vmar0f5lDV5ISqAnfQ6+v06TR7Erkn0d9jTZRoaIdvRMHLCQJGyA60d/WRyaL2ecaM
 TXkOWerCs1ZfzjokKZ+vOqvWvUqfaMk0+IBABBFS/qs39afeGHD277SYyP0l2W80r+
 YrucdFWraLT9A==
Date: Thu, 22 Jan 2026 14:36:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Mario Limonciello <mario.limonciello@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <20260122-scallop-of-original-domination-3a554a@houat>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nyep2vueegdcpefg"
Content-Disposition: inline
In-Reply-To: <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:francesco@valla.it,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:jfalempe@redhat.com,m:javierm@redhat.com,m:sam@ravnborg.org,m:mario.limonciello@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-embedded@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,redhat.com,ravnborg.org,amd.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valla.it:email]
X-Rspamd-Queue-Id: E109267609
X-Rspamd-Action: no action


--nyep2vueegdcpefg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
MIME-Version: 1.0

Hi,

On Tue, Jan 06, 2026 at 03:25:40PM +0100, Francesco Valla wrote:
> Add a DRM client that draws a simple splash, with possibility to show:
>=20
>   - a colored background;
>   - a static BMP image (loaded as firmware);
>   - the logo provided by EFI BGRT.
>=20
> The client is not meant to replace a full-featured bootsplash, but
> rather to remove some complexity (and hopefully boot time) on small
> embedded platforms or on systems with a limited scope (e.g: recovery
> or manufacturing images).
>=20
> The background color can be set either at build time from a dedicated
> config option or at runtime through the drm_client_lib.splash_color
> command line parameter. Any color in RGB888 format can be used.
>=20
> If enabled, the static BMP image is loaded using the kernel firmware
> infrastructure; a valid BMP image with 24bpp color and no compression
> is expected. The name of the image can be set through the
> drm_client_lib.splash_bmp kernel command line parameter, with the
> default being 'drm_splash.bmp'.
>=20
> Just like the existing DRM clients, the splash can be enabled from the
> kernel command line using drm_client_lib.active=3Dsplash.
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/gpu/drm/clients/Kconfig               |  79 ++-
>  drivers/gpu/drm/clients/Makefile              |   1 +
>  drivers/gpu/drm/clients/drm_client_internal.h |   9 +
>  drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
>  drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++=
++++++
>  5 files changed, 979 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kc=
onfig
> index 6096c623d9d5b1a3d4a40d986c45aad2f8277767..dd8cd6cacd1166932eb3890dd=
816b9ae2d26330f 100644
> --- a/drivers/gpu/drm/clients/Kconfig
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -12,6 +12,7 @@ config DRM_CLIENT_LIB
>  config DRM_CLIENT_SELECTION
>  	tristate
>  	depends on DRM
> +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
>  	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
>  	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
>  	help
> @@ -85,10 +86,79 @@ config DRM_CLIENT_LOG
>  	  If you only need logs, but no terminal, or if you prefer userspace
>  	  terminal, say "Y".
> =20
> +config DRM_CLIENT_SPLASH
> +	bool "Display graphic splash"
> +	depends on DRM_CLIENT_SELECTION
> +	select DRM_CLIENT
> +	select DRM_CLIENT_SETUP
> +	select DRM_DRAW
> +	help
> +	  This enables a splash drm client, able to display either a plain
> +	  color or a static image until the userspace is ready to take over.
> +	  The splash will be displayed on all screens available at boot, if
> +	  any, or on the ones part of the first hotplug event.
> +
> +config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
> +	hex "Splash background color"
> +	depends on DRM_CLIENT_SPLASH
> +	default 0x000000
> +	help
> +	  The default splash background color, in RGB888 format.
> +
> +	  The color can be overridden through the drm_client_lib.splash_color
> +	  kernel command line parameter.
> +
> +config DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	bool
> +
> +choice
> +	prompt "Splash source"
> +	depends on DRM_CLIENT_SPLASH
> +	default DRM_CLIENT_SPLASH_SRC_COLOR
> +	help
> +	  Selects the source for the splash graphic.
> +
> +config DRM_CLIENT_SPLASH_SRC_COLOR
> +	bool "Solid color"
> +	help
> +	  Use a solid color as splash. The color is selected through the
> +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option.
> +
> +	  The image will be loaded using the firmware loading facility the
> +	  kernel provides.
> +
> +config DRM_CLIENT_SPLASH_SRC_BMP
> +	bool "BMP image"
> +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	select FW_LOADER
> +	help
> +	  Use a BMP (bitmap) image as splash. If the image is smaller than the
> +	  display(s), it will be centered and the color specified through the
> +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option will be used as
> +	  background.
> +
> +	  The image will be loaded using the firmware loading facility the
> +	  kernel provides; it shall use 24 bits per pixel and shall not be
> +	  compressed. The name of the file can be set through the
> +	  drm_client_lib.splash_bmp command line parameter, with the default
> +	  being 'drm_splash.bmp'.
> +
> +config DRM_CLIENT_SPLASH_SRC_BGRT
> +	bool "EFI BGRT"
> +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	depends on EFI
> +	help
> +	  Use the BGRT image provided by the EFI bootloader. If the image is
> +	  smaller than the display(s), it will be centered and the color
> +	  specified through the DRM_CLIENT_SPLASH_BACKGROUND_COLOR config
> +	  option will be used as background.
> +
> +endchoice

I'm not sure we should consider it a xor choice. If we do, that means
that it's effectively unusable by distros, since you don't know ahead of
time if the platform it's going to boot on will have a BGRT or not.

Trying BGRT, and then falling back to either an image or a solid
background would be easier to work with.

Maxime

--nyep2vueegdcpefg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXIn8wAKCRAnX84Zoj2+
dm5TAX4qxeetIbWWZPq42N6AH0KKAMadyxwoFv2Cdm6BkpV0rxZb5cqi8e/79tsr
B+XVCnMBgJtLQ4XFJfQG13Ux502kUTUFkyNj/6ADaAvxxxnlnBVttXPNNHAKSi5t
6hfcHl9UYQ==
=JdxG
-----END PGP SIGNATURE-----

--nyep2vueegdcpefg--
