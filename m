Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A415BC5F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60616F599;
	Thu, 13 Feb 2020 10:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AA66E1BC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:09:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so5951635wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 02:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SEvt70Ca1HVG0t7g6Cd+sDE9YQbxfdm7J3k5CjzWz8A=;
 b=zR62BSHdAkk4WPI+7HrsaEmhbV+0Ehl22icKdyyG9a22oOTZsYp4lsmbis8CPx57yZ
 +Ij9G4xmPiWz6K/gAldDHMtAv5X3V2m81Dm13jBSv73GBfk2ll1FRQm/gcJsYzQArKNR
 XFrSPMgRo5/1FSFf8vyzkqAFNuZAt+/1QcGhY7K7MbAWEp49aw4UHzbzGBl6ste/yzCB
 duvN/YTQcx52jo2rr8oXsRC73nLlioOWMoqKyzEdH6b6DVv7zQjDrVoXC1dF85iKHft2
 jnFQn81vtNcQ7TEowb3YxYgf9buHLrKnvVa0Wj4/H8fh8YjpHrp40D8egoFq4g0PCnLW
 rN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SEvt70Ca1HVG0t7g6Cd+sDE9YQbxfdm7J3k5CjzWz8A=;
 b=Bs/ixuMsJYJ8MR+IxP6nQPgxAFtZaYwmLEgy2pA9wiVDnrV07/e1w0dQrGevI3hOGh
 UlVyvZPn5ryiUi+e60z/yAHUX9H0gD9+bjgGALniAYYQcP7vPyuiJO/SoJkwGb2VrQG7
 vzkg5OVT5b9jPDq1vgPARcMEtc1zf02M6Mge7rStZPtXcaumvggDqycAbskVlWOQFm5B
 HjqimW60MsgEr71rKoaLuvumzz08OhwElBruoQ6+kIpXXvYo4FONxiDL/ZplZXYAA460
 5fsOm5mN6bVoNThdjpatSJxLNDX1fyP50cwDglA8Mb6No5/Zx8XoXVXVaJFUqyNkNphZ
 7k8Q==
X-Gm-Message-State: APjAAAUvBkt0bRnD7eOG7vVZ/9w34DGGWoym9d08YSsntp9vEPejJQvy
 kXKmgCodWId/E+r1Gl//oIkfGcTwUeAwwjb2xrGzJA==
X-Google-Smtp-Source: APXvYqx0jjxXXgIlB0sHF45Yu1PkhxJ0HTxlyqSHWyN8razLAfTUbzLV33PnPinsSa7wTQctQFGKbzqCZiKOpAViJCQ=
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr5237278wmb.114.1581588583840; 
 Thu, 13 Feb 2020 02:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20191220023004.2658-1-chenzhihui4@huawei.com>
In-Reply-To: <20191220023004.2658-1-chenzhihui4@huawei.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 13 Feb 2020 18:09:32 +0800
Message-ID: <CAKoKPbx+3hcxQzT8ugm9gmd9+6x1z=i40r2=xW-2ou7NQT+khQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon/hibmc: fix 'xset dpms force off' fail
To: Zhihui Chen <chenzhihui4@huawei.com>
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
Cc: chenzhihui244@msn.com, puck.chen@hisilicon.com, baowenyi@huawei.com,
 dri-devel@lists.freedesktop.org, kong.kongxinwei@hisilicon.com,
 zourongrong@gmail.com, allan.wang@siliconmotion.com
Content-Type: multipart/mixed; boundary="===============2050869775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2050869775==
Content-Type: multipart/alternative; boundary="000000000000b89565059e724932"

--000000000000b89565059e724932
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Dec 2019 at 10:30, Zhihui Chen <chenzhihui4@huawei.com> wrote:

> both crtc_state->adjusted_mode.hdisplay and
> crtc_state->adjusted_mode.vdisplay are 0 when switch dpms off,
> return -EINVAL cause switch dpms off fail.
>
> Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
>

Thanks for the patch.
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>
Applied to drm-misc-next.


> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 6527a97f68a3..722e369f30d4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -80,6 +80,9 @@ static int hibmc_plane_atomic_check(struct drm_plane
> *plane,
>                 return -EINVAL;
>         }
>
> +       if (!crtc_state->enable)
> +               return 0;
> +
>         if (state->crtc_x + state->crtc_w >
>             crtc_state->adjusted_mode.hdisplay ||
>             state->crtc_y + state->crtc_h >
> --
> 2.20.1
>
>
>

--000000000000b89565059e724932
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 20 Dec 2019 at 10:30, Zhihui =
Chen &lt;<a href=3D"mailto:chenzhihui4@huawei.com">chenzhihui4@huawei.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">bo=
th crtc_state-&gt;adjusted_mode.hdisplay and<br>
crtc_state-&gt;adjusted_mode.vdisplay are 0 when switch dpms off,<br>
return -EINVAL cause switch dpms off fail.<br>
<br>
Signed-off-by: Zhihui Chen &lt;<a href=3D"mailto:chenzhihui4@huawei.com" ta=
rget=3D"_blank">chenzhihui4@huawei.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Thanks for the patch.<br>Acked-by: Xinliang Liu &lt;<a href=3D"mail=
to:xinliang.liu@linaro.org">xinliang.liu@linaro.org</a>&gt;<br>Applied to d=
rm-misc-next.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/d=
rm/hisilicon/hibmc/hibmc_drm_de.c<br>
index 6527a97f68a3..722e369f30d4 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
@@ -80,6 +80,9 @@ static int hibmc_plane_atomic_check(struct drm_plane *pla=
ne,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!crtc_state-&gt;enable)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (state-&gt;crtc_x + state-&gt;crtc_w &gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crtc_state-&gt;adjusted_mode.hdis=
play ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;crtc_y + state-&gt;crtc=
_h &gt;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000b89565059e724932--

--===============2050869775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2050869775==--
