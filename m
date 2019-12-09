Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599EB116FD7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB106E49A;
	Mon,  9 Dec 2019 15:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5AD6E497
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:05:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9F5NDJ130665;
 Mon, 9 Dec 2019 09:05:23 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9F5NDt108360
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 09:05:23 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 09:05:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 09:05:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9F5JIq111204;
 Mon, 9 Dec 2019 09:05:20 -0600
Subject: Re: [PATCH v3 2/2] drm/bridge: tc358767: Expose test mode
 functionality via debugfs
To: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20191209050857.31624-1-andrew.smirnov@gmail.com>
 <20191209050857.31624-3-andrew.smirnov@gmail.com>
 <45afdff8-4f91-f5be-a299-d0c7fed71ea7@ti.com>
 <CAHQ1cqH8XTYysd1Nv2Q0EziXfJWeemZeyyZZ3OKoCv8=XrHZWA@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f873e4de-eabf-2746-8ad8-3d3c7d64a270@ti.com>
Date: Mon, 9 Dec 2019 17:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqH8XTYysd1Nv2Q0EziXfJWeemZeyyZZ3OKoCv8=XrHZWA@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575903923;
 bh=XNER3J3YDTiVz49WC0ITFYur4Q7s4xSP545U1ahkPeo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=T0U0RYf/NxPInPqdVS5xs2WZZqG02iJDAD6F3Fi/9Ru2MTZgY5jrzUAHSL5x2Mn7c
 C/scQrm8z/1tV/bKh/5RYQhZMg/WnwCnCS6pU9HRkzO3LX56MfuOC5hVfooU8pMMUV
 4vH+/j/+UmC6uPtytAJJStE5PSY/QBp6mWjvuQFY=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMTIvMjAxOSAxNjozOCwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gT24gTW9uLCBEZWMg
OSwgMjAxOSBhdCAxOjM4IEFNIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+
IHdyb3RlOgo+Pgo+PiAoQ2MnaW5nIERhbmllbCBmb3IgdGhlIGxhc3QgcGFyYWdyYXBoKQo+Pgo+
PiBPbiAwOS8xMi8yMDE5IDA3OjA4LCBBbmRyZXkgU21pcm5vdiB3cm90ZToKPj4+IFByZXNlbnRs
eSwgdGhlIGRyaXZlciBjb2RlIGFydGlmaWNpYWxseSBsaW1pdHMgdGVzdCBwYXR0ZXJuIG1vZGUg
dG8gYQo+Pj4gc2luZ2xlIHBhdHRlcm4gd2l0aCBmaXhlZCBjb2xvciBzZWxlY3Rpb24uIEl0IGJl
aW5nIGEga2VybmVsIG1vZHVsZQo+Pj4gcGFyYW1ldGVyIG1ha2VzIHN3aXRjaGluZyAidGVzdCBw
YXR0ZXJuIiA8LT4gInByb3BlciBvdXRwdXQiIG1vZGVzCj4+PiBvbi10aGUtZmx5IGNsdW5reSBh
bmQgb3V0cmlnaHQgaW1wb3NzaWJsZSBpZiB0aGUgZHJpdmVyIGlzIGJ1aWx0IGludG8KPj4+IHRo
ZSBrZXJuZWwuCj4+Cj4+IFRoYXQncyBub3QgY29ycmVjdCwgL3N5cy9tb2R1bGUvdGMzNTg3Njcv
cGFyYW1ldGVycy90ZXN0IGlzIHRoZXJlIGV2ZW4gaWYgdGhlIGRyaXZlciBpcyBidWlsdC1pbi4K
Pj4KPiAKPiBUcnVlLCBJJ2xsIGRyb3AgdGhlICJpbXBvc3NpYmxlIiBwYXJ0IG9mIHRoZSBkZXNj
cnB0aW9uLiBIYXZpbmcgdG8KPiB1bmJpbmQgYW5kIGJpbmQgZGV2aWNlIHRvIHRoZSBkcml2ZXIg
dG8gdXNlIHRoYXQgcGFyYW1ldGVyIGRlZmluaXRlbHkKPiBmYWxscyB1bmRlciAiY2x1bmt5IiBm
b3IgbWUgc3RpbGwsIHNvIEknbGwganVzdCBzdGljayB0byB0aGF0IGluIHRoZQo+IGRlc2NyaXB0
aW9uLgoKWW91IGRvbid0IG5lZWQgdG8gcmUtYmluZC4gWW91IGNhbiBjaGFuZ2UgdGhlIG1vZHVs
ZSBwYXJhbWV0ZXIgYXQgcnVudGltZSwgYW5kIGlmIHRoZSBkcml2ZXIgaGFwcGVucyAKdG8gdXNl
IHRoZSB2YWx1ZSwgdGhlbiBpdCB1c2VzIHRoZSBuZXcgdmFsdWUuIElmIEkgcmVjYWxsIHJpZ2h0
LCBjaGFuZ2luZyB0aGUgbW9kdWxlIHBhcmFtZXRlciBhbmQgCnRoZW4gZG9pbmcgYSBmdWxsIG1v
ZGVzZXQgZnJvbSB1c2Vyc3BhY2UgbWFkZSB0aGUgZHJpdmVyIHRvIHVzZSB0aGUgdGVzdCBtb2Rl
IChJJ20gbm90IDEwMCUgc3VyZSwgCnRob3VnaCkuCgpJbiBhbnkgY2FzZSwgSSdtIG5vdCBhZHZv
Y2F0aW5nIGZvciB0aGUgdXNlIG9mIG1vZHVsZSBwYXJhbWV0ZXIgaGVyZSA9KQoKPj4gSG1tLCBh
Y3R1YWxseSwganVzdCBlY2hvaW5nIDAgdG8gdHN0Y3RsIG11bHRpcGxlIHRpbWVzLCBpdCBtYWtl
cyB0aGUgc2NyZWVuIGdvIGJsYWNrIGFuZCB0aGVuCj4+IHJlc3RvcmVzIGl0IHdpdGggZXZlcnkg
b3RoZXIgZWNoby4KPj4KPiAKPiBTdHJhbmdlLCB3b3JrcyBvbiBteSBzZXR1cCBldmVyeSB0aW1l
LiBObyBlcnJvciBtZXNzYWdlcyBpbiBrZXJuZWwgbG9nCj4gSSBhc3N1bWU/IFByb2JhYmx5IHVu
cmVsYXRlZCwgYnV0IHdoZW4geW91IGVjaG8gIjAiIGFuZCB0aGUgc2NyZWVuCgpObyBlcnJvcnMu
Cgo+IHN0YXlzIGJsYWNrLCB3aGF0IGRvIHlvdSBzZWUgaW4gRFBfU0lOS19TVEFUVVMgcmVnaXN0
ZXI6Cj4gCj4gZGQgaWY9L2Rldi9kcm1fZHBfYXV4MCBicz0xIHNraXA9JCgoMHgyMDUpKSBjb3Vu
dD0xIDI+L2Rldi9udWxsIHwgaGV4ZHVtcCAtQ3YKPiAKPiA/IE5vdGUgdGhhdCB0aGlzIG5lZWRz
IENPTkZJR19EUk1fRFBfQVVYX0NIQVJERVYgdG8gYmUgZW5hYmxlZC4KCkknbGwgY2hlY2sgdGhp
cyBsYXRlciwgYW5kIGRvIGEgZmV3IG1vcmUgdGVzdHMuCgo+Pj4gKyAgICAgZGVidWdmcyA9IGRl
YnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShkZXYpLCBOVUxMKTsKPj4+ICsgICAgIGlmICghSVNf
RVJSKGRlYnVnZnMpKSB7Cj4+PiArICAgICAgICAgICAgIGRlYnVnZnNfY3JlYXRlX2ZpbGVfdW5z
YWZlKCJ0c3RjdGwiLCAwMjAwLCBkZWJ1Z2ZzLCB0YywKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnRjX3RzdGN0bF9mb3BzKTsKPj4+ICsgICAgICAgICAgICAg
ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgdGNfcmVtb3ZlX2RlYnVnZnMsIGRlYnVnZnMp
Owo+Pj4gKyAgICAgfQo+Pj4gKwo+Pgo+PiBGb3IgbWUgdGhpcyBjcmVhdGVzIGRlYnVnZnMvMy0w
MDBmL3RzdGN0bC4gSSBkb24ndCB0aGluayB0aGF0J3MgYSBjbGVhciBvciB1c2FibGUgcGF0aCwg
YW5kIGNvdWxkCj4+IGV2ZW4gY2F1c2UgYSBuYW1lIGNvbmZsaWN0IGluIHRoZSB3b3JzdCBjYXNl
Lgo+Pgo+IAo+IEkgYWdyZWUgb24gdXNhYmlsaXR5IGFzcGVjdCwgYnV0IEkgYW0gbm90IHN1cmUg
SSBjYW4gc2VlIGhvdyBhCj4gY29uZmxpY3QgY2FuIGhhcHBlbi4gV2hhdCBzY2VuYXJpbyBkbyB5
b3UgaGF2ZSBpbiBtaW5kIHRoYXQgd291bGQKPiBjYXVzZSB0aGF0PyBNeSB0aGlua2luZyB3YXMg
dGhhdCB0aGUgY29tYmluYXRpb24gb2YgSTJDIGJ1cyBudW1iZXIgKwo+IEkyQyBhZGRyZXNzIHNo
b3VsZCBhbHdheXMgYmUgdW5pcXVlIG9uIHRoZSBzeXN0ZW0sIGJ1dCBtYXliZSBJIGFtCj4gbWlz
c2luZyBzb21ldGhpbmc/CgpXZWxsLCB0aGUgZGlyIG5hbWUgZG9lc24ndCBoYXZlICJpMmMiIGFu
eXdoZXJlLCBzbyBhdCBsZWFzdCBpbiB0aGVvcnksIHNvbWUgb3RoZXIgYnVzIGNvdWxkIGhhdmUg
CiIzLTAwMGYiIGFkZHJlc3MgdG9vLgoKTWF5YmUgYmlnZ2VyIHByb2JsZW0gaXMgdGhhdCBpdCdz
IG5vdCBhdCBhbGwgb2J2aW91cyB3aGF0ICIzLTAwMGYiIG1lYW5zLiBBbGwgdGhlIG90aGVyIGRl
YnVnZnMgZGlycyAKbWFrZSBzZW5zZSB3aGVuIHlvdSBsb29rIGF0IHRoZSBuYW1lLCBhbmQgIjMt
MDAwZiIgbG9va3MgdmVyeSBvZGQgdGhlcmUuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50
cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMv
QnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
