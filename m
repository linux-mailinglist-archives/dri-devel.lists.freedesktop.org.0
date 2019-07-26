Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0702760F4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 10:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBB96E8A3;
	Fri, 26 Jul 2019 08:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48B16E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:37:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17620769-1500050 for multiple; Fri, 26 Jul 2019 09:37:08 +0100
MIME-Version: 1.0
To: Chenbo Feng <fengc@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190613223408.139221-3-fengc@google.com>
References: <20190613223408.139221-1-fengc@google.com>
 <20190613223408.139221-3-fengc@google.com>
Message-ID: <156413022619.30723.12163288418173479775@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v5 2/3] dma-buf: add DMA_BUF_SET_NAME ioctls
Date: Fri, 26 Jul 2019 09:37:06 +0100
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaGVuYm8gRmVuZyAoMjAxOS0wNi0xMyAyMzozNDowNykKPiBGcm9tOiBHcmVnIEhh
Y2ttYW5uIDxnaGFja21hbm5AZ29vZ2xlLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgY29tcGxp
bWVudGFyeSBETUFfQlVGX1NFVF9OQU1FICBpb2N0bHMsIHdoaWNoIGxldHMKPiB1c2Vyc3BhY2Ug
cHJvY2Vzc2VzIGF0dGFjaCBhIGZyZWUtZm9ybSBuYW1lIHRvIGVhY2ggYnVmZmVyLgo+IAo+IFRo
aXMgaW5mb3JtYXRpb24gY2FuIGJlIGV4dHJlbWVseSBoZWxwZnVsIGZvciB0cmFja2luZyBhbmQg
YWNjb3VudGluZwo+IHNoYXJlZCBidWZmZXJzLiAgRm9yIGV4YW1wbGUsIG9uIEFuZHJvaWQsIHdl
IGtub3cgd2hhdCBlYWNoIGJ1ZmZlciB3aWxsCj4gYmUgdXNlZCBmb3IgYXQgYWxsb2NhdGlvbiB0
aW1lOiBHTCwgbXVsdGltZWRpYSwgY2FtZXJhLCBldGMuICBUaGUKPiB1c2Vyc3BhY2UgYWxsb2Nh
dG9yIGNhbiB1c2UgRE1BX0JVRl9TRVRfTkFNRSB0byBhc3NvY2lhdGUgdGhhdAo+IGluZm9ybWF0
aW9uIHdpdGggdGhlIGJ1ZmZlciwgc28gd2UgY2FuIGxhdGVyIGdpdmUgZGV2ZWxvcGVycyBhCj4g
YnJlYWtkb3duIG9mIGhvdyBtdWNoIG1lbW9yeSB0aGV5J3JlIGFsbG9jYXRpbmcgZm9yIGdyYXBo
aWNzLCBjYW1lcmEsCj4gZXRjLgoKVGhlIG5hbWUgd2FzIG5ldmVyIGZyZWVkLi4uCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
YwppbmRleCBkNTY5OTMyMzg1MDEuLjAxMDZiOTZkYTU4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCkBAIC0xMDQs
NiArMTA0LDggQEAgc3RhdGljIGludCBkbWFfYnVmX3JlbGVhc2Uoc3RydWN0IGlub2RlICppbm9k
ZSwgc3RydWN0IGZpbGUgKmZpbGUpCiAgICAgICAgbGlzdF9kZWwoJmRtYWJ1Zi0+bGlzdF9ub2Rl
KTsKICAgICAgICBtdXRleF91bmxvY2soJmRiX2xpc3QubG9jayk7CgorICAgICAgIGtmcmVlKGRt
YWJ1Zi0+bmFtZSk7CisKICAgICAgICBpZiAoZG1hYnVmLT5yZXN2ID09IChzdHJ1Y3QgcmVzZXJ2
YXRpb25fb2JqZWN0ICopJmRtYWJ1ZlsxXSkKICAgICAgICAgICAgICAgIHJlc2VydmF0aW9uX29i
amVjdF9maW5pKGRtYWJ1Zi0+cmVzdik7CgpUaGlzIHRydXN0cyB0aGF0IGFjY2VzcyB0byB0aGUg
bmFtZSB2aWEgdGhlIGZzIGlzIHNlcmlhbGlzZWQgYnkgdGhlCnJlZmNvdW50LgoKSXQgd291bGQg
aGF2ZSBiZWVuIGdyZWF0IGlmIHRoZSBpbm9kZSB3b3VsZCBvbmx5IGJlIGFsbG9jYXRlZCBmb3Ig
YQpuYW1lZCBkbWFidWYsIGJ1dCBJIGV4cGVjdCB0aGF0IHJlcXVpcmVzIHJlcGxhY2luZyBzdHJ1
Y3QgZmlsZSBhZnRlciBpdAppcyBleHBvc2VkIChidXQgbWF5YmUgYSBzdHJ1Y3QgZmlsZSBjYW4g
YmUgbW92ZWQgYmV0d2VlbiBmcz8pLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
