Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DD78AF5B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDFC10E2A0;
	Mon, 28 Aug 2023 11:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEFC10E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:59:49 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 770A16607197;
 Mon, 28 Aug 2023 12:59:46 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 28 Aug 2023 12:59:46 +0100
To: "Biju Das" <biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Message-ID: <1abd-64ec8c00-3-39cf3d80@13682584>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 1/2]
 =?utf-8?q?drm/bridge/analogix/anx78xx=3A?= Drop ID table
User-Agent: SOGoMail 5.8.4
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, August 26, 2023 04:19 -03, Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:

> The driver has an ID table, but it uses the wrong API for retrieving =
match
> data and that will lead to a crash, if it is instantiated by user spa=
ce or
> using ID. From this, there is no user for the ID table and let's drop=
 it
> from the driver as it saves some memory.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
> v3->v4:
>  * Added Rb tag from Laurent and Douglas Anderson.
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/dri=
vers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 800555aef97f..6169db73d2fe 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1367,12 +1367,6 @@ static void anx78xx=5Fi2c=5Fremove(struct i2c=5F=
client *client)
>  	kfree(anx78xx->edid);
>  }
> =20
> -static const struct i2c=5Fdevice=5Fid anx78xx=5Fid[] =3D {
> -	{ "anx7814", 0 },
> -	{ /* sentinel */ }
> -};
> -MODULE=5FDEVICE=5FTABLE(i2c, anx78xx=5Fid);
> -
>  static const struct of=5Fdevice=5Fid anx78xx=5Fmatch=5Ftable[] =3D {
>  	{ .compatible =3D "analogix,anx7808", .data =3D anx7808=5Fi2c=5Fadd=
resses },
>  	{ .compatible =3D "analogix,anx7812", .data =3D anx781x=5Fi2c=5Fadd=
resses },
> @@ -1389,7 +1383,6 @@ static struct i2c=5Fdriver anx78xx=5Fdriver =3D=
 {
>  		  },
>  	.probe =3D anx78xx=5Fi2c=5Fprobe,
>  	.remove =3D anx78xx=5Fi2c=5Fremove,
> -	.id=5Ftable =3D anx78xx=5Fid,
>  };
>  module=5Fi2c=5Fdriver(anx78xx=5Fdriver);
> =20
> --=20
> 2.25.1
>

