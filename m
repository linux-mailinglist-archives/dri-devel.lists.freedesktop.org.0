Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422B6364918
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 19:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E46E422;
	Mon, 19 Apr 2021 17:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759CB6E422
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 17:35:28 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id w6so9130005pfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XV4fwbYICz84xYHepIE/BCZ+feF+zV6+5tAw7l+6vvk=;
 b=i8PqO1rvbMyGYWD062ztUAMTNLVtwz6JXR62TKEOuGlMTWv7QutLJg5xJKb9m9ifIk
 rCrgWWu0YMlEIscQy8DV9pNumLTBpiOWYZyGxDaMwT0dSEYvoZ4kdHZOmTzh961nV9vJ
 36DV03kW0sYsokwwnjTxx+3cmpVeEajwi1LCq4lCRCQYSo/HlFLZuo2UQ2KAMb902Ipp
 gkBWWGsMdON6H1/1XygbVQrhf0FB9g7WkIDhqtQ6CqnH8VkjV1i+9oGAzjPUw3AV9jHs
 aD0wYpou1semvlQXIaHxZvFc77wCoIyR6MNEA6L79TAX+6cB/BaK7bCK3I/NMwxOWBXO
 8RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XV4fwbYICz84xYHepIE/BCZ+feF+zV6+5tAw7l+6vvk=;
 b=b1nsTgZHUc7nmroGZDegXgYp6PTzwBVgNXHgZoCOoGnasoAV97B/uTRN5XK/HImnC2
 oteLtr+rF/ximEEM3dqxxYdLCqVaEed2j9Z9/WLsM0w7+r4CErNVs2x4Kw8P/BRKtauI
 xBUKMI9jD5MWlRq4kCbUynTNcBlUo7pVvgAJ/ySE/XpesQTtzMtukKg2uJKm44hx4UQN
 OTY5QwMxRBa9YD6eUZZLnGwbzvABb7EPjjSiGEvtt3D/GRzKnbcNL1SiFNoT4IjxcD65
 02YpRLEySvske1PLRsPNcSOg1AJ+pHBJwwt135kV4q3qpDYCV/jwJfs9dz6yGC0rQlvx
 1nhw==
X-Gm-Message-State: AOAM531oH8K2AbIupNMYsTCOhHWjIPsoIArtyp6trZ1+NWUy+l05+U9T
 H1iCUTBKXNSqeqqc3Tgl9AsRpQsk+X2bnJejG7HoQw==
X-Google-Smtp-Source: ABdhPJwnKlXKXp3bVACyu8b1l0zREg8KWkXqot+SsQcSbzzBSZSLMkwOEghdpZbSe/Hiyl3hEMIR6EYgdHjt+KehYms=
X-Received: by 2002:a05:6a00:88a:b029:261:6d37:dac6 with SMTP id
 q10-20020a056a00088ab02902616d37dac6mr3737872pfj.18.1618853727728; Mon, 19
 Apr 2021 10:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210419090124.153560-1-robert.foss@linaro.org>
 <1627725d-1c7e-109f-f995-e761bb022ccc@infradead.org>
In-Reply-To: <1627725d-1c7e-109f-f995-e761bb022ccc@infradead.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 19 Apr 2021 19:35:15 +0200
Message-ID: <CAG3jFys0m_SW5Aa69cadgB0JBP3OAH-6Xi7CDfrQ0wYA_zvgqA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/sii8620: fix dependency on extcon
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, cw00.choi@samsung.com,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, m.purski@samsung.com,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kernel test robot <lkp@intel.com>
Content-Type: multipart/mixed; boundary="===============0307055319=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0307055319==
Content-Type: multipart/alternative; boundary="000000000000628c4b05c056c1a3"

--000000000000628c4b05c056c1a3
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021, 19:11 Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/19/21 2:01 AM, Robert Foss wrote:
> > The DRM_SIL_SII8620 kconfig has a weak `imply` dependency
> > on EXTCON, which causes issues when sii8620 is built
> > as a builtin and EXTCON is built as a module.
> >
> > The symptoms are 'undefined reference' errors caused
> > by the symbols in EXTCON not being available
> > to the sii8620 driver.
> >
> > Fixes: 688838442147 ("drm/bridge/sii8620: use micro-USB cable detection
> logic to detect MHL")
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >
> > LKP reported issue:
> > https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/
> >
> >
> > Changes since v1:
> >  - Fix typo on comment
> >
> > Changes since v2:
> >  - Randy: Changed from `depends` to `select`
>
> I don't know why my name is on that. I didn't
> suggest any change -- I just reported that v2
> had a problem.
>

Credit where credit is due :)


>
> >
> >
> >  drivers/gpu/drm/bridge/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> b/drivers/gpu/drm/bridge/Kconfig
> > index 22a467abd3e9..70402da5cc70 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -169,7 +169,7 @@ config DRM_SIL_SII8620
> >       tristate "Silicon Image SII8620 HDMI/MHL bridge"
> >       depends on OF
> >       select DRM_KMS_HELPER
> > -     imply EXTCON
> > +     select EXTCON
> >       depends on RC_CORE || !RC_CORE
> >       help
> >         Silicon Image SII8620 HDMI/MHL bridge chip driver.
>
>
> Thanks. Works For Me.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> --
> ~Randy
>
>

--000000000000628c4b05c056c1a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 19, 2021, 19:11 Randy Dunlap &lt;<a href=
=3D"mailto:rdunlap@infradead.org">rdunlap@infradead.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 4/19/21 2:01 AM, Robert Foss wrote:<=
br>
&gt; The DRM_SIL_SII8620 kconfig has a weak `imply` dependency<br>
&gt; on EXTCON, which causes issues when sii8620 is built<br>
&gt; as a builtin and EXTCON is built as a module.<br>
&gt; <br>
&gt; The symptoms are &#39;undefined reference&#39; errors caused<br>
&gt; by the symbols in EXTCON not being available<br>
&gt; to the sii8620 driver.<br>
&gt; <br>
&gt; Fixes: 688838442147 (&quot;drm/bridge/sii8620: use micro-USB cable det=
ection logic to detect MHL&quot;)<br>
&gt; Signed-off-by: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">robert.foss@linaro.org</a>&gt;<br>
&gt; Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; LKP reported issue:<br>
&gt; <a href=3D"https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@inte=
l.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kernel=
.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/</a><br>
&gt; <br>
&gt; <br>
&gt; Changes since v1:<br>
&gt;=C2=A0 - Fix typo on comment<br>
&gt; <br>
&gt; Changes since v2:<br>
&gt;=C2=A0 - Randy: Changed from `depends` to `select` <br>
<br>
I don&#39;t know why my name is on that. I didn&#39;t<br>
suggest any change -- I just reported that v2<br>
had a problem.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Credit where credit is due :)</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 drivers/gpu/drm/bridge/Kconfig | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/K=
config<br>
&gt; index 22a467abd3e9..70402da5cc70 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/bridge/Kconfig<br>
&gt; @@ -169,7 +169,7 @@ config DRM_SIL_SII8620<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Silicon Image SII8620 HDMI/MH=
L bridge&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0imply EXTCON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select EXTCON<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on RC_CORE || !RC_CORE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Silicon Image SII8620 HDMI/MHL bridge=
 chip driver.<br>
<br>
<br>
Thanks. Works For Me.<br>
<br>
Acked-by: Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org" target=
=3D"_blank" rel=3D"noreferrer">rdunlap@infradead.org</a>&gt; # build-tested=
<br>
<br>
-- <br>
~Randy<br>
<br>
</blockquote></div></div></div>

--000000000000628c4b05c056c1a3--

--===============0307055319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0307055319==--
