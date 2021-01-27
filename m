Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991003070EE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D7C6E915;
	Thu, 28 Jan 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD896E87F;
 Wed, 27 Jan 2021 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=oFMbfuupF5qnB6YTbe/PlxR6DkqFHEEIW3wA0kAnXxI=; b=PQBxaynT0BJWv5gytOuGpVJDT1
 3JmD3UKXDVX3nNpKMwai16T/7ilnMOqA9kku85adI7ExX/hFPL8h5KHrQYV7UCwpPQBVZxsr6vAEu
 DVsgzUHEl+lPoUXwSRMzRCESj4bObvGfyzq7f7ADi9Y8Wk2CP6W8ymRzX2G7x6vWhsupcyceFNjtU
 9O8R7YAGvy4+jZkfl/1RXhxTxd7GKciAlR9aggEGFm9So3xmaDEXAbSJB0R9QGuWZS3daFBIO3Pq3
 RLMA4j0A/D1V+WosHG7DAiyJpGV6guU0jDnxv1FOtJaTfQwMcQZFMfuNSLUS8X1WQDWJMtFf+MEMi
 9X+sSjQA==;
Received: from [2601:1c0:6280:3f0::7650]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rQB-0001ol-Aw; Wed, 27 Jan 2021 20:28:11 +0000
Subject: Re: linux-next: Tree for Jan 27 (drm/i915)
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210128014419.55ea9ae4@canb.auug.org.au>
 <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
 <669b3538-9edb-cb32-6746-10615d0500b0@infradead.org>
Message-ID: <1f5cc867-27a4-946c-8f53-916f677cafe9@infradead.org>
Date: Wed, 27 Jan 2021 12:28:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <669b3538-9edb-cb32-6746-10615d0500b0@infradead.org>
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

T24gMS8yNy8yMSAxMTozMCBBTSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDEvMjcvMjEgMTE6
MDggQU0sIFJhbmR5IER1bmxhcCB3cm90ZToKPj4gT24gMS8yNy8yMSA2OjQ0IEFNLCBTdGVwaGVu
IFJvdGh3ZWxsIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IE5vdGU6IHRoZSBwYXRjaCBmaWxl
IGhhcyBmYWlsZWQgdG8gdXBsb2FkIDotKAo+Pj4KPj4+IENoYW5nZXMgc2luY2UgMjAyMTAxMjU6
Cj4+Pgo+Pgo+PiBvbiB4ODZfNjQ6Cj4+Cj4+IC4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
Z2VtLmM6IEluIGZ1bmN0aW9uIOKAmGk5MTVfZ2VtX2ZyZWV6ZV9sYXRl4oCZOgo+PiAuLi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jOjExODI6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHdiaW52ZF9vbl9hbGxfY3B1c+KAmTsgZGlkIHlvdSBtZWFu
IOKAmHdybXNyX29uX2NwdXPigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0
aW9uXQo+PiAgIHdiaW52ZF9vbl9hbGxfY3B1cygpOwo+Pgo+IAo+IE15IGFwb2xvZ2llczogdGhp
cyB3YXMgaW4gQW5kcmV3J3MgbW1vdG0gMjAyMS0wMS0yNS4KPiBTb3JyeSBhYm91dCB0aGF0LgoK
CmFuZCBub3cgSSBzZWUgdGhhdCBpdCBhbHNvIGhhcHBlbnMgaW4gdG9kYXkncyBsaW51eC1uZXh0
LgoKLS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
