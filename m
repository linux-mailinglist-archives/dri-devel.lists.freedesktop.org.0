Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A4689EA5A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 08:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386B113196;
	Wed, 10 Apr 2024 06:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="nmoz+2KI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3839210E467
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dOhPgr0IR0J3kmyjQbypEicyVcZRZeaizjSz5b4Gj4A=; b=nmoz+2KIuOJ/T3VveX+3ETKHOq
 qLeVBPo7vaXCSfSUQQU6k1z1T5yofxTw/d/tgs1723MoXSltluK9wNUjV/nTRv8WnpDCMq99Oau4Q
 eygAoc3vbK3uIeJocUSoij01mSzIHBAexIGwkzHFksNcbFm+ka7mDVyEgDQfkC83ntB1Q1iLtsILX
 LukGMmrRHjz2LbVGSKqjS+gyYTdZrC/9mPsTyi8dlGxpHwT3fmas+6p3TW+U28YQUIc1nXA4kqi6D
 hcfrG4yNO9ZwZ9UNtrdglZ5GCvZVABpMIvQCxfIvQXHVSCHh0zem4AYfUA2TasVnYRKwxnVweBo52
 uRYSHGig==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sarha@kapsi.fi>) id 1ruR7l-002OEs-0U;
 Wed, 10 Apr 2024 09:07:57 +0300
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 06:07:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <dee78711dc128c1089357de98888ed9977ae4240@kapsi.fi>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
References: undefined
 <20240408170426.9285-1-ville.syrjala@linux.intel.com>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH 13/21] drm/tilcdc: Allow build with COMPILE_TEST=y
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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

April 8, 2024 at 8:04 PM, "Ville Syrjala" <ville.syrjala@linux.intel.com =
mailto:ville.syrjala@linux.intel.com?to=3D%22Ville%20Syrjala%22%20%3Cvill=
e.syrjala%40linux.intel.com%3E > wrote:

>=20
>=20From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
>=20Allow tilcdc to be built with COMPILE_TEST=3Dy for greater
> coverage. Builds fine on x86/x86_64 at least.
>=20
>=20Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

Thanks,
Jyri

> ---
> drivers/gpu/drm/tilcdc/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/=
Kconfig
> index d3bd2d7a181e..1897ef91c70b 100644
> --- a/drivers/gpu/drm/tilcdc/Kconfig
> +++ b/drivers/gpu/drm/tilcdc/Kconfig
> @@ -1,7 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
> config DRM_TILCDC
>  tristate "DRM Support for TI LCDC Display Controller"
> - depends on DRM OF && ARM
> + depends on DRM && OF && (ARM || COMPILE_TEST)
>  select DRM_KMS_HELPER
>  select DRM_GEM_DMA_HELPER
>  select DRM_BRIDGE
> --=20
>=202.43.2
>
