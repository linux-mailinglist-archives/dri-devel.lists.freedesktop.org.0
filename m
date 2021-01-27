Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019A307125
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B906E964;
	Thu, 28 Jan 2021 08:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C89D6E875;
 Wed, 27 Jan 2021 19:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=NggY11F5bHVB0CVZTN9Izuj9i9PL4oNzJYxr25pZC5U=; b=1d/uim2qcNKJjsbEm8wQPYYxDe
 SW3voU4iz6FsunX1cxneyTpJAgV/GWgcok10V3tqGBcJOsvPXqKSGicVQE7vDVPBLJbV5twJxjbeg
 5K4PSP8TpVXTXNqqklJdX88chFXirI4rVCKnqFL3L3FTxZqzABvdKRWockevcU2lPH1FP6GSZQuXr
 KH3MYY9NNxtC3u8/YAyD+iz085tpMQ/FApCXPigaJ3oZYFblOLBLuLdk3zGCHT4RCf5rVyLIRB/8X
 f+dMYGO085FXjHVihDl9EBspZ71oFl8lyeXirqsn1e9dlN56rOjXUKRzErWlGfEkMQc7EBQ+5N0uU
 sSfj7bvg==;
Received: from [2601:1c0:6280:3f0::7650]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qWL-0001c0-Dg; Wed, 27 Jan 2021 19:30:29 +0000
Subject: Re: linux-next: Tree for Jan 27 (drm/i915)
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210128014419.55ea9ae4@canb.auug.org.au>
 <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
Message-ID: <669b3538-9edb-cb32-6746-10615d0500b0@infradead.org>
Date: Wed, 27 Jan 2021 11:30:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yNy8yMSAxMTowOCBBTSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDEvMjcvMjEgNjo0
NCBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPj4gSGkgYWxsLAo+Pgo+PiBOb3RlOiB0aGUg
cGF0Y2ggZmlsZSBoYXMgZmFpbGVkIHRvIHVwbG9hZCA6LSgKPj4KPj4gQ2hhbmdlcyBzaW5jZSAy
MDIxMDEyNToKPj4KPiAKPiBvbiB4ODZfNjQ6Cj4gCj4gLi4vZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9nZW0uYzogSW4gZnVuY3Rpb24g4oCYaTkxNV9nZW1fZnJlZXplX2xhdGXigJk6Cj4gLi4v
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYzoxMTgyOjI6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh3YmludmRfb25fYWxsX2NwdXPigJk7IGRpZCB5b3Ug
bWVhbiDigJh3cm1zcl9vbl9jcHVz4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KPiAgIHdiaW52ZF9vbl9hbGxfY3B1cygpOwo+IAoKTXkgYXBvbG9naWVzOiB0aGlz
IHdhcyBpbiBBbmRyZXcncyBtbW90bSAyMDIxLTAxLTI1LgpTb3JyeSBhYm91dCB0aGF0LgoKLS0g
Cn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
