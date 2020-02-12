Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0D15A33D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42C76F482;
	Wed, 12 Feb 2020 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837B76E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581495265;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=uw1pmQHS7f3RyDkV/aP+o5WvUTjTvnxcA78I0t7OepI=;
 b=jxM+htqSoChKt3T2ng3O30PBU1dx886M4kCCnuTnuWpfQKz4fX9YDchHjheX+eTWcm
 /kMfpg9ouIx5DDWZm6bz8GNJj010NCBy/R9H4UCKlkhqX1dwL+jPrNmPG4Z50ZOVO1s8
 Ns4hpVqgfsH9e8KPg0d2t/99736akjRkN2TvrI89mFPyJUdqcLLBG2HRwz7sHURhuvl0
 K1NAEmHTSWQ0lUAT7siIoQGBk+oMRS3dOhCPqFp14mlaE1zWsM9Uu8pS9wFumj+kZ9VK
 jLo0w7l/lczDn/rELMG5EVaZkbVc45+5WTrjerKdsvwPdjC6ZjCFy8vih3pG7ewriSvq
 mQrQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSbXAgODw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1C8Ds1dj
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 12 Feb 2020 09:13:54 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 03/14] net: davicom: dm9000: allow to pass MAC address
 through mac_addr module parameter
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAMuHMdX6f+aGZjQSQqVjT=npojq5xH2k2Js8qxG5=n26Z4uFBw@mail.gmail.com>
Date: Wed, 12 Feb 2020 09:13:52 +0100
Message-Id: <C7991495-F233-4186-82A2-43C39898C8B3@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
 <4e11dd4183da55012198824ca7b8933b1eb57e4a.1581457290.git.hns@goldelico.com>
 <20200211222506.GP19213@lunn.ch>
 <CAMuHMdX6f+aGZjQSQqVjT=npojq5xH2k2Js8qxG5=n26Z4uFBw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, James Hogan <jhogan@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Richard Fontana <rfontana@redhat.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alex Smith <alex.smith@imgtec.com>,
 =?utf-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Allison Randal <allison@lohutok.net>, netdev <netdev@vger.kernel.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 12.02.2020 um 09:07 schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
> 
> On Tue, Feb 11, 2020 at 11:25 PM Andrew Lunn <andrew@lunn.ch> wrote:
>> On Tue, Feb 11, 2020 at 10:41:20PM +0100, H. Nikolaus Schaller wrote:
>>> This is needed to give the MIPS Ingenic CI20 board a stable MAC address
>>> which can be optionally provided by vendor U-Boot.
>>> 
>>> For get_mac_addr() we use an adapted copy of from ksz884x.c which
>>> has very similar functionality.
>>> 
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> 
>> Hi Nikolaus
>> 
>> Please split these patches by subsystem. So this one patch needs to go
>> via netdev.
>> 
>>> +static char *mac_addr = ":";
>>> +module_param(mac_addr, charp, 0);
>>> +MODULE_PARM_DESC(mac_addr, "MAC address");
>> 
>> Module parameters are not liked.
>> 
>> Can it be passed via device tree? The driver already has code to get
>> it out of the device tree.
> 
> Yep, typically U-Boot adds an appropriate "local-mac-address" property to the
> network device's device node, based on the "ethernet0" alias.
> 
> However, the real clue here may be "vendor U-Boot", i.e. no support for the
> above?

Yes. It is a fallback solution like it is implemented for ksz884x.c to make it
work with existing (older) U-Boot installation.

Maybe I should better clarify this in the commit message for v2 (which goes
to netdev only).

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
