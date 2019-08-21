Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA29853F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8DD6EA0A;
	Wed, 21 Aug 2019 20:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1606E9A0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:11:44 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18219228-1500050 for multiple; Wed, 21 Aug 2019 21:11:33 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
Message-ID: <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
Subject: Re: [RFC] replacing dma_resv API
Date: Wed, 21 Aug 2019 21:11:31 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMxOjM3KQo+IEhpIGV2ZXJ5
b25lLAo+IAo+IEluIHByZXZpb3VzIGRpc2N1c3Npb24gaXQgc3VyZmFjZWQgdGhhdCBkaWZmZXJl
bnQgZHJpdmVycyB1c2UgdGhlIHNoYXJlZCBhbmQgZXhwbGljaXQgZmVuY2VzIGluIHRoZSBkbWFf
cmVzdiBvYmplY3Qgd2l0aCBkaWZmZXJlbnQgbWVhbmluZ3MuCj4gCj4gVGhpcyBpcyBwcm9ibGVt
YXRpYyB3aGVuIHdlIHNoYXJlIGJ1ZmZlcnMgYmV0d2VlbiB0aG9zZSBkcml2ZXJzIGFuZCByZXF1
aXJlbWVudHMgZm9yIGltcGxpY2l0IGFuZCBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24gbGVhZGVk
IHRvIHF1aXRlIGEgbnVtYmVyIG9mIHdvcmthcm91bmRzIHJlbGF0ZWQgdG8gdGhpcy4KPiAKPiBT
byBJIHN0YXJ0ZWQgYW4gZWZmb3J0IHRvIGdldCBhbGwgZHJpdmVycyBiYWNrIHRvIGEgY29tbW9u
IHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCB0aGUgZmVuY2VzIGluIHRoZSBkbWFfcmVzdiBvYmplY3Qg
bWVhbiBhbmQgYmUgYWJsZSB0byB1c2UgdGhlIG9iamVjdCBmb3IgZGlmZmVyZW50IGtpbmQgb2Yg
d29ya2xvYWRzIGluZGVwZW5kZW50IG9mIHRoZSBjbGFzc2ljIERSTSBjb21tYW5kIHN1Ym1pc3Np
b24gaW50ZXJmYWNlLgo+IAo+IFRoZSByZXN1bHQgaXMgdGhpcyBwYXRjaCBzZXQgd2hpY2ggbW9k
aWZpZXMgdGhlIGRtYV9yZXN2IEFQSSB0byBnZXQgYXdheSBmcm9tIGEgc2luZ2xlIGV4cGxpY2l0
IGZlbmNlIGFuZCBtdWx0aXBsZSBzaGFyZWQgZmVuY2VzLCB0b3dhcmRzIGEgbm90YXRpb24gd2hl
cmUgd2UgaGF2ZSBleHBsaWNpdCBjYXRlZ29yaWVzIGZvciB3cml0ZXJzLCByZWFkZXJzIGFuZCBv
dGhlcnMuCgpGd2l3LCBJIHdvdWxkIGxpa2UgdGhlIGRpc3RpbmN0aW9uIGhlcmUgYmV0d2VlbiBv
cHRpb25hbCBmZW5jZXMKKHdyaXRlcnMsIHJlYWRlcnMpIGFuZCBtYW5kYXRvcnkgZmVuY2VzIChv
dGhlcnMpLiBUaGUgb3B0aW9uYWwgZmVuY2VzCmFyZSB3aGVyZSB3ZSBwdXQgdGhlIGltcGxpY2l0
IGZlbmNlIHRyYWNraW5nIHRoYXQgY2xldmVyIHVzZXJzcGFjZSB3b3VsZApyYXRoZXIgYXZvaWQu
IFRoZSBtYW5kYXRvcnkgZmVuY2VzIChJIHdvdWxkIGNhbGwgaW50ZXJuYWwpIGlzIHdoZXJlIHdl
CnB1dCB0aGUgZmVuY2VzIGZvciB0cmFja2luZyBtaWdyYXRpb24gdGhhdCB1c2Vyc3BhY2UgY2Fu
IG5vdCBvcHQgb3V0IG9mLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
