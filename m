Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19CA1302EE
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 16:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930486E437;
	Sat,  4 Jan 2020 15:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D546E437
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 15:14:34 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id t17so43951481eds.6
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2020 07:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WbG/N/LSoHk2YTqa3eDPjLF2IOWdPaPqeW4XU/oPb/M=;
 b=FbJOs1MnUoMrfcNPJKrN9fyCIjSb9v+VWw6XrsWzvQ/wcxE7x52O7g5fzih94AO7D7
 SU0S89gBF6lQnO6htF+OvepGE004rrC0z6kj8Uo6dAkIFX2lIIjYNeQvPHVRj+Vt6ok2
 OQ+MvN2WeBlv+/W3jdswb+kxqTBC0DkYalHXvh2YFSt73kzHCsvkNeO1bfP/xNQJnMe/
 c9BwkYjm+oVoaSJnhRm+CVXwlbu7UJnUBsO1sbnukn6kHyQUNsXb8twHdGLpeU5bjJDa
 bw8mfAGw0wxbG8kQf4XtVDq8oGv3art17Clw6ciafmuRcNajFnmIqh5IOEeXB5RMlira
 nR7w==
X-Gm-Message-State: APjAAAVGL3i2CmbkBXe3XP3jTQ+hpi8uWl07BISbOlFxeqO//tPCi1wK
 mVOOC5N/6ENcTysAckZaQCQ=
X-Google-Smtp-Source: APXvYqxtPcJrcDVfHvO9Vde+e8jGl7im2+LeWliDMUdl8pgQF8H9I/YBkjl8MFVzvX4RdYUOJ3nKpg==
X-Received: by 2002:a17:906:52d7:: with SMTP id
 w23mr100645824ejn.74.1578150873422; 
 Sat, 04 Jan 2020 07:14:33 -0800 (PST)
Received: from kozik-lap ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id f2sm7815826ejr.52.2020.01.04.07.14.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 Jan 2020 07:14:32 -0800 (PST)
Date: Sat, 4 Jan 2020 16:14:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 00/19] Rename Samsung and Exynos to lowercase
Message-ID: <20200104151428.GA13130@kozik-lap>
References: <20200103171131.9900-1-krzk@kernel.org>
 <CAL_Jsq+CO2VBNodi6DJNi-UydwTANJp42pSaf8GzE3RMQSsm6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+CO2VBNodi6DJNi-UydwTANJp42pSaf8GzE3RMQSsm6g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, PCI <linux-pci@vger.kernel.org>,
 Kamil Debski <kamil@wypas.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, netdev <netdev@vger.kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Vipul Pandya <vipul.pandya@samsung.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>, Zhang Rui <rui.zhang@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Byungho An <bh74.an@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Girish K S <ks.giri@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Felipe Balbi <balbi@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Jingoo Han <jingoohan1@gmail.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Murray <andrew.murray@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 03, 2020 at 02:25:41PM -0700, Rob Herring wrote:
> On Fri, Jan 3, 2020 at 10:11 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Hi all,
> >
> > The "Samsung" and "Exynos" names are written inconsistently in Linux
> > kernel sources. Sometimes all uppercase (as SAMSUNG), sometimes
> > lowercase with capital letter (as Samsung).
> >
> > This patchset tries to unify this towards "Samsung" and "Exynos"
> > versions because:
> >
> > 1. "SAMSUNG" and "EXYNOS" are not abbreviations but regular trademarked
> >     names.  Therefore they should be written with lowercase letters starting
> >     with capital letter.
> >
> > 2. The lowercase "Exynos" name is promoted by its manufacturer Samsung
> >    Electronics Co., Ltd., in advertisement materials and on website [1].
> >
> > 3. Although advertisement materials usually use uppercase "SAMSUNG", the
> >    lowercase version is used in all legal aspects (e.g. on Wikipedia [2]
> >    and in privacy/legal statements on Samsung site [3]).
> >
> > Patches are independent of each other so I expect they will go through
> > each maintainer's tree. Optionally let me know - I'll take it then
> > through samsung-soc tree.
> >
> > [1] https://www.samsung.com/semiconductor/minisite/exynos/
> > [2] https://en.wikipedia.org/wiki/Samsung
> > [3] https://www.samsung.com/semiconductor/privacy-global/
> >
> > Best regards,
> > Krzysztof
> >
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Kamil Debski <kamil@wypas.org>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Byungho An <bh74.an@samsung.com>
> > Cc: Girish K S <ks.giri@samsung.com>
> > Cc: Vipul Pandya <vipul.pandya@samsung.com>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Andrew Murray <andrew.murray@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Sangbeom Kim <sbkim73@samsung.com>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Zhang Rui <rui.zhang@intel.com>
> > Cc: Amit Kucheria <amit.kucheria@verdurent.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jiri Slaby <jslaby@suse.com>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: linux-media@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-pm@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: netdev@vger.kernel.org
> > Cc: linux-pci@vger.kernel.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-fbdev@vger.kernel.org
> >
> > Krzysztof Kozlowski (19):
> >   arm64: dts: exynos: Rename Samsung and Exynos to lowercase
> >   ARM: dts: samsung: Rename Samsung and Exynos to lowercase
> >   ARM: samsung: Rename Samsung and Exynos to lowercase
> >   soc: samsung: Rename Samsung and Exynos to lowercase
> >   thermal: exynos: Rename Samsung and Exynos to lowercase
> >   media: samsung: Rename Samsung and Exynos to lowercase
> >   usb: exynos: Rename Samsung and Exynos to lowercase
> >   memory: samsung: Rename Exynos to lowercase
> >   phy: exynos: Rename Exynos to lowercase
> >   clocksource/drivers/exynos_mct: Rename Exynos to lowercase
> >   crypto: exynos-rng - Rename Exynos to lowercase
> >   devfreq: exynos: Rename Exynos to lowercase
> >   drm/exynos: Rename Exynos to lowercase
> >   video: exynos: Rename Exynos to lowercase
> >   pci: exynos: Rename Exynos to lowercase
> >   serial: samsung: Rename Exynos to lowercase
> >   mfd: samsung: Rename Samsung to lowercase
> >   net: ethernet: sxgbe: Rename Samsung to lowercase
> >   regulator: samsung: Rename Samsung to lowercase
> >
> >  .../bindings/media/exynos-jpeg-codec.txt      |  2 +-
> >  .../devicetree/bindings/media/exynos5-gsc.txt |  2 +-
> >  .../bindings/media/samsung-fimc.txt           |  2 +-
> >  .../bindings/media/samsung-mipi-csis.txt      |  2 +-
> >  .../devicetree/bindings/phy/samsung-phy.txt   |  6 ++--
> 
> Please split bindings to a separate patch.

Sure, let me resend.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
