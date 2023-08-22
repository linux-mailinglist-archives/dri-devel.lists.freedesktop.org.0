Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC9783EB4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36A10E051;
	Tue, 22 Aug 2023 11:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4508810E051
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692703693; x=1724239693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zy+oNUnTax/2/pEu8NMMXhkiT6EE1L1FvMZzPOAdESU=;
 b=BSlOARM642jhazFoceCL9TjAzy6VAmYpTvDYumrJ2Q4yYvIi4yVoA9vH
 70OYgMuKaXEzJsSxoZ+Gnm79S9XT5yfG1oi8hUyb/PSuEErPJSy0Bx0xs
 JYTJ8vYsA3B6FOfRQUFnq7hfsLm6xVnxix7yp6ztZPlcy5PlklhYbSxue
 2K9yvuSTDtA1MGJEc2oHn492LnCHukCsRuEd1iLfwrYCRLJi5FxnOClTF
 x2v5jKOzbhF6/hRm2k45wpuopm63vodR8pmVUSE4NPzvB7fOcCrxvQHxS
 Y9ErmVV7j/0gShupMIYNiL7i9w2j0S4zsQI0ZMKnR37bQoH/PdasdocHD Q==;
X-IronPort-AV: E=Sophos;i="6.01,192,1684792800"; d="scan'208";a="32561792"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 22 Aug 2023 13:28:10 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6D857280075;
 Tue, 22 Aug 2023 13:28:10 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: net: microchip: Allow nvmem-cell usage
Date: Tue, 22 Aug 2023 13:28:10 +0200
Message-ID: <4855037.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <169263807888.1978386.16316859459152478945.robh@kernel.org>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
 <20230810144451.1459985-5-alexander.stein@ew.tq-group.com>
 <169263807888.1978386.16316859459152478945.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 21. August 2023, 19:14:39 CEST schrieb Rob Herring:
> On Thu, 10 Aug 2023 16:44:49 +0200, Alexander Stein wrote:
> > MAC address can be provided by a nvmem-cell, thus allow referencing a
> > source for the address. Fixes the warning:
> > arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: ethernet@1: 'nvmem-cell-name=
s',
> >=20
> >  'nvmem-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
> >  From schema: Documentation/devicetree/bindings/net/microchip,lan95xx.y=
aml
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/net/microchip,lan95xx.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks. But while reading your comment on patch 3, I'm wondering if=20
additionalProperties should be changed to unevaluatedProperties here as wel=
l.
This way local-mac-address and mac-address canbe removed as well, they are=
=20
defined in ethernet-controller.yaml already.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


