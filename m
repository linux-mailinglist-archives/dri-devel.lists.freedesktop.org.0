Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FE8DF34
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 22:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F96D6E83E;
	Wed, 14 Aug 2019 20:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2566E83E;
 Wed, 14 Aug 2019 20:45:59 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B1AC216F4;
 Wed, 14 Aug 2019 20:45:58 +0000 (UTC)
Date: Wed, 14 Aug 2019 13:45:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-Id: <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
In-Reply-To: <20190814202027.18735-3-daniel.vetter@ffwll.ch>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565815559;
 bh=EZBLwiP0N1eStQ84ag5nDU6Qw/MvJKG//W915vWDF64=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C8M74AF9gR0yIHtwYXvV9mYooDdtRaEbsAeu6xdcjm7MiFRBUgOgksIa9IbyRynX1
 8CovqClt4Zok7omZXMvrQ3krCm6iGcZ0/itlgYZhj1RoQID2VjQjF4gGY4TQptnckQ
 TYHTpL4yrQVOBgTIBym0nVj3v8+ixtaD2yCXXF1c=
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r?= =?ISO-8859-1?Q?=F4me?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNCBBdWcgMjAxOSAyMjoyMDoyNCArMDIwMCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gSW4gc29tZSBzcGVjaWFsIGNhc2VzIHdlIG11c3Qg
bm90IGJsb2NrLCBidXQgdGhlcmUncyBub3QgYQo+IHNwaW5sb2NrLCBwcmVlbXB0LW9mZiwgaXJx
cy1vZmYgb3Igc2ltaWxhciBjcml0aWNhbCBzZWN0aW9uIGFscmVhZHkKPiB0aGF0IGFybXMgdGhl
IG1pZ2h0X3NsZWVwKCkgZGVidWcgY2hlY2tzLiBBZGQgYSBub25fYmxvY2tfc3RhcnQvZW5kKCkK
PiBwYWlyIHRvIGFubm90YXRlIHRoZXNlLgo+IAo+IFRoaXMgd2lsbCBiZSB1c2VkIGluIHRoZSBv
b20gcGF0aHMgb2YgbW11LW5vdGlmaWVycywgd2hlcmUgYmxvY2tpbmcgaXMKPiBub3QgYWxsb3dl
ZCB0byBtYWtlIHN1cmUgdGhlcmUncyBmb3J3YXJkIHByb2dyZXNzLiBRdW90aW5nIE1pY2hhbDoK
PiAKPiAiVGhlIG5vdGlmaWVyIGlzIGNhbGxlZCBmcm9tIHF1aXRlIGEgcmVzdHJpY3RlZCBjb250
ZXh0IC0gb29tX3JlYXBlciAtCj4gd2hpY2ggc2hvdWxkbid0IGRlcGVuZCBvbiBhbnkgbG9ja3Mg
b3Igc2xlZXBhYmxlIGNvbmRpdGlvbmFscy4gVGhlIGNvZGUKPiBzaG91bGQgYmUgc3dpZnQgYXMg
d2VsbCBidXQgd2UgbW9zdGx5IGRvIGNhcmUgYWJvdXQgaXQgdG8gbWFrZSBhIGZvcndhcmQKPiBw
cm9ncmVzcy4gQ2hlY2tpbmcgZm9yIHNsZWVwYWJsZSBjb250ZXh0IGlzIHRoZSBiZXN0IHRoaW5n
IHdlIGNvdWxkIGNvbWUKPiB1cCB3aXRoIHRoYXQgd291bGQgZGVzY3JpYmUgdGhlc2UgZGVtYW5k
cyBhdCBsZWFzdCBwYXJ0aWFsbHkuIgo+IAo+IFBldGVyIGFsc28gYXNrZWQgd2hldGhlciB3ZSB3
YW50IHRvIGNhdGNoIHNwaW5sb2NrcyBvbiB0b3AsIGJ1dCBNaWNoYWwKPiBzYWlkIHRob3NlIGFy
ZSBsZXNzIG9mIGEgcHJvYmxlbSBiZWNhdXNlIHNwaW5sb2NrcyBjYW4ndCBoYXZlIGFuCj4gaW5k
aXJlY3QgZGVwZW5kZW5jeSB1cG9uIHRoZSBwYWdlIGFsbG9jYXRvciBhbmQgaGVuY2UgY2xvc2Ug
dGhlIGxvb3AKPiB3aXRoIHRoZSBvb20gcmVhcGVyLgoKSSBjb250aW51ZSB0byBzdHJ1Z2dsZSB3
aXRoIHRoaXMuICBJdCBpbnRyb2R1Y2VzIGEgbmV3IGtlcm5lbCBzdGF0ZQoicnVubmluZyBwcmVl
bXB0aWJseSBidXQgbXVzdCBub3QgY2FsbCBzY2hlZHVsZSgpIi4gIEhvdyBkb2VzIHRoaXMgbWFr
ZQphbnkgc2Vuc2U/CgpQZXJoYXBzIGEgbXVjaCwgbXVjaCBtb3JlIGRldGFpbGVkIGRlc2NyaXB0
aW9uIG9mIHRoZSBvb21fcmVhcGVyCnNpdHVhdGlvbiB3b3VsZCBoZWxwIG91dC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
