Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F30ABA31E
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 20:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29E910EB75;
	Fri, 16 May 2025 18:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Mh11vKnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D8010EB73
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:47:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D57543155;
 Fri, 16 May 2025 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747421250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lqQXD9Q9jfyGYo4y6j27XcbvfdwUtHoucCG3UKJI5E=;
 b=Mh11vKnpY6MONWDMsThK7Cqb138ZIMoMt5g3566QT39UcP4s+R/AphtZisgoYg2wMrmt26
 uCHmHUiwoBS/d+k4ypoFmoU6PwGx/5SCPw242o5BRNbZ9Brta2/XM7w61rXy0V+DVsjG/b
 4gByw4R4GGCDNAs0Z8TrpkuGwtLCZsCp5ggAIFAQPv+ZXfY2zCZEr639AnTYMvwHL69Hv2
 rmhO3i28gLr471jhvk2d8qisOXRIPRK77FLgicXJTG8vVCLvWg44teiH4UMa2O0LPJDCWa
 lBct2WiiHT4TnLlHeUmE5q8g3BWDWEggx1CIZdBzdqYSWyy3OApp2llreF768w==
Date: Fri, 16 May 2025 20:47:27 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to
 supplier LEDs
Message-ID: <20250516204727.4d87e700@booty>
In-Reply-To: <b5d2b71ffc38eb1980ce72994a20e8f6ee7869bd.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
 <fa87471d31a62017067d4c3ba559cf79d6c3afec.camel@siemens.com>
 <b5d2b71ffc38eb1980ce72994a20e8f6ee7869bd.camel@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesshhivghmvghnshdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhto
 heplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhgsuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Alexander,

On Mon, 12 May 2025 12:13:54 +0000
"Sverdlin, Alexander" <alexander.sverdlin@siemens.com> wrote:

> > I've tested the patch wit LP8864 LED as a provider for led_bl, removing the
> > underlying I2C bus. The patch avoids the crash for me (by removing led_bl device as well),
> > thanks for fixing it!
> > 
> > Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>  

Thanks for the feedback! I will have a look next week, perhaps sending
a new version of this patch alone (outside of the series).

> Would it make sense to add
> 
> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> 
> ?

Probably.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
