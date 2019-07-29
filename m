Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410097852A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 08:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F50389C2C;
	Mon, 29 Jul 2019 06:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9989C2C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 06:45:14 +0000 (UTC)
Received: from localhost (unknown [122.178.221.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95086206BA;
 Mon, 29 Jul 2019 06:45:13 +0000 (UTC)
Date: Mon, 29 Jul 2019 12:14:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/11] dma: Drop JZ4740 driver
Message-ID: <20190729064402.GG12733@vkoul-mobl.Dlink>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-7-paul@crapouillou.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564382714;
 bh=OObfax840R6bh9rjFceVGkLchDJCG652v03RGds9gFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSbox5NdaQ3BOobR6anCjjqjcwe7a/gzulM+4ZQtjQyz1Il7lgEOjtDVlq5tfUGm/
 fyMsz+iLv2edW7yTgjYigFt2ghcb7VqdnJtaNFRZkBflZooGnqSJ125aw/9/GzR4Zq
 E/aKBut0usnFTitcTVppLrBXrAomIQENZkc/MA7s=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUtMDctMTksIDE4OjAyLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IFRoZSBuZXdlciBhbmQg
YmV0dGVyIEpaNDc4MCBkcml2ZXIgaXMgbm93IHVzZWQgdG8gcHJvdmlkZSBETUEKPiBmdW5jdGlv
bmFsaXR5IG9uIHRoZSBKWjQ3NDAuCgpQbGVhc2UgY2hhbmdlIHN1YmpldGMgdG8gZG1hZW5naW5l
OiB4eHgKCkFmdGVyIHRoYXQKCkFja2VkLWJ5OiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3Jn
PgoKLS0gCn5WaW5vZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
