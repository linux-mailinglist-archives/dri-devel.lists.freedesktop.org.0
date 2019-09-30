Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2235C230F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89F6E436;
	Mon, 30 Sep 2019 14:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFEE6E436
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:20:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UEKQRC008662;
 Mon, 30 Sep 2019 09:20:26 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UEKQML098645
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 09:20:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 09:20:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 09:20:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UEKN9N093628;
 Mon, 30 Sep 2019 09:20:23 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com>
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
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
Date: Mon, 30 Sep 2019 17:20:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569853226;
 bh=m3KlGn9eWz5y87zFQfHVSLTzz9MlKOrcN02MWUhNuq0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FontBJ4qo+JAGZ4L71jnf0PHINqfErJo7+9XrODc09frCbtGRAI1whYGCjAjAyYVB
 FwQWXKgOi2aw8emZA+BUV428GfGabSmPBPab2266Xj4XWInquPtTcX2+Swps+3pFIe
 UO+iWYP8ARtuZfnCVRDN0dlSgmEomFYU+RCznqgg=
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
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAxNzoxMiwgQWRhbSBGb3JkIHdyb3RlOgoKPj4gSSBkb24ndCBrbm93IHRo
ZSBpbXBsaWNhdGlvbnMsIHNvIGlmIHRoZSBwZW9wbGUgZnJvbSBUSSBzYXkgc3RpY2sgd2l0aAo+
PiAxNiwgSSdtIGZpbmUgd2l0aCB0aGF0LCBidXQgYXQgbGVhc3QgdGhlcmUgaXMgc29tZSBldmlk
ZW5jZSB0aGF0IGl0Cj4+IGNhbiBiZSBoaWdoZXIgdGhhbiAxNiwgYnV0IGxvd2VyIHRoYW4gMzIu
Cj4+Cj4gCj4gU29ycnkgZm9yIGFsbCB0aGUgc3BhbSwgYnV0IEkgbW92ZWQgYm90aCBvZiB0aGVt
IHRvIDMxIGZyb20gMzIsIGFuZCBpdAo+IGFsc28gc2VlbXMgdG8gd29yayBzdWNjZXNzZnVsbHkg
YXQgMzEuCj4gCj4gWyAgIDI2LjkyMzAwNF0gRFNTOiBzZXQgZmNrIHRvIDM2MDAwMDAwCj4gWyAg
IDI2LjkyMzAzNF0gRElTUEM6IGxjayA9IDM2MDAwMDAwICgxKQo+IFsgICAyNi45MjMwMzRdIERJ
U1BDOiBwY2sgPSA5MDAwMDAwICg0KQo+IFsgICAyNi45MjUwNDhdIERJU1BDOiBjaGFubmVsIDAg
eHJlcyA0ODAgeXJlcyAyNzIKPiBbICAgMjYuOTI1MDQ4XSBESVNQQzogcGNrIDkwMDAwMDAKPiBb
ICAgMjYuOTI1MDQ4XSBESVNQQzogaHN5bmNfbGVuIDQyIGhmcCAzIGhicCAyIHZzdyAxMSB2ZnAg
MiB2YnAgMwo+IFsgICAyNi45MjUwNzldIERJU1BDOiB2c3luY19sZXZlbCAxIGhzeW5jX2xldmVs
IDEgZGF0YV9wY2xrX2VkZ2UgMQo+IGRlX2xldmVsIDEgc3luY19wY2xrX2VkZ2UgLTEKPiBbICAg
MjYuOTI1MDc5XSBESVNQQzogaHN5bmMgMTcwNzdIeiwgdnN5bmMgNTlIego+IFsgICAyNy4zODQ2
MTNdIERJU1BDOiBkaXNwY19ydW50aW1lX3B1dAo+IAo+IElzIGl0IHBvc3NpYmxlIHRvIHVzZSAz
MT8KCkxldCdzIHNlZSB3aGF0IFRlcm8gc2F5cywgYnV0IHllYWgsIHNvbWV0aGluZyBpcyBvZGQg
aGVyZS4gSSBleHBlY3RlZCAKdGhlIG1heCBkaXZpZGVyIHRvIGJlIDE2IHdpdGggVGVybydzIHBh
dGNoLCBidXQgSSBkb24ndCBzZWUgaXQgaGF2aW5nIAp0aGF0IGVmZmVjdC4gSSBjYW4gZ2V0IHRo
ZSBkaXYgdG8gMzEuCgpZb3UgY2FuIHNlZSB0aGlzIGZyb20gdGhlIGNsb2NrIHJlZ2lzdGVyIDB4
NDgwMDRlNDAgKENNX0NMS1NFTF9EU1MpLiBUaGUgCmxvd2VzdCBiaXRzIGFyZSB0aGUgZGl2aWRl
ciwgNSB0byAwLiBUaGUgVFJNIHNheXMgbWF4IGRpdiBpcyAzMi4KClRlcm8gc2FpZCBmb3IgaGlt
IHRoZSBkaXZpZGVycyA+IDE2IGRpZG4ndCAic3RpY2siIHRvIHRoZSByZWdpc3Rlci4gSSdtIApu
b3cgd29uZGVyaW5nIGlmIGhlIGhhcyBhbiBvbGQgYmVhZ2xlYm9hcmQgd2l0aCBPTUFQMzR4eCwg
d2hpY2ggaGFzIG1heCAKZGl2IDE2LgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
