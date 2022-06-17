Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6AD54F19A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45B811A958;
	Fri, 17 Jun 2022 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BF511ACF7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:33:53 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id k2so5458185ybj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/edqkb4xBPzCpc0T2TUWNAfyaG4G5PuJqbK/9LhoRro=;
 b=arkJSNWz21WB2Qmaf9KHwEFksGAL6iX6LJY45znZQfda2mL3jzjpK/vYvzag/JTnVH
 8yghXPAqOPBkx+5ii2VHiFjwchGnl67dGDXCQywso8mAYdpTmu+w1OIg6XHqfOz8Edew
 +VBRdZc1VRyz+AeDONPxr4tUCfV/c0fOUHoBEJFThLPqJHrMsoL9xRr/LjCJrC67p+ss
 kJmmWW5v8NBGt4EOuebs74WUm6K3C0OcoRs3bSvMOM52LMG9ICbwLeDB+NAj2VMQuZKd
 BTAlXsJXgG9ZdHI5z0vBfESJvPOYChIyoSDHvSBt3ZJzzcf/HBJlAzuP5IwkbpOl/hOU
 5FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/edqkb4xBPzCpc0T2TUWNAfyaG4G5PuJqbK/9LhoRro=;
 b=eJHZR24+hCNxm4e+/zLfshV2Iab711Phg8c+Mxtsc8USSDoP2aEOUiJ/ZN9jqeWy1o
 uAEkvrBQf7Conhzsvs8utx/6KNODkKGIt21U7dXxwbEwpQq7NHWM3Qp00mreY9L3ypH2
 FViHgnoHacVo17GZVs24SNIBTwC0JTuFuLKEGz2vlzztGWpxegUAegPY61+c0HMbAVcH
 /l6gJJZTbNZe4/o34HsPDq/SGlbrHw1XmWFd+QTOYN3Z71E2je6zjDWOG8vVTiqIypv8
 i43gOzOCKipzdIhjakZApMvZbOlG9AyHtNDiy7xTJ0ySohMtaPpGwl/iRJSNGGg4uivD
 915A==
X-Gm-Message-State: AJIora/KCCYuN6z/LkxmtJI9OeF3BzhJHpYpSCFrxT4FzhHuNfZT9ChI
 B8tX8GzawdhEVVvmRCqW8j1yfXudoGZNVShmypI=
X-Google-Smtp-Source: AGRyM1uZJy/MqCyIdMyqxZhbYnMfyJU1Bjt2qzm2NNWWo1685tVtIMewkq8VAhSsToK0wrF2MNbijcKCACjOi456d3A=
X-Received: by 2002:a5b:149:0:b0:668:3bd8:bf64 with SMTP id
 c9-20020a5b0149000000b006683bd8bf64mr8042646ybp.61.1655440431437; Thu, 16 Jun
 2022 21:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220615222221.1501-1-jirivanek1@gmail.com>
 <20220615222221.1501-3-jirivanek1@gmail.com>
In-Reply-To: <20220615222221.1501-3-jirivanek1@gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Fri, 17 Jun 2022 10:03:40 +0530
Message-ID: <CAGWqDJ6Boq5x4DofKx=US_Yx6_46JGTHuaLbEKq-uXRAz-35AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge/tc358775: Fix DSI clock division for vsync
 delay calculation
To: Jiri Vanek <jirivanek1@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dcddec05e19d42a6"
X-Mailman-Approved-At: Fri, 17 Jun 2022 07:12:24 +0000
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dcddec05e19d42a6
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>

On Thu, Jun 16, 2022 at 3:55 AM Jiri Vanek <jirivanek1@gmail.com> wrote:

> Use the same PCLK divide option (divide DSI clock to generate pixel clock)
> which is set to LVDS Configuration Register (LVCFG) also for a VSync delay
> calculation. Without this change an auxiliary variable could underflow
> during the calculation for some dual-link LVDS panels and then calculated
> VSync delay is wrong. This leads to a shifted picture on a panel.
>
> Tested-by: Jiri Vanek <jirivanek1@gmail.com>
> Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> index cd2721ab02a9..fecb8558b49a 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -430,7 +430,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>                 val = TC358775_VPCTRL_MSF(1);
>
>         dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
> -       clkdiv = dsiclk / DIVIDE_BY_3 * tc->lvds_link;
> +       clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 :
> DIVIDE_BY_3);
>         byteclk = dsiclk / 4;
>         t1 = hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
>         t2 = ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len +
> hfront_porch) / 1000;
> --
> 2.30.2
>
>

-- 
regards,
vinaysimha

--000000000000dcddec05e19d42a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs=
@gmail.com">simhavcs@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 16, 2022 at 3:55 AM Jiri =
Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com">jirivanek1@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Use t=
he same PCLK divide option (divide DSI clock to generate pixel clock)<br>
which is set to LVDS Configuration Register (LVCFG) also for a VSync delay<=
br>
calculation. Without this change an auxiliary variable could underflow<br>
during the calculation for some dual-link LVDS panels and then calculated<b=
r>
VSync delay is wrong. This leads to a shifted picture on a panel.<br>
<br>
Tested-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" target=3D=
"_blank">jirivanek1@gmail.com</a>&gt;<br>
Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" targe=
t=3D"_blank">jirivanek1@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/tc358775.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc3=
58775.c<br>
index cd2721ab02a9..fecb8558b49a 100644<br>
--- a/drivers/gpu/drm/bridge/tc358775.c<br>
+++ b/drivers/gpu/drm/bridge/tc358775.c<br>
@@ -430,7 +430,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D TC358775_VP=
CTRL_MSF(1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsiclk =3D mode-&gt;crtc_clock * 3 * tc-&gt;bpc=
 / tc-&gt;num_dsi_lanes / 1000;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clkdiv =3D dsiclk / DIVIDE_BY_3 * tc-&gt;lvds_l=
ink;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clkdiv =3D dsiclk / (tc-&gt;lvds_link =3D=3D DU=
AL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 byteclk =3D dsiclk / 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1 =3D hactive * (tc-&gt;bpc * 3 / 8) / tc-&gt;=
num_dsi_lanes;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2 =3D ((100000 / clkdiv)) * (hactive + hback_p=
orch + hsync_len + hfront_porch) / 1000;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--000000000000dcddec05e19d42a6--
