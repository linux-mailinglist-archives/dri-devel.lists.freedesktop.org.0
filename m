Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52CA2DCDCE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D99E6E1F5;
	Thu, 17 Dec 2020 08:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DC88959D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 05:10:09 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id z5so26287347iob.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 21:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6eyCCjmwLFXkFYdPkslvFiFaYcxQ3Ntf+c8mb6+IwE=;
 b=sxJC0MdpP0joLc3PLT2JDJAhmhPVk+QbeXvjTlOSooZlg3u9Gf7kxPaqA+xZoWX6+T
 KMtJq+LL76DhwGGnPNftcHGfq2flIb7PVPmtUin3/sovC45Lq8d/Ewa5yK2Ib6OnVomt
 sENMbSj+RVZ7CXSbjBbxkR4Y63AIn8O5mxLG1j7/1M1BKrhToHgNSVaIxGtojNsfo25v
 YOwf7fx33V6h5u3mNsGMvEmN2Ph9JvPFQEETZXbkW1eop6xgAi/lEwWvh30OeLC3brp0
 PF4ze5rE0jkVjm2MRNRJIsUFlFCkfiQLmBdmFSFadP+9d/7kMsDGifgTUVmwTfYUH19y
 e5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6eyCCjmwLFXkFYdPkslvFiFaYcxQ3Ntf+c8mb6+IwE=;
 b=QzINTMl7a9h7WIurnisFVCwyXDGTH7s8Kh90WxGgplTS17lZ2WXKW02PvzivQ73o6c
 yImgi3wykgcEkUKKVHEZObKNTccd+RW/Hti6RqURVY86ECD82cVPbeGTdWFnKbXLwObY
 zBjC539FtG0hZv9jXyNB3TA85afenb3FcaQgj9CdcWeuY4uzy84dTWuvxJAmV3i22iG5
 vupLXRcM6IsujBRPJv12u7eZOKRBoWLFumi6LAxSN+dXV2XxPYXgpPX6ESQGgPMWHUcC
 gK5DZvdzcYDVSUq6rGDLKauLTkOtJbF47/e03M92XHrS8Jx+ztFIw++Req1Aqp1gi3Ax
 DwgA==
X-Gm-Message-State: AOAM53099YtuxEjoDefLIHzEC1Nm/digau7YV0dTVtG1/0UNb4Q4HXa1
 Z7dWbmtVwhQWSUFXGnHhEDYeJS2otqDpScHcR14=
X-Google-Smtp-Source: ABdhPJxIImH7ww2LNYT61UZJv9ZE3h2xFXTJWffDqhRLQf2lQySEwe/2xOtr97K0GlM8AUfRNo7g6iLrpNjxzEw/Vr4=
X-Received: by 2002:a6b:6f17:: with SMTP id k23mr46012374ioc.147.1608181808956; 
 Wed, 16 Dec 2020 21:10:08 -0800 (PST)
MIME-Version: 1.0
References: <1603349147-3495-1-git-send-email-simhavcs@gmail.com>
 <20201108101659.GE1129714@ravnborg.org>
In-Reply-To: <20201108101659.GE1129714@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Thu, 17 Dec 2020 10:39:58 +0530
Message-ID: <CAGWqDJ6Aq=2tyc5Uk56tbTfz-Ezz_4-T5YHmo4P9wJv_ce0ehQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] drm/bridge/tc358775: Fixes bus formats read
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: multipart/mixed; boundary="===============0760549439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0760549439==
Content-Type: multipart/alternative; boundary="000000000000750a0f05b6a201d3"

--000000000000750a0f05b6a201d3
Content-Type: text/plain; charset="UTF-8"

Laurent,

Please review the patch, so that we can push the input_format to the
mainline, which completes the overall features handled wrt bridge.

On Sun, Nov 8, 2020 at 3:47 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Laurent,
>
> On Thu, Oct 22, 2020 at 12:15:47PM +0530, Vinay Simha BN wrote:
> > - atomic_check removed
> > - video data input and output formats added
> > - bus formats read from drm_bridge_state.output_bus_cfg.format
> >   and .atomic_get_input_bus_fmts() instead of connector
> >
> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>
> could you try to find time to review this patch?
>
> You already provided valuable feedback and it looks fine to me.
> But it would be perfect if you could find time to take a look.
>
> Thanks in advance,
>
>         Sam
>
> >
> > ---
> > v1:
> >  * Laurent Pinchart review comments incorporated
> >    drm_bridge_state.output_bus_cfg.format
> >    instead of connector
> > v2:
> >  * Laurent Pinchart review comments incorporated
> >    atomic_check removed
> >    video data input and output formats added
> > ---
> >  drivers/gpu/drm/bridge/tc358775.c | 75
> ++++++++++++++++++++++++++++++---------
> >  1 file changed, 58 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> > index 2272adc..cc27570 100644
> > --- a/drivers/gpu/drm/bridge/tc358775.c
> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > @@ -271,6 +271,20 @@ struct tc_data {
> >       struct gpio_desc        *stby_gpio;
> >       u8                      lvds_link; /* single-link or dual-link */
> >       u8                      bpc;
> > +     u32                     output_bus_fmt;
> > +};
> > +
> > +static const u32 tc_lvds_in_bus_fmts[] = {
> > +     MEDIA_BUS_FMT_RGB565_1X16,
> > +     MEDIA_BUS_FMT_RGB666_1X18,
> > +     MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> > +     MEDIA_BUS_FMT_RBG888_1X24,
> > +};
> > +
> > +static const u32 tc_lvds_out_bus_fmts[] = {
> > +     MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > +     MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > +     MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> >  };
> >
> >  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> > @@ -359,19 +373,6 @@ static void d2l_write(struct i2c_client *i2c, u16
> addr, u32 val)
> >                       ret, addr);
> >  }
> >
> > -/* helper function to access bus_formats */
> > -static struct drm_connector *get_connector(struct drm_encoder *encoder)
> > -{
> > -     struct drm_device *dev = encoder->dev;
> > -     struct drm_connector *connector;
> > -
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list,
> head)
> > -             if (connector->encoder == encoder)
> > -                     return connector;
> > -
> > -     return NULL;
> > -}
> > -
> >  static void tc_bridge_enable(struct drm_bridge *bridge)
> >  {
> >       struct tc_data *tc = bridge_to_tc(bridge);
> > @@ -380,7 +381,10 @@ static void tc_bridge_enable(struct drm_bridge
> *bridge)
> >       u32 val = 0;
> >       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
> >       struct drm_display_mode *mode;
> > -     struct drm_connector *connector = get_connector(bridge->encoder);
> > +     struct drm_bridge_state *state =
> > +                     drm_priv_to_bridge_state(bridge->base.state);
> > +
> > +     tc->output_bus_fmt = state->output_bus_cfg.format;
> >
> >       mode = &bridge->encoder->crtc->state->adjusted_mode;
> >
> > @@ -451,14 +455,13 @@ static void tc_bridge_enable(struct drm_bridge
> *bridge)
> >       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
> >
> >       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> > -             connector->display_info.bus_formats[0],
> > +             tc->output_bus_fmt,
> >               tc->bpc);
> >       /*
> >        * Default hardware register settings of tc358775 configured
> >        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> >        */
> > -     if (connector->display_info.bus_formats[0] ==
> > -             MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> > +     if (tc->output_bus_fmt == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> >               /* VESA-24 */
> >               d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1,
> LVI_R2, LVI_R3));
> >               d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7,
> LVI_R5, LVI_G0));
> > @@ -590,6 +593,40 @@ static int tc358775_parse_dt(struct device_node
> *np, struct tc_data *tc)
> >       return 0;
> >  }
> >
> > +static u32 *
> > +tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                          struct drm_bridge_state *bridge_state,
> > +                          struct drm_crtc_state *crtc_state,
> > +                          struct drm_connector_state *conn_state,
> > +                          u32 output_fmt,
> > +                          unsigned int *num_input_fmts)
> > +{
> > +     u32 *input_fmts = NULL;
> > +     u8 i;
> > +
> > +     *num_input_fmts = 0;
> > +
> > +     for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
> > +             if (output_fmt == tc_lvds_out_bus_fmts[i])
> > +                     break;
> > +     }
> > +
> > +     if (i == ARRAY_SIZE(tc_lvds_out_bus_fmts))
> > +             return NULL;
> > +
> > +     *num_input_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
> > +
> > +     input_fmts = kcalloc(*num_input_fmts,
> ARRAY_SIZE(tc_lvds_in_bus_fmts),
> > +                          GFP_KERNEL);
> > +     if (!input_fmts)
> > +             return NULL;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
> > +             input_fmts[i] = tc_lvds_in_bus_fmts[i];
> > +
> > +     return input_fmts;
> > +}
> > +
> >  static int tc_bridge_attach(struct drm_bridge *bridge,
> >                           enum drm_bridge_attach_flags flags)
> >  {
> > @@ -639,6 +676,10 @@ static int tc_bridge_attach(struct drm_bridge
> *bridge,
> >  }
> >
> >  static const struct drm_bridge_funcs tc_bridge_funcs = {
> > +     .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset = drm_atomic_helper_bridge_reset,
> > +     .atomic_get_input_bus_fmts = tc_bridge_get_input_bus_fmts,
> >       .attach = tc_bridge_attach,
> >       .pre_enable = tc_bridge_pre_enable,
> >       .enable = tc_bridge_enable,
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>


-- 
regards,
vinaysimha

--000000000000750a0f05b6a201d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Laurent,</div><div><br></div><div>Please review the p=
atch, so that we can push the input_format to the mainline, which completes=
 the overall features handled wrt bridge.<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 8, 2020 at 3=
:47 PM Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Laurent,<br>
<br>
On Thu, Oct 22, 2020 at 12:15:47PM +0530, Vinay Simha BN wrote:<br>
&gt; - atomic_check removed<br>
&gt; - video data input and output formats added<br>
&gt; - bus formats read from drm_bridge_state.output_bus_cfg.format<br>
&gt;=C2=A0 =C2=A0and .atomic_get_input_bus_fmts() instead of connector<br>
&gt; <br>
&gt; Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com=
" target=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
<br>
could you try to find time to review this patch?<br>
<br>
You already provided valuable feedback and it looks fine to me.<br>
But it would be perfect if you could find time to take a look.<br>
<br>
Thanks in advance,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
&gt; <br>
&gt; ---<br>
&gt; v1:<br>
&gt;=C2=A0 * Laurent Pinchart review comments incorporated<br>
&gt;=C2=A0 =C2=A0 drm_bridge_state.output_bus_cfg.format<br>
&gt;=C2=A0 =C2=A0 instead of connector<br>
&gt; v2:<br>
&gt;=C2=A0 * Laurent Pinchart review comments incorporated<br>
&gt;=C2=A0 =C2=A0 atomic_check removed<br>
&gt;=C2=A0 =C2=A0 video data input and output formats added<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/tc358775.c | 75 +++++++++++++++++++++++++=
+++++---------<br>
&gt;=C2=A0 1 file changed, 58 insertions(+), 17 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridg=
e/tc358775.c<br>
&gt; index 2272adc..cc27570 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; @@ -271,6 +271,20 @@ struct tc_data {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*stby_gpio;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds_link; /* single-link or dual-link *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_bus_fmt;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const u32 tc_lvds_in_bus_fmts[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB565_1X16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB666_1X18,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB666_1X24_CPADHI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RBG888_1X24,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const u32 tc_lvds_out_bus_fmts[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)=
<br>
&gt; @@ -359,19 +373,6 @@ static void d2l_write(struct i2c_client *i2c, u16=
 addr, u32 val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret, addr);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -/* helper function to access bus_formats */<br>
&gt; -static struct drm_connector *get_connector(struct drm_encoder *encode=
r)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D encoder-&gt;dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry(connector, &amp;dev-&gt;mode_=
config.connector_list, head)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;enc=
oder =3D=3D encoder)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return connector;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static void tc_bridge_enable(struct drm_bridge *bridge)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);=
<br>
&gt; @@ -380,7 +381,10 @@ static void tc_bridge_enable(struct drm_bridge *b=
ridge)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsd=
elay;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D get_connector=
(bridge-&gt;encoder);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_bridge_state *state =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_priv_to_bridge_state(bridge-&gt;base.state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;output_bus_fmt =3D state-&gt;output_bus_cf=
g.format;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D &amp;bridge-&gt;encoder-&gt;crtc-&g=
t;state-&gt;adjusted_mode;<br>
&gt;=C2=A0 <br>
&gt; @@ -451,14 +455,13 @@ static void tc_bridge_enable(struct drm_bridge *=
bridge)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LVPHY0, LV_PHY0_PRBS_O=
N(4) | LV_PHY0_ND(6));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;bus_formats %04x b=
pc %d\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connector-&gt;display=
_info.bus_formats[0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;output_bus_fmt=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Default hardware register settings of tc3=
58775 configured<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jei=
da-24 format<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (connector-&gt;display_info.bus_formats[0] =3D=
=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB888_=
1X7X4_SPWG) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;output_bus_fmt =3D=3D MEDIA_BUS_FMT_RG=
B888_1X7X4_SPWG) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* VESA-24 */<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt=
;i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt=
;i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));<br>
&gt; @@ -590,6 +593,40 @@ static int tc358775_parse_dt(struct device_node *=
np, struct tc_data *tc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static u32 *<br>
&gt; +tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_state *bridge_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *crtc_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct drm_connector_state *conn_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 u32 output_fmt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 unsigned int *num_input_fmts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 *input_fmts =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*num_input_fmts =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0 ; i &lt; ARRAY_SIZE(tc_lvds_out_bus_=
fmts) ; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (output_fmt =3D=3D=
 tc_lvds_out_bus_fmts[i])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i =3D=3D ARRAY_SIZE(tc_lvds_out_bus_fmts))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*num_input_fmts =3D ARRAY_SIZE(tc_lvds_in_bus_fmt=
s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_fmts =3D kcalloc(*num_input_fmts, ARRAY_SIZ=
E(tc_lvds_in_bus_fmts),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!input_fmts)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(tc_lvds_in_bus_fm=
ts); ++i)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_fmts[i] =3D tc_=
lvds_in_bus_fmts[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return input_fmts;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int tc_bridge_attach(struct drm_bridge *bridge,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0enum drm_bridge_attach_flags flags)<br>
&gt;=C2=A0 {<br>
&gt; @@ -639,6 +676,10 @@ static int tc_bridge_attach(struct drm_bridge *br=
idge,<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const struct drm_bridge_funcs tc_bridge_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helper_bri=
dge_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_state =3D drm_atomic_helper_bridg=
e_destroy_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_reset =3D drm_atomic_helper_bridge_reset,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_get_input_bus_fmts =3D tc_bridge_get_inpu=
t_bus_fmts,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach =3D tc_bridge_attach,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pre_enable =3D tc_bridge_pre_enable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable =3D tc_bridge_enable,<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--000000000000750a0f05b6a201d3--

--===============0760549439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0760549439==--
