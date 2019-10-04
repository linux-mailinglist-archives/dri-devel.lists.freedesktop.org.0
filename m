Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B5CBEBD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 17:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4236EBC4;
	Fri,  4 Oct 2019 15:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DB36EB12
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 15:13:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94FDH8I117781;
 Fri, 4 Oct 2019 10:13:17 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FDH0o102033;
 Fri, 4 Oct 2019 10:13:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 10:13:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 10:13:16 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FDEUv040225;
 Fri, 4 Oct 2019 10:13:14 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To: Mark Brown <broonie@kernel.org>
References: <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
Date: Fri, 4 Oct 2019 17:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004144029.GC4866@sirena.co.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570201997;
 bh=aWz10fmIXx+gUjLiGBjJkxuwFaREky92Azp3aqmUDuU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=jAXv7dVQrIT8YcJvuU675D0UM7cua4NjMs5nlDwC2L8cWQmYZauOR9OvXbPScu4Kx
 7iT72jT1qpqZ7TO9iemlztLdY+kwsCe/vpTVZcE77u1c+umE8P3p56zdPnVAYE8+kL
 t0qToAANSv7YI0YFgHAJExcVRDbmj5G0HRae2ru8=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzEwLzIwMTkgMTY6NDAsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gRnJpLCBPY3QgMDQs
IDIwMTkgYXQgMDM6MzM6MTNQTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4g
T24gMDQvMTAvMjAxOSAxMzozOSwgTWFyayBCcm93biB3cm90ZToKPj4+IENvbnN1bWVycyBzaG91
bGQganVzdCBiZSBhYmxlIHRvIHJlcXVlc3QgYSByZWd1bGF0b3Igd2l0aG91dCBoYXZpbmcgdG8K
Pj4+IHdvcnJ5IGFib3V0IGhvdyB0aGF0J3MgYmVpbmcgcHJvdmlkZWQgLSB0aGV5IHNob3VsZCBo
YXZlIG5vIGtub3dsZWRnZSBhdAo+Pj4gYWxsIG9mIGZpcm13YXJlIGJpbmRpbmdzIG9yIHBsYXRm
b3JtIGRhdGEgZm9yIGRlZmluaW5nIHRoaXMuICBJZiB0aGV5Cj4+PiBkbyB0aGF0IHN1Z2dlc3Rz
IHRoZXJlJ3MgYW4gYWJzdHJhY3Rpb24gaXNzdWUgc29tZXdoZXJlLCB3aGF0IG1ha2VzIHlvdQo+
Pj4gdGhpbmsgdGhhdCBkb2luZyBzb21ldGhpbmcgd2l0aCBvZl9ub2RlIGlzIHJlcXVpcmVkPwo+
PiBUaGUgcmVndWxhdG9yIGNvcmUgYWNjZXNzZXMgY29uc3VtZXItPm9mX25vZGUgdG8gZ2V0IGEg
cGhhbmRsZSB0byBhCj4+IHJlZ3VsYXRvcidzIG5vZGUuIFRoZSB0cm91YmxlIGFyaXNlcyBmcm9t
IHRoZSBmYWN0IHRoYXQgdGhlIExFRCBjb3JlIGRvZXMKPj4gbm90IHBvcHVsYXRlIG9mX25vZGUg
YW55bW9yZSwgaW5zdGVhZCBpdCBwb3B1bGF0ZXMgZndub2RlLiBUaGlzIGFsbG93cyB0aGUKPj4g
TEVEIGNvcmUgdG8gYmUgYWdub3N0aWMgb2YgQUNQSSBvciBPRiB0byBnZXQgdGhlIHByb3BlcnRp
ZXMgb2YgYSBMRUQuCj4gV2h5IGlzIHRoZSBMRUQgY29yZSBwb3B1bGF0aW5nIGFueXRoaW5nPyAg
SXMgdGhlIExFRCBjb3JlIGNvcHlpbmcgYml0cwo+IG91dCBvZiB0aGUgc3RydWN0IGRldmljZSBm
b3IgdGhlIGFjdHVhbCBkZXZpY2UgaW50byBhIHN5bnRoZXRpYyBkZXZpY2UKPiByYXRoZXIgdGhh
biBwYXNzaW5nIHRoZSBhY3R1YWwgZGV2aWNlIGluPyAgVGhhdCByZWFsbHkgZG9lc24ndCBzZWVt
IGxpa2UKPiBhIGdvb2QgaWRlYSwgaXQncyBsaWtlbHkgdG8gbGVhZCB0byB0aGluZ3MgbGlrZSB0
aGlzIHdoZXJlIHlvdSBkb24ndAo+IGNvcHkgc29tZXRoaW5nIHRoYXQncyByZXF1aXJlZCAob3Ig
d29yc2Ugd2hlcmUgc29tZXRoaW5nIGRpcmVjdGx5IGluIHRoZQo+IHN0cnVjdCBkZXZpY2UgdGhh
dCBjYW4ndCBiZSBjb3BpZWQgaXMgbmVlZGVkKS4KClRoaXMgaXMgbm90IGEgY29weSBvZiBhIGRl
dmljZSBvZiBwYXJlbnQncyBvZl9ub2RlIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCgpZb3UgY2Fu
IHRoaW5rIG9mIGEgTEVEIGNvbnRyb2xsZXIgYXMgYSBidXMuIEl0ICdlbnVtZXJhdGVzJyBpdHMg
Y2hpbGRyZW4gCkxFRCwgY3JlYXRlIHRoZSBjaGlsZHJlbiBkZXZpY2VzIChvbmUgcGVyIExFRCkg
YW5kIHByb3ZpZGVzIHRoZSAKZnVuY3Rpb25zIHRvIGludGVyYWN0IHdpdGggdGhlbS4KClRoZSBk
ZXZpY2Ugbm9kZSB3ZSBhcmUgdGFsa2luZyBhYm91dCBoZXJlIGlzIGEgcGVyLUxFRCB0aGluZywg
aXQgaXMgYSAKY2hpbGQgbm9kZSBvZiB0aGUgbm9kZSBvZiB0aGUgTEVEIGNvbnRyb2xsZXIuCgpo
ZXJlIGlzIGFuIGV4YW1wbGU6CgogwqDCoMKgIHRsYzU5MTA4OiB0bGM1OTExNkA0MCB7IC8qIHRo
aXMgaXMgdGhlIG5vZGUgZm9yIHRoZSBMRUQgY29udHJvbGxlciAqLwogwqDCoMKgIMKgwqDCoCBz
dGF0dXMgPSAib2theSI7CiDCoMKgwqAgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+OwogwqDC
oMKgIMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKIMKgwqDCoCDCoMKgwqAgY29tcGF0aWJsZSA9
ICJ0aSx0bGM1OTEwOCI7CiDCoMKgwqAgwqDCoMKgIHJlZyA9IDwweDQwPjsKCiDCoMKgwqAgwqDC
oMKgIGJhY2tsaWdodF9sZWQ6IGxlZEAyIHsgLyogdGhpcyBpcyB0aGUgbm9kZSBvZiBvbmUgTEVE
IGF0dGFjaGVkIAp0byBwaW4jMiBvZiB0aGUgTEVEIGNvbnRyb2xsZXIgKi8KIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIHBvd2VyLXN1cHBseSA9IDwmYmtsX2ZpeGVkPjsKIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIHJlZyA9IDwweDI+OwogwqDCoMKgIMKgwqDCoCB9OwogwqDCoMKgIMKgwqDCoCBvdGhlcl9s
ZWQ6IGxlZEAzIHsgLyogdGhpcyBpcyB0aGUgbm9kZSBhbm90aGVyIExFRCBhdHRhY2hlZCB0byAK
cGluICMzIG9mIHRoZSBMRUQgY29udHJvbGxlciAqLwogwqDCoMKgIMKgwqDCoCDCoMKgwqAgcG93
ZXItc3VwcGx5ID0gPCZyZWdfM3YzPjsKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJlZyA9IDwweDM+
OwogwqDCoMKgIMKgwqDCoCB9OwogwqDCoMKgIH07CgoKPgo+PiBJTU8gaXQgaXMgYmV0dGVyIHRv
IHBvcHVsYXRlIGJvdGggb2Zfbm9kZSBhbmQgZndub2RlIGluIHRoZSBMRUQgY29yZSBhdCB0aGUK
Pj4gbW9tZW50LiBJdCBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIHRoaXMgd2F5IGZvciB0aGUgcGxh
dGZvcm0gZHJpdmVyIFswXSwgTVRECj4+IFsxXSBhbmQgUENJLU9GIFsyXS4KPiBZZWFoLCBpZiB5
b3UncmUgZ29pbmcgdG8gYmUgY29weWluZyBzdHVmZiBvdXQgb2YgdGhlIHJlYWwgZGV2aWNlIEkn
ZAo+IGNvcHkgdGhlIG9mX25vZGUgYXMgd2VsbC4KPgo+Pj4gRnVydGhlciwgdW5sZXNzIHlvdSBo
YXZlIExFRHMgdGhhdCB3b3JrIHdpdGhvdXQgcG93ZXIgeW91IHByb2JhYmx5Cj4+PiBzaG91bGRu
J3QgYmUgdXNpbmcgX2dldF9vcHRpb25hbCgpIGZvciB0aGVpciBzdXBwbHkuICBUaGF0IGludGVy
ZmFjZSBpcwo+Pj4gaW50ZW5kZWQgb25seSBmb3Igc3VwcGxpZXMgdGhhdCBtYXkgYmUgcGh5c2lj
YWxseSBhYnNlbnQuCj4+IE5vdCBhbGwgTEVEcyBoYXZlIGEgcmVndWxhdG9yIHRvIHByb3ZpZGUg
dGhlIHBvd2VyLiBUaGUgcG93ZXIgY2FuIGJlCj4+IHN1cHBsaWVkIGJ5IHRoZSBMRUQgY29udHJv
bGxlciBmb3IgZXhhbXBsZS4KPiBUaGlzIGNvZGUgcHJvYmFibHkgc2hvdWxkbid0IGJlIGJlaW5n
IHJ1biBhdCBhbGwgZm9yIExFRHMgbGlrZSB0aGF0LCBJCj4gd2FzIGFzc3VtaW5nIHRoaXMgd2Fz
IGp1c3QgZm9yIEdQSU8gTEVEcyBhbmQgc2ltaWxhciByYXRoZXIgdGhhbiBhbGwKPiBMRURzLgoK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
