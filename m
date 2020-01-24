Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799D148DE3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 19:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4A072B64;
	Fri, 24 Jan 2020 18:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5172B64;
 Fri, 24 Jan 2020 18:39:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19999650-1500050 for multiple; Fri, 24 Jan 2020 18:39:28 +0000
MIME-Version: 1.0
To: =?utf-8?q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <38d3a0bf-4dfa-c8e4-c429-8c95854a9b8c@shipmail.org>
References: <20200124125627.125042-2-chris@chris-wilson.co.uk>
 <20200124130107.125404-1-chris@chris-wilson.co.uk>
 <38d3a0bf-4dfa-c8e4-c429-8c95854a9b8c@shipmail.org>
Message-ID: <157989116639.2524.11400196809963426024@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm: Avoid drm_global_mutex for simple inc/dec of
 dev->open_count
Date: Fri, 24 Jan 2020 18:39:26 +0000
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
eTogVGhvbWFzIEhlbGxzdHLDtm0gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KCk5vdyBiZWluZyBv
cHQtaW4sIGl0IGlzIGZhaXJseSBsaW1pdGVkIGluIHNjb3BlIGFuZCB3aWxsIG5vdCByYW5kb21s
eQpicmVhayBvdGhlcnMgKHRvdWNoIHdvb2QpIGFuZCB0aGUgY2xvc2UoKSByYWNpbmcgaW4gQkFU
IGRpZG4ndCB0aHJvdwphbnl0aGluZyB1cCwgc28gcHVzaGVkIHRvIGRybS1taXNjLW5leHQuIFRo
YW5rcyBmb3IgdGhlIHJldmlldyBhbmQKc3VnZ2VzdGlvbnMsCgpOZXh0IHRhc2sgaXMgdG8gc3Vn
Z2VzdCBvdGhlcnMgbWlnaHQgbGlrZSB0byB1c2UgaXQgYXMgd2VsbC4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
