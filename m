Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC145B97FD9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 03:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6584710E6B4;
	Wed, 24 Sep 2025 01:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="ML+SdNKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5303A10E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 01:18:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758676727; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C4JGt68VKhkqF0hHIdGcgHHErhwE2rbQXTrkUcoEn6M0GbZiZmU62/G3ok1iYGAV7JrRzpoGY/M7O85eaitSAgckqeAl4zeGkPl/Hs9flvTFlxQhOO2FXm/6CO+Cl03zKNPdPl9ycm6G/d5n5jpkkZ2XE7lV8ba2BmvXpPsp05g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758676727;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BtUXS5AMg6rbebPn+VN1bB/cy5dWvzmKCUX4JG76wiU=; 
 b=PTCO0IX2Y2YF3bukkmLHycwlgPPnhHeQiBB/Pzocu2xjLghk4VVrqnI4MzLJOhyY/YXz544AFl19f53AcF2CyX2+cEd18LeG9QOlP8Q2YtKMSvZ49w4GLpRRsrmw6qukhENq/qYykWxh8h3HSVIBkmgNu+ab81kBnC8KNhdkH1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758676727; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=BtUXS5AMg6rbebPn+VN1bB/cy5dWvzmKCUX4JG76wiU=;
 b=ML+SdNKBJw5//MPo6uiTzpWfWsHN0dS+2wlr2yP3DG0MmaTuuPscNAV6JRwQzQcM
 tjzqslrSLZF28H6NxgFzZqZN+anRPHc35a4AKJPjHHYdtndICmLzMgTUbQB1YIXexjO
 3CAwFjvke5edmEDkTRvhdfXI6mRjxitvgn1uHSWs=
Received: by mx.zohomail.com with SMTPS id 1758676724769722.0610885859841;
 Tue, 23 Sep 2025 18:18:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id 6CD671805CF; Wed, 24 Sep 2025 03:18:21 +0200 (CEST)
Date: Wed, 24 Sep 2025 03:18:21 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Message-ID: <lzimjanf6sajxusigstmc7lpeujcq63yff5gyw22hh2bnsbt4h@cbpoc3u257wg>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
 <20250923132616.GH20765@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bqp2giz7qhg3q6f4"
Content-Disposition: inline
In-Reply-To: <20250923132616.GH20765@pendragon.ideasonboard.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/258.614.82
X-ZohoMailClient: External
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


--bqp2giz7qhg3q6f4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
MIME-Version: 1.0

Hi,

On Tue, Sep 23, 2025 at 04:26:16PM +0300, Laurent Pinchart wrote:
> I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
> opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
> here. A quick grep showed one panel driver setting both the N and P
> flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
> t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
> that ?).

Yeah, it was supposed to be=20

static const struct drm_display_mode t28cp45tn89_mode =3D {
    ...
    .flags =3D DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NHSYNC
};

The driver works with the panel, because the driver defaults to
DRM_MODE_FLAG_N[HV]SYNC and ignores the related flags, so just the
DRM_MODE_FLAG_P[HV]SYNC one is applied:

static int st7789v_prepare(struct drm_panel *panel)
{
    ...

	if (ctx->info->mode->flags & DRM_MODE_FLAG_PVSYNC)
		polarity |=3D ST7789V_RGBCTRL_VSYNC_HIGH;
	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
		polarity |=3D ST7789V_RGBCTRL_HSYNC_HIGH;

    ...
}

Greetings and thanks for the bug report,

-- Sebastian

--bqp2giz7qhg3q6f4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjTRtQACgkQ2O7X88g7
+po7ow/+Ia4UEQmcU8ZcxnP1OMCDvIQGiCowcnDP/9wvnS1RcxzrpdfMfkCY/z41
PYFu9dx1f9QXfIXzk+76DIDopBjWGaPTp4Sv3Y9HqCGK7jxwWyf4eAX3zEi4VD5V
LLlkvadDomLYFIREuVYeE59eDSuc873Ok1EorLLs+HuqGohek6hLDPyPaGKakSzK
GGafjFx0kVZippqaiFlp0QxgmDCuV+j+IPOO5x/NyCZnc7MqQL6bmHx4YzJDghGf
aU9Z6c03xMHniJVVkBf5308iDCrqk0hV8cJRzsRX/nifEQz8QBaK5xNUbbPVqFlM
XiXbjJJnAUeq28iksQ+KMvoUkHzwScXVaEOFJ/F6Wvt0CoKM9/CnUnvHMVu9Cpm7
9I9V82Ps3/7LDplDFjUZKGwxpxL6oh9UYKhqyXQeiNTj3jR9BCroD8+lGZ3TB+42
JMWDM3hhHyJlhObW5AY8ZtAphq7YbImXvhc/1dyb0r4COWmIahCBNI+MabrTPTqh
19Caq5+epBbawV9E4UJpwJts+6GfP+9t0WOB66xksXi3dEF4LNTRTCwANobdN1jK
NSj3Mo6iqFrg/tn1W+KjnXgsVcOuDiAFG2XMPAJyY2l++wnDwVM9mezEatH5Uw1Q
KapZVn32fxdIf2C6DimMByCeEnwc1OIYZ+u4x62aGLBtj7tjmbc=
=HNGX
-----END PGP SIGNATURE-----

--bqp2giz7qhg3q6f4--
