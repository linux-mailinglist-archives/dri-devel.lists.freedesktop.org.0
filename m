Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78438738DE1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269D010E32C;
	Wed, 21 Jun 2023 17:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B0210E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 17:56:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4184D61651;
 Wed, 21 Jun 2023 17:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA133C433C0;
 Wed, 21 Jun 2023 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687370212;
 bh=6Opv8PDFoxGMYScl9V0RTl+vcmEJFr54mvVL6P3gfYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u1M4wVL20A4ARIQZys9e9x6zRL/6jEeL5YTdrUBDpfuDeibl/JzyvaBfBPuQgvppP
 ooRd/t4+wXenCtoeBzUsqaN4cZNa9u8XsBatzPYrc8ZBxQDtB7HwqEnB+b97JV/ms+
 TEIc1yO9fj4iKCZRAtB4snBlSfNsYv7VsTlLew3Tc1Vv9CHdXZNAh8rtma5OREHPjr
 rjfvDObbE4W5sJJHw+MGXCl3iykLz9Ls3r/bkaNGW3i+SnZ0vBjUHMi1c0pPuuTymb
 25ilUsAS3sec+qwZYoMAc+TAu+p9uJjmuboOxmxlJmG3b3ZIyjxp6tWWtFwqwzfso4
 No7Op8SGQwB/g==
Date: Wed, 21 Jun 2023 18:56:45 +0100
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 2/9] mfd: atmel-hlcdc: Add compatible for SAM9X7 HLCD
 controller
Message-ID: <20230621175645.GR10378@google.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613070426.467389-3-manikandan.m@microchip.com>
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

On Tue, 13 Jun 2023, Manikandan Muralidharan wrote:

> Add compatible for SAM9X7 HLCD controller.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mfd/atmel-hlcdc.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
