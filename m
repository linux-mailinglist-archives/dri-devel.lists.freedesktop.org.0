Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF34198D1A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFDB6E58B;
	Tue, 31 Mar 2020 07:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC076E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585586000;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=m5OQurJ34G52si3xIHL2HoNqFTlRdT/1c2JFQwVStnA=;
 b=r3r7TTHB0p/khSYoVlIPUiiO7YgnPxWmaPHNaOPSfPy6HTLJNT5mR23whLcm2Tj9Dl
 mjPFDh3KmAaNGiXL9M4GCLSclSNaiG9o3EBXhbRtrj7s8parRqVhHqFDdwIb0iPhqt58
 8LZ8Qwsr1dgP4MN+4qOacMsq0pqYHpDha5pymgEPWl9y7OsSMgGOiyxSp3vvo5rYF1N+
 noZ/HcfUbdq5nCrGejnctFTldZPywQXEf79dO8Q7V8jQigqr050TuoS6ua2lU9gE/W/m
 WBHPccn8qiF3koK0q/rsYWTqNYHMmyq7Cm7YJcocd4lSmanZGvBOV0IvBd0y0V5/WCm/
 SzOg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw43oE44="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w2UGXBGiV
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 30 Mar 2020 18:33:11 +0200 (CEST)
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic,
 lcd.txt to ingenic, lcd.yaml
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200330154202.GA23233@bogus>
Date: Mon, 30 Mar 2020 18:33:10 +0200
Message-Id: <02E5EC5D-1FBB-45E4-907E-10450B449726@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
 <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
 <20200330154202.GA23233@bogus>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>,
 Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 30.03.2020 um 17:42 schrieb Rob Herring <robh@kernel.org>:
> 
> On Sun, 29 Mar 2020 19:35:47 +0200, "H. Nikolaus Schaller" wrote:
>> and add compatible: jz4780-lcd, including an example how to
>> configure both lcd controllers.
>> 
>> Also fix the clock names and examples.
>> 
>> Based on work by Paul Cercueil <paul@crapouillou.net> and
>> Sam Ravnborg <sam@ravnborg.org>
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic,lcd.txt          |  45 ------
>> .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
>> 2 files changed, 128 insertions(+), 45 deletions(-)
>> delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
>> create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic,lcd.example.dt.yaml: lcd-controller@13050000: clocks: [[4294967295, 9]] is too short
> 
> See https://patchwork.ozlabs.org/patch/1263508

If I read the message correctly, I think there should be 2 clocks specified in
the jz4725b-lcd example and not just

	clocks = <&cgu JZ4725B_CLK_LCD>;

Unfortunately the jz4725b.dtsi does not seem to be upstream or in linux-next so
I don't know if it works without lcd_pclk or not.

If there is really just one clock, we need to modify the clocks and clock-names
schema and add minItems: 1 and maxItems: 2 to allow for this flexibility.

Otherwise we have to fix the example. Do you have some git with an up-to-date
jz4725b.dtsi to look at?

> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

+++ :)

> 
> Please check and re-submit.

Sure, since it is a RFC.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
