Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6A1D602E
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434F06E1CE;
	Sat, 16 May 2020 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D766EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589529527;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BlFVs+ve08LHwN7Uvu0hVD6GgM0+61h79p2IJC+S0j0=;
 b=nZhSf7cavq4kP7i3RXJRTD1gZE8VSgDbMkiMcUVtyZBjs7b6yN3EvlwuJJljmir2K3
 FTo8Dn0mJtU0SEknWvaR7PEJCc5Ph5sqjCKlneSK5QhlORCg6IlqnshQP89FkiBTMN+l
 52Yyn+uwxWfcN1wKWx4MY/I0tf7YwM8Aqi8urM3CxyUTrLEO0BZJRvewVjZC/m4iobZy
 h95zdLSEHLhxSbPNroTE4HSpXTkN/j9NdXETsXFFhujeZVkPhXKwimLupilVMoIoUOOQ
 jHzvf/cGiUHRfJClPQxv8DbgP4A+wlS5HXoLOk3dOV++5FXMmgYFygGPzVWU078Zp2wL
 zeOg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOvBTU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw4F7wWYfs
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 15 May 2020 09:58:32 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200503150143.GG37466@atomide.com>
Date: Fri, 15 May 2020 09:58:31 +0200
Message-Id: <9A411DCE-A882-4868-9265-532D79922F6E@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
 <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
 <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
 <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
 <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
 <8EER9Q.C206SXNSICP7@crapouillou.net> <20200503150143.GG37466@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tony,

> Am 03.05.2020 um 17:01 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * Paul Cercueil <paul@crapouillou.net> [200503 14:19]:
>> You have a new SoC with a SGX, and you only need to enable one clock to get
>> it to work. So you create a devicetree node which receives only one clock.
>> 
>> Turns out, that the bootloader was enabling the other 3 clocks, and since
>> the last release, it doesn't anymore. You're left with having to support a
>> broken devicetree.
>> 
>> That's the kind of problem that can be easily avoided by enforcing the
>> number of clocks that have to be provided.
> 
> The number of clocks depends on how it's wired for the SoC.
> 
> On omaps, there's are no controls for additinoal SGX clocks. Sure some
> of the clocks may be routed to multple places internally by the wrapper
> module. But we have no control over that.
> 
> If we wanted to specify just the "fck" clock on omaps, then we can
> do it with something like this:
> 
> allOf:
>  - if:
>    properites:
>      compatible:
>        enum:
> 	  - "ti,omap4-sgx544-112"
> 	  - "ti,omap5-sgx544-116"
> 	  - "ti,dra7-sgx544-116"
>    then:
>      properties:
>        clocks:
> 	  minItems: 1
> 	  maxItems: 1
> 
>        clock-names:
> 	  const: fck
> 
>    required:
>      - clocks
>      - clock-names

will add to v8 of this series as a separate patch on top of the
general one. This should make it easier to have a focussed discussion
and revert/bisect if something goes wrong.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
