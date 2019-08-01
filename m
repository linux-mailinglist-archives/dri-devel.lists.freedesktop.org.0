Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC757E11D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 19:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162F86E750;
	Thu,  1 Aug 2019 17:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EC86E750;
 Thu,  1 Aug 2019 17:30:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17794926-1500050 for multiple; Thu, 01 Aug 2019 18:30:47 +0100
MIME-Version: 1.0
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190731164829.GA399@tigerII.localdomain>
References: <20190721142930.GA480@tigerII.localdomain>
 <20190731164829.GA399@tigerII.localdomain>
Message-ID: <156468064507.12570.1311173864105235053@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [linux-next] mm/i915: i915_gemfs_init() NULL
 dereference
Date: Thu, 01 Aug 2019 18:30:45 +0100
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
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZXJnZXkgU2Vub3poYXRza3kgKDIwMTktMDctMzEgMTc6NDg6MjkpCj4gQEAgLTM2
LDE5ICszOCwzNSBAQCBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICppOTE1KQo+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiID0gZ2VtZnMt
Pm1udF9zYjsKPiAgICAgICAgICAgICAgICAgLyogRklYTUU6IERpc2FibGVkIHVudGlsIHdlIGdl
dCBXL0EgZm9yIHJlYWQgQlcgaXNzdWUuICovCj4gICAgICAgICAgICAgICAgIGNoYXIgb3B0aW9u
c1tdID0gImh1Z2U9bmV2ZXIiOwo+IC0gICAgICAgICAgICAgICBpbnQgZmxhZ3MgPSAwOwo+ICAg
ICAgICAgICAgICAgICBpbnQgZXJyOwo+ICAKPiAtICAgICAgICAgICAgICAgZXJyID0gc2ItPnNf
b3AtPnJlbW91bnRfZnMoc2IsICZmbGFncywgb3B0aW9ucyk7Cj4gLSAgICAgICAgICAgICAgIGlm
IChlcnIpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBrZXJuX3VubW91bnQoZ2VtZnMpOwo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gLSAgICAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgICAgZmMgPSBmc19jb250ZXh0X2Zvcl9yZWNvbmZpZ3VyZShzYi0+c19y
b290LCAwLCAwKTsKPiArICAgICAgICAgICAgICAgaWYgKElTX0VSUihmYykpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWZjLT5v
cHMtPnBhcnNlX21vbm9saXRoaWMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7
Cj4gKwo+ICsgICAgICAgICAgICAgICBlcnIgPSBmYy0+b3BzLT5wYXJzZV9tb25vbGl0aGljKGZj
LCBvcHRpb25zKTsKPiArICAgICAgICAgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIGVycjsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghZmMtPm9wcy0+cmVj
b25maWd1cmUpCgpJdCB3b3VsZCBiZSBvZGQgZm9yIGZzX2NvbnRleHRfZm9yX3JlY29uZmlndXJl
KCkgdG8gYWxsb3cgY3JlYXRpb24gb2YgYQpjb250ZXh0IGlmIHRoYXQgY29udGV4dCBjb3VsZG4n
dCBwZXJmb3JtIGEgcmVjb25maWdyZSwgbmV2ZXJ0aGVsZXNzIHRoYXQKc2VlbXMgdG8gYmUgdGhl
IGNhc2UuCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ICsKPiArICAgICAg
ICAgICAgICAgZXJyID0gZmMtPm9wcy0+cmVjb25maWd1cmUoZmMpOwo+ICsgICAgICAgICAgICAg
ICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwoKT25seSB0aGlu
ZyB0aGF0IHN0YW5kcyBvdXQgaXMgdGhhdCB3ZSBzaG91bGQgcHV0X2ZzX2NvbnRleHQoKSBoZXJl
IGFzCndlbGwuIEkgZ3Vlc3MgaXQncyBiZXR0ZXIgdGhhbiBwb2tpbmcgYXQgdGhlIFNCX0lORk8g
ZGlyZWN0bHkgb3Vyc2VsdmVzLgoKSSB0aGluayB0aG91Z2ggd2Ugc2hvdWxkbid0IGJhaWwgaWYg
d2UgY2FuJ3QgY2hhbmdlIHRoZSB0aHAgc2V0dGluZywgYW5kCmp1c3QgYWNjZXB0IHdoYXRldmVy
IHdpdGggYSB3YXJuaW5nLgoKTG9va3MgbGlrZSB0aGUgQVBJIGlzIGFscmVhZHkgYXZhaWxhYmxl
IGluIGRpbnEsIHNvIHdlIGNhbiBhcHBseSB0aGlzCmFoZWFkIG9mIHRoZSBuZXh0IG1lcmdlIHdp
bmRvdy4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
