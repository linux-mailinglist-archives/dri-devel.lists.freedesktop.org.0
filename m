Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FC1AB904
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935816EAF3;
	Thu, 16 Apr 2020 06:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE926E9DC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586955858;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=CdHAABA4O4WBpGafReQS38iVaIL+NYE+i3qxsiPxeAo=;
 b=hg0gIqJnH9qIwBU0qyiA4n5j/80TOQTXEZp4ISfzqdcNuEVkSAmzQKpzV5wZkN7mM5
 aEyEpKRoT6a7rHeW1Mhd0+fttHVJWTw96SQTrC74b9TZdmEZUYEJXEzAakPzECO93Wsd
 Lurnqh7BTUczHDGQc8MB+SK5eYu9hOIXwXlq8dszsGYj2lHBMcV62ic1tHoyHBXO1P97
 I3WTH29WT1tdwfSPMidJwcSyF/Q8PfbcOS3QTXST2zKCzhUa5JJFjB9hQhN5gY7+hzPk
 B2+N84qYbreryr1aqaeDNFS0XZl4Wft5lbL2eRMhYBGVQGkG7jlloD77mJiqMNV9BECC
 V3qQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3FD47231
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 15:04:07 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
Date: Wed, 15 Apr 2020 15:04:07 +0200
Message-Id: <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
To: Maxime Ripard <maxime@cerno.tech>,
 Philipp Rossak <embed3d@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 15.04.2020 um 15:02 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
> On Wed, Apr 15, 2020 at 02:41:52PM +0200, H. Nikolaus Schaller wrote:
>>>> The kernel modules built from this project have successfully
>>>> demonstrated to work with the DTS definitions from this patch set on
>>>> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
>>>> partially work on OMAP3530 and PandaBoard ES but that is likely a
>>>> problem in the kernel driver or the (non-free) user-space libraries
>>>> and binaries.
>>>> 
>>>> Wotk for JZ4780 (CI20 board) is in progress and there is potential
>>>> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
>>>> and CedarView devices.
>>> 
>>> If it's not been tested on any Allwinner board yet, I'll leave it
>>> aside until it's been properly shown to work.
>> 
>> Phillip has tested something on a83.
> 
> I'm a bit skeptical on that one since it doesn't even list the
> interrupts connected to the GPU that the binding mandates.

I think he left it out for a future update.
But best he comments himself.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
