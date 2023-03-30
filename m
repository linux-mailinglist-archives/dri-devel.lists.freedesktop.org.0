Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC86D0D94
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648810EF71;
	Thu, 30 Mar 2023 18:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652F610EF71
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:16:44 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id g9so14424272uam.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1680200203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NSA0XStYZCKEYruhJGOHIQm+eaQuxGDvTax5shqT4WU=;
 b=CCDZtiucry1295bjcIdigR6lSYpaIybIDDbCuCxHv41LE4rKBjl8a8bNIckU6KkBD9
 Ji7BgxRiJUVI4DVILElFe+E0g4sdHm+NT17ftCwXBFKH55IZQVM+JMiwJVjtsFUJRd8E
 sUlNN+oVab3aH8SvLIYK6HVEn7PZgsHoTnPLIqHjUcPll0dXVHS4oRLAZRRqfE++Qojz
 rq30+IrjHxlg3hfLKoAaB6vL7qdS/CHkys5Lf/Ud8V5SSZZiixR1ZXsICVCHsagmbnhl
 aqLg15/wU5q3+KlU/ki1sLUsvA3KgGR10hpcJNqY33qGNBa8c9kazqWRl88NodTObn+f
 mJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680200203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSA0XStYZCKEYruhJGOHIQm+eaQuxGDvTax5shqT4WU=;
 b=x6NO4t20zG6zUg0s9Xwp9/mATkpHt32ugoLvuAHIfHrK5ejRWuH0si61y0AurkImDp
 3iXrsdkq5L1ssxjh61cxa9/yXd14q/O/09aVHJ9eHSHouZgE0aEgNEmp6i/Xao4XIcmY
 7bSGKOQchmRo0b1FTie8bk2QAVe3swqwZlnqW8aslbEJuIdQ5qbhG9mJqbWXeW0NpClU
 KUI2HZPxwtz4GCON01KG4ZW25zp/JeSb0tXnWbGQuybELFctGukcXrwqjt4M+bPAL6RS
 pgc9JWITC3/fBX/vvcBlcosgUQZfLCUwmExYlBxzJ++BilzfK06YtwgOmZOd3tO7W9os
 VCHw==
X-Gm-Message-State: AAQBX9eno6G7IfoEHYirP7aOuhVchljmLWNsBsSGn3DgUU52FSorexDT
 WwnysoNXv+35A4XQHzKUXGGhydWlzAezSaKtbBKFfw==
X-Google-Smtp-Source: AKy350bgGOnTqf/dltrdgosFtHNoeqVOgneA5sGznmQmEtbiBhmqKIkhDmKCg/i0NtPIIW25xjYwOR2StUzxtMGO/1Q=
X-Received: by 2002:a1f:2bc4:0:b0:42d:7181:7c63 with SMTP id
 r187-20020a1f2bc4000000b0042d71817c63mr13288278vkr.1.1680200203140; Thu, 30
 Mar 2023 11:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 30 Mar 2023 14:16:32 -0400
Message-ID: <CADL8D3YnfUWRk+7dD5oZ6g2S2dVY46LznvhcssxZU5PquyhRYg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/bridge: tfp410: Add i2c support
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000042985e05f82218d8"
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
Cc: devicetree@vger.kernel.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000042985e05f82218d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bumping patch submission.

On Mon, Feb 20, 2023 at 5:10=E2=80=AFPM Jonathan Cormier <jcormier@critical=
link.com>
wrote:

> The TFP410 driver does not support I2C.  As such, the device remains in
> Power Down if the I2C is enabled by the bootstrap pins.
>
> Add basic support for the I2C interface, and provide support to take
> the device out of power down when enabled.  Also read the bootstrap mode
> pins via the CTL_1_MODE register when using the I2C bus.
>
> Also allow polling device to support hdmi/dvi hotplug detection.
>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
> Changes in v3:
> - Drop dt-bindings i2c example
> - Link to v2:
> https://lore.kernel.org/r/20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticall=
ink.com
>
> Changes in v2:
> - Fix dt_binding_check errors
> - Remove hdmi connector from binding example
> - Fix compile warning. Unused variable and unsigned int instead of int fo=
r
> ret
> - Fix commit titles
> - Drop of_match_ptr change
> - Link to v1:
> https://lore.kernel.org/r/20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticall=
ink.com
>
> ---
> Michael Williamson (3):
>       drm/bridge: tfp410: Support basic I2C interface
>       drm/bridge: tfp410: Fix logic to configured polled HPD
>       drm/bridge: tfp410: If connected, use I2C for polled HPD status.
>
>  drivers/gpu/drm/bridge/ti-tfp410.c | 107
> +++++++++++++++++++++++++++----------
>  1 file changed, 80 insertions(+), 27 deletions(-)
> ---
> base-commit: 93f875a8526a291005e7f38478079526c843cbec
> change-id: 20230125-tfp410_i2c-3b270b0bf3e0
>
> Best regards,
> --
> Jonathan Cormier <jcormier@criticallink.com>
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--00000000000042985e05f82218d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bumping patch submission.=C2=A0 <br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 20, 2023=
 at 5:10=E2=80=AFPM Jonathan Cormier &lt;<a href=3D"mailto:jcormier@critica=
llink.com">jcormier@criticallink.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">The TFP410 driver does not support I2C.=
=C2=A0 As such, the device remains in<br>
Power Down if the I2C is enabled by the bootstrap pins.<br>
<br>
Add basic support for the I2C interface, and provide support to take<br>
the device out of power down when enabled.=C2=A0 Also read the bootstrap mo=
de<br>
pins via the CTL_1_MODE register when using the I2C bus.<br>
<br>
Also allow polling device to support hdmi/dvi hotplug detection.<br>
<br>
Signed-off-by: Jonathan Cormier &lt;<a href=3D"mailto:jcormier@criticallink=
.com" target=3D"_blank">jcormier@criticallink.com</a>&gt;<br>
---<br>
Changes in v3:<br>
- Drop dt-bindings i2c example<br>
- Link to v2: <a href=3D"https://lore.kernel.org/r/20230125-tfp410_i2c-v2-0=
-bf22f4dcbcea@criticallink.com" rel=3D"noreferrer" target=3D"_blank">https:=
//lore.kernel.org/r/20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticallink.com<=
/a><br>
<br>
Changes in v2:<br>
- Fix dt_binding_check errors<br>
- Remove hdmi connector from binding example<br>
- Fix compile warning. Unused variable and unsigned int instead of int for =
ret<br>
- Fix commit titles<br>
- Drop of_match_ptr change<br>
- Link to v1: <a href=3D"https://lore.kernel.org/r/20230125-tfp410_i2c-v1-0=
-66a4d4e390b7@criticallink.com" rel=3D"noreferrer" target=3D"_blank">https:=
//lore.kernel.org/r/20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com<=
/a><br>
<br>
---<br>
Michael Williamson (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: tfp410: Support basic I2C interface<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: tfp410: Fix logic to configured polled HPD=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: tfp410: If connected, use I2C for polled H=
PD status.<br>
<br>
=C2=A0drivers/gpu/drm/bridge/ti-tfp410.c | 107 +++++++++++++++++++++++++++-=
---------<br>
=C2=A01 file changed, 80 insertions(+), 27 deletions(-)<br>
---<br>
base-commit: 93f875a8526a291005e7f38478079526c843cbec<br>
change-id: 20230125-tfp410_i2c-3b270b0bf3e0<br>
<br>
Best regards,<br>
-- <br>
Jonathan Cormier &lt;<a href=3D"mailto:jcormier@criticallink.com" target=3D=
"_blank">jcormier@criticallink.com</a>&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB=
6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></font></div></div></div><=
div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http://ww=
w.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://www.C=
riticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0Syrac=
use, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font color=
=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com/co=
mpany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D=
0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a hre=
f=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></font></font></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div>

--00000000000042985e05f82218d8--
