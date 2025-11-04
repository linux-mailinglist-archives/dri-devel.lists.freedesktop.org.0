Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C59C300B4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928F910E55F;
	Tue,  4 Nov 2025 08:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0l18l1Ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B510E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 08:49:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B49384E414EF;
 Tue,  4 Nov 2025 08:49:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 873B5606EF;
 Tue,  4 Nov 2025 08:49:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B3E110B50978; Tue,  4 Nov 2025 09:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762246183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+tnp7G3ycwRnFF38hQrrWjWXR0KKwEMtXOrxp4e42tw=;
 b=0l18l1EcsipvNaABsQ4OBR3pQhYZjQlb/sgy9nI/k3hijfsR0CbIIjE1gdyaJUb0Pe0mLX
 fOrlQbZ+I9IkAqQK8psRVPIyZ+mO1/FGxGDzOsGNfRpRzzQhHWz8wPIvlW1RIre658qLEW
 5Ybapx3Yly8nvatPJBzrEUckVxQGX8NCKtA+uL+zxU//Tp1J8lFMLoegWHwmC5XdvqotNf
 XDiAFVyqTRRUlNI2i9l8TmhPUUzwPsUbKtYn+DYBPMgMwGzvdPQQUALNN6Y8DGfzEaSRny
 ti73SUEEWACLJPMtc3fkJroYNyJ6tQ17aaTnnK0P9T9YXxssJC1YpdujjxxXhQ==
Date: Tue, 4 Nov 2025 09:49:37 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/3] drm/panel: Add support for the Leadtek LTK08QV25BYL
 panel
Message-ID: <20251104094937.042afc40@bootlin.com>
In-Reply-To: <c47fc9bd-c041-4fc7-b08d-8f15622f4fba@linaro.org>
References: <20251021073408.195959-1-herve.codina@bootlin.com>
 <20251021073408.195959-3-herve.codina@bootlin.com>
 <c47fc9bd-c041-4fc7-b08d-8f15622f4fba@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Neil,

On Wed, 29 Oct 2025 21:45:24 +0100
Neil Armstrong <neil.armstrong@linaro.org> wrote:

...

> > +
> > +static const struct drm_display_mode ltk028qv25byl_mode = {
> > +	.hdisplay       = 240,
> > +	.hsync_start    = 240 + 120,
> > +	.hsync_end      = 240 + 120 + 4,
> > +	.htotal         = 240 + 120 + 4 + 120,
> > +	.vdisplay       = 320,
> > +	.vsync_start    = 320 + 8,
> > +	.vsync_end      = 320 + 8 + 2,
> > +	.vtotal         = 320 + 8 + 2 + 6,
> > +	.clock          = 10000000 / 1000,  
> 
> Usually we calculate the clock from the mode parameters, won't it work here ?
> 

The panel has an internal oscillator an the data transfer need to be sync with
this oscillator.

10M pixel per sec is the value set by the vendor.
I tried to use a value based on other mode parameters such as
  (240 + 120 + 4 + 120) * (320 + 8 + 2 + 6) * 60 / 1000

and it didn't work. I also tried ' ... * 90 / 1000) and ' ... * 100 / 1000)
without better results.

I can add a comment if you want in the next iteration to spot the value:
--- 8< ---
	.clock          = 10000000 / 1000,  /* 10 Mbps, internal panel oscillator */
--- 8< ---

Let me know.


...

> > +	ctx->iovcc = devm_regulator_get(dev, "iovcc");
> > +	if (IS_ERR(ctx->iovcc))
> > +		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
> > +				     "Failed to get iovcc regulator\n");  
> 
> Can you switch to devm_regulator_bulk_get_const() ?

Yes, I will do that in the next iteration.

Best regards,
Hervé
