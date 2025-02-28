Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC5AA4969B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53B310E291;
	Fri, 28 Feb 2025 10:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="T3j1j7Gu";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RZIbN3OU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8166E10EC5A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1740737563; x=1772273563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wrZESIfIEMlm8bcE5XbWXGC11n9EvGXbhxL7sNZTaKg=;
 b=T3j1j7Gul1i+4UNUH6LNgsqzNkQZ+ZbGk/uH0DQjCGUd0cjzKl+09JG0
 Sqre+hvHHjGNAFeeT1rfYIL/mYvJLHqVOvDaZ2pUC+jw7MIyIyNUzJFwU
 N/w3Vm8Iii//gvtLA6OVzPe8QVo3Cfu+jmabkBSF7j6MNqSjhI0+SwI2p
 3MjPdXW9E7Or3XmxmzCtAMQ+IWZA8i0qWcbNou1aY0u5/my7mjEBWM8ZV
 Pe9CJUK+aEPjhyiUt3LJvYeDvldddIMPspauUI78RvVMvhm4rr1wd5Bhb
 k0b6eXf45nTGNhCP4yxBk++d6+8ebbX24qSeAn+A2uXQYjauMw0mm9npQ g==;
X-CSE-ConnectionGUID: pa+KqxuLQCOJlUmpZ8dqOg==
X-CSE-MsgGUID: XOcdYrqWQr2Yz50o0V+ekw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; d="scan'208";a="42171238"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:12:41 +0100
X-CheckPoint: {67C18C19-E-2895743E-CD1E7AB7}
X-MAIL-CPID: 18FEA1C7F914205254E6E81087CE3540_4
X-Control-Analysis: str=0001.0A002119.67C18C19.00E0, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6AAB168CC3; Fri, 28 Feb 2025 11:12:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1740737557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrZESIfIEMlm8bcE5XbWXGC11n9EvGXbhxL7sNZTaKg=;
 b=RZIbN3OUvhZO996W35ymd+UmvU0Oe1s/ZIRdblX0G9pxMXjaPdqV3Si/TXhOId9nWCmi4P
 5opWJlWKMH3LggKe/bDCqJkXBP4MYy12GrGsaasQWYP3JaQGj+Zdpg2TDyEiqLPmlGVvEf
 a7oGgXhCV8ENhJXpx7RP4iwwqWQs8SRoSzLuif/iCFCSeH6pMlIWJq9p3GfmePgTt0sxGY
 ZqZl3ZHOU0e/KmiFwlp7JILTqf6x0AZN4T7OJOgTdHU8AW1lM6RQiRL+cfGOKW90hrhESa
 qOjpJvckYPsC91rSpqL/8PwGVYKWPrTMtn66RABwjrBDuv2LRT7uRf87Acr2HA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
Date: Fri, 28 Feb 2025 11:12:35 +0100
Message-ID: <4281241.1IzOArtZ34@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-8-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Donnerstag, 27. Februar 2025, 17:58:07 CET schrieb Marek Vasut:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.y=
aml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 0efa06822a543..3ab62bd424e41 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - fsl,imx95-mali            # G310
>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revis=
ion is fully discoverable
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


