Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90F901EE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 14:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B006E33E;
	Fri, 16 Aug 2019 12:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29D6E33E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:47:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0EE7CAF59;
 Fri, 16 Aug 2019 12:47:56 +0000 (UTC)
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
To: Petr Vandrovec <petr@vandrovec.name>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
 <20190802225939.GE5597@bombadil.infradead.org>
 <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
 <45258da8-2ce7-68c2-1ba0-84f6c0e634b1@suse.cz>
 <0287aace-fec1-d2d1-370f-657e80477717@vandrovec.name>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <6a45a9b1-81ad-72c4-8f06-5d2cd87278ef@suse.cz>
Date: Fri, 16 Aug 2019 14:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0287aace-fec1-d2d1-370f-657e80477717@vandrovec.name>
Content-Language: en-US
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
Cc: Joerg Roedel <jroedel@suse.de>, David Airlie <airlied@linux.ie>,
 bugzilla-daemon@bugzilla.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, Qian Cai <cai@lca.pw>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNS8xOSA5OjEzIFBNLCBQZXRyIFZhbmRyb3ZlYyB3cm90ZToKPiBWbGFzdGltaWzCoEJh
YmthwqB3cm90ZcKgb27CoDgvMTUvMjAxOcKgNzozMsKgQU06Cj4+Cj4+IERvZXPCoHRoZcKgaXNz
dWXCoHN0aWxswqBoYXBwZW7CoHdpdGjCoHJjND/CoENvdWxkwqB5b3XCoGFwcGx5wqB0aGXCoDPC
oGF0dGFjaGVkCj4+IHBhdGNoZXPCoCh3b3JrwqBpbsKgcHJvZ3Jlc3MpLMKgY29uZmlndXJlLWVu
YWJsZcKgQ09ORklHX0RFQlVHX1BBR0VBTExPQ8KgYW5kCj4+IENPTkZJR19QQUdFX09XTkVSwqBh
bmTCoGJvb3TCoGtlcm5lbMKgd2l0aMKgZGVidWdfcGFnZWFsbG9jPW9uwqBwYWdlX293bmVyPW9u
Cj4+IHBhcmFtZXRlcnM/wqBUaGF0wqBzaG91bGTCoHByaW50wqBzdGFja3RyYWNlc8Kgb2bCoGFs
bG9jYXRpb27CoGFuZMKgZmlyc3QKPj4gZnJlZWluZ8KgKGFzc3VtaW5nwqB0aGlzwqBpc8KgYcKg
ZG91YmxlwqBmcmVlKS4KPiAKPiBVbmZvcnR1bmF0ZWx5IC1yYzQgZG9lcyBub3QgZmluZCBhbnkg
bXkgU0FUQSBkaXNrcyBkdWUgdG8gc29tZSAKPiBtaXN1bmRlcnN0YW5kaW5nIGJldHdlZW4gQUhD
SSBkcml2ZXIgYW5kIEhQVDY0MkwgYWRhcHRlciAodGhlcmUgaXMgbm8gCj4gZGV2aWNlwqAwNzow
MC4xLMKgSFBUwqBpc8Kgc2luZ2xlLWZ1bmN0aW9uwqBkZXZpY2XCoGF0wqAwNzowMC4wKToKPiAK
PiBbwqDCoMKgMTguMDAzMDE1XcKgc2NzacKgaG9zdDY6wqBhaGNpCj4gW8KgwqDCoDE4LjAwNjYw
NV3CoERNQVI6wqBEUkhEOsKgaGFuZGxpbmfCoGZhdWx0wqBzdGF0dXPCoHJlZ8KgMgo+IFvCoMKg
IDE4LjAwNjYxOV0gRE1BUjogW0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzA3OjAwLjFdIGZh
dWx0IGFkZHIgCj4gZmZmZTAwMDDCoFtmYXVsdMKgcmVhc29uwqAwMl3CoFByZXNlbnTCoGJpdMKg
aW7CoGNvbnRleHTCoGVudHJ5wqBpc8KgY2xlYXIKPiBbwqDCoMKgMTguMDc2NjE2XcKgRE1BUjrC
oERSSEQ6wqBoYW5kbGluZ8KgZmF1bHTCoHN0YXR1c8KgcmVnwqAxMDIKPiBbwqDCoCAxOC4wODU5
MTBdIERNQVI6IFtETUEgV3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswNzowMC4xXSBmYXVsdCBhZGRy
IAo+IGZmZmEwMDAwwqBbZmF1bHTCoHJlYXNvbsKgMDJdwqBQcmVzZW50wqBiaXTCoGluwqBjb250
ZXh0wqBlbnRyecKgaXPCoGNsZWFyCj4gW8KgwqDCoDE4LjEwMDk4OV3CoERNQVI6wqBEUkhEOsKg
aGFuZGxpbmfCoGZhdWx0wqBzdGF0dXPCoHJlZ8KgMjAyCj4gW8KgwqAgMTguMTEwOTg1XSBETUFS
OiBbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDc6MDAuMV0gZmF1bHQgYWRkciAKPiBmZmZl
MDAwMMKgW2ZhdWx0wqByZWFzb27CoDAyXcKgUHJlc2VudMKgYml0wqBpbsKgY29udGV4dMKgZW50
cnnCoGlzwqBjbGVhcgoKV29ydGggcmVwb3J0aW5nIGFzIHdlbGwsIG5vdCBuaWNlIHJlZ3Jlc3Np
b24uCgo+IFdpdGggaW9tbXU9b2ZmIGRpc2tzIGFyZSB2aXNpYmxlLCBidXQgVVNCIGtleWJvYXJk
IChhbmQgb3RoZXIgVVNCIAo+IGRldmljZXMpwqBkb2VzwqBub3TCoHdvcms6CgpJJ3ZlIGJlZW4g
dG9sZCBpb21tdT1zb2Z0IG1pZ2h0IGhlbHAuCgo+IFvCoMKgIDE4LjE3NDgwMl0gZWhjaS1wY2kg
MDAwMDowMDoxYS4wOiBzd2lvdGxiIGJ1ZmZlciBpcyBmdWxsIChzejogOCAKPiBieXRlcykswqB0
b3RhbMKgMMKgKHNsb3RzKSzCoHVzZWTCoDDCoChzbG90cykKPiBbwqDCoCAxOC4xNzQ4MDRdIGVo
Y2ktcGNpIDAwMDA6MDA6MWEuMDogb3ZlcmZsb3cgMHgwMDAwMDAwZmZkYzc1YWU4Kzggb2YgCj4g
RE1BwqBtYXNrwqBmZmZmZmZmZsKgYnVzwqBtYXNrwqAwCj4gW8KgwqAgMTguMTc0ODE1XSBXQVJO
SU5HOiBDUFU6IDIgUElEOiA1MDggYXQga2VybmVsL2RtYS9kaXJlY3QuYzozNSAKPiByZXBvcnRf
YWRkcisweDJlLzB4NTAKPiBbwqDCoMKgMTguMTc0ODE2XcKgTW9kdWxlc8KgbGlua2VkwqBpbjoK
PiBbwqDCoCAxOC4xNzQ4MThdIENQVTogMiBQSUQ6IDUwOCBDb21tOiBrd29ya2VyLzI6MSBUYWlu
dGVkOiBHIAo+ICDCoMKgVMKgNS4zLjAtcmM0LTY0LTAwMDU4LWdkNzE3YjA5MmUwYjLCoCM3Nwo+
IFvCoMKgIDE4LjE3NDgxOV0gSGFyZHdhcmUgbmFtZTogRGVsbCBJbmMuIFByZWNpc2lvbiBUMzYx
MC8wOU04WTgsIEJJT1MgQTE2IAo+IDAyLzA1LzIwMTgKPiBbwqDCoMKgMTguMTc0ODIyXcKgV29y
a3F1ZXVlOsKgdXNiX2h1Yl93ccKgaHViX2V2ZW50Cj4gCj4gSSdsbMKgdHJ5wqB0b8KgZmluZMKg
LXJjNMKgY29uZmlndXJhdGlvbsKgdGhhdMKgaGFzwqBlbmFibGVkwqBkZWJ1Z2dpbmfCoGFuZMKg
Y2FuwqBib290LiAKPiAKPiAKPiBQZXRyCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
