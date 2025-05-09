Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBCAB1F19
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5338810EAF9;
	Fri,  9 May 2025 21:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GzJOBbut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BAB10EAF9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746826547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hYtlWhIfE8/FY/jKJnyYsZe7MxS7wLs6dmHJZajZruE=;
 b=GzJOBbutdihyyaQd66/naWcif9L6rFLXZNyR8UAmb3a3yeQZ6aMZ1XDxKBf+XPPeDz5TTC
 SKN8Lbma/rih7+g6AZAUC1nV4FTS8Z9OcKDmJv99a95A/LEfmV/gmVW4Wfo8EVutARna2A
 n+3pukhfgL7fYCGGHB4ASRQjgGqtUpE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-ABZ11exZOMWoqOqFknITeg-1; Fri, 09 May 2025 17:35:44 -0400
X-MC-Unique: ABZ11exZOMWoqOqFknITeg-1
X-Mimecast-MFC-AGG-ID: ABZ11exZOMWoqOqFknITeg_1746826543
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-70a53b5802cso1351767b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746826543; x=1747431343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYtlWhIfE8/FY/jKJnyYsZe7MxS7wLs6dmHJZajZruE=;
 b=GHg0he6zaK6L+6KtcT1gD1W5aQQrVZpesa6YlKCLLxaP1AYXWO1Zc5VxiNimVQ1VqW
 Gbi8iRe38evwbUdQHhUVpO7xoP4s58eUIEyx0HFqxwPO7CQUrOJW1WOHyALifpUfO8Co
 h/Cp/+5Uxa9/zvxPADF0nXsceQEq1vOpUSh1EXLNlrhPG18V+bP/LnCqFMAGAIimcMp1
 6U7ZccJpfGM4iiVoTdReL14/Z7knGUt5MTLKVpgM+85mx465AJJDAFIkkAxCpa9MovOb
 PXbpgIEVM5Jh6Y8GunXx2gJ7NnF9xsX3jD/ApOkJL/krY5i8Vge9oi+bGYeJwtRybtlp
 I4IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUL/53QvJ8B6KtlNkuatpDP0elAHEpMLMYV+NE1Iu1ezWEYHkfhgt7lMTYLmC/4QL88kiCpqCrBY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH5BmGL48CWey0/V3VWJ6+lGQqtziqa+DVZD1S6VzlskjPz7ds
 yv6/UoDOs5koP31EndQjcJBV2z36IiN1sGTuxQT+i5UMdee8sE3Ofw//34pKVC4dbMIxwSv2O+Z
 jgtSKbGZ/CFsXNQEPrkhhReR3x8mANl5/c8pphy2+0jkEiHNjCMVGLDgqSmvb3c8ZazSwJyznO9
 IoGmLnBx1fLNMSiA1TOKwy6ucTeRmzrpLAld809RG1
X-Gm-Gg: ASbGncva8xuKj8H3JPKXETnKlFvZFDldnE5a06H9CWeZUtu4W6iW5xZd1j4N1ypEIHc
 noXGs2XpZ3bjma8RRYC67Yob9hZSixVeTDRvWv8tS0IzhQFUcM+GDJosZgyGh9FwQ3v8=
X-Received: by 2002:a05:690c:6012:b0:703:b930:97c7 with SMTP id
 00721157ae682-70a3fa2453bmr65777677b3.9.1746826543553; 
 Fri, 09 May 2025 14:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOX4g2wzfw7tGF0msoIwu89ObZWLx7H+gBPBCTd54o0YgB37bfihWxt4pX1/XHw0ycvt7E0xMq+56TtD2VrVc=
X-Received: by 2002:a05:690c:6012:b0:703:b930:97c7 with SMTP id
 00721157ae682-70a3fa2453bmr65777427b3.9.1746826543279; Fri, 09 May 2025
 14:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:32:22 -0400
X-Gm-Features: AX0GCFvgBDQPXfbsBXhpXssR6nd8_D6uWav2HkZaIC88ZkIzUSgFh2O4RCwzLCA
Message-ID: <CAN9Xe3TX+zGNjQOANzv8tqUD79zVniruG3yBDiQY=Cd6Jr6p9A@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] drm/bridge: stm_lvds: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TCyH09nzZCjuv9B7aoYgoZO02DE_dBdhclB0zb3xYhg_1746826543
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000098c5590634babf2d"
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

--00000000000098c5590634babf2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:57=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/lvds.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index
> a3ae9a93ce6670eb2c4dd36b3e572fcbca791a1c..07788e8d3d8302a3951e97d64736b72=
1033998d3
> 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -1049,9 +1049,9 @@ static int lvds_probe(struct platform_device *pdev)
>
>         dev_dbg(dev, "Probing LVDS driver...\n");
>
> -       lvds =3D devm_kzalloc(dev, sizeof(*lvds), GFP_KERNEL);
> -       if (!lvds)
> -               return -ENOMEM;
> +       lvds =3D devm_drm_bridge_alloc(dev, struct stm_lvds, lvds_bridge,
> &lvds_bridge_funcs);
> +       if (IS_ERR(lvds))
> +               return PTR_ERR(lvds);
>
>         lvds->dev =3D dev;
>
> @@ -1164,7 +1164,6 @@ static int lvds_probe(struct platform_device *pdev)
>                 goto err_lvds_probe;
>         }
>
> -       lvds->lvds_bridge.funcs =3D &lvds_bridge_funcs;
>         lvds->lvds_bridge.of_node =3D dev->of_node;
>         lvds->hw_version =3D lvds_read(lvds, LVDS_VERR);
>
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--00000000000098c5590634babf2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:57=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
ootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This is the new API for allocating DRM=
 bridges.<br>
<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
---<br>
<br>
Cc: Alexandre Torgue &lt;<a href=3D"mailto:alexandre.torgue@foss.st.com" ta=
rget=3D"_blank">alexandre.torgue@foss.st.com</a>&gt;<br>
Cc: Maxime Coquelin &lt;<a href=3D"mailto:mcoquelin.stm32@gmail.com" target=
=3D"_blank">mcoquelin.stm32@gmail.com</a>&gt;<br>
Cc: Philippe Cornu &lt;<a href=3D"mailto:philippe.cornu@foss.st.com" target=
=3D"_blank">philippe.cornu@foss.st.com</a>&gt;<br>
Cc: Raphael Gallais-Pou &lt;<a href=3D"mailto:raphael.gallais-pou@foss.st.c=
om" target=3D"_blank">raphael.gallais-pou@foss.st.com</a>&gt;<br>
Cc: Yannick Fertre &lt;<a href=3D"mailto:yannick.fertre@foss.st.com" target=
=3D"_blank">yannick.fertre@foss.st.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/stm/lvds.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c<br>
index a3ae9a93ce6670eb2c4dd36b3e572fcbca791a1c..07788e8d3d8302a3951e97d6473=
6b721033998d3 100644<br>
--- a/drivers/gpu/drm/stm/lvds.c<br>
+++ b/drivers/gpu/drm/stm/lvds.c<br>
@@ -1049,9 +1049,9 @@ static int lvds_probe(struct platform_device *pdev)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, &quot;Probing LVDS driver...\n&quo=
t;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lvds =3D devm_kzalloc(dev, sizeof(*lvds), GFP_K=
ERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lvds)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lvds =3D devm_drm_bridge_alloc(dev, struct stm_=
lvds, lvds_bridge, &amp;lvds_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(lvds))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(lvds=
);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds-&gt;dev =3D dev;<br>
<br>
@@ -1164,7 +1164,6 @@ static int lvds_probe(struct platform_device *pdev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_lvds_probe=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lvds-&gt;lvds_bridge.funcs =3D &amp;lvds_bridge=
_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds-&gt;lvds_bridge.of_node =3D dev-&gt;of_nod=
e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds-&gt;hw_version =3D lvds_read(lvds, LVDS_VE=
RR);<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000098c5590634babf2d--

