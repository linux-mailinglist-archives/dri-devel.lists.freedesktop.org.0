Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF562EA676
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E59F6E075;
	Tue,  5 Jan 2021 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC01789DC9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 04:55:26 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id q1so27501036ilt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 20:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jSuC9e6JqsJ07PFKB5ypaoa7YcxfpdviSBbeQ4RoduY=;
 b=TKYN6tSvd3XBNnHvr44UIAwNWHwsCio9pOWrHyTnoYfRn6HtEIf1thYzDjdWnPV8ZL
 luOIUh1gNsVKkVyW2kgdv4QUQ3zMI7/j+Zb4bHCrwHvXUZHBiQGDgmfYg9puhTrbJmH2
 XpsMDmu8CiUFEfw6Rq+/EZW2ZfkCrfgmayANvPrDF/41b71YeKuZdyZEQ+VvPG2xuWA2
 0FpKszhHYzwRPAFYDhDv/FUDLY8TrTUn2rXRUgVIy8GtaeXM/UMGk2L7rLjPQZ3YIKTz
 iMPjjc0JqNTCA8qNhJuWdKhA8H66GzaHg9n6ZZjxKzdA/C2Ex9T7ZNooWWmCx8pxZ1ZZ
 n3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jSuC9e6JqsJ07PFKB5ypaoa7YcxfpdviSBbeQ4RoduY=;
 b=oD/YzQ2/N1ehsMwYqB8PVtosqpjHorQPGC7JoDE539jabZNYH3MsiN0zLYR5r4LR9M
 bY/JdAM3IfhXye8IbTy1jilVgA00vPxESQwrvL5CkIe/O0VtYVz9auTYnBSierGiPW1l
 NHADb9MM9NBTvuV0xc1aIN5zYmmjMQNgkZ8NC6QMvXlxPvO1MtwbHi9bIQ79NWrMAMSe
 w+sNynVR67l5Oc0zlOnMN/tHDaAtvglUR7er9TckcGuvhCEC8HObNwfa1mhJlLeBUQY5
 0Zzksw65hpcOBr7JJZqim1gYa8Dv9J/iEIrYgpXvl0duB5ZjRovgazVZpK7w2iWpkm32
 9fKw==
X-Gm-Message-State: AOAM531u1z8vXBD/BKaTRtuHRs8uYded064gwEt7Db4b9mXyT/TLmEVS
 AmeeyUFW/wRjkUgEwoZOv7A7F7MlZm2/bP8PWVE=
X-Google-Smtp-Source: ABdhPJy4Ba56ROM2g0PeMzHgBKyCITTnx4HGyUu4Xxq63j78LAHLYN4CYYsbe1RGZIjH+wqeXQ0/5nnvLW4e+5ZZHao=
X-Received: by 2002:a92:c26d:: with SMTP id h13mr72543683ild.52.1609822525824; 
 Mon, 04 Jan 2021 20:55:25 -0800 (PST)
MIME-Version: 1.0
References: <1603349147-3495-1-git-send-email-simhavcs@gmail.com>
 <20201108101659.GE1129714@ravnborg.org>
 <CAGWqDJ6Aq=2tyc5Uk56tbTfz-Ezz_4-T5YHmo4P9wJv_ce0ehQ@mail.gmail.com>
In-Reply-To: <CAGWqDJ6Aq=2tyc5Uk56tbTfz-Ezz_4-T5YHmo4P9wJv_ce0ehQ@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 5 Jan 2021 10:25:14 +0530
Message-ID: <CAGWqDJ6i8-wojhmTp-72t0wLWE=gkorAxQPox9zjcQZHtNCbNQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] drm/bridge/tc358775: Fixes bus formats read
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
Content-Type: multipart/mixed; boundary="===============0545569855=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0545569855==
Content-Type: multipart/alternative; boundary="000000000000cda43205b8200338"

--000000000000cda43205b8200338
Content-Type: text/plain; charset="UTF-8"

Laurent,

Please review the patch, so that we can push the input_format to the
mainline, which completes the overall features handled wrt bridge.

On Thu, Dec 17, 2020 at 10:39 AM Vinay Simha B N <simhavcs@gmail.com> wrote:

> Laurent,
>
> Please review the patch, so that we can push the input_format to the
> mainline, which completes the overall features handled wrt bridge.
>
> On Sun, Nov 8, 2020 at 3:47 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
>> Hi Laurent,
>>
>> On Thu, Oct 22, 2020 at 12:15:47PM +0530, Vinay Simha BN wrote:
>> > - atomic_check removed
>> > - video data input and output formats added
>> > - bus formats read from drm_bridge_state.output_bus_cfg.format
>> >   and .atomic_get_input_bus_fmts() instead of connector
>> >
>> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>>
>> could you try to find time to review this patch?
>>
>> You already provided valuable feedback and it looks fine to me.
>> But it would be perfect if you could find time to take a look.
>>
>> Thanks in advance,
>>
>>         Sam
>>
>> >
>> > ---
>> > v1:
>> >  * Laurent Pinchart review comments incorporated
>> >    drm_bridge_state.output_bus_cfg.format
>> >    instead of connector
>> > v2:
>> >  * Laurent Pinchart review comments incorporated
>> >    atomic_check removed
>> >    video data input and output formats added
>> > ---
>> >  drivers/gpu/drm/bridge/tc358775.c | 75
>> ++++++++++++++++++++++++++++++---------
>> >  1 file changed, 58 insertions(+), 17 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/bridge/tc358775.c
>> b/drivers/gpu/drm/bridge/tc358775.c
>> > index 2272adc..cc27570 100644
>> > --- a/drivers/gpu/drm/bridge/tc358775.c
>> > +++ b/drivers/gpu/drm/bridge/tc358775.c
>> > @@ -271,6 +271,20 @@ struct tc_data {
>> >       struct gpio_desc        *stby_gpio;
>> >       u8                      lvds_link; /* single-link or dual-link */
>> >       u8                      bpc;
>> > +     u32                     output_bus_fmt;
>> > +};
>> > +
>> > +static const u32 tc_lvds_in_bus_fmts[] = {
>> > +     MEDIA_BUS_FMT_RGB565_1X16,
>> > +     MEDIA_BUS_FMT_RGB666_1X18,
>> > +     MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
>> > +     MEDIA_BUS_FMT_RBG888_1X24,
>> > +};
>> > +
>> > +static const u32 tc_lvds_out_bus_fmts[] = {
>> > +     MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>> > +     MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>> > +     MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
>> >  };
>> >
>> >  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
>> > @@ -359,19 +373,6 @@ static void d2l_write(struct i2c_client *i2c, u16
>> addr, u32 val)
>> >                       ret, addr);
>> >  }
>> >
>> > -/* helper function to access bus_formats */
>> > -static struct drm_connector *get_connector(struct drm_encoder *encoder)
>> > -{
>> > -     struct drm_device *dev = encoder->dev;
>> > -     struct drm_connector *connector;
>> > -
>> > -     list_for_each_entry(connector, &dev->mode_config.connector_list,
>> head)
>> > -             if (connector->encoder == encoder)
>> > -                     return connector;
>> > -
>> > -     return NULL;
>> > -}
>> > -
>> >  static void tc_bridge_enable(struct drm_bridge *bridge)
>> >  {
>> >       struct tc_data *tc = bridge_to_tc(bridge);
>> > @@ -380,7 +381,10 @@ static void tc_bridge_enable(struct drm_bridge
>> *bridge)
>> >       u32 val = 0;
>> >       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
>> >       struct drm_display_mode *mode;
>> > -     struct drm_connector *connector = get_connector(bridge->encoder);
>> > +     struct drm_bridge_state *state =
>> > +                     drm_priv_to_bridge_state(bridge->base.state);
>> > +
>> > +     tc->output_bus_fmt = state->output_bus_cfg.format;
>> >
>> >       mode = &bridge->encoder->crtc->state->adjusted_mode;
>> >
>> > @@ -451,14 +455,13 @@ static void tc_bridge_enable(struct drm_bridge
>> *bridge)
>> >       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
>> >
>> >       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
>> > -             connector->display_info.bus_formats[0],
>> > +             tc->output_bus_fmt,
>> >               tc->bpc);
>> >       /*
>> >        * Default hardware register settings of tc358775 configured
>> >        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
>> >        */
>> > -     if (connector->display_info.bus_formats[0] ==
>> > -             MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
>> > +     if (tc->output_bus_fmt == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
>> >               /* VESA-24 */
>> >               d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1,
>> LVI_R2, LVI_R3));
>> >               d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7,
>> LVI_R5, LVI_G0));
>> > @@ -590,6 +593,40 @@ static int tc358775_parse_dt(struct device_node
>> *np, struct tc_data *tc)
>> >       return 0;
>> >  }
>> >
>> > +static u32 *
>> > +tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>> > +                          struct drm_bridge_state *bridge_state,
>> > +                          struct drm_crtc_state *crtc_state,
>> > +                          struct drm_connector_state *conn_state,
>> > +                          u32 output_fmt,
>> > +                          unsigned int *num_input_fmts)
>> > +{
>> > +     u32 *input_fmts = NULL;
>> > +     u8 i;
>> > +
>> > +     *num_input_fmts = 0;
>> > +
>> > +     for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
>> > +             if (output_fmt == tc_lvds_out_bus_fmts[i])
>> > +                     break;
>> > +     }
>> > +
>> > +     if (i == ARRAY_SIZE(tc_lvds_out_bus_fmts))
>> > +             return NULL;
>> > +
>> > +     *num_input_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
>> > +
>> > +     input_fmts = kcalloc(*num_input_fmts,
>> ARRAY_SIZE(tc_lvds_in_bus_fmts),
>> > +                          GFP_KERNEL);
>> > +     if (!input_fmts)
>> > +             return NULL;
>> > +
>> > +     for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
>> > +             input_fmts[i] = tc_lvds_in_bus_fmts[i];
>> > +
>> > +     return input_fmts;
>> > +}
>> > +
>> >  static int tc_bridge_attach(struct drm_bridge *bridge,
>> >                           enum drm_bridge_attach_flags flags)
>> >  {
>> > @@ -639,6 +676,10 @@ static int tc_bridge_attach(struct drm_bridge
>> *bridge,
>> >  }
>> >
>> >  static const struct drm_bridge_funcs tc_bridge_funcs = {
>> > +     .atomic_duplicate_state =
>> drm_atomic_helper_bridge_duplicate_state,
>> > +     .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> > +     .atomic_reset = drm_atomic_helper_bridge_reset,
>> > +     .atomic_get_input_bus_fmts = tc_bridge_get_input_bus_fmts,
>> >       .attach = tc_bridge_attach,
>> >       .pre_enable = tc_bridge_pre_enable,
>> >       .enable = tc_bridge_enable,
>> > --
>> > 2.7.4
>> >
>> > _______________________________________________
>> > dri-devel mailing list
>> > dri-devel@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>
>
> --
> regards,
> vinaysimha
>


-- 
regards,
vinaysimha

--000000000000cda43205b8200338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Laurent,</div><div><br></div><div>Please review the p=
atch, so that=20
we can push the input_format to the mainline, which completes the=20
overall features handled wrt bridge.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 10:39 AM =
Vinay Simha B N &lt;<a href=3D"mailto:simhavcs@gmail.com">simhavcs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div>Laurent,</div><div><br></div><div>Please review the =
patch, so that we can push the input_format to the mainline, which complete=
s the overall features handled wrt bridge.<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 8, 2020 at =
3:47 PM Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" target=3D"_bla=
nk">sam@ravnborg.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Laurent,<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">regards,<b=
r>vinaysimha</div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--000000000000cda43205b8200338--

--===============0545569855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0545569855==--
