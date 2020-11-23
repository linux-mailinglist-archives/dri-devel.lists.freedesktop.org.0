Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B72C1F7F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526036E22B;
	Tue, 24 Nov 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDE8897C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 15:52:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so3249054wrn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 07:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FjYKtEXcBbCZ6/MbYZM9XmkyRoRkx/KzcRJbk79i4sI=;
 b=zsA/Kq8rvkY2W8nTxtXe4NjxMKB1/IcwQzyUhDPXPvb+In4LgnjHwVmHUNGvER/hYA
 roY6+Co9ZpF90EJQX8Pji1GurRdsH7+/j2RwVIDXEpbZQJ/2nF55XAmZSoNK6gsigvyD
 rY3HtRCV6BpkfCMaI+ocp8ybWXDjzpezZeWHI3O8Kp46po7mbmOv9w8C+/JaEyTdd/Ue
 aZFHaxdQIdy3JDQmRvTpzRS2Q6uQVZoZl+I1iUx+EsrUREw5bSDDggZCy3lx11UN1bb4
 X3EC9mqcNlWBd285AmAkTGO0BhkJ+DnIgbE7OHvrZ0TnpCxVRC0Q+ZJ3S5JRY9R4qPiC
 swWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FjYKtEXcBbCZ6/MbYZM9XmkyRoRkx/KzcRJbk79i4sI=;
 b=CfbaFE1tzWv+zIgqWT2S1z+fkeqP9NlhQlKfcSb926bVt456uVojFuZmSqHLTnZKTI
 ePFmZvsiy5zPogCKdW2Wy7SHHaoVOMLgJL6V/+qepFBduxbJs2wnz0/SdOSQQMNVTAZi
 T1O6cIweuMWQICPUf5g+zECMbvuWU+oVYKJ6L/+U0eXU/4/orM5q5OhzTSHe+QUhL3c9
 N7ZZYbUhxqMKoORfoldqjJS8gfHBSDF/fFmV7jolFIBB3m4omY4elNF/mD02LaK2bjgZ
 7P/UwzFp6copx654RPPWOheIAN46u8SailHWvmS44j5dkPrpyDEbL2BbiBHSEzHuEVw6
 u6kQ==
X-Gm-Message-State: AOAM530dgSrONw3XNyCNI4JFj70fPvq8p+t886dUlomTZPrPcNYeBM1B
 B7DSFIhOTpTo87dAZgAl2rmGAO7R1XBUMTwLb0/xcA==
X-Google-Smtp-Source: ABdhPJwDFXkVAmEEzDzQJi7TZh5WMlr6MZkPoxq7oYrlWXDQgXiH3RBf9yWiHxpPnNaudMC9BgsGypwqQzb7ltPoVu8=
X-Received: by 2002:adf:8028:: with SMTP id 37mr282887wrk.111.1606146763502;
 Mon, 23 Nov 2020 07:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20201123104616.1412688-1-robert.foss@linaro.org>
In-Reply-To: <20201123104616.1412688-1-robert.foss@linaro.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Mon, 23 Nov 2020 10:04:17 -0600
Message-ID: <CA+_Aqisu48D8M57qspasD8MD=we=JHjpF54iYZTsD0nN8gC_EQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt9611: Fix handling of 4k panels
To: Robert Foss <robert.foss@linaro.org>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Alistair Delva <adelva@google.com>, jernej.skrabec@siol.net,
 Vinod Koul <vinod.koul@linaro.org>, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Peter Collingbourne <pcc@google.com>
Content-Type: multipart/mixed; boundary="===============0126171046=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0126171046==
Content-Type: multipart/alternative; boundary="0000000000004bd19205b4c82f19"

--0000000000004bd19205b4c82f19
Content-Type: text/plain; charset="UTF-8"

I just tested on non 4k display. Looks good to me.

On Mon, 23 Nov 2020 at 04:46, Robert Foss <robert.foss@linaro.org> wrote:

> 4k requires two dsi pipes, so don't report MODE_OK when only a
> single pipe is configured. But rather report MODE_PANEL to
> signal that requirements of the panel are not being met.
>
> Reported-by: Peter Collingbourne <pcc@google.com>
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
>
Tested-by: Anibal Limon <anibal.limon@linaro.org>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c
> b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index d734d9402c35..e8eb8deb444b 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -867,8 +867,14 @@ static enum drm_mode_status
> lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>                                                      const struct
> drm_display_mode *mode)
>  {
>         struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> +       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>
> -       return lt9611_mode ? MODE_OK : MODE_BAD;
> +       if (!lt9611_mode)
> +               return MODE_BAD;
> +       else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +               return MODE_PANEL;
> +       else
> +               return MODE_OK;
>  }
>
>  static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> --
> 2.27.0
>
>

--0000000000004bd19205b4c82f19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I just tested on non 4k display. Looks go=
od to me.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, 23 Nov 2020 at 04:46, Robert Foss &lt;<a href=3D"mailto:ro=
bert.foss@linaro.org">robert.foss@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">4k requires two dsi pipes, so d=
on&#39;t report MODE_OK when only a<br>
single pipe is configured. But rather report MODE_PANEL to<br>
signal that requirements of the panel are not being met.<br>
<br>
Reported-by: Peter Collingbourne &lt;<a href=3D"mailto:pcc@google.com" targ=
et=3D"_blank">pcc@google.com</a>&gt;<br>
Suggested-by: Peter Collingbourne &lt;<a href=3D"mailto:pcc@google.com" tar=
get=3D"_blank">pcc@google.com</a>&gt;<br>
Signed-off-by: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org" ta=
rget=3D"_blank">robert.foss@linaro.org</a>&gt;<br>
Tested-by: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org" target=
=3D"_blank">john.stultz@linaro.org</a>&gt;<br></blockquote><div>Tested-by: =
Anibal Limon &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@li=
naro.org</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/brid=
ge/lontium-lt9611.c<br>
index d734d9402c35..e8eb8deb444b 100644<br>
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c<br>
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c<br>
@@ -867,8 +867,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(s=
truct drm_bridge *bridge,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_mode *mod=
e)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct lt9611_mode *lt9611_mode =3D lt9611_find=
_mode(mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lt9611 *lt9611 =3D bridge_to_lt9611(brid=
ge);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return lt9611_mode ? MODE_OK : MODE_BAD;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lt9611_mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_BAD;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (lt9611_mode-&gt;intfs &gt; 1 &amp;&amp=
; !lt9611-&gt;dsi1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_PANEL;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
=C2=A0}<br>
<br>
=C2=A0static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div>

--0000000000004bd19205b4c82f19--

--===============0126171046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0126171046==--
