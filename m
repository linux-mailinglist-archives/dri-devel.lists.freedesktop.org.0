Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322C144E70
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 10:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6C56F409;
	Wed, 22 Jan 2020 09:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFC66F409
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 09:15:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00M9FMLM122955;
 Wed, 22 Jan 2020 03:15:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579684522;
 bh=p6TXy9D8Jj5ZMAsUl92rse85KpLnXYI0D7il7xeObjo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uBtieWXwbpXSnRK/R3juokz75ZF07c3mFcuNzH5xfgGKpgBJPYDmetcojC/2gI9gN
 0VOEXTfL2++aG1uTJbYPyywW3QlkZZVZYsgZZaJUD4mknt6vWvHEYL0OY/TgmX2SW2
 Ngi7YqDlsI0/rO0y0n5xfRIm29JqCAdjoS1cC6wk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00M9FM9x030906;
 Wed, 22 Jan 2020 03:15:22 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 03:15:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 03:15:22 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00M9FJa9046831;
 Wed, 22 Jan 2020 03:15:19 -0600
Subject: Re: [PATCH 2/2] drm/bridge: Add tc358768 driver
To: Andrzej Hajda <a.hajda@samsung.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <narmstrong@baylibre.com>
References: <20191217101506.18910-1-peter.ujfalusi@ti.com>
 <CGME20191217101520epcas1p4a2bdee0cab0c11670b74fbe9e9397835@epcas1p4.samsung.com>
 <20191217101506.18910-3-peter.ujfalusi@ti.com>
 <35d664fe-8091-2744-abf2-69828ebf1148@samsung.com>
 <14306079-500d-09ca-df94-4cf72c43f858@ti.com>
 <cdc941c5-681f-962b-7f99-ebfda6aaaa91@samsung.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <e8774c16-c34c-adf8-fee5-17323dcd95bf@ti.com>
Date: Wed, 22 Jan 2020 11:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cdc941c5-681f-962b-7f99-ebfda6aaaa91@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIDIyLzAxLzIwMjAgMTAuNDYsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4+
Pj4gK3N0cnVjdCB0YzM1ODc2OF9wcml2IHsKPj4+PiArCXN0cnVjdCBkZXZpY2UgKmRldjsKPj4+
PiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4+PiArCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0
X2dwaW87Cj4+Pj4gKwlzdHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSBzdXBwbGllc1tBUlJBWV9T
SVpFKHRjMzU4NzY4X3N1cHBsaWVzKV07Cj4+Pj4gKwlzdHJ1Y3QgY2xrICpyZWZjbGs7Cj4+Pj4g
Kwo+Pj4+ICsJc3RydWN0IG1pcGlfZHNpX2hvc3QgZHNpX2hvc3Q7Cj4+Pj4gKwlzdHJ1Y3QgZHJt
X2JyaWRnZSBicmlkZ2U7Cj4+Pj4gKwlzdHJ1Y3QgdGMzNTg3NjhfZHNpX291dHB1dCBvdXRwdXQ7
Cj4+Pgo+Pj4gU2luY2UgdGMzNTg3NjhfZHNpX291dHB1dCBpcyB1c2VkIG9ubHkgaGVyZSwgeW91
IGNhbiBkZWZpbmUgaXQgaGVyZSBhcwo+Pj4gd2VsbCwgdXAgdG8geW91Lgo+PiBJIHRoaW5rIEkg
aGF2ZSBkb25lIGl0IGxpa2UgdGhpcyB0byBhdm9pZCB0aGlua2luZyBhYm91dCBwcmVmaXhlcyBm
b3IKPj4gd2hhdCBpcyB1bmRlciB0aGUgdGMzNTg3NjhfZHNpX291dHB1dC4KPj4gSSdsbCB0YWtl
IGEgbG9vayBpZiBpdCB3aWxsIGxvb2sgYmV0dGVyIHVucGFja2VkIGhlcmUuCj4gCj4gSSB0aG91
Z2ggcmF0aGVyIGFib3V0IGluLXBsYWNlIGFub255bW91cyBzdHJ1Y3QgZGVmaW5pdGlvbjoKPiAK
PiArwqDCoMKgIHN0cnVjdCB0YzM1ODc2OF9kc2lfb3V0cHV0IHsKPiArwqDCoMKgIMKgwqDCoCBz
dHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkZXY7Cj4gK8KgwqDCoCDCoMKgwqAgc3RydWN0IGRybV9w
YW5lbCAqcGFuZWw7Cj4gK8KgwqDCoCDCoMKgwqAgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsK
PiArwqDCoMKgIH0gb3V0cHV0Owo+IAo+IEJ1dCwgYXMgSSBzYWlkIC0gdXAgdG8geW91LgoKSSBz
ZWUuIEkgdGhpbmsgSSB3aWxsIGtlZXAgaG93IGl0IHdhcy4gVGhleSBhcmUgaW4gcHJveGltaXR5
LCBzbyBlYXN5IHRvCmNoZWNrLgoKPj4+PiArCj4+Pj4gKwlyZWZjbGsgPSBjbGtfZ2V0X3JhdGUo
cHJpdi0+cmVmY2xrKTsKPj4+PiArCj4+Pj4gKwliZXN0X2RpZmYgPSBVSU5UX01BWDsKPj4+PiAr
CWJlc3RfcGxsID0gMDsKPj4+PiArCWJlc3RfcHJkID0gMDsKPj4+PiArCWJlc3RfZmJkID0gMDsK
Pj4+PiArCj4+Pj4gKwlmb3IgKHByZCA9IDA7IHByZCA8IDE2OyArK3ByZCkgewo+Pj4+ICsJCXUz
MiBkaXZpc29yID0gKHByZCArIDEpICogKDEgPDwgZnJzKTsKPj4+PiArCQl1MzIgZmJkOwo+Pj4+
ICsKPj4+PiArCQlmb3IgKGZiZCA9IDA7IGZiZCA8IDUxMjsgKytmYmQpIHsKPj4+PiArCQkJdTMy
IHBsbCwgZGlmZjsKPj4+PiArCj4+Pj4gKwkJCXBsbCA9ICh1MzIpZGl2X3U2NCgodTY0KXJlZmNs
ayAqIChmYmQgKyAxKSwgZGl2aXNvcik7Cj4+Pj4gKwo+Pj4+ICsJCQlpZiAocGxsID49IG1heF9w
bGwgfHwgcGxsIDwgbWluX3BsbCkKPj4+PiArCQkJCWNvbnRpbnVlOwo+Pj4+ICsKPj4+PiArCQkJ
ZGlmZiA9IG1heChwbGwsIHRhcmdldF9wbGwpIC0gbWluKHBsbCwgdGFyZ2V0X3BsbCk7Cj4+Pj4g
Kwo+Pj4+ICsJCQlpZiAoZGlmZiA8IGJlc3RfZGlmZikgewo+Pj4+ICsJCQkJYmVzdF9kaWZmID0g
ZGlmZjsKPj4+PiArCQkJCWJlc3RfcGxsID0gcGxsOwo+Pj4+ICsJCQkJYmVzdF9wcmQgPSBwcmQ7
Cj4+Pj4gKwkJCQliZXN0X2ZiZCA9IGZiZDsKPj4+PiArCQkJfQo+Pj4+ICsKPj4+PiArCQkJaWYg
KGJlc3RfZGlmZiA9PSAwKQo+Pj4+ICsJCQkJYnJlYWs7Cj4+Pj4gKwkJfQo+Pj4+ICsKPj4+PiAr
CQlpZiAoYmVzdF9kaWZmID09IDApCj4+Pj4gKwkJCWJyZWFrOwo+Pj4gd2h5IGFub3RoZXIgY2hl
Y2sgaGVyZT8KPj4gVG8gYnJlYWsgb3V0IGZyb20gdGhlIHRvcCBmb3IoKSBsb29wIGFsc28gaW4g
Y2FzZSBleGFjdCBtYXRjaCBoYXMgYmVlbgo+PiBmb3VuZC4KPiAKPiAKPiBBaGgsIE9LLiBTbyBt
YXliZSB5b3Ugc2hvdWxkIHB1dCAiaWYgKGRpZmYgPT0gMCkgZ290byBmb3VuZCIgaW5zaWRlICJp
Zgo+IChkaWZmIDwgYmVzdF9kaWZmKSIgYmxvY2ssIGluIHN1Y2ggY2FzZSBnb3RvIGlzIG5vdCBj
b25zaWRlcmVkIGhhcm1mdWwKPiA6KSwgYW5kIGlzIG1vcmUgcmVhZGFibGUuCgpFeGFjdGx5IG15
IHRob3VnaHRzIDspCgotIFDDqXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9y
a2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
