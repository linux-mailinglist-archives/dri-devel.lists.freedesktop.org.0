Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B59188714
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84D56E14C;
	Tue, 17 Mar 2020 14:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EE46E430
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:14:12 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dc19so22161454edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwToYVWaEK6VL/y7v+GZ4hvZA1A5DwHh7kUhyVdEMPU=;
 b=M7c+7CHqcgg2JiKf/d4zB/cGy5yFuBbXo6AhGT84FKbF+R04FSYQMfZT4Gksg19pqc
 btl1J4JhvOrD5ebUSRTPu6v9rAOjs49a2vBdyyXfvAAz7zCKGATQMnvddg2rkMMEOjEB
 jS+bWZqPzDwu7OgzXTzxbHVEwWMkmj/HqdhMwt73PgdsSl5RqxWyfM0LIc8zIJHyM31y
 O+9xeCCY3RmC5rN5hurEIZ5V/3HQSkzmE9WWeiTcqnBdQvAkZ9w5/EocZl6GjUOkWHma
 OW/vY6CVYjeQ/7QpirppH/KsYSaQPHbYRWeTUjPG0xDU/3UGUbPEIvFOsaNS12obxm+A
 2B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwToYVWaEK6VL/y7v+GZ4hvZA1A5DwHh7kUhyVdEMPU=;
 b=EG6NPUoQZTwj11cVU4IhhXifjCZWqm2uM7PzGSitCd5VfDoeS0TM3piefR4BN8kEUz
 Yw3rg2I7Ntqqts5Z9i7JQA++sWqucGt1x/GT7MZnGuhJFPVVX/7eq9Bw0WTK6vgFo7Cx
 E5Hu8CEEDeaPIkHwtX4i8nUYsDLjYaooKazPP1ITFLsAjJ9dDHL8eIdOsLLHvHRJ2LL6
 uHK7pFLZrn9PecawiA+ygVedQWcGuOm4BHCOokxtuAsl9xLETA96nyu6P1Xm3RGNN4UA
 X/AB6BCJsJhayohKArbx7a/oXY4Bu0Y39wP6gy4l9ZlLLHaSAxDnNEgPDDSASPmBMSP4
 n84g==
X-Gm-Message-State: ANhLgQ3es2StumA89AOwiRZGDUIPWFgmizbcUWGZjt2Dwx/0Q6TbUDrO
 gomuwNL6+UUyrrS2/2+YrneXShb5bjsJ9pMKNCA=
X-Google-Smtp-Source: ADFU+vuxEhVCZ8KAiHewV6zkcegOAnJ6ALNhLqBSDxCWr2JZoxEL/0iMkVhWM2tBk59EfjWV8M2Pop+P+ba1nlykrlQ=
X-Received: by 2002:a50:e44a:: with SMTP id e10mr124658edm.210.1584368051443; 
 Mon, 16 Mar 2020 07:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-35-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-35-sam@ravnborg.org>
From: Marco Franchi <marcofrk@gmail.com>
Date: Mon, 16 Mar 2020 11:13:53 -0300
Message-ID: <CAM4PwSXXatgpV18OZRdHRyX7mrbq9_8Xdye9mJz_vvXvPByf0w@mail.gmail.com>
Subject: Re: [PATCH v1 34/36] dt-bindings: display: convert seiko,43wvf1g to
 DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: multipart/mixed; boundary="===============0026151170=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0026151170==
Content-Type: multipart/alternative; boundary="000000000000e65c5205a0f96e37"

--000000000000e65c5205a0f96e37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 15 de mar. de 2020 =C3=A0s 10:46, Sam Ravnborg <sam@ravnborg.org>
escreveu:

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Marco Franchi <marco.franchi@nxp.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>

Thanks!

Reviewed-by: Marco Franchi <marco.franchi@nxp.com>

--000000000000e65c5205a0f96e37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em dom., 15 de mar. de 2020 =C3=A0s 1=
0:46, Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.org=
</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Signed-off-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" targ=
et=3D"_blank">sam@ravnborg.org</a>&gt;<br>
Cc: Marco Franchi &lt;<a href=3D"mailto:marco.franchi@nxp.com" target=3D"_b=
lank">marco.franchi@nxp.com</a>&gt;<br>
Cc: Thierry Reding &lt;<a href=3D"mailto:thierry.reding@gmail.com" target=
=3D"_blank">thierry.reding@gmail.com</a>&gt;<br>
Cc: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" target=3D"_blank">=
sam@ravnborg.org</a>&gt;<br>
---<br></blockquote><div><br></div><div><font size=3D"2"><span style=3D"fon=
t-size:11pt">Thanks!<br>

<br>

Reviewed-by: Marco Franchi &lt;<a href=3D"mailto:marco.franchi@nxp.com">mar=
co.franchi@nxp.com</a>&gt;</span></font> <br></div></div></div>

--000000000000e65c5205a0f96e37--

--===============0026151170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0026151170==--
