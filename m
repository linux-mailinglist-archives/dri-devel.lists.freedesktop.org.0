Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D430BC5D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 11:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1AC6E0E7;
	Tue,  2 Feb 2021 10:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B766E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 10:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QUFoL1M4pevTeMyLwnDogHEMlQrHMZssskb6wG1LFcA=; b=wg2o6QP/gHbhqBuIhn1RZoUGj
 2iHotGU7ufXkLAWPw4UwYFPNHzUu8ddsLF6ZH7DAZK9ibPxZPao37pY3QUiSj2kNvPg18QoU3RIbp
 SB9YdTsgzRp09KPTWE899TVtBN6b7+9uCVpM084z3RB+393ttTKlzy9IbXmuACxRaE7AQP1axErmx
 9bdLyqL5Tzp+2AR1s8H8Ra8HKPn+VaEgvK7MKLCh/WvBYIcLxWRrMqhYn6+wAR7lOhqYiExSBYnla
 2ZSGKUuSlOCD0mvUg9A5mz9A1bzzWPt0jeQ/XhpyrV3IGp6JHZ9fsbmIMsvJ8Mev9a6w8QLTZD9/a
 CRpSMItzA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38176)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l6tFN-0004FH-LS; Tue, 02 Feb 2021 10:49:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l6tFE-0002yZ-0J; Tue, 02 Feb 2021 10:49:16 +0000
Date: Tue, 2 Feb 2021 10:49:15 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 0/5] amba: minor fix and various cleanups
Message-ID: <20210202104915.GK1463@shell.armlinux.org.uk>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 05:58:30PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig.org@pengutronix.de
> =

> Hello,
> =

> Changes since v2 sent with Message-Id:
> 20201124133139.3072124-1-uwe@kleine-koenig.org:
> =

>  - Rebase to v5.11-rc1 (which resulted in a few conflicts in
>    drivers/hwtracing).
>  - Add various Acks.
>  - Send to more maintainers directly (which I think is one of the
>    reasons why there are so few Acks).
> =

> For my taste patch 4 needs some more acks (drivers/char/hw_random,
> drivers/dma, drivers/gpu/drm/pl111, drivers/i2c, drivers/mmc,
> drivers/vfio, drivers/watchdog and sound/arm have no maintainer feedback
> yet).
> =

> My suggestion is to let this series go in via Russell King (who cares
> for amba). Once enough Acks are there I can also provide a tag for
> merging into different trees. Just tell me if you prefer this solution.
> =

> Would be great if this could make it for v5.12, but I'm aware it's
> already late in the v5.11 cycle so it might have to wait for v5.13.

I think you need to have a 6th patch which moves the
probe/remove/shutdown methods into the bus_type - if you're setting
them for every struct device_driver, then there's no point doing that
and they may as well be in the bus_type.

Apart from that, it looks good.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
