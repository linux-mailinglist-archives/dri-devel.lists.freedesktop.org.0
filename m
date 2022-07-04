Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825DE566942
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBCA10F0A6;
	Tue,  5 Jul 2022 11:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D110E174
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 15:13:48 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k14so8808775plh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TPIzYnaPgv/PsyR4ebGMCuE/1FUiWioKVhkmAyvYp9Y=;
 b=SNvcjv7yNOvH9PwKt+3ZlQ/GzzEJ1jQ8/u1JX/74orZNGiqGEyot32D/wMY16968oR
 JmFgZ0UEYcdBhJGYZAtQR3Bff0gRKFC+ZFcyfLDzf4d1iWP8HjkLZVWYX46nWmmgpG9N
 IdaO6IG7XnmBAJztKA1K9uAjL30N6mtBHQehgQEmK5cuXA/UScsBv+XJrCEAgtpmqZse
 pSLog5QctIwT6U+uT0HOVM2RcbyEsS2E9s3tnrx8edLA4wIFRqvDZmR8kGeol2enxaMd
 tIgkZ/l3iuqGQ0486OATJDvsxVcqKXU8iXJFJh3GOJHS82VegTNdvyPR+U/58lxQBAdv
 SNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TPIzYnaPgv/PsyR4ebGMCuE/1FUiWioKVhkmAyvYp9Y=;
 b=lsgG3VFH8+7+DaqgKAuI2g5II1i+tZ60KwZ1EcyM/Bo3IUoKPM4rhNMsvnxAot44Ou
 T059j/QVTsIH9SiDhFzX4lv4Vr4rDf4cJbZxXB35U8pdnuJRKp5DA7sGnXvS0FHih39k
 CQfY9VPJWPL44v3i6+27xxs6DLVTmKuObIKyvgbEZae2tI6QJgP3MqeHn4470VLEgVpP
 4pqOSNOHhHbK2Rb9e5rkmgbbOt5eRpmU3AqLfBYUSGTHe70R+S1aUbDwZyw09ybCKl8I
 X5tzzpQhpvf5qY75ZjnahlyUzcEQ2xGFLfNY7kZ8vdHa8++i7HEFg0X+32eglT1nnpwl
 PIYg==
X-Gm-Message-State: AJIora/9Xs3+HKftFZ/tUn7urJ/Z9EZx+znP6aTp0HnZkJ4O+r1BU2Lc
 wY+zDWOy7l1N5RGR8m+8HCcALLaov42R9BFn
X-Google-Smtp-Source: AGRyM1tLSIOJTtK2/opYLoEXszGcd1rY8mpfvTdVjfPEyLJs85iWT4J1qSjKPq8XwuQgvdaeID1dDw==
X-Received: by 2002:a17:903:120e:b0:16b:8167:e343 with SMTP id
 l14-20020a170903120e00b0016b8167e343mr37324510plh.112.1656947627519; 
 Mon, 04 Jul 2022 08:13:47 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170902be1400b0016b68cf6ae5sm16799445pls.226.2022.07.04.08.13.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:13:47 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id l6so8774017plg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 08:13:47 -0700 (PDT)
X-Received: by 2002:a17:902:9041:b0:16a:aef:7b84 with SMTP id
 w1-20020a170902904100b0016a0aef7b84mr37378285plz.124.1656947626887; Mon, 04
 Jul 2022 08:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220615154830.555422-1-steven.price@arm.com>
In-Reply-To: <20220615154830.555422-1-steven.price@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 4 Jul 2022 17:13:34 +0200
X-Gmail-Original-Message-ID: <CAAObsKCX7bO8c9vJQois6Nz13CXqbrQ1Rih1su7QKj9xpAiejQ@mail.gmail.com>
Message-ID: <CAAObsKCX7bO8c9vJQois6Nz13CXqbrQ1Rih1su7QKj9xpAiejQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Detach from ARM DMA domain in attach_device
To: Steven Price <steven.price@arm.com>
Content-Type: multipart/alternative; boundary="000000000000b6506f05e2fc2e4e"
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:31:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b6506f05e2fc2e4e
Content-Type: text/plain; charset="UTF-8"

Thanks, this fixes the DRM driver on 5.19-rc2 on the rk3288-veyron-jaq.

Tested-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Cheers,

Tomeu

On Wed, Jun 15, 2022 at 5:52 PM Steven Price <steven.price@arm.com> wrote:

> Since commit 1ea2a07a532b ("iommu: Add DMA ownership management
> interfaces") the Rockchip display driver on the Firefly RK3288 fails to
> initialise properly. This is because ARM DMA domain is still attached.
>
> Let's follow the lead of exynos and tegra and add code to explicitly
> remove the ARM domain before attaching a new one.
>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> See also the thread[1] where I reported the regression.
>
> [1]
> https://lore.kernel.org/linux-kernel/da9cca0a-ec5b-2e73-9de0-a930f7d947b2%40arm.com
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 67d38f53d3e5..13ed33e74457 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -23,6 +23,14 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>
> +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> +#include <asm/dma-iommu.h>
> +#else
> +#define arm_iommu_detach_device(...)   ({ })
> +#define arm_iommu_release_mapping(...) ({ })
> +#define to_dma_iommu_mapping(dev) NULL
> +#endif
> +
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_fb.h"
>  #include "rockchip_drm_gem.h"
> @@ -49,6 +57,15 @@ int rockchip_drm_dma_attach_device(struct drm_device
> *drm_dev,
>         if (!private->domain)
>                 return 0;
>
> +       if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> +               struct dma_iommu_mapping *mapping =
> to_dma_iommu_mapping(dev);
> +
> +               if (mapping) {
> +                       arm_iommu_detach_device(dev);
> +                       arm_iommu_release_mapping(mapping);
> +               }
> +       }
> +
>         ret = iommu_attach_device(private->domain, dev);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to attach iommu device\n");
> --
> 2.25.1
>
>

--000000000000b6506f05e2fc2e4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Thanks, this fixes the DRM driver on 5.19-rc2 on the <span>rk3=
288-veyron-jaq.</span></div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace"><span><br></span></div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace"><span>Tested-by: Tomeu Vizoso &l=
t;<a href=3D"mailto:tomeu.vizoso@collabora.com">tomeu.vizoso@collabora.com<=
/a>&gt;</span></div><div class=3D"gmail_default" style=3D"font-family:monos=
pace,monospace"><span><br></span></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace"><span>Cheers,</span></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace"><span><br></sp=
an></div><div class=3D"gmail_default" style=3D"font-family:monospace,monosp=
ace"><span>Tomeu<br></span></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 5:52 PM Steven Pri=
ce &lt;<a href=3D"mailto:steven.price@arm.com">steven.price@arm.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since co=
mmit 1ea2a07a532b (&quot;iommu: Add DMA ownership management<br>
interfaces&quot;) the Rockchip display driver on the Firefly RK3288 fails t=
o<br>
initialise properly. This is because ARM DMA domain is still attached.<br>
<br>
Let&#39;s follow the lead of exynos and tegra and add code to explicitly<br=
>
remove the ARM domain before attaching a new one.<br>
<br>
Suggested-by: Robin Murphy &lt;<a href=3D"mailto:robin.murphy@arm.com" targ=
et=3D"_blank">robin.murphy@arm.com</a>&gt;<br>
Signed-off-by: Steven Price &lt;<a href=3D"mailto:steven.price@arm.com" tar=
get=3D"_blank">steven.price@arm.com</a>&gt;<br>
---<br>
See also the thread[1] where I reported the regression.<br>
<br>
[1] <a href=3D"https://lore.kernel.org/linux-kernel/da9cca0a-ec5b-2e73-9de0=
-a930f7d947b2%40arm.com" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/linux-kernel/da9cca0a-ec5b-2e73-9de0-a930f7d947b2%40arm.com</a><=
br>
---<br>
=C2=A0drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 17 +++++++++++++++++<br=
>
=C2=A01 file changed, 17 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/=
rockchip/rockchip_drm_drv.c<br>
index 67d38f53d3e5..13ed33e74457 100644<br>
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c<br>
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c<br>
@@ -23,6 +23,14 @@<br>
=C2=A0#include &lt;drm/drm_probe_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_vblank.h&gt;<br>
<br>
+#if defined(CONFIG_ARM_DMA_USE_IOMMU)<br>
+#include &lt;asm/dma-iommu.h&gt;<br>
+#else<br>
+#define arm_iommu_detach_device(...)=C2=A0 =C2=A0({ })<br>
+#define arm_iommu_release_mapping(...) ({ })<br>
+#define to_dma_iommu_mapping(dev) NULL<br>
+#endif<br>
+<br>
=C2=A0#include &quot;rockchip_drm_drv.h&quot;<br>
=C2=A0#include &quot;rockchip_drm_fb.h&quot;<br>
=C2=A0#include &quot;rockchip_drm_gem.h&quot;<br>
@@ -49,6 +57,15 @@ int rockchip_drm_dma_attach_device(struct drm_device *dr=
m_dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!private-&gt;domain)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_iommu_ma=
pping *mapping =3D to_dma_iommu_mapping(dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mapping) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arm_iommu_detach_device(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arm_iommu_release_mapping(mapping);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D iommu_attach_device(private-&gt;domain,=
 dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEV_ERROR(dev, =
&quot;Failed to attach iommu device\n&quot;);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000b6506f05e2fc2e4e--
