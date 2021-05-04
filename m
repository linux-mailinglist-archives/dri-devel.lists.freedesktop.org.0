Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF313372D63
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57986EB27;
	Tue,  4 May 2021 15:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8096EB27
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 15:54:27 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id p4so8053936pfo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wknFNwwRs2UYaYJO/l1k6umKHwSQsoO7wcEQUoai5lg=;
 b=eO4tuXX5qTEawX/qYiUhkldsbbg2YqmFP4J1GZBXWJe9tbj2DyHNVylGtce2hKcPLH
 us3MnSJUFrAG4FnCjTGCA80OLBQcAuKmGQQ4/LZfEEBSjFkgJKznyef9wbQzVaQU1Lz+
 q6gYHAEg4aDJ8rUWBfAfZ34KKANrTNj2FADW7wCJrj8wZfLl78Igovmvm9bSgfd8jsf0
 aSs6LsMILvllZOPPW2sZ78J8t+u/2a4QriMEVfMF+YeOYzk+K1yr3KMDCEmWDjO/pZPE
 Ik0FMZhZ+xlaaIDm2EISsk1rop+46elLYt/vAemKx0sK/HyzZlRRZUPvQqZCNx+rVml0
 Qklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wknFNwwRs2UYaYJO/l1k6umKHwSQsoO7wcEQUoai5lg=;
 b=fY2N275W0Q55soL3t8x2xFisngL9g0ZmC9jRq2bTewRour8uEJtq0mNFC4lOxSJB1k
 YH4jYYETAy3n806qJ/JYkyG5tr4uhGH1oTTSxysSH7MGrQ8W/v6hZ5IQWOGPfRDztvlT
 zGzRH5tWxB/uu9i7xE5C4nG2AnStMfLb0hcbKlYuQsDN6YpD+Yn/7eu7AygDLHwpiam5
 F9v8bLIfdnK2nIIAwZjq6Q+2WXDkMvvbjsus4TAtCAEhtsDNiEPGcgizme55kir9D4o4
 CyAKkGJ6g618iKakYGIOIqIL7qM2z48H6rRa1tQ2wyKLKFrnUvm4RVeczpiYm3JFv9pH
 7WJg==
X-Gm-Message-State: AOAM5324X16oGvBRwYr5H07nUPpn6sbOyaW6WVzvbgexefaHkoKT9uCx
 /K6NyeIrZp1nZ3gxzAUGoytavHpzwJwuX81yzJWc7g==
X-Google-Smtp-Source: ABdhPJy7OeovwUNBGz2WVjvEB6EUWpcq0E+EGVXWsYsqrdM0SuA6Td6cTg0MukO+uLJMaMZf8XoWVPkDpE/rp+Ku8VY=
X-Received: by 2002:a63:7703:: with SMTP id s3mr24180113pgc.339.1620143667015; 
 Tue, 04 May 2021 08:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210504073845.1.Ibf4194f4252846edaa0c6a6c7b86588f75ad5529@changeid>
 <CAG3jFytvgs2DrTsgC8zosWd0t8C_mAUeJkqnpvoZweqKwpCvpg@mail.gmail.com>
In-Reply-To: <CAG3jFytvgs2DrTsgC8zosWd0t8C_mAUeJkqnpvoZweqKwpCvpg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 May 2021 17:54:15 +0200
Message-ID: <CAG3jFyvAaynji9Nvb64qf-HAMHQb+-Dyq85F8aTE_E_0QsHdug@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1197647378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1197647378==
Content-Type: multipart/alternative; boundary="000000000000c2054905c1831753"

--000000000000c2054905c1831753
Content-Type: text/plain; charset="UTF-8"

Merged to drm-misc-next.

On Tue, 4 May 2021 at 17:22, Robert Foss <robert.foss@linaro.org> wrote:

> Hey Douglas,
>
> On Tue, 4 May 2021 at 16:39, Douglas Anderson <dianders@chromium.org>
> wrote:
>
>> The ti_sn_gpio_unregister() is not just called from the remove path
>> but also from the error handling of the init path. That means it can't
>> have the __exit annotation.
>>
>> Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and
>> MIPI-to-eDP bridge into sub-drivers")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index db027528febd..bb0a0e1c6341 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -1251,7 +1251,7 @@ static int __init ti_sn_gpio_register(void)
>>         return auxiliary_driver_register(&ti_sn_gpio_driver);
>>  }
>>
>> -static void __exit ti_sn_gpio_unregister(void)
>> +static void ti_sn_gpio_unregister(void)
>>  {
>>         auxiliary_driver_unregister(&ti_sn_gpio_driver);
>>  }
>> --
>> 2.31.1.527.g47e6f16901-goog
>>
>>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
>

--000000000000c2054905c1831753
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged to drm-misc-next.<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 4 May 2021 at 17:22, R=
obert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org">robert.foss@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Hey Douglas,<br></div><div><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 4 May 2021 a=
t 16:39, Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org" targ=
et=3D"_blank">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">The ti_sn_gpio_unregister() is not just =
called from the remove path<br>
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
d-by: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org" target=3D"_=
blank">robert.foss@linaro.org</a>&gt; <br></div></div></div>
</blockquote></div>

--000000000000c2054905c1831753--

--===============1197647378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1197647378==--
