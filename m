Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECACB8F3D8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 20:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC296EA38;
	Thu, 15 Aug 2019 18:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3E6EA38;
 Thu, 15 Aug 2019 18:46:08 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18155654-1500050 for multiple; Thu, 15 Aug 2019 19:45:58 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190814172053.GM7444@phenom.ffwll.local>
References: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
 <20190811091523.9382-1-chris@chris-wilson.co.uk>
 <20190814172053.GM7444@phenom.ffwll.local>
Message-ID: <156589475684.11610.4915544599007801229@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Date: Thu, 15 Aug 2019 19:45:56 +0100
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
Cc: intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE0IDE4OjIwOjUzKQo+IE9uIFN1biwgQXVn
IDExLCAyMDE5IGF0IDEwOjE1OjIzQU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IE5v
dyB0aGF0IGRtYV9mZW5jZV9zaWduYWwgYWx3YXlzIHRha2VzIHRoZSBzcGlubG9jayB0byBmbHVz
aCB0aGUKPiA+IGNiX2xpc3QsIHNpbXBseSB0YWtlIHRoZSBzcGlubG9jayBhbmQgY2FsbCBkbWFf
ZmVuY2Vfc2lnbmFsX2xvY2tlZCgpIHRvCj4gPiBhdm9pZCBjb2RlIHJlcGV0aXRpb24uCj4gPiAK
PiA+IFN1Z2dlc3RlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IAo+IEhtLCBJIHRoaW5rIHRoaXMgbGFyZ2VseSBkZWZlYXRzIHRoZSBwb2ludCBvZiBoYXZp
bmcgdGhlIGxvY2tsZXNzIHNpZ25hbAo+IGVuYWJsaW5nIHRyaWNrZXJ5IGluIGRtYV9mZW5jZS4g
TWF5YmUgdGhhdCBwYXJ0IGlzbid0IG5lZWRlZCBieSBhbnlvbmUsCj4gYnV0IGZlZWxzIGxpa2Ug
YSB0aGluZyB0aGF0IG5lZWRzIGEgbm90Y2ggbW9yZSB0aG91Z2h0LiBBbmQgaWYgd2UgbmVlZCBp
dCwKPiBtYXliZSBhIGJpdCBtb3JlIGNsZWFudXAuCgpZb3UgbWVhbiBkbWFfZmVuY2VfZW5hYmxl
X3N3X3NpZ25hbGluZygpLiBUaGUgb25seSB1c2VyIGFwcGVhcnMgdG8gYmUgdG8KZmx1c2ggZmVu
Y2VzLCB3aGljaCBpcyBhY3R1YWxseSB0aGUgaW50ZW50IG9mIGFsd2F5cyBub3RpZnlpbmcgdGhl
IHNpZ25hbApjYi4gQnkgYWx3YXlzIGRvaW5nIHRoZSBjYWxsYmFja3MsIHdlIGNhbiBhdm9pZCBp
bnN0YWxsaW5nIHRoZSBpbnRlcnJ1cHQKYW5kIGNvbXBsZXRlbHkgc2F0dXJhdGluZyBDUFVzIHdp
dGggaXJxcywgaW5zdGVhZCBkb2luZyBhIGJhdGNoIGluIGEKbGVpc3VyZWx5IHRpbWVyIGNhbGxi
YWNrIGlmIG5vdCBmbHVzaGVkIG5hdHVyYWxseS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
