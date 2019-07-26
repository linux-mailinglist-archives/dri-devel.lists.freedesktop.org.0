Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DABB7626F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAFF6ECD2;
	Fri, 26 Jul 2019 09:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284626E875
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 03:57:12 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c3so670105pfa.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 20:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwhUcxDcdcnA8/5yBmj5bFJBwqULvgabuo/4useYcR8=;
 b=R+xkvw7r8EvxxihxAlWZQ4QgXqeDvnQWRqoiwSm8sp3DL+gEIWL2DixZ/xpNHgrwYX
 4NU2kOP6GVrJGyXDTrT56MJ4A8mKzUcnkE3Bo2dZRsmIRZwMMT/GrLIclgetRURqP+PY
 HgEplRzeoy8EFRubBBGQUFyZw8dxzRecKUj7ItjrSc7NzAJEDlCE/frNHbOzsLK9eK9Z
 WzCfWE4XkGCoI74jxaSkQSEEpPoStKSVYcLkmKRUZxZ5TOoyzgTTD0yFG7/GwhRiGW2c
 7rNAClHyeYE19M+s71xRHT6waHPMAh+gntMtCeASTv+JaK0HMuHiFjKDpVU1HCaW9YE4
 /bTQ==
X-Gm-Message-State: APjAAAVx9MduVXmGLOK4RxYToWRHDVLIX4oqx8Ghh/TAyyLl2+/KCctN
 sJQjRonc0j1tEe/r0ivINvHWnZn/jtYpCFtHUxk=
X-Google-Smtp-Source: APXvYqxMjsmqfwmwCx10VXPT+Gmz3X0KBknsKEeXmaNaRH4xVbiXdoB6PDU7vQu/o27GdB2fumhbdH2hwIuW9aY3hxk=
X-Received: by 2002:a63:1e0b:: with SMTP id e11mr82853347pge.402.1564113431633; 
 Thu, 25 Jul 2019 20:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190425032712.26011-1-jerry.han.hq@gmail.com>
 <CACvgo51ry=bJo5d-CizrxkJri6BFfdjFS5OEfpDGkRFRNXxkOg@mail.gmail.com>
In-Reply-To: <CACvgo51ry=bJo5d-CizrxkJri6BFfdjFS5OEfpDGkRFRNXxkOg@mail.gmail.com>
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Fri, 26 Jul 2019 11:57:00 +0800
Message-ID: <CA+quO7+q_7n+cuM04UuF+G3WSCQAq==7aObBPmC_0hufsmvaWQ@mail.gmail.com>
Subject: Re: [PATCH] [v8, 2/2] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EwhUcxDcdcnA8/5yBmj5bFJBwqULvgabuo/4useYcR8=;
 b=NQuldBDiYITopea86mErNg1DEbILdCLak13pYK53ncWAyT4XDvjWBO116pJ1XXHKBw
 jkHZhWczqg+ck/3i033ZsCvhq7PUU6trhAXLf5zIi39BPpjN1dBab3v/WxEEPEsZBNPf
 8DcQS0Zn+wHfzz3n3tpUrF6lGbsQaiSbyX2xGWUP+mphOTlh9b3suK1ypK5lWcMSnbXx
 C6sbHTiBla8B/MEooRBifQKTyJYiYNPgezpcerUDx8buL977NF00bIIYGa3dmj0SXCTA
 U8J9+FZWmom5Qbkp/ldptL+gHMDBcxBSLfULignfOZLko16A9wIgDkqjrJegja0puZuq
 ds7w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Rock wang <rock_wang@himax.com.cn>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0224996040=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0224996040==
Content-Type: multipart/alternative; boundary="0000000000007b24f5058e8d89c1"

--0000000000007b24f5058e8d89c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emil Velikov:

First of all, thank you for your comments.

> +       struct gpio_desc *enable_gpio;
> +       struct gpio_desc *pp33_gpio;
> +       struct gpio_desc *pp18_gpio;
DT claims that these gpios are required, yet one is using the optional gpio
API.
Is the code off, or does the DT need fixing?

Thank you for your advice , I will  fix code.

static int send_mipi_cmds(struct drm_panel *panel, const struct panel_cmd
*cmds)
This format seems semi-magical. Any particular reason why you're not
using the helpers?
In particular, enter/exit sleep mode and set display on/off.

Normally, we only need to download 0x28 0x10 commands to power-key down.
I noticed that helper func (mipi_dsi_dcs_set_display_off,
mipi_dsi_dcs_enter_sleep_mode) help me send this commands(0x28 0x10).

But based on previous debugging experience, Some vendors are special and
may send other commands after sending cmd 0x28 0x10 or before send cmd 0x28
0x10.
this problem may also occur in our vendor,
so i think this above approach helps me manage code better.

Thanks.


Emil Velikov <emil.l.velikov@gmail.com> =E4=BA=8E2019=E5=B9=B47=E6=9C=881=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=889:41=E5=86=99=E9=81=93=EF=BC=
=9A

> Hi Jerry,
>
> On Thu, 25 Apr 2019 at 08:40, Jerry Han <jerry.han.hq@gmail.com> wrote:
> >
> > Support Boe Himax8279d 8.0" 1200x1920 TFT LCD panel, it is a MIPI DSI
> > panel.
> >
> > V8:
> > - Modify communication address
> >
> > V7:
> > - Add the information of the reviewer
> > - Remove unnecessary delays, The udelay_range code gracefully returns
> >     without hitting the scheduler on a delay of 0. (Derek)
> > - Merge the same data structures, like display_mode and off_cmds (Derek=
)
> > - Optimize the processing of results returned by
> >     devm_gpiod_get_optional (Derek)
> >
> > V6:
> > - Add the information of the reviewer (Sam)
> > - Delete unnecessary header files #include <linux/fb.h> (Sam)
> > - The config DRM_PANEL_BOE_HIMAX8279D appears twice. Drop one of them
> (Sam)
> > - ADD static, set_gpios function is not used outside this module (Sam)
> >
> > V5:
> > - Added changelog
> >
> > V4:
> > - Frefix all function maes with boe_ (Sam)
> > - Fsed "enable_gpio" replace "reset_gpio", Make it look clearer (Sam)
> > - Sort include lines alphabetically (Sam)
> > - Fixed entries in the makefile must be sorted alphabetically (Sam)
> > - Add send_mipi_cmds function to avoid duplicating the code (Sam)
> > - Add the necessary delay(reset_delay_t5) between reset and sending
> >     the initialization command (Rock wang)
> >
> > V3:
> > - Remove unnecessary delays in sending initialization commands (Jitao
> Shi)
> >
> > V2:
> > - Use SPDX identifier (Sam)
> > - Use necessary header files replace drmP.h (Sam)
> > - Delete unnecessary header files #include <linux/err.h> (Sam)
> > - Specifies a GPIOs array to control the reset timing,
> >     instead of reading "dsi-reset-sequence" data from DTS (Sam)
> > - Delete backlight_disable() function when already disabled (Sam)
> > - Use devm_of_find_backlight() replace of_find_backlight_by_node() (Sam=
)
> > - Move the necessary data in the DTS to the current file,
> >     like porch, display_mode and Init code etc. (Sam)
> > - Add compatible device "boe,himax8279d10p" (Sam)
> >
> > Signed-off-by: Jerry Han <jerry.han.hq@gmail.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Derek Basehore <dbasehore@chromium.org>
> > Cc: Jitao Shi <jitao.shi@mediatek.com>
> > Cc: Rock wang <rock_wang@himax.com.cn>
> > ---
> While the DT has landed, this patch is not merged it seems.
> I think that Sam is waiting for a version which does not trigger so
> many check-patch warnings.
>
> That said, a couple of comments if I may.
>
> > +       struct gpio_desc *enable_gpio;
> > +       struct gpio_desc *pp33_gpio;
> > +       struct gpio_desc *pp18_gpio;
> DT claims that these gpios are required, yet one is using the optional
> gpio API.
> Is the code off, or does the DT need fixing?
>
>
> > +static int send_mipi_cmds(struct drm_panel *panel, const struct
> panel_cmd *cmds)
> > +{
> > +       struct panel_info *pinfo =3D to_panel_info(panel);
> > +       unsigned int i =3D 0;
> > +       int err;
> > +
> > +       if (!cmds)
> > +               return -EFAULT;
> > +
> > +       for (i =3D 0; cmds[i].len !=3D 0; i++) {
> > +               const struct panel_cmd *cmd =3D &cmds[i];
> > +
> > +               if (cmd->len =3D=3D 2)
> > +                       err =3D mipi_dsi_dcs_write(pinfo->link,
> > +                                                   cmd->data[1], NULL,
> 0);
> > +               else
> > +                       err =3D mipi_dsi_dcs_write(pinfo->link,
> > +                                                   cmd->data[1],
> cmd->data + 2,
> > +                                                   cmd->len - 2);
> > +
> > +               if (err < 0)
> > +                       return err;
> > +
> > +               usleep_range((cmd->data[0]) * 1000,
> > +                           (1 + cmd->data[0]) * 1000);
> > +       }
> > +
> This format seems semi-magical. Any particular reason why you're not
> using the helpers?
> In particular, enter/exit sleep mode and set display on/off.
>
> Speaking of which - the 8inch display uses then, yet they are missing
> for the 10inch one. Seems like there's a bug in there.
>
> Plus we have some repeating patterns in the vendor/undocumented
> commands - good reason to get those into separate hunks.
> With the above in place, you can effectively drop the .off_cmd
> callback and sleep field from the INIT_CMD arrays.
>
> Hence, less code to debug and maintain ;-)
>
> HTH
> Emil
>

--0000000000007b24f5058e8d89c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Emil Velikov:<div><br><div><span style=3D"color:rgb(51,=
51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,&quot;\005fae\008f6f\0=
096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malgun Gothic&quot;,Mei=
ryo,sans-serif;font-size:13.6px;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;line-height:25.9875px;text-align:justify;background-color:r=
gb(247,248,250)">First of all, thank you for your comments.</span><br></div=
><div><br></div><div><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">=
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc *enable_gpio;<br>&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc *pp33_gpio;<br>&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct gpio_desc *pp18_gpio;<br></span>DT claims that thes=
e gpios are required, yet one is using the optional gpio API.<br>Is the cod=
e off, or does the DT need fixing?=C2=A0</div><div><br></div><div><span sty=
le=3D"color:rgb(51,51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,&qu=
ot;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malg=
un Gothic&quot;,Meiryo,sans-serif;font-size:14px;font-variant-numeric:norma=
l;font-variant-east-asian:normal;line-height:26px;text-align:justify;backgr=
ound-color:rgb(247,248,250)">Thank you for your advice</span>=C2=A0, I will=
=C2=A0 fix code.<br></div><div><br></div><div><span style=3D"color:rgb(80,0=
,80)">static int send_mipi_cmds(struct drm_panel *panel, const struct panel=
_cmd *cmds)</span>=C2=A0</div><div>This format seems semi-magical. Any part=
icular reason why you&#39;re not<br>using the helpers?<br>In particular, en=
ter/exit sleep mode and set display on/off.=C2=A0</div><div><br></div><div>=
<span style=3D"color:rgb(51,51,51);font-family:Arial,&quot;Microsoft YaHei&=
quot;,&quot;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&=
quot;Malgun Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;font-variant-nu=
meric:normal;font-variant-east-asian:normal;line-height:25.9875px;text-alig=
n:justify;background-color:rgb(247,248,250)">Normally, we only need to down=
load 0x28 0x10 commands to power-key down.=C2=A0</span></div><div><span sty=
le=3D"color:rgb(51,51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,&qu=
ot;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malg=
un Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;line-height:25.9875px;text-align:justify=
;background-color:rgb(247,248,250)">I noticed that helper func (</span>mipi=
_dsi_dcs_set_display_off, mipi_dsi_dcs_enter_sleep_mode) help me send this =
commands(0x28 0x10).</div><div><span style=3D"background-color:rgb(247,248,=
250);color:rgb(51,51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,&quo=
t;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malgu=
n Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;text-align:justify"><br><=
/span></div><div><span style=3D"background-color:rgb(247,248,250);color:rgb=
(51,51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,&quot;\005fae\008f=
6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malgun Gothic&quot;=
,Meiryo,sans-serif;font-size:13.6px;text-align:justify">But based on previo=
us debugging experience,</span><span style=3D"background-color:rgb(247,248,=
250);color:rgb(51,51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,&quo=
t;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malgu=
n Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;text-align:justify">=C2=
=A0</span><span style=3D"background-color:rgb(247,248,250);color:rgb(74,144=
,226);font-family:Arial,&quot;Microsoft YaHei&quot;,&quot;\005fae\008f6f\00=
96c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malgun Gothic&quot;,Meir=
yo,sans-serif;font-size:13.6px;text-align:justify">Some vendors are special=
 and=C2=A0 may send other commands after sending cmd 0x28 0x10 or before se=
nd cmd 0x28 0x10.</span></div><div><span style=3D"background-color:rgb(247,=
248,250);color:rgb(51,51,51);font-family:Arial,&quot;Microsoft YaHei&quot;,=
&quot;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;M=
algun Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;text-align:justify">t=
his problem may also occur in our vendor,=C2=A0</span></div><div><span styl=
e=3D"background-color:rgb(247,248,250);color:rgb(51,51,51);font-family:Aria=
l,&quot;Microsoft YaHei&quot;,&quot;\005fae\008f6f\0096c5\009ed1&quot;,&quo=
t;\005b8b\004f53&quot;,&quot;Malgun Gothic&quot;,Meiryo,sans-serif;font-siz=
e:13.6px;text-align:justify">so i think=C2=A0</span><span style=3D"backgrou=
nd-color:rgb(247,248,250);color:rgb(51,51,51);font-family:Arial,&quot;Micro=
soft YaHei&quot;,&quot;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004=
f53&quot;,&quot;Malgun Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;text=
-align:justify">this above approach helps me manage code better.</span></di=
v><div><span style=3D"background-color:rgb(247,248,250);color:rgb(51,51,51)=
;font-family:Arial,&quot;Microsoft YaHei&quot;,&quot;\005fae\008f6f\0096c5\=
009ed1&quot;,&quot;\005b8b\004f53&quot;,&quot;Malgun Gothic&quot;,Meiryo,sa=
ns-serif;font-size:13.6px;text-align:justify"><br></span></div><div style=
=3D"text-align:justify"><font color=3D"#333333" face=3D"Arial, Microsoft Ya=
Hei, \\5FAE=E8=BD=AF=E9=9B=85=E9=BB=91, \\5B8B=E4=BD=93, Malgun Gothic, Mei=
ryo, sans-serif"><span style=3D"font-size:13.6px;background-color:rgb(247,2=
48,250)">Thanks.</span></font></div><div><span style=3D"background-color:rg=
b(247,248,250);color:rgb(74,144,226);font-family:Arial,&quot;Microsoft YaHe=
i&quot;,&quot;\005fae\008f6f\0096c5\009ed1&quot;,&quot;\005b8b\004f53&quot;=
,&quot;Malgun Gothic&quot;,Meiryo,sans-serif;font-size:13.6px;text-align:ju=
stify"><br></span></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Emil Velikov &lt;<a href=3D"mailto:emil.l.vel=
ikov@gmail.com">emil.l.velikov@gmail.com</a>&gt; =E4=BA=8E2019=E5=B9=B47=E6=
=9C=881=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=889:41=E5=86=99=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jer=
ry,<br>
<br>
On Thu, 25 Apr 2019 at 08:40, Jerry Han &lt;<a href=3D"mailto:jerry.han.hq@=
gmail.com" target=3D"_blank">jerry.han.hq@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Support Boe Himax8279d 8.0&quot; 1200x1920 TFT LCD panel, it is a MIPI=
 DSI<br>
&gt; panel.<br>
&gt;<br>
&gt; V8:<br>
&gt; - Modify communication address<br>
&gt;<br>
&gt; V7:<br>
&gt; - Add the information of the reviewer<br>
&gt; - Remove unnecessary delays, The udelay_range code gracefully returns<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0without hitting the scheduler on a delay of 0. (Der=
ek)<br>
&gt; - Merge the same data structures, like display_mode and off_cmds (Dere=
k)<br>
&gt; - Optimize the processing of results returned by<br>
&gt;=C2=A0 =C2=A0 =C2=A0devm_gpiod_get_optional (Derek)<br>
&gt;<br>
&gt; V6:<br>
&gt; - Add the information of the reviewer (Sam)<br>
&gt; - Delete unnecessary header files #include &lt;linux/fb.h&gt; (Sam)<br=
>
&gt; - The config DRM_PANEL_BOE_HIMAX8279D appears twice. Drop one of them =
(Sam)<br>
&gt; - ADD static, set_gpios function is not used outside this module (Sam)=
<br>
&gt;<br>
&gt; V5:<br>
&gt; - Added changelog<br>
&gt;<br>
&gt; V4:<br>
&gt; - Frefix all function maes with boe_ (Sam)<br>
&gt; - Fsed &quot;enable_gpio&quot; replace &quot;reset_gpio&quot;, Make it=
 look clearer (Sam)<br>
&gt; - Sort include lines alphabetically (Sam)<br>
&gt; - Fixed entries in the makefile must be sorted alphabetically (Sam)<br=
>
&gt; - Add send_mipi_cmds function to avoid duplicating the code (Sam)<br>
&gt; - Add the necessary delay(reset_delay_t5) between reset and sending<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0the initialization command (Rock wang)<br>
&gt;<br>
&gt; V3:<br>
&gt; - Remove unnecessary delays in sending initialization commands (Jitao =
Shi)<br>
&gt;<br>
&gt; V2:<br>
&gt; - Use SPDX identifier (Sam)<br>
&gt; - Use necessary header files replace drmP.h (Sam)<br>
&gt; - Delete unnecessary header files #include &lt;linux/err.h&gt; (Sam)<b=
r>
&gt; - Specifies a GPIOs array to control the reset timing,<br>
&gt;=C2=A0 =C2=A0 =C2=A0instead of reading &quot;dsi-reset-sequence&quot; d=
ata from DTS (Sam)<br>
&gt; - Delete backlight_disable() function when already disabled (Sam)<br>
&gt; - Use devm_of_find_backlight() replace of_find_backlight_by_node() (Sa=
m)<br>
&gt; - Move the necessary data in the DTS to the current file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0like porch, display_mode and Init code etc. (Sam)<b=
r>
&gt; - Add compatible device &quot;boe,himax8279d10p&quot; (Sam)<br>
&gt;<br>
&gt; Signed-off-by: Jerry Han &lt;<a href=3D"mailto:jerry.han.hq@gmail.com"=
 target=3D"_blank">jerry.han.hq@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" targ=
et=3D"_blank">sam@ravnborg.org</a>&gt;<br>
&gt; Reviewed-by: Derek Basehore &lt;<a href=3D"mailto:dbasehore@chromium.o=
rg" target=3D"_blank">dbasehore@chromium.org</a>&gt;<br>
&gt; Cc: Jitao Shi &lt;<a href=3D"mailto:jitao.shi@mediatek.com" target=3D"=
_blank">jitao.shi@mediatek.com</a>&gt;<br>
&gt; Cc: Rock wang &lt;<a href=3D"mailto:rock_wang@himax.com.cn" target=3D"=
_blank">rock_wang@himax.com.cn</a>&gt;<br>
&gt; ---<br>
While the DT has landed, this patch is not merged it seems.<br>
I think that Sam is waiting for a version which does not trigger so<br>
many check-patch warnings.<br>
<br>
That said, a couple of comments if I may.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc *enable_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc *pp33_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc *pp18_gpio;<br>
DT claims that these gpios are required, yet one is using the optional gpio=
 API.<br>
Is the code off, or does the DT need fixing?<br>
<br>
<br>
&gt; +static int send_mipi_cmds(struct drm_panel *panel, const struct panel=
_cmd *cmds)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct panel_info *pinfo =3D to_panel_info=
(panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmds)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; cmds[i].len !=3D 0; i++) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct p=
anel_cmd *cmd =3D &amp;cmds[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cmd-&gt;le=
n =3D=3D 2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0err =3D mipi_dsi_dcs_write(pinfo-&gt;link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;data[1], NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0err =3D mipi_dsi_dcs_write(pinfo-&gt;link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;data[1], cmd-&gt;data + 2,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;len - 2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range((=
cmd-&gt;data[0]) * 1000,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 + cmd-&gt;data[0]) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
This format seems semi-magical. Any particular reason why you&#39;re not<br=
>
using the helpers?<br>
In particular, enter/exit sleep mode and set display on/off.<br>
<br>
Speaking of which - the 8inch display uses then, yet they are missing<br>
for the 10inch one. Seems like there&#39;s a bug in there.<br>
<br>
Plus we have some repeating patterns in the vendor/undocumented<br>
commands - good reason to get those into separate hunks.<br>
With the above in place, you can effectively drop the .off_cmd<br>
callback and sleep field from the INIT_CMD arrays.<br>
<br>
Hence, less code to debug and maintain ;-)<br>
<br>
HTH<br>
Emil<br>
</blockquote></div>

--0000000000007b24f5058e8d89c1--

--===============0224996040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0224996040==--
