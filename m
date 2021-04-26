Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30F36AE06
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82D96E16D;
	Mon, 26 Apr 2021 07:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72AE6E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:42:37 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id q10so39505830pgj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+b4pKpndDlcj08YUiVSBY817s4wlekLWlsTVk0g6EU=;
 b=lUK/M9SqhxbCgHIORv3I+iUo86GjFpJYfBlPrxAcrP7YfPIOkf/WF4rzJN+SMBVJZ0
 s260soqgttbuepcQEws4HEAIPLrK+8JaO2S/PPwaTZFBPZPA1IWs+9wyv7OfW9Dk0W3m
 1Q+n6S2VCvK2ZrAF3vH5rY5U8OikXTvTbWxWsf+EKO2sv+uLi1xkAhO+FYR3657TIrqi
 xwsC4zE6ONm48NoRT+0f8Avq2qsSyyb4JlesejK5HK5unXcFYfgOiR/U3X240G0U3E9M
 03X7FgrZgp/EpI8P3f6TYvowgGcH9HAndm7Lv3TLj/s8P7MRPibO+hhQyEDyBE8NaWoS
 cygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+b4pKpndDlcj08YUiVSBY817s4wlekLWlsTVk0g6EU=;
 b=m2YId6x+lahpUmDMWHtDCk8XVD/OLTGvS7MAdnGzWaXJJEQd/8Zs6vXr5ZfGQ5F7Ku
 79yXqj6JgYgspPyZ1tEuDcfQafBfhPw26DoFXlCXU3kLuxFSv9SwgSiEE5mJrv0YiAU6
 YBdLa5G9FKIA78VYmNpnRPjNIIqdnabdKSACwhrJE0ZUgyZ72wdcxy0vUlGskbfkMe4+
 uyGfi1xG+DpBnYAmcdif7cl0nTu5T/bvxY7/tznfr8YgdEKcWU1lWdS98ZT2v+Hz/6Hj
 qOHmbKO5fcyf59tk6ZKFxb5ixIb7kTLkTiW9h8EdEGZ96fobBZrJPRwTQufjMnyAQpBP
 7qpA==
X-Gm-Message-State: AOAM531EvY1/I57jLk5brj/DTHOhv4wa1js/v7BUNEoZWEwRypldTxe0
 KFutLx+3OSj20l32c/OV7n6yK/KuH8QZggzQP16R3w==
X-Google-Smtp-Source: ABdhPJwm03gb1ADF12Vm13FdZoOskiD3kKLb5q8urWkUENw6vUNfn0LPTa4pP+WvzxsTDgD8TB1iN6MwltnHYsM6Y50=
X-Received: by 2002:a05:6a00:88a:b029:261:6d37:dac6 with SMTP id
 q10-20020a056a00088ab02902616d37dac6mr16426252pfj.18.1619422957429; Mon, 26
 Apr 2021 00:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210424061817.7339-1-rdunlap@infradead.org>
 <ecbe576f-1a96-a873-3716-6fa478a8269e@baylibre.com>
In-Reply-To: <ecbe576f-1a96-a873-3716-6fa478a8269e@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 26 Apr 2021 09:42:26 +0200
Message-ID: <CAG3jFyv1kc3+B6SkVwdV7gNV+HUEWMAjmH8GSXaw8rDcHLadeQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: add missing word in Analogix help text
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: David Airlie <airlied@linux.ie>, Torsten Duwe <duwe@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1800937290=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1800937290==
Content-Type: multipart/alternative; boundary="0000000000001e798805c0db4a21"

--0000000000001e798805c0db4a21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021, 09:15 Neil Armstrong <narmstrong@baylibre.com> wrote:

>
>
> Le 24/04/2021 =C3=A0 08:18, Randy Dunlap a =C3=A9crit :
> > Insert a missing word "power" in Kconfig help text.
> >
> > Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Icenowy Zheng <icenowy@aosc.io>
> > Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> > Cc: Torsten Duwe <duwe@suse.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/bridge/analogix/Kconfig |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > --- linux-next-20210423.orig/drivers/gpu/drm/bridge/analogix/Kconfig
> > +++ linux-next-20210423/drivers/gpu/drm/bridge/analogix/Kconfig
> > @@ -6,7 +6,7 @@ config DRM_ANALOGIX_ANX6345
> >       select DRM_KMS_HELPER
> >       select REGMAP_I2C
> >       help
> > -       ANX6345 is an ultra-low Full-HD DisplayPort/eDP
> > +       ANX6345 is an ultra-low power Full-HD DisplayPort/eDP
> >         transmitter designed for portable devices. The
> >         ANX6345 transforms the LVTTL RGB output of an
> >         application processor to eDP or DisplayPort.
> >
>
> Reviewed-by: Neil Armstrong <narmstrongt@baylibre.com>
>

I think a typo in the email snuck in ;)

>

--0000000000001e798805c0db4a21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 26, 2021, 09:15 Neil Armstrong &lt;<a href=
=3D"mailto:narmstrong@baylibre.com" target=3D"_blank" rel=3D"noreferrer">na=
rmstrong@baylibre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
<br>
Le 24/04/2021 =C3=A0 08:18, Randy Dunlap a =C3=A9crit=C2=A0:<br>
&gt; Insert a missing word &quot;power&quot; in Kconfig help text.<br>
&gt; <br>
&gt; Fixes: 6aa192698089 (&quot;drm/bridge: Add Analogix anx6345 support&qu=
ot;)<br>
&gt; Signed-off-by: Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.or=
g" rel=3D"noreferrer noreferrer" target=3D"_blank">rdunlap@infradead.org</a=
>&gt;<br>
&gt; Cc: Andrzej Hajda &lt;<a href=3D"mailto:a.hajda@samsung.com" rel=3D"no=
referrer noreferrer" target=3D"_blank">a.hajda@samsung.com</a>&gt;<br>
&gt; Cc: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">narmstrong@baylibre.com</a>&gt=
;<br>
&gt; Cc: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">robert.foss@linaro.org</a>&gt;<br>
&gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">airlied@linux.ie</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">daniel@ffwll.ch</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" rel=3D"noreferr=
er noreferrer" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt; Cc: Icenowy Zheng &lt;<a href=3D"mailto:icenowy@aosc.io" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">icenowy@aosc.io</a>&gt;<br>
&gt; Cc: Vasily Khoruzhick &lt;<a href=3D"mailto:anarsoul@gmail.com" rel=3D=
"noreferrer noreferrer" target=3D"_blank">anarsoul@gmail.com</a>&gt;<br>
&gt; Cc: Torsten Duwe &lt;<a href=3D"mailto:duwe@suse.de" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">duwe@suse.de</a>&gt;<br>
&gt; Cc: Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/analogix/Kconfig |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; --- linux-next-20210423.orig/drivers/gpu/drm/bridge/analogix/Kconfig<b=
r>
&gt; +++ linux-next-20210423/drivers/gpu/drm/bridge/analogix/Kconfig<br>
&gt; @@ -6,7 +6,7 @@ config DRM_ANALOGIX_ANX6345<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGMAP_I2C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ANX6345 is an ultra-low Full-HD DisplayPor=
t/eDP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ANX6345 is an ultra-low power Full-HD Disp=
layPort/eDP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0transmitter designed for portable dev=
ices. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ANX6345 transforms the LVTTL RGB outp=
ut of an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0application processor to eDP or Displ=
ayPort.<br>
&gt; <br>
<br>
Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:narmstrongt@baylibre.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">narmstrongt@baylibre.com</=
a>&gt;<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I think a typo in the email snuck in ;)</div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000001e798805c0db4a21--

--===============1800937290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1800937290==--
