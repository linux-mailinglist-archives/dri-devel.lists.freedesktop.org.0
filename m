Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E88A763C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 23:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36A910F381;
	Tue, 16 Apr 2024 21:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdzhTLKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059F10F381
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 21:18:51 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5d81b08d6f2so3694634a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713302331; x=1713907131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBEr7AmEEZkKSiw3BsMpmaMNJ9Caj0ON73VIII8SWsI=;
 b=mdzhTLKgcCYqwXJrGWdxgNSwrT6idd9bQPSZ3woLSeW+s7IgFQs1HQtZbAFTicAXxy
 MU+XvALTCTdcBhu0a8bKQHBWUJqnJ1hHtwv+zmmhlB6ku+6Sy+h1mxSa07QMgpgq+e2n
 EfMhELlhhvJJJqlroeN7y97SS6sWno45aqanMQotfefph+qxD/bNP46K8SkSuCjAoyce
 Dzd5nanlf15BjmLr0vaqXmgEw2foygAWPPjqD81iH6eNwaz247cbWAz9PTZk/KhAemgn
 NzryzwCA01S2OgndMhY+Z+CJ8qk0A6eVcf1iKPjqENvVCGpF55l3pIqNEIJBln46/fqF
 Mc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713302331; x=1713907131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBEr7AmEEZkKSiw3BsMpmaMNJ9Caj0ON73VIII8SWsI=;
 b=AYPRq/vDEqO+wBZq9dztatKcgMUmfSvNsYgjTgKhNPKm5hQLNcUny6U5cC/AHEBi5c
 06IjwNPSWDRl75XwtRI2hgjtThwnZxVgdvuiNO9QJ6nGVKNrKbkau2/eJC7ryT2yKzrg
 Se8rHd6hwdP4UaNlT9c61kLA4g3ifNSMbJfgmpmFOslFn4WtuDTu/UGo/7xGVf7DaufG
 5J1Cf6mPzSqMZ5SHWWzPK0BovrPNwciJmKYE9k2omDGyD7j8vMFGnh/eoPknhmuFPLbQ
 Pn0uewDc/q8GJ+BnmASZeIkF8QZp2VoJ1lu4yvuJ/hOyEmNitp4T5RfncXkwWen1GZe7
 hZig==
X-Gm-Message-State: AOJu0YzP4DJ6o49lWueJeE96X5mIt5mev4D2vumGFbMsKDoSPYT40y3s
 i9uN8gvxehDrb3RsUseFKmBEQ4aVzwkLVwXnPvvXvVdfGrgrDfcHaQe7hZZHg9kmVZ5utRGov2S
 fi3FaxcCtWIzOQWIDXKp5ByxCeVuT70o1
X-Google-Smtp-Source: AGHT+IFhlEFxkQR+ieC/Pa0fKkP87ACk2PMEqPN62geu1ZxkPfEDzM2tLQRrA2jUzsAT+yFWyAIlwAZgs2PhJ+8rSX4=
X-Received: by 2002:a17:90b:180d:b0:29f:7fad:ba50 with SMTP id
 lw13-20020a17090b180d00b0029f7fadba50mr13315078pjb.8.1713302330612; Tue, 16
 Apr 2024 14:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240305004859.201085-1-aford173@gmail.com>
 <20240305004859.201085-2-aford173@gmail.com>
In-Reply-To: <20240305004859.201085-2-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 16 Apr 2024 16:18:38 -0500
Message-ID: <CAHCN7xLsEvP0A3mQJRzX=nXGr30WD4RU9vQVw9ynqzSi6cDNRg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge
 HPD
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com, 
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 4, 2024 at 6:49=E2=80=AFPM Adam Ford <aford173@gmail.com> wrote=
:
>
> The DSI to HDMI bridge supports hot-plut-detect, but the
> driver didn't previously support a shared IRQ GPIO.  With
> the driver updated, the interrupt can be added to the bridge.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Shawn,

Patch 1/2 has been applied and sits in linux-next.  Are you OK to
apply this to the IMX branch so the hot-plug detection can work?

Thank you,

adam

adam
> ---
> V2:  No Change
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/a=
rm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> index a08057410bde..fba8fd04398d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> @@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
>                 compatible =3D "adi,adv7535";
>                 reg =3D <0x3d>, <0x3c>, <0x3e>, <0x3f>;
>                 reg-names =3D "main", "cec", "edid", "packet";
> +               interrupt-parent =3D <&gpio4>;
> +               interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
>                 adi,dsi-lanes =3D <4>;
>                 #sound-dai-cells =3D <0>;
>
> --
> 2.43.0
>
