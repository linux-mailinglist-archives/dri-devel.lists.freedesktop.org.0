Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DEB693FAB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6147210E4B9;
	Mon, 13 Feb 2023 08:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BBD10E041
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:09:52 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id g14so13538886ljh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 23:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lessconfused.com; s=lessconfused;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/XuF5Z2cxNayLQxIBEgUgdEIsqXVsD/YamArV6/hcV4=;
 b=bOU4YnIRLT7x5OMfusyjd7p+e+YS/7Se6zC4BKrfdQ54OyeF1MiGB9POMnrel1YHU9
 684WV6UI6VmSm1NfXx+efMffg5PIHLJM1+Tl6WuGRzbEmUTA6W249zRv/H2+C2c4c4L4
 F+dwLDL5uxMghDEN+VDW1I+ha5hfWGWKhrcr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XuF5Z2cxNayLQxIBEgUgdEIsqXVsD/YamArV6/hcV4=;
 b=rsp0ha8mGw84q9/y/8I4uujfIJmT4UUk90LjDcK80b5BGRKYFMSmTtwwDo8iMURItq
 KVJ5O7WDp9+ekVnMhnukjji7Uq9Uc5UnJ0m+VkPwuvcRYL6xsyq0WBCuiJiFWN01JXBx
 RFlVtNaCTk7BD+Axw9H2OiFrni5R9xE0oUk3cAZ7pHETzl+WPSw5ma3OkMLQ/8TBYKj6
 Tvg2GObqdqjraDEcgRvxGS1tIaO6IWNC+Vq5CFpuE7mmVpdRdb35qQpnXHvVmme2MZXC
 3ZCHVug64wrxmIkVNhgcYh7IZYEPhq3HA9QFw1ewA8AASkYc8vMQNN6CK2rfMEUbZMeN
 LG+g==
X-Gm-Message-State: AO0yUKVI8xyGPqxATM2FkgdgbpxFblCCUm1HL2wkNMVJoukhUg/3C7Zt
 ApZpbyQ/WlUckArhfZ7maljTk1el0gBBw+AsgfwB2w==
X-Google-Smtp-Source: AK7set+/cmCRQTe7iwwZ0gcqLti/IgupRyrEVBbMcMq9Jq75FjiGP8ZCNH88xGvUURbAPfo6TZcb4+tAiJsvys2Ytbw=
X-Received: by 2002:a2e:2245:0:b0:293:4eca:6d8 with SMTP id
 i66-20020a2e2245000000b002934eca06d8mr673569lji.130.1676272190357; Sun, 12
 Feb 2023 23:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com>
In-Reply-To: <20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Mon, 13 Feb 2023 00:09:39 -0700
Message-ID: <CACdvmAgKrRMdX+R0nScGwazq7C=f=B_k-2w-ONk_iCyM_XAnSA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson/meson_venc: Relax the supported mode checks
To: Carlo Caione <ccaione@baylibre.com>
Content-Type: multipart/alternative; boundary="0000000000007410e005f48f880c"
X-Mailman-Approved-At: Mon, 13 Feb 2023 08:33:16 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007410e005f48f880c
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 3:56 AM Carlo Caione <ccaione@baylibre.com> wrote:

> Relax a bit the supported modes list by including also 480x1920. This
> was actually tested on real hardware and it works correctly.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> drm/meson/meson_venc: Add more supported resolutions.
>
> In particular relax the resolution checks to allow more resolutions like
> 480x1920.
>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Kevin Hilman <khilman@baylibre.com>
> To: Jerome Brunet <jbrunet@baylibre.com>
> To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/meson/meson_venc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_venc.c
> b/drivers/gpu/drm/meson/meson_venc.c
> index 3c55ed003359..5b3621589a9f 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct
> drm_display_mode *mode)
>                             DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
>                 return MODE_BAD;
>
> -       if (mode->hdisplay < 640 || mode->hdisplay > 1920)
> +       if (mode->hdisplay < 480 || mode->hdisplay > 1920)
>                 return MODE_BAD_HVALUE;
>
> -       if (mode->vdisplay < 480 || mode->vdisplay > 1200)
> +       if (mode->vdisplay < 480 || mode->vdisplay > 1920)
>                 return MODE_BAD_VVALUE;
>
Should these be lowered to 400 instead of 480?


>         return MODE_OK;
>
> ---
> base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
> change-id: 20230210-relax_dmt_limits-355e2a1c7ccf
>
> Best regards,
> --
> Carlo Caione
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>

--0000000000007410e005f48f880c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Feb 10, 2023, 3:56 AM Carlo Caione &lt;<a href=3D"mail=
to:ccaione@baylibre.com">ccaione@baylibre.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Relax a bit the supported modes list by including=
 also 480x1920. This<br>
was actually tested on real hardware and it works correctly.<br>
<br>
Signed-off-by: Carlo Caione &lt;<a href=3D"mailto:ccaione@baylibre.com" tar=
get=3D"_blank" rel=3D"noreferrer">ccaione@baylibre.com</a>&gt;<br>
---<br>
drm/meson/meson_venc: Add more supported resolutions.<br>
<br>
In particular relax the resolution checks to allow more resolutions like<br=
>
480x1920.<br>
<br>
To: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linaro.org" target=
=3D"_blank" rel=3D"noreferrer">neil.armstrong@linaro.org</a>&gt;<br>
To: David Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">airlied@gmail.com</a>&gt;<br>
To: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank" =
rel=3D"noreferrer">daniel@ffwll.ch</a>&gt;<br>
To: Kevin Hilman &lt;<a href=3D"mailto:khilman@baylibre.com" target=3D"_bla=
nk" rel=3D"noreferrer">khilman@baylibre.com</a>&gt;<br>
To: Jerome Brunet &lt;<a href=3D"mailto:jbrunet@baylibre.com" target=3D"_bl=
ank" rel=3D"noreferrer">jbrunet@baylibre.com</a>&gt;<br>
To: Martin Blumenstingl &lt;<a href=3D"mailto:martin.blumenstingl@googlemai=
l.com" target=3D"_blank" rel=3D"noreferrer">martin.blumenstingl@googlemail.=
com</a>&gt;<br>
Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank" re=
l=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br>
Cc: <a href=3D"mailto:linux-amlogic@lists.infradead.org" target=3D"_blank" =
rel=3D"noreferrer">linux-amlogic@lists.infradead.org</a><br>
Cc: <a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blan=
k" rel=3D"noreferrer">linux-arm-kernel@lists.infradead.org</a><br>
Cc: <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank" rel=
=3D"noreferrer">linux-kernel@vger.kernel.org</a><br>
---<br>
=C2=A0drivers/gpu/drm/meson/meson_venc.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/mes=
on_venc.c<br>
index 3c55ed003359..5b3621589a9f 100644<br>
--- a/drivers/gpu/drm/meson/meson_venc.c<br>
+++ b/drivers/gpu/drm/meson/meson_venc.c<br>
@@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_displ=
ay_mode *mode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MODE_BAD;<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;hdisplay &lt; 640 || mode-&gt;hdis=
play &gt; 1920)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;hdisplay &lt; 480 || mode-&gt;hdis=
play &gt; 1920)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MODE_BAD_HVA=
LUE;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;vdisplay &lt; 480 || mode-&gt;vdis=
play &gt; 1200)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;vdisplay &lt; 480 || mode-&gt;vdis=
play &gt; 1920)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MODE_BAD_VVA=
LUE;<br></blockquote></div></div><div dir=3D"auto">Should these be lowered =
to 400 instead of 480?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MODE_OK;<br>
<br>
---<br>
base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6<br>
change-id: 20230210-relax_dmt_limits-355e2a1c7ccf<br>
<br>
Best regards,<br>
-- <br>
Carlo Caione<br>
<br>
_______________________________________________<br>
linux-amlogic mailing list<br>
<a href=3D"mailto:linux-amlogic@lists.infradead.org" target=3D"_blank" rel=
=3D"noreferrer">linux-amlogic@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-amlogic" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://lists.infradead.org/mai=
lman/listinfo/linux-amlogic</a><br>
</blockquote></div></div></div>

--0000000000007410e005f48f880c--
