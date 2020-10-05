Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E9283411
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 12:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EDE89DB9;
	Mon,  5 Oct 2020 10:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D10A89DB9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 10:37:07 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id qp15so11171483ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EQcMf3aBHGTHbFtiLcGPyEnLeByAfRIiKvJYpM7dHjI=;
 b=JMXtpOzBphG2KW05zXFj2vXclgc2K+H8JNLe4wZm7v+D9biCrsBBlunvumrZBdu1ay
 dGsC3P+vCBgpuvq8Us5VYT17QD/j1PGdTs3yayROXo3Im6WBME+yzVPRs9dhmCnhv+Kp
 deAaGEl4mX/k8HNSg+lcAp97KgIlUIgmSSwwdLTGDqN7XE8+lWKnDQvOaVfL9MZ14U+a
 QRIvo/0Rw3hXEZYEYP0VkWPlkV5tVRSOzoq3CiZiRn3rvyx0WeBnBNIUIK3FrMGOYn9N
 QIQdKyuVIgtZvtCvpApddnOAphNZZn8AUAHtmpPXbjSAxqojzQj+J6GDsnofUdkYSHTP
 MAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EQcMf3aBHGTHbFtiLcGPyEnLeByAfRIiKvJYpM7dHjI=;
 b=Du8hZyfca08cuQR3HkCMjwngzp1CJb/CRRSJo3EnA61XbgXMDaT4kRW6jHOD9XWwu0
 M2tgNsSBLPEtGXzKdjJXsDPbh9DsarMmCIScT7PLqFpNDZOSDPpPGJsG7uOChnMg8N5c
 9Z/GL94jxPYx+ew1kM9PGRK0fZaygd0bahwBl1mCyaAKuzkWd+07LJO1DEzZ2SyMyRwP
 bPRg13dC2zThEivPCd5pAJImteWV2iTLW+Kn0aC3bSMMKR+ZFW9qfaT8jiLy78SwJOpq
 nwkSI41bR7bQzzX/lgVrLBGn6EUX99m9YR5n7cO2VnpzXmLRyUZwQPUonIYsyqe2lmRA
 Su+Q==
X-Gm-Message-State: AOAM533/QaWwvqG56UEYAZa1oTihk+SHp2tZWRGR6EwURzJuYb6zRx5B
 l2P+47/Kqmov9jKQeFZU5YQ=
X-Google-Smtp-Source: ABdhPJyAUrA9v+oT7mNxthuQoeotTCXMOOGXsGx3LdAG3pM2W9hPKJEenugRGvwJUGZXAZHqegPZ7g==
X-Received: by 2002:a17:906:6545:: with SMTP id
 u5mr14725364ejn.346.1601894226145; 
 Mon, 05 Oct 2020 03:37:06 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id yz15sm7567670ejb.9.2020.10.05.03.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 03:37:04 -0700 (PDT)
Date: Mon, 5 Oct 2020 12:37:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another round of adding missing
 'additionalProperties'
Message-ID: <20201005103703.GN425362@ulmo>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============0254591946=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0254591946==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CQDko/0aYvuiEzgn"
Content-Disposition: inline


--CQDko/0aYvuiEzgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 06:41:43PM -0500, Rob Herring wrote:
[...]
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         |  2 ++
[...]
>  .../bindings/sound/nvidia,tegra186-dspk.yaml  |  2 ++
>  .../sound/nvidia,tegra210-admaif.yaml         |  2 ++
>  .../bindings/sound/nvidia,tegra210-dmic.yaml  |  2 ++
>  .../bindings/sound/nvidia,tegra210-i2s.yaml   |  2 ++
[...]
>  .../bindings/usb/nvidia,tegra-xudc.yaml       |  2 ++
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--CQDko/0aYvuiEzgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl96908ACgkQ3SOs138+
s6Hn/g/+OAyAW+yLaNZ0EuRduaLOLtd19HpvVqZdf68FWcAxWHANPdIKnVuc++CF
2r+nHjgPy4zI3LGP1bGlgPufCdAapy2QTx9sGt/VeTEOuo9uTjb6J4Y7xXC11qQT
pVI+v4ofSi48FN6vY6VWsotDscDJFLkJy/eZdb1RRuU44SG4dw04Z3fn1STm9wAN
PS6hKtpUTbZYzgI0hngx2Ph30t7fyu18NIRPsKZ6/3WgR4HwD8cdpVi+06ThN3GQ
s5CEQ/J7l9z1tfQhUypxLic1JV21su9fCERZQd96CKyIvcpJ5RByk7d7EnnZ4A53
ZDRzwiymRP29X0IUzvEoHc7XvUP/mIZIkRNtTc3tLGZHZ34+Gc805Hcy5slbzhRz
V+Gl3oXG56OhWLSbyNQXOOlbJJAmdFS1IDAoV752G6kq5fFZ397AW34DLF5YJX0k
lYF3NWBTpuxxWCGuceKkACfscLE1dAifN2Rtgf9mbM1k2mIG7mVa6tdpxJ3sjf8Y
1T0v3HYAwfOKTajaYUY4UYLMIJcZNjjJsw/olvcM6a9c8x/g79W3BgSjS6F/pEww
DtuObW8366dl2WoqlYTJ9eWvKXSbCHRBhPpYLamHRBOBj7HKqGSHyyq0hEGPvd6X
Hr+OJUghj7CHS+5vXEq5oNiT4bE6x9ytJdHNf5hIiRchRu6TeOQ=
=hMJa
-----END PGP SIGNATURE-----

--CQDko/0aYvuiEzgn--

--===============0254591946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0254591946==--
