Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9C7C42E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482A289DB9;
	Wed, 31 Jul 2019 13:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24EF89DB7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:58:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17760809-1500050 for multiple; Wed, 31 Jul 2019 14:58:09 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190731113853.51779-1-christian.koenig@amd.com>
 <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
 <6421ea80-2bdd-7f63-1cba-9c57157f3946@gmail.com>
In-Reply-To: <6421ea80-2bdd-7f63-1cba-9c57157f3946@gmail.com>
Message-ID: <156458148806.15787.4157473890441039515@skylake-alporthouse-com>
Subject: Re: [PATCH] dma-buf: add more reservation object locking wrappers
Date: Wed, 31 Jul 2019 14:58:08 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA3LTMxIDE0OjM0OjI4KQo+IEFtIDMxLjA3
LjE5IHVtIDE0OjMzIHNjaHJpZWIgQ2hyaXMgV2lsc29uOgo+ID4gUXVvdGluZyBDaHJpc3RpYW4g
S8O2bmlnICgyMDE5LTA3LTMxIDEyOjM4OjUzKQo+ID4+IENvbXBsZXRlIHRoZSBhYnN0cmFjdGlv
biBvZiB0aGUgd3dfbXV0ZXggaW5zaWRlIHRoZSByZXNlcnZhdGlvbiBvYmplY3QuCj4gPj4KPiA+
PiBUaGlzIGFsbG93cyB1cyB0byBhZGQgbW9yZSBoYW5kbGluZyBhbmQgZGVidWdnaW5nIHRvIHRo
ZSByZXNlcnZhdGlvbgo+ID4+IG9iamVjdCBpbiB0aGUgZnV0dXJlLgo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4g
TG9va3MgZW50aXJlbHkgbWVjaGFuaWNhbCwKPiA+IFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+Cj4gPiBRdWlldGx5IG9waW5lcyBmb3Igcy9y
ZXNlcnZhdGlvbl9vYmplY3QvZG1hX3Jlc2VydmF0aW9uLwo+IAo+IEkgd2FzIHRoaW5raW5nIGFi
b3V0IHRoYXQgYXMgd2VsbCBiZWNhdXNlICJyZXNlcnZhdGlvbl9vYmplY3QiIGlzIGp1c3QgYSAK
PiByYXRoZXIgbG9uZyBuYW1lIGFuZCBub3QgdmVyeSBkZXNjcmlwdGl2ZS4KPiAKPiBCdXQgSSdt
IG5vdCBzdXJlIGlmIGRtYV9yZXNlcnZhdGlvbiBmaXRzIGVpdGhlci4gSG93IGFib3V0IHNvbWV0
aGluZyAKPiBsaWtlIGRtYV9jbnRybD8KClJlc2VydmF0aW9uIGtpbmQgb2Ygd29ya3MgYmVjYXVz
ZSBvZiBoaXN0b3JpY2FsIHVzYWdlLCBidXQgaXMgaXRzZWxmCnJhdGhlciBsb25nLiBDb250cm9s
IGRvZXNuJ3QgbWVhbiBtdWNoIHRvIG1lLiBkbWFfc2VxdWVuY2U/IE1heWJlIGp1c3QKZG1hX3N5
bmNwdCwgYXMgdGhlIHNuYXBzaG90IG9mIGZlbmNlcyBpcyBpdHNlbGYgYSBmZW5jZSAvCnN5bmNo
cm9uaXNhdGlvbiBwb2ludC4gVGhvdWdoIHRoYXQgaXMgYXQgb2RkcyB3aXRoIG90aGVyIHVzYWdl
IG9mCnN5bmNwdCwgd2UgaGF2ZSBhbiB1bm9yZGVyZWQgY29sbGVjdGlvbiBvZiBmZW5jZXMgYWNy
b3NzIG11bHRpcGxlCnRpbWVsaW5lcywgYXMgb3Bwb3NlZCB0byBhIHNpbmdsZSBwb2ludCBhbG9u
ZyBhIHRpbWVsaW5lLgoKRndpdywgd2UgdXNlIGk5MTVfYWN0aXZlIGZvciB0aGUgc2ltaWxhciBw
dXJwb3NlIG9mIHRyYWNraW5nIHRoZSBhY3RpdmUKY29sbGVjdGlvbiBvZiBmZW5jZXMsIHNvIG1h
eWJlIGRtYV9hY3RpdmU/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
