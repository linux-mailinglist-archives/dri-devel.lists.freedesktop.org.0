Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A7F92C546
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 23:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8517410E669;
	Tue,  9 Jul 2024 21:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fki7TXn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EFC10E027
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 21:23:48 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e02c4983bfaso5876831276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720560227; x=1721165027; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WmfdnyKEA3o5jGPK2SDIy8v7JkJ7vv3CMoQcD/uKGOk=;
 b=Fki7TXn7pvwz7my5Y3m0E+/Q6s65vMBsEvsXsQpu91nhM6zPieZuslN/TeOST0BeIx
 4xppAybokha9HuBtT2vPG0tTRLPWiZaACLBadwahFQjuBH7bcUyYHsQ3skhPD79gHwmP
 wFA3Ajigz6DRC9QPlccn0jGaOchGNItdLSlH+uvqu8OpLhfmPurdlCjFrTOYzef6eJiy
 p+gL8kK/mBrGf83mGXAxYlBTECzx/f7H1Z4I8TZDdqrNn32sX3skOHXyFsNoOAPDlFhY
 CReudyODEbNFOzfQyW2VVX0+zGtQHT/VCaK/owiDcEwU7t9TOFniExL/Ho+6yMWkvJyD
 uyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720560227; x=1721165027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmfdnyKEA3o5jGPK2SDIy8v7JkJ7vv3CMoQcD/uKGOk=;
 b=YPFENv1uXLxY5pf44Jn6j9kSGF1WmWfPafU1JY845d2hnra1VkDYviey+kTlx4p6ms
 waDsF6k9gM413/UCfQHpt0jZ2byscmqqicNtq3w6tFDuf/ivin6wGNe/PrhvihRjVCc/
 zTGU75Xmwph10gSVnqtACcq/uuknl+mt3kjgkf07DDwBkVFYckSoxl7/5w04/d/Ib7G1
 hBWpHj114kY089CDvjbS26Pvln3qVj40azVU/xgHPcsNWzzAA+pmcNG0xguiZ/xNlUzC
 KybYOU7FtXU+6TnshN1HuRypr0cObnROGG8vMozyn75WaJTsJ0z1MLVjUmWzAgPAVch3
 ENnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgL0mJE9ujFC5xe15KG/og4DmNb0f0SuJuiR3IZdrYEh+ySAlwY6JjJSFNXXPgpQjrKbQRvQQ/ean+kl+9KG00+aA6F2UJ/akYA7hK2FZu
X-Gm-Message-State: AOJu0YxbE6Q+PPxNUU392O7yOfUitK6a1mBTAYnxTbEj7geEo7coLwM3
 Zy4G8xz+WxjgUP+337/5FF5C59FvRs6zKXnaJG4P0E3oF+ATS86YUezL/esyJpMpGMawGnhliWa
 J/nbHLaOX0Ajy1OJV9vGBj14jm3A=
X-Google-Smtp-Source: AGHT+IGqLBKbHM6hlsG0wHM9ou2lXYWje2G/b89S5krrTbK++SlEeR3dIZKk1TXGNjaFP5nCyTc2Qrm/usAt1crjW9s=
X-Received: by 2002:a25:a2c4:0:b0:e03:6211:15be with SMTP id
 3f1490d57ef6-e041b0f5b5bmr4295856276.29.1720560227203; Tue, 09 Jul 2024
 14:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
 <172045725750.3389992.15451403448241421795.robh@kernel.org>
 <CAK+owohBrewYFpDKjsE5iWC5OQ3p6S_9fwj7DWa1Ux2h8CXcAw@mail.gmail.com>
 <944ecc41-9ef7-4d9e-9d96-3c5c0cdb71b5@denx.de>
 <CAK+owoiQY8OYiZofyq4jj2S3Mg6ub88DF5V52JcppxhWbUsWgg@mail.gmail.com>
 <223b287f-4da6-4ec1-be7c-6135215c5551@denx.de>
 <CAK+owogLctqu17cFEQH+258wrpfMJ4iE6iJABRu5dwxDtR21EA@mail.gmail.com>
 <8ae33208-3273-4bca-8371-6fc1ef50061f@denx.de>
In-Reply-To: <8ae33208-3273-4bca-8371-6fc1ef50061f@denx.de>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Tue, 9 Jul 2024 23:23:36 +0200
Message-ID: <CAK+owoiG7k-zfApd_mase3Z_H9K2ue6FjSt42jQtu+-i28hG5Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,
 sn65dsi83: add burst-mode-disabled
To: Marek Vasut <marex@denx.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 "Noah J . Rosa" <noahj.rosa@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000028414e061cd72561"
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

--00000000000028414e061cd72561
Content-Type: text/plain; charset="UTF-8"

Yes this is not the mainline driver but it is the one from which the
mainline driver is taken.

Yes this problem occurs with this mainline driver.

Stefano

Il Mar 9 Lug 2024, 23:12 Marek Vasut <marex@denx.de> ha scritto:

> On 7/9/24 7:30 PM, Stefano Radaelli wrote:
> > Okay, I get it.
> >
> > So if you think this mode shouldn't be implemented within this driver, we
> > can close the thread.
> > Just for information, this driver has been implemented from the work done
> > by Compulab (as it says in the driver's initial comments), and they do
> not
> > put the burst mode by default, not even giving the possibility to
> activate
> > it by dts:
> >
> https://github.com/compulab-yokneam/imx8-android/blob/master/o8/vendor/nxp-opensource/kernel_imx/0055-sn65dsi83-Add-ti-sn65dsi83-dsi-to-lvds-bridge-driver.patch
>
> This is not the mainline Linux driver.
>
> > The panels that I've had these problems with are some of JuTouch's
> > 1920x1200, for example JT101TM015 , and I solved it by giving the option
> to
> > remove this mode.
> > I have also heard from other colleagues who have had the same problem on
> > some dual-channel displays.
>
> Does that problem happen with the aforementioned driver or the mainline
> Linux driver ?
>

--00000000000028414e061cd72561
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes this is not the mainline driver but it is the one fro=
m which the mainline driver is taken.<div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes this problem occurs with this mainline driver.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Stefano=C2=A0</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il Mar 9 Lug 2024,=
 23:12 Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 7/9/24 7:30 PM, S=
tefano Radaelli wrote:<br>
&gt; Okay, I get it.<br>
&gt; <br>
&gt; So if you think this mode shouldn&#39;t be implemented within this dri=
ver, we<br>
&gt; can close the thread.<br>
&gt; Just for information, this driver has been implemented from the work d=
one<br>
&gt; by Compulab (as it says in the driver&#39;s initial comments), and the=
y do not<br>
&gt; put the burst mode by default, not even giving the possibility to acti=
vate<br>
&gt; it by dts:<br>
&gt; <a href=3D"https://github.com/compulab-yokneam/imx8-android/blob/maste=
r/o8/vendor/nxp-opensource/kernel_imx/0055-sn65dsi83-Add-ti-sn65dsi83-dsi-t=
o-lvds-bridge-driver.patch" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/compulab-yokneam/imx8-android/blob/master/o8/vendor/nxp=
-opensource/kernel_imx/0055-sn65dsi83-Add-ti-sn65dsi83-dsi-to-lvds-bridge-d=
river.patch</a><br>
<br>
This is not the mainline Linux driver.<br>
<br>
&gt; The panels that I&#39;ve had these problems with are some of JuTouch&#=
39;s<br>
&gt; 1920x1200, for example JT101TM015 , and I solved it by giving the opti=
on to<br>
&gt; remove this mode.<br>
&gt; I have also heard from other colleagues who have had the same problem =
on<br>
&gt; some dual-channel displays.<br>
<br>
Does that problem happen with the aforementioned driver or the mainline <br=
>
Linux driver ?<br>
</blockquote></div>

--00000000000028414e061cd72561--
