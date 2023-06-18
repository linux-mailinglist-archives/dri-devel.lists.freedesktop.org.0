Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7807346A7
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 16:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F48110E0A9;
	Sun, 18 Jun 2023 14:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E0B10E0A9
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:39:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 893DB60BAC;
 Sun, 18 Jun 2023 14:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0752C433C0;
 Sun, 18 Jun 2023 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687099148;
 bh=wvkhVOSIXZAPjW4B3K3huxSlZpIAJF0lQ4NJmv+BClk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=BavRPtBl9ruDuyqvQe0CLoqSOkqS+WonLsWzyOScqgimiUyxKwfzFit1KJQnTAmaD
 e5D3buhfhgIFz9kAZIcSH8NGx83MO+qyav82FbpBmblOHHUqWBzuI2d8p1FBxchq8E
 p8n3rzXsublnBFgBHGwvu7ZHs/uvvcpu/0EZi28xWoD4mXRuFBFDfhYRx1kP3vtN1n
 A6R4X7HmqOytXM9PCizYPnyDp+i7emY/aED+4ru2vFc3zxEKz5Vqsf1i2PUv54eQg8
 Pf0c6yVuJszn5v8sPEFD4wIONtksASQn/YCcw/oS4fOrrqSbzDlvrjl9X3BhGNOYac
 DrU2xNg0m7VeA==
Message-ID: <7add37b15a20d42b0cae0d8dd28605da.mripard@kernel.org>
Date: Sun, 18 Jun 2023 14:39:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 4/6] drm/panel: sitronix-st7789v: Clarify a definition
In-Reply-To: <20230616163255.2804163-5-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-5-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael
 Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 18:32:53 +0200, Miquel Raynal wrote:
> The Sitronix datasheet explains BIT(1) of the RGBCTRL register as the
> DOTCLK/PCLK edge used to sample the data lines:
>=20
>     =E2=80=9C0=E2=80=9D The data is input on the positive edge of DOTCLK
>     =E2=80=9C1=E2=80=9D The data is input on the negative edge of DOTCLK
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
