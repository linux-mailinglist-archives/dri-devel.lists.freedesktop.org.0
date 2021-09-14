Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DB40B694
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8D89B3C;
	Tue, 14 Sep 2021 18:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A9E89B3C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:14:20 +0000 (UTC)
Date: Tue, 14 Sep 2021 19:14:09 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] DRM/Panel : abt-y030xx067a yellow tint fix
To: Christophe Branchereau <cbranchereau@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <LZRFZQ.68IYZZZISOEV3@crapouillou.net>
In-Reply-To: <20210914092716.2370039-1-cbranchereau@gmail.com>
References: <20210914092716.2370039-1-cbranchereau@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

Le mar., sept. 14 2021 at 11:27:16 +0200, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> The previous parameters caused an unbalanced yellow tint.
>=20
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c=20
> b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> index 2d8794d495d0..3d8a9ab47cae 100644
> --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> @@ -146,8 +146,8 @@ static const struct reg_sequence=20
> y030xx067a_init_sequence[] =3D {
>  	{ 0x09, REG09_SUB_BRIGHT_R(0x20) },
>  	{ 0x0a, REG0A_SUB_BRIGHT_B(0x20) },
>  	{ 0x0b, REG0B_HD_FREERUN | REG0B_VD_FREERUN },
> -	{ 0x0c, REG0C_CONTRAST_R(0x10) },
> -	{ 0x0d, REG0D_CONTRAST_G(0x10) },
> +	{ 0x0c, REG0C_CONTRAST_R(0x00) },
> +	{ 0x0d, REG0D_CONTRAST_G(0x00) },
>  	{ 0x0e, REG0E_CONTRAST_B(0x10) },
>  	{ 0x0f, 0 },
>  	{ 0x10, REG10_BRIGHT(0x7f) },
> --
> 2.33.0
>=20


