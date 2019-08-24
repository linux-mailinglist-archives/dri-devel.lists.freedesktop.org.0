Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9359C6A8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA8A6E14A;
	Mon, 26 Aug 2019 00:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBBE89F55
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 15:34:54 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1i1Y3y-00048Y-Gc; Sat, 24 Aug 2019 15:34:46 +0000
Date: Sat, 24 Aug 2019 08:34:46 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 2/2] fbdev: fbmem: allow overriding the number of bootup
 logos
Message-ID: <20190824153446.GB28002@bombadil.infradead.org>
References: <20190823084725.4271-1-peda@axentia.se>
 <20190823084725.4271-3-peda@axentia.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823084725.4271-3-peda@axentia.se>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W1bsgj1Sca3htwVdYIWXqEWmqM9LY1dN32Kg3V5BUGw=; b=pVH267jYHrY9C0dLkasvLQUnv
 XRUmXAshW9tv13hBRLy6H/LTmuONxFCE1hCZ7p0i6yViURRqo1N1o/+7MCuRv79mXq0MXoJMxo31y
 emLqD40QOZAgz/bhxWHJN8Fp1B/S5AkjLnLQo0mpSHgzfKfTASJruuOTG0q9z7HWlqmn6YB1iHq6s
 ZBcRwJ2QjQ1ZWnOAeKpRof+T3azgnSHinCmKikmWMjJK/NgvkObBUBilSHC0OtoIV8UeWh+Lp/caq
 9yxJLeTNvkDCfA8LzBRE7YeJ06G8VItQoaUth8bBNK39VMuZRr6YwuQx/q7mC5kz2WFK7BzVS4e+V
 bWcJxPprw==;
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDg6NDc6NDdBTSArMDAwMCwgUGV0ZXIgUm9zaW4gd3Jv
dGU6Cj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKPiArKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwo+IEBAIC01Niw2ICs1Niw5IEBAIEVYUE9SVF9T
WU1CT0wobnVtX3JlZ2lzdGVyZWRfZmIpOwo+ICBib29sIGZiX2NlbnRlcl9sb2dvIF9fcmVhZF9t
b3N0bHk7Cj4gIEVYUE9SVF9TWU1CT0woZmJfY2VudGVyX2xvZ28pOwo+ICAKPiArdW5zaWduZWQg
aW50IGZiX2xvZ29fY291bnQgX19yZWFkX21vc3RseTsKPiArRVhQT1JUX1NZTUJPTChmYl9sb2dv
X2NvdW50KTsKCldoeSBkb2VzIHRoaXMgc3ltYm9sIG5lZWQgdG8gYmUgZXhwb3J0ZWQ/ICBBcyBJ
IHJlYWQgdGhlIE1ha2VmaWxlLCBmYmNvbgphbmQgZmJtZW0gYXJlIGNvbWJpbmVkIGludG8gdGhl
IHNhbWUgbW9kdWxlLCBzbyB3aGlsZSB0aGUgc3ltYm9sIG5lZWRzCnRvIGJlIG5vbi1zdGF0aWMs
IGl0IGRvZXNuJ3QgbmVlZCB0byBiZSBleHBvcnRlZCB0byBvdGhlciBtb2R1bGVzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
