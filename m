Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9A652622
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 19:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8226910E0EE;
	Tue, 20 Dec 2022 18:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953410E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 18:19:50 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1322d768ba7so16386581fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yvYSUhN9Lgqqo8NRRxAwZN/kbVSJbYqRGacsJ+ZY83o=;
 b=gVTj56kTY271J30eCFowYoUT0PanPIZFMaj1TlpXg9IgiX3nRbyHxeBeeXbWQ3r7oU
 CggKYBoxAHpgVffQWtfaOsz3wNTW9Ht1oOCIl0T7jPZwWgxFzcpV/NvdkS4HPSteE0LY
 cKZRu8aHUHGic2ufg0CwB1A3sHY0kbK2jlMtCT1Khvf6Nx3jgWNG8/GEbazTfG40RSff
 1MOtggMbo8ZzB9XEZ9YdRAe0Dvfp1FVCUW3Ps4XM0HoAXR5BIEhW7sD6KtdYEq1RYKk0
 9vW/UT6tUR+KhKBR8DrVRNC/Kgv4H6oSVWTIE9/AtSfFDc1VaS1oHTL9bv+vFaF0ZLJn
 cYew==
X-Gm-Message-State: ANoB5pkNT/7gSe3JN88n/OI2TvAlmjTFRktqEZAWlR2rzr9CIDW8lxZq
 Cmc42rq50KPzrHnSzjD2/g==
X-Google-Smtp-Source: AA0mqf4DhOxwDe9Kor6K8GQK2yyyxze1bgPG9xFLll91lFoFwbbg5+AyBLIX7Xq27noEvso5Iwxv5w==
X-Received: by 2002:a05:6870:ed45:b0:144:a626:218b with SMTP id
 ex5-20020a056870ed4500b00144a626218bmr22778212oab.56.1671560390074; 
 Tue, 20 Dec 2022 10:19:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056871041400b0013c8ae74a14sm6257284oag.42.2022.12.20.10.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 10:19:49 -0800 (PST)
Received: (nullmailer pid 858419 invoked by uid 1000);
 Tue, 20 Dec 2022 18:19:48 -0000
Date: Tue, 20 Dec 2022 12:19:48 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 0/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <20221220181948.GA828243-robh@kernel.org>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216235758.GA88372-robh@kernel.org>
 <20221217183806.bvo5vypm6axycdte@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221217183806.bvo5vypm6axycdte@pengutronix.de>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 17, 2022 at 07:38:06PM +0100, Uwe Kleine-König wrote:
> On Fri, Dec 16, 2022 at 05:57:58PM -0600, Rob Herring wrote:
> > On Fri, Dec 16, 2022 at 06:50:04PM +0100, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > Changes since v2:
> > > 
> > >  - added allOf as Krzysztof requested
> > >  - reworked driver based on Philipp's comments
> > >    (improved error handling, different selects, moved driver to a subdirectory,
> > >    header sorting, drm_err instead of DRM_ERROR, inlined
> > >    imx_lcdc_check_mode_change, make use of dev_err_probe())
> > >  
> > > Krzysztof also pointed out that we're now having two compatibles for a
> > > single hardware. Admittedly this is unusual, but this is the chance that
> > > the (bad) compatible identifier imx21-fb gets deprecated. The hardware
> > > is called LCDC and only the linux (framebuffer) driver is called imxfb.
> > 
> > The problem is you can't have firmware (with the DTB) that supports 
> > both. Well, you can if you want to have some firmware setting that 
> > selects which one. Otherwise, it's really an OS problem to decide what 
> > to use. 
> 
> I don't understand what you intend to say here. The same applies if the
> compatible is the same for both binding alternatives, isn't it? 

Only if you have both nodes in the DT and both enabled. But 2 enabled 
nodes at the same address is also a dtc warning, so I was assuming you 
didn't do that.

> Do you consider a firmware problem better or an OS problem?

The OS created the problem, so they get to keep it. But a PC BIOS is 
full of OS compatibility switches, so...

In the end, it's the platforms' decision really. I just want what the 
implications of having 2 compatibles are to be understood.

Rob
