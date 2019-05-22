Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5E25E94
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 09:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED77C896FA;
	Wed, 22 May 2019 07:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16870896FA;
 Wed, 22 May 2019 07:14:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16636015-1500050 for multiple; Wed, 22 May 2019 08:13:59 +0100
MIME-Version: 1.0
To: Michal Hocko <mhocko@suse.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190522063442.GZ32329@dhcp22.suse.cz>
References: <20190521100611.10089-1-daniel.vetter@ffwll.ch>
 <3bab9909-b32a-8cc6-df38-5afc2e7bff69@I-love.SAKURA.ne.jp>
 <20190521105126.GP32329@dhcp22.suse.cz>
 <cb86e2b2-7717-0d48-1fca-eba6cb975e96@i-love.sakura.ne.jp>
 <20190521111151.GS32329@dhcp22.suse.cz>
 <765bdfea-915d-ee86-f885-59b11f4c54db@i-love.sakura.ne.jp>
 <20190521144404.GO21222@phenom.ffwll.local>
 <24951d83-9476-98a6-ee45-484d4de07a52@i-love.sakura.ne.jp>
 <20190522063442.GZ32329@dhcp22.suse.cz>
Message-ID: <155850923786.23981.16014278588706143879@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] kernel.h: Add non_block_start/end()
Date: Wed, 22 May 2019 08:13:57 +0100
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNaWNoYWwgSG9ja28gKDIwMTktMDUtMjIgMDc6MzQ6NDIpCj4gT24gV2VkIDIyLTA1
LTE5IDA2OjA2OjMxLCBUZXRzdW8gSGFuZGEgd3JvdGU6Cj4gWy4uLl0KPiA+IFNpbmNlIE9PTSBu
b3RpZmllciB3aWxsIGJlIGNhbGxlZCBhZnRlciBzaHJpbmtlcnMgYXJlIGF0dGVtcHRlZCwKPiA+
IGNhbiBpOTE1IG1vdmUgZnJvbSBPT00gbm90aWZpZXIgdG8gc2hyaW5rZXI/Cj4gCj4gVGhhdCB3
b3VsZCBiZSBpbmRlZWQgcHJlZmVyYWJsZS4gT09NIG5vdGlmaWVyIGlzIGFuIEFQSSBmcm9tIGhl
bGwuCgpXZSB3ZXJlXlcgYXJlIHN0aWxsIHRyeWluZyB0byBtYWtlIHRoZSBzaHJpbmtlciBub25i
bG9ja2luZyB0byBhdm9pZAppbmN1cnJpbmcgaG9ycmlibGUgbGF0ZW5jaWVzIGZvciBsaWdodCBk
aXJlY3QgcmVjbGFpbS4gVGhlIGNvbnNlcXVlbmNlCm9mIGF2b2lkaW5nIGhlYXZ5IHdvcmsgaW4g
dGhlIHNocmlua2VyIGlzIHRoYXQgd2UgbW92ZWQgaXQgdG8gdGhlIG9vbQpub3RpZmllciBhcyBi
ZWluZyB0aGUgbGFzdCBjaGFuY2Ugd2UgaGF2ZSB0byByZXR1cm4gYWxsIChjYW4gYmUgbGl0ZXJh
bGx5CmFsbCkgdGhlIHN5c3RlbSBtZW1vcnkuCgpUaGUgYWx0ZXJuYXRpdmUgdG8gdXNpbmcgYSBz
ZXBhcmF0ZSBvb20gbm90aWZpZXIgd291bGQgYmUgbW9yZQpyZWNsYWltL3Nocmlua2VyIHBoYXNl
cz8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
