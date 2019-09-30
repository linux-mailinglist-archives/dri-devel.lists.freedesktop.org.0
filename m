Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C71C238E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9896E463;
	Mon, 30 Sep 2019 14:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B10D6E219
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:53:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U8rnne053094;
 Mon, 30 Sep 2019 03:53:49 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8U8rnOB077951
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 03:53:49 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 03:53:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 03:53:40 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8rg90106105;
 Mon, 30 Sep 2019 03:53:45 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
Date: Mon, 30 Sep 2019 11:53:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
Content-Type: multipart/mixed; boundary="------------B5AFA04857B85D38A2202EDD"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 30 Sep 2019 14:43:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569833629;
 bh=FBo4lWc7SZQBiee+AyR2fEK/fVeMfl/F1lYaJqHGLP8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MjfBujUM20XH57MtrMg+Vrs8uHkvkjJTNSdsGFCiAWNO2/1viMNZgVmu+ZsPL45WW
 2p1QLEwauehWW8KMTwhG2Zd1bZth+qvrC3jeYxTGQSLs2G9GcrdK6VjvJWYQDMHrPq
 M52XOxvIo9cP+aI0WKjaqN9kvLtOg1thEiwzmudk=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------B5AFA04857B85D38A2202EDD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2019 09:45, Tomi Valkeinen wrote:
> Hi,
> 
> On 27/09/2019 18:47, Tomi Valkeinen wrote:
>> On 27/09/2019 18:37, Tero Kristo wrote:
>>
>>> If you can provide details about what clock framework / driver does 
>>> wrong (sample clk_set_xyz call sequence, expected results via 
>>> clk_get_xyz, and what fails), I can take a look at it. Just reporting 
>>> arbitrary display driver issues I won't be able to debug at all (I 
>>> don't have access to any of the displays, nor do I want to waste time 
>>> debugging them without absolutely no knowledge whatsoever.)
>>
>> I used your hack patches to allow changing rates via debugfs. And set 
>> dss1_alwon_fck_3430es2 to 27000000 or 27870967. The end result was 
>> that DSS gets some very high clock from dss1_alwon_fck_3430es2, as the 
>> frame rate jumps to many hundreds fps.
>>
>> So, these numbers are not real, but to give the idea what I saw. 
>> Running first with 50 MHz, I can see, say, 40 fps. Then I set the 
>> clock to 30 MHz, and fps dropped to, say, 30fps, as expected with 
>> lower clock. Then I set the clock to 27MHz (or the other one), 
>> expecting a bit lower fps, but instead I saw hundreds of fps.
>>
>> I don't know if there's any other way to observe the wrong clock rate 
>> but have the dss enabled and running kmstest or similar. I can help 
>> you set that up next week, should be trivial. You don't need a display 
>> for that.
> 
> Here's how to reproduce. I have the attached patches. Three of them are 
> the clk-debug ones, and one of mine to make it easy to test without a 
> display, and without underflow flood halting the device. There are on 
> top of v5.3. Kernel config also attached.
> 
> kmstest is from kms++ project (https://github.com/tomba/kmsxx). It 
> should be straightforward to compile, but kmstest binary is also 
> included in TI's rootfs.

Ok, I ignored all your test code and just fiddled with my trusty clk 
debugfs patches. I don't like debugging with test code I have no 
experience with. :)

Anyways, it seems the dpll4_m4_ck max divider value is wrong, it only 
accepts values upto 16 at least on my board. The setting for this in DT 
is 32, and it is most likely SoC specific what happens if you write an 
invalid value to the divider.

The best action here is probably to drop the max-div value for this 
clock to 16. Can someone check this with their display setup and see 
what happens? Attached patch should do the trick.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--------------B5AFA04857B85D38A2202EDD
Content-Type: text/x-patch;
	name="0001-ARM-dts-omap3-fix-DPLL4-M4-divider-max-value.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-ARM-dts-omap3-fix-DPLL4-M4-divider-max-value.patch"

From 28bfaaa3747e9033b6d4cd7bb06eb72dc04580a5 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Mon, 30 Sep 2019 11:49:39 +0300
Subject: [PATCH 1/1] ARM: dts: omap3: fix DPLL4 M4 divider max value

The maximum divider value for DPLL4 M4 divider appears wrong. For most
OMAP3 family SoCs this is 16, but it is defined as 32, which is maybe
only valid for omap36xx. To avoid any overflows in trying to write this
register, set the max to 16 for all omap3 family.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
index 685c82a9d03e..0656c32439d2 100644
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -416,7 +416,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&dpll4_ck>;
-		ti,max-div = <32>;
+		ti,max-div = <16>;
 		reg = <0x0e40>;
 		ti,index-starts-at-one;
 	};
-- 
2.17.1


--------------B5AFA04857B85D38A2202EDD
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--------------B5AFA04857B85D38A2202EDD--
