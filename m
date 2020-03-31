Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48E19973D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 15:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C966E6E33E;
	Tue, 31 Mar 2020 13:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D93E6E339
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 13:19:16 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20752426-1500050 for multiple; Tue, 31 Mar 2020 14:19:11 +0100
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
 <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158566075049.18289.17918401274396829066@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 31 Mar 2020 14:19:10 +0100
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
Cc: Andi Shyti <andi.shyti@intel.com>, Christian König <ckoenig.leichtzumerken@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTAzLTMxIDExOjM4OjUwKQo+IE9uIFR1ZSwgTWFy
IDMxLCAyMDIwIGF0IDExOjIwIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPiB3cm90ZToKPiA+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAyMC0wMy0zMSAxMDoxNjox
OCkKPiA+ID4gT24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMTA6NTk6NDVBTSArMDIwMCwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiBBIG5vdCBzbyBnZW50bGUgcGluZywgc2luY2UgdGhp
cyBwcmV0dHkgbXVjaCBicm9rZSBhbGwgVFRNIGJhc2VkIGRyaXZlcnMuCj4gPiA+ID4KPiA+ID4g
PiBDb3VsZCB3ZSByZXZlcnQgdGhpcyBmb3Igbm93Pwo+ID4gPgo+ID4gPiBBbHdheXMgYWNrIGZv
ciByZXZlcnQuCj4gPiA+Cj4gPiA+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgo+ID4KPiA+IFNvIHlvdSBkaWRuJ3QgY2hlY2sgdGhlIGVhcmxpZXIgcGF0
Y2ggZWl0aGVyPwo+IAo+IEkgZGlkLCBidXQgd2Fzbid0IHN1cGVyIHNvbGQgb24gdGhlIGlkZWEg
b2YgbW9yZSBmbGFncyB0byBzbWFjayBhbiByLWIKPiBvbnRvIGl0LCBzbyBmaWd1cmVkIEknbGwg
dGhyb3cgdGhlIGRlZmF1bHQgYWNrLWZvci1yZXZlcnQgb24gdGhpcwo+IG1lYW53aGlsZS4KCldl
IGFsbG93IHVzZXJzcGFjZSB0byBwb2lzb24gdGhlIGRybV9tbSBhdCByb3VnaGx5IDhLIGludGVy
dmFscywgYQpzZWFyY2ggc3BhY2Ugb2YgMzViIHdpdGggdHlwaWNhbGx5IE8oTl4yKSBiZWhhdmlv
dXIgYW5kIGVhY2ggbm9kZQp0cmF2ZXJzYWwgKHJiX25leHQvcmJfcHJldikgd2lsbCBpdHNlbGYg
YmUgY29zdGx5LiBFdmVuIG91ciBzaW1wbGUgdGVzdHMKY2FuIGdlbmVyYXRlIGEgc2VhcmNoIG9m
IHNldmVyYWwgbWludXRlcyBiZWZvcmUgb3VyIHBhdGllbmNlIHJ1bnMgb3V0Lm8KQW55IGRybV9t
bSB0aGF0IGFsbG93cyBmb3IgdXNlcnNwYWNlIHRvIGNvbnRyb2wgYWxpZ25tZW50IGNhbiBiZQph
cmJpdHJhcmlseSBmcmFnbWVudGVkLCBoZW5jZSBhIHJhaXNlZCBleWVicm93IHRoYXQgdGhpcyBz
ZWFyY2ggd291bGQgYmUKYWxsb3dlZCBpbiBhdG9taWMgY29udGV4dC4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
