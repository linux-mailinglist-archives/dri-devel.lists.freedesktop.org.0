Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F7D78BB7C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 01:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542EC10E0F5;
	Mon, 28 Aug 2023 23:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C0F10E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 23:28:00 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4cbso404764a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693265279; x=1693870079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5TWzEPy7n/hJTzvwMksJzXheL1K4sP/ALkXhLWvcN+w=;
 b=Zx/O856yYntfnHXu1w0z8eQV8peBxmz2Jwpit3J9IRCJOV5Kn8KE7TIlwpt0VsmIiX
 H/K6ZsYGJ8bYtBwl6TIDFPn/4Hsae+7BnLLo/3phsjvQ049gje/G7VGa6F0Dt1O9gs2k
 fDBjXGy7oXusHFVNHeWLG/RUVEcu3vEHPjHQW8CHs7oJh9H74dWiyRTOAaDWegus7AFN
 sRuhmYCsk3RUH7+JyNjPmbK0pUtdkv6Z463WiY6kzCczJP3XbwEIo5+dvDIaheG69lTn
 Iw2v/m8jM88erwt5UBJeimd2A48OlSqsGoD42oQ3eOr584gnls33fgSSOdMRpYl/vfcU
 +dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693265279; x=1693870079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5TWzEPy7n/hJTzvwMksJzXheL1K4sP/ALkXhLWvcN+w=;
 b=dUnQkcf/DVWOfg/K4UOPSjC0d0ss7BZhi/G2bWVfsaXNVRvqQOVI6I1uVL+bjnrj+g
 SSylMRF1D0zTbU6j6z+Dq+tn67JJvV1km+Su89bWxcKwbdEGq7hwHYp62NLN1r31/XfZ
 GLQP3j7pUtfRARz6oiHpcMKS4cWmgCWebl3lm6wfIOnYrioCmgsFOUqZQg0Ey9VGoysX
 rIEuUhG8l8YHtdY0BL8oeTbfcbKTT+tdvmviCsYgB3+ZubJ7oGpVZB6Epopyj3ef7QB2
 eLra6I5NSVyJpJF5ZHJFsSoJ3UMhRv6So60zFkurfmAPl4aZWXNzq0+1GEIeUvRV+nP6
 Xpgg==
X-Gm-Message-State: AOJu0YxIaOW4rVppnI8n176h8iYhB+a2jXBZLD63V2uovb1gzTHu6Xfh
 0YACvVHedlq4Gwdj7ITIfGJ99uWjCkhdl8nVFy4=
X-Google-Smtp-Source: AGHT+IHRoiwRSinTgL2coE8VHY/Wu1FLKUVJCsgSP9s6pGoAppuLnA4Eb03+Fp7w5RedAaxJH2236EuWtEOYPxy6VL4=
X-Received: by 2002:a50:ec8c:0:b0:525:4471:6b59 with SMTP id
 e12-20020a50ec8c000000b0052544716b59mr22414447edr.7.1693265278715; Mon, 28
 Aug 2023 16:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230812062748.2223414-1-xiangyang@huaweicloud.com>
In-Reply-To: <20230812062748.2223414-1-xiangyang@huaweicloud.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Aug 2023 08:27:46 +0900
Message-ID: <CAAQKjZPOh69=_fxmW0ePYM6c5aaqjNTB1=gVpL1=pR_-bx8C9g@mail.gmail.com>
Subject: Re: [PATCH -next] drm/exynos: fix a potential error pointer
 dereference
To: Xiang Yang <xiangyang@huaweicloud.com>
Content-Type: multipart/alternative; boundary="00000000000072cd3e0604040bbf"
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
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, xiangyang3@huawei.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000072cd3e0604040bbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 8=EC=9B=94 12=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 4:17, X=
iang Yang <xiangyang@huaweicloud.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> From: Xiang Yang <xiangyang3@huawei.com>
>
> Smatch reports the warning below:
> drivers/gpu/drm/exynos/exynos_hdmi.c:1864 hdmi_bind()
> error: 'crtc' dereferencing possible ERR_PTR()
>
> The return value of exynos_drm_crtc_get_by_type maybe ERR_PTR(-ENODEV),
> which can not be used directly. Fix this by checking the return value
> before using it.
>

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index f3aaa4ea3e68..dd9903eab563 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1861,6 +1861,8 @@ static int hdmi_bind(struct device *dev, struct
> device *master, void *data)
>                 return ret;
>
>         crtc =3D exynos_drm_crtc_get_by_type(drm_dev,
> EXYNOS_DISPLAY_TYPE_HDMI);
> +       if (IS_ERR(crtc))
> +               return PTR_ERR(crtc);
>         crtc->pipe_clk =3D &hdata->phy_clk;
>
>         ret =3D hdmi_create_connector(encoder);
> --
> 2.34.1
>
>

--00000000000072cd3e0604040bbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 8=EC=9B=94 12=EC=9D=BC (=ED=86=A0) =EC=
=98=A4=ED=9B=84 4:17, Xiang Yang &lt;<a href=3D"mailto:xiangyang@huaweiclou=
d.com">xiangyang@huaweicloud.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: Xiang Yang &lt;<a href=
=3D"mailto:xiangyang3@huawei.com" target=3D"_blank" rel=3D"noreferrer">xian=
gyang3@huawei.com</a>&gt;<br>
<br>
Smatch reports the warning below:<br>
drivers/gpu/drm/exynos/exynos_hdmi.c:1864 hdmi_bind()<br>
error: &#39;crtc&#39; dereferencing possible ERR_PTR()<br>
<br>
The return value of exynos_drm_crtc_get_by_type maybe ERR_PTR(-ENODEV),<br>
which can not be used directly. Fix this by checking the return value<br>
before using it.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Applied.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks,</div><div dir=3D"auto">Inki Dae</div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Xiang Yang &lt;<a href=3D"mailto:xiangyang3@huawei.com" targ=
et=3D"_blank" rel=3D"noreferrer">xiangyang3@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/=
exynos_hdmi.c<br>
index f3aaa4ea3e68..dd9903eab563 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
@@ -1861,6 +1861,8 @@ static int hdmi_bind(struct device *dev, struct devic=
e *master, void *data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 crtc =3D exynos_drm_crtc_get_by_type(drm_dev, E=
XYNOS_DISPLAY_TYPE_HDMI);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(crtc))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(crtc=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 crtc-&gt;pipe_clk =3D &amp;hdata-&gt;phy_clk;<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D hdmi_create_connector(encoder);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div></div>

--00000000000072cd3e0604040bbf--
