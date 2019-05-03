Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58312ED0
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D86789FCE;
	Fri,  3 May 2019 13:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9440389FCE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 13:08:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43D8uii027411;
 Fri, 3 May 2019 08:08:56 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43D8uIa093526
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 08:08:56 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 08:08:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 08:08:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43D8koE125055;
 Fri, 3 May 2019 08:08:46 -0500
Subject: Re: [PATCHv2 08/22] drm/bridge: tc358767: split stream enable/disable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-9-tomi.valkeinen@ti.com>
 <20190420212913.GK4964@pendragon.ideasonboard.com>
 <c5b5ca05-2c0a-7cb2-e916-e655138f3e58@ti.com>
 <20190503125526.GG4912@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <044c79d5-8a19-2de5-52fd-a5c757a8ac72@ti.com>
Date: Fri, 3 May 2019 16:08:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503125526.GG4912@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556888936;
 bh=v9gC5zuNUSaXj/W02rQ8GVtmpW/EqcSv6b3EM1oo68s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ad8Yw2WkwZmGWaL/Non3SRRKBHFMvKFCW+m9kZ+bBYckSVRyHTCON991Kv+c3jnos
 tSWiR0AlHO1hoPaXyIqn2jVktigHY4sfMUHzAfPM8CxWJxygUr1+lGP1Vzrl4uthfS
 3rWZIBrhxDSAx6MvzhSK8LSKho1eodZY15OhAKYA=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMDUvMjAxOSAxNTo1NSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKCj4+Pj4gIAo+Pj4+
IC0JaWYgKHN0YXRlKSB7Cj4+Pj4gLQkJcmV0ID0gdGNfc2V0X3ZpZGVvX21vZGUodGMsIHRjLT5t
b2RlKTsKPj4+PiAtCQlpZiAocmV0KQo+Pj4+IC0JCQlnb3RvIGVycjsKPj4+PiArCXJldCA9IHRj
X3NldF92aWRlb19tb2RlKHRjLCB0Yy0+bW9kZSk7Cj4+Pj4gKwlpZiAocmV0KQo+Pj4+ICsJCWdv
dG8gZXJyOwo+Pj4KPj4+IExldCdzIHJldHVybiByZXQgZGlyZWN0bHkgYW5kIHJlbW92ZSB0aGUg
ZXJyIGxhYmVsLgo+Pgo+PiBDYW4ndCByZW1vdmUgdGhlIGVyciBsYWJlbCwgYmVjYXVzZSBvZiB0
aGUgdGNfd3JpdGUoKSBjYWxscy4uLgo+IAo+IDotKAo+IAo+IEknZCBsb3ZlIHRvIHNlZSB0aGlz
IGdldHRpbmcgZml4ZWQuIFRoZSBiZXN0IHdheSBJJ3ZlIGZvdW5kIHNvIGZhciB3b3VsZAo+IGJl
CgpBbmQgYnkgZml4ZWQgeW91IG1lYW4gY2xlYW5lZCB1cD8KClllcywgaXQncyBhIG1lc3MuIFRo
YXQncyB3aHkgSSB3YW50IHRvIGdldCB0aGlzIHNlcmllcyBtZXJnZWQgYXNhcCwgc28KQW5kcmV5
IGNhbiByZWJhc2UgaGlzIHNlcmllcywgYW5kIHdlIGNhbiBwcm9jZWVkIHdpdGggYWxsIHRoZSBj
bGVhbnVwcwo9KS4gSGlzIHNlcmllcyByZW1vdmVzIHRoZXNlIG1hY3JvcyB0aGF0IHJlcXVpcmUg
dGhlIGVyciBsYWJlbC4KCiBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwg
UG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAw
NjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
