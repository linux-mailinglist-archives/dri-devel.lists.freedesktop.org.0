Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F6372CE2
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AECB6EB1B;
	Tue,  4 May 2021 15:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC66C6EB1B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 15:22:57 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e2so5128668plh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L9tNmHbAOXEJBooeZHIqWxc51uqCqnnVcNeeC6tKFnM=;
 b=CbGc4CdWR77HizI+w7x0lkyvUolIqc5rQsMTp4tYANPMVjJpAyIV0wWM99FrXy9jxI
 ZPwRi6r/XZTBFuJXE5uWeZstC5I+Mo+u2NP62LZIoQvBInQ15R3dwro7Mg4JtRuZxpfZ
 0MKIEv5gYeeSiUHopabdu98Bk2b4tFzRQdtV3tRjeMzrGiqNqXsw3FeZn/0WKiHSWBXN
 NdGdsr8evAMa9Lk78ohTir53uckpl7rZqul6XW7U4/GMqoHJVCGttzgnAd/twbwyX6du
 Aq+uCLjBXgj1ehzIFj7zP/8otNcihqeO/3B9/oC8TawuYz0onbJKhq3Fd98YlXHcKshl
 H6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L9tNmHbAOXEJBooeZHIqWxc51uqCqnnVcNeeC6tKFnM=;
 b=eghsAfRa4IoF2h4Y2pnihKWR4jrDuAhfxfrbMKR9YpACVABeGS6ePKY/xhLYuUzJ06
 bb71QzYjHn/7350nty0FlLHEdAoTuP09iCoiR9HZtItrYkLG7Rmxegq/nGFJSVkud6Wb
 lzJlEJ0Gu37woKGafzG5nJxJq1jCDROS1HJvkv8MkJ87iGJRoVrh1+RtFoASWSpyPP5l
 sjDYF8ILIrFtzQ/g2HSc3aF1ic1cVh5NaYj5XxUvLiN9JOxOt/AJDbMm1N5wwjMQFaam
 tw22sTgwQBo4zmuPeqRn1n4TFJ67dANER8hdNas7WvmM8ksAUuh4x76G+vvvU36+7q98
 srWg==
X-Gm-Message-State: AOAM531PHhkxZ3n+4htPDoALs3p7UQkEN/R3PW7SM0+DQlA1oTqgjcld
 YBSE+Lcc4LD+3OIkUITWA/XrEqk7JPnflxdazGcUEA==
X-Google-Smtp-Source: ABdhPJz68T9vjrHpNKs01C6Q49feaJNidMXjcfJP6PkcX6Kl/MJ024dkpBye516yYm5mmKy79inuK4Fax767fO0rEl8=
X-Received: by 2002:a17:903:2281:b029:ee:d13a:1f3c with SMTP id
 b1-20020a1709032281b02900eed13a1f3cmr12747303plh.69.1620141777283; Tue, 04
 May 2021 08:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210504073845.1.Ibf4194f4252846edaa0c6a6c7b86588f75ad5529@changeid>
In-Reply-To: <20210504073845.1.Ibf4194f4252846edaa0c6a6c7b86588f75ad5529@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 May 2021 17:22:46 +0200
Message-ID: <CAG3jFytvgs2DrTsgC8zosWd0t8C_mAUeJkqnpvoZweqKwpCvpg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Remove __exit from GPIO
 sub-driver remove helper
To: Douglas Anderson <dianders@chromium.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, kernel test robot <lkp@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1057725552=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1057725552==
Content-Type: multipart/alternative; boundary="0000000000001f01f605c182a7bc"

--0000000000001f01f605c182a7bc
Content-Type: text/plain; charset="UTF-8"

Hey Douglas,

On Tue, 4 May 2021 at 16:39, Douglas Anderson <dianders@chromium.org> wrote:

> The ti_sn_gpio_unregister() is not just called from the remove path
> but also from the error handling of the init path. That means it can't
> have the __exit annotation.
>
> Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP
> bridge into sub-drivers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index db027528febd..bb0a0e1c6341 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1251,7 +1251,7 @@ static int __init ti_sn_gpio_register(void)
>         return auxiliary_driver_register(&ti_sn_gpio_driver);
>  }
>
> -static void __exit ti_sn_gpio_unregister(void)
> +static void ti_sn_gpio_unregister(void)
>  {
>         auxiliary_driver_unregister(&ti_sn_gpio_driver);
>  }
> --
> 2.31.1.527.g47e6f16901-goog
>
>
Reviewed-by: Robert Foss <robert.foss@linaro.org>

--0000000000001f01f605c182a7bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Douglas,<br></div><div><br></div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 4 May 2021 at 16:3=
9, Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org">dianders@c=
hromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The ti_sn_gpio_unregister() is not just called from the remove p=
ath<br>
but also from the error handling of the init path. That means it can&#39;t<=
br>
have the __exit annotation.<br>
<br>
Fixes: bf73537f411b (&quot;drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to=
-eDP bridge into sub-drivers&quot;)<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" target=
=3D"_blank">lkp@intel.com</a>&gt;<br>
Signed-off-by: Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org=
" target=3D"_blank">dianders@chromium.org</a>&gt;<br>
---<br>
<br>
=C2=A0drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi86.c<br>
index db027528febd..bb0a0e1c6341 100644<br>
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c<br>
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c<br>
@@ -1251,7 +1251,7 @@ static int __init ti_sn_gpio_register(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return auxiliary_driver_register(&amp;ti_sn_gpi=
o_driver);<br>
=C2=A0}<br>
<br>
-static void __exit ti_sn_gpio_unregister(void)<br>
+static void ti_sn_gpio_unregister(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 auxiliary_driver_unregister(&amp;ti_sn_gpio_dri=
ver);<br>
=C2=A0}<br>
-- <br>
2.31.1.527.g47e6f16901-goog<br><br></blockquote><div><br></div><div>Reviewe=
d-by: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org">robert.foss=
@linaro.org</a>&gt; <br></div></div></div>

--0000000000001f01f605c182a7bc--

--===============1057725552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1057725552==--
