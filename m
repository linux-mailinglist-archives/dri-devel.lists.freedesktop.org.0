Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5FABCEF0
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 08:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ABC10E3C6;
	Tue, 20 May 2025 06:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="llnxB6g+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 51459 seconds by postgrey-1.36 at gabe;
 Tue, 20 May 2025 06:05:12 UTC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB38810E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 06:05:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 310CE42E7E;
 Tue, 20 May 2025 06:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747721111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nl4mudUc0nIhyGRm1/GP/8CNdcLzRtbFIzfDOjZEcM=;
 b=llnxB6g+wvmqq2N97pkvrFp96c+QEm5vP4eLMrbwxGzkK6hiR/39F3APB2fwqQudW8U7Ds
 5QIkZ+wbJ2a0QdrdF1RPhvNjuzyxNLaM9PYKzp192l5WhBXkda1eRL81DB9hMMTgJP6A/9
 0d+BdwQePSch8rEuBDb1GMXjBwlfDifyzrqwfNw+wcQa/qgnoD6plrECCsZE9yw8kHgmoc
 /Mx58edhdyfnYV/rSew5mfbL97zgrFf3f8SmDFkyfKdCT09GxLMG80pmcxBb6dzRzkiWRr
 H0Siut0K0wZd6LWqkq8Za0x4mgaJY6U5WFEl14mpgQ4fCMgn+fTXx18RQtZNzw==
Date: Tue, 20 May 2025 08:05:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Tony Lindgren
 <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, Jean-Jacques Hiblot
 <jjhiblot@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Saravana Kannan
 <saravanak@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v6] backlight: led-backlight: add devlink to supplier LEDs
Message-ID: <20250520080508.3a15a949@bootlin.com>
In-Reply-To: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdefgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghltheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhinhhgohhohhgrnhdusehgmhgri
 hhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehprghvvghlsehutgifrdgtiidprhgtphhtthhopehjjhhhihgslhhothesthhirdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Luca,

On Mon, 19 May 2025 22:19:11 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> led-backlight is a consumer of one or multiple LED class devices, but
> devlink is currently unable to create correct supplier-producer links when
> the supplier is a class device. It creates instead a link where the
> supplier is the parent of the expected device.
> 
> One consequence is that removal order is not correctly enforced.
> 
> Issues happen for example with the following sections in a device tree
> overlay:
> 
>     // An LED driver chip
>     pca9632@62 {
>         compatible = "nxp,pca9632";
>         reg = <0x62>;
> 
> 	// ...
> 
>         addon_led_pwm: led-pwm@3 {
>             reg = <3>;
>             label = "addon:led:pwm";
>         };
>     };
> 
>     backlight-addon {
>         compatible = "led-backlight";
>         leds = <&addon_led_pwm>;
>         brightness-levels = <255>;
>         default-brightness-level = <255>;
>     };
> 
> In this example, the devlink should be created between the backlight-addon
> (consumer) and the pca9632@62 (supplier). Instead it is created between the
> backlight-addon (consumer) and the parent of the pca9632@62, which is
> typically the I2C bus adapter.
> 
> On removal of the above overlay, the LED driver can be removed before the
> backlight device, resulting in:
> 
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
>     ...
>     Call trace:
>      led_put+0xe0/0x140
>      devm_led_release+0x6c/0x98
> 
> Another way to reproduce the bug without any device tree overlays is
> unbinding the LED class device (pca9632@62) before unbinding the consumer
> (backlight-addon):
> 
>   echo 11-0062 >/sys/bus/i2c/drivers/leds-pca963x/unbind
>   echo ...backlight-dock >/sys/bus/platform/drivers/led-backlight/unbind
> 
> Fix by adding a devlink between the consuming led-backlight device and the
> supplying LED device, as other drivers and subsystems do as well.
> 
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
