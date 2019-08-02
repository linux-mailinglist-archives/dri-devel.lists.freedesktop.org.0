Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1747FB4B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2221F6EE61;
	Fri,  2 Aug 2019 13:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD536EE5F;
 Fri,  2 Aug 2019 13:41:24 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17818216-1500050 for multiple; Fri, 02 Aug 2019 14:41:17 +0100
MIME-Version: 1.0
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190802133503.GA18318@tigerII.localdomain>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
 <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
 <156475141863.6598.6809215010139776043@skylake-alporthouse-com>
 <20190802131523.GB466@tigerII.localdomain>
 <20190802133503.GA18318@tigerII.localdomain>
Message-ID: <156475327511.6598.417403815598052974@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] i915: do not leak module ref counter
Date: Fri, 02 Aug 2019 14:41:15 +0100
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZXJnZXkgU2Vub3poYXRza3kgKDIwMTktMDgtMDIgMTQ6MzU6MDMpCj4gT24gKDA4
LzAyLzE5IDIyOjE1KSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IFsuLl0KPiA+ID4gPiBM
b29raW5nIGFyb3VuZCwgaXQgbG9va3MgbGlrZSB3ZSBhbHdheXMgbmVlZCB0byBkcm9wIHR5cGUg
YWZ0ZXIKPiA+ID4gPiBtb3VudGluZy4gU2hvdWxkIHRoZQo+ID4gPiA+ICAgICAgICAgcHV0X2Zp
bGVzeXN0ZW0odHlwZSk7Cj4gPiA+ID4gYmUgaGVyZSBpbnN0ZWFkPwo+ID4gPiA+IAo+ID4gPiA+
IEFueXdheSwgbmljZSBjYXRjaC4KPiA+ID4gCj4gPiA+IFNpZ2guIHB1dF9maWxlc3lzdGVtKCkg
aXMgcGFydCBvZiBmcyBpbnRlcm5hbHMuIEknZCBiZSB0ZW1wdGVkIHRvIGFkZAo+ID4gCj4gPiBH
b29kIGNhdGNoIQo+ID4gCj4gPiBTbyB3ZSBjYW4gc3dpdGNoIHRvIHZmc19rZXJuX21vdW50KCks
IEkgZ3Vlc3MsIGJ1dCBwYXNzIGRpZmZlcmVudCBvcHRpb25zLAo+ID4gZGVwZW5kaW5nIG9uIGhh
c190cmFuc3BhcmVudF9odWdlcGFnZSgpLgo+IAo+IEhtbS4gVGhpcyBkb2Vzbid0IGxvb2sgZXhh
Y3RseSByaWdodC4gSXQgYXBwZWFycyB0aGF0IHZmc19rZXJuX21vdW50KCkKPiBoYXMgYSBzbGln
aHRseSBkaWZmZXJlbnQgcHVycG9zZS4gSXQncyBmb3IgZHJpdmVycyB3aGljaCByZWdpc3RlciB0
aGVpcgo+IG93biBmc3R5cGUgYW5kIGZzX2NvbnRleHQvc2IgY2FsbGJhY2tzLiBBIHR5cGljYWwg
dXNhZ2Ugd291bGQgYmUKPiAKPiAgICAgICAgIHN0YXRpYyBzdHJ1Y3QgZmlsZV9zeXN0ZW1fdHlw
ZSBuZnNkX2ZzX3R5cGUgPSB7Cj4gICAgICAgICAgICAgICAgIC5vd25lcuKGkiDihpIgICAgICAg
PSBUSElTX01PRFVMRSwKPiAgICAgICAgICAgICAgICAgLm5hbWXihpIgIOKGkiAgICAgICA9ICJu
ZnNkIiwKPiAgICAgICAgICAgICAgICAgLmluaXRfZnNfY29udGV4dCA9IG5mc2RfaW5pdF9mc19j
b250ZXh0LAo+ICAgICAgICAgICAgICAgICAua2lsbF9zYuKGkiAgICAgICA9IG5mc2RfdW1vdW50
LAo+ICAgICAgICAgfTsKPiAgICAgICAgIE1PRFVMRV9BTElBU19GUygibmZzZCIpOwo+IAo+ICAg
ICAgICAgdmZzX2tlcm5fbW91bnQoJm5mc2RfZnNfdHlwZSwgU0JfS0VSTk1PVU5ULCAibmZzZCIs
IE5VTEwpOwo+IAo+IGk5MTUgaXMgYSBkaWZmZXJlbnQgYmVhc3QsIGl0IGp1c3Qgd2FudHMgdG8g
bW91bnQgZnMgYW5kIHJlY29uZmlndXJlCj4gaXQsIGl0IGRvZXNuJ3Qgd2FudCB0byBiZSBhbiBm
cy4gU28gaXQgc2VlbXMgdGhhdCBjdXJyZW50IGtlcm5fbW91bnQoKQo+IGlzIGFjdHVhbGx5IHJp
Z2h0LgoKc3RydWN0IHZmc21vdW50ICprZXJuX21vdW50KHN0cnVjdCBmaWxlX3N5c3RlbV90eXBl
ICp0eXBlKQp7CiAgICAgICAgc3RydWN0IHZmc21vdW50ICptbnQ7CiAgICAgICAgbW50ID0gdmZz
X2tlcm5fbW91bnQodHlwZSwgU0JfS0VSTk1PVU5ULCB0eXBlLT5uYW1lLCBOVUxMKTsKICAgICAg
ICBpZiAoIUlTX0VSUihtbnQpKSB7CiAgICAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICAg
ICogaXQgaXMgYSBsb25ndGVybSBtb3VudCwgZG9uJ3QgcmVsZWFzZSBtbnQgdW50aWwKICAgICAg
ICAgICAgICAgICAqIHdlIHVubW91bnQgYmVmb3JlIGZpbGUgc3lzIGlzIHVucmVnaXN0ZXJlZAog
ICAgICAgICAgICAgICAgKi8KICAgICAgICAgICAgICAgIHJlYWxfbW91bnQobW50KS0+bW50X25z
ID0gTU5UX05TX0lOVEVSTkFMOwogICAgICAgIH0KICAgICAgICByZXR1cm4gbW50Owp9CgpXaXRo
IHRoZSBleGNlcHRpb24gb2YgZmlkZGxpbmcgd2l0aCBNTlRfTlNfSU5URVJOQUwsIGl0IHNlZW1z
CmFtZW5hYmxlIGZvciBvdXIgbmVlZHMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
