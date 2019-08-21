Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F89F98D66
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1B26EA9E;
	Thu, 22 Aug 2019 08:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 608386E2B8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 08:57:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 082D1337;
 Wed, 21 Aug 2019 01:57:56 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CC303F246;
 Wed, 21 Aug 2019 01:57:55 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Queue jobs on the hardware
To: Rob Herring <robh@kernel.org>
References: <20190816093107.30518-2-steven.price@arm.com>
 <CAL_JsqJKm7n=SuQrPTxfWR=Cgqn-gR-bgOrOdTVyR_XCae0FQg@mail.gmail.com>
 <CAL_JsqL2oeKDKqv0DSQkMmM_=0sN0eY37xi4Y4oComX_v4U9oQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2dbb2b86-c409-1f58-275d-bec054da4dd5@arm.com>
Date: Wed, 21 Aug 2019 09:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL2oeKDKqv0DSQkMmM_=0sN0eY37xi4Y4oComX_v4U9oQ@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMDgvMjAxOSAxODowMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMTks
IDIwMTkgYXQgMTE6NTggQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+
Cj4+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDQ6MzEgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gVGhlIGhhcmR3YXJlIGhhcyBhIHNldCBvZiAn
X05FWFQnIHJlZ2lzdGVycyB0aGF0IGNhbiBob2xkIGEgc2Vjb25kIGpvYgo+Pj4gd2hpbGUgdGhl
IGZpcnN0IGlzIGV4ZWN1dGluZy4gTWFrZSB1c2Ugb2YgdGhlc2UgcmVnaXN0ZXJzIHRvIGVucXVl
dWUgYQo+Pj4gc2Vjb25kIGpvYiBwZXIgc2xvdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGV2
ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+Pj4gLS0tCj4+PiBOb3RlIHRoYXQgdGhp
cyBpcyBiYXNlZCBvbiB0b3Agb2YgUm9iIEhlcnJpbmcncyAicGVyIEZEIGFkZHJlc3Mgc3BhY2Ui
Cj4+PiBwYXRjaFsxXS4KPj4+Cj4+PiBbMV0gaHR0cHM6Ly9tYXJjLmluZm8vP2k9MjAxOTA4MTMx
NTAxMTUuMzAzMzgtMS1yb2JoJTIwKCklMjBrZXJuZWwlMjAhJTIwb3JnCj4+Pgo+Pj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8ICA0ICstCj4+PiAgZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jICAgIHwgNzYgKysrKysrKysrKysrKysr
KysrLS0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyAgICB8
ICAyICstCj4+PiAgMyBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkKPj4KPj4gTEdUTSwgYnV0IEknbGwgZ2l2ZSBUb21ldSBhIGNoYW5jZSB0byBjb21tZW50
Lgo+IAo+IFRob3VnaCBjaGVja3BhdGNoIHJlcG9ydHMgc29tZSBzdHlsZSBuaXRzOgoKR2FoISBT
b3JyeSAtIEkgcHJvYmFibHkgc2hvdWxkIGhhdmUgcHVzaGVkIHRoaXMgb3V0IGFzIGFuIFJGQyBh
bnl3YXkuIE15CkRESy1vbi1QYW5mcm9zdCBpbnZlc3RpZ2F0aW9uIHNob3dlZCBhIGRlY2VudCBw
ZXJmb3JtYW5jZSBpbXByb3ZlbWVudCwKYnV0IEkgaGFkbid0IGFjdHVhbGx5IHRlc3RlZCB3aXRo
IHRoZSBNZXNhIGRyaXZlci4gQW5kIGFzIFRvbWV1IGhhcwpkaXNjb3ZlcmVkIHRoYXQgaXQgYWN0
dWFsbHkgc2xvd3MgZG93biBJIGd1ZXNzIHdlIG5lZWQgdG8gaW52ZXN0aWdhdGUKdGhhdCBiZWZv
cmUgbWVyZ2luZy4KClN0ZXZlCgo+IC06NDY6IENIRUNLOkNPTVBBUklTT05fVE9fTlVMTDogQ29t
cGFyaXNvbiB0byBOVUxMIGNvdWxkIGJlIHdyaXR0ZW4KPiAiIXBmZGV2LT5qb2JzW3Nsb3RdWzBd
Igo+ICM0NjogRklMRTogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jOjE0
MzoKPiArICAgICAgIGlmIChwZmRldi0+am9ic1tzbG90XVswXSA9PSBOVUxMKQo+IAo+IC06NDg6
IENIRUNLOkNPTVBBUklTT05fVE9fTlVMTDogQ29tcGFyaXNvbiB0byBOVUxMIGNvdWxkIGJlIHdy
aXR0ZW4KPiAiIXBmZGV2LT5qb2JzW3Nsb3RdWzFdIgo+ICM0ODogRklMRTogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jOjE0NToKPiArICAgICAgIGlmIChwZmRldi0+am9i
c1tzbG90XVsxXSA9PSBOVUxMKQo+IAo+IC06NTM6IENIRUNLOk9QRU5fRU5ERURfTElORTogTGlu
ZXMgc2hvdWxkIG5vdCBlbmQgd2l0aCBhICcoJwo+ICM1MzogRklMRTogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jOjE1MDoKPiArc3RhdGljIHN0cnVjdCBwYW5mcm9zdF9q
b2IgKnBhbmZyb3N0X2RlcXVldWVfam9iKAo+IAo+IC06Njc6IENIRUNLOkNPTVBBUklTT05fVE9f
TlVMTDogQ29tcGFyaXNvbiB0byBOVUxMIGNvdWxkIGJlIHdyaXR0ZW4KPiAiIXBmZGV2LT5qb2Jz
W3Nsb3RdWzBdIgo+ICM2NzogRklMRTogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2pvYi5jOjE2NDoKPiArICAgICAgIGlmIChwZmRldi0+am9ic1tzbG90XVswXSA9PSBOVUxMKSB7
Cj4gCj4gLTo3MTogQ0hFQ0s6Q09NUEFSSVNPTl9UT19OVUxMOiBDb21wYXJpc29uIHRvIE5VTEwg
Y291bGQgYmUgd3JpdHRlbgo+ICJwZmRldi0+am9ic1tzbG90XVsxXSIKPiAjNzE6IEZJTEU6IGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYzoxNjg6Cj4gKyAgICAgICBXQVJO
X09OKHBmZGV2LT5qb2JzW3Nsb3RdWzFdICE9IE5VTEwpOwo+IAo+IC06MTYwOiBFUlJPUjpTUEFD
SU5HOiBzcGFjZSBwcm9oaWJpdGVkIGJlZm9yZSB0aGF0ICctLScgKGN0eDpXeE8pCj4gIzE2MDog
RklMRTogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jOjQ5NzoKPiArICAg
ICAgICAgICAgICAgICAgICAgICBqb2JzIC0tOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXgo+IAo+IC06MTY1OiBFUlJPUjpTUEFDSU5HOiBzcGFjZSByZXF1aXJlZCBvbmUgc2lkZSBv
ZiB0aGF0ICctLScgKGN0eDpXeFcpCj4gIzE2NTogRklMRTogZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2pvYi5jOjUwMDoKPiArICAgICAgICAgICAgICAgd2hpbGUgKGpvYnMgLS0g
PiBhY3RpdmUpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IAo+IC06MjA0OiBD
SEVDSzpTUEFDSU5HOiBzcGFjZXMgcHJlZmVycmVkIGFyb3VuZCB0aGF0ICcqJyAoY3R4OlZ4VikK
PiAjMjA0OiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmM6MTUw
Ogo+ICsgICAgICAgICAgICAgICBXQVJOX09OKGVuID49IE5VTV9KT0JfU0xPVFMqMik7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
