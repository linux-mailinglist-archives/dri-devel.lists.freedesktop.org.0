Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6972799A74
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 20:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7528B10E2B5;
	Sat,  9 Sep 2023 18:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3112610E2B5;
 Sat,  9 Sep 2023 18:50:18 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6c0d6fef60cso328313a34.1; 
 Sat, 09 Sep 2023 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694285417; x=1694890217; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nv0vcCCJDOY8Szl35YHmMKgpvY2yGh3tSM+jeI3FBcM=;
 b=sTljuJevE7qRzqrX5Zbw28FsJBvQGZljhVpb0U9DAovXKt4iUknnps7Cd7G36k+4oT
 f11oFUHm3pGGf6nK/0Br7GqdHEgyNQobw6YyGGlzL3XPQifqTCgANNvNL2cMjHDq+eyN
 Xc0/PEqv5+gHtxB9MBkx084UXRGVuXZQz80tnvktjeTkAZimfd3dxr7uLkfjRNHffIBS
 dz1ixEmWujl7sZ6FPTU+xeBfqYhDu6L5Gsj6w98fCc1CbIE0eOTHnNR48HR+IQoSwJ3F
 WB6yQiVCmvX8wn4UpIWbcLSE6AAikiExzhuLo754OcEMStaTx3d2Ngusz40zERsER9vg
 Fpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694285417; x=1694890217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nv0vcCCJDOY8Szl35YHmMKgpvY2yGh3tSM+jeI3FBcM=;
 b=U5vj5GLyXRGeV9YtOdz5vxqVBe8PSsG9Sg2/EkSmtFUQlm7jtEce8FZXdZdzn1GjT+
 Of6BPJxJrrFG372aFgntBrnTWDgqg8QVllapQYzgQXw3SgHPFtlWcXdLSNz1QQ/VDCY+
 Muammb9egThEcrtCAUcje77JzLpL4cItO5HB6+ont4LfY5zgkuR+bnTWoWAkvsI36Gwv
 HXw7e/vtZ2c7FrItoMNaE/RpGglRQAGS+BTwy7sp0w/rLYCsIQNXiECe0wHvuJ4fcn48
 7qflqfbqsSorjqXEDjxT4ZI1rD/fKtix6kHP+pK52gMsz1G7eFdlistHp9H/jrdumWHI
 imvQ==
X-Gm-Message-State: AOJu0YxB2aCpmUk3gWLIwm5UqieNEFGnNCq4LCI81WkCD2vUTe6tloGw
 rINCBM4sKKLyXgNtwFOvDgc8H1y0p1/njN7lhrA=
X-Google-Smtp-Source: AGHT+IFtlOuD8768hs11Km4XKjNPDJumEzUz1mMxrEHw0y2XOfxyB39SRGHtFBVt4Vc4W1me+uBANkghT88Pcj9+k2s=
X-Received: by 2002:a05:6870:8a2a:b0:1bb:3f64:bb89 with SMTP id
 p42-20020a0568708a2a00b001bb3f64bb89mr7056188oaq.24.1694285417159; Sat, 09
 Sep 2023 11:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
 <20230801110239.831099-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230801110239.831099-3-u.kleine-koenig@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 9 Sep 2023 20:49:35 +0200
Message-ID: <CAH9NwWdzVPrZD3Uo04fWXR0Cv=okK+P+njAR81gprCxKqp5icw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] drm/etnaviv: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: multipart/alternative; boundary="0000000000007020ea0604f190b0"
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007020ea0604f190b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> schrieb am Di., 1. A=
ug.
2023, 13:02:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert the etnaviv drm driver from always returning zero in
> the remove callback to the void returning variant.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>


Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>



---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 ++----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 ++---
>  2 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index ea55f6b7b744..20305df01b57 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -638,16 +638,14 @@ static int etnaviv_pdev_probe(struct platform_devic=
e
> *pdev)
>         return component_master_add_with_match(dev, &etnaviv_master_ops,
> match);
>  }
>
> -static int etnaviv_pdev_remove(struct platform_device *pdev)
> +static void etnaviv_pdev_remove(struct platform_device *pdev)
>  {
>         component_master_del(&pdev->dev, &etnaviv_master_ops);
> -
> -       return 0;
>  }
>
>  static struct platform_driver etnaviv_platform_driver =3D {
>         .probe      =3D etnaviv_pdev_probe,
> -       .remove     =3D etnaviv_pdev_remove,
> +       .remove_new =3D etnaviv_pdev_remove,
>         .driver     =3D {
>                 .name   =3D "etnaviv",
>         },
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index bbc9c54871f4..43426ffe4d77 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1892,11 +1892,10 @@ static int etnaviv_gpu_platform_probe(struct
> platform_device *pdev)
>         return 0;
>  }
>
> -static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
> +static void etnaviv_gpu_platform_remove(struct platform_device *pdev)
>  {
>         component_del(&pdev->dev, &gpu_ops);
>         pm_runtime_disable(&pdev->dev);
> -       return 0;
>  }
>
>  static int etnaviv_gpu_rpm_suspend(struct device *dev)
> @@ -1954,6 +1953,6 @@ struct platform_driver etnaviv_gpu_driver =3D {
>                 .of_match_table =3D etnaviv_gpu_match,
>         },
>         .probe =3D etnaviv_gpu_platform_probe,
> -       .remove =3D etnaviv_gpu_platform_remove,
> +       .remove_new =3D etnaviv_gpu_platform_remove,
>         .id_table =3D gpu_ids,
>  };
> --
> 2.39.2
>
>

--0000000000007020ea0604f190b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Uwe Kleine-K=C3=B6nig &lt;<a href=3D"mailto:u.kleine-k=
oenig@pengutronix.de">u.kleine-koenig@pengutronix.de</a>&gt; schrieb am Di.=
, 1. Aug. 2023, 13:02:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The .remove(=
) callback for a platform driver returns an int which makes<br>
many driver authors wrongly assume it&#39;s possible to do error handling b=
y<br>
returning an error code. However the value returned is (mostly) ignored<br>
and this typically results in resource leaks. To improve here there is a<br=
>
quest to make the remove callback return void. In the first step of this<br=
>
quest all drivers are converted to .remove_new() which already returns<br>
void.<br>
<br>
Trivially convert the etnaviv drm driver from always returning zero in<br>
the remove callback to the void returning variant.<br>
<br>
Reviewed-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" t=
arget=3D"_blank" rel=3D"noreferrer">tzimmermann@suse.de</a>&gt;<br>
Reviewed-by: Jyri Sarha &lt;<a href=3D"mailto:jyri.sarha@iki.fi" target=3D"=
_blank" rel=3D"noreferrer">jyri.sarha@iki.fi</a>&gt;<br>
Signed-off-by: Uwe Kleine-K=C3=B6nig &lt;<a href=3D"mailto:u.kleine-koenig@=
pengutronix.de" target=3D"_blank" rel=3D"noreferrer">u.kleine-koenig@pengut=
ronix.de</a>&gt;<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Christian Gmeiner =
&lt;<a href=3D"mailto:cgmeiner@igalia.com">cgmeiner@igalia.com</a>&gt;</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 ++----<br>
=C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 ++---<br>
=C2=A02 files changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnavi=
v/etnaviv_drv.c<br>
index ea55f6b7b744..20305df01b57 100644<br>
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c<br>
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c<br>
@@ -638,16 +638,14 @@ static int etnaviv_pdev_probe(struct platform_device =
*pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return component_master_add_with_match(dev, &am=
p;etnaviv_master_ops, match);<br>
=C2=A0}<br>
<br>
-static int etnaviv_pdev_remove(struct platform_device *pdev)<br>
+static void etnaviv_pdev_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_master_del(&amp;pdev-&gt;dev, &amp;et=
naviv_master_ops);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static struct platform_driver etnaviv_platform_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =3D etnaviv_pdev_pro=
be,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0=3D etnaviv_pdev_rem=
ove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new =3D etnaviv_pdev_remove,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0 =C2=A0=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0=
=3D &quot;etnaviv&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c<br>
index bbc9c54871f4..43426ffe4d77 100644<br>
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c<br>
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c<br>
@@ -1892,11 +1892,10 @@ static int etnaviv_gpu_platform_probe(struct platfo=
rm_device *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static int etnaviv_gpu_platform_remove(struct platform_device *pdev)<br>
+static void etnaviv_gpu_platform_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component_del(&amp;pdev-&gt;dev, &amp;gpu_ops);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int etnaviv_gpu_rpm_suspend(struct device *dev)<br>
@@ -1954,6 +1953,6 @@ struct platform_driver etnaviv_gpu_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 etnaviv_gpu_match,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe =3D etnaviv_gpu_platform_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D etnaviv_gpu_platform_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove_new =3D etnaviv_gpu_platform_remove,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .id_table =3D gpu_ids,<br>
=C2=A0};<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--0000000000007020ea0604f190b0--
