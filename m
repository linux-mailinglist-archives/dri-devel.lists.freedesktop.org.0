Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0764F3FA3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3E10EED3;
	Tue,  5 Apr 2022 21:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A70D10EECB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1649192633; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+gXLZmqhdPrOBrGZGktTeGHOT6E2+rkUcU65w77U9Q=;
 b=icYQV0HoG9hcJUDeXuXeIU1WoXR6RQR8NP3K1VENb68F67Fe9qy7Gpm8XDNK8j16fqLl4N
 kfR9fgtlPy/TXgEMLtLBxyy9fbdqmL1pEz43M9c99nYM+sfaV8N8a9AHvYeQsoWYW4L+bc
 rFYBlHPAcvbgiPNfgIvsDiTEuof8ogg=
Date: Tue, 05 Apr 2022 22:03:38 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 0/3] Ingenic DRM bridge_atomic_enable proposal
To: Christophe Branchereau <cbranchereau@gmail.com>
Message-Id: <26XV9R.735J8E0AH281@crapouillou.net>
In-Reply-To: <20220321133651.291592-1-cbranchereau@gmail.com>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

Merged to drm-misc-next.

Thanks,
-Paul


Le lun., mars 21 2022 at 14:36:48 +0100, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> Hello,
>=20
> v5 :
>=20
> - this set doesn't include the nv3052c bindings doc anymore,
>   as it's already applied
>=20
> - nv3052c panel driver : removed empty lines, proceed to turn it off
>   even is sleeping in fails instead of stopping there
>=20
> - abt panel : switched to REGCACHE_FLAT so we can disable sleep mode
>   in .enable with regmap_set_bits() instead of doing it at init time
>=20
> - ingenic-drm-drv : added ingenic_drm_bridge_atomic_disable to balance
>   out ingenic_drm_bridge_atomic_enable
>=20
> Tested working on the rg350m and rg280m
>=20
> Christophe Branchereau (3):
>   drm/ingenic : add ingenic_drm_bridge_atomic_enable and disable
>   drm/panel: Add panel driver for NewVision NV3052C based LCDs
>   drm/panel : innolux-ej030na and abt-y030xx067a : add .enable and
>     .disable
>=20
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  34 +-
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |  31 +-
>  drivers/gpu/drm/panel/panel-innolux-ej030na.c |  31 +-
>  .../gpu/drm/panel/panel-newvision-nv3052c.c   | 484=20
> ++++++++++++++++++
>  6 files changed, 572 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c
>=20
> --
> 2.35.1
>=20


