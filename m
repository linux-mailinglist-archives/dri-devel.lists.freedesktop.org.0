Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539C758885
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D4110E3C1;
	Tue, 18 Jul 2023 22:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB3010E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:33:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E8DF612BE;
 Tue, 18 Jul 2023 22:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE48C433C7;
 Tue, 18 Jul 2023 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689719598;
 bh=6MTyHxtYHfxixee7H4APrS6m+5lNQnJTGfCeYq0C57M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2TcgOiLAT9i4N5/MyNynSBpIypudtWwZXSRLPmdqjIzzj1UEXGBqP7rtSB3CLkid
 2AC+4AJNSv2m7r/VcXveFj/x2pfYhaorP2ZsMW8JH/uS2TOY5J5cCpcirqp2R15L9X
 aQwOHqV1t81As+vVAK+iWJe290SUEtQKxk8+jZ+sIVNJgaAlS6/NIDVlTULR0Dl123
 1GaHZ67hNDbmMPhn7BKM/ubQdvvpGcli6L9bSXoYoWClvrzAktqNVpE20zj3nY3vaL
 E4exEKKuvHqP8mfudddWyqYAlKrZM0VlGL882hOLhV6GE1/HGZV7NF0XWSXDtiiETq
 /GYSjb/zsae6w==
Received: (nullmailer pid 2131885 invoked by uid 1000);
 Tue, 18 Jul 2023 22:33:16 -0000
Date: Tue, 18 Jul 2023 16:33:16 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v7 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Message-ID: <168971959565.2131824.2007290149769233766.robh@kernel.org>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
 <a782c749ecf8192a4f89ba270e30c7fb1d245c51.1689580812.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a782c749ecf8192a4f89ba270e30c7fb1d245c51.1689580812.git.Sandor.yu@nxp.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org, sam@ravnborg.org,
 jernej.skrabec@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 17 Jul 2023 16:03:51 +0800, Sandor Yu wrote:
> Add bindings for Freescale iMX8MQ DP and HDMI PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

