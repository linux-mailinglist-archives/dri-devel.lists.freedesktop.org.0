Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9C9BFC1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 21:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A69C6E0E6;
	Sat, 24 Aug 2019 19:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A675A6E0E4;
 Sat, 24 Aug 2019 19:12:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18252578-1500050 for multiple; Sat, 24 Aug 2019 20:12:40 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1a7c7518-1efd-39d4-fee5-b7ac76c50de0@amd.com>
References: <20190824135848.8571-1-chris@chris-wilson.co.uk>
 <1a7c7518-1efd-39d4-fee5-b7ac76c50de0@amd.com>
Message-ID: <156667395882.2672.494047397841710215@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf: Give dma-fence-array distinct lockclasses
Date: Sat, 24 Aug 2019 20:12:38 +0100
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wOC0yNCAyMDowNDo0MykKPiBBbSAyNC4w
OC4xOSB1bSAxNTo1OCBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IEluIG9yZGVyIHRvIGFsbG93
IGRtYS1mZW5jZS1hcnJheSBhcyBhIGdlbmVyaWMgY29udGFpbmVyIGZvciBmZW5jZXMsIHdlCj4g
PiBuZWVkIHRvIGFsbG93IGZvciBpdCB0byBjb250YWluIG90aGVyIGRtYS1mZW5jZS1hcnJheXMu
IEJ5IGdpdmluZyBlYWNoCj4gPiBkbWEtZmVuY2UtYXJyYXkgY29uc3RydWN0aW9uIHRoZWlyIG93
biBsb2NrY2xhc3MsIHdlIGFsbG93IGRpZmZlcmVudAo+ID4gdHlwZXMgb2YgZG1hLWZlbmNlLWFy
cmF5IHRvIG5lc3QsIGJ1dCBzdGlsbCBkbyBub3QgYWxsb3cgb24gY2xhc3Mgb2YKPiA+IGRtYS1m
ZW5jZS1hcnJheSB0byBjb250YWluIGl0c2VsZiAoZXZlbiB0aG91Z2ggdGhleSBoYXZlIGRpc3Rp
bmN0Cj4gPiBsb2NrcykuCj4gPgo+ID4gSW4gcHJhY3RpY2UsIHRoaXMgbWVhbnMgdGhhdCBlYWNo
IHN1YnN5c3RlbSBnZXRzIGl0cyBvd24gZG1hLWZlbmNlLWFycmF5Cj4gPiBjbGFzcyBhbmQgd2Ug
Y2FuIGZyZWVseSB1c2UgZG1hLWZlbmNlLWFycmF5cyBhcyBjb250YWluZXJzIHdpdGhpbiB0aGUK
PiA+IGRtYWJ1ZiBjb3JlIHdpdGhvdXQgYW5nZXJpbmcgbG9ja2RlcC4KPiAKPiBJJ3ZlIGNvbnNp
ZGVyZWQgdGhpcyBmb3IgYXMgd2VsbC4gRS5nLiB0byB1c2UgdGhlIGRtYV9mZW5jZV9hcnJheSAK
PiBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFkIG9mIGNvbWluZyB1cCB3aXRoIHRoZSBkbWFfZmVuY2Vf
Y2hhaW4gY29udGFpbmVyLgo+IAo+IEJ1dCBhcyBpdCB0dXJuZWQgb3V0IHdoZW4gdXNlcnNwYWNl
IGNhbiBjb250cm9sIG5lc3RpbmcsIGl0IGlzIHRyaXZpYWwgCj4gdG8gY2hhaW4gZW5vdWdoIGRt
YV9mZW5jZV9hcnJheXMgdG9nZXRoZXIgdG8gY2F1c2UgYW4gaW4ga2VybmVsIHN0YWNrIAo+IG92
ZXJmbG93LiBXaGljaCBpbiB0dXJuIGNyZWF0ZXMgYSByZWFsbHkgbmljZSBhdHRhY2sgdmVjdG9y
Lgo+IAo+IFNvIGFzIGxvbmcgYXMgdXNlcnNwYWNlIGhhcyBjb250cm9sIG92ZXIgZG1hX2ZlbmNl
X2FycmF5IG5lc3RpbmcgdGhpcyBpcyAKPiBhIGNsZWFyIE5BSyBhbmQgYWN0dWFsbHkgZXh0cmVt
ZWx5IGRhbmdlcm91cy4KCllvdSBhcmUgcHJvcG9zaW5nIHRvIHVzZSByZWN1cnNpdmUgZG1hX2Zl
bmNlX2FycmF5IGNvbnRhaW5lcnMgZm9yCmRtYV9yZXN2Li4uCgo+IEl0IGFjdHVhbGx5IHRvb2sg
bWUgcXVpdGUgYSB3aGlsZSB0byBnZXQgdGhlIGRtYV9mZW5jZV9jaGFpbiBjb250YWluZXIgCj4g
cmVjdXJzaW9uIGxlc3MgdG8gYXZvaWQgc3R1ZmYgbGlrZSB0aGlzLgoKU3VyZSwgd2UndmUgYmVl
biBhdm9pZGluZyByZWN1cnNpb24gZm9yIHllYXJzLgotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
