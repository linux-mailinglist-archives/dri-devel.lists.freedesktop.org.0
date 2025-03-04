Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD441A4E5B9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2795410E633;
	Tue,  4 Mar 2025 16:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BebVIXg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D54910E633
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741105504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0PfxMrTxiCNmwuMZxxDqjUFu4Sceu4wGPSbU/PWLm58=;
 b=BebVIXg94Plv6bNboCWTB350qo/rI+95ka1v0PqFvHBPN9aQ0Ru1zSIHJ8rifICOIMt+sG
 CfnEFZ2ETNOLLD4nLa7FKygPN3wLnO3SunfoZE2Df8oJmdcmHahxW0LaBffPZCVL6Zb7ox
 FbeDfdRnJU5fJ1xVd3hxXyBt+U3CUgg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-_jv9r52UPtq2YdthHBuntQ-1; Tue, 04 Mar 2025 11:24:53 -0500
X-MC-Unique: _jv9r52UPtq2YdthHBuntQ-1
X-Mimecast-MFC-AGG-ID: _jv9r52UPtq2YdthHBuntQ_1741105492
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fd3503faf8so79067237b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 08:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741105492; x=1741710292;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0PfxMrTxiCNmwuMZxxDqjUFu4Sceu4wGPSbU/PWLm58=;
 b=PFPB5dy1d3/Mh2j7adrlnz9jcWIZ4vsIQUNztCRUfX66lIQzYPaHuwhlX0EuQLd5jM
 zeWRQvDEmG3wbrtX1wXzVSJg3wjkRxC0GAjqRilspZK3ZN67kQj6lymmXVcg27W21oe6
 4WjIW3lnwD+58K0vzZVtTlT7ynzZvyASLWkvfFTuvdXp/yQ9yVV6zYc6cnOEAeQ5Jv71
 wZjPw4eh0jmk/y0PHS92RWlSGbolaXgPEPNvRHOugZv6HDByqcRMxTv3pg61KkzhRwQT
 7AmLGjTFXRGI9xG4w2iTsUpC1ex6flv1CrU7Rk1D5eELrVVq6RCvJvIqSIkC6AVmmrcL
 S8lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2CTIHcfh+Gyf55JDYNthQ549Ns6zmG1dcveC3DQUQNyf5QQTEeF5hslBsPoUo7g/lOCX6yiu87Ic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFACV4GLFkOyPeS6wQvrbgluZ/RHbkmrjEmJG/tDIgXfyBYR/q
 UYTyZvU5zWCVBE3V62Ko6gQFsPER46WSwqrWGDRbZ4XhVCkCMbMfxb3cVPAftgBkTc7PB8amOi1
 oX+Lyn3tqe7YNzEddzxJoE4MYuJwI8lO2s9WKlr21zzXm7nvFWdpqd3oYJvXFouZBNgzGUUspje
 oRQBttGsgXHZKDQV6YWrSTscxAMZUvbMgH/oZYphIE
X-Gm-Gg: ASbGnctFtFwrsmLwuBG86dzMNw1NbcBe1DFBAWg0vmm7X5ueLHt/M8T8jQRbTCRwIxc
 oSSKfywup02s4czu9/ZYFGIg8Y+afoW2ym69QXqMinXYIBFwg9UVf8HSZltfKJkEY/g6B+Sk=
X-Received: by 2002:a05:690c:6c01:b0:6f9:441e:6cf0 with SMTP id
 00721157ae682-6fd4a03da91mr238559757b3.5.1741105492575; 
 Tue, 04 Mar 2025 08:24:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwkJ+lTI2PdymRqm2HWkO76maWIwDZJJB99UWoYBYC7B3uvr5xLa/xOktXRxRbc1U7qvn7CpJo8B9tAuX5zsM=
X-Received: by 2002:a05:690c:6c01:b0:6f9:441e:6cf0 with SMTP id
 00721157ae682-6fd4a03da91mr238559327b3.5.1741105492272; Tue, 04 Mar 2025
 08:24:52 -0800 (PST)
MIME-Version: 1.0
References: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
In-Reply-To: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 4 Mar 2025 10:22:29 -0500
X-Gm-Features: AQ5f1JqLBhULJ5kE4jdZpRxc4tTPsSRgzly5WWE9fqqyWie3QNKwQpJs1fnn6o4
Message-ID: <CAN9Xe3R-nyCcTRhDTeWFrW9EVnpdRG2Nyz=qjiYB0pzFM3NxWw@mail.gmail.com>
Subject: Re: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BCOPRPxqYeBVDkonBvbCSviC00wRKgdpGQcT0pLvlgo_1741105492
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000623d27062f86b602"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000623d27062f86b602
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the fix. I shall revisit the rest of my series.

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

On Fri, Feb 28, 2025 at 4:38=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org>
wrote:

> The devm_platform_ioremap_resource_byname() function doesn't return NULL,
> it returns error pointers.  Update the checking to match.
>
> Fixes: b93f07cf090a ("drm/vc4: move to devm_platform_ioremap_resource()
> usage")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index d20e5c53ba75..37238a12baa5 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2928,8 +2928,8 @@ static int vc5_hdmi_init_resources(struct drm_devic=
e
> *drm,
>
>         vc4_hdmi->hdmicore_regs =3D
> devm_platform_ioremap_resource_byname(pdev,
>
> "hdmi");
> -       if (!vc4_hdmi->hdmicore_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->hdmicore_regs))
> +               return PTR_ERR(vc4_hdmi->hdmicore_regs);
>
>         /* This is shared between both HDMI controllers. Cannot
>          * claim for both instances. Lets not convert to using
> @@ -2946,33 +2946,33 @@ static int vc5_hdmi_init_resources(struct
> drm_device *drm,
>
>         vc4_hdmi->cec_regs =3D devm_platform_ioremap_resource_byname(pdev=
,
>                                                                    "cec")=
;
> -       if (!vc4_hdmi->cec_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->cec_regs))
> +               return PTR_ERR(vc4_hdmi->cec_regs);
>
>         vc4_hdmi->csc_regs =3D devm_platform_ioremap_resource_byname(pdev=
,
>                                                                    "csc")=
;
> -       if (!vc4_hdmi->csc_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->csc_regs))
> +               return PTR_ERR(vc4_hdmi->csc_regs);
>
>         vc4_hdmi->dvp_regs =3D devm_platform_ioremap_resource_byname(pdev=
,
>                                                                    "dvp")=
;
> -       if (!vc4_hdmi->dvp_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->dvp_regs))
> +               return PTR_ERR(vc4_hdmi->dvp_regs);
>
>         vc4_hdmi->phy_regs =3D devm_platform_ioremap_resource_byname(pdev=
,
>                                                                    "phy")=
;
>
> -       if (!vc4_hdmi->phy_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->phy_regs))
> +               return PTR_ERR(vc4_hdmi->phy_regs);
>
>         vc4_hdmi->ram_regs =3D devm_platform_ioremap_resource_byname(pdev=
,
>
>  "packet");
> -       if (!vc4_hdmi->ram_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->ram_regs))
> +               return PTR_ERR(vc4_hdmi->ram_regs);
>
>         vc4_hdmi->rm_regs =3D devm_platform_ioremap_resource_byname(pdev,
> "rm");
> -       if (!vc4_hdmi->rm_regs)
> -               return -ENOMEM;
> +       if (IS_ERR(vc4_hdmi->rm_regs))
> +               return PTR_ERR(vc4_hdmi->rm_regs);
>
>         vc4_hdmi->hsm_clock =3D devm_clk_get(dev, "hdmi");
>         if (IS_ERR(vc4_hdmi->hsm_clock)) {
> --
> 2.47.2
>
>

--000000000000623d27062f86b602
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the fix. I shall revisit the rest of my se=
ries.</div><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a href=3D"=
mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Feb 28, 2025 at 4:38=E2=80=AFAM Dan Carpenter &lt;<a href=3D"mail=
to:dan.carpenter@linaro.org">dan.carpenter@linaro.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">The devm_platform_iore=
map_resource_byname() function doesn&#39;t return NULL,<br>
it returns error pointers.=C2=A0 Update the checking to match.<br>
<br>
Fixes: b93f07cf090a (&quot;drm/vc4: move to devm_platform_ioremap_resource(=
) usage&quot;)<br>
Signed-off-by: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@linaro.org=
" target=3D"_blank">dan.carpenter@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/vc4/vc4_hdmi.c | 28 ++++++++++++++--------------<br>
=C2=A01 file changed, 14 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.=
c<br>
index d20e5c53ba75..37238a12baa5 100644<br>
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
@@ -2928,8 +2928,8 @@ static int vc5_hdmi_init_resources(struct drm_device =
*drm,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;hdmicore_regs =3D devm_platform_io=
remap_resource_byname(pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hdmi&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hdmicore_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;hdmicore_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;hdmicore_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This is shared between both HDMI controllers=
. Cannot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* claim for both instances. Lets not conv=
ert to using<br>
@@ -2946,33 +2946,33 @@ static int vc5_hdmi_init_resources(struct drm_devic=
e *drm,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;cec_regs =3D devm_platform_ioremap=
_resource_byname(pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;cec&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;cec_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;cec_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;cec_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;csc_regs =3D devm_platform_ioremap=
_resource_byname(pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;csc&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;csc_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;csc_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;csc_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;dvp_regs =3D devm_platform_ioremap=
_resource_byname(pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;dvp&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;dvp_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;dvp_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;dvp_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;phy_regs =3D devm_platform_ioremap=
_resource_byname(pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;phy&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;phy_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;phy_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;phy_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;ram_regs =3D devm_platform_ioremap=
_resource_byname(pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;packet&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;ram_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;ram_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;ram_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;rm_regs =3D devm_platform_ioremap_=
resource_byname(pdev, &quot;rm&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;rm_regs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(vc4_hdmi-&gt;rm_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(vc4_=
hdmi-&gt;rm_regs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc4_hdmi-&gt;hsm_clock =3D devm_clk_get(dev, &q=
uot;hdmi&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(vc4_hdmi-&gt;hsm_clock)) {<br>
-- <br>
2.47.2<br>
<br>
</blockquote></div></div>

--000000000000623d27062f86b602--

