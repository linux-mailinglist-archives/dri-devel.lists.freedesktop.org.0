Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F316015BA97
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B4D6F553;
	Thu, 13 Feb 2020 08:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA46F517
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581519605;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=3yrlgbwpWQZTwSSfMKPtb8XHqELW1Q2VHBhevB4Ahuo=;
 b=X235jz1KfncYhSpcUgS+6VQ+M8ewQinfTuBxLmHf7c+mkco0Knd63dXq01ZN/7ypk/
 ZR8Beby0Wj/x/th+/JXjiKb1EwjHYnoFmjshM+IMeC74VodxOOxC8CUV/vy1Uudx7mrC
 9lmPQ5MgrEqASUymMXnuWWQHLi07TLjg9dzAX8lBnZS+rrw156gBTcSI6qTzBNblIZeB
 1mfbh/NgI84/U2UubqoIT9RXKsCSWjo73zMs9im4s+M5WHuqy+8nU0TKJc/IwZjldT2b
 JRp6LQBmygc4tgBlEqT3xoT4QffuO60iP66P+mgtGD8ktTc8GYUjLFwgqpfQbtO26GIz
 8sDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSbXAgODw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1CExt59j
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 12 Feb 2020 15:59:55 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: i2c: jz4780: silence log flood on txabrt
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200212145356.GB2492@ninjato>
Date: Wed, 12 Feb 2020 15:59:55 +0100
Message-Id: <0C9F4243-159B-418C-B481-4B45B210F9F6@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
 <7facef52af9cff6ebe26ff321a7fd4f1ac640f74.1581457290.git.hns@goldelico.com>
 <20200212094628.GB1143@ninjato>
 <213C52CC-E5DC-4641-BE68-3D5C4FEA1FB5@goldelico.com>
 <20200212145356.GB2492@ninjato>
To: Wolfram Sang <wsa@the-dreams.de>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Richard Fontana <rfontana@redhat.com>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alex Smith <alex.smith@imgtec.com>,
 =?utf-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, devicetree@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Allison Randal <allison@lohutok.net>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 12.02.2020 um 15:53 schrieb Wolfram Sang <wsa@the-dreams.de>:
> 
> Hi,
> 
>>> Sorry, normally I don't do counter patches. Yet, this time I realized
>>> that it would be faster to actually do what I envisioned than to
>>> describe it in words. I hope you don't feel offended.
>> 
>> No problem. I had thought a little about that myself, but did not
>> dare to solve more than my problem...
> 
> Glad you like it. Well, it still kinda solves your problem only, because
> there are still too many dev_err in there, but I think this is good
> enough for now.
> 
>>> Obviously, I can't test, does it work for you?
>> 
>> Yes,it works.
> 
> Good!
> 
>> Do you want to push your patch yourself, or should I add it to my
>> patch series and resubmit in a v2?
> 
> I'll apply the patch to my tree directly as a bugfix for 5.6. You can
> drop the I2C list from V2 then.

Ok, fine.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
