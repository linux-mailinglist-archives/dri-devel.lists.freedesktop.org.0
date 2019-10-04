Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C6CCC051
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A276EBE4;
	Fri,  4 Oct 2019 16:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74346EBDA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 16:13:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GCvqx072936;
 Fri, 4 Oct 2019 11:12:57 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GCv0L037657
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Oct 2019 11:12:57 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:12:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:12:55 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GCrQZ006137;
 Fri, 4 Oct 2019 11:12:53 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To: Mark Brown <broonie@kernel.org>
References: <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
 <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
 <20191004155838.GE4866@sirena.co.uk>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <95a43632-57d0-2705-a2d3-d64827212692@ti.com>
Date: Fri, 4 Oct 2019 18:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004155838.GE4866@sirena.co.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570205577;
 bh=0PAb9wQ779A+UUuanlZ/JxOdY2JJP1B4/U8SIFI1PX4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=jhTqWXoqKdfQs2prUz5qSrpTe/i+PJ068NeZP5ioQbUlnGP0ZMB40KVgT5vc9NyD0
 DSkdXI4EFzYxyFWptINVbhDHyaOm1CAn1How2no7p+crNP/iwrIYCcFM6cDKXFuFIr
 6D2qf0r0gKQ4vwSYjFozQChr7cunbSYZh/IaYTQk=
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

Ck9uIDA0LzEwLzIwMTkgMTc6NTgsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gRnJpLCBPY3QgMDQs
IDIwMTkgYXQgMDU6MTM6MTNQTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4g
T24gMDQvMTAvMjAxOSAxNjo0MCwgTWFyayBCcm93biB3cm90ZToKPj4+IFdoeSBpcyB0aGUgTEVE
IGNvcmUgcG9wdWxhdGluZyBhbnl0aGluZz8gIElzIHRoZSBMRUQgY29yZSBjb3B5aW5nIGJpdHMK
Pj4+IG91dCBvZiB0aGUgc3RydWN0IGRldmljZSBmb3IgdGhlIGFjdHVhbCBkZXZpY2UgaW50byBh
IHN5bnRoZXRpYyBkZXZpY2UKPj4+IHJhdGhlciB0aGFuIHBhc3NpbmcgdGhlIGFjdHVhbCBkZXZp
Y2UgaW4/ICBUaGF0IHJlYWxseSBkb2Vzbid0IHNlZW0gbGlrZQo+Pj4gYSBnb29kIGlkZWEsIGl0
J3MgbGlrZWx5IHRvIGxlYWQgdG8gdGhpbmdzIGxpa2UgdGhpcyB3aGVyZSB5b3UgZG9uJ3QKPj4+
IGNvcHkgc29tZXRoaW5nIHRoYXQncyByZXF1aXJlZCAob3Igd29yc2Ugd2hlcmUgc29tZXRoaW5n
IGRpcmVjdGx5IGluIHRoZQo+Pj4gc3RydWN0IGRldmljZSB0aGF0IGNhbid0IGJlIGNvcGllZCBp
cyBuZWVkZWQpLgo+PiBUaGlzIGlzIG5vdCBhIGNvcHkgb2YgYSBkZXZpY2Ugb2YgcGFyZW50J3Mg
b2Zfbm9kZSBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+PiBZb3UgY2FuIHRoaW5rIG9mIGEgTEVE
IGNvbnRyb2xsZXIgYXMgYSBidXMuIEl0ICdlbnVtZXJhdGVzJyBpdHMgY2hpbGRyZW4KPj4gTEVE
LCBjcmVhdGUgdGhlIGNoaWxkcmVuIGRldmljZXMgKG9uZSBwZXIgTEVEKSBhbmQgcHJvdmlkZXMg
dGhlIGZ1bmN0aW9ucyB0bwo+PiBpbnRlcmFjdCB3aXRoIHRoZW0uCj4+IFRoZSBkZXZpY2Ugbm9k
ZSB3ZSBhcmUgdGFsa2luZyBhYm91dCBoZXJlIGlzIGEgcGVyLUxFRCB0aGluZywgaXQgaXMgYSBj
aGlsZAo+PiBub2RlIG9mIHRoZSBub2RlIG9mIHRoZSBMRUQgY29udHJvbGxlci4KPj4gaGVyZSBp
cyBhbiBleGFtcGxlOgo+Pgo+PiAgwqDCoMKgIHRsYzU5MTA4OiB0bGM1OTExNkA0MCB7IC8qIHRo
aXMgaXMgdGhlIG5vZGUgZm9yIHRoZSBMRUQgY29udHJvbGxlciAqLwo+PiAgwqDCoMKgIMKgwqDC
oCBzdGF0dXMgPSAib2theSI7Cj4+ICDCoMKgwqAgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+PiAgwqDCoMKgIMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4gIMKgwqDCoCDCoMKgwqAg
Y29tcGF0aWJsZSA9ICJ0aSx0bGM1OTEwOCI7Cj4+ICDCoMKgwqAgwqDCoMKgIHJlZyA9IDwweDQw
PjsKPj4KPj4gIMKgwqDCoCDCoMKgwqAgYmFja2xpZ2h0X2xlZDogbGVkQDIgeyAvKiB0aGlzIGlz
IHRoZSBub2RlIG9mIG9uZSBMRUQgYXR0YWNoZWQgdG8KPj4gcGluIzIgb2YgdGhlIExFRCBjb250
cm9sbGVyICovCj4+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCBwb3dlci1zdXBwbHkgPSA8JmJrbF9m
aXhlZD47Cj4+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCByZWcgPSA8MHgyPjsKPj4gIMKgwqDCoCDC
oMKgwqAgfTsKPiBSZWd1bGF0b3Igc3VwcGxpZXMgYXJlIHN1cHBvc2VkIHRvIGJlIGRlZmluZWQg
YXQgdGhlIGNoaXAgbGV2ZWwgcmF0aGVyCj4gdGhhbiBzdWJmdW5jdGlvbnMgd2l0aCBuYW1lcyBj
b3JyZXNwb25kaW5nIHRvIHRoZSBuYW1lcyBvbiB0aGUgY2hpcC4KPiBUaGlzIGVuc3VyZXMgdGhh
dCBhbGwgY2hpcHMgbG9vayBzaW1pbGFyIHdoZW4geW91J3JlIG1hcHBpbmcgdGhlCj4gc2NoZW1h
dGljIGludG8gYSBEVCwgeW91IHNob3VsZG4ndCBuZWVkIHRvIGtub3cgYWJvdXQgdGhlIGJpbmRp
bmcgZm9yIGEKPiBnaXZlbiBjaGlwIHRvIHdyaXRlIGEgRFQgZm9yIGl0IGFuZCBpZiBtdWx0aXBs
ZSBwZW9wbGUgKHBlcmhhcHMgd29ya2luZwo+IG9uIGRpZmZlcmVudCBPU3MpIHdyaXRlIGJpbmRp
bmdzIGZvciB0aGUgc2FtZSBjaGlwIHRoZXJlIHNob3VsZCBiZSBhCj4gZ29vZCBjaGFuY2UgdGhh
dCB0aGV5IGNvbWUgdXAgd2l0aCB0aGUgc2FtZSBtYXBwaW5nLiAgVGhlIHN1cHBseV9hbGlhcwo+
IGludGVyZmFjZSBpcyB0aGVyZSB0byBhbGxvdyBtYXBwaW5nIHRoZXNlIHRocm91Z2ggdG8gc3Vi
ZnVuY3Rpb25zIGlmCj4gbmVlZGVkLCBpdCBsb29rcyBsaWtlIHRoZSBMRUQgZnJhbWV3b3JrIHNo
b3VsZCBiZSB1c2luZyB0aGlzLgoKSW4gY2FzZSBvZiBjdXJyZW50LXNpbmsgTEVEIGRyaXZlcnMs
IGVhY2ggTEVEIGNhbiBiZSBwb3dlcmVkIGJ5IGEgCmRpZmZlcmVudCByZWd1bGF0b3IsIGJlY2F1
c2UgdGhlIGRyaXZlciBpcyBvbmx5IGEgc3dpdGNoIGJldHdlZW4gdGhlIExFRCAKY2F0aG9kIGFu
ZCB0aGUgZ3JvdW5kLgoKPgo+IFRoYXQgc2FpZCBpZiB5b3UgYXJlIGRvaW5nIHRoZSBhYm92ZSBh
bmQgdGhlIExFRHMgYXJlIGFwcGVhcmluZyBhcwo+IGRldmljZXMgaXQncyBleHRyZW1lbHkgc3Vy
cHJpc2luZyB0aGF0IHRoZWlyIG9mX25vZGUgbWlnaHQgbm90IGJlCj4gaW5pdGlhbGl6ZWQuCgpU
aGF0IGlzIGJlY2F1c2UgdGhpcyBpcyB1c3VhbGx5IGRvbmUgYnkgdGhlIHBsYXRmb3JtIGNvcmUg
d2hpY2ggaXMgbm90IAppbnZvbHZlZCBoZXJlLgoKSkoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
