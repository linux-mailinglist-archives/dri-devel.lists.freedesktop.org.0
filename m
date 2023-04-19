Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263B6E8B12
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D910EBA3;
	Thu, 20 Apr 2023 07:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B8110E154
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 03:05:08 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6a5f6349ec3so633753a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681873508; x=1684465508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QZeuMV+vEXzFRnIU34JeDcEoYggioEboredt1ZTcfF4=;
 b=MQi02R585rXr0SIVnWNM+mOsjrdyWCsOoYT64WYFe66BrJ7bVWGyJ4J4vpIYpnC/6Y
 6u8oeJe5lkPK8mWdLzgx2D9EOMl2P0beF+YiM6E+t5VzxhTVhB+2LtF1eQieF7h8X/jI
 wDgvQnx07vASdWpnmcFs1PgEmSrjtBmwc+LSVnFLEAqbFn+4QMNVSjLhdgs3xg7jo+BQ
 7zT2EPm/SIhiY93tD35uwxQfeGGuEeSfPExIp9Tl/Vb8P/kiScOsuZDErdvo7shLfV40
 0qWDpqfgeBmxsPgH+82Ubgo6H6Gu+MRA+Aj8ECi7Mbaglqta4wHtEXzeUJma2iGLStAu
 eRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681873508; x=1684465508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZeuMV+vEXzFRnIU34JeDcEoYggioEboredt1ZTcfF4=;
 b=K/BSLMDyRc1E7tPQS/Z3nLpuK9fF6mLd7ksvt0BNpVckWmGL2eyhcyOSXOI8o9OltQ
 HXKPUWrFi+yh6GHBOMbDS8CANTfeCr63OUzJWWqDIuBTzEi46tqpdZjQPKnhn6yvL794
 Y+R/O7mQr+MIiztmDYoIiZ+sJi0Tiuud4lE56aiVdpq2dd0FqyMyybSQ3u34i7iVLstn
 oQOoAt+zpLwnauUrYG2Vd3tQSGB1oqfOD28c3fO75PM+yVnqX3AyCkldhbRFOxbGhGq/
 FC4dBpvkA8lO3FvvcqpoioQk9EVgWPx7afKyoN3F8WAoiykuCUnjqWbh/YjLtBYmZnSF
 vKiA==
X-Gm-Message-State: AAQBX9f5rmSbazfp1MXMQipkQRp15fn4LLObXqklUEKqhwo2EuTNWaIv
 H7er2l2XO2wgfOnIXAZP1Cs99heFRvyojPSlBXY=
X-Google-Smtp-Source: AKy350ZJCGCoY/FW7XgmgC6to4ottArJt+Zm6CfbZj7ZzzK3acYtXBwMYjSTBr5T80A+2/aIUpQp49wDfBX46zhLxOY=
X-Received: by 2002:a05:6870:d6a0:b0:188:1195:5ec4 with SMTP id
 z32-20020a056870d6a000b0018811955ec4mr1445135oap.40.1681873507764; Tue, 18
 Apr 2023 20:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230414181641.8868-1-hymmsx.yu@gmail.com>
 <CAMty3ZD=SVZg=EQO9-mxPp9TZzu2hOpZ8qDP5asE276zbTJ7Zg@mail.gmail.com>
In-Reply-To: <CAMty3ZD=SVZg=EQO9-mxPp9TZzu2hOpZ8qDP5asE276zbTJ7Zg@mail.gmail.com>
From: =?UTF-8?B?5L2Z5rK75Zu9?= <hymmsx.yu@gmail.com>
Date: Wed, 19 Apr 2023 11:04:54 +0800
Message-ID: <CAMpKc0mZ-0tyQTssCpdfByhq1b2uX8WOa=D-CuLrHHooKgz4Nw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:Fix the panic problem caused by
 bridge->funcs->attach
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="000000000000fcceca05f9a7b0c4"
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fcceca05f9a7b0c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The log looks like this:
[ 31.723823] Internal error: Oops: 96000004 [#1] SMP\013 \010
[ 31.729030] Modules linked in:\013 \010
[ 31.733395] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.59+2.0.0
#250\013
\010
[ 31.745167] pstate: 60c00005 (nZCv daif +PAN +UAO -TCO BTYPE=3D--)\013 \01=
0
[ 31.752785] pc : drm_bridge_attach+0xdc/0x1a4\013 \010
[ 31.757518] lr : drm_bridge_attach+0x40/0x1a4\013 \010
[ 31.762104] sp : ffff0000000678f0\013 \010
[ 31.765726] x29: ffff0000000678f0 x28: ffff00000031c880 \013 \010
[ 31.771599] x27: 0000000000000060 x26: ffff800010539e90 \013 \010
[ 31.777340] x25: ffff0000000a6000 x24: ffff000000129c10 \013 \010
[ 31.783060] x23: 0000000000000000 x22: ffff0000000131c0 \013 \010
[ 31.788770] x21: ffff80001052a5b8 x20: ffff0000003e2c80 \013 \010
[ 31.794506] x19: ffff000000017080 x18: 0000000000000010 \013 \010
[ 31.800210] x17: 000000005fcfcd6c x16: 00000000d27b105e \013 \010
[ 31.805907] x15: 00000000000000c7 x14: ffff0000000675d0 \013 \010
[ 31.811599] x13: 00000000ffffffea x12: ffff8000114158c0 \013 \010
[ 31.817282] x11: 0000000000000003 x10: ffff800011295880 \013 \010
[ 31.823000] x9 : ffff8000112958d8 x8 : 000000000017ffe8 \013 \010
[ 31.828731] x7 : c0000000fffeffff x6 : 0000000000000001 \013 \010
[ 31.834425] x5 : 000000000057ffa8 x4 : 0000000000000000 \013 \010
[ 31.840101] x3 : 0000000000000000 x2 : ffff000000013218 \013 \010
[ 31.845787] x1 : ffff0000003e2cf8 x0 : 0000000000000000 \013 \010
[ 31.851594] Call trace:\013 \010
[ 31.854603] drm_bridge_attach+0xdc/0x1a4\013 \010
[ 31.859079] dw_mipi_dsi_bridge_attach+0x98/0xa8\013 \010
[ 31.864035] drm_bridge_attach+0x104/0x1a4\013 \010
[ 31.869211] dw_mipi_dsi_bind+0x24/0x58\013 \010
drm_bridge_attach will call bridge->funcs in many cases, so I think it is
necessary to check=E3=80=82


Jagan Teki <jagan@amarulasolutions.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8818=
=E6=97=A5=E5=91=A8=E4=BA=8C 21:45=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, Apr 17, 2023 at 12:52=E2=80=AFPM logic.yu <hymmsx.yu@gmail.com> w=
rote:
> >
> > When the code is executed to bridge->funcs->attach,bridge->funcs is NUL=
L.
> > Although the function entry checks whether the bridge pointer is NULL,i=
t
> > does not detect whether the bridge->funcs is NULL, so a panic error
> > occurs.
> >
> > Signed-off-by: logic.yu <hymmsx.yu@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.=
c
> > index c3d69af02e79..f3dd67fb3f1d 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -302,7 +302,7 @@ int drm_bridge_attach(struct drm_encoder *encoder,
> struct drm_bridge *bridge,
> >  {
> >         int ret;
> >
> > -       if (!encoder || !bridge)
> > +       if (!encoder || !bridge || !bridge->funcs)
>
> Would you please share the use case log where you found panic? I think
> checking bridge->funcs during funcs-> trigger later in this function
> would be a valid check (assume if an issue) as some drivers use the
> bridge to handle downstream bridge w/o using any bridge functions.
>
> Jagan.
>

--000000000000fcceca05f9a7b0c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div style=3D"white-space:pre" class=3D"gmail-ace-lin=
e gmail-ace-line gmail-old-record-id-BEqodSeYeo6G2Wxkr60crdsfnTh">The log l=
ooks like this:<br></div><div style=3D"white-space:pre" class=3D"gmail-ace-=
line gmail-ace-line gmail-old-record-id-BEqodSeYeo6G2Wxkr60crdsfnTh">[   31=
.723823] Internal error: Oops: 96000004 [#1] SMP\013 \010 </div><div style=
=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-recor=
d-id-ZWModOG2WooUeqxkB7IcsyWNnXg">[   31.729030] Modules linked in:\013 \01=
0 </div><div style=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-li=
ne gmail-old-record-id-Kse4d2o6coMeKKxkxLmcwXl9ntd">[   31.733395] CPU: 0 P=
ID: 1 Comm: swapper/0 Not tainted 5.10.59+2.0.0 #250\013 </div><div style=
=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-recor=
d-id-VYWIdwwCOoAcWWxkFpkcIu6Hndd">\010 </div><div style=3D"white-space:pre"=
 class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-EwUeduI8Goo0a2x=
4tnjcMN66nSf">[   31.745167] pstate: 60c00005 (nZCv daif +PAN +UAO -TCO BTY=
PE=3D--)\013 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace-l=
ine gmail-ace-line gmail-old-record-id-H0o8dgawoouYooxgtGrcNHYOnyc">[   31.=
752785] pc : drm_bridge_attach+0xdc/0x1a4\013 \010 </div><div style=3D"whit=
e-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-QSA=
idEaO6oEY4yxAddscsLVinwf">[   31.757518] lr : drm_bridge_attach+0x40/0x1a4\=
013 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace-line gmail=
-ace-line gmail-old-record-id-To0MdMQ0ooysawxKo2UcuwCanLg">[   31.762104] s=
p : ffff0000000678f0\013 \010 </div><div style=3D"white-space:pre" class=3D=
"gmail-ace-line gmail-ace-line gmail-old-record-id-MYCidIMm8oEQq0xgrrNcb9Pt=
n5f">[   31.765726] x29: ffff0000000678f0 x28: ffff00000031c880 \013 \010 <=
/div><div style=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-line =
gmail-old-record-id-RW00dkesKow0EKx8j5ScKxNtnPd">[   31.771599] x27: 000000=
0000000060 x26: ffff800010539e90 \013 \010 </div><div style=3D"white-space:=
pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-BUEad4uQAoO=
WCuxeQmucjaGInqg">[   31.777340] x25: ffff0000000a6000 x24: ffff000000129c1=
0 \013 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace-line gm=
ail-ace-line gmail-old-record-id-OGAMdgEo0oIYUAxoU7mcTBMDnRI">[   31.783060=
] x23: 0000000000000000 x22: ffff0000000131c0 \013 \010 </div><div style=3D=
"white-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-i=
d-EUASdsOIkoIA6sxWGsWcLla5nWc">[   31.788770] x21: ffff80001052a5b8 x20: ff=
ff0000003e2c80 \013 \010 </div><div style=3D"white-space:pre" class=3D"gmai=
l-ace-line gmail-ace-line gmail-old-record-id-O8eOd6O6Soc6WmxWo7YcZt4un6f">=
[   31.794506] x19: ffff000000017080 x18: 0000000000000010 \013 \010 </div>=
<div style=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail=
-old-record-id-Ago6dQ8YAoCwkOxsBcIcArFXnob">[   31.800210] x17: 000000005fc=
fcd6c x16: 00000000d27b105e \013 \010 </div><div style=3D"white-space:pre" =
class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-TaoSd8Cekoi0Wexs=
pohcL2WBnKb">[   31.805907] x15: 00000000000000c7 x14: ffff0000000675d0 \01=
3 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace-line gmail-a=
ce-line gmail-old-record-id-AKGEdAGOgoESwuxc9IhcdagXn3e">[   31.811599] x13=
: 00000000ffffffea x12: ffff8000114158c0 \013 \010 </div><div style=3D"whit=
e-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-SaI=
SdQme6oUoqCxw0OucqDJrnbb">[   31.817282] x11: 0000000000000003 x10: ffff800=
011295880 \013 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace=
-line gmail-ace-line gmail-old-record-id-Eg8qd0AoMocgMcxuOFGci1icnOc">[   3=
1.823000] x9 : ffff8000112958d8 x8 : 000000000017ffe8 \013 \010 </div><div =
style=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-=
record-id-DISEd2Cs0oiAYexYJ7Bc8AaenNe">[   31.828731] x7 : c0000000fffeffff=
 x6 : 0000000000000001 \013 \010 </div><div style=3D"white-space:pre" class=
=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-Nk6Idy0AqokGQexC5aHco=
49anSE">[   31.834425] x5 : 000000000057ffa8 x4 : 0000000000000000 \013 \01=
0 </div><div style=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-li=
ne gmail-old-record-id-Skwqde8y0o0scyxigEVcFtkengb">[   31.840101] x3 : 000=
0000000000000 x2 : ffff000000013218 \013 \010 </div><div style=3D"white-spa=
ce:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-DOMqdkI4=
eocyW0xwcgecfKyRnrb">[   31.845787] x1 : ffff0000003e2cf8 x0 : 000000000000=
0000 \013 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace-line=
 gmail-ace-line gmail-old-record-id-H6u2dsGscoGqY2x4rqZcE5qwneg">[   31.851=
594] Call trace:\013 \010 </div><div style=3D"white-space:pre" class=3D"gma=
il-ace-line gmail-ace-line gmail-old-record-id-ZKsqdKOaqoMs2Sx4SgEcz2idnSb"=
>[   31.854603]  drm_bridge_attach+0xdc/0x1a4\013 \010 </div><div style=3D"=
white-space:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id=
-YWgidI6OQoUASSxAr0Wcb2AvnHe">[   31.859079]  dw_mipi_dsi_bridge_attach+0x9=
8/0xa8\013 \010 </div><div style=3D"white-space:pre" class=3D"gmail-ace-lin=
e gmail-ace-line gmail-old-record-id-Hek8dsOwooCSIsxcRl0crDzBnAc">[   31.86=
4035]  drm_bridge_attach+0x104/0x1a4\013 \010 </div><div style=3D"white-spa=
ce:pre" class=3D"gmail-ace-line gmail-ace-line gmail-old-record-id-GwYydgGg=
ao40aOxkn7lcF9ESnJb">[   31.869211]  dw_mipi_dsi_bind+0x24/0x58\013 \010 </=
div></div><div style=3D"white-space:pre" class=3D"gmail-ace-line gmail-ace-=
line gmail-old-record-id-GwYydgGgao40aOxkn7lcF9ESnJb">drm_bridge_attach wil=
l call bridge-&gt;funcs in many cases, so I think it is necessary to check=
=E3=80=82<br></div><div style=3D"white-space:pre" class=3D"gmail-ace-line g=
mail-ace-line gmail-old-record-id-GwYydgGgao40aOxkn7lcF9ESnJb"><br></div><s=
pan class=3D"gmail-lark-record-clipboard"></span></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jagan Teki &lt;<a href=3D"=
mailto:jagan@amarulasolutions.com">jagan@amarulasolutions.com</a>&gt; =E4=
=BA=8E2023=E5=B9=B44=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 21:45=E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, Apr 17, 2023 at 12:52=E2=80=AFPM logic.yu &lt;<a href=3D"mailto:=
hymmsx.yu@gmail.com" target=3D"_blank">hymmsx.yu@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; When the code is executed to bridge-&gt;funcs-&gt;attach,bridge-&gt;fu=
ncs is NULL.<br>
&gt; Although the function entry checks whether the bridge pointer is NULL,=
it<br>
&gt; does not detect whether the bridge-&gt;funcs is NULL, so a panic error=
<br>
&gt; occurs.<br>
&gt;<br>
&gt; Signed-off-by: logic.yu &lt;<a href=3D"mailto:hymmsx.yu@gmail.com" tar=
get=3D"_blank">hymmsx.yu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_bridge.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge=
.c<br>
&gt; index c3d69af02e79..f3dd67fb3f1d 100644<br>
&gt; --- a/drivers/gpu/drm/drm_bridge.c<br>
&gt; +++ b/drivers/gpu/drm/drm_bridge.c<br>
&gt; @@ -302,7 +302,7 @@ int drm_bridge_attach(struct drm_encoder *encoder,=
 struct drm_bridge *bridge,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!encoder || !bridge)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!encoder || !bridge || !bridge-&gt;fun=
cs)<br>
<br>
Would you please share the use case log where you found panic? I think<br>
checking bridge-&gt;funcs during funcs-&gt; trigger later in this function<=
br>
would be a valid check (assume if an issue) as some drivers use the<br>
bridge to handle downstream bridge w/o using any bridge functions.<br>
<br>
Jagan.<br>
</blockquote></div>

--000000000000fcceca05f9a7b0c4--
