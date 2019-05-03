Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D206D12AC3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BA689A08;
	Fri,  3 May 2019 09:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29DA89A08
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:36:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x439aUb8125842;
 Fri, 3 May 2019 04:36:30 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x439aUSJ062005
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 04:36:30 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 04:36:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 04:36:28 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x439aQkF126609;
 Fri, 3 May 2019 04:36:26 -0500
Subject: Re: [PATCHv2 10/22] drm/bridge: tc358767: add link disable function
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <CGME20190326103301epcas1p3ad0ebcfa9e0e3e806edf711d8f26f8a2@epcas1p3.samsung.com>
 <20190326103146.24795-11-tomi.valkeinen@ti.com>
 <aca5d06c-6c5c-8e74-3757-538c030a99f9@samsung.com>
 <bf669862-f634-3fe3-2736-9d4c9ac8fe4c@ti.com>
 <20190420213941.GM4964@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <db41ef8e-cc31-06b1-2580-6c8ece6cd6c3@ti.com>
Date: Fri, 3 May 2019 12:36:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420213941.GM4964@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556876190;
 bh=w/exbaeU0M8qbZq22MHS5oofL4dSvgBB1e6wCL1ZHdU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZHLp9r5uEo/21Dj/GoMLviDEaG87qbqWZs3Hwp1+ZGcN5/8kbhWz6CvHxd8KSrQEf
 2rnmvH9K1sk+RnghaRvDze6R3RMagspPiJ+JhHsKbEC+nUvgXRY1UR+4+ABwpcuAn6
 haBawnG0LLJHhSn9+jw4gfI+pUJICJl/Nb7Ng7fg=
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

T24gMjEvMDQvMjAxOSAwMDozOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIE1vbiwgQXByIDE1LCAyMDE5IGF0
IDAyOjM5OjIxUE0gKzAzMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBPbiAxNS8wNC8yMDE5
IDExOjM2LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+Pgo+Pj4+ICtzdGF0aWMgaW50IHRjX21haW5f
bGlua19kaXNhYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKPj4+PiArewo+Pj4+ICsJaW50IHJldDsK
Pj4+PiArCj4+Pj4gKwlkZXZfZGJnKHRjLT5kZXYsICJsaW5rIGRpc2FibGVcbiIpOwo+Pj4+ICsK
Pj4+PiArCXRjX3dyaXRlKERQMF9TUkNDVFJMLCAwKTsKPj4+PiArCXRjX3dyaXRlKERQMENUTCwg
MCk7Cj4+Pgo+Pj4gVGhlIHNhbWUgcmVnaXN0ZXIgaXMgc2V0IGluIHN0cmVhbV9kaXNhYmxlLCBp
cyBpdCBjb3JyZWN0PyBMb29rcwo+Pj4gc3VzcGljaW91cywgZGlzYWJsaW5nIHN0cmVhbSBhbmQg
bGluayBzaG91bGQgYmUgZGlmZmVyZW50IHRoaW5ncy4KPj4KPj4gR29vZCBwb2ludC4gSXQncyBw
cm9iYWJseSBub3QgY29ycmVjdC4gV2l0aCB0aGVzZSBwYXRjaGVzLCB0aGUgbGluayBhbmQKPj4g
c3RyZWFtIGFyZSBhbHdheXMgZW5hYmxlZCBhbmQgZGlzYWJsZWQgdG9nZXRoZXIsIHNvIGl0IHNo
b3VsZG4ndCBjYXVzZQo+PiBhbnkgcHJvYmxlbXMgYXQgdGhlIG1vbWVudC4KPj4KPj4gRHVyaW5n
IG15IGRlYnVnZ2luZyBhbmQgZGV2ZWxvcG1lbnQsIGF0IHNvbWUgcG9pbnQgSSBoYWQgYSB2ZXJz
aW9uIHdoZXJlCj4+IEkgZW5hYmxlZCB0aGUgbGluayByaWdodCBhd2F5IHdoZW4gd2UgZ290IEhQ
RCBoaWdoLCBtb3N0bHkgdG8gaGVscCBteQo+PiBkZWJ1Z2dpbmcuIFRoYXQncyB3aHkgSSBzZXBh
cmF0ZWQgbGluayBhbmQgc3RyZWFtIHNldHVwIChhbHRob3VnaCBJCj4+IHRoaW5rIHRoYXQncyBh
IGxvZ2ljYWwgZGVzaWduIGluIGFueSBjYXNlKS4KPj4KPj4gSG93ZXZlciwgSSBuZXZlciBkaWQg
dHJ5IGRpc2FibGluZyBvbmx5IHN0cmVhbSwgYW5kIGtlZXBpbmcgdGhlIGxpbmsgdXAsCj4+IHNv
IGl0IG1heSB3ZWxsIGJlIG5vbi1mdW5jdGlvbmFsLiBPciwgd2VsbCwgaXQgY2xlYXJseSBpcwo+
PiBub24tZnVuY3Rpb25hbCwgYXMgd2UgZGlzYWJsZSB0aGUgbGluayAoRFAwQ1RMKSBpbiB0Y19z
dHJlYW1fZGlzYWJsZSgpLi4uCj4+Cj4+IFNvIHRoaXMgaXMgbW9zdGx5IGFib3V0IGp1c3QgYWRk
aW5nIHRoZSBhcmNoaXRlY3R1cmUgdG8gaGF2ZSBzZXBhcmF0ZQo+PiBsaW5rL3N0cmVhbSBoYW5k
bGluZywgYnV0IHRoZSBmdW5jdGlvbmFsaXR5IGlzIG5vdCB0aGVyZS4gSSBzaG91bGQKPj4gcGVy
aGFwcyBhZGQgYSBjb21tZW50IHRvIHRoZSBjb2RlIHRvIHBvaW50IHRoaXMgb3V0Lgo+IAo+IFRo
aXMgbWFrZXMgbWUgYSBiaXQgdW5lYXN5IGFib3V0IHRoZSByZXdvcmssIGFzIHRoZQo+IHRjX21h
aW5fbGlua19lbmFibGUoKSBmdW5jdGlvbiBkb2Vzbid0IGVuYWJsZSB0aGUgbGluayAoaXQgZG9l
c24ndCBzZXQKPiB0aGUgRFBfRU4gYml0IGluIERQMENUTCksIGFuZCBzdHJlYW0gZGlzYWJsaW5n
IHNlcGFyYXRlbHkgZnJvbSBsaW5rCj4gZGlzYWJsaW5nIGlzIGJyb2tlbi4gSXMgdGhpcyBmaXhh
YmxlID8KCnRjX21haW5fbGlua19lbmFibGUoKSBkb2VzIHNldCBEUF9FTi4KCkl0J3MgdHJ1ZSB0
aGF0IG1hbmFnaW5nIHRoZSBsaW5rIGFuZCBzdHJlYW0gc2VwYXJhdGVseSBpc24ndCB3b3JraW5n
LApidXQgaXQgd2Fzbid0IHRoZXJlIGVhcmxpZXIgZWl0aGVyLCBhbmQgaXQgc3RpbGwgaXNuJ3Qs
IGFzIHRoZSBkcml2ZXIKbmV2ZXIgZW5hYmxlcy9kaXNhYmxlcyB0aGUgbGluay9zdHJlYW0gc2Vw
YXJhdGVseS4gV2UgbmVlZCBtb3JlIGNvZGUgYW5kCmxvZ2ljIHRvIG1hbmFnZSB0aGVtIHNlcGFy
YXRlbHksIGFuZCB0aGlzIHNlcmllcyBqdXN0IHN0YXJ0cyB0aGUgd29yayBieQp0cnlpbmcgdG8g
b3JnYW5pemUgdGhlIGNvZGUgYmV0dGVyLgoKSSdsbCBsb29rIGF0IHRjX3N0cmVhbV9kaXNhYmxl
KCksIGFzIHRjX3dyaXRlKERQMENUTCwgMCkgdGhlcmUgZG9lcyBub3QKbG9vayBjb3JyZWN0LiBQ
cm9iYWJseSB3ZSBjYW4ganVzdCBjbGVhciBWSURfRU4uCgpBZmFpY3MsIHRoaXMgc2VyaWVzIHNo
b3VsZCBub3QgaW50cm9kdWNlIGFueSBpc3N1ZXMsIGJ1dCBmaXhlcyBtYW55Cmlzc3VlcyB0aGF0
IHdlcmUgcHJlc2VudC4gVGhlcmUncyBsb3RzIG1vcmUgdG8gZG8sIGFuZCB0aGVyZSdzIGFub3Ro
ZXIKc2VyaWVzIGZyb20gQW5kcmV5IHRoYXQgY2xlYW5zIHVwIG1hbnkgdGhpbmdzIHRoYXQgSSBk
aWRuJ3QgdG91Y2ggaW4KdGhpcyBzZXJpZXMuIEFuZCBhZnRlciBBbmRyZXkncyBjbGVhbnVwcywg
SSB0aGluayB3ZSBjYW4gdGhlbiBzdGFydApsb29raW5nIGF0IGFkZGluZyBtb3JlIGxvZ2ljIGxp
a2UgdGhlIHNlcGFyYXRlIGxpbmsvc3RyZWFtIGVuYWJsaW5nIGlmCm5lZWRlZC4KCiBUb21pCgot
LSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAg
SGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
