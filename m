Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E87A837A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 15:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B32510E4A3;
	Wed, 20 Sep 2023 13:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775B410E4A3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 13:33:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 89112CE1AD8;
 Wed, 20 Sep 2023 13:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DACFC433C8;
 Wed, 20 Sep 2023 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695216823;
 bh=kEtomxCuxS+RtMOIXKQtIQVfIDOZG16wGei4amN4ViQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZXBrSAQVUdpQoSymm9p0RqXB8xJjpA65T/07k+ntRqkJ2yXlxxAQv5m92qwdn3mRu
 iJ73eMpGi2YHAgIM72P4vOOMBV4dCRPQdsnfDPPY7fgIW3OlgF3HvrQFaEGl0bZKo/
 lzoPVS3RVHfF3mB7B1fX3BdA0J8+pw0teHzCUliaJ783IgbVupOK/FrS0UQd+TuJc3
 +gPxk5kaa1fWdhqUD8DCHQZ3d43F8iQ3LYJGv4q2adplZZRvGGLcW7jMxQ8uDJpchB
 S4dRX90iXKft/zrT0VsJkcfyZaaru4Yk311tI3YiZpTdTdlfmpYEOVJ5Luw/klvjzs
 VoNaOWPteYccw==
From: Lee Jones <lee@kernel.org>
To: sam@ravnborg.org, bbrezillon@kernel.org, airlied@gmail.com, 
 daniel@ffwll.ch, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 lee@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20230915104849.187146-2-manikandan.m@microchip.com>
References: <20230915104849.187146-1-manikandan.m@microchip.com>
 <20230915104849.187146-2-manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v5 1/8] mfd: atmel-hlcdc: Add compatible for
 sam9x75 XLCD controller
Message-Id: <169521682037.3438630.9896285610873837509.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:33:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023 16:18:42 +0530, Manikandan Muralidharan wrote:
> Add compatible for sam9x75 XLCD controller.
> 
> 

Applied, thanks!

[1/8] mfd: atmel-hlcdc: Add compatible for sam9x75 XLCD controller
      commit: c743c12c79ff716e081095c5a2ba360e42b39d78

--
Lee Jones [李琼斯]

