Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2F245D2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9F6E4C7;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C916EA0C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 15:39:55 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z6so7752919iow.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VcH9CBWXe4/SJjY+QonHvUkX8ccdq1awzN/4IKy6pZU=;
 b=oCJRrazB36eSXARnVI4PoDwHBL5OG6Fc9q7mxl3hISZjr7icrhMW4wcRhW+iIzW7gl
 Z0MUF7zjjdezwD78reV7eSQRprYLeoCQhokNSLQI9bDhcNY35HNTdoPf9dk+qQmacPTL
 W6RNv1B8EIaCvpsOFiUwUfMOL5+So2A39pOXRm8SH4KxoQJtLNtvQ252BAp/eMuRn/3F
 gm29S+kYmeQMaLyLGZyeYMmJk4EaZZpSGwGIG8BRq2LhiCoNcM9MSY069Y0ODCzhYgkz
 WCBhqcoFwlvjSSu8cI6emdPskLXP1mWN804zD2MMK2EgfdC257BMjHtV4E6/sLrHqDda
 huRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VcH9CBWXe4/SJjY+QonHvUkX8ccdq1awzN/4IKy6pZU=;
 b=m9cSkgxrtPdV8WaAGnQjW1sdo0AUgpcF7mVGBxL4yHnfQqun9TLWAnYR0nZTVq8HcU
 0CoWjY7+9xPxrISVgt5ew5jcJz+4FJEfSU7lXcCPHUWIpyT/3b7EZU3UnD/l+mf85/ah
 mjuBmQ8Y+rjo0zlY003XyrXJ/VLD48But0D2D1Kts8KvRxcRUmZ6MC4pjVopnuDsWxBN
 qr6KO6Gp6qaV2EbIFfipXALQaH+DjfSJ/JuqlcjInU4Dnf2Q+hRgckmHU6RS/LJgLy0G
 ah3X9L3WdZRK0bMJJ58viuFoKBk5p36O9VLotL44lH6CNhhLwL1kwVehg4tIa+hX/nMs
 vxdQ==
X-Gm-Message-State: AOAM533kAlwV9tWjaV6LWGCqUzbaZn9weSs6zhPVj10F6/DBn0QiONyF
 AmBit7cKRtH4T4zGTGBpnixrLmzBH3yEpV4sFLE=
X-Google-Smtp-Source: ABdhPJyCLl3XLc/+U0uEHzOEbh4pAXu1X4umIUj4fEloHLLb8gHUnbItmpstNhcH5rCVM4vUWdOQIfg3RYD31yMHli4=
X-Received: by 2002:a05:6602:15d3:: with SMTP id
 f19mr5274746iow.91.1597333195069; 
 Thu, 13 Aug 2020 08:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <1597217150-22911-1-git-send-email-simhavcs@gmail.com>
 <20200812095418.GG6057@pendragon.ideasonboard.com>
 <CAGWqDJ4i=t4Noi7wjGDDhUYkB_uuQ6A-WiMrh1ErKRi2HU9t9w@mail.gmail.com>
 <20200812131818.GI6057@pendragon.ideasonboard.com>
 <CAGWqDJ6eHCNXb5dMCUJ785iUp7gjdCk0bB=GuZesVesaVACucQ@mail.gmail.com>
 <CAGWqDJ5QWyvgJWyink1eH2fHhFWEKSei7XPCdtCRaM1BqRs-Tw@mail.gmail.com>
In-Reply-To: <CAGWqDJ5QWyvgJWyink1eH2fHhFWEKSei7XPCdtCRaM1BqRs-Tw@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Thu, 13 Aug 2020 21:09:43 +0530
Message-ID: <CAGWqDJ7DQbnxBmL9xt3cJoXkcm4aU1Msf-MiJOi12hd61GbJpg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fixes bus formats read
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

laurent,

The code sequence was a problem. *num_inputs_fmts =
ARRAY_SIZE(tc_lvds_in_bus_fmts); should come first and then allocate
the kcalloc.

input_fmts = kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts),
                             GFP_KERNEL);
..
        for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
                input_fmts[i] = tc_lvds_in_bus_fmts[i];

        *num_inputs_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);

So, internally in the drm pipeline get set the input format based on
the output formats?

On Wed, Aug 12, 2020 at 10:45 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> laurent,
>
> if i add the .atomic_get_input_bus_fmts =
> tc_bridge_get_input_bus_fmts, with the implementation suggested,
> system does not boot fully, the reason is, we capture all the
> supported input formats, but not sure where to set the final input
> format. Please suggest.
>
> for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
>                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
>
>         *num_input_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
>
> On Wed, Aug 12, 2020 at 8:25 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
> >
> > laurent,
> >
> > Video data input format :  RGB666 loosely packed 24 bits per pixel
> > Can we use MEDIA_BUS_FMT_RGB666_1X24_CPADHI? There was no information
> > wrt CPADHI or for loosely packed
> >
> > static const u32 tc_lvds_in_bus_fmts[] = {
> >         MEDIA_BUS_FMT_RGB565_1X16,
> >         MEDIA_BUS_FMT_RGB666_1X18,
> >         MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> >         MEDIA_BUS_FMT_RBG888_1X24,
> > };
> >
> > for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> >                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
> > >> This will have all the available input formats, but finally which video data input format chosen?
> > Since dsi->format = MIPI_DSI_FMT_RGB888 is used does it chooses
> > MEDIA_BUS_FMT_RBG888_1X24 by the drm pipeline
> >
> > On Wed, Aug 12, 2020 at 6:48 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Vinay,
> > >
> > > On Wed, Aug 12, 2020 at 06:07:52PM +0530, Vinay Simha B N wrote:
> > > > On Wed, Aug 12, 2020 at 3:24 PM Laurent Pinchart wrote:
> > > > > On Wed, Aug 12, 2020 at 12:55:50PM +0530, Vinay Simha BN wrote:
> > > > > > - bus formats read from drm_bridge_state.output_bus_cfg.format
> > > > > >   and .atomic_get_input_bus_fmts() instead of connector
> > > > > >
> > > > > > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> > > > > >
> > > > > > ---
> > > > > >  v1:
> > > > > >  * Laurent Pinchart review comments incorporated
> > > > > >    drm_bridge_state.output_bus_cfg.format
> > > > > >    instead of connector
> > > > > > ---
> > > > > >  drivers/gpu/drm/bridge/tc358775.c | 76 ++++++++++++++++++++++++++++++---------
> > > > > >  1 file changed, 59 insertions(+), 17 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> > > > > > index 7da15cd..5d8714a 100644
> > > > > > --- a/drivers/gpu/drm/bridge/tc358775.c
> > > > > > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > > > > > @@ -271,6 +271,13 @@ struct tc_data {
> > > > > >       struct gpio_desc        *stby_gpio;
> > > > > >       u8                      lvds_link; /* single-link or dual-link */
> > > > > >       u8                      bpc;
> > > > > > +     u32                     output_bus_fmt;
> > > > > > +};
> > > > > > +
> > > > > > +static const u32 tc_lvds_out_bus_fmts[] = {
> > > > > > +     MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > > > > > +     MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > > > > > +     MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > > > > >  };
> > > > > >
> > > > > >  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> > > > > > @@ -359,19 +366,6 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
> > > > > >                       ret, addr);
> > > > > >  }
> > > > > >
> > > > > > -/* helper function to access bus_formats */
> > > > > > -static struct drm_connector *get_connector(struct drm_encoder *encoder)
> > > > > > -{
> > > > > > -     struct drm_device *dev = encoder->dev;
> > > > > > -     struct drm_connector *connector;
> > > > > > -
> > > > > > -     list_for_each_entry(connector, &dev->mode_config.connector_list, head)
> > > > > > -             if (connector->encoder == encoder)
> > > > > > -                     return connector;
> > > > > > -
> > > > > > -     return NULL;
> > > > > > -}
> > > > > > -
> > > > > >  static void tc_bridge_enable(struct drm_bridge *bridge)
> > > > > >  {
> > > > > >       struct tc_data *tc = bridge_to_tc(bridge);
> > > > > > @@ -380,7 +374,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
> > > > > >       u32 val = 0;
> > > > > >       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
> > > > > >       struct drm_display_mode *mode;
> > > > > > -     struct drm_connector *connector = get_connector(bridge->encoder);
> > > > > >
> > > > > >       mode = &bridge->encoder->crtc->state->adjusted_mode;
> > > > > >
> > > > > > @@ -451,14 +444,13 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
> > > > > >       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
> > > > > >
> > > > > >       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> > > > > > -             connector->display_info.bus_formats[0],
> > > > > > +             tc->output_bus_fmt,
> > > > > >               tc->bpc);
> > > > > >       /*
> > > > > >        * Default hardware register settings of tc358775 configured
> > > > > >        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> > > > > >        */
> > > > > > -     if (connector->display_info.bus_formats[0] ==
> > > > > > -             MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> > > > > > +     if (tc->output_bus_fmt == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> > > > > >               /* VESA-24 */
> > > > > >               d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
> > > > > >               d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));
> > > > > > @@ -590,6 +582,51 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int tc_bridge_atomic_check(struct drm_bridge *bridge,
> > > > > > +                               struct drm_bridge_state *bridge_state,
> > > > > > +                               struct drm_crtc_state *crtc_state,
> > > > > > +                               struct drm_connector_state *conn_state)
> > > > > > +{
> > > > > > +     struct tc_data *tc = bridge_to_tc(bridge);
> > > > > > +
> > > > > > +     tc->output_bus_fmt = bridge_state->output_bus_cfg.format;
> > > > >
> > > > > .atomic_check() isn't allowed to modify the device state, neither the
> > > > > hardware state nor the software state in drm_bridge or tc_data. You can
> > > > > instead access the bridge state directly in tc_bridge_enable(), with
> > > > >
> > > > >         struct drm_bridge_state *state =
> > > > >                 drm_priv_to_bridge_state(bridge->base.state);
> > > >
> > > > Currently the driver is picking up from the dts panel
> > > > (data-mapping = "vesa-24";) or jeida-24 or jeida-18.
> > > >
> > > > Does state->output_bus_cfg.format  get set from the data-mapping?
> > >
> > > It should. The drm_panel should take care of that. In
> > > panel_simple_get_non_edid_modes(), it calls
> > >
> > >         if (panel->desc->bus_format)
> > >                 drm_display_info_set_bus_formats(&connector->display_info,
> > >                                                  &panel->desc->bus_format, 1);
> > >
> > > to initialize the bus format in display_info. Then, the DRM bridge
> > > helper drm_atomic_bridge_chain_select_bus_fmts() retrieves the output
> > > format by calling .atomic_get_output_bus_fmts() if implemented by the
> > > last bridge in the chain, or directly from the connector display_info.
> > > The last bridge in the chain is a DRM panel bridge, and doesn't
> > > implement .atomic_get_output_bus_fmts(), so the format from display_info
> > > is used, and is stored in the output_bus_cfg.format field of this bridge
> > > in select_bus_fmt_recursive().
> > >
> > > If something doesn't work according to the plan, I can help you
> > > debugging.
> > >
> > > > > > +
> > > > > > +     dev_dbg(tc->dev, "output_bus_fmt %04x\n", tc->output_bus_fmt);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static u32 *
> > > > > > +tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> > > > > > +                          struct drm_bridge_state *bridge_state,
> > > > > > +                          struct drm_crtc_state *crtc_state,
> > > > > > +                          struct drm_connector_state *conn_state,
> > > > > > +                          u32 output_fmt,
> > > > > > +                          unsigned int *num_input_fmts)
> > > > > > +{
> > > > > > +     u32 *input_fmts = NULL;
> > > > > > +     int i;
> > > > >
> > > > > i only takes positive values, so it can be an unsigned int.
> > > > >
> > > > > > +
> > > > > > +     *num_input_fmts = 0;
> > > > > > +
> > > > > > +     for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
> > > > > > +             if (output_fmt == tc_lvds_out_bus_fmts[i]) {
> > > > > > +                     *num_input_fmts = 1;
> > > > > > +                     input_fmts = kcalloc(*num_input_fmts,
> > > > > > +                                          sizeof(*input_fmts),
> > > > > > +                                          GFP_KERNEL);
> > > > > > +                     if (!input_fmts)
> > > > > > +                             return NULL;
> > > > > > +
> > > > > > +                     input_fmts[0] = output_fmt;
> > > > >
> > > > > I don't think this is right, the input of the bridge isn't LVDS, is it ?
> > > >
> > > > Input to the bridge is DSI, format is already set
> > > >
> > > > dsi->format = MIPI_DSI_FMT_RGB888;
> > > >
> > > > enum mipi_dsi_pixel_format {
> > > >         MIPI_DSI_FMT_RGB888,
> > > >         MIPI_DSI_FMT_RGB666,
> > > >         MIPI_DSI_FMT_RGB666_PACKED,
> > > >         MIPI_DSI_FMT_RGB565,
> > > > };
> > > > include/drm/drm_mipi_dsi.h
> > > >
> > > > Why do we require this atomic_get_input_bus_fmts?
> > > >
> > > > Do i need to implement both atomic_get_input_bus_fmts and
> > > > atomic_get_output_bus_fmts?
> > >
> > > .atomic_get_output_bus_fmts() is only need for the last bridge in the
> > > chain, and is not mandatory when that bridge supports a single format.
> > > As this bridge can't be last (if the output is connect to a panel, there
> > > will be a drm_bridge wrapping the drm_panel), you don't have to
> > > implement that operation.
> > >
> > > .atomic_get_input_bus_fmts() is used to negotiate formats along the
> > > pipeline. The helps the DRM bridge helpers figure out what formats are
> > > possible, with the help of bridges that must report what input formats
> > > are compatible with a given output format. The DRM bridge helpers will
> > > take care of the rest.
> > >
> > > So, for this bridge, the input and output formats are decoupled. The
> > > bridge can output any of the three supported LVDS formats, regardless of
> > > what format it gets at its input. You should thus verify that the output
> > > format you receive in this function is supported (and return NULL if it
> > > isn't), and then return the list of supported input formats. If you
> > > don't implement .atomic_get_input_bus_fmts(), then the DRM bridge
> > > helpers will consider that the input and output formats are the same,
> > > and will set the output format of the previous bridge to, for example,
> > > MEDIA_BUS_FMT_RGB666_1X7X3_SPWG. It may work if the previous bridge
> > > doesn't care about its output format, but if it does, then it will be
> > > puzzled, as the previous bridge outputs DSI, not LVDS.
> > >
> > > > > As far as I can tell, the hardware support transcoding any of the
> > > > > supported input formats (RGB565, RGB666 or RGB888) to any of the
> > > > > supported output formats. How about the following ?
> > > > >
> > > > > static const u32 tc_lvds_in_bus_fmts[] = {
> > > > >         MEDIA_BUS_FMT_RGB565_1X16,
> > > > >         MEDIA_BUS_FMT_RGB666_1X18,
> > > > >         MEDIA_BUS_FMT_RBG888_1X24,
> > > > > };
> > > > >
> > > > > ...
> > > > >
> > > > >         u32 *input_fmts;
> > > > >         unsigned int i;
> > > > >
> > > > >         *num_input_fmts = 0;
> > > > >
> > > > >         for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
> > > > >                 if (output_fmt == tc_lvds_out_bus_fmts[i])
> > > > >                         break;
> > > > >         }
> > > > >
> > > > >         if (i == ARRAY_SIZE(tc_lvds_out_bus_fmts))
> > > > >                 return NULL;
> > > > >
> > > > >         input_fmts = kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts),
> > > > >                              GFP_KERNEL);
> > > > >         if (!input_fmts)
> > > > >                 return NULL;
> > > > >
> > > > >         for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> > > > >                 input_fmts[i] = tc_lvds_in_bus_fmts[i];
> > > > >
> > > > >         *num_inputs_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
> > > > >         return input_fmts;
> > > > >
> > > > > > +
> > > > > > +                     break;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     return input_fmts;
> > > > > > +}
> > > > > > +
> > > > > >  static int tc_bridge_attach(struct drm_bridge *bridge,
> > > > > >                           enum drm_bridge_attach_flags flags)
> > > > > >  {
> > > > > > @@ -639,6 +676,11 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
> > > > > >  }
> > > > > >
> > > > > >  static const struct drm_bridge_funcs tc_bridge_funcs = {
> > > > > > +     .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > > > > +     .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > > > > > +     .atomic_reset = drm_atomic_helper_bridge_reset,
> > > > > > +     .atomic_get_input_bus_fmts = tc_bridge_get_input_bus_fmts,
> > > > > > +     .atomic_check = tc_bridge_atomic_check,
> > > > > >       .attach = tc_bridge_attach,
> > > > > >       .pre_enable = tc_bridge_pre_enable,
> > > > > >       .enable = tc_bridge_enable,
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
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



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
