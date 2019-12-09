Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79237116990
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381676E33D;
	Mon,  9 Dec 2019 09:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D395D6E33D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 09:38:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB99cgDA086815;
 Mon, 9 Dec 2019 03:38:42 -0600
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB99cg0F034198
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 03:38:42 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 03:38:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 03:38:42 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB99cdB3083025;
 Mon, 9 Dec 2019 03:38:40 -0600
Subject: Re: [PATCH v3 2/2] drm/bridge: tc358767: Expose test mode
 functionality via debugfs
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191209050857.31624-1-andrew.smirnov@gmail.com>
 <20191209050857.31624-3-andrew.smirnov@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <45afdff8-4f91-f5be-a299-d0c7fed71ea7@ti.com>
Date: Mon, 9 Dec 2019 11:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209050857.31624-3-andrew.smirnov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575884322;
 bh=oqaWO0NPBKmyeLqC24LmgGny4o2Jfye2gEw2ZGBx4rY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vcegoY05FwzGDm0/docJe+rjQ+79dAnO/Upmj5EQ1TdOxaRl8mehfJMVRNOzzchL5
 gDZrYMU5422klUz478q/ze5VQkkETK5J630Q22kNEUkvMv3DkB5kk6OgA0+BvohinY
 V8EnMlbUQKsWPVI9XM1s0ZvfPkwRPbQy1yAxWnjk=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KENjJ2luZyBEYW5pZWwgZm9yIHRoZSBsYXN0IHBhcmFncmFwaCkKCk9uIDA5LzEyLzIwMTkgMDc6
MDgsIEFuZHJleSBTbWlybm92IHdyb3RlOgo+IFByZXNlbnRseSwgdGhlIGRyaXZlciBjb2RlIGFy
dGlmaWNpYWxseSBsaW1pdHMgdGVzdCBwYXR0ZXJuIG1vZGUgdG8gYQo+IHNpbmdsZSBwYXR0ZXJu
IHdpdGggZml4ZWQgY29sb3Igc2VsZWN0aW9uLiBJdCBiZWluZyBhIGtlcm5lbCBtb2R1bGUKPiBw
YXJhbWV0ZXIgbWFrZXMgc3dpdGNoaW5nICJ0ZXN0IHBhdHRlcm4iIDwtPiAicHJvcGVyIG91dHB1
dCIgbW9kZXMKPiBvbi10aGUtZmx5IGNsdW5reSBhbmQgb3V0cmlnaHQgaW1wb3NzaWJsZSBpZiB0
aGUgZHJpdmVyIGlzIGJ1aWx0IGludG8KPiB0aGUga2VybmVsLgoKVGhhdCdzIG5vdCBjb3JyZWN0
LCAvc3lzL21vZHVsZS90YzM1ODc2Ny9wYXJhbWV0ZXJzL3Rlc3QgaXMgdGhlcmUgZXZlbiBpZiB0
aGUgZHJpdmVyIGlzIGJ1aWx0LWluLgoKSSB0aGluayB0aGUgYmlnZ2VyIHByb2JsZW1zIGFyZSB0
aGF0IHRoZXJlJ3MganVzdCBvbmUgdmFsdWUsIGV2ZW4gaWYgdGhlcmUgYXJlIG11bHRpcGxlIGRl
dmljZXMsIGFuZCAKdGhhdCB3aXRoIGtlcm5lbCBwYXJhbWV0ZXIgdGhlIGRyaXZlciBjYW4ndCBh
Y3Qgb24gaXQgZHluYW1pY2FsbHkgKGFmYWlrKS4KCj4gVG8gaW1wcm92ZSB0aGUgc2l0dWF0aW9u
IGEgYml0LCBjb252ZXJ0IGN1cnJlbnQgdGVzdCBwYXR0ZXJuIGNvZGUgdG8KPiB1c2UgZGVidWdm
cyBpbnN0ZWFkIGJ5IGV4cG9zaW5nICJUZXN0Q3RsIiByZWdpc3Rlci4gVGhpcyB3YXkgb2xkCj4g
InRjX3Rlc3RfcGF0dGVybj0xIiBmdW5jdGlvbmFsaXR5IGNhbiBiZSBlbXVsYXRlZCB2aWE6Cj4g
Cj4gICAgICBlY2hvIC1uIDB4NzgxNDYzMDIgPiB0c3RjdGwKPiAKPiBhbmQgc3dpdGNoIGJhY2sg
dG8gcmVndWxhciBtb2RlIGNhbiBiZSBkb25lIHdpdGg6Cj4gCj4gICAgICBlY2hvIC1uIDB4Nzgx
NDYzMDAgPiB0c3RjdGwKCkluIHRoZSBjb21tZW50IGluIHRoZSBjb2RlIHlvdSBoYXZlIDAgYXMg
cmV0dXJuLXRvLXJlZ3VsYXItbW9kZS4KCldpdGggbXkgc2V0dXAsIGVuYWJsaW5nIHRlc3QgbW9k
ZSBzZWVtcyB0byB3b3JrLCBidXQgd2hlbiBJIHJldHVybiB0byByZWd1bGFyIG1vZGUsIHRoZSBm
aXJzdCBlY2hvIApyZXN1bHRzIGluIGJsYWNrIGRpc3BsYXksIGJ1dCBlY2hvaW5nIDAgYSBzZWNv
bmQgdGltZSB3aWxsIHJlc3RvcmUgdGhlIGRpc3BsYXkuCgpIbW0sIGFjdHVhbGx5LCBqdXN0IGVj
aG9pbmcgMCB0byB0c3RjdGwgbXVsdGlwbGUgdGltZXMsIGl0IG1ha2VzIHRoZSBzY3JlZW4gZ28g
YmxhY2sgYW5kIHRoZW4gCnJlc3RvcmVzIGl0IHdpdGggZXZlcnkgb3RoZXIgZWNoby4KCj4gKwlk
ZWJ1Z2ZzID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKGRldiksIE5VTEwpOwo+ICsJaWYg
KCFJU19FUlIoZGVidWdmcykpIHsKPiArCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlX3Vuc2FmZSgidHN0
Y3RsIiwgMDIwMCwgZGVidWdmcywgdGMsCj4gKwkJCQkJICAgJnRjX3RzdGN0bF9mb3BzKTsKPiAr
CQlkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCB0Y19yZW1vdmVfZGVidWdmcywgZGVidWdm
cyk7Cj4gKwl9Cj4gKwoKRm9yIG1lIHRoaXMgY3JlYXRlcyBkZWJ1Z2ZzLzMtMDAwZi90c3RjdGwu
IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIGEgY2xlYXIgb3IgdXNhYmxlIHBhdGgsIGFuZCBjb3VsZCAK
ZXZlbiBjYXVzZSBhIG5hbWUgY29uZmxpY3QgaW4gdGhlIHdvcnN0IGNhc2UuCgpOb3Qgc3VyZSB3
aGF0J3MgYSBnb29kIHNvbHV0aW9uIGhlcmUsIGJ1dCBvbmx5IHR3byBzZW1pLWdvb2Qgb25lcyBj
b21lIHRvIG1pbmQ6IGhhdmUgaXQgaW4gc3lzZnMgCnVuZGVyIHRoZSBkZXZpY2UncyBkaXIsIG9y
IGRlYnVnZnMvZHJpL3NvbWV0aGluZy4gVGhlIGxhdHRlciBwcm9iYWJseSBuZWVkcyBzb21lIHRo
b3VnaHQgYW5kIGNvbW1vbiAKYWdyZWVtZW50IG9uIGhvdyB0byBoYW5kbGUgYnJpZGdlIGFuZCBw
YW5lbCBkZWJ1Z2ZzIGZpbGVzLiBCdXQgdGhhdCB3b3VsZCBiZSBhIGdvb2QgdGhpbmcgdG8gaGF2
ZSwgCmFzIEknbSBzdXJlIHRoZXJlIGFyZSBvdGhlciBzaW1pbGFyIGNhc2VzIChhdCBsZWFzdCBJ
IGhhdmUgYSBmZXcpLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwg
UG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAw
NjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
