Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED836DCDC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E6E6E284;
	Wed, 28 Apr 2021 16:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7478E6EBA1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:19:58 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id p17so5178068pjz.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4TVKvwfAR1D9CGU5hfJk9qLIspo/mBQMGeGLnlUXBHo=;
 b=qXjQW1gloNRqT/ioT8O87kH0jp1kiN0yoUy538vQgmOD/Bwmt9RLGyrnJ07peLxOUi
 ZOKyIb1p5pnGeRFfHbHCa4SdLRmTz/EmEyQYF+Rb788LdVePab1ddARyIT0uSi6N5yUc
 xLYVyJHjXU7DZN7t/JeYa2zMlszKz45jNjocL9KK7g77hxqHojRJ5IpjxDuyXUfnW9Tv
 MEisgxRBrrPUr0sf7mg17q4yC46T1p1ltToB/ZarU5Ujpx65otgojLGtKsaYo9w7Acs4
 vVOoKfls1eFHJtY4/8iuy1ZnXdyaQIfMjVWFw9P84ViFL+ZKIv7sdN22POGDosLwvHHs
 pLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4TVKvwfAR1D9CGU5hfJk9qLIspo/mBQMGeGLnlUXBHo=;
 b=huuMIGfXRw7ofBrS06u94TCxqxEXZxk9FF/qSFI7UQKOPZViLD7wU8VV07zqqXQeKW
 erwx6TYqz4PQHzjVToE1jDfXZ/C8bL3zKalaZMjfOtG8ERyC81oMYs+vp1snMtkcrK/v
 cy4yOVrf0oSX3ZTeAKarW+7MyWHMQDa5zeih9l6G9bFsLra07RB9NZzXBwJlCp0JeYCB
 AwWsUPGFN711dVyehhYzchGYowfIZ5xDMNjhzadQMaNqOfIreJOfNNtfHY7oJ7vf5KAm
 l7Bg+3JmWi/yc2pTIDirGdKVPtbEk/tcRt0Agh24fTrCUesrpFlN+bYvKUheLjcbeCx/
 Nr3Q==
X-Gm-Message-State: AOAM532xXwyqOiy0dnoNXNacopp5kOsEMw+3ZGtONpP/XbyB4Vfp61Oh
 uRnrOtAxadnkJ+DEj6nGxdjoLoGnE0/5LFBip05n+g==
X-Google-Smtp-Source: ABdhPJzFt2+qv728FrylY3DS6G9OQcnTeZbneKKZFjRQHnC35ubSdx2ePAXnujrh0iXaw2HjO6KPWcLw0IW4E/kiQSU=
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr4637642pjb.222.1619626798043; 
 Wed, 28 Apr 2021 09:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <1617847624-53611-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1617847624-53611-1-git-send-email-tiantao6@hisilicon.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 28 Apr 2021 18:19:47 +0200
Message-ID: <CAG3jFysa2yzGnVKaPYfn9_XOpqzoYPa2HM3Y9ChDQWQoAFko8w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: simplify devm_drm_panel_bridge_add_typed
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yicong Yang <yangyicong@hisilicon.com>, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: multipart/mixed; boundary="===============0827058210=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0827058210==
Content-Type: multipart/alternative; boundary="000000000000f76bb405c10abf72"

--000000000000f76bb405c10abf72
Content-Type: text/plain; charset="UTF-8"

Hey Tian,

Thanks for having a look at cleanup patches.

On Thu, 8 Apr 2021 at 04:06, Tian Tao <tiantao6@hisilicon.com> wrote:

> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/gpu/drm/bridge/panel.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c
> b/drivers/gpu/drm/bridge/panel.c
> index c916f4b..e5ddefb 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -250,11 +250,9 @@ void drm_panel_bridge_remove(struct drm_bridge
> *bridge)
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_remove);
>
> -static void devm_drm_panel_bridge_release(struct device *dev, void *res)
> +static void devm_drm_panel_bridge_release(void *bridge)
>  {
> -       struct drm_bridge **bridge = res;
> -
> -       drm_panel_bridge_remove(*bridge);
> +       drm_panel_bridge_remove(bridge);
>  }
>
>  /**
> @@ -295,20 +293,17 @@ struct drm_bridge
> *devm_drm_panel_bridge_add_typed(struct device *dev,
>                                                    struct drm_panel *panel,
>                                                    u32 connector_type)
>  {
> -       struct drm_bridge **ptr, *bridge;
> -
> -       ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
> -                          GFP_KERNEL);
> -       if (!ptr)
> -               return ERR_PTR(-ENOMEM);
> +       struct drm_bridge *bridge;
> +       int ret;
>
>         bridge = drm_panel_bridge_add_typed(panel, connector_type);
> -       if (!IS_ERR(bridge)) {
> -               *ptr = bridge;
> -               devres_add(dev, ptr);
> -       } else {
> -               devres_free(ptr);
> -       }
> +       if (IS_ERR(bridge))
> +               return bridge;
> +
> +       ret = devm_add_action_or_reset(dev, devm_drm_panel_bridge_release,
> +                                      bridge);
> +       if (ret)
> +               return ERR_PTR(ret);
>
>         return bridge;
>  }
>
>
I'm not crazy about this change. In my mind it is harder to read &
understand than the current solution. If anyone else feels otherwise, I'm
open to have my mind changed.


Rob.

--000000000000f76bb405c10abf72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hey Tian,<br></div><br></div><div>Th=
anks for having a look at cleanup patches.<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 8 Apr 2021 at 04:06, =
Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com">tiantao6@hisilicon.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Use devm_add_action_or_reset() instead of devres_alloc() and<br>
devres_add(), which works the same. This will simplify the<br>
code. There is no functional changes.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Yicong Yang &lt;<a href=3D"mailto:yangyicong@hisilicon.com" =
target=3D"_blank">yangyicong@hisilicon.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/panel.c | 27 +++++++++++----------------<br>
=C2=A01 file changed, 11 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.=
c<br>
index c916f4b..e5ddefb 100644<br>
--- a/drivers/gpu/drm/bridge/panel.c<br>
+++ b/drivers/gpu/drm/bridge/panel.c<br>
@@ -250,11 +250,9 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge=
)<br>
=C2=A0}<br>
=C2=A0EXPORT_SYMBOL(drm_panel_bridge_remove);<br>
<br>
-static void devm_drm_panel_bridge_release(struct device *dev, void *res)<b=
r>
+static void devm_drm_panel_bridge_release(void *bridge)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge **bridge =3D res;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_bridge_remove(*bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_bridge_remove(bridge);<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -295,20 +293,17 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(st=
ruct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_panel *panel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 connector_type)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge **ptr, *bridge;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D devres_alloc(devm_drm_panel_bridge_rele=
ase, sizeof(*ptr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ptr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENO=
MEM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge *bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge =3D drm_panel_bridge_add_typed(panel, co=
nnector_type);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(bridge)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr =3D bridge;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devres_add(dev, ptr=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devres_free(ptr);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(bridge))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bridge;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_add_action_or_reset(dev, devm_drm_=
panel_bridge_release,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(ret)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bridge;<br>
=C2=A0}<br><br></blockquote><div>=C2=A0</div><div>I&#39;m not crazy about t=
his change. In my mind it is harder to read &amp; understand than the curre=
nt solution. If anyone else feels otherwise, I&#39;m open to have my mind c=
hanged.<br><br><br></div><div>Rob.<br></div></div></div>

--000000000000f76bb405c10abf72--

--===============0827058210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0827058210==--
