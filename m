Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E005C40A57B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB86E3BB;
	Tue, 14 Sep 2021 04:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38B36E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 04:37:47 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id a22so15226278iok.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WIdlm7OqLdPRJwihbCa5C7LQl9Cv4aIw+c5VE9jLJY=;
 b=ni/dN1h5DkryzZzN1Y7sY8EK2X8jQ9iZCm36Gz0i+9UPafPmEhO1ALELDdamAUKwVM
 uTK763YZU8ZjWeUuBTWs+9/XNz0NDSgsIt0V2sLOKWttZp9L3/FVM1EI+1P0wFdg/BiK
 ciFVS5JwPPFWqLOr4RfcGpFzoQ6hD3zUwIhx1D9XrlKs8Tlrx4JKCfMdnvk8yGOK8QhS
 8Ra9xzPLRysSqFTvy4H7MNRPp1yHEtS1cV1PJ3ZWrhLnd+L6CzjJVsmpSr5aRPmYzYAl
 rO9lhfRYZvatgvbCznDLDKQItaxxRRfJxaDTWGe+ESt5sg4XVJK/0TxgqE4fxUL/u/8Q
 IaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WIdlm7OqLdPRJwihbCa5C7LQl9Cv4aIw+c5VE9jLJY=;
 b=tT4XszdsBzSM7p3LCNCOwNRamOYIppnIpPZNKM15sCm+U/7DWfNUa6Tf2E8ltS+K5X
 aNfH2lfUIaq0Otd8cufxHCEewpzbhKyw2oA/SMnf4VdW3+rC2S1X+XK65fv+eQ7AbXfv
 FWA7ke6BLRooNs7HuTTJPeoj/MwQ9oUrSYa8Gb9edQU/ywgA6GhlldovDecRFrWCemPx
 yLTyH/Qjt6Vi5B/+pCbXrlyXKvGgaGt1BV5VGu+jAt5F3xDZN0RUU2fa8DlMJ8gk/CEr
 Z85RDCIQsTXxGxWFKZBJDJC0A9ymM6JQq19yyimdVYcJwmHaBi24MzoCkVYPnyCyWGXC
 EG9g==
X-Gm-Message-State: AOAM532ISZfFer0MFwvb1DXcxFJFb9H2bdsBz1PopGiERMCB3N5KC748
 NwjJ9zsbol+Ym6rbfwKhrbE20G3ZRvCEOT7eLO0iEA==
X-Google-Smtp-Source: ABdhPJx69En5hY5dVvSrIys5MG0hDy+ItXs9pBXMLAbYci4bKGTwomMmgJLMpvd/YsgD68POvkjFvHPs/zgZdmB7QXg=
X-Received: by 2002:a02:711e:: with SMTP id n30mr12951559jac.3.1631594266839; 
 Mon, 13 Sep 2021 21:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
 <20210913105920.3719525-6-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=XFApy_RxCRzrQrQ1-xua+tBpZN60B1TzyEvDNm3LnD7Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XFApy_RxCRzrQrQ1-xua+tBpZN60B1TzyEvDNm3LnD7Q@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 14 Sep 2021 12:37:36 +0800
Message-ID: <CAHwB_N+O9R70xiBVXC6Zq7ZzBNbY+9fttXmWgcYfz36-OAW0MA@mail.gmail.com>
Subject: Re: [v5 5/5] drm/panel: Update BOE and INX init code to support touch
 function
To: Doug Anderson <dianders@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b1687c05cbed243e"
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

--000000000000b1687c05cbed243e
Content-Type: text/plain; charset="UTF-8"

Hi,Doug
   Thank you for reviewer ,new init code match DSI BURST mode  seems to
support hs mode, the init register and porch settings are provided by
novate.

On Tue, Sep 14, 2021 at 3:23 AM Doug Anderson <dianders@google.com> wrote:

> Hi,
>
> On Mon, Sep 13, 2021 at 3:59 AM yangcong
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > This is an incell IC, TDDI use time division multiplexing.
> > Init code effect touch sensing.
> > Support touch function we needed to handle were:
> > a) Update init code for the panel driver, adjust the porch value.
> > b) After update init code these two panels can support DSI HS mode.
> >
> > Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 399 +++++-------------
> >  1 file changed, 110 insertions(+), 289 deletions(-)
>
> Please squash this with patch #3 in the series. Even though you have
> landed patch #3 in the series in a Chrome OS tree it doesn't matter.
> Since patch #3 hasn't landed upstream there is no reason to post the
> "wrong" code and then fix it up in the same series. The Chrome OS tree
> can always take a revert of the old version and a re-pick of the new
> version.
>
>
> > @@ -36,7 +36,6 @@ struct panel_desc {
> >         const struct panel_init_cmd *init_cmds;
> >         unsigned int lanes;
> >         bool discharge_on_disable;
> > -       bool unsupport_dsi_hs_mode;
>
> Not that I'm complaining, but how did this suddenly get supported?
>
>
> > @@ -84,6 +83,8 @@ static const struct panel_init_cmd
> boe_tv110c9m_init_cmd[] = {
> >         _INIT_DCS_CMD(0x07, 0x78),
> >         _INIT_DCS_CMD(0x08, 0x5A),
> >         _INIT_DCS_CMD(0x0D, 0x63),
> > +       _INIT_DCS_CMD(0x0E, 0x91),
> > +       _INIT_DCS_CMD(0x0F, 0x73),
>
> I _really_ don't like this opaque list of commands and the fact that
> apparently they aren't fixed but need to change depending on how
> you're configuring the panel, but I won't personally block this patch
> just because of it since it matches what other panels in this driver
> are doing.
>
> If someone more familiar with MIPI panels wants to chime in though,
> I'm all ears.
>
>
> > @@ -1442,15 +1260,15 @@ static int boe_panel_enable(struct drm_panel
> *panel)
> >  }
> >
> >  static const struct drm_display_mode boe_tv110c9m_default_mode = {
> > -       .clock = 162383,
> > +       .clock = 166594,
> >         .hdisplay = 1200,
> >         .hsync_start = 1200 + 40,
> >         .hsync_end = 1200 + 40 + 8,
> >         .htotal = 1200 + 40 + 8 + 28,
> >         .vdisplay = 2000,
> >         .vsync_start = 2000 + 26,
> > -       .vsync_end = 2000 + 26 + 1,
> > -       .vtotal = 2000 + 26 + 1 + 94,
> > +       .vsync_end = 2000 + 26 + 2,
> > +       .vtotal = 2000 + 26 + 2 + 148,
> >         .type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  };
> >
> > @@ -1463,14 +1281,15 @@ static const struct panel_desc boe_tv110c9m_desc
> = {
> >         },
> >         .lanes = 4,
> >         .format = MIPI_DSI_FMT_RGB888,
> > -       .mode_flags = MIPI_DSI_MODE_VIDEO |
> MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > -                     MIPI_DSI_MODE_LPM,
> > +       .mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
> > +                       | MIPI_DSI_MODE_VIDEO_HSE
> > +                       | MIPI_DSI_CLOCK_NON_CONTINUOUS
> > +                       | MIPI_DSI_MODE_VIDEO_BURST,
> >         .init_cmds = boe_tv110c9m_init_cmd,
> > -       .unsupport_dsi_hs_mode = true,
> >  };
> >
> >  static const struct drm_display_mode inx_hj110iz_default_mode = {
> > -       .clock = 162383,
> > +       .clock = 166594,
> >         .hdisplay = 1200,
> >         .hsync_start = 1200 + 40,
> >         .hsync_end = 1200 + 40 + 8,
> > @@ -1478,7 +1297,7 @@ static const struct drm_display_mode
> inx_hj110iz_default_mode = {
> >         .vdisplay = 2000,
> >         .vsync_start = 2000 + 26,
> >         .vsync_end = 2000 + 26 + 1,
> > -       .vtotal = 2000 + 26 + 1 + 94,
> > +       .vtotal = 2000 + 26 + 1 + 149,
>
> It seems really odd that the two panels have _exactly_ the same timing
> except that one of them now has:
>
> .vsync_end = 2000 + 26 + 2,
>
> ...and the other:
>
> .vsync_end = 2000 + 26 + 1,
>
> Do they really need to be different?
>
> -Doug
>

--000000000000b1687c05cbed243e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,Doug</div><div>=C2=A0 =C2=A0Thank you for <font co=
lor=3D"#5f6368" face=3D"Roboto, -apple-system, BlinkMacSystemFont, Segoe UI=
, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI=
 Symbol, Roboto, Arial, sans-serif"><span style=3D"font-size:14px">reviewer=
 ,new init code=C2=A0</span></font>match DSI=C2=A0<span style=3D"color:rgb(=
80,0,80)">BURST mode=C2=A0</span>=C2=A0seems to support hs mode, the init r=
egister and porch settings are provided by novate.</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 3=
:23 AM Doug Anderson &lt;<a href=3D"mailto:dianders@google.com">dianders@go=
ogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi,<br>
<br>
On Mon, Sep 13, 2021 at 3:59 AM yangcong<br>
&lt;<a href=3D"mailto:yangcong5@huaqin.corp-partner.google.com" target=3D"_=
blank">yangcong5@huaqin.corp-partner.google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is an incell IC, TDDI use time division multiplexing.<br>
&gt; Init code effect touch sensing.<br>
&gt; Support touch function we needed to handle were:<br>
&gt; a) Update init code for the panel driver, adjust the porch value.<br>
&gt; b) After update init code these two panels can support DSI HS mode.<br=
>
&gt;<br>
&gt; Signed-off-by: yangcong &lt;<a href=3D"mailto:yangcong5@huaqin.corp-pa=
rtner.google.com" target=3D"_blank">yangcong5@huaqin.corp-partner.google.co=
m</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c=C2=A0 =C2=A0 | 399 ++=
+++-------------<br>
&gt;=C2=A0 1 file changed, 110 insertions(+), 289 deletions(-)<br>
<br>
Please squash this with patch #3 in the series. Even though you have<br>
landed patch #3 in the series in a Chrome OS tree it doesn&#39;t matter.<br=
>
Since patch #3 hasn&#39;t landed upstream there is no reason to post the<br=
>
&quot;wrong&quot; code and then fix it up in the same series. The Chrome OS=
 tree<br>
can always take a revert of the old version and a re-pick of the new<br>
version.<br>
<br>
<br>
&gt; @@ -36,7 +36,6 @@ struct panel_desc {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct panel_init_cmd *init_cmd=
s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int lanes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool discharge_on_disable;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool unsupport_dsi_hs_mode;<br>
<br>
Not that I&#39;m complaining, but how did this suddenly get supported?<br>
<br>
<br>
&gt; @@ -84,6 +83,8 @@ static const struct panel_init_cmd boe_tv110c9m_init=
_cmd[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x07, 0x78),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x08, 0x5A),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0D, 0x63),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0E, 0x91),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0F, 0x73),<br>
<br>
I _really_ don&#39;t like this opaque list of commands and the fact that<br=
>
apparently they aren&#39;t fixed but need to change depending on how<br>
you&#39;re configuring the panel, but I won&#39;t personally block this pat=
ch<br>
just because of it since it matches what other panels in this driver<br>
are doing.<br>
<br>
If someone more familiar with MIPI panels wants to chime in though,<br>
I&#39;m all ears.<br>
<br>
<br>
&gt; @@ -1442,15 +1260,15 @@ static int boe_panel_enable(struct drm_panel *=
panel)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static const struct drm_display_mode boe_tv110c9m_default_mode =
=3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 162383,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 166594,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1200,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1200 + 40,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1200 + 40 + 8,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.htotal =3D 1200 + 40 + 8 + 28,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.vdisplay =3D 2000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_start =3D 2000 + 26,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 2000 + 26 + 1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 2000 + 26 + 1 + 94,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 2000 + 26 + 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 2000 + 26 + 2 + 148,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D DRM_MODE_TYPE_DRIVER | DRM_=
MODE_TYPE_PREFERRED,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; @@ -1463,14 +1281,15 @@ static const struct panel_desc boe_tv110c9m_de=
sc =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.lanes =3D 4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.format =3D MIPI_DSI_FMT_RGB888,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI=
_DSI_MODE_VIDEO_SYNC_PULSE |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0MIPI_DSI_MODE_LPM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_LPM | MIPI_D=
SI_MODE_VIDEO<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| MIPI_DSI_MODE_VIDEO_HSE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| MIPI_DSI_CLOCK_NON_CONTINUOUS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| MIPI_DSI_MODE_VIDEO_BURST,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_cmds =3D boe_tv110c9m_init_cmd,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.unsupport_dsi_hs_mode =3D true,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static const struct drm_display_mode inx_hj110iz_default_mode =
=3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 162383,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 166594,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1200,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1200 + 40,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1200 + 40 + 8,<br>
&gt; @@ -1478,7 +1297,7 @@ static const struct drm_display_mode inx_hj110iz=
_default_mode =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.vdisplay =3D 2000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_start =3D 2000 + 26,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 2000 + 26 + 1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 2000 + 26 + 1 + 94,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 2000 + 26 + 1 + 149,<br>
<br>
It seems really odd that the two panels have _exactly_ the same timing<br>
except that one of them now has:<br>
<br>
.vsync_end =3D 2000 + 26 + 2,<br>
<br>
...and the other:<br>
<br>
.vsync_end =3D 2000 + 26 + 1,<br>
<br>
Do they really need to be different?<br>
<br>
-Doug<br>
</blockquote></div></div>

--000000000000b1687c05cbed243e--
