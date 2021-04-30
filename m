Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33236F83B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295696F522;
	Fri, 30 Apr 2021 09:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E696F522
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 09:56:39 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c17so13489227pfn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7nnhOSqs/kXKzQ7KY8eVPB7N4upLnxgQL6mnZ3kJkM=;
 b=TbgLHhmfjciT4FTKBUWnKyl9bEu0Eo77bHn5N22DhK9pRPUZ44CirII9GZc2+2oPSK
 ZghUq7i1aCFKUhNq93ZpsHNtApLl4AoX4NthZ7VL7z0AV5udKiUM1HKX08lwa0nE+jPQ
 YnBs1Ja1D2hYGTuVYIwTa/QI5KS2nyWNYBViFyH3XMQzbWlQGvM3rlq3v0gestJh9BZw
 BajmZtN+SSts5BpB5LUX6zdWgXyL2f6nvOXNUi5QdYgvHBSjfutGIw3SUwwzg6a7L5iT
 QNuqaLzuI5JCBk6+Ezghregtt2wejWHT3dLriOaJ6Wmrqfj6eNvcQeB7+h6wx6oY6dPT
 y7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7nnhOSqs/kXKzQ7KY8eVPB7N4upLnxgQL6mnZ3kJkM=;
 b=CwlwWcCrPN4y1wQVYgI7ILKf4Wv6ptB5sOUt/EBI+yxsfanfuPJwNjXvyQP9pCWF+q
 Psjq+xqN9yDENBhKO7s2GU0v/5nsbCDcIUs7JE9T9/2o5GqONEDPzTA8mxN2q07s9p2H
 ZcbqSraZzOgB+4n3n7MwqtDrVzCRY9juXcovuW8IpuCKTXeWuaAwkd7cNLCcXeWayMSr
 9RFraKyLI/jmkzAh2MUWPkUZcoZr8BZY79wDCE/E0s1oSYAl/hfUGkdLeExTEuLrwCGn
 mrr2nmmcKV2fmeuCv89/iVgE2uBsbj7E1Qv3fT6LQ3tpLvKOYIjIjZHviZGlOSBfFKiQ
 R/Yw==
X-Gm-Message-State: AOAM530zR4TUE2QPAq+zJaF3HckBsR5g6aH76br9sZBY8X49GhxEurB+
 W+JIWdq7CoVTWHweSH3k7/pUBbA2Bm7Yals4jrqKLQ==
X-Google-Smtp-Source: ABdhPJy3mX6jkalNUZSLYQJJQIA4kN4ZjYATSonmSAc3YmJtiBMccvlENOauAX80uxOJ7zn+PDjg+go0DzgiuBa/ebs=
X-Received: by 2002:a62:6544:0:b029:261:14cc:b11d with SMTP id
 z65-20020a6265440000b029026114ccb11dmr4466442pfb.12.1619776599373; Fri, 30
 Apr 2021 02:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
 <1619170003-4817-2-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1619170003-4817-2-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 30 Apr 2021 11:56:28 +0200
Message-ID: <CAG3jFytcPzo81t8hubAf4Gb1zrVzZVB5D6qP-Dnchef6Zus25Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0593141624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0593141624==
Content-Type: multipart/alternative; boundary="000000000000d24dc405c12da04c"

--000000000000d24dc405c12da04c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Liu,

This patch does not apply on upstream-drm-misc/drm-misc-next. When it
passes local testing & building, I'm ready to merge it.

On Fri, 23 Apr 2021 at 11:42, Liu Ying <victor.liu@nxp.com> wrote:

> This patch replaces ->mode_fixup() with ->atomic_check() so that
> a full modeset can be requested from there when crtc_state->active
> is changed to be true(which implies only connector's DPMS is brought
> out of "Off" status, though not necessarily).  Bridge functions are
> added or changed to accommodate the ->atomic_check() callback.  That
> full modeset is needed by the up-coming patch which gets MIPI DSI
> controller and PHY ready in ->mode_set(), because it makes sure
> ->mode_set() and ->atomic_disable() are called in pairs.
>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Split from the single patch in v2 to clarify changes. (Neil)
>
>  drivers/gpu/drm/bridge/nwl-dsi.c | 61 ++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c
> b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 66b67402f1acd..c65ca860712d2 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -21,6 +21,7 @@
>  #include <linux/sys_soc.h>
>  #include <linux/time64.h>
>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
> @@ -742,7 +743,9 @@ static int nwl_dsi_disable(struct nwl_dsi *dsi)
>         return 0;
>  }
>
> -static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)
> +static void
> +nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +                             struct drm_bridge_state *old_bridge_state)
>  {
>         struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
>         int ret;
> @@ -803,17 +806,6 @@ static int nwl_dsi_get_dphy_params(struct nwl_dsi
> *dsi,
>         return 0;
>  }
>
> -static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                     const struct drm_display_mode *mode=
,
> -                                     struct drm_display_mode
> *adjusted_mode)
> -{
> -       /* At least LCDIF + NWL needs active high sync */
> -       adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC |
> DRM_MODE_FLAG_PVSYNC);
> -       adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC |
> DRM_MODE_FLAG_NVSYNC);
> -
> -       return true;
> -}
> -
>  static enum drm_mode_status
>  nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>                           const struct drm_display_info *info,
> @@ -831,6 +823,24 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>         return MODE_OK;
>  }
>
> +static int nwl_dsi_bridge_atomic_check(struct drm_bridge *bridge,
> +                                      struct drm_bridge_state
> *bridge_state,
> +                                      struct drm_crtc_state *crtc_state,
> +                                      struct drm_connector_state
> *conn_state)
> +{
> +       struct drm_display_mode *adjusted_mode =3D
> &crtc_state->adjusted_mode;
> +
> +       /* At least LCDIF + NWL needs active high sync */
> +       adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC |
> DRM_MODE_FLAG_PVSYNC);
> +       adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC |
> DRM_MODE_FLAG_NVSYNC);
> +
> +       /* Do a full modeset if crtc_state->active is changed to be true.
> */
> +       if (crtc_state->active_changed && crtc_state->active)
> +               crtc_state->mode_changed =3D true;
> +
> +       return 0;
> +}
> +
>  static void
>  nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>                         const struct drm_display_mode *mode,
> @@ -862,7 +872,9 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>         drm_mode_debug_printmodeline(adjusted_mode);
>  }
>
> -static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void
> +nwl_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +                                struct drm_bridge_state *old_bridge_stat=
e)
>  {
>         struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
>         int ret;
> @@ -897,7 +909,9 @@ static void nwl_dsi_bridge_pre_enable(struct
> drm_bridge *bridge)
>         }
>  }
>
> -static void nwl_dsi_bridge_enable(struct drm_bridge *bridge)
> +static void
> +nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +                            struct drm_bridge_state *old_bridge_state)
>  {
>         struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
>         int ret;
> @@ -942,14 +956,17 @@ static void nwl_dsi_bridge_detach(struct drm_bridge
> *bridge)
>  }
>
>  static const struct drm_bridge_funcs nwl_dsi_bridge_funcs =3D {
> -       .pre_enable =3D nwl_dsi_bridge_pre_enable,
> -       .enable     =3D nwl_dsi_bridge_enable,
> -       .disable    =3D nwl_dsi_bridge_disable,
> -       .mode_fixup =3D nwl_dsi_bridge_mode_fixup,
> -       .mode_set   =3D nwl_dsi_bridge_mode_set,
> -       .mode_valid =3D nwl_dsi_bridge_mode_valid,
> -       .attach     =3D nwl_dsi_bridge_attach,
> -       .detach     =3D nwl_dsi_bridge_detach,
> +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> +       .atomic_destroy_state   =3D drm_atomic_helper_bridge_destroy_stat=
e,
> +       .atomic_reset           =3D drm_atomic_helper_bridge_reset,
> +       .atomic_check           =3D nwl_dsi_bridge_atomic_check,
> +       .atomic_pre_enable      =3D nwl_dsi_bridge_atomic_pre_enable,
> +       .atomic_enable          =3D nwl_dsi_bridge_atomic_enable,
> +       .atomic_disable         =3D nwl_dsi_bridge_atomic_disable,
> +       .mode_set               =3D nwl_dsi_bridge_mode_set,
> +       .mode_valid             =3D nwl_dsi_bridge_mode_valid,
> +       .attach                 =3D nwl_dsi_bridge_attach,
> +       .detach                 =3D nwl_dsi_bridge_detach,
>  };
>
>  static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
> --
> 2.25.1
>
>

--000000000000d24dc405c12da04c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Liu,<br><br></div>This patch does not apply on up=
stream-drm-misc/drm-misc-next. When it passes local testing &amp; building,=
 I&#39;m ready to merge it.<br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 23 Apr 2021 at 11:42, Liu Ying &lt;<=
a href=3D"mailto:victor.liu@nxp.com">victor.liu@nxp.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">This patch replaces =
-&gt;mode_fixup() with -&gt;atomic_check() so that<br>
a full modeset can be requested from there when crtc_state-&gt;active<br>
is changed to be true(which implies only connector&#39;s DPMS is brought<br=
>
out of &quot;Off&quot; status, though not necessarily).=C2=A0 Bridge functi=
ons are<br>
added or changed to accommodate the -&gt;atomic_check() callback.=C2=A0 Tha=
t<br>
full modeset is needed by the up-coming patch which gets MIPI DSI<br>
controller and PHY ready in -&gt;mode_set(), because it makes sure<br>
-&gt;mode_set() and -&gt;atomic_disable() are called in pairs.<br>
<br>
Cc: Andrzej Hajda &lt;<a href=3D"mailto:a.hajda@samsung.com" target=3D"_bla=
nk">a.hajda@samsung.com</a>&gt;<br>
Cc: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com" target=3D=
"_blank">narmstrong@baylibre.com</a>&gt;<br>
Cc: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org" target=3D"_bl=
ank">robert.foss@linaro.org</a>&gt;<br>
Cc: Laurent Pinchart &lt;<a href=3D"mailto:Laurent.pinchart@ideasonboard.co=
m" target=3D"_blank">Laurent.pinchart@ideasonboard.com</a>&gt;<br>
Cc: Jonas Karlman &lt;<a href=3D"mailto:jonas@kwiboo.se" target=3D"_blank">=
jonas@kwiboo.se</a>&gt;<br>
Cc: Jernej Skrabec &lt;<a href=3D"mailto:jernej.skrabec@siol.net" target=3D=
"_blank">jernej.skrabec@siol.net</a>&gt;<br>
Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_blank">=
airlied@linux.ie</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">=
daniel@ffwll.ch</a>&gt;<br>
Cc: Guido G=C3=BCnther &lt;<a href=3D"mailto:agx@sigxcpu.org" target=3D"_bl=
ank">agx@sigxcpu.org</a>&gt;<br>
Cc: Robert Chiras &lt;<a href=3D"mailto:robert.chiras@nxp.com" target=3D"_b=
lank">robert.chiras@nxp.com</a>&gt;<br>
Cc: NXP Linux Team &lt;<a href=3D"mailto:linux-imx@nxp.com" target=3D"_blan=
k">linux-imx@nxp.com</a>&gt;<br>
Signed-off-by: Liu Ying &lt;<a href=3D"mailto:victor.liu@nxp.com" target=3D=
"_blank">victor.liu@nxp.com</a>&gt;<br>
---<br>
v2-&gt;v3:<br>
* Split from the single patch in v2 to clarify changes. (Neil)<br>
<br>
=C2=A0drivers/gpu/drm/bridge/nwl-dsi.c | 61 ++++++++++++++++++++-----------=
-<br>
=C2=A01 file changed, 39 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-=
dsi.c<br>
index 66b67402f1acd..c65ca860712d2 100644<br>
--- a/drivers/gpu/drm/bridge/nwl-dsi.c<br>
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c<br>
@@ -21,6 +21,7 @@<br>
=C2=A0#include &lt;linux/sys_soc.h&gt;<br>
=C2=A0#include &lt;linux/time64.h&gt;<br>
<br>
+#include &lt;drm/drm_atomic_state_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_bridge.h&gt;<br>
=C2=A0#include &lt;drm/drm_mipi_dsi.h&gt;<br>
=C2=A0#include &lt;drm/drm_of.h&gt;<br>
@@ -742,7 +743,9 @@ static int nwl_dsi_disable(struct nwl_dsi *dsi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)<br>
+static void<br>
+nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge_state *old_bridge_state)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
@@ -803,17 +806,6 @@ static int nwl_dsi_get_dphy_params(struct nwl_dsi *dsi=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm=
_display_mode *mode,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_displ=
ay_mode *adjusted_mode)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* At least LCDIF + NWL needs active high sync =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags |=3D (DRM_MODE_FLAG_PHS=
YNC | DRM_MODE_FLAG_PVSYNC);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags &amp;=3D ~(DRM_MODE_FLA=
G_NHSYNC | DRM_MODE_FLAG_NVSYNC);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-}<br>
-<br>
=C2=A0static enum drm_mode_status<br>
=C2=A0nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct drm_display_info *info,<br>
@@ -831,6 +823,24 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MODE_OK;<br>
=C2=A0}<br>
<br>
+static int nwl_dsi_bridge_atomic_check(struct drm_bridge *bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_brid=
ge_state *bridge_state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc=
_state *crtc_state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_conn=
ector_state *conn_state)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *adjusted_mode =3D &amp=
;crtc_state-&gt;adjusted_mode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* At least LCDIF + NWL needs active high sync =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags |=3D (DRM_MODE_FLAG_PHS=
YNC | DRM_MODE_FLAG_PVSYNC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_mode-&gt;flags &amp;=3D ~(DRM_MODE_FLA=
G_NHSYNC | DRM_MODE_FLAG_NVSYNC);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do a full modeset if crtc_state-&gt;active i=
s changed to be true. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtc_state-&gt;active_changed &amp;&amp; cr=
tc_state-&gt;active)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_state-&gt;mode=
_changed =3D true;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static void<br>
=C2=A0nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const struct drm_display_mode *mode,<br>
@@ -862,7 +872,9 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_mode_debug_printmodeline(adjusted_mode);<br=
>
=C2=A0}<br>
<br>
-static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)<br>
+static void<br>
+nwl_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_state *old_bridge_=
state)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
@@ -897,7 +909,9 @@ static void nwl_dsi_bridge_pre_enable(struct drm_bridge=
 *bridge)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
-static void nwl_dsi_bridge_enable(struct drm_bridge *bridge)<br>
+static void<br>
+nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_state *old_bridge_state)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
@@ -942,14 +956,17 @@ static void nwl_dsi_bridge_detach(struct drm_bridge *=
bridge)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct drm_bridge_funcs nwl_dsi_bridge_funcs =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.pre_enable =3D nwl_dsi_bridge_pre_enable,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable=C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_e=
nable,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable=C2=A0 =C2=A0 =3D nwl_dsi_bridge_disabl=
e,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_fixup =3D nwl_dsi_bridge_mode_fixup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_set=C2=A0 =C2=A0=3D nwl_dsi_bridge_mode_s=
et,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid =3D nwl_dsi_bridge_mode_valid,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach=C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_a=
ttach,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.detach=C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_d=
etach,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helper_b=
ridge_duplicate_state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=3D drm_atomi=
c_helper_bridge_destroy_state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_reset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D drm_atomic_helper_bridge_reset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D nwl_dsi_bridge_atomic_check,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_pre_enable=C2=A0 =C2=A0 =C2=A0 =3D nwl_=
dsi_bridge_atomic_pre_enable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_enable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D nwl_dsi_bridge_atomic_enable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_disable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D nwl_dsi_bridge_atomic_disable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_mode_set,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D nwl_dsi_bridge_mode_valid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_attach,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.detach=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D nwl_dsi_bridge_detach,<br>
=C2=A0};<br>
<br>
=C2=A0static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000d24dc405c12da04c--

--===============0593141624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0593141624==--
