Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59F282BBA
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 18:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BF989F3C;
	Sun,  4 Oct 2020 16:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FEF89F3C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 16:15:31 +0000 (UTC)
Received: from localhost (unknown [171.61.67.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61CEB2068D;
 Sun,  4 Oct 2020 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601828131;
 bh=ipIbwBDHbGx7U/nYVtWvwEV/y7/NQhikV5Ng+1S41wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkrFjq5pesVDCZqCgigvVGnAkYU3kAenXEVcy0C+EYf4QSa7nY/PHBghx8c3UJ+K0
 V7wA5EiZjeOgOA1F0vSfPpr62TK79z4/hmO6HvTvKyMEs+fXYkKqMHx+Zl0SJ9Rz3x
 kkipw8CWwDYt7zwpufpGFZLd9NoEY63vruFFDBV0=
Date: Sun, 4 Oct 2020 21:45:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another round of adding missing
 'additionalProperties'
Message-ID: <20201004161526.GA2968@vkoul-mobl>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-10-20, 18:41, Rob Herring wrote:

>  .../phy/amlogic,meson-g12a-usb2-phy.yaml      |  2 ++
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml |  2 ++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml |  2 ++
>  .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
>  .../bindings/phy/qcom-usb-ipq4019-phy.yaml    |  2 ++

For phy changes:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
