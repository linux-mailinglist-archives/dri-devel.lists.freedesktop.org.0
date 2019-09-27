Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7FC0694
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C66E125;
	Fri, 27 Sep 2019 13:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409C6E125
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 13:46:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RDjrwT020874;
 Fri, 27 Sep 2019 08:45:53 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDjrgc002726;
 Fri, 27 Sep 2019 08:45:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 08:45:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 08:45:44 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDjnCv008443;
 Fri, 27 Sep 2019 08:45:50 -0500
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
 <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
 <CAHCN7x+ysOEXFCE5DXvoPh6sQBdnHRE8t-KJfcijWesJRx9iXg@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a14fc01a-42b5-b639-f9a6-1739e7e774cd@ti.com>
Date: Fri, 27 Sep 2019 16:45:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7x+ysOEXFCE5DXvoPh6sQBdnHRE8t-KJfcijWesJRx9iXg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569591953;
 bh=uXxOovK5HPFmiue7bR6DICecQ2YMBpOhKnizA5lTgnc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=X5/4Ru1T2/NEkh5PUWOWKNO6OlJvckotvr/kBP5ilqN8Gf10qT4Q1UoHytdCOU27F
 CdGE1rLk4LHQ57IxJPrBEhsLmt0Wz45AZljXC2mZYCOb5vKZZYlucadgP8RBzEhNQN
 k8q5jrTxWuN5FqyIEgv39MfdIen0aQTc910lViUw=
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

T24gMjcvMDkvMjAxOSAxNToxMywgQWRhbSBGb3JkIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDI3LCAy
MDE5IGF0IDE6MjIgQU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDI2LzA5LzIwMTkgMTc6MTIsIEFkYW0gRm9yZCB3cm90ZToKPj4KPj4+PiBB
bmQgd2hhdCBpcyB0aGUgaGRtaTVfY29uZmlndXJlIHRoZXJlPyBJIGRvbid0IHNlZSBhbnl0aGlu
ZyBpbiB0aGUKPj4+PiBkcml2ZXIgdGhhdCB3b3VsZCBwcmludCBoZG1pNV9jb25maWd1cmUuIEFu
ZCwgb2YgY291cnNlLCB0aGVyZSdzIG5vCj4+Pj4gaGRtaTUgb24gdGhhdCBwbGF0Zm9ybS4gSG1t
LCBvay4uLiBpdCdzIGZyb20gY29tcG9uZW50LmMsIHVzaW5nICIlcHMiLgo+Pj4+IFNvbWVob3cg
dGhhdCBnb2VzIHdyb25nLiBXaGljaCBpcyBhIGJpdCBhbGFybWluZywgYnV0IHBlcmhhcHMgYSB0
b3RhbGx5Cj4+Pj4gZGlmZmVyZW50IGlzc3VlLgo+Pj4KPj4+IEknbGwgdHJ5IHRvIHRha2UgYSBs
b29rIGxhdGVyLiAgRm9yIExvZ2ljIFBEIGRpc3RyaWJ1dGlvbnMsIHdlIGNyZWF0ZQo+Pj4gYSBj
dXN0b20gZGVmY29uZmlnIHdpdGggYWxsIHRob3NlIGRyaXZlcnMgcmVtb3ZlZCwgc28gSSdtIG5v
dCB3b3JrZWQKPj4+IHVwIGFib3V0IGl0LCBidXQgaXQgd291bGQgYmUgbmljZSB0byBub3QgY2Fs
bCBkcml2ZXJzIHRoYXQgZG9uJ3QKPj4+IGV4aXN0Lgo+Pgo+PiBTbyB5b3UgaGF2ZSBDT05GSUdf
T01BUDVfRFNTX0hETUk9bj8gVGhlbiBpdCdzIGV2ZW4gbW9yZSBkaXN0dXJiaW5nLCBhcwo+PiB0
aGVyZSdzIG5vIHdheSB0aGUgc3RyaW5nICJoZG1pNV9jb25maWd1cmUiIGNhbiBiZSBpbiB0aGUg
a2VybmVsIGltYWdlLi4uCj4gCj4gRm9yIHRoZSBsb2dzIGFuZCBwcm9ibGVtcyBJIGFtIHNob3dp
bmcgaW4gdGhpcyB0aHJlYWQsIEkgYW0gdXNpbmcgYQo+IHN0b2NrIG9tYXAycGx1c19kZWZjb25m
aWcgd2hpY2ggaGFzIGl0IGVuYWJsZWQuICBJIHdhcyBvbmx5IHRyeWluZyB0bwo+IHN0YXRlIHRo
YXQgSSBhbSBub3Qgd29ycmllZCBhYm91dCB0aGUgb21hcDUgaGRtaSBzdHVmZiwgYmVjYXVzZSB3
aGVuIEkKPiBkbyBhIGN1c3RvbSBkaXN0cmlidXRpb24gZm9yIExvZ2ljIFBELCBJIHJlbW92ZSB0
aG9zZSBjb25maWcgb3B0aW9ucwo+IHRvIG1ha2UgdGhlIGlzc3VlIGdvIGF3YXkuCj4+Cj4+IE1h
eWJlIGl0J3Mgbm90aGluZywgYnV0Li4uIEl0J3MganVzdCBzbyBvZGQuCj4gCj4gSSBkb24ndCB0
aGluayB3ZSBuZWVkIHRvIHdvcnJ5IGFib3V0IGl0IG5vdy4gIElkZWFsbHksIGl0IHdvdWxkIGJl
Cj4gbmljZSB0byBoYXZlIHRoZSBkcml2ZXJzIHJlY29nbml6ZSB0aGV5IGFyZSBub3QgbmVlZGVk
IGFuZCBvciBzZXR1cAo+IHRoZSBLY29uZmlnIG9wdGlvbnMgdG8gbWFrZSB0aGVzZSBkcml2ZXJz
IGRlcGVuZGVudCBvbiB0aGUgcGxhdGZvcm1zCj4gdGhhdCBzdXBwb3J0IGl0IHNvIHVuc2VsZWN0
aW5nIE9NQVA1IGNvdWxkIG1ha2UgdGhlIG9tYXA1IG9wdGlvbnMKPiBkaXNhcHBlYXIuCgpNeSBw
b2ludCBpcyB0aGF0IHNvbWV0aGluZyBpcyBidWdnaW5nIHRoZXJlLiBJdCBzaG91bGQgbm90IHBy
aW50IApoZG1pNV9jb25maWd1cmUsIHJlZ2FyZGxlc3Mgb2Ygc2V0dXAgb3IgcGxhdGZvcm0uIElm
IEknbSBub3QgbWlzdGFrZW4sIAppdCBzaG91bGQgcHJpbnQgImRpc3BjX2NvbXBvbmVudF9vcHMi
LiBCdXQgc29tZWhvdyBpdCBnZXRzIGEgd3JvbmcgCnN5bWJvbCBzdHJpbmcuCgpCdXQgeWVzLCBJ
J20gOTkuOSUgc3VyZSBpdCdzIG5vdCByZWxhdGVkLCBzbyBsZXQncyBpZ25vcmUgaXQgaGVyZSA9
KS4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmth
dHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBL
b3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
