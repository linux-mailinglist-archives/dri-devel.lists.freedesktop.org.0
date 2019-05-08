Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148AA17934
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 14:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDE58989C;
	Wed,  8 May 2019 12:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660D8989C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 12:14:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16489852-1500050 for multiple; Wed, 08 May 2019 13:14:48 +0100
MIME-Version: 1.0
To: dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190508120542.28377-3-chris@chris-wilson.co.uk>
References: <20190508120542.28377-1-chris@chris-wilson.co.uk>
 <20190508120542.28377-3-chris@chris-wilson.co.uk>
Message-ID: <155731768628.28545.10421853197150719332@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] dma-fence: Refactor signaling for manual invocation
Date: Wed, 08 May 2019 13:14:46 +0100
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDUtMDggMTM6MDU6NDIpCj4gTW92ZSB0aGUgZHVw
bGljYXRlZCBjb2RlIHdpdGhpbiBkbWEtZmVuY2UuYyBpbnRvIHRoZSBoZWFkZXIgZm9yIHdpZGVy
Cj4gcmV1c2UuIEluIHRoZSBwcm9jZXNzIGFwcGx5IGEgc21hbGwgbWljcm8tb3B0aW1pc2F0aW9u
IHRvIG9ubHkgcHJ1bmUgdGhlCj4gZmVuY2UtPmNiX2xpc3Qgb25jZSByYXRoZXIgdGhhbiB1c2Ug
bGlzdF9kZWwgb24gZXZlcnkgZW50cnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpOb3QgeWV0IHItYiwganVzdCBUdnJ0a28gZ2F2
ZSBhIG5vZCBvZiBhcHByb3ZhbCB0aGF0IHRoaXMgd291bGQgYmUKc3VpdGFibGUgZGlzY3Vzc2lv
biBtYXRlcmlhbC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
