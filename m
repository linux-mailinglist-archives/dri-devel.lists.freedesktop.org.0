Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F062804C66
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627C310E4AB;
	Tue,  5 Dec 2023 08:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F59210E4AB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:31:03 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 9B1E26042D;
 Tue,  5 Dec 2023 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701765062;
 bh=swrVHZbhWDxCODyjsNt232tWJXmmCylCOu5L8kw8Q+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjFPbmXT7q8uOgIzJGh4VmxKxeHkr95aTuM5sK09gM/ph64TOwsasG+jrQoiNl7bK
 LZItCfw2bSweP4pM77h4V6B2/8krGniRklX9Gg0kaGZgoqJO6mD56ZTm1o+7mQfsCT
 fnFE/oWcA7vch8SgDBYQnK5pbO1FbSTxXtUE0X/Vgx1kt2OSA+qaMXgSDimRUqpHbX
 NJcGN1bzGVPpsjL8G99Tg6QoUK2Vjh18SmOoPVZWIsQYPQq+ca7N3pWTfv6xax6vwp
 bcM1z6j5oBxf9T//ZynM5mYrS6iBDsYmmKib2BtJ/m+JAt+ihRfXE+QsmZagu+tFJ0
 9+7XBiWalgTqA==
Date: Tue, 5 Dec 2023 10:30:01 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20231205083001.GP5169@atomide.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
 <20231205075657.GN5169@atomide.com>
 <df7dd7b0-f315-4033-985a-175f75568a8c@linaro.org>
 <20231205081031.GO5169@atomide.com>
 <efcd64f4-00d2-4671-af3a-e27764f70e8d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efcd64f4-00d2-4671-af3a-e27764f70e8d@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Davis <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [231205 08:16]:
> On 05/12/2023 09:10, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [231205 08:03]:
> >> What does runtime PM have to do with it? If runtime PM enables clocks,
> >> these are real signals and not optional.
> > 
> > Runtime PM propagates to the parent device.
> 
> Then it is not really relevant to the hardware talk here, unless you put
> this device clocks in parent node, but then it's just wrong hardware
> description.

No it's not. The interconnect target module may have one or more separate
devices with the same shared clocks. See for example the am3 usb module that
has usb controllers, phys and dma at target-module@47400000 in am33xx.dtsi.

Sure the clock nodes can be there for the child IP, but they won't do
anything. And still need to be managed separately by the device driver if
added.

Regards,

Tony
