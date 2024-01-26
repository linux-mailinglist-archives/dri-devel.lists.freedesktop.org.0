Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C083DB9C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F3910FB0B;
	Fri, 26 Jan 2024 14:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D96410FB09
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 14:19:53 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-602ab446cd8so4255417b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 06:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1706278732; x=1706883532;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0TpTkrzxhSf10HfAwj2dW7drxWxK6BW9GIW4MZSVPmc=;
 b=bbkWJAL2FG0IJOGyOs+UAe0mvcocpjF/87i3k9ZrHhBtC4QRT+fGRR15rZIO1lVS3V
 XaFxbKGzV8SyCYtDbMn51n5Egsf5b8sA83yLbznHARlYzb1rsvGzG/cV3XRUxMQJLo7m
 SAE/vU/4MR78dvxGa/f1EKh2vAmarp4GxIrLn+gqUY7XW/y7Ssoej6+fYsFtpZNhe/UA
 bUEqSznQONUYZn2Eej8k7F1gq7qEW9OD+AREhYlXnZcwRXsxzkAiSimN1fLx5Ri5ZTDc
 EHCXJ4zs8OV1gT2NdLOG9y2L9UF9uGe7306Cp5tEknwf/foFPbhE0He2+3hkgcO8bIVu
 XvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706278732; x=1706883532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TpTkrzxhSf10HfAwj2dW7drxWxK6BW9GIW4MZSVPmc=;
 b=Ud8HC6saDdzy3PDIOSee9oNXHacOkoaJXmF52uV24a20pD31IhIpOFtOS/euXpZK90
 wOVucnfwH2usN0QFmXLG/q+tg0vJ+1vcWMiVWopSjYmle8I2OSrEeDXm9JtKMBKkieZR
 AuSJJmMrkiGwyTs3GzGgCJIJBNkZrhZhBmVOzxtT3phXGSXLbHGktyUYB6I2lA782+LJ
 AACDU4x3Zc342lYh5/sOnRv4m6ZQp0kF3IVLLEweyop/MW43pE5oFNEvg7UQJCOkyw04
 0OHVoKvTzU8iIkY8QvItSHVvZKkWpA1UWeZCK/+4561Y/n+NM/+ZIWlj9/gKu1N373NT
 0QPw==
X-Gm-Message-State: AOJu0YxCWzTym5wogHuKcwe/z6/JeUr1LBzqI9fkAlk8O8Ng4UksStKR
 Kd6DXZWaWVJm5Z/DPa8uMDr7sQ0V81sFBUX0g/ErjFX358mGd6mbySwi6CiTHyXQ3FkIktaReF3
 1GPEoZ+4L1QZKVFPTPWMX9ceg88P6lVSpz/W66A==
X-Google-Smtp-Source: AGHT+IEuwyYj61BVtYr9Y3V+MeJtluccqqV+z4ZH3AJsr4Iku6Yk0H/8e/orXra6eDvQLE2H58KN69rz3iSBMbH+2ok=
X-Received: by 2002:a81:92ca:0:b0:5ff:9676:3658 with SMTP id
 j193-20020a8192ca000000b005ff96763658mr1312300ywg.48.1706278732468; Fri, 26
 Jan 2024 06:18:52 -0800 (PST)
MIME-Version: 1.0
References: <AdpQQouNfGqYf3uSSdGt8uzEBuaRnw==>
 <4c03efeca8ce42beb41b2f70433e6634@iav.de>
In-Reply-To: <4c03efeca8ce42beb41b2f70433e6634@iav.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 26 Jan 2024 14:18:36 +0000
Message-ID: <CAPY8ntA2yOUnP7DEeHahYsW8vC-Xpqf37ZmycDdO-NoobfjyDw@mail.gmail.com>
Subject: Re: drm: Stable identification of connectors?
To: "Albert, Joerg (TT-U)" <Joerg.Albert@iav.de>
Content-Type: multipart/alternative; boundary="000000000000bca6d2060fd9f9ee"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000bca6d2060fd9f9ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joerg

On Fri, 26 Jan 2024 at 10:45, Albert, Joerg (TT-U) <Joerg.Albert@iav.de>
wrote:

> Hi,
>
>
>
> I=E2=80=99m pretty new to DRM/DRI and wonder if there is a way to have a =
stable
> identification of connectors across changes in the Linux kernel and/or in
> the devicetree?
>
>
>
> Our hardware contains an iMX8QM with two displays, each one connected to =
a
> MIPI-DSI channel. We use kernel 6.1.38.
>
> In the output of =E2=80=9Cmodetest -c=E2=80=9D the connectors are called =
LVDS-1 and
> LVDS-2. These names are built in modetest.c from connector_type and
> connector_type_id.
>
>
>
> connector_type_id is set in the kernel in drivers/gpu/drm/drm_connector.c
> in __drm_connector_init():
>
>
>
>        *connector* <https://elixir.bootlin.com/linux/latest/C/ident/conne=
ctor>->*connector_type_id* <https://elixir.bootlin.com/linux/latest/C/ident=
/connector_type_id> =3D
>
>               *ida_alloc_min* <https://elixir.bootlin.com/linux/latest/C/=
ident/ida_alloc_min>(*connector_ida* <https://elixir.bootlin.com/linux/late=
st/C/ident/connector_ida>, 1, *GFP_KERNEL* <https://elixir.bootlin.com/linu=
x/latest/C/ident/GFP_KERNEL>);
>
>
>
> Seems to me that this number depends on initialization order only. Is
> there any other way to identify a connector?
>
>
>
> If not, will the type_id be stable as long as we don=E2=80=99t change the=
 kernel
> version and the device tree?
>

My understanding is it all depends on initialisation order, and that isn't
guaranteed.

Raspberry Pi 5 has a similar issue that it has two independent DRM driver
instances each initialising a DSI connector. Which one gets assigned DSI-1
vs DSI-2 is down to probe order, and can change between boots.
You also have the situation that a panel connected to the second connector
is referred to as DSI-1 if nothing is connected to the first, but it'll
probably bump up to DSI-2 should you later configure a panel on the first
connector. Any configuration within a window manager based on display ID is
therefore near useless if there is any change to the system.

It's the same situation if you have more than one SPI display using the
mipi-dbi-spi or tinyDRM drivers - ordering of display to SPI-x IDs is down
to probe order, so near random.

I haven't attempted to upstream this yet, but on our tree [1] I've adopted
the same approach as the I2C and SPI subsystems take where a DT alias can
be used to set the desired connector ID. Devices with no alias get assigned
IDs above the last assigned alias.

Seeing as you've raised the same issue, it'd be interesting to know the
view of the maintainers as to whether my solution is acceptable. There's no
point in trying to upstream it if it's going to be immediately shot down.

Thanks.
  Dave

[1]
https://github.com/raspberrypi/linux/commit/3aa1f2477545ea6298bc6f2d7ffae68=
f090af9b8
and fixup
https://github.com/raspberrypi/linux/commit/f429fc1a072d4bb35e622a1012a5a52=
914eba4e3


>
> Best Regards,
>
> Joerg Albert
>
>
>
>
>
>
>
>
>
>
>
>
> +491747384960
>
>
>
>
> We move the world for the better through technology and engineering.
>
> www.iav.com | Facebook <https://www.facebook.com/insideiav> | Instagram
> <https://www.instagram.com/inside_iav/> | LinkedIn
> <https://www.linkedin.com/company/iav-gmbh> | Xing
> <https://www.xing.com/companies/iav> | YouTube
> <https://www.youtube.com/user/IAVchannel>
>
> IAV GmbH Ingenieurgesellschaft Auto und Verkehr; Sitz/Registered Office:
> Berlin; Registergericht/Registration Court: Amtsgericht Charlottenburg
> (Berlin); Registernummer/Company Registration Number: HRB 21 280 B;
> Gesch=C3=A4ftsf=C3=BChrer/Managing Directors: Joerg Astalosch, Martin Mah=
lke, Dr. Uwe
> Horn; Vorsitzender des Aufsichtsrates/Chairman of the Supervisory Board:
> Dr. Nikolai Ardey
> Datenschutzhinweise/Privacy Policy <https://www.iav.com/datenschutz>
>
>
>

--000000000000bca6d2060fd9f9ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Joerg<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Jan 2024 at 10:45,=
 Albert, Joerg (TT-U) &lt;<a href=3D"mailto:Joerg.Albert@iav.de" target=3D"=
_blank">Joerg.Albert@iav.de</a>&gt; wrote:</div><div dir=3D"ltr" class=3D"g=
mail_attr"><span style=3D"font-size:10pt;font-family:&quot;Arial&quot;,sans=
-serif"></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
><div lang=3D"DE"><div>
<p class=3D"MsoNormal">
<span style=3D"font-size:10pt;font-family:&quot;Arial&quot;,sans-serif">Hi,=
</span> <span style=3D"font-size:10pt;font-family:&quot;Arial&quot;,sans-se=
rif"></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">I=E2=80=99m pretty new to DRM/DRI and wo=
nder if there is a way to have a stable identification of connectors across=
 changes in the Linux kernel and/or in the devicetree?<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">Our hardware contains an iMX8QM with two=
 displays, each one connected to a MIPI-DSI channel. We use kernel 6.1.38.<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">In the output of =E2=80=9Cmodetest -c=E2=
=80=9D the connectors are called LVDS-1 and LVDS-2. These names are built i=
n modetest.c from connector_type and connector_type_id.<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">connector_type_id is set in the kernel i=
n drivers/gpu/drm/drm_connector.c in __drm_connector_init():<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<pre><span><span style=3D"font-size:11pt;color:rgb(187,187,187)" lang=3D"EN=
-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span></span><span><span style=
=3D"font-size:11pt;color:black"><a href=3D"https://elixir.bootlin.com/linux=
/latest/C/ident/connector" target=3D"_blank"><b><span lang=3D"EN-US">connec=
tor</span></b></a></span></span><span><span style=3D"font-size:11pt;color:r=
gb(102,102,102)" lang=3D"EN-US">-&gt;</span></span><span><span style=3D"fon=
t-size:11pt;color:black"><a href=3D"https://elixir.bootlin.com/linux/latest=
/C/ident/connector_type_id" target=3D"_blank"><b><span lang=3D"EN-US">conne=
ctor_type_id</span></b></a></span></span><span><span style=3D"font-size:11p=
t;color:rgb(187,187,187)"> </span></span><span><span style=3D"font-size:11p=
t;color:rgb(102,102,102)" lang=3D"EN-US">=3D</span></span><span style=3D"fo=
nt-size:11pt;color:black" lang=3D"EN-US"><u></u><u></u></span></pre>
<pre><span><span style=3D"font-size:11pt;color:rgb(187,187,187)" lang=3D"EN=
-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 </span></span><span><span style=3D"font-size:11pt;color:black"><a href=
=3D"https://elixir.bootlin.com/linux/latest/C/ident/ida_alloc_min" target=
=3D"_blank"><b><span lang=3D"EN-US">ida_alloc_min</span></b></a></span></sp=
an><span><span style=3D"font-size:11pt;color:rgb(102,102,102)" lang=3D"EN-U=
S">(</span></span><span><span style=3D"font-size:11pt;color:black"><a href=
=3D"https://elixir.bootlin.com/linux/latest/C/ident/connector_ida" target=
=3D"_blank"><b><span lang=3D"EN-US">connector_ida</span></b></a></span></sp=
an><span><span style=3D"font-size:11pt;color:rgb(102,102,102)" lang=3D"EN-U=
S">,</span></span><span><span style=3D"font-size:11pt;color:rgb(187,187,187=
)" lang=3D"EN-US"> </span></span><span><span style=3D"font-size:11pt;color:=
rgb(0,0,221)" lang=3D"EN-US">1</span></span><span><span style=3D"font-size:=
11pt;color:rgb(102,102,102)" lang=3D"EN-US">,</span></span><span><span styl=
e=3D"font-size:11pt;color:rgb(187,187,187)" lang=3D"EN-US"> </span></span><=
span><span style=3D"font-size:11pt;color:black"><a href=3D"https://elixir.b=
ootlin.com/linux/latest/C/ident/GFP_KERNEL" target=3D"_blank"><b><span lang=
=3D"EN-US">GFP_KERNEL</span></b></a></span></span><span><span style=3D"font=
-size:11pt;color:rgb(102,102,102)" lang=3D"EN-US">);</span></span><span sty=
le=3D"font-size:11pt;color:black" lang=3D"EN-US"><u></u><u></u></span></pre=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">Seems to me that this number depends on =
initialization order only. Is there any other way to identify a connector?<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">If not, will the type_id be stable as lo=
ng as we don=E2=80=99t change the kernel version and the device tree?</span=
></p></div></div></div></blockquote><div><br></div><div>My understanding is=
 it all depends on initialisation order, and that isn&#39;t guaranteed.<br>=
</div><div><br></div><div>Raspberry Pi 5 has a similar issue that it has tw=
o independent DRM driver instances each initialising a DSI connector. Which=
 one gets assigned DSI-1 vs DSI-2 is down to probe order, and can change be=
tween boots.</div><div>
<div>You also have the situation that a panel connected to the second=20
connector is referred to as DSI-1 if nothing is connected to the first, but=
 it&#39;ll=20
probably bump up to DSI-2 should you later configure a panel on the first c=
onnector. Any=20
configuration within a window manager based on display ID is therefore near=
 useless if there is any change to the system.<br></div><div><br></div>

It&#39;s the same situation if you have more than one SPI display using the=
 mipi-dbi-spi or tinyDRM drivers - ordering of display to SPI-x IDs is down=
 to probe order, so near random.<br></div><div></div><br><div>I haven&#39;t=
 attempted to upstream this yet, but on our tree [1] I&#39;ve adopted the s=
ame approach as the I2C and SPI subsystems take where a DT alias can be use=
d to set the desired connector ID. Devices with no alias get assigned IDs a=
bove the last assigned alias.<br></div><div><br></div><div>Seeing as you&#3=
9;ve raised the same issue, it&#39;d be interesting to know the view of the=
 maintainers as to whether my solution is acceptable. There&#39;s no point =
in trying to upstream it if it&#39;s going to be immediately shot down.<br>=
</div><div><br></div><div>Thanks.</div><div>=C2=A0 Dave</div><div><br></div=
><div>
<div>[1] <a href=3D"https://github.com/raspberrypi/linux/commit/3aa1f247754=
5ea6298bc6f2d7ffae68f090af9b8" target=3D"_blank">https://github.com/raspber=
rypi/linux/commit/3aa1f2477545ea6298bc6f2d7ffae68f090af9b8</a>
 and fixup=20
<a href=3D"https://github.com/raspberrypi/linux/commit/f429fc1a072d4bb35e62=
2a1012a5a52914eba4e3" target=3D"_blank">https://github.com/raspberrypi/linu=
x/commit/f429fc1a072d4bb35e622a1012a5a52914eba4e3</a></div><div><br></div>

</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div lang=3D"D=
E"><div><p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&q=
uot;Arial&quot;,sans-serif" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">=C2=A0<br></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">Best Regards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US">Joerg Albert<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Arial=
&quot;,sans-serif;color:white" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Arial=
&quot;,sans-serif;color:white" lang=3D"EN-US"><br>
+491747384960<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<font size=3D"2"><font size=3D"1" face=3D"Arial"><font style=3D"font-size:8=
pt;font-family:Arial" color=3D"#000000">We move the world for the better th=
rough technology and engineering</font>.</font></font><br>
<br>
<span style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)"><a href=
=3D"https://www.iav.com" title=3D"" style=3D"font-family:Arial;font-size:8p=
t;color:rgb(5,99,193)" target=3D"_blank"><span style=3D"font-family:Arial;f=
ont-size:8pt;color:rgb(5,99,193)">www.iav.com</span></a></span><font size=
=3D"1" face=3D"Arial">=C2=A0</font><font size=3D"1" face=3D"Arial">|
</font><span style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">=
<a href=3D"https://www.facebook.com/insideiav" title=3D"" style=3D"font-fam=
ily:Arial;font-size:8pt;color:rgb(5,99,193)" target=3D"_blank"><span style=
=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">Facebook</span></a=
></span><font size=3D"1" face=3D"Arial">
 | <span style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)"><a h=
ref=3D"https://www.instagram.com/inside_iav/" title=3D"" style=3D"font-fami=
ly:Arial;font-size:8pt;color:rgb(5,99,193)" target=3D"_blank"><span style=
=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">Instagram</span></=
a></span><font size=3D"1" face=3D"Arial">
 |</font> </font><span style=3D"font-family:Arial;font-size:8pt;color:rgb(5=
,99,193)"><a href=3D"https://www.linkedin.com/company/iav-gmbh" title=3D"" =
style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)" target=3D"_bl=
ank"><span style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">Li=
nkedIn</span></a></span><font size=3D"1" face=3D"Arial">
 | </font><span style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193=
)"><a href=3D"https://www.xing.com/companies/iav" title=3D"" style=3D"font-=
family:Arial;font-size:8pt;color:rgb(5,99,193)" target=3D"_blank"><span sty=
le=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">Xing</span></a><=
/span><font size=3D"1" face=3D"Arial">=C2=A0|
</font><span style=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">=
<a href=3D"https://www.youtube.com/user/IAVchannel" title=3D"" style=3D"fon=
t-family:Arial;font-size:8pt;color:rgb(5,99,193)" target=3D"_blank"><span s=
tyle=3D"font-family:Arial;font-size:8pt;color:rgb(5,99,193)">YouTube</span>=
</a></span><br>
<font size=3D"2"><font style=3D"font-size:8pt;font-family:Arial" size=3D"1"=
 face=3D"Arial"><br>
IAV GmbH Ingenieurgesellschaft Auto und Verkehr; Sitz/Registered Office: Be=
rlin; Registergericht/Registration Court: Amtsgericht Charlottenburg (Berli=
n); Registernummer/Company Registration Number: HRB 21 280 B; Gesch=C3=A4ft=
sf=C3=BChrer/Managing Directors: Joerg Astalosch,
 Martin Mahlke, Dr. Uwe Horn; Vorsitzender des Aufsichtsrates/Chairman of t=
he Supervisory Board: Dr. Nikolai Ardey<br>
<span style=3D"color:rgb(5,99,193)"><a href=3D"https://www.iav.com/datensch=
utz" title=3D"" style=3D"color:rgb(5,99,193)" target=3D"_blank"><span style=
=3D"color:rgb(5,99,193)">Datenschutzhinweise/Privacy Policy</span></a></spa=
n></font></font>
<p></p>
<br>
<p></p>
<p></p>
</div>

</div></blockquote></div></div>

--000000000000bca6d2060fd9f9ee--
