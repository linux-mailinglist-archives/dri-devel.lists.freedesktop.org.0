Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3B36DBB4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567966E10A;
	Wed, 28 Apr 2021 15:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FBF6E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 15:32:59 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id m11so811146pfc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTChZMyXiN1tWU3tHzvuHp6qBuqoZWruvAziIVMg4y8=;
 b=ENTVZXAU5CDcofZUn/DVrLVgaqYJz8pP4DCbNrxlg4f0OwS5GaQX1rRngleQP2GB//
 bysfs5BxArxLaMW9wiJC3XeDrxPa8cDchcJCopYyJVi5GEjBpVJWGbALna575mC8sSXc
 ckypRX4QRVbJF0KboNnTCZUHv/PGhxNgI4HaWsvozPzVugAiWbt2sCgoxX5+CSZLvg9r
 CxyG6SlmHLOxbhXW6t4CrFMAEAyXhGf9ToEC8Szr6IG/16CFimhDNgLi9og6bYlezuaJ
 g5KgedBgWst8bmdbS55P8uZV27b9X6Oo+0oPpzNFIcV7YD9Mbkp3z866Gpz6BdsWqMZ6
 bchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTChZMyXiN1tWU3tHzvuHp6qBuqoZWruvAziIVMg4y8=;
 b=txHHUWnbeGtc/nU9gcr/vIQphyqkSykK+xhtNpCIh7zus05M3JtlchxTYOSJwcgS0B
 rMJHW3ESZYkvF+tDNsPb8PxJMJ0poPMAyn5rzUd3mV+HQC8Xp6fbAQRtstZz+ObHLoF4
 tOLlnbuy/RIuAgnbBQxUO62Xkc2iRyCRO8KyUQcnHvqQYgl7BMjud8PvESct2ToBNYjs
 OTYOVUP1aCOl9hljSCPK3y6GCvHWLQl+wy93ucW93aSawTi47pG59gzrFwNfrV5IjuO9
 xiCexqwyY0FkxZ8ckT0E2rNexhdVVaJjWo3MgzlIMhGGhq3MBzZrXYBVrJpLHJxTlNHY
 F6rQ==
X-Gm-Message-State: AOAM5338XZdJNOz1e8fSZexDASgiVqx038EMwc+X5GulExjwhSEB9YA/
 wqSn/H5z9XuJvBxucZg8RZlUGu85j1jYCct/XkUByA==
X-Google-Smtp-Source: ABdhPJwEm8mHtqFDFeIQAg6InIMmbQB9X1UPQC6u6Z6iGno82QodKyhp6fW/+/woElEfjglFhRgQ0siUX3fZFRgj+sE=
X-Received: by 2002:a63:7703:: with SMTP id s3mr8472647pgc.339.1619623978896; 
 Wed, 28 Apr 2021 08:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210424061817.7339-1-rdunlap@infradead.org>
 <ecbe576f-1a96-a873-3716-6fa478a8269e@baylibre.com>
 <CAG3jFyv1kc3+B6SkVwdV7gNV+HUEWMAjmH8GSXaw8rDcHLadeQ@mail.gmail.com>
 <481c3f44-1686-2c58-29fa-c71fec520ba7@baylibre.com>
 <ee194435-3e17-f5c4-d300-a74cc0f8988c@baylibre.com>
In-Reply-To: <ee194435-3e17-f5c4-d300-a74cc0f8988c@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 28 Apr 2021 17:32:47 +0200
Message-ID: <CAG3jFysLpG8Mp59A-OwgryzqCdk6YDreORtkKOZ0qBEPpufjrg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1466805056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1466805056==
Content-Type: multipart/alternative; boundary="000000000000eea54605c10a17cf"

--000000000000eea54605c10a17cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hah, this is a very relatable error for me.

Pushed to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dcacb5dc1d3efa6a9c768=
e3f447c78ac28af5c602

On Tue, 27 Apr 2021 at 16:18, Neil Armstrong <narmstrong@baylibre.com>
wrote:

> On 26/04/2021 10:59, Neil Armstrong wrote:
> > On 26/04/2021 09:42, Robert Foss wrote:
> >>
> >>
> >> On Mon, Apr 26, 2021, 09:15 Neil Armstrong <narmstrong@baylibre.com
> <mailto:narmstrong@baylibre.com>> wrote:
> >>
> >>
> >>
> >>     Le 24/04/2021 =C3=A0 08:18, Randy Dunlap a =C3=A9crit :
> >>     > Insert a missing word "power" in Kconfig help text.
> >>     >
> >>     > Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> >>     > Signed-off-by: Randy Dunlap <rdunlap@infradead.org <mailto:
> rdunlap@infradead.org>>
> >>     > Cc: Andrzej Hajda <a.hajda@samsung.com <mailto:
> a.hajda@samsung.com>>
> >>     > Cc: Neil Armstrong <narmstrong@baylibre.com <mailto:
> narmstrong@baylibre.com>>
> >>     > Cc: Robert Foss <robert.foss@linaro.org <mailto:
> robert.foss@linaro.org>>
> >>     > Cc: David Airlie <airlied@linux.ie <mailto:airlied@linux.ie>>
> >>     > Cc: Daniel Vetter <daniel@ffwll.ch <mailto:daniel@ffwll.ch>>
> >>     > Cc: dri-devel@lists.freedesktop.org <mailto:
> dri-devel@lists.freedesktop.org>
> >>     > Cc: Icenowy Zheng <icenowy@aosc.io <mailto:icenowy@aosc.io>>
> >>     > Cc: Vasily Khoruzhick <anarsoul@gmail.com <mailto:
> anarsoul@gmail.com>>
> >>     > Cc: Torsten Duwe <duwe@suse.de <mailto:duwe@suse.de>>
> >>     > Cc: Maxime Ripard <maxime@cerno.tech>
> >>     > ---
> >>     >  drivers/gpu/drm/bridge/analogix/Kconfig |    2 +-
> >>     >  1 file changed, 1 insertion(+), 1 deletion(-)
> >>     >
> >>     > ---
> linux-next-20210423.orig/drivers/gpu/drm/bridge/analogix/Kconfig
> >>     > +++ linux-next-20210423/drivers/gpu/drm/bridge/analogix/Kconfig
> >>     > @@ -6,7 +6,7 @@ config DRM_ANALOGIX_ANX6345
> >>     >       select DRM_KMS_HELPER
> >>     >       select REGMAP_I2C
> >>     >       help
> >>     > -       ANX6345 is an ultra-low Full-HD DisplayPort/eDP
> >>     > +       ANX6345 is an ultra-low power Full-HD DisplayPort/eDP
> >>     >         transmitter designed for portable devices. The
> >>     >         ANX6345 transforms the LVTTL RGB output of an
> >>     >         application processor to eDP or DisplayPort.
> >>     >
> >>
> >>     Reviewed-by: Neil Armstrong <narmstrongt@baylibre.com <mailto:
> narmstrongt@baylibre.com>>
> >>
> >>
> >> I think a typo in the email snuck in ;)
> >>
> >
> > Ah ah indeed !
> >
> > Reviewed-by: Neil Armstrong <narmstrongt@baylibre.com>
> >
> Wow, twice the same error... Monday was a bead day for me
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>

--000000000000eea54605c10a17cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hah, this is a very relatable error for me.<br><br></=
div>Pushed to drm-misc-next.<br><br><a href=3D"https://cgit.freedesktop.org=
/drm/drm-misc/commit/?id=3Dcacb5dc1d3efa6a9c768e3f447c78ac28af5c602">https:=
//cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dcacb5dc1d3efa6a9c768e3f447=
c78ac28af5c602</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, 27 Apr 2021 at 16:18, Neil Armstrong &lt;<a href=
=3D"mailto:narmstrong@baylibre.com">narmstrong@baylibre.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 26/04/2021 10=
:59, Neil Armstrong wrote:<br>
&gt; On 26/04/2021 09:42, Robert Foss wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Apr 26, 2021, 09:15 Neil Armstrong &lt;<a href=3D"mailto:n=
armstrong@baylibre.com" target=3D"_blank">narmstrong@baylibre.com</a> &lt;m=
ailto:<a href=3D"mailto:narmstrong@baylibre.com" target=3D"_blank">narmstro=
ng@baylibre.com</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Le 24/04/2021 =C3=A0 08:18, Randy Dunlap a =C3=
=A9crit=C2=A0:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Insert a missing word &quot;power&quot; in=
 Kconfig help text.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Fixes: 6aa192698089 (&quot;drm/bridge: Add=
 Analogix anx6345 support&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Randy Dunlap &lt;<a href=3D=
"mailto:rdunlap@infradead.org" target=3D"_blank">rdunlap@infradead.org</a> =
&lt;mailto:<a href=3D"mailto:rdunlap@infradead.org" target=3D"_blank">rdunl=
ap@infradead.org</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Andrzej Hajda &lt;<a href=3D"mailto:a.=
hajda@samsung.com" target=3D"_blank">a.hajda@samsung.com</a> &lt;mailto:<a =
href=3D"mailto:a.hajda@samsung.com" target=3D"_blank">a.hajda@samsung.com</=
a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Neil Armstrong &lt;<a href=3D"mailto:n=
armstrong@baylibre.com" target=3D"_blank">narmstrong@baylibre.com</a> &lt;m=
ailto:<a href=3D"mailto:narmstrong@baylibre.com" target=3D"_blank">narmstro=
ng@baylibre.com</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Robert Foss &lt;<a href=3D"mailto:robe=
rt.foss@linaro.org" target=3D"_blank">robert.foss@linaro.org</a> &lt;mailto=
:<a href=3D"mailto:robert.foss@linaro.org" target=3D"_blank">robert.foss@li=
naro.org</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: David Airlie &lt;<a href=3D"mailto:air=
lied@linux.ie" target=3D"_blank">airlied@linux.ie</a> &lt;mailto:<a href=3D=
"mailto:airlied@linux.ie" target=3D"_blank">airlied@linux.ie</a>&gt;&gt;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:da=
niel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a> &lt;mailto:<a href=3D"=
mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: <a href=3D"mailto:dri-devel@lists.free=
desktop.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a> &lt;mail=
to:<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri=
-devel@lists.freedesktop.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Icenowy Zheng &lt;<a href=3D"mailto:ic=
enowy@aosc.io" target=3D"_blank">icenowy@aosc.io</a> &lt;mailto:<a href=3D"=
mailto:icenowy@aosc.io" target=3D"_blank">icenowy@aosc.io</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Vasily Khoruzhick &lt;<a href=3D"mailt=
o:anarsoul@gmail.com" target=3D"_blank">anarsoul@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:anarsoul@gmail.com" target=3D"_blank">anarsoul@gmail.com</=
a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Torsten Duwe &lt;<a href=3D"mailto:duw=
e@suse.de" target=3D"_blank">duwe@suse.de</a> &lt;mailto:<a href=3D"mailto:=
duwe@suse.de" target=3D"_blank">duwe@suse.de</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Maxime Ripard &lt;maxime@cerno.tech&gt=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 drivers/gpu/drm/bridge/analogix/Kcon=
fig |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 1 insertion(+), 1 de=
letion(-)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- linux-next-20210423.orig/drivers/gpu/d=
rm/bridge/analogix/Kconfig<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ linux-next-20210423/drivers/gpu/drm/br=
idge/analogix/Kconfig<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -6,7 +6,7 @@ config DRM_ANALOGIX_ANX634=
5<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_H=
ELPER<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGMAP_I2=
C<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ANX6345 is an =
ultra-low Full-HD DisplayPort/eDP<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ANX6345 is an =
ultra-low power Full-HD DisplayPort/eDP<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0transmitt=
er designed for portable devices. The<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ANX6345 t=
ransforms the LVTTL RGB output of an<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0applicati=
on processor to eDP or DisplayPort.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Neil Armstrong &lt;<a href=3D"mail=
to:narmstrongt@baylibre.com" target=3D"_blank">narmstrongt@baylibre.com</a>=
 &lt;mailto:<a href=3D"mailto:narmstrongt@baylibre.com" target=3D"_blank">n=
armstrongt@baylibre.com</a>&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I think a typo in the email snuck in ;)<br>
&gt;&gt;<br>
&gt; <br>
&gt; Ah ah indeed !<br>
&gt; <br>
&gt; Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:narmstrongt@baylibre=
.com" target=3D"_blank">narmstrongt@baylibre.com</a>&gt;<br>
&gt; <br>
Wow, twice the same error... Monday was a bead day for me<br>
<br>
Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com" =
target=3D"_blank">narmstrong@baylibre.com</a>&gt;<br>
</blockquote></div>

--000000000000eea54605c10a17cf--

--===============1466805056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1466805056==--
