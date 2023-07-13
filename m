Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A77526AB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 17:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1410E6F9;
	Thu, 13 Jul 2023 15:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E40910E6F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:22:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A3C1618C5;
 Thu, 13 Jul 2023 15:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E691C433C7;
 Thu, 13 Jul 2023 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689261764;
 bh=YAmnTTFm0GwWsSdAoWWcGBrMe5QH0j2yUGMWo2AP1ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j6iZOcYllQn0u0nW3hCage2h+NFDoOc3yL8/esZc84q3GLp6t1X4cohT/l5X9qPxD
 tm3n2pt/FFF0TfU6PF1wfdzKAqNzt6mtsk90LirEgDsCWALvOFa95CPy5n+O4zRnmX
 TrQ6gvqYFf65AR0D+8zPOwVmWqP2Iv7TSyAGbv4JYSPB//N8NJ/K0lWHkGFTGNFcbM
 +GJE5vNL91mqX/e5TFG1WxHd4sF6yezkiGke0d/YikP9eWL8LouSCDMZokeSFL2auM
 AxJ980mx4MngEYjtgEolUWvbHLWpBgbZwMCv+ZQIDET73NEx2Tv7cGBCRvI9b6QDhn
 xoSm+zL3SEuig==
Date: Thu, 13 Jul 2023 16:22:36 +0100
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: mfd: Add bindings for SAM9X75 LCD
 controller
Message-ID: <20230713152236.GB968624@google.com>
References: <20230712024017.218921-1-manikandan.m@microchip.com>
 <20230712024017.218921-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230712024017.218921-2-manikandan.m@microchip.com>
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
Cc: Nayabbasha.Sayed@microchip.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 bbrezillon@kernel.org, Balamanikandan.Gunasundar@microchip.com,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 krzysztof.kozlowski+dt@linaro.org, Hari.PrasathGE@microchip.com,
 Balakrishnan.S@microchip.com, sam@ravnborg.org, claudiu.beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023, Manikandan Muralidharan wrote:

> Add new compatible string for the XLCD controller on sam9x75 variant
> of the SAM9X7 SoC family.
> The XLCD controller in sam9x75 variant supports interfacing with
> LVDS and MIPI-DSI and parallel port RGB.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
