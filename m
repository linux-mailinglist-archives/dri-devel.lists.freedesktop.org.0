Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DD148644
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 14:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082572AA3;
	Fri, 24 Jan 2020 13:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1416E394;
 Fri, 24 Jan 2020 13:40:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19995659-1500050 for multiple; Fri, 24 Jan 2020 13:40:34 +0000
MIME-Version: 1.0
To: =?utf-8?q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <38d3a0bf-4dfa-c8e4-c429-8c95854a9b8c@shipmail.org>
References: <20200124125627.125042-2-chris@chris-wilson.co.uk>
 <20200124130107.125404-1-chris@chris-wilson.co.uk>
 <38d3a0bf-4dfa-c8e4-c429-8c95854a9b8c@shipmail.org>
Message-ID: <157987323212.2524.13837110059871754877@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm: Avoid drm_global_mutex for simple inc/dec of
 dev->open_count
Date: Fri, 24 Jan 2020 13:40:32 +0000
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSAoMjAyMC0wMS0yNCAxMzozNzo0NykK
PiBPbiAxLzI0LzIwIDI6MDEgUE0sIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFNpbmNlIGRybV9n
bG9iYWxfbXV0ZXggaXMgYSB0cnVlIGdsb2JhbCBtdXRleCBhY3Jvc3MgZGV2aWNlcywgd2UgZG9u
J3QKPiA+IHdhbnQgdG8gYWNxdWlyZSBpdCB1bmxlc3MgYWJzb2x1dGVseSBuZWNlc3NhcnkuIEZv
ciBtYWludGFpbmluZyB0aGUKPiA+IGRldmljZSBsb2NhbCBvcGVuX2NvdW50LCB3ZSBjYW4gdXNl
IGF0b21pYyBvcGVyYXRpb25zIG9uIHRoZSBjb3VudGVyCj4gPiBpdHNlbGYsIGV4Y2VwdCB3aGVu
IG1ha2luZyB0aGUgdHJhbnNpdGlvbiB0by9mcm9tIDAuIEhlcmUsIHdlIHRhY2tsZSB0aGUKPiA+
IGVhc3kgcG9ydGlvbiBvZiBkZWxheWluZyBhY3F1aXJpbmcgdGhlIGRybV9nbG9iYWxfbXV0ZXgg
Zm9yIHRoZSBmaW5hbAo+ID4gcmVsZWFzZSBieSB1c2luZyBhdG9taWNfZGVjX2FuZF9tdXRleF9s
b2NrKCksIGxlYXZpbmcgdGhlIGdsb2JhbAo+ID4gc2VyaWFsaXNhdGlvbiBhY3Jvc3MgdGhlIGRl
dmljZSBvcGVucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KPiA+IENjOiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSA8dGhv
bWFzX29zQHNoaXBtYWlsLm9yZz4KPiAKPiBGb3IgdGhlIHNlcmllczoKPiAKPiBSZXZpZXdlZC1i
eTogVGhvbWFzIEhlbGxzdHLDtm0gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiAKPiBOb3cgdGhl
IG9ubHkgcmVtYWluaW5nICh0aG91Z2ggcHJlLWV4aXN0aW5nKSBwcm9ibGVtIEkgY2FuIHNlZSBp
cyB0aGF0IAo+IHRoZXJlIGlzIG5vIGNvcnJlc3BvbmRpbmcgbXV0ZXggbG9jayBpbiBkcm1fb3Bl
bigpIHNvIHRoYXQgZmlyc3RvcGVuIAo+IG1pZ2h0IHJhY2Ugd2l0aCBsYXN0Y2xvc2UuLiBPciBJ
IG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLi4KCmlpcmMsIGl0J3MgYSBjb21wbGljYXRlZCBk
YW5jZSB3aGVyZSBpdCBnb2VzIHRocm91Z2ggZHJtX3N0dWJfb3BlbigpCmZpcnN0IHdoaWNoIGFj
cXVpcmVzIHRoZSBkcm1fZ2xvYmFsX211dGV4LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
