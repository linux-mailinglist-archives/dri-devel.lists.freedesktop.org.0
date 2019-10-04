Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1ECB7FD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 12:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B626EB0E;
	Fri,  4 Oct 2019 10:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A196EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 10:12:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94ACQmo109113;
 Fri, 4 Oct 2019 05:12:26 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94ACQCb116498;
 Fri, 4 Oct 2019 05:12:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 05:12:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 05:12:25 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94ACMPE100107;
 Fri, 4 Oct 2019 05:12:23 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Mark Brown
 <broonie@kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <58f32544-89ba-6a72-2491-82307a71df05@ti.com>
Date: Fri, 4 Oct 2019 12:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570183946;
 bh=c3zkR74xsAFswSP7dMpMX60k0Qrn8EeINoag7SKD4dU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BT7Isw0UTPLb/7GgIZs0OD4IsoxdnUVrlcUKN+NUsK272elLQvEoPKIyIrnJHc/4X
 kyjHClQnj/RQgIJefBB2l49gBxuClpW1Zz+q08f9ibGWXuhiZmFsbkTfyCe5Ic0vqP
 +VxcuVOJf0Z8aCMxKH0IgjdSP9A8CbnPUozQMSTI=
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
 Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDAzLzEwLzIwMTkgMjI6MjcsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6Cj4gT24gMTAvMy8x
OSA5OjQxIFBNLCBNYXJrIEJyb3duIHdyb3RlOgo+PiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAw
OToyMTowNlBNICswMjAwLCBKYWNlayBBbmFzemV3c2tpIHdyb3RlOgo+Pj4gT24gMTAvMy8xOSA4
OjM1IFBNLCBNYXJrIEJyb3duIHdyb3RlOgo+Pj4+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA3
OjQzOjE3UE0gKzAyMDAsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6Cj4+Pj4+IE9uIDEwLzMvMTkg
Mjo0NyBQTSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4+Pj4+IE9uIDAzLzEwLzIwMTkg
MTI6NDIsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOgo+Pj4+Pj4+IE9uIFRodSwgT2N0IDAzLCAy
MDE5IGF0IDEwOjI4OjA5QU0gKzAyMDAsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4+Pj4g
VGhpcyBtYWlsIGhhcyBub3RoaW5nIHJlbGV2YW50IGluIHRoZSBzdWJqZWN0IGxpbmUgYW5kIHBh
Z2VzIG9mIHF1b3Rlcwo+Pj4+IGJlZm9yZSB0aGUgcXVlc3Rpb24gZm9yIG1lLCBpdCdzIGtpbmQg
b2YgbHVja3kgSSBub3RpY2VkIGl0Li4uLgo+Pj4gSXNuJ3QgaXQgYWxsIGFib3V0IGNyZWF0aW5n
IHByb3BlciBmaWx0ZXJzPwo+PiBNeSBwb2ludCB0aGVyZSBpcyB0aGF0IHRoZXJlJ3Mgbm90aGlu
ZyBvYnZpb3VzIGluIHRoZSBtYWlsIHRoYXQgc3VnZ2VzdHMKPj4gaXQgc2hvdWxkIGdldCBwYXN0
IGZpbHRlcnMgLSBqdXN0IGJlaW5nIENDZWQgb24gYSBtYWlsIGlzbid0IHN1cGVyCj4+IHJlbGlh
YmxlLCBwZW9wbGUgb2Z0ZW4gZ2V0IHB1bGxlZCBpbiBkdWUgdG8gdGhpbmdzIGxpa2UgY2hlY2tw
YXRjaCBvcgo+PiBzb21lb25lIGNvcHlpbmcgYSBDQyBsaXN0IGZyb20gYW4gZWFybGllciBwYXRj
aCBzZXJpZXMgd2hlcmUgdGhlcmUgd2VyZQo+PiB0aGluZ3Mgd2VyZSByZWxldmFudC4KPiBPSywg
dXBkYXRlZCB0aGUgc3ViamVjdC4KPgo+Pj4+PiBJIHdvbmRlciBpZiBpdCB3b3VsZG4ndCBtYWtl
IHNlbnNlIHRvIGFkZCBzdXBwb3J0IGZvciBmd25vZGUKPj4+Pj4gcGFyc2luZyB0byByZWd1bGF0
b3IgY29yZS4gT3IgbWF5YmUgaXQgaXMgZWl0aGVyIHNvbWVob3cgc3VwcG9ydGVkCj4+Pj4+IG9y
IG5vdCBzdXBwb3J0ZWQgb24gcHVycG9zZT8KPj4+PiBBbnl0aGluZyBhdHRlbXB0aW5nIHRvIHVz
ZSB0aGUgcmVndWxhdG9yIERUIGJpbmRpbmdzIGluIEFDUEkgaGFzIHZlcnkKPj4+PiBzZXJpb3Vz
IHByb2JsZW1zLCBBQ1BJIGhhcyBpdHMgb3duIHBvd2VyIG1vZGVsIHdoaWNoIGlzbid0IGNvbXBh
dGlibGUKPj4+PiB3aXRoIHRoYXQgdXNlZCBpbiBEVC4KPj4+IFdlIGhhdmUgYSBtZWFucyBmb3Ig
Y2hlY2tpbmcgaWYgZndub2RlIHJlZmVycyB0byBvZl9ub2RlOgo+Pj4gaXNfb2Zfbm9kZShjb25z
dCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKQo+Pj4gQ291bGRuJ3QgaXQgYmUgZW1wbG95
ZWQgZm9yIE9GIGNhc2U/Cj4+IFdoeSB3b3VsZCB3ZSB3YW50IHRvIGRvIHRoYXQ/ICBXZSdkIGNv
bnRpbnVlIHRvIHN1cHBvcnQgb25seSBEVCBzeXN0ZW1zLAo+PiBqdXN0IHdpdGggY29kZSB0aGF0
J3MgbGVzcyBvYnZpb3VzbHkgRFQgb25seSBhbmQgd291bGQgbmVlZCB0byBwdXQKPj4gY2hlY2tz
IGluLiAgSSdtIG5vdCBzZWVpbmcgYW4gdXBzaWRlIGhlcmUuCj4gRm9yIGluc3RhbmNlIGZldyB3
ZWVrcyBhZ28gd2UgaGFkIGEgcGF0Y2ggWzBdIGluIHRoZSBMRUQgY29yZSBzd2l0Y2hpbmcKPiBm
cm9tIHVzaW5nIHN0cnVjdCBkZXZpY2UncyBvZl9ub2RlIHByb3BlcnR5IHRvIGZ3bm9kZSBmb3Ig
Y29udmV5aW5nCj4gZGV2aWNlIHByb3BlcnR5IGRhdGEuIEFuZCB0aGlzIHRyYW5zaXRpb24gdG8g
Zndub2RlIHByb3BlcnR5IEFQSSBjYW4gYmUKPiBvYnNlcnZlZCBhcyBhIGZyZXF1ZW50IHBhdHRl
cm4gYWNyb3NzIHN1YnN5c3RlbXMuCj4KPiBSZWNlbnRseSB0aGVyZSBpcyBhbiBvbmdvaW5nIGVm
Zm9ydCBhaW1pbmcgdG8gYWRkIGdlbmVyaWMgc3VwcG9ydCBmb3IKPiBoYW5kbGluZyByZWd1bGF0
b3JzIGluIHRoZSBMRUQgY29yZSBbMV0sIGJ1dCBpdCB0dXJucyBvdXQgdG8gcmVxdWlyZQo+IGJy
aW5naW5nIGJhY2sgaW5pdGlhbGl6YXRpb24gb2Ygb2Zfbm9kZSBwcm9wZXJ0eSBmb3IKPiBkZXZt
X3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoKSB0byB3b3JrIHByb3Blcmx5Lgo+Cj4gU3VwcG9ydCBm
b3IgT0YgcmVsYXRlZCBmd25vZGVzIGluIHJlZ3VsYXRvciBjb3JlIGNvdWxkIGhlbHAgcmVkdWNp
bmcKPiB0aGlzIG5vaXNlLgoKV2UgY291bGQgaGF2ZSB0aGlzIGRvbmUgaW4gZGV2X29mX25vZGUo
KToKCnN0YXRpYyBpbmxpbmUgc3RydWN0IGRldmljZV9ub2RlICpkZXZfb2Zfbm9kZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCnsKIMKgwqDCoCBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX09GKSB8fCAhZGV2
KQogwqDCoMKgIMKgwqDCoCByZXR1cm4gTlVMTDsKIMKgwqDCoCByZXR1cm4gZGV2LT5vZl9ub2Rl
ID8gZGV2LT5vZl9ub2RlIDogdG9fb2Zfbm9kZShkZXYtPmZ3bm9kZSk7Cn0KClRoZW4gaXQgd2ls
bCBvbmx5IGJlIGEgbWF0dGVyIG9mIHVzaW5nIGRldl9vZl9ub2RlKCkgaW5zdGVhZCBvZiAKYWNj
ZXNzaW5nIGRpcmVjdGx5IGRldi0+b2Zfbm9kZQoKCj4KPiBbMF0KPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
L2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYz9pZD1mZDgxZDdlOTQ2YzZiZGI4NmRiZjBiZDg4ZmVl
M2UxYTU0NWU3OTc5Cj4gWzFdCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbGVkcy8y
MDE5MDkyMzEwMjA1OS4xNzgxOC00LWpqaGlibG90QHRpLmNvbS8KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
