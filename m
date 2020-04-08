Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0891A1EC4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A496EA14;
	Wed,  8 Apr 2020 10:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738A6EA23
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 10:27:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 11FDE20029;
 Wed,  8 Apr 2020 12:27:55 +0200 (CEST)
Date: Wed, 8 Apr 2020 12:27:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] drm/panel: NT39016: Add support for multiple modes
Message-ID: <20200408102753.GA25805@ravnborg.org>
References: <20200408095830.8131-1-paul@crapouillou.net>
 <20200408100452.GA20795@ravnborg.org>
 <QCSG8Q.N40UK3F20OVT2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <QCSG8Q.N40UK3F20OVT2@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=ER_8r6IbAAAA:8 a=AWKs0v43Jo1guAmdQeEA:9 a=0BdVxHvGnDqK8inQ:21
 a=cT1zXbrBXqGS2BQb:21 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 12:12:26PM +0200, Paul Cercueil wrote:
> Hi Sam,
> =

> =

> Le mer. 8 avril 2020 =E0 12:04, Sam Ravnborg <sam@ravnborg.org> a =E9crit=
 :
> > Hi Paul.
> > =

> > On Wed, Apr 08, 2020 at 11:58:29AM +0200, Paul Cercueil wrote:
> > >  Add support for multiple drm_display_mode entries. This will allow
> > > to
> > >  add a 50 Hz mode later.
> > > =

> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Patch looks good.
> > =

> > Could we please use lower case in the $subject?
> =

> You mean 's/Add/add/' or the panel name as well?

The panel name. We are not consistent if we start sentences in $subject
with lower or upper case - so Add and add are both fine.
But the panel name is (almost) always with lower case.

	Sam
> =

> -Paul
> =

> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > =

> > I asume you will apply yourself.
> > =

> > 	Sam
> > =

> > >  ---
> > >   drivers/gpu/drm/panel/panel-novatek-nt39016.c | 33
> > > +++++++++++++------
> > >   1 file changed, 23 insertions(+), 10 deletions(-)
> > > =

> > >  diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> > > b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> > >  index a470810f7dbe..f1286cf6528b 100644
> > >  --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> > >  +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> > >  @@ -49,7 +49,8 @@ enum nt39016_regs {
> > >   #define NT39016_SYSTEM_STANDBY	BIT(1)
> > > =

> > >   struct nt39016_panel_info {
> > >  -	struct drm_display_mode display_mode;
> > >  +	const struct drm_display_mode *display_modes;
> > >  +	unsigned int num_modes;
> > >   	u16 width_mm, height_mm;
> > >   	u32 bus_format, bus_flags;
> > >   };
> > >  @@ -212,15 +213,22 @@ static int nt39016_get_modes(struct drm_panel
> > > *drm_panel,
> > >   	struct nt39016 *panel =3D to_nt39016(drm_panel);
> > >   	const struct nt39016_panel_info *panel_info =3D panel->panel_info;
> > >   	struct drm_display_mode *mode;
> > >  +	unsigned int i;
> > > =

> > >  -	mode =3D drm_mode_duplicate(connector->dev,
> > > &panel_info->display_mode);
> > >  -	if (!mode)
> > >  -		return -ENOMEM;
> > >  +	for (i =3D 0; i < panel_info->num_modes; i++) {
> > >  +		mode =3D drm_mode_duplicate(connector->dev,
> > >  +					  &panel_info->display_modes[i]);
> > >  +		if (!mode)
> > >  +			return -ENOMEM;
> > >  +
> > >  +		drm_mode_set_name(mode);
> > > =

> > >  -	drm_mode_set_name(mode);
> > >  +		mode->type =3D DRM_MODE_TYPE_DRIVER;
> > >  +		if (panel_info->num_modes =3D=3D 1)
> > >  +			mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> > > =

> > >  -	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > >  -	drm_mode_probed_add(connector, mode);
> > >  +		drm_mode_probed_add(connector, mode);
> > >  +	}
> > > =

> > >   	connector->display_info.bpc =3D 8;
> > >   	connector->display_info.width_mm =3D panel_info->width_mm;
> > >  @@ -230,7 +238,7 @@ static int nt39016_get_modes(struct drm_panel
> > > *drm_panel,
> > >   					 &panel_info->bus_format, 1);
> > >   	connector->display_info.bus_flags =3D panel_info->bus_flags;
> > > =

> > >  -	return 1;
> > >  +	return panel_info->num_modes;
> > >   }
> > > =

> > >   static const struct drm_panel_funcs nt39016_funcs =3D {
> > >  @@ -316,8 +324,8 @@ static int nt39016_remove(struct spi_device
> > > *spi)
> > >   	return 0;
> > >   }
> > > =

> > >  -static const struct nt39016_panel_info kd035g6_info =3D {
> > >  -	.display_mode =3D {
> > >  +static const struct drm_display_mode kd035g6_display_modes[] =3D {
> > >  +	{
> > >   		.clock =3D 6000,
> > >   		.hdisplay =3D 320,
> > >   		.hsync_start =3D 320 + 10,
> > >  @@ -330,6 +338,11 @@ static const struct nt39016_panel_info
> > > kd035g6_info =3D {
> > >   		.vrefresh =3D 60,
> > >   		.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > >   	},
> > >  +};
> > >  +
> > >  +static const struct nt39016_panel_info kd035g6_info =3D {
> > >  +	.display_modes =3D kd035g6_display_modes,
> > >  +	.num_modes =3D ARRAY_SIZE(kd035g6_display_modes),
> > >   	.width_mm =3D 71,
> > >   	.height_mm =3D 53,
> > >   	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> > >  --
> > >  2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
