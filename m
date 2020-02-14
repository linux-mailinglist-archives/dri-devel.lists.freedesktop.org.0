Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247015D3D7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24366E44D;
	Fri, 14 Feb 2020 08:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1ED6E44D;
 Fri, 14 Feb 2020 08:32:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20220168-1500050 for multiple; Fri, 14 Feb 2020 08:32:23 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87v9o965gg.fsf@intel.com>
References: <20200214054706.33870-1-natechancellor@gmail.com>
 <87v9o965gg.fsf@intel.com>
Message-ID: <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
Date: Fri, 14 Feb 2020 08:32:19 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAyMC0wMi0xNCAwNjozNjoxNSkKPiBPbiBUaHUsIDEzIEZl
YiAyMDIwLCBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPiB3cm90
ZToKPiA+IEEgcmVjZW50IGNvbW1pdCBpbiBjbGFuZyBhZGRlZCAtV3RhdXRvbG9naWNhbC1jb21w
YXJlIHRvIC1XYWxsLCB3aGljaCBpcwo+ID4gZW5hYmxlZCBmb3IgaTkxNSBhZnRlciAtV3RhdXRv
bG9naWNhbC1jb21wYXJlIGlzIGRpc2FibGVkIGZvciB0aGUgcmVzdAo+ID4gb2YgdGhlIGtlcm5l
bCBzbyB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uIHg4Nl82NDoKPiA+Cj4gPiAgLi4v
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYzoxNDMzOjIyOiB3
YXJuaW5nOgo+ID4gIHJlc3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50IDU3NjQ2MDc1MjMw
MzQyMzQ4NyB3aXRoIGV4cHJlc3Npb24gb2YKPiA+ICB0eXBlICd1bnNpZ25lZCBpbnQnIGlzIGFs
d2F5cyBmYWxzZQo+ID4gIFstV3RhdXRvbG9naWNhbC1jb25zdGFudC1vdXQtb2YtcmFuZ2UtY29t
cGFyZV0KPiA+ICAgICAgICAgIGlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01B
WCkpKQo+ID4gICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+ID4gIC4uL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDo3ODo0Mjogbm90ZTogZXhwYW5kZWQg
ZnJvbSBtYWNybyAndW5saWtlbHknCj4gPiAgIyBkZWZpbmUgdW5saWtlbHkoeCkgICAgX19idWls
dGluX2V4cGVjdCghISh4KSwgMCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXgo+ID4gIDEgd2FybmluZyBnZW5lcmF0ZWQuCj4gPgo+ID4gSXQgaXMgbm90
IHdyb25nIGluIHRoZSBjYXNlIHdoZXJlIFVMT05HX01BWCA+IFVJTlRfTUFYIGJ1dCBpdCBkb2Vz
IG5vdAo+ID4gYWNjb3VudCBmb3IgdGhlIGNhc2Ugd2hlcmUgdGhpcyBmaWxlIGlzIGJ1aWx0IGZv
ciAzMi1iaXQgeDg2LCB3aGVyZQo+ID4gVUxPTkdfTUFYID09IFVJTlRfTUFYIGFuZCB0aGlzIGNo
ZWNrIGlzIHN0aWxsIHJlbGV2YW50Lgo+ID4KPiA+IENhc3QgcmVtYWluIHRvIHVuc2lnbmVkIGxv
bmcsIHdoaWNoIGtlZXBzIHRoZSBnZW5lcmF0ZWQgY29kZSB0aGUgc2FtZQo+ID4gKHZlcmlmaWVk
IHdpdGggY2xhbmctMTEgb24geDg2XzY0IGFuZCBHQ0MgOS4yLjAgb24geDg2IGFuZCB4ODZfNjQp
IGFuZAo+ID4gdGhlIHdhcm5pbmcgaXMgc2lsZW5jZWQgc28gd2UgY2FuIGNhdGNoIG1vcmUgcG90
ZW50aWFsIGlzc3VlcyBpbiB0aGUKPiA+IGZ1dHVyZS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83NzgKPiA+IFN1Z2dlc3RlZC1i
eTogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KPiA+IFNpZ25lZC1vZmYtYnk6
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gCj4gV29ya3Mg
Zm9yIG1lIGFzIGEgd29ya2Fyb3VuZCwKCkJ1dCB0aGUgd2hvbGUgcG9pbnQgd2FzIHRoYXQgdGhl
IGNvbXBpbGVyIGNvdWxkIHNlZSB0aGF0IGl0IHdhcwppbXBvc3NpYmxlIGFuZCBub3QgZW1pdCB0
aGUgY29kZS4gRG9lc24ndCB0aGlzIGJyZWFrIHRoYXQ/Ci1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
