Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D631C62B5
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 23:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B48989F4A;
	Tue,  5 May 2020 21:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02489F4A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 21:12:36 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id y10so979696uao.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jG3l2QssozH7tH6QgjUy3dRoIAMx31iazzHnaRrw7Zw=;
 b=Of6p6Ur0B8AhhMB99K9qZOK2un/BmcE5lhnPxoAVYMTa1/U0oVOTLq5t5Ri0Yhsmop
 9jyDmaXOGHCGt6jXwi6G8e73lWO23bM+lZywfTWCeJ3yVWC+P+K7gRp4/GKk7ZWmu3AQ
 s2DMf8qHL9cClqB9We4PpRhvIYA/TysD4vKyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jG3l2QssozH7tH6QgjUy3dRoIAMx31iazzHnaRrw7Zw=;
 b=qbKoX3fEBBWyWQL10fr74vH0B0l3SrZ5XNOm0O1ric/qXiLpYzJymamm7pYPwV+9Ib
 LyYWB0wEgYHBxF9eZ1U1INtjbQ+vWy7rICSohXvKID7NXD7oSYZwLGtjQJh8rMjcqHJ2
 3MhTjct0I3BVaddBbaFLYQgBjgk5N89Rgues5eu0RMA0ficD73Ob/bPGMJFAYa5V++6q
 CYBzCdBK6U8EUihlQKLewLV84ex1U7wX60Muwc3ieUr3isMakIZvFV5KKjs5wIOnNCb6
 GlVLqN7hTO3DQ3XmaB8dh7d3zcLP466/P0tuBu/xsd2k/cDVOo6vW++EtKjPuTWAxl1N
 WORg==
X-Gm-Message-State: AGi0PubO/Blwcb8O1Duk1R7CcwhEtgkPnvNdcXZ9mvq49K6P59zvPI1c
 yNv6kGBmD0qWj9C0WDC2dKABnLYWvbs=
X-Google-Smtp-Source: APiQypKBjvI4J3SNtfKJCp3N+uKlwdozo2lmLcfqr1cyTahmryXGfl4EzVjyih07PJQ3shTPBVPPLg==
X-Received: by 2002:ab0:7356:: with SMTP id k22mr4422211uap.122.1588713154344; 
 Tue, 05 May 2020 14:12:34 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id b6sm88530vkn.31.2020.05.05.14.12.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 14:12:33 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a16so984915uaq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 14:12:32 -0700 (PDT)
X-Received: by 2002:ab0:6806:: with SMTP id z6mr4307507uar.0.1588713152018;
 Tue, 05 May 2020 14:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com>
 <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com>
In-Reply-To: <20200505210609.GA6094@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 May 2020 14:12:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
Message-ID: <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 5, 2020 at 2:06 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, May 05, 2020 at 10:59:30AM -0700, Doug Anderson wrote:
> > On Tue, May 5, 2020 at 1:24 AM Laurent Pinchart wrote:
> > > On Mon, May 04, 2020 at 09:36:31PM -0700, Douglas Anderson wrote:
> > > > The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> > > > remapping of eDP lanes and also polarity inversion.  Both of these
> > > > features have been described in the device tree bindings for the
> > > > device since the beginning but were never implemented in the driver.
> > > > Implement both of them.
> > > >
> > > > Part of this change also allows you to (via the same device tree
> > > > bindings) specify to use fewer than the max number of DP lanes that
> > > > the panel reports.  This could be useful if your display supports more
> > > > lanes but only a few are hooked up on your board.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > > This patch is based upon my my outstanding series[1] not because there
> > > > is any real requirement but simply to avoid merge conflicts.  I
> > > > believe that my previous series is ready to land.  If, however, you'd
> > > > prefer that I rebase this patch somewhere atop something else then
> > > > please shout.
> > > >
> > > > [1] https://lore.kernel.org/r/20200430194617.197510-1-dianders@chromium.org
> > > >
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 75 ++++++++++++++++++++++-----
> > > >  1 file changed, 62 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > index 1a125423eb07..52cca54b525f 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -50,8 +50,12 @@
> > > >  #define SN_CHA_VERTICAL_BACK_PORCH_REG               0x36
> > > >  #define SN_CHA_HORIZONTAL_FRONT_PORCH_REG    0x38
> > > >  #define SN_CHA_VERTICAL_FRONT_PORCH_REG              0x3A
> > > > +#define SN_LN_ASSIGN_REG                     0x59
> > > > +#define  LN_ASSIGN_WIDTH                     2
> > > >  #define SN_ENH_FRAME_REG                     0x5A
> > > >  #define  VSTREAM_ENABLE                              BIT(3)
> > > > +#define  LN_POLRS_OFFSET                     4
> > > > +#define  LN_POLRS_MASK                               0xf0
> > > >  #define SN_DATA_FORMAT_REG                   0x5B
> > > >  #define  BPP_18_RGB                          BIT(0)
> > > >  #define SN_HPD_DISABLE_REG                   0x5C
> > > > @@ -98,6 +102,7 @@
> > > >
> > > >  #define SN_REGULATOR_SUPPLY_NUM              4
> > > >
> > > > +#define SN_MAX_DP_LANES                      4
> > > >  #define SN_NUM_GPIOS                 4
> > > >
> > > >  /**
> > > > @@ -115,6 +120,8 @@
> > > >   * @enable_gpio:  The GPIO we toggle to enable the bridge.
> > > >   * @supplies:     Data for bulk enabling/disabling our regulators.
> > > >   * @dp_lanes:     Count of dp_lanes we're using.
> > > > + * @ln_assign:    Value to program to the LN_ASSIGN register.
> > > > + * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> > > >   *
> > > >   * @gchip:        If we expose our GPIOs, this is used.
> > > >   * @gchip_output: A cache of whether we've set GPIOs to output.  This
> > > > @@ -140,6 +147,8 @@ struct ti_sn_bridge {
> > > >       struct gpio_desc                *enable_gpio;
> > > >       struct regulator_bulk_data      supplies[SN_REGULATOR_SUPPLY_NUM];
> > > >       int                             dp_lanes;
> > > > +     u8                              ln_assign;
> > > > +     u8                              ln_polrs;
> > > >
> > > >       struct gpio_chip                gchip;
> > > >       DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> > > > @@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> > > >       int dp_rate_idx;
> > > >       unsigned int val;
> > > >       int ret = -EINVAL;
> > > > +     int max_dp_lanes;
> > > >
> > > > -     /*
> > > > -      * Run with the maximum number of lanes that the DP sink supports.
> > > > -      *
> > > > -      * Depending use cases, we might want to revisit this later because:
> > > > -      * - It's plausible that someone may have run fewer lines to the
> > > > -      *   sink than the sink actually supports, assuming that the lines
> > > > -      *   will just be driven at a higher rate.
> > > > -      * - The DP spec seems to indicate that it's more important to minimize
> > > > -      *   the number of lanes than the link rate.
> > > > -      *
> > > > -      * If we do revisit, it would be important to measure the power impact.
> > > > -      */
> > > > -     pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
> > > > +     max_dp_lanes = ti_sn_get_max_lanes(pdata);
> > > > +     pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> > > >
> > > >       /* DSI_A lane config */
> > > >       val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
> > > >       regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
> > > >                          CHA_DSI_LANES_MASK, val);
> > > >
> > > > +     regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
> > > > +     regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
> > > > +                        pdata->ln_polrs << LN_POLRS_OFFSET);
> > > > +
> > > >       /* set dsi clk frequency value */
> > > >       ti_sn_bridge_set_dsi_rate(pdata);
> > > >
> > > > @@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> > > >       return ret;
> > > >  }
> > > >
> > > > +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> > > > +                                  struct device_node *np)
> > > > +{
> > > > +     u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
> > > > +     u32 lane_polarities[SN_MAX_DP_LANES] = { };
> > > > +     struct device_node *endpoint;
> > > > +     u8 ln_assign = 0;
> > > > +     u8 ln_polrs = 0;
> > > > +     int dp_lanes;
> > > > +     int i;
> > > > +
> > > > +     /*
> > > > +      * Read config from the device tree about lane remapping and lane
> > > > +      * polarities.  These are optional and we assume identity map and
> > > > +      * normal polarity if nothing is specified.  It's OK to specify just
> > > > +      * data-lanes but not lane-polarities but not vice versa.
> > > > +      */
> > > > +     endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
> > >
> > > Shouldn't you check for endpoint == NULL and fail probe if it is ?
> >
> > I will if you feel strongly, but I don't think it's necessary.  Specifically:
> >
> > 1. By design of_property_count_u32_elems() will return an error if
> > passed a NULL node pointer.
> >
> > 2. When we see an error this function will just init things to defaults.
> >
> > 3. Later code which really needs the endpoint to hook things up
> > properly will catch the error and yell.
> >
> > ...so while I could add a yell here it doesn't seem like it gains much.
>
> As long as it doesn't crash and we eventually catch the error I'm fine.
> I usually try to catch them early as otherwise it gets harder to make
> sure all code paths are sanitized. Up to you.

OK, I'll leave it as-is for now unless someone else chimes in and puts
my opinion in the minority or unless you change your mind and decide
you really hate the way I'm doing it.


> > > > +     dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> > > > +     if (dp_lanes > 0) {
> > > > +             of_property_read_u32_array(endpoint, "data-lanes",
> > > > +                                        lane_assignments, dp_lanes);
> > > > +             of_property_read_u32_array(endpoint, "lane-polarities",
> > > > +                                        lane_polarities, dp_lanes);
> > >
> > > Similarly, with a buggy DT, you may have a buffer overrun here. I would
> > > first check that dp_lanes <= SN_MAX_DP_LANES and error out otherwise.
> >
> > I will definitely add that.  Buffer overrun is no bueno.
> >
> > > > +     } else {
> > > > +             dp_lanes = SN_MAX_DP_LANES;
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * Convert into register format.  Loop over all lanes even if
> > > > +      * data-lanes had fewer elements so that we nicely initialize
> > > > +      * the LN_ASSIGN register.
> > > > +      */
> > > > +     for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
> > > > +             ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
> > > > +             ln_polrs = ln_polrs << 1 | lane_polarities[i];
> > > > +     }
> > >
> > > The datasheet documents the lane remapping register as allowing pretty
> > > much any combination, but "Table 12. Logical to Physical Supported
> > > Combinations" only documents a subset (for instance data-lanes = <2 3>
> > > isn't allowed in that table). Should we guard against invalid
> > > configurations ?
> >
> > As I understand it, in general standard kernel policy is to not sanity
> > check the DT _too_ much.  This feels a bit on the border.  It's up to
> > the person designing the board and writing the dts to not get things
> > like this wrong just like it's up to them to make sure they've setup
> > the i2c pins for our bus w/ the right pullups, configured our
> > interrupt properly, not overvolted things, put in the correct address
> > for MMIO, etc.
> >
> > I wrote this code (untested) and it feels a bit much:
> >
> >   if (dp_lanes == 1) {
> >     if (lane_assignments[0] == 1) {
> >       pr_warn("Lane 0 to physical pin 1 not suggested\n");
> >     } else if (lane_assignments[0] != 0) {
> >       pr_err("Unsupported logical to physical pin mapping\n");
> >       return -EINVAL;
> >     }
> >   } else if (dp_lanes == 2 || dp_lanes == 4) {
> >     u8 good_mask = dp_lanes == 2 ? 0x3 : 0xf;
> >     u8 mask = 0;
> >
> >     for (i = 0; i < dp_lanes; i++)
> >       mask |= BIT(lane_assignments[i])
> >
> >     if (mask != good_mask) {
> >       pr_err("Unsupported logical to physical pin mapping\n");
> >       return -EINVAL;
> >     }
> >   } else {
> >     pr_err("Invalid number of DP lanes: %d\n", dp_lanes);
> >   }
> >
> > If you feel strongly I'll add it to the next version.  Does anyone
> > else have any opinions of whether they'd like all that checking or
> > whether we should just trust the person designing the hardware and
> > writing the device tree to put the right values in?
>
> If we don't want to test that, I would at least document it in the DT
> bindings. It will be a good occasion to switch the bindings to YAML ;-)

Interesting that you bring this up.  Conversion to yaml is sitting
waiting to land (or additional review comments):

https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid/

I'll add this documentation into the comments of the yaml, but I'm not
going to try to implement enforcement at the yaml level.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
