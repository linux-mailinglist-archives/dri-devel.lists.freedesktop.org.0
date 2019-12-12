Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A511DF4B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE60A6E29B;
	Fri, 13 Dec 2019 08:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18076E187
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 14:29:59 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c16so1736836qko.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THXAxSu0d81RYtd09vhLHPcegAXLlh85BBvx8ltKT9I=;
 b=C8h/ehWOXYIe8I2sUVJVZ/ud8ULD2WUs/9FC8UXz8q9vYb49WA13YQHVHSMXGtCIRt
 tf74MESzjDZ+HHCFS/2E/J7OAfT3mrgslfzHKSlhMf839ZwRX0tV/3JAmJpYPFcqxR07
 lRcsTFvkU4aqp4Eb8YyrTMRMa3WaZz0fUnYeg0zqoJzFbZhhKgoqJeVBTCmU74ZoQWeZ
 U8dz/cmTUshIetP6c3VB4aYTF5evlSEPIqMc8orA6LhIQuyLB44zF1Z3qcRzumYFcORw
 hfP6KmhTYkn/5lYJ1nMsDv/nSk4s/1FQRJll8lXtx0wDMJaYO8a90RC/s2gzRmzp4+hb
 xFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THXAxSu0d81RYtd09vhLHPcegAXLlh85BBvx8ltKT9I=;
 b=TzB0dJ3iwclrdz+Z8QZw2V2nrxueRT2lyGmGE37rDwqYxNQ/iSCVLlaUxn2ZWD1w05
 suWk3UeFoSxeKrEGj7kzS+IPzt+ACmTqrckAI4tFpoGm2CrxP4toQmimU6IXlAltgfmF
 QnI465xI76EJJNUqUGus8t7VNAGfaF1vNQcTTP1z/5AlsziB87G7K3G4eGKt3gdCVuAh
 +DtnnYja/eGWae2WAhLSQANdK0BgYXt8Q4XJotwsKrvwTmAYsijyCDen8Ji0llOiCCjS
 DgmSBUOBPd1e+gF08M1iVzShLcsgu5ujlEGenGe8+gp8mmxQvNt643ICmj3q/WQDg8Ug
 NnMg==
X-Gm-Message-State: APjAAAVcMTtbGSH8Y1kihks2diSb77c70pjQa+Ge8YXtgpzgV4Uoq7Sk
 pWAYygHAOoGWe+WoIxrCJCUZ3HFc9329OeduZlM=
X-Google-Smtp-Source: APXvYqy3W3+zIE8thfMK1utuIJ7CZS9jAzENsFqQLLzSiE+9vobnQRDvQN//wq2LWZM1jUl20Ks9Xydi0EMyR6nIurA=
X-Received: by 2002:a37:851:: with SMTP id 78mr8483186qki.266.1576160999041;
 Thu, 12 Dec 2019 06:29:59 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <20191210185438.GA13884@ravnborg.org>
In-Reply-To: <20191210185438.GA13884@ravnborg.org>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Thu, 12 Dec 2019 22:29:47 +0800
Message-ID: <CAFPSGXZfvAxxm6EuLuuB9MjoZ1SJ-cKT3jBD-GXjA36ofhSBXw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] Add Unisoc's drm kms module
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: Baolin Wang <baolin.wang@linaro.org>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1767944913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1767944913==
Content-Type: multipart/alternative; boundary="00000000000074efe40599829438"

--00000000000074efe40599829438
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Sam

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E2019=E5=B9=B412=E6=9C=8811=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=882:54=E5=86=99=E9=81=93=EF=BC=9A

> Hi Kevin.
>
> Thanks for this new driver.
> A few somments triggered alone from the diffstat.
> > Kevin Tang (8):
> >   dt-bindings: display: add Unisoc's drm master bindings
> >   drm/sprd: add Unisoc's drm kms master
> >   dt-bindings: display: add Unisoc's dpu bindings
> >   drm/sprd: add Unisoc's drm display controller driver
> >   dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
> >   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
> >   dt-bindings: display: add Unisoc's generic mipi panel bindings
> >   drm/sprd: add Unisoc's drm generic mipi panel driver
> >
> >  .../devicetree/bindings/display/sprd/dphy.txt      |   49 +
> >  .../devicetree/bindings/display/sprd/dpu.txt       |   55 +
> >  .../devicetree/bindings/display/sprd/drm.txt       |   18 +
> >  .../devicetree/bindings/display/sprd/dsi.txt       |   68 +
> >  .../devicetree/bindings/display/sprd/panel.txt     |  110 ++
>
> New bindings in metaschema format (.yaml).
>
dt bindings in yaml is on going, but this need sometime, so i upload txt
format at first

> And panel bindings in display/panel/
>

> >  drivers/gpu/drm/Kconfig                            |    2 +
> >  drivers/gpu/drm/Makefile                           |    1 +
> >  drivers/gpu/drm/sprd/Kconfig                       |   14 +
> >  drivers/gpu/drm/sprd/Makefile                      |   17 +
> >  drivers/gpu/drm/sprd/disp_lib.c                    |  290 ++++
> >  drivers/gpu/drm/sprd/disp_lib.h                    |   40 +
> >  drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
> >  drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
> >  drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  640 +++++++++
> >  drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
> >  drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
> >  drivers/gpu/drm/sprd/dpu/Makefile                  |    8 +
> >  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                | 1464
> ++++++++++++++++++++
> >  drivers/gpu/drm/sprd/dsi/Makefile                  |    7 +
> >  drivers/gpu/drm/sprd/dsi/core/Makefile             |    3 +
> >  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1186
> ++++++++++++++++
> >  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417
> +++++++++++++++++++
> >  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  392 ++++++
> >  drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
> >  drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
> >  drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102
> +++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dphy.c                   |  235 ++++
> >  drivers/gpu/drm/sprd/sprd_dphy.h                   |  121 ++
> >  drivers/gpu/drm/sprd/sprd_dpu.c                    | 1152
> +++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h                    |  217 +++
> >  drivers/gpu/drm/sprd/sprd_drm.c                    |  287 ++++
> >  drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
> >  drivers/gpu/drm/sprd/sprd_dsi.c                    |  722 ++++++++++
> >  drivers/gpu/drm/sprd/sprd_dsi.h                    |  210 +++
> >  drivers/gpu/drm/sprd/sprd_gem.c                    |  178 +++
> >  drivers/gpu/drm/sprd/sprd_gem.h                    |   30 +
>
> >  drivers/gpu/drm/sprd/sprd_panel.c                  |  778 +++++++++++
> >  drivers/gpu/drm/sprd/sprd_panel.h                  |  114 ++
> Please move panels to drivers/gpu/drm/panel/ and make sure to utilize
> the drm_panel infrastructure.
>
Our drm panel driver is a generic mipi panel driver, not for a specific
panel.
All common properties related to LCD will be placed in the LCD node, eg:
"/lcds/lcd_mipi_dsi.dtsi"
So if our customers need to adapt the new panel, just config LCD node, no
need to rewrite drivers for new panels

>
>         Sam
>

--00000000000074efe40599829438
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Sam<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Sam Ravnborg &lt;<a href=3D"mailto:sam@ravn=
borg.org">sam@ravnborg.org</a>&gt; =E4=BA=8E2019=E5=B9=B412=E6=9C=8811=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=882:54=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Kevin.<br>
<br>
Thanks for this new driver.<br>
A few somments triggered alone from the diffstat.<br>
&gt; Kevin Tang (8):<br>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s drm master bindings=
<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm kms master<br>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s dpu bindings<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm display controller driver<b=
r>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s mipi dsi&amp;dphy b=
indings<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm mipi dsi&amp;dphy driver<br=
>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s generic mipi panel =
bindings<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm generic mipi panel driver<b=
r>
&gt; <br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dphy.txt=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A049 +<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dpu.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A055 +<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/drm.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A018 +<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dsi.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A068 +<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/panel.txt=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 110 ++<br>
<br>
New bindings in metaschema format (.yaml).<br></blockquote><div>dt bindings=
 in yaml is on going, but this need sometime, so i upload txt format at fir=
st <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
And panel bindings in display/panel/<br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +=
<br>
&gt;=C2=A0 drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1=
 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/disp_lib.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 290 ++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/disp_lib.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A040 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dphy/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dphy/pll/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c=C2=A0 |=C2=A0 =
640 +++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 254 ++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 329 +++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1464 ++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/core/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c=C2=A0 =C2=A0 =C2=
=A0 | 1186 ++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h=C2=A0 =C2=A0 =C2=
=A0 | 1417 +++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c=C2=A0 |=C2=A0 =
392 ++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 544 ++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A028 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1102 +++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dphy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 235 ++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dphy.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 121 ++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1152 +++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 287 ++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A019 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 722 ++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dsi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 210 +++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 178 +++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_gem.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A030 +<br>
<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_panel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 778 +++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_panel.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 114 ++<br>
Please move panels to drivers/gpu/drm/panel/ and make sure to utilize<br>
the drm_panel infrastructure.<br></blockquote><div>Our drm panel driver is =
a generic mipi panel driver, <span class=3D"gmail-tlid-translation gmail-tr=
anslation" lang=3D"en"><span title=3D"" class=3D"gmail-">not for a specific=
 panel.</span></span></div><div><span class=3D"gmail-tlid-translation gmail=
-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"=
gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" clas=
s=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=
=3D"en"><span title=3D"" class=3D"gmail-">All common properties related to =
LCD will be placed in the LCD node,</span></span> eg: &quot;/lcds/lcd_mipi_=
dsi.dtsi&quot;<br></span></span></span></span></div><div><span class=3D"gma=
il-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=
=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=
=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-transla=
tion gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">So if=
 our customers need to adapt the new panel, just config LCD node, <span cla=
ss=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"=
" class=3D"gmail-">no need to rewrite drivers for new panels</span></span><=
/span></span></span></span></span></span> </div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
</blockquote></div></div>

--00000000000074efe40599829438--

--===============1767944913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1767944913==--
