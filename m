Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5B73907A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAAD10E0C1;
	Wed, 21 Jun 2023 19:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCA510E0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 19:59:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47A13616BE;
 Wed, 21 Jun 2023 19:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D45FC433C0;
 Wed, 21 Jun 2023 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687377576;
 bh=ANN19t3alAM1TARadv37+ChXZ5nuIRFQHI8urfbJW8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nx5Izjpj9P8xdX6AvBmnv3mcfjSS3km1o30ZPztOTbbNK5cR/5HI+gxVoSVWbb+5S
 oZ9DNDtBvDE6eczTmbRHGgk2NL9xNSAud0loiPCkFPZdS28P+peq3Ruk2SiFPvTBx5
 U1eb+ROuqhKDUg4/FW/eeVsll/7RXPdmYr3S821w3T1YgC8fMkxz+TCEkFEyM3E/Cg
 1WtbI/bEri6mVsrHRR2KkTnFO4d+1BX6oUbUHx38nvJhK1p/C0nPWA7c06NQz7b/tL
 FNdORcVZV9jF19mpS/GM7+8tgyymVGJaWoupQJqO8vaPJfr/D8G/iZJlRvFQaxRDHb
 WVjFKounFch5Q==
Date: Wed, 21 Jun 2023 20:59:29 +0100
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 2/9] mfd: atmel-hlcdc: Add compatible for SAM9X7 HLCD
 controller
Message-ID: <20230621195929.GV10378@google.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-3-manikandan.m@microchip.com>
 <20230621175645.GR10378@google.com>
 <20230621-pampers-dial-07b6c3e7602a@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621-pampers-dial-07b6c3e7602a@spud>
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
Cc: alexandre.belloni@bootlin.com, Nayabbasha.Sayed@microchip.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 Hari.PrasathGE@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Varshini.Rajendran@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, Dharma.B@microchip.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 Durai.ManickamKR@microchip.com, linux-arm-kernel@lists.infradead.org,
 Balakrishnan.S@microchip.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jun 2023, Conor Dooley wrote:

> On Wed, Jun 21, 2023 at 06:56:45PM +0100, Lee Jones wrote:
> > On Tue, 13 Jun 2023, Manikandan Muralidharan wrote:
> > 
> > > Add compatible for SAM9X7 HLCD controller.
> > > 
> > > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> > > ---
> > >  drivers/mfd/atmel-hlcdc.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Applied, thanks
> 
> Hmm, Nicolas pointed out that this compatible is likely insufficient,
> and it'll likely need to be sam9x70 & sam9x75 as there are differences
> between what each of these SoCs support.
> https://lore.kernel.org/all/ef09246c-9220-4c71-4ac2-2792d9ca519d@microchip.com/
> I guess it doesn't really matter, since the binding didn't get applied
> and what's in the driver can be arbitrarily changed?

Unapplied, thanks. :)

-- 
Lee Jones [李琼斯]
