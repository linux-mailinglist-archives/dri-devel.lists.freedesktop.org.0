Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A807EAB1EB7
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C910EAD0;
	Fri,  9 May 2025 21:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="djAyCWRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5C10EAD0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746824902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UARxfep1PUV/zClZnWhEuROkgNfsuVtcWX+qYwdPZ6U=;
 b=djAyCWRA5mCpasRGSfyLIndTC5J/BpmOZh8Z1O3PSAQyv2zms8js1meNt5KRBN4M81A2i+
 1ppVQwkZWCedycTWQwDF4WMxd0a6L9hvV3Le8smS7dRVMFcaLFXZZxdGdcDxVfBFBLZMZI
 U0EBl83+4zCfSUhfbFqzEtAfvC+oPGw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-bQY56hfiNXeWYskUSFzbsw-1; Fri, 09 May 2025 17:08:19 -0400
X-MC-Unique: bQY56hfiNXeWYskUSFzbsw-1
X-Mimecast-MFC-AGG-ID: bQY56hfiNXeWYskUSFzbsw_1746824899
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-70a5434825cso481337b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746824899; x=1747429699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UARxfep1PUV/zClZnWhEuROkgNfsuVtcWX+qYwdPZ6U=;
 b=ra/clz/7Zwf1mO5C3sfk0NMEydY6xtRPaqDgg0OmY1yVdTNPUw0l57Jk6sS0xgKSdK
 +nga/TsHtVGr9DDJ8BD4sXZ7/0jw5oaEJ36YyVyrxbBnzreKlicC+8k8KeK2oyErqcLA
 FU7umqIzdmD++rGkTUzaLjAtd1x/aPt2cLak52+4fDc3fCDWZtQfH+lFUmTns0DmUdzx
 F7RBDTr8xmTf3jEIMNO6XT1w0ajJWerU3DXMVYdJYPZsEA+ismRmk0GP15fT0C6X0S6d
 VFMe6q6rlFyqzveN79TM1JM+EB1VZejWOBFvfx4J4Gk27FSMMLR7Uqhm/tvb8IN1QycC
 TWng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbl2VhfZIAFPna8zJ19p8eAZKC87qTacZZRCMJ8jpvvAeKxwCoZjgOfOT9QNch1gc0DHrNtnNENX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUmfOfVlAsOM5YRnGoz81tJYBWifAuxD2C23R5wjEVGa7+AVYS
 mumei31oTKMVxVkaxFGhNI+YAeROW2hYn4Yj4xlcYvVn5h3bbfxkpBOwgWbdXZR+F4QY9e1tYRJ
 ZcDwuLhhgfDb9xBwpXSgDTokKA1RYtDtcAGIYAIbM8Pk9cTP0tXgTp7u+mNivTl8Zli8zmiDcTM
 6RUuovgLriTJbEWb5iq06Fm8K7tVmuXQFPsTBEBxBR
X-Gm-Gg: ASbGnctDqX4/8RpVAOH4Yb0vPKun20uL61VjY4Zubyfrr79mh2sUiTZi6DSbGcKmeUl
 8qd5pXtT0K0KJge/29dSqWMdkWl5AgtsZGrdfTPl5Bvxfbkis06BnE6FEu6T+NFPKc0c=
X-Received: by 2002:a05:690c:4b86:b0:709:17e4:4d27 with SMTP id
 00721157ae682-70a3fb1b0d4mr72899357b3.23.1746824899188; 
 Fri, 09 May 2025 14:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2FbaiLJXpVMMYm1aD0LOc9R+oNCYF/mnEu4LufMPN7kBGGag7OLXUOJQHJrLtVspAzjldLH45fn1NMpmGrs=
X-Received: by 2002:a05:690c:4b86:b0:709:17e4:4d27 with SMTP id
 00721157ae682-70a3fb1b0d4mr72898667b3.23.1746824898685; Fri, 09 May 2025
 14:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-7-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-7-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:04:59 -0400
X-Gm-Features: AX0GCFvKuUu9e22S9SVXkS9UEWDKB4E-n7gr-L0jB9G_tZfdMvVpNCP3CNKnqws
Message-ID: <CAN9Xe3QDpw67hcONcA+8hSGA8e4n1vA=czpuDcNU8J6tz-BVCg@mail.gmail.com>
Subject: Re: [PATCH v3 07/22] drm/bridge: sii902x: convert to
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
 linux-stm32@st-md-mailman.stormreply.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -wu1NQ-bV-VP9mZp0-_RLjX663yR9wFAMpDfscSbm1Q_1746824899
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009240c00634ba5de6"
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

--0000000000009240c00634ba5de6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c
> b/drivers/gpu/drm/bridge/sii902x.c
> index
> 6de61d9fe06487856e8b3c32db3c8d8c25633fd8..882973e900628c0d972d32cd4ff3588=
432daa8e9
> 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1135,7 +1135,6 @@ static int sii902x_init(struct sii902x *sii902x)
>         if (ret)
>                 goto err_unreg_audio;
>
> -       sii902x->bridge.funcs =3D &sii902x_bridge_funcs;
>         sii902x->bridge.of_node =3D dev->of_node;
>         sii902x->bridge.timings =3D &default_sii902x_timings;
>         sii902x->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID=
;
> @@ -1170,9 +1169,9 @@ static int sii902x_probe(struct i2c_client *client)
>                 return -EIO;
>         }
>
> -       sii902x =3D devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
> -       if (!sii902x)
> -               return -ENOMEM;
> +       sii902x =3D devm_drm_bridge_alloc(dev, struct sii902x, bridge,
> &sii902x_bridge_funcs);
> +       if (IS_ERR(sii902x))
> +               return PTR_ERR(sii902x);
>
>         sii902x->i2c =3D client;
>         sii902x->regmap =3D devm_regmap_init_i2c(client,
> &sii902x_regmap_config);
>
> --


Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

>
> 2.49.0
>
>

--0000000000009240c00634ba5de6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:56=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
ootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This is the new API for allocating DRM=
 bridges.<br>
<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/sii902x.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c<br>
index 6de61d9fe06487856e8b3c32db3c8d8c25633fd8..882973e900628c0d972d32cd4ff=
3588432daa8e9 100644<br>
--- a/drivers/gpu/drm/bridge/sii902x.c<br>
+++ b/drivers/gpu/drm/bridge/sii902x.c<br>
@@ -1135,7 +1135,6 @@ static int sii902x_init(struct sii902x *sii902x)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_unreg_audi=
o;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sii902x-&gt;bridge.funcs =3D &amp;sii902x_bridg=
e_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;bridge.of_node =3D dev-&gt;of_node;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;bridge.timings =3D &amp;default_sii=
902x_timings;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;bridge.ops =3D DRM_BRIDGE_OP_DETECT=
 | DRM_BRIDGE_OP_EDID;<br>
@@ -1170,9 +1169,9 @@ static int sii902x_probe(struct i2c_client *client)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sii902x =3D devm_kzalloc(dev, sizeof(*sii902x),=
 GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sii902x)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sii902x =3D devm_drm_bridge_alloc(dev, struct s=
ii902x, bridge, &amp;sii902x_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sii902x))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sii9=
02x);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;i2c =3D client;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;regmap =3D devm_regmap_init_i2c(cli=
ent, &amp;sii902x_regmap_config);<br>
<br>
--</blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a href=
=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br><=
/div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"> <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000009240c00634ba5de6--

