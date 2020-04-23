Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEB1B6736
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1366EA56;
	Thu, 23 Apr 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D146E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587656804;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ybxxfVp12h/EJrmfUJdRJSGTmKH3W7lZYEApLFlERWY=;
 b=X6FvU/DBtmsYsWLS0vmyaEkxyhP9m+VEIVCCHmi+QH1En22qd1T7bYRtQezoBZ6QAa
 2S0rKR6nfCFeq6Lu5kQBTuL1RotC7ZaD8iLxWNfqqJ+J902bRxsdcnnMngHEpAP4WKtb
 fZxrgDlPWWEMbrcuVE+H2SKrRABfmMo3v0TR/b4WvEdq22Dtmx2SfJuG/L2KupTm7nZk
 SKRM2vanuq3GPQ7x5ZfUFJ9jKlrGz6vkBOAHKvoUBWSIA2fN9b81DUsdohEwVdlA65pd
 FU7q+61m9pDG1zZE1o3wXWgnC+ifr3/I8NwcobgpDjnxA5xDTYozRAqVLGnYc4SEUoqN
 Qhgw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCysOfl5tOw33QtdTbGcCRJGxnkq3ByzlXOnoXby"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2692:1500:61a3:e550:2224:7950]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id R0acebw3NFjv7lw
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 23 Apr 2020 17:45:57 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com>
Date: Thu, 23 Apr 2020 17:45:55 +0200
Message-Id: <71F2F964-32C7-41E6-8F1A-A73161EA1BB3@goldelico.com>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
 <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
 <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
 <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
 <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-samsung-soc@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> Am 23.04.2020 um 17:00 schrieb Neil Armstrong <narmstrong@baylibre.com>:
>> One thing we can learn is that "core" seems to be a de facto standard 
>> for the core clock-name. An alternative "gpu" is used by nvidia,gk20a.txt.
> 
> Usually IPs needs a few clocks:
> - pclk or apb or reg: the clock clocking the "slave" bus to serve the registers
> - axi or bus or ahb: the bus clocking the the "master" bus to get data from system memory
> - core: the actual clock feeding the GPU logic

And the sgx544 seems to have two such clocks.

> Sometimes you have a single clock for slave and master bus.
> 
> But you can also have separate clocks for shader cores, .. this depends on the IP and it's architecture.
> The IP can also have memories with separate clocks, etc...

Indeed.

> But all these clocks can be source by an unique clock on a SoC, but different on another
> SoC, this is why it's important to list them all, even optional.
> 
> You'll certainly have at least a reset signal, and a power domain, these should exist and be optional.

Well, they exist only as hints in block diagrams of some SoC data sheets
(so we do not know if they represent the imagination definitions) and the
current driver code doesn't make use of it. Still the gpu core works.

So I do not see any urgent need to add a complete list to the bindings now.

Unless some special SoC integration makes use of them. Then it is IMHO easier
to extend the bindings by a follow-up patch than now thinking about all
potential options and bloating the bindings with things we (the open source
community) doesn't and can't know.

My goal is to keep the bindings as minimalistic as possible. And reset lines
and power domains are (at least for those we have in the works) not needed
to make working systems.

Therefore, for clocks I also would start with a minimalistic approach for
a single optional GPU core clock and leave out reset and power completely.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
