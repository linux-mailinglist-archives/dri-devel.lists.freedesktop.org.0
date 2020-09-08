Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4E2627E8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA6A6E9DB;
	Wed,  9 Sep 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ADB6E1F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 17:53:01 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r9so287492ioa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R1Eby79aWqwmnRmnMaD2EfOEL8cXeoS53EWpkQgzkGI=;
 b=pTVfWom8hEpJpYM2lMr35O1IZ1yEvWUrWNbBUv6iw0cO9/hU3iplnEtQNDxvWELs92
 3MdV0Jl9TRXaL8/bDuF4ssMbe3rXjihhO2fMFtZJTFXVVmxkKL35yU99+viJxXp/Ptxo
 F4VVgZg1RaeOF51p70HlxvY8NW33i3qEZzRx0Nd7a2f7bITxE/04gDWQB0itGAti3LLp
 /948BE0s6PXioyByXXd2Xpqt4hMQXck5ZGTGKiJoPl/1iJURwGDqpZyaPKRTB1+tsRc1
 v5UP/ACuSWHmBOQdvsT2zDSQE6s10cn791KpKcG/ZqR4njGdCLa2/PaMnn/pD9g/GfKn
 jdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R1Eby79aWqwmnRmnMaD2EfOEL8cXeoS53EWpkQgzkGI=;
 b=sKImG2xGR4P34Tr0KAG2OYG/p53IOWTLFVmCWUn5d5DNroqRT8AagVb+9lVwc/L/AW
 Bnv2YIvuK0ci+XoG/WO67p+sqn58iUCrm4zpt1YjhFhKbKGZ2Unil8pB5Xbh0724uQVj
 VWxBzS609ZPaj+bryBkMhBUw8a6XwjoM+pTlNLOBXKU9e6hiyrirc6Zf0TX4tjlJ54h/
 qAgjKlv7f0Uul90DKFh6J3BLUkIMYjJMUg27npPKStL5EC2agl2zofQOVdODEh8BnCoJ
 yn8ge/sQylgziM0HhelTiEzgSCjJpFZFwqafAC26ga7jhzOJ9pJAx7OomzL65vLu6NxQ
 CODw==
X-Gm-Message-State: AOAM530NF4BiwEys6O6L5AJiPVi7yDGO6i6nPyHfpKnQupMsq1aCwNsJ
 7jDPiFzM4pgqD5eJJyEe7xSs3N9mUtups2kWE0U=
X-Google-Smtp-Source: ABdhPJy4JPu5jzQneglt2jiE/XxJwsBj0NzSJY9ceCi1w+8lWxXlPm96IVa5RfpHu7XarPRF0pB+GfPsfZp98vTTEzc=
X-Received: by 2002:a05:6602:6c9:: with SMTP id n9mr9518iox.91.1599587580932; 
 Tue, 08 Sep 2020 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <1597217150-22911-1-git-send-email-simhavcs@gmail.com>
 <20200812095418.GG6057@pendragon.ideasonboard.com>
 <CAGWqDJ4i=t4Noi7wjGDDhUYkB_uuQ6A-WiMrh1ErKRi2HU9t9w@mail.gmail.com>
 <20200812131818.GI6057@pendragon.ideasonboard.com>
 <CAGWqDJ6eHCNXb5dMCUJ785iUp7gjdCk0bB=GuZesVesaVACucQ@mail.gmail.com>
 <CAGWqDJ5QWyvgJWyink1eH2fHhFWEKSei7XPCdtCRaM1BqRs-Tw@mail.gmail.com>
 <CAGWqDJ7DQbnxBmL9xt3cJoXkcm4aU1Msf-MiJOi12hd61GbJpg@mail.gmail.com>
 <CAGWqDJ4eqDNZFz+F2ybaCzuZ=bvr_4hFq=GGMmPCK0zY1KcyPw@mail.gmail.com>
In-Reply-To: <CAGWqDJ4eqDNZFz+F2ybaCzuZ=bvr_4hFq=GGMmPCK0zY1KcyPw@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 8 Sep 2020 23:22:48 +0530
Message-ID: <CAGWqDJ4zHO4sjXOkG=iSeBhJn4J9+ccr6CKOKcAEBxU31b4VGw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fixes bus formats read
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: multipart/mixed; boundary="===============0914058955=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0914058955==
Content-Type: multipart/alternative; boundary="0000000000008c767e05aed1013b"

--0000000000008c767e05aed1013b
Content-Type: text/plain; charset="UTF-8"

laurent,

Please review or give some feedback.

On Tue, Aug 25, 2020 at 7:57 PM Vinay Simha B N <simhavcs@gmail.com> wrote:

> laurent,
>
> Please review or give some feedback.
>
> On Thu, Aug 13, 2020 at 9:09 PM Vinay Simha B N <simhavcs@gmail.com>
> wrote:
> >
> > laurent,
> >
> > The code sequence was a problem. *num_inputs_fmts =
> > ARRAY_SIZE(tc_lvds_in_bus_fmts); should come first and then allocate
> > the kcalloc.
> >
> > input_fmts = kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts),
> >                              GFP_KERNEL);
> > ..
> >         for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> >                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
> >
> >         *num_inputs_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
> >
> > So, internally in the drm pipeline get set the input format based on
> > the output formats?
> >
> > On Wed, Aug 12, 2020 at 10:45 PM Vinay Simha B N <simhavcs@gmail.com>
> wrote:
> > >
> > > laurent,
> > >
> > > if i add the .atomic_get_input_bus_fmts =
> > > tc_bridge_get_input_bus_fmts, with the implementation suggested,
> > > system does not boot fully, the reason is, we capture all the
> > > supported input formats, but not sure where to set the final input
> > > format. Please suggest.
> > >
> > > for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> > >                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
> > >
> > >         *num_input_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
> > >
> > > On Wed, Aug 12, 2020 at 8:25 PM Vinay Simha B N <simhavcs@gmail.com>
> wrote:
> > > >
> > > > laurent,
> > > >
> > > > Video data input format :  RGB666 loosely packed 24 bits per pixel
> > > > Can we use MEDIA_BUS_FMT_RGB666_1X24_CPADHI? There was no information
> > > > wrt CPADHI or for loosely packed
> > > >
> > > > static const u32 tc_lvds_in_bus_fmts[] = {
> > > >         MEDIA_BUS_FMT_RGB565_1X16,
> > > >         MEDIA_BUS_FMT_RGB666_1X18,
> > > >         MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> > > >         MEDIA_BUS_FMT_RBG888_1X24,
> > > > };
> > > >
> > > > for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> > > >                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
> > > > >> This will have all the available input formats, but finally which
> video data input format chosen?
> > > > Since dsi->format = MIPI_DSI_FMT_RGB888 is used does it chooses
> > > > MEDIA_BUS_FMT_RBG888_1X24 by the drm pipeline
> > > >
> > > > On Wed, Aug 12, 2020 at 6:48 PM Laurent Pinchart
> > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > >
> > > > > Hi Vinay,
> > > > >
> > > > > On Wed, Aug 12, 2020 at 06:07:52PM +0530, Vinay Simha B N wrote:
> > > > > > On Wed, Aug 12, 2020 at 3:24 PM Laurent Pinchart wrote:
> > > > > > > On Wed, Aug 12, 2020 at 12:55:50PM +0530, Vinay Simha BN wrote:
> > > > > > > > - bus formats read from
> drm_bridge_state.output_bus_cfg.format
> > > > > > > >   and .atomic_get_input_bus_fmts() instead of connector
> > > > > > > >
> > > > > > > > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> > > > > > > >
> > > > > > > > ---
> > > > > > > >  v1:
> > > > > > > >  * Laurent Pinchart review comments incorporated
> > > > > > > >    drm_bridge_state.output_bus_cfg.format
> > > > > > > >    instead of connector
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/bridge/tc358775.c | 76
> ++++++++++++++++++++++++++++++---------
> > > > > > > >  1 file changed, 59 insertions(+), 17 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> > > > > > > > index 7da15cd..5d8714a 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/tc358775.c
> > > > > > > > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > > > > > > > @@ -271,6 +271,13 @@ struct tc_data {
> > > > > > > >       struct gpio_desc        *stby_gpio;
> > > > > > > >       u8                      lvds_link; /* single-link or
> dual-link */
> > > > > > > >       u8                      bpc;
> > > > > > > > +     u32                     output_bus_fmt;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +static const u32 tc_lvds_out_bus_fmts[] = {
> > > > > > > > +     MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > > > > > > > +     MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > > > > > > > +     MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  static inline struct tc_data *bridge_to_tc(struct
> drm_bridge *b)
> > > > > > > > @@ -359,19 +366,6 @@ static void d2l_write(struct i2c_client
> *i2c, u16 addr, u32 val)
> > > > > > > >                       ret, addr);
> > > > > > > >  }
> > > > > > > >
> > > > > > > > -/* helper function to access bus_formats */
> > > > > > > > -static struct drm_connector *get_connector(struct
> drm_encoder *encoder)
> > > > > > > > -{
> > > > > > > > -     struct drm_device *dev = encoder->dev;
> > > > > > > > -     struct drm_connector *connector;
> > > > > > > > -
> > > > > > > > -     list_for_each_entry(connector,
> &dev->mode_config.connector_list, head)
> > > > > > > > -             if (connector->encoder == encoder)
> > > > > > > > -                     return connector;
> > > > > > > > -
> > > > > > > > -     return NULL;
> > > > > > > > -}
> > > > > > > > -
> > > > > > > >  static void tc_bridge_enable(struct drm_bridge *bridge)
> > > > > > > >  {
> > > > > > > >       struct tc_data *tc = bridge_to_tc(bridge);
> > > > > > > > @@ -380,7 +374,6 @@ static void tc_bridge_enable(struct
> drm_bridge *bridge)
> > > > > > > >       u32 val = 0;
> > > > > > > >       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
> > > > > > > >       struct drm_display_mode *mode;
> > > > > > > > -     struct drm_connector *connector =
> get_connector(bridge->encoder);
> > > > > > > >
> > > > > > > >       mode = &bridge->encoder->crtc->state->adjusted_mode;
> > > > > > > >
> > > > > > > > @@ -451,14 +444,13 @@ static void tc_bridge_enable(struct
> drm_bridge *bridge)
> > > > > > > >       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) |
> LV_PHY0_ND(6));
> > > > > > > >
> > > > > > > >       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> > > > > > > > -             connector->display_info.bus_formats[0],
> > > > > > > > +             tc->output_bus_fmt,
> > > > > > > >               tc->bpc);
> > > > > > > >       /*
> > > > > > > >        * Default hardware register settings of tc358775
> configured
> > > > > > > >        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24
> format
> > > > > > > >        */
> > > > > > > > -     if (connector->display_info.bus_formats[0] ==
> > > > > > > > -             MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> > > > > > > > +     if (tc->output_bus_fmt ==
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> > > > > > > >               /* VESA-24 */
> > > > > > > >               d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0,
> LVI_R1, LVI_R2, LVI_R3));
> > > > > > > >               d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4,
> LVI_R7, LVI_R5, LVI_G0));
> > > > > > > > @@ -590,6 +582,51 @@ static int tc358775_parse_dt(struct
> device_node *np, struct tc_data *tc)
> > > > > > > >       return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int tc_bridge_atomic_check(struct drm_bridge *bridge,
> > > > > > > > +                               struct drm_bridge_state
> *bridge_state,
> > > > > > > > +                               struct drm_crtc_state
> *crtc_state,
> > > > > > > > +                               struct drm_connector_state
> *conn_state)
> > > > > > > > +{
> > > > > > > > +     struct tc_data *tc = bridge_to_tc(bridge);
> > > > > > > > +
> > > > > > > > +     tc->output_bus_fmt =
> bridge_state->output_bus_cfg.format;
> > > > > > >
> > > > > > > .atomic_check() isn't allowed to modify the device state,
> neither the
> > > > > > > hardware state nor the software state in drm_bridge or
> tc_data. You can
> > > > > > > instead access the bridge state directly in
> tc_bridge_enable(), with
> > > > > > >
> > > > > > >         struct drm_bridge_state *state =
> > > > > > >                 drm_priv_to_bridge_state(bridge->base.state);
> > > > > >
> > > > > > Currently the driver is picking up from the dts panel
> > > > > > (data-mapping = "vesa-24";) or jeida-24 or jeida-18.
> > > > > >
> > > > > > Does state->output_bus_cfg.format  get set from the data-mapping?
> > > > >
> > > > > It should. The drm_panel should take care of that. In
> > > > > panel_simple_get_non_edid_modes(), it calls
> > > > >
> > > > >         if (panel->desc->bus_format)
> > > > >
>  drm_display_info_set_bus_formats(&connector->display_info,
> > > > >
> &panel->desc->bus_format, 1);
> > > > >
> > > > > to initialize the bus format in display_info. Then, the DRM bridge
> > > > > helper drm_atomic_bridge_chain_select_bus_fmts() retrieves the
> output
> > > > > format by calling .atomic_get_output_bus_fmts() if implemented by
> the
> > > > > last bridge in the chain, or directly from the connector
> display_info.
> > > > > The last bridge in the chain is a DRM panel bridge, and doesn't
> > > > > implement .atomic_get_output_bus_fmts(), so the format from
> display_info
> > > > > is used, and is stored in the output_bus_cfg.format field of this
> bridge
> > > > > in select_bus_fmt_recursive().
> > > > >
> > > > > If something doesn't work according to the plan, I can help you
> > > > > debugging.
> > > > >
> > > > > > > > +
> > > > > > > > +     dev_dbg(tc->dev, "output_bus_fmt %04x\n",
> tc->output_bus_fmt);
> > > > > > > > +
> > > > > > > > +     return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static u32 *
> > > > > > > > +tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> > > > > > > > +                          struct drm_bridge_state
> *bridge_state,
> > > > > > > > +                          struct drm_crtc_state *crtc_state,
> > > > > > > > +                          struct drm_connector_state
> *conn_state,
> > > > > > > > +                          u32 output_fmt,
> > > > > > > > +                          unsigned int *num_input_fmts)
> > > > > > > > +{
> > > > > > > > +     u32 *input_fmts = NULL;
> > > > > > > > +     int i;
> > > > > > >
> > > > > > > i only takes positive values, so it can be an unsigned int.
> > > > > > >
> > > > > > > > +
> > > > > > > > +     *num_input_fmts = 0;
> > > > > > > > +
> > > > > > > > +     for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ;
> ++i) {
> > > > > > > > +             if (output_fmt == tc_lvds_out_bus_fmts[i]) {
> > > > > > > > +                     *num_input_fmts = 1;
> > > > > > > > +                     input_fmts = kcalloc(*num_input_fmts,
> > > > > > > > +
> sizeof(*input_fmts),
> > > > > > > > +                                          GFP_KERNEL);
> > > > > > > > +                     if (!input_fmts)
> > > > > > > > +                             return NULL;
> > > > > > > > +
> > > > > > > > +                     input_fmts[0] = output_fmt;
> > > > > > >
> > > > > > > I don't think this is right, the input of the bridge isn't
> LVDS, is it ?
> > > > > >
> > > > > > Input to the bridge is DSI, format is already set
> > > > > >
> > > > > > dsi->format = MIPI_DSI_FMT_RGB888;
> > > > > >
> > > > > > enum mipi_dsi_pixel_format {
> > > > > >         MIPI_DSI_FMT_RGB888,
> > > > > >         MIPI_DSI_FMT_RGB666,
> > > > > >         MIPI_DSI_FMT_RGB666_PACKED,
> > > > > >         MIPI_DSI_FMT_RGB565,
> > > > > > };
> > > > > > include/drm/drm_mipi_dsi.h
> > > > > >
> > > > > > Why do we require this atomic_get_input_bus_fmts?
> > > > > >
> > > > > > Do i need to implement both atomic_get_input_bus_fmts and
> > > > > > atomic_get_output_bus_fmts?
> > > > >
> > > > > .atomic_get_output_bus_fmts() is only need for the last bridge in
> the
> > > > > chain, and is not mandatory when that bridge supports a single
> format.
> > > > > As this bridge can't be last (if the output is connect to a panel,
> there
> > > > > will be a drm_bridge wrapping the drm_panel), you don't have to
> > > > > implement that operation.
> > > > >
> > > > > .atomic_get_input_bus_fmts() is used to negotiate formats along the
> > > > > pipeline. The helps the DRM bridge helpers figure out what formats
> are
> > > > > possible, with the help of bridges that must report what input
> formats
> > > > > are compatible with a given output format. The DRM bridge helpers
> will
> > > > > take care of the rest.
> > > > >
> > > > > So, for this bridge, the input and output formats are decoupled.
> The
> > > > > bridge can output any of the three supported LVDS formats,
> regardless of
> > > > > what format it gets at its input. You should thus verify that the
> output
> > > > > format you receive in this function is supported (and return NULL
> if it
> > > > > isn't), and then return the list of supported input formats. If you
> > > > > don't implement .atomic_get_input_bus_fmts(), then the DRM bridge
> > > > > helpers will consider that the input and output formats are the
> same,
> > > > > and will set the output format of the previous bridge to, for
> example,
> > > > > MEDIA_BUS_FMT_RGB666_1X7X3_SPWG. It may work if the previous bridge
> > > > > doesn't care about its output format, but if it does, then it will
> be
> > > > > puzzled, as the previous bridge outputs DSI, not LVDS.
> > > > >
> > > > > > > As far as I can tell, the hardware support transcoding any of
> the
> > > > > > > supported input formats (RGB565, RGB666 or RGB888) to any of
> the
> > > > > > > supported output formats. How about the following ?
> > > > > > >
> > > > > > > static const u32 tc_lvds_in_bus_fmts[] = {
> > > > > > >         MEDIA_BUS_FMT_RGB565_1X16,
> > > > > > >         MEDIA_BUS_FMT_RGB666_1X18,
> > > > > > >         MEDIA_BUS_FMT_RBG888_1X24,
> > > > > > > };
> > > > > > >
> > > > > > > ...
> > > > > > >
> > > > > > >         u32 *input_fmts;
> > > > > > >         unsigned int i;
> > > > > > >
> > > > > > >         *num_input_fmts = 0;
> > > > > > >
> > > > > > >         for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ;
> ++i) {
> > > > > > >                 if (output_fmt == tc_lvds_out_bus_fmts[i])
> > > > > > >                         break;
> > > > > > >         }
> > > > > > >
> > > > > > >         if (i == ARRAY_SIZE(tc_lvds_out_bus_fmts))
> > > > > > >                 return NULL;
> > > > > > >
> > > > > > >         input_fmts = kcalloc(*num_input_fmts,
> ARRAY_SIZE(tc_lvds_in_bus_fmts),
> > > > > > >                              GFP_KERNEL);
> > > > > > >         if (!input_fmts)
> > > > > > >                 return NULL;
> > > > > > >
> > > > > > >         for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> > > > > > >                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
> > > > > > >
> > > > > > >         *num_inputs_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
> > > > > > >         return input_fmts;
> > > > > > >
> > > > > > > > +
> > > > > > > > +                     break;
> > > > > > > > +             }
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     return input_fmts;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static int tc_bridge_attach(struct drm_bridge *bridge,
> > > > > > > >                           enum drm_bridge_attach_flags flags)
> > > > > > > >  {
> > > > > > > > @@ -639,6 +676,11 @@ static int tc_bridge_attach(struct
> drm_bridge *bridge,
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct drm_bridge_funcs tc_bridge_funcs = {
> > > > > > > > +     .atomic_duplicate_state =
> drm_atomic_helper_bridge_duplicate_state,
> > > > > > > > +     .atomic_destroy_state =
> drm_atomic_helper_bridge_destroy_state,
> > > > > > > > +     .atomic_reset = drm_atomic_helper_bridge_reset,
> > > > > > > > +     .atomic_get_input_bus_fmts =
> tc_bridge_get_input_bus_fmts,
> > > > > > > > +     .atomic_check = tc_bridge_atomic_check,
> > > > > > > >       .attach = tc_bridge_attach,
> > > > > > > >       .pre_enable = tc_bridge_pre_enable,
> > > > > > > >       .enable = tc_bridge_enable,
> > > > >
> > > > > --
> > > > > Regards,
> > > > >
> > > > > Laurent Pinchart
> > > >
> > > >
> > > >
> > > > --
> > > > regards,
> > > > vinaysimha
> > >
> > >
> > >
> > > --
> > > regards,
> > > vinaysimha
> >
> >
> >
> > --
> > regards,
> > vinaysimha
>
>
>
> --
> regards,
> vinaysimha
>


-- 
regards,
vinaysimha

--0000000000008c767e05aed1013b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">laurent,<br>
<br>
Please review or give some feedback.</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 7:57 PM Vinay S=
imha B N &lt;<a href=3D"mailto:simhavcs@gmail.com">simhavcs@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">lauren=
t,<br>
<br>
Please review or give some feedback.<br>
<br>
On Thu, Aug 13, 2020 at 9:09 PM Vinay Simha B N &lt;<a href=3D"mailto:simha=
vcs@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; laurent,<br>
&gt;<br>
&gt; The code sequence was a problem. *num_inputs_fmts =3D<br>
&gt; ARRAY_SIZE(tc_lvds_in_bus_fmts); should come first and then allocate<b=
r>
&gt; the kcalloc.<br>
&gt;<br>
&gt; input_fmts =3D kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts=
),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br>
&gt; ..<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(tc_lv=
ds_in_bus_fmts); ++i)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_fmt=
s[i] =3D tc_lvds_in_bus_fmts[i];<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*num_inputs_fmts =3D ARRAY_SIZE(tc_lv=
ds_in_bus_fmts);<br>
&gt;<br>
&gt; So, internally in the drm pipeline get set the input format based on<b=
r>
&gt; the output formats?<br>
&gt;<br>
&gt; On Wed, Aug 12, 2020 at 10:45 PM Vinay Simha B N &lt;<a href=3D"mailto=
:simhavcs@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; laurent,<br>
&gt; &gt;<br>
&gt; &gt; if i add the .atomic_get_input_bus_fmts =3D<br>
&gt; &gt; tc_bridge_get_input_bus_fmts, with the implementation suggested,<=
br>
&gt; &gt; system does not boot fully, the reason is, we capture all the<br>
&gt; &gt; supported input formats, but not sure where to set the final inpu=
t<br>
&gt; &gt; format. Please suggest.<br>
&gt; &gt;<br>
&gt; &gt; for (i =3D 0; i &lt; ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inpu=
t_fmts[i] =3D tc_lvds_in_bus_fmts[i];<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*num_input_fmts =3D ARRAY_SIZE(t=
c_lvds_in_bus_fmts);<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Aug 12, 2020 at 8:25 PM Vinay Simha B N &lt;<a href=3D"ma=
ilto:simhavcs@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; laurent,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Video data input format :=C2=A0 RGB666 loosely packed 24 bit=
s per pixel<br>
&gt; &gt; &gt; Can we use MEDIA_BUS_FMT_RGB666_1X24_CPADHI? There was no in=
formation<br>
&gt; &gt; &gt; wrt CPADHI or for loosely packed<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; static const u32 tc_lvds_in_bus_fmts[] =3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB565_1X16,<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB666_1X18,<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB666_1X24_C=
PADHI,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RBG888_1X24,<=
br>
&gt; &gt; &gt; };<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; for (i =3D 0; i &lt; ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0input_fmts[i] =3D tc_lvds_in_bus_fmts[i];<br>
&gt; &gt; &gt; &gt;&gt; This will have all the available input formats, but=
 finally which video data input format chosen?<br>
&gt; &gt; &gt; Since dsi-&gt;format =3D MIPI_DSI_FMT_RGB888 is used does it=
 chooses<br>
&gt; &gt; &gt; MEDIA_BUS_FMT_RBG888_1X24 by the drm pipeline<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Aug 12, 2020 at 6:48 PM Laurent Pinchart<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:laurent.pinchart@ideasonboard.com" tar=
get=3D"_blank">laurent.pinchart@ideasonboard.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Vinay,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Aug 12, 2020 at 06:07:52PM +0530, Vinay Simha B=
 N wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Aug 12, 2020 at 3:24 PM Laurent Pinchart w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, Aug 12, 2020 at 12:55:50PM +0530, Vin=
ay Simha BN wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; - bus formats read from drm_bridge_state=
.output_bus_cfg.format<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0and .atomic_get_input_bus_fm=
ts() instead of connector<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Vinay Simha BN &lt;<a hre=
f=3D"mailto:simhavcs@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 v1:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 * Laurent Pinchart review comments=
 incorporated<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 drm_bridge_state.output_bus=
_cfg.format<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 instead of connector<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/bridge/tc358775.c =
| 76 ++++++++++++++++++++++++++++++---------<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 59 insertions(+), =
17 deletions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/bridge/tc35=
8775.c b/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; index 7da15cd..5d8714a 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/bridge/tc358775.c<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/bridge/tc358775.c<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -271,6 +271,13 @@ struct tc_data {<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_de=
sc=C2=A0 =C2=A0 =C2=A0 =C2=A0 *stby_gpio;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds_lin=
k; /* single-link or dual-link */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpc;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_bus_fm=
t;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +static const u32 tc_lvds_out_bus_fmts[]=
 =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB88=
8_1X7X4_JEIDA,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB88=
8_1X7X4_SPWG,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB66=
6_1X7X3_SPWG,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 static inline struct tc_data *brid=
ge_to_tc(struct drm_bridge *b)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -359,19 +366,6 @@ static void d2l_wri=
te(struct i2c_client *i2c, u16 addr, u32 val)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret, addr);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -/* helper function to access bus_format=
s */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -static struct drm_connector *get_connec=
tor(struct drm_encoder *encoder)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *=
dev =3D encoder-&gt;dev;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct drm_connecto=
r *connector;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry=
(connector, &amp;dev-&gt;mode_config.connector_list, head)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (connector-&gt;encoder =3D=3D encoder)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return connector;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 static void tc_bridge_enable(struc=
t drm_bridge *bridge)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data=
 *tc =3D bridge_to_tc(bridge);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -380,7 +374,6 @@ static void tc_bridg=
e_enable(struct drm_bridge *bridge)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D 0;=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 dsiclk, cl=
kdiv, byteclk, t1, t2, t3, vsdelay;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_dis=
play_mode *mode;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct drm_connecto=
r *connector =3D get_connector(bridge-&gt;encoder);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D &amp;=
bridge-&gt;encoder-&gt;crtc-&gt;state-&gt;adjusted_mode;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -451,14 +444,13 @@ static void tc_bri=
dge_enable(struct drm_bridge *bridge)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&=
gt;i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt=
;dev, &quot;bus_formats %04x bpc %d\n&quot;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0connector-&gt;display_info.bus_formats[0],<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tc-&gt;output_bus_fmt,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tc-&gt;bpc);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Default har=
dware register settings of tc358775 configured<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with MEDIA_=
BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (connector-&gt;d=
isplay_info.bus_formats[0] =3D=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;output_b=
us_fmt =3D=3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* VESA-24 */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2=
, LVI_R3));<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5=
, LVI_G0));<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -590,6 +582,51 @@ static int tc358775=
_parse_dt(struct device_node *np, struct tc_data *tc)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +static int tc_bridge_atomic_check(struc=
t drm_bridge *bridge,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct drm_bridge_state *bridge_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct drm_crtc_state *crtc_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct drm_connector_state *conn_state)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =
=3D bridge_to_tc(bridge);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;output_bus_f=
mt =3D bridge_state-&gt;output_bus_cfg.format;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; .atomic_check() isn&#39;t allowed to modify t=
he device state, neither the<br>
&gt; &gt; &gt; &gt; &gt; &gt; hardware state nor the software state in drm_=
bridge or tc_data. You can<br>
&gt; &gt; &gt; &gt; &gt; &gt; instead access the bridge state directly in t=
c_bridge_enable(), with<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_b=
ridge_state *state =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_priv_to_bridge_state(bridge-&gt;base.state);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Currently the driver is picking up from the dts pa=
nel<br>
&gt; &gt; &gt; &gt; &gt; (data-mapping =3D &quot;vesa-24&quot;;) or jeida-2=
4 or jeida-18.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Does state-&gt;output_bus_cfg.format=C2=A0 get set=
 from the data-mapping?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It should. The drm_panel should take care of that. In<b=
r>
&gt; &gt; &gt; &gt; panel_simple_get_non_edid_modes(), it calls<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (panel-&gt;desc-&gt=
;bus_format)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0drm_display_info_set_bus_formats(&amp;connector-&gt;display_info,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;panel-&gt;desc-&gt;bus_f=
ormat, 1);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; to initialize the bus format in display_info. Then, the=
 DRM bridge<br>
&gt; &gt; &gt; &gt; helper drm_atomic_bridge_chain_select_bus_fmts() retrie=
ves the output<br>
&gt; &gt; &gt; &gt; format by calling .atomic_get_output_bus_fmts() if impl=
emented by the<br>
&gt; &gt; &gt; &gt; last bridge in the chain, or directly from the connecto=
r display_info.<br>
&gt; &gt; &gt; &gt; The last bridge in the chain is a DRM panel bridge, and=
 doesn&#39;t<br>
&gt; &gt; &gt; &gt; implement .atomic_get_output_bus_fmts(), so the format =
from display_info<br>
&gt; &gt; &gt; &gt; is used, and is stored in the output_bus_cfg.format fie=
ld of this bridge<br>
&gt; &gt; &gt; &gt; in select_bus_fmt_recursive().<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If something doesn&#39;t work according to the plan, I =
can help you<br>
&gt; &gt; &gt; &gt; debugging.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev,=
 &quot;output_bus_fmt %04x\n&quot;, tc-&gt;output_bus_fmt);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +static u32 *<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +tc_bridge_get_input_bus_fmts(struct drm=
_bridge *bridge,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_stat=
e *bridge_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state =
*crtc_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_connector_s=
tate *conn_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 output_fmt,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int *num_inpu=
t_fmts)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 *input_fmts =3D=
 NULL;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; i only takes positive values, so it can be an=
 unsigned int.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*num_input_fmts =3D=
 0;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0 ; i &l=
t; ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (output_fmt =3D=3D tc_lvds_out_bus_fmts[i]) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*num_input_fmts =3D 1;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_fmts =3D kcalloc(*num_input_fmt=
s,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*input_fmts),<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!input_fmts)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NU=
LL;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_fmts[0] =3D output_fmt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I don&#39;t think this is right, the input of=
 the bridge isn&#39;t LVDS, is it ?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Input to the bridge is DSI, format is already set<=
br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; dsi-&gt;format =3D MIPI_DSI_FMT_RGB888;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; enum mipi_dsi_pixel_format {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPI_DSI_FMT_RGB8=
88,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPI_DSI_FMT_RGB6=
66,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPI_DSI_FMT_RGB6=
66_PACKED,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPI_DSI_FMT_RGB5=
65,<br>
&gt; &gt; &gt; &gt; &gt; };<br>
&gt; &gt; &gt; &gt; &gt; include/drm/drm_mipi_dsi.h<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Why do we require this atomic_get_input_bus_fmts?<=
br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Do i need to implement both atomic_get_input_bus_f=
mts and<br>
&gt; &gt; &gt; &gt; &gt; atomic_get_output_bus_fmts?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; .atomic_get_output_bus_fmts() is only need for the last=
 bridge in the<br>
&gt; &gt; &gt; &gt; chain, and is not mandatory when that bridge supports a=
 single format.<br>
&gt; &gt; &gt; &gt; As this bridge can&#39;t be last (if the output is conn=
ect to a panel, there<br>
&gt; &gt; &gt; &gt; will be a drm_bridge wrapping the drm_panel), you don&#=
39;t have to<br>
&gt; &gt; &gt; &gt; implement that operation.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; .atomic_get_input_bus_fmts() is used to negotiate forma=
ts along the<br>
&gt; &gt; &gt; &gt; pipeline. The helps the DRM bridge helpers figure out w=
hat formats are<br>
&gt; &gt; &gt; &gt; possible, with the help of bridges that must report wha=
t input formats<br>
&gt; &gt; &gt; &gt; are compatible with a given output format. The DRM brid=
ge helpers will<br>
&gt; &gt; &gt; &gt; take care of the rest.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; So, for this bridge, the input and output formats are d=
ecoupled. The<br>
&gt; &gt; &gt; &gt; bridge can output any of the three supported LVDS forma=
ts, regardless of<br>
&gt; &gt; &gt; &gt; what format it gets at its input. You should thus verif=
y that the output<br>
&gt; &gt; &gt; &gt; format you receive in this function is supported (and r=
eturn NULL if it<br>
&gt; &gt; &gt; &gt; isn&#39;t), and then return the list of supported input=
 formats. If you<br>
&gt; &gt; &gt; &gt; don&#39;t implement .atomic_get_input_bus_fmts(), then =
the DRM bridge<br>
&gt; &gt; &gt; &gt; helpers will consider that the input and output formats=
 are the same,<br>
&gt; &gt; &gt; &gt; and will set the output format of the previous bridge t=
o, for example,<br>
&gt; &gt; &gt; &gt; MEDIA_BUS_FMT_RGB666_1X7X3_SPWG. It may work if the pre=
vious bridge<br>
&gt; &gt; &gt; &gt; doesn&#39;t care about its output format, but if it doe=
s, then it will be<br>
&gt; &gt; &gt; &gt; puzzled, as the previous bridge outputs DSI, not LVDS.<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; As far as I can tell, the hardware support tr=
anscoding any of the<br>
&gt; &gt; &gt; &gt; &gt; &gt; supported input formats (RGB565, RGB666 or RG=
B888) to any of the<br>
&gt; &gt; &gt; &gt; &gt; &gt; supported output formats. How about the follo=
wing ?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; static const u32 tc_lvds_in_bus_fmts[] =3D {<=
br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FM=
T_RGB565_1X16,<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FM=
T_RGB666_1X18,<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FM=
T_RBG888_1X24,<br>
&gt; &gt; &gt; &gt; &gt; &gt; };<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ...<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *input_f=
mts;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=
 i;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*num_input_f=
mts =3D 0;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0=
 ; i &lt; ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (output_fmt =3D=3D tc_lvds_out_bus_fmts[i])<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D=
 ARRAY_SIZE(tc_lvds_out_bus_fmts))<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_fmts =
=3D kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts),<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br=
>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!input_f=
mts)<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0=
; i &lt; ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0input_fmts[i] =3D tc_lvds_in_bus_fmts[i];<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*num_inputs_=
fmts =3D ARRAY_SIZE(tc_lvds_in_bus_fmts);<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return input=
_fmts;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return input_fmts;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 static int tc_bridge_attach(struct=
 drm_bridge *bridge,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum drm_bridge_att=
ach_flags flags)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -639,6 +676,11 @@ static int tc_bridg=
e_attach(struct drm_bridge *bridge,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 static const struct drm_bridge_fun=
cs tc_bridge_funcs =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_s=
tate =3D drm_atomic_helper_bridge_duplicate_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_sta=
te =3D drm_atomic_helper_bridge_destroy_state,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.atomic_reset =3D d=
rm_atomic_helper_bridge_reset,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.atomic_get_input_b=
us_fmts =3D tc_bridge_get_input_bus_fmts,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check =3D t=
c_bridge_atomic_check,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach =3D tc=
_bridge_attach,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pre_enable =
=3D tc_bridge_pre_enable,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable =3D tc=
_bridge_enable,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Laurent Pinchart<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; regards,<br>
&gt; &gt; &gt; vinaysimha<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; regards,<br>
&gt; &gt; vinaysimha<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; regards,<br>
&gt; vinaysimha<br>
<br>
<br>
<br>
-- <br>
regards,<br>
vinaysimha<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--0000000000008c767e05aed1013b--

--===============0914058955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0914058955==--
