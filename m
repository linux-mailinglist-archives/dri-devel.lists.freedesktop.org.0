Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1068789
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 12:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65989954;
	Mon, 15 Jul 2019 10:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035A89949;
 Mon, 15 Jul 2019 10:58:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17308875-1500050 for multiple; Mon, 15 Jul 2019 11:58:43 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <d6d1b44d-bec1-6a46-bcd4-5790bf7b6347@amd.com>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
 <d6d1b44d-bec1-6a46-bcd4-5790bf7b6347@amd.com>
Message-ID: <156318832239.9436.16287182586090174666@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 1/2] dma-buf: Expand reservation_list to fill allocation
Date: Mon, 15 Jul 2019 11:58:42 +0100
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Daenzer, Michel" <Michel.Daenzer@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wNy0xNCAwODozNzo0NykKPiBBbSAxMi4w
Ny4xOSB1bSAxMDowMyBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IFNpbmNlIGttYWxsb2MoKSB3
aWxsIHJvdW5kIHVwIHRoZSBhbGxvY2F0aW9uIHRvIHRoZSBuZXh0IHNsYWIgc2l6ZSBvcgo+ID4g
cGFnZSwgaXQgd2lsbCBub3JtYWxseSByZXR1cm4gYSBwb2ludGVyIHRvIGEgbWVtb3J5IGJsb2Nr
IGJpZ2dlciB0aGFuIHdlCj4gPiBhc2tlZCBmb3IuIFdlIGNhbiBxdWVyeSBmb3IgdGhlIGFjdHVh
bCBzaXplIG9mIHRoZSBhbGxvY2F0ZWQgYmxvY2sgdXNpbmcKPiA+IGtzaXplKCkgYW5kIGV4cGFu
ZCBvdXIgdmFyaWFibGUgc2l6ZSByZXNlcnZhdGlvbl9saXN0IHRvIHRha2UgYWR2YW50YWdlCj4g
PiBvZiB0aGF0IGV4dHJhIHNwYWNlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IENjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRh
ZW56ZXJAYW1kLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+IAo+IEJUVzogSSB3YXMgd29uZGVyaW5nIGlmIHdlIHNob3Vs
ZG4ndCByZXBsYWNlIHRoZSByZXNlcnZhdGlvbl9vYmplY3RfbGlzdCAKPiB3aXRoIGEgZG1hX2Zl
bmNlX2NoYWluLgoKSSB0aG91Z2h0IHRoZSBkbWFfZmVuY2VfY2hhaW4gdHJhY2tlZCBwb2ludHMg
KG5hdHVyYWxseSBvcmRlcmVkKSBhbG9uZyBhCnNpbmdlIHRpbWVsaW5lLCB3aGVyZWFzIHRoZSBy
ZXNlcnZhdGlvbiBsaXN0IHRyYWNrZWQgcGFyYWxsZWwgdGltZWxpbmVzLgpTZWVtcyBsaWtlIGEg
c2VtYW50aWMgbWlzbWF0Y2g/CgooTWFraW5nIGxvb2t1cCBzbG93ZXIgd291bGQgbm90IGJlIHBs
ZWFzYW50LCB0YmgsIGJvdGggd2FpdGluZyBvbiBhbmQKdXBkYXRpbmcgYXJlIGFuIGlzc3VlIHdp
dGggdGhlIHNldmVyZSBhbW91bnQgb2YgcmVzZXJ2YXRpb25fb2JqZWN0cyB3ZQpjdXJyZW50bHkg
cHJvY2VzcyBwZXIgZXhlY2J1Zi4pCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
