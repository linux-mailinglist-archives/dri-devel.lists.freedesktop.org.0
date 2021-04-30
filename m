Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CB36F996
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 13:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2986EEB0;
	Fri, 30 Apr 2021 11:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2F6EEB0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 11:50:11 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id m11so5119030pfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HusTJKOcIpAbVYi4XqKSvy+7NYXzylMfwqrkPG4/tyU=;
 b=L3P8g4uH4N2EolgxinqjC8hgNZv330nWWB5Qhz+bUPtGBQ8xyf4Y0WRT8AOINuJFsn
 f82350Rv4Ugg/rQ41NkM7ZVcA0Sy+tCGtcg/K0EfiCGQ11hlI8JKmyCIqcE8dEvpVQrf
 JWtYkgIdctll/bFqdZfiaY/meND6XQ1r/x2Xr5aiIEJOsW+/uBkpZs4IvTql5gXHdRFg
 gznyHZMWR/CPwy/dJpquZ/P/PNfecxFOOJPlD/vWycJ4QFZXmR0e0DPPkhupNUE59ATX
 eA8F47/znM+q0s8hx55oHz+TQOnDyTN3bnI4wF8MH7xguU64KyZcBr9r6SAfl1x0THEJ
 Jzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HusTJKOcIpAbVYi4XqKSvy+7NYXzylMfwqrkPG4/tyU=;
 b=ZmMpfeo+auJf53d1ivP3Z6gdRwvNisBTFdot5+SwHTUGhcqP3dSK/CR6pH+VfK8V0D
 fN4j87/pqhJTaF2dNw9JywV6vbQWDQ4ad95UUJHBWclYEbS0lRbCU8RSduGjNRpBNVSQ
 FhFr4hSV9aVKG1ROm7hy9qSo5Hyo+y+pCGVoYNXIl1DVLYjVl3qOLveqP2Cwh/u/GnbS
 N2RUGvgncH6qv9LQR/4FLm0fFwvfSd3H4regsOwnkGO649/7o8z2Mel778XVlqIDvTYr
 xdalzDagR8fHjfH2cf6HBHPnSKpyL6ZGSXlEMxkIYMJSlbyWoy8M1NAspBmjZF8Yd7Ai
 HNdg==
X-Gm-Message-State: AOAM532WsFkjTzRC2/YZqf7TCF51xeD9bwCwDYne+W+8qrDpAiIw4uH3
 dRhJ+s9CvA2eUBH/UohAI9rbsTfw5/XTJUmZ2MfksA==
X-Google-Smtp-Source: ABdhPJxfVjSFzujaEkpC67QM7AGoX/ncwtg9iuIkW4n6gVO4EHQg/RfmYeaAX0YVQdkHlztN4op4VhG2tNIHpiTxXpk=
X-Received: by 2002:a05:6a00:1642:b029:27f:2cae:eb7e with SMTP id
 m2-20020a056a001642b029027f2caeeb7emr4484862pfc.39.1619783411069; Fri, 30 Apr
 2021 04:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
 <1619170003-4817-2-git-send-email-victor.liu@nxp.com>
 <CAG3jFytcPzo81t8hubAf4Gb1zrVzZVB5D6qP-Dnchef6Zus25Q@mail.gmail.com>
 <95db401a341b857289f2bec7c03b694eb7df8ce3.camel@nxp.com>
In-Reply-To: <95db401a341b857289f2bec7c03b694eb7df8ce3.camel@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 30 Apr 2021 13:49:59 +0200
Message-ID: <CAG3jFyv6Es3NZy-WaMz=8nhAKT-dtM7Wib45To+pZ7XqiUaK-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/bridge: nwl-dsi: Force a full modeset when
 crtc_state->active is changed to be true
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, agx@sigxcpu.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, robert.chiras@nxp.com,
 linux-imx@nxp.com
Content-Type: multipart/mixed; boundary="===============1557473063=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1557473063==
Content-Type: multipart/alternative; boundary="000000000000d4867605c12f369e"

--000000000000d4867605c12f369e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Even better :)

On Fri, Apr 30, 2021, 13:46 Liu Ying <victor.liu@nxp.com> wrote:

> Hi Robert,
>
> On Fri, 2021-04-30 at 11:56 +0200, Robert Foss wrote:
> > Hey Liu,
> >
> > This patch does not apply on upstream-drm-misc/drm-misc-next. When it
> > passes local testing & building, I'm ready to merge it.
>
> I see Neil has already pushed this entire patch series to
> drm-misc-next.
>
>
>
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D885811372fe101c429=
9c53eecc9fee72cf927a0c
>
> I also see Guido's R-b and T-b tags on this series, though they comes
> after Neil's push perhaps.
>
> Thanks,
> Liu Ying
>
> >
> > On Fri, 23 Apr 2021 at 11:42, Liu Ying <victor.liu@nxp.com> wrote:
> > > This patch replaces ->mode_fixup() with ->atomic_check() so that
> > > a full modeset can be requested from there when crtc_state->active
> > > is changed to be true(which implies only connector's DPMS is
> > > brought
> > > out of "Off" status, though not necessarily).  Bridge functions are
> > > added or changed to accommodate the ->atomic_check() callback.
> > > That
> > > full modeset is needed by the up-coming patch which gets MIPI DSI
> > > controller and PHY ready in ->mode_set(), because it makes sure
> > > ->mode_set() and ->atomic_disable() are called in pairs.
> > >
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> > > Cc: Robert Chiras <robert.chiras@nxp.com>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v2->v3:
> > > * Split from the single patch in v2 to clarify changes. (Neil)
> > >
> > >  drivers/gpu/drm/bridge/nwl-dsi.c | 61 ++++++++++++++++++++------
> > > ------
> > >  1 file changed, 39 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c
> > > b/drivers/gpu/drm/bridge/nwl-dsi.c
> > > index 66b67402f1acd..c65ca860712d2 100644
> > > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > > @@ -21,6 +21,7 @@
> > >  #include <linux/sys_soc.h>
> > >  #include <linux/time64.h>
> > >
> > > +#include <drm/drm_atomic_state_helper.h>
> > >  #include <drm/drm_bridge.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > >  #include <drm/drm_of.h>
> > > @@ -742,7 +743,9 @@ static int nwl_dsi_disable(struct nwl_dsi *dsi)
> > >         return 0;
> > >  }
> > >
> > > -static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)
> > > +static void
> > > +nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> > > +                             struct drm_bridge_state
> > > *old_bridge_state)
> > >  {
> > >         struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > >         int ret;
> > > @@ -803,17 +806,6 @@ static int nwl_dsi_get_dphy_params(struct
> > > nwl_dsi *dsi,
> > >         return 0;
> > >  }
> > >
> > > -static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
> > > -                                     const struct drm_display_mode
> > > *mode,
> > > -                                     struct drm_display_mode
> > > *adjusted_mode)
> > > -{
> > > -       /* At least LCDIF + NWL needs active high sync */
> > > -       adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC |
> > > DRM_MODE_FLAG_PVSYNC);
> > > -       adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC |
> > > DRM_MODE_FLAG_NVSYNC);
> > > -
> > > -       return true;
> > > -}
> > > -
> > >  static enum drm_mode_status
> > >  nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > >                           const struct drm_display_info *info,
> > > @@ -831,6 +823,24 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge
> > > *bridge,
> > >         return MODE_OK;
> > >  }
> > >
> > > +static int nwl_dsi_bridge_atomic_check(struct drm_bridge *bridge,
> > > +                                      struct drm_bridge_state
> > > *bridge_state,
> > > +                                      struct drm_crtc_state
> > > *crtc_state,
> > > +                                      struct drm_connector_state
> > > *conn_state)
> > > +{
> > > +       struct drm_display_mode *adjusted_mode =3D &crtc_state-
> > > >adjusted_mode;
> > > +
> > > +       /* At least LCDIF + NWL needs active high sync */
> > > +       adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC |
> > > DRM_MODE_FLAG_PVSYNC);
> > > +       adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC |
> > > DRM_MODE_FLAG_NVSYNC);
> > > +
> > > +       /* Do a full modeset if crtc_state->active is changed to be
> > > true. */
> > > +       if (crtc_state->active_changed && crtc_state->active)
> > > +               crtc_state->mode_changed =3D true;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static void
> > >  nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
> > >                         const struct drm_display_mode *mode,
> > > @@ -862,7 +872,9 @@ nwl_dsi_bridge_mode_set(struct drm_bridge
> > > *bridge,
> > >         drm_mode_debug_printmodeline(adjusted_mode);
> > >  }
> > >
> > > -static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> > > +static void
> > > +nwl_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > +                                struct drm_bridge_state
> > > *old_bridge_state)
> > >  {
> > >         struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > >         int ret;
> > > @@ -897,7 +909,9 @@ static void nwl_dsi_bridge_pre_enable(struct
> > > drm_bridge *bridge)
> > >         }
> > >  }
> > >
> > > -static void nwl_dsi_bridge_enable(struct drm_bridge *bridge)
> > > +static void
> > > +nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                            struct drm_bridge_state
> > > *old_bridge_state)
> > >  {
> > >         struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > >         int ret;
> > > @@ -942,14 +956,17 @@ static void nwl_dsi_bridge_detach(struct
> > > drm_bridge *bridge)
> > >  }
> > >
> > >  static const struct drm_bridge_funcs nwl_dsi_bridge_funcs =3D {
> > > -       .pre_enable =3D nwl_dsi_bridge_pre_enable,
> > > -       .enable     =3D nwl_dsi_bridge_enable,
> > > -       .disable    =3D nwl_dsi_bridge_disable,
> > > -       .mode_fixup =3D nwl_dsi_bridge_mode_fixup,
> > > -       .mode_set   =3D nwl_dsi_bridge_mode_set,
> > > -       .mode_valid =3D nwl_dsi_bridge_mode_valid,
> > > -       .attach     =3D nwl_dsi_bridge_attach,
> > > -       .detach     =3D nwl_dsi_bridge_detach,
> > > +       .atomic_duplicate_state =3D
> > > drm_atomic_helper_bridge_duplicate_state,
> > > +       .atomic_destroy_state   =3D
> > > drm_atomic_helper_bridge_destroy_state,
> > > +       .atomic_reset           =3D drm_atomic_helper_bridge_reset,
> > > +       .atomic_check           =3D nwl_dsi_bridge_atomic_check,
> > > +       .atomic_pre_enable      =3D nwl_dsi_bridge_atomic_pre_enable,
> > > +       .atomic_enable          =3D nwl_dsi_bridge_atomic_enable,
> > > +       .atomic_disable         =3D nwl_dsi_bridge_atomic_disable,
> > > +       .mode_set               =3D nwl_dsi_bridge_mode_set,
> > > +       .mode_valid             =3D nwl_dsi_bridge_mode_valid,
> > > +       .attach                 =3D nwl_dsi_bridge_attach,
> > > +       .detach                 =3D nwl_dsi_bridge_detach,
> > >  };
> > >
> > >  static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>
>

--000000000000d4867605c12f369e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Even better :)</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021, 13:46 Liu Ying &lt;<a=
 href=3D"mailto:victor.liu@nxp.com">victor.liu@nxp.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi Robert,<br>
<br>
On Fri, 2021-04-30 at 11:56 +0200, Robert Foss wrote:<br>
&gt; Hey Liu,<br>
&gt; <br>
&gt; This patch does not apply on upstream-drm-misc/drm-misc-next. When it<=
br>
&gt; passes local testing &amp; building, I&#39;m ready to merge it.<br>
<br>
I see Neil has already pushed this entire patch series to<br>
drm-misc-next.<br>
<br>
<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D885811372=
fe101c4299c53eecc9fee72cf927a0c" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D885811372fe101=
c4299c53eecc9fee72cf927a0c</a><br>
<br>
I also see Guido&#39;s R-b and T-b tags on this series, though they comes<b=
r>
after Neil&#39;s push perhaps.<br>
<br>
Thanks,<br>
Liu Ying<br>
<br>
&gt; <br>
&gt; On Fri, 23 Apr 2021 at 11:42, Liu Ying &lt;<a href=3D"mailto:victor.li=
u@nxp.com" target=3D"_blank" rel=3D"noreferrer">victor.liu@nxp.com</a>&gt; =
wrote:<br>
&gt; &gt; This patch replaces -&gt;mode_fixup() with -&gt;atomic_check() so=
 that<br>
&gt; &gt; a full modeset can be requested from there when crtc_state-&gt;ac=
tive<br>
&gt; &gt; is changed to be true(which implies only connector&#39;s DPMS is<=
br>
&gt; &gt; brought<br>
&gt; &gt; out of &quot;Off&quot; status, though not necessarily).=C2=A0 Bri=
dge functions are<br>
&gt; &gt; added or changed to accommodate the -&gt;atomic_check() callback.=
 <br>
&gt; &gt; That<br>
&gt; &gt; full modeset is needed by the up-coming patch which gets MIPI DSI=
<br>
&gt; &gt; controller and PHY ready in -&gt;mode_set(), because it makes sur=
e<br>
&gt; &gt; -&gt;mode_set() and -&gt;atomic_disable() are called in pairs.<br=
>
&gt; &gt; <br>
&gt; &gt; Cc: Andrzej Hajda &lt;<a href=3D"mailto:a.hajda@samsung.com" targ=
et=3D"_blank" rel=3D"noreferrer">a.hajda@samsung.com</a>&gt;<br>
&gt; &gt; Cc: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com"=
 target=3D"_blank" rel=3D"noreferrer">narmstrong@baylibre.com</a>&gt;<br>
&gt; &gt; Cc: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org" tar=
get=3D"_blank" rel=3D"noreferrer">robert.foss@linaro.org</a>&gt;<br>
&gt; &gt; Cc: Laurent Pinchart &lt;<a href=3D"mailto:Laurent.pinchart@ideas=
onboard.com" target=3D"_blank" rel=3D"noreferrer">Laurent.pinchart@ideasonb=
oard.com</a>&gt;<br>
&gt; &gt; Cc: Jonas Karlman &lt;<a href=3D"mailto:jonas@kwiboo.se" target=
=3D"_blank" rel=3D"noreferrer">jonas@kwiboo.se</a>&gt;<br>
&gt; &gt; Cc: Jernej Skrabec &lt;<a href=3D"mailto:jernej.skrabec@siol.net"=
 target=3D"_blank" rel=3D"noreferrer">jernej.skrabec@siol.net</a>&gt;<br>
&gt; &gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=
=3D"_blank" rel=3D"noreferrer">airlied@linux.ie</a>&gt;<br>
&gt; &gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt;<br>
&gt; &gt; Cc: Guido G=C3=BCnther &lt;<a href=3D"mailto:agx@sigxcpu.org" tar=
get=3D"_blank" rel=3D"noreferrer">agx@sigxcpu.org</a>&gt;<br>
&gt; &gt; Cc: Robert Chiras &lt;<a href=3D"mailto:robert.chiras@nxp.com" ta=
rget=3D"_blank" rel=3D"noreferrer">robert.chiras@nxp.com</a>&gt;<br>
&gt; &gt; Cc: NXP Linux Team &lt;<a href=3D"mailto:linux-imx@nxp.com" targe=
t=3D"_blank" rel=3D"noreferrer">linux-imx@nxp.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Liu Ying &lt;<a href=3D"mailto:victor.liu@nxp.com"=
 target=3D"_blank" rel=3D"noreferrer">victor.liu@nxp.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2-&gt;v3:<br>
&gt; &gt; * Split from the single patch in v2 to clarify changes. (Neil)<br=
>
&gt; &gt; <br>
&gt; &gt;=C2=A0 drivers/gpu/drm/bridge/nwl-dsi.c | 61 ++++++++++++++++++++-=
-----<br>
&gt; &gt; ------<br>
&gt; &gt;=C2=A0 1 file changed, 39 insertions(+), 22 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c<br>
&gt; &gt; b/drivers/gpu/drm/bridge/nwl-dsi.c<br>
&gt; &gt; index 66b67402f1acd..c65ca860712d2 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/bridge/nwl-dsi.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/bridge/nwl-dsi.c<br>
&gt; &gt; @@ -21,6 +21,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/sys_soc.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/time64.h&gt;<br>
&gt; &gt; <br>
&gt; &gt; +#include &lt;drm/drm_atomic_state_helper.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;drm/drm_bridge.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;drm/drm_mipi_dsi.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;drm/drm_of.h&gt;<br>
&gt; &gt; @@ -742,7 +743,9 @@ static int nwl_dsi_disable(struct nwl_dsi *ds=
i)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; -static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)<br=
>
&gt; &gt; +static void<br>
&gt; &gt; +nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge_state<br>
&gt; &gt; *old_bridge_state)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nwl_dsi *dsi =3D bridge_t=
o_dsi(bridge);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; @@ -803,17 +806,6 @@ static int nwl_dsi_get_dphy_params(struct<br=
>
&gt; &gt; nwl_dsi *dsi,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; -static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
struct drm_display_mode<br>
&gt; &gt; *mode,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 drm_display_mode<br>
&gt; &gt; *adjusted_mode)<br>
&gt; &gt; -{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* At least LCDIF + NWL needs active =
high sync */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags |=3D (DRM_MOD=
E_FLAG_PHSYNC |<br>
&gt; &gt; DRM_MODE_FLAG_PVSYNC);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags &amp;=3D ~(DR=
M_MODE_FLAG_NHSYNC |<br>
&gt; &gt; DRM_MODE_FLAG_NVSYNC);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 static enum drm_mode_status<br>
&gt; &gt;=C2=A0 nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_info *info,<br>
&gt; &gt; @@ -831,6 +823,24 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge<=
br>
&gt; &gt; *bridge,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; +static int nwl_dsi_bridge_atomic_check(struct drm_bridge *bridge=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struc=
t drm_bridge_state<br>
&gt; &gt; *bridge_state,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struc=
t drm_crtc_state<br>
&gt; &gt; *crtc_state,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struc=
t drm_connector_state<br>
&gt; &gt; *conn_state)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *adjusted_mod=
e =3D &amp;crtc_state-<br>
&gt; &gt; &gt;adjusted_mode;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* At least LCDIF + NWL needs active =
high sync */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags |=3D (DRM_MOD=
E_FLAG_PHSYNC |<br>
&gt; &gt; DRM_MODE_FLAG_PVSYNC);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags &amp;=3D ~(DR=
M_MODE_FLAG_NHSYNC |<br>
&gt; &gt; DRM_MODE_FLAG_NVSYNC);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do a full modeset if crtc_state-&g=
t;active is changed to be<br>
&gt; &gt; true. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtc_state-&gt;active_changed &am=
p;&amp; crtc_state-&gt;active)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_stat=
e-&gt;mode_changed =3D true;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static void<br>
&gt; &gt;=C2=A0 nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_mode *mode,<br>
&gt; &gt; @@ -862,7 +872,9 @@ nwl_dsi_bridge_mode_set(struct drm_bridge<br>
&gt; &gt; *bridge,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_debug_printmodeline(adj=
usted_mode);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; -static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)=
<br>
&gt; &gt; +static void<br>
&gt; &gt; +nwl_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_state<br=
>
&gt; &gt; *old_bridge_state)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nwl_dsi *dsi =3D bridge_t=
o_dsi(bridge);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; @@ -897,7 +909,9 @@ static void nwl_dsi_bridge_pre_enable(struct<=
br>
&gt; &gt; drm_bridge *bridge)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; -static void nwl_dsi_bridge_enable(struct drm_bridge *bridge)<br>
&gt; &gt; +static void<br>
&gt; &gt; +nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_state<br>
&gt; &gt; *old_bridge_state)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nwl_dsi *dsi =3D bridge_t=
o_dsi(bridge);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; @@ -942,14 +956,17 @@ static void nwl_dsi_bridge_detach(struct<br=
>
&gt; &gt; drm_bridge *bridge)<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 static const struct drm_bridge_funcs nwl_dsi_bridge_funcs =
=3D {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.pre_enable =3D nwl_dsi_bridge_pre_en=
able,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable=C2=A0 =C2=A0 =C2=A0=3D nwl_ds=
i_bridge_enable,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable=C2=A0 =C2=A0 =3D nwl_dsi_bri=
dge_disable,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_fixup =3D nwl_dsi_bridge_mode_f=
ixup,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_set=C2=A0 =C2=A0=3D nwl_dsi_bri=
dge_mode_set,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid =3D nwl_dsi_bridge_mode_v=
alid,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach=C2=A0 =C2=A0 =C2=A0=3D nwl_ds=
i_bridge_attach,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.detach=C2=A0 =C2=A0 =C2=A0=3D nwl_ds=
i_bridge_detach,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D<br>
&gt; &gt; drm_atomic_helper_bridge_duplicate_state,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=3D=
<br>
&gt; &gt; drm_atomic_helper_bridge_destroy_state,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_reset=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D drm_atomic_helper_bridge_reset,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_atomic_check,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_pre_enable=C2=A0 =C2=A0 =C2=
=A0 =3D nwl_dsi_bridge_atomic_pre_enable,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_enable=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D nwl_dsi_bridge_atomic_enable,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_disable=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D nwl_dsi_bridge_atomic_disable,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_mode_set,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_mode_valid,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_attach,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.detach=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_detach,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)<br>
<br>
</blockquote></div>

--000000000000d4867605c12f369e--

--===============1557473063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1557473063==--
