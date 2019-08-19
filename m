Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE6294B67
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 19:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB926E247;
	Mon, 19 Aug 2019 17:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBEE6E23D;
 Mon, 19 Aug 2019 17:12:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18192520-1500050 for multiple; Mon, 19 Aug 2019 18:12:45 +0100
MIME-Version: 1.0
To: dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190819095928.32091-1-chris@chris-wilson.co.uk>
References: <20190819095928.32091-1-chris@chris-wilson.co.uk>
Message-ID: <156623476260.1374.15627076469393909439@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 1/3] dma-buf: Introduce selftesting framework
Date: Mon, 19 Aug 2019 18:12:42 +0100
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMTkgMTA6NTk6MjYpCj4gSW4gbGlnaHQgb2Yg
cmVjZW50IHJldmlldyBzbGlwIHVwcywgdGhlIGFic2VuY2Ugb2YgYSBzdWl0ZSBvZiB0ZXN0cyBm
b3IKPiBkbWEtYnVmIGJlY2FtZSBhcHBhcmVudC4gR2l2ZW4gdGhlIGN1cnJlbnQgcGxldGhvcmEg
b2YgdGVzdGluZwo+IGZyYW1ld29ya3MsIG9wdCBmb3Igb25lIGFscmVhZHkgaW4gdXNlIGJ5IElu
dGVsJ3MgQ0kgYW5kIHNvIGFsbG93IGVhc3kKPiBob29rIHVwIGludG8gaWd0Lgo+IAo+IFdlIGlu
dHJvZHVjZSBhIG5ldyBtb2R1bGUgdGhhdCB3aGVuIGxvYWRlZCB3aWxsIGV4ZWN1dGUgdGhlIGxp
c3Qgb2YKPiBzZWxmdGVzdHMgYW5kIHRoZWlyIHN1YnRlc3QuIFRoZSBuYW1lcyBvZiB0aGUgc2Vs
ZnRlc3RzIGFyZSBwdXQgaW50byB0aGUKPiBtb2RpbmZvIGFzIHBhcmFtZXRlcnMgc28gdGhhdCBp
Z3QgY2FuIGlkZW50aWZ5IGVhY2gsIGFuZCBydW4gdGhlbQo+IGluZGVwZW5kZW50bHksIHByaW5j
aXBhbGx5IGZvciBlYXNlIG9mIGVycm9yIHJlcG9ydGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogVG9taSBTYXJ2ZWxhIDx0b21pLnAuc2Fy
dmVsYUBpbnRlbC5jb20+CgpBcyBhIHNlcGFyYXRlIG1vZHVsZSB3aXRoIG5vIGV4cG9ydHMsIEkg
ZmVlbCBjb25maWRlbnQgaW4gcHVzaGluZyB0aGlzCndpdGggb25seSBEYW5pZWwncyBpcmMgYWNr
LiBBcyBzb29uIGFzIGl0IGlzIGNvdXBsZWQgdXAgdG8gQ0ksIHdlIGNhbgpzdGFydCBiZWF0aW5n
IG9uIGl0IGFuZCBwcm92aWRlIGZlZWRiYWNrIGZvciBkbWEtZmVuY2UtKiAvIGRtYS1yZXN2CnNl
bGZ0ZXN0cyBhcyB0aGV5IGFyZSBzdWJtaXR0ZWQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
