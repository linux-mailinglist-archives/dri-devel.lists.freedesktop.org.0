Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140D77871E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 07:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE4E10E655;
	Fri, 11 Aug 2023 05:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A9E10E655
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 05:53:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 104E840005;
 Fri, 11 Aug 2023 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691733222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNk4YUvVLgEnJuWGDn/lCvoxEjA0/6874Hfwr58t2dU=;
 b=ZsaDZsTK90x53D6QzGeChgCkbKAIkmtF4dQswziNM++ndDaGPnAppXdT8xp9EX9Pm1g4f8
 FMANfcUtdtxOx9vBFo4Xr0UnObTMuZAjTteLaa1Bme6JmVlhgy56P1W62DM3XHQgkiryXp
 8dQ5XVzHZ0taDYd5knpKKq9H6HbYIEuOsyUGIOV4033fNEYP+/+w8kgJoe0sjFzEihvrfr
 7QLEFoGwLrJCCWeDFcdDLpmZ1uSqbCdPNhcBi66L34rmqHg7VjEEM81uoxsUtFfHVQBm1p
 4+V4YJJwfyLPmH1K4oBMdxR6rdtRGOkz/z95r+rANxELx39qeX0UmrmjWXlw8A==
Date: Fri, 11 Aug 2023 07:53:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230811075338.5c6852eb@xps-13>
In-Reply-To: <20230810173125.GA91332@ravnborg.org>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
 <20230610200515.GA1041001@ravnborg.org>
 <20230807111246.663637a6@xps-13>
 <20230807165245.GA281773@ravnborg.org>
 <20230808083338.5e31584c@xps-13>
 <20230810084552.3db3d8c6@collabora.com>
 <20230810173125.GA91332@ravnborg.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, rfoss@kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

sam@ravnborg.org wrote on Thu, 10 Aug 2023 19:31:25 +0200:

> > I queued it to drm-misc-next this morning. =20

Yeah, thanks a lot!

Cheers,
Miqu=C3=A8l
