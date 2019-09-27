Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98BEBFF06
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 08:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5836EC7F;
	Fri, 27 Sep 2019 06:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7176EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 06:22:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R6M3JX047749;
 Fri, 27 Sep 2019 01:22:03 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R6M3j8023623
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Sep 2019 01:22:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 01:21:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 01:21:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R6M0j7005041;
 Fri, 27 Sep 2019 01:22:00 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
Date: Fri, 27 Sep 2019 09:21:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569565323;
 bh=JqiE37S8xxOHs3Eb1p83iWARD+ZjkZBMD8QHKwW9zZg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=f/f90h4JC0NDBaZuDbsbOj+1bA/0VvhCXP5/J01Dy9T8FXO7chLc5xmaOaqzEOV6g
 PITB2NIDNUWHE7fvWiUHeiAX3L5na5pdz9n/OPDk9nKAbimZeNMXUa8j3gF7YCfPZG
 dSyGN4B5gqd0CNQ61+CsKkIiD7Sui0izh8rCiAeY=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDkvMjAxOSAxNzoxMiwgQWRhbSBGb3JkIHdyb3RlOgoKPj4gQW5kIHdoYXQgaXMgdGhl
IGhkbWk1X2NvbmZpZ3VyZSB0aGVyZT8gSSBkb24ndCBzZWUgYW55dGhpbmcgaW4gdGhlCj4+IGRy
aXZlciB0aGF0IHdvdWxkIHByaW50IGhkbWk1X2NvbmZpZ3VyZS4gQW5kLCBvZiBjb3Vyc2UsIHRo
ZXJlJ3Mgbm8KPj4gaGRtaTUgb24gdGhhdCBwbGF0Zm9ybS4gSG1tLCBvay4uLiBpdCdzIGZyb20g
Y29tcG9uZW50LmMsIHVzaW5nICIlcHMiLgo+PiBTb21laG93IHRoYXQgZ29lcyB3cm9uZy4gV2hp
Y2ggaXMgYSBiaXQgYWxhcm1pbmcsIGJ1dCBwZXJoYXBzIGEgdG90YWxseQo+PiBkaWZmZXJlbnQg
aXNzdWUuCj4gCj4gSSdsbCB0cnkgdG8gdGFrZSBhIGxvb2sgbGF0ZXIuICBGb3IgTG9naWMgUEQg
ZGlzdHJpYnV0aW9ucywgd2UgY3JlYXRlCj4gYSBjdXN0b20gZGVmY29uZmlnIHdpdGggYWxsIHRo
b3NlIGRyaXZlcnMgcmVtb3ZlZCwgc28gSSdtIG5vdCB3b3JrZWQKPiB1cCBhYm91dCBpdCwgYnV0
IGl0IHdvdWxkIGJlIG5pY2UgdG8gbm90IGNhbGwgZHJpdmVycyB0aGF0IGRvbid0Cj4gZXhpc3Qu
CgpTbyB5b3UgaGF2ZSBDT05GSUdfT01BUDVfRFNTX0hETUk9bj8gVGhlbiBpdCdzIGV2ZW4gbW9y
ZSBkaXN0dXJiaW5nLCBhcyAKdGhlcmUncyBubyB3YXkgdGhlIHN0cmluZyAiaGRtaTVfY29uZmln
dXJlIiBjYW4gYmUgaW4gdGhlIGtlcm5lbCBpbWFnZS4uLgoKTWF5YmUgaXQncyBub3RoaW5nLCBi
dXQuLi4gSXQncyBqdXN0IHNvIG9kZC4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
