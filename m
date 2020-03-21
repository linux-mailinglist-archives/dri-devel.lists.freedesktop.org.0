Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49518E48D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 22:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CCE89C9D;
	Sat, 21 Mar 2020 21:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2982E89C9D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 21:01:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 809AA8050E;
 Sat, 21 Mar 2020 22:01:24 +0100 (CET)
Date: Sat, 21 Mar 2020 22:01:23 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/mipi-dbi: Make mipi_dbi_command_stackbuf() data
 parameter const
Message-ID: <20200321210123.GA16995@ravnborg.org>
References: <20200316164249.6234-1-geert+renesas@glider.be>
 <20200320122831.GA20506@ravnborg.org>
 <dae0f969-8cff-ce81-678f-6d1a0a2e7228@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dae0f969-8cff-ce81-678f-6d1a0a2e7228@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8
 a=e5mUnYsNAAAA:8 a=Aijgm2WN9zHJ-ZJAzK8A:9 a=wPNLvfGTeEIA:10
 a=vFet0B0WnEQeilDPIY6i:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 01:35:31PM +0100, Noralf Tr=F8nnes wrote:
> =

> =

> Den 20.03.2020 13.28, skrev Sam Ravnborg:
> > Hi Noralf.
> > =

> > On Mon, Mar 16, 2020 at 05:42:49PM +0100, Geert Uytterhoeven wrote:
> >> mipi_dbi_command_stackbuf() copies the passed buffer data, so it can be
> >> const.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > =

> > OK to merge?
> > Looks good to me and build did not break.
> =

> Sure, I planned to look at it this weekend, but if you can apply it, grea=
t.
> =

> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>

Applied to drm-misc-next.

	Sam

> =

> Noralf.
> =

> > =

> > 	Sam
> > =

> >> ---
> >>  drivers/gpu/drm/drm_mipi_dbi.c | 3 ++-
> >>  include/drm/drm_mipi_dbi.h     | 5 +++--
> >>  2 files changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi=
_dbi.c
> >> index 558baf989f5a8432..89e911ccea06cf99 100644
> >> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> >> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> >> @@ -169,7 +169,8 @@ int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 =
cmd, u8 *data, size_t len)
> >>  EXPORT_SYMBOL(mipi_dbi_command_buf);
> >>  =

> >>  /* This should only be used by mipi_dbi_command() */
> >> -int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data,=
 size_t len)
> >> +int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 =
*data,
> >> +			      size_t len)
> >>  {
> >>  	u8 *buf;
> >>  	int ret;
> >> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> >> index 33f325f5af2b921f..9333b9086c30bd3c 100644
> >> --- a/include/drm/drm_mipi_dbi.h
> >> +++ b/include/drm/drm_mipi_dbi.h
> >> @@ -170,7 +170,8 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, =
u32 speed_hz,
> >>  =

> >>  int mipi_dbi_command_read(struct mipi_dbi *dbi, u8 cmd, u8 *val);
> >>  int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size=
_t len);
> >> -int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data,=
 size_t len);
> >> +int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 =
*data,
> >> +			      size_t len);
> >>  int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
> >>  		      struct drm_rect *clip, bool swap);
> >>  /**
> >> @@ -187,7 +188,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_frameb=
uffer *fb,
> >>   */
> >>  #define mipi_dbi_command(dbi, cmd, seq...) \
> >>  ({ \
> >> -	u8 d[] =3D { seq }; \
> >> +	const u8 d[] =3D { seq }; \
> >>  	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> >>  })
> >>  =

> >> -- =

> >> 2.17.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
