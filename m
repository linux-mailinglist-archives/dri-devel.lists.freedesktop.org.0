Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E1D8791B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 13:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765916EDC3;
	Fri,  9 Aug 2019 11:59:03 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068C6EDC3
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 11:59:02 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17942631-1500050 for multiple; Fri, 09 Aug 2019 12:58:54 +0100
MIME-Version: 1.0
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
Message-ID: <156535193145.29541.1781677832750655785@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
Date: Fri, 09 Aug 2019 12:58:51 +0100
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0wOC0wOSAxMjozMDozMCkKPiAraW50IGRy
bV9zeW5jb2JqX2JpbmFyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRh
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9maWxlICpmaWxlX3By
aXZhdGUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBkcm1fc3luY29ial9iaW5hcnlfYXJyYXkgKmFy
Z3MgPSBkYXRhOwo+ICsgICAgICAgc3RydWN0IGRybV9zeW5jb2JqICoqc3luY29ianM7Cj4gKyAg
ICAgICB1MzIgX191c2VyICphY2Nlc3NfZmxhZ3MgPSB1NjRfdG9fdXNlcl9wdHIoYXJncy0+YWNj
ZXNzX2ZsYWdzKTsKPiArICAgICAgIHU2NCBfX3VzZXIgKnZhbHVlcyA9IHU2NF90b191c2VyX3B0
cihhcmdzLT52YWx1ZXMpOwo+ICsgICAgICAgdTMyIGk7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsK
PiArICAgICAgIGlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9TWU5DT0JK
X1RJTUVMSU5FKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiAr
ICAgICAgIGlmIChhcmdzLT5wYWQgIT0gMCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gKwo+ICsgICAgICAgaWYgKGFyZ3MtPmNvdW50X2hhbmRsZXMgPT0gMCkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgpZb3UgbWF5IGZpbmQgaXQgZWFzaWVyIHRvIGp1c3Qg
cmV0dXJuIHN1Y2Nlc3MgZm9yIDAgaGFuZGxlcy4gU2xpZ2h0bHkgbGVzcwpvYm5veGlvdXMgZXJy
b3IgaGFuZGxpbmc/Cgo+ICsgICAgICAgcmV0ID0gZHJtX3N5bmNvYmpfYXJyYXlfZmluZChmaWxl
X3ByaXZhdGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NF90b191
c2VyX3B0cihhcmdzLT5oYW5kbGVzKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYXJncy0+Y291bnRfaGFuZGxlcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnN5bmNvYmpzKTsKPiArICAgICAgIGlmIChyZXQgPCAwKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBhcmdzLT5jb3Vu
dF9oYW5kbGVzOyBpKyspIHsKPiArICAgICAgICAgICAgICAgdTMyIGZsYWdzOwo+ICsKPiArICAg
ICAgICAgICAgICAgY29weV9mcm9tX3VzZXIoJmZsYWdzLCAmYWNjZXNzX2ZsYWdzW2ldLCBzaXpl
b2YoZmxhZ3MpKTsKPiArICAgICAgICAgICAgICAgcmV0ID0gcmV0ID8gLUVGQVVMVCA6IDA7CgpN
YWdpYz8KCmlmIChnZXRfdXNlcihmbGFncywgJmFjY2Vzc19mbGFnc1tpWykpCglyZXR1cm4gLUVG
QVVMVDsKCj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoZmxhZ3MgJiBJOTE1X0RSTV9TWU5D
T0JKX0JJTkFSWV9JVEVNX1ZBTFVFX1JFQUQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBj
b3B5X3RvX3VzZXIoJnZhbHVlc1tpXSwgJnN5bmNvYmpzW2ldLT5iaW5hcnlfcGF5bG9hZCwgc2l6
ZW9mKHZhbHVlc1tpXSkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHJldCA/IC1F
RkFVTFQgOiAwOwoKTW9yZSBtYWdpYy4KCmlmIChwdXRfdXNlcigmc3luY29ianNbaV0tPmJpbmFy
eV9wYXlsb2FkLCAmdmFsdWVzW2ldKSkKCXJldHVybiAtRUZBVUxUOwoKPiArICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGlmIChmbGFncyAm
IEk5MTVfRFJNX1NZTkNPQkpfQklOQVJZX0lURU1fVkFMVUVfSU5DKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHN5bmNvYmpzW2ldLT5iaW5hcnlfcGF5bG9hZCsrOwoKU28gaWYgYW4gZXJyb3Ig
b2NjdXJzIGhvdyBkb2VzIHRoZSB1c2VyIGtub3cgd2hpY2ggc3luY29iaiB3ZXJlCmFkdmFuY2Vk
IGJlZm9yZSB0aGUgZXJyb3I/IChPciBleHBsYWluIHdoeSBpdCBkb2Vzbid0IGFjdHVhbGx5IG1h
dHRlcikKVGhlIGNsdWUgSSBndWVzcyBpcyB3aXRoIHJlYWQvaW5jLCBidXQgY29uZmlybWF0aW9u
IG9mIGRlc2lnbiB3b3VsZCBiZQpuaWNlLgoKTm90IGF0b21pYyAodGhlIHU2NCB3cml0ZSBzaG91
bGQgcmVhbGx5IGJlIHRvIGF2b2lkIHRvdGFsIGNvcnJ1cHRpb24pCmFuZCBub3RoaW5nIHByZXZl
bnRzIHVzZXJzcGFjZSBmcm9tIHJhY2luZy4gSG93IHNhZmUgaXMgdGhhdCBpbiB0aGUKb3ZlcmFs
bCBkZXNpZ24/CgpXaGF0IHdvdWxkIGhhcHBlbiBpZiB0aGUgYmluYXJ5X3BheWxvYWQgd2FzIGlu
aXRpYWxpc2VkIHRvIC0xPwoKPiArICAgICAgIH0KPiArCj4gICAgICAgICBkcm1fc3luY29ial9h
cnJheV9mcmVlKHN5bmNvYmpzLCBhcmdzLT5jb3VudF9oYW5kbGVzKTsKPiAgCj4gICAgICAgICBy
ZXR1cm4gcmV0OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
