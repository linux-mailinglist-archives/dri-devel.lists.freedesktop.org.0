Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8849225284
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7C893B8;
	Tue, 21 May 2019 14:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808E4893B8;
 Tue, 21 May 2019 14:47:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED24FAF8E;
 Tue, 21 May 2019 14:47:14 +0000 (UTC)
Date: Tue, 21 May 2019 16:47:13 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH] kernel.h: Add non_block_start/end()
Message-ID: <20190521144713.GX32329@dhcp22.suse.cz>
References: <20190521100611.10089-1-daniel.vetter@ffwll.ch>
 <0100016adad909d8-e6c9c310-36e0-4bdd-80fd-5df1a1660041-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0100016adad909d8-e6c9c310-36e0-4bdd-80fd-5df1a1660041-000000@email.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDIxLTA1LTE5IDE0OjQzOjM4LCBDcmlzdG9waGVyIExhbWV0ZXIgd3JvdGU6Cj4gT24g
VHVlLCAyMSBNYXkgMjAxOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiAKPiA+IEluIHNvbWUgc3Bl
Y2lhbCBjYXNlcyB3ZSBtdXN0IG5vdCBibG9jaywgYnV0IHRoZXJlJ3Mgbm90IGEKPiA+IHNwaW5s
b2NrLCBwcmVlbXB0LW9mZiwgaXJxcy1vZmYgb3Igc2ltaWxhciBjcml0aWNhbCBzZWN0aW9uIGFs
cmVhZHkKPiA+IHRoYXQgYXJtcyB0aGUgbWlnaHRfc2xlZXAoKSBkZWJ1ZyBjaGVja3MuIEFkZCBh
IG5vbl9ibG9ja19zdGFydC9lbmQoKQo+ID4gcGFpciB0byBhbm5vdGF0ZSB0aGVzZS4KPiAKPiBK
dXN0IHB1dHRpbmcgcHJlZW1wdCBvbi9vZmYgYXJvdW5kIHRoZXNlIGlzIG5vdCBzdWZmaWNpZW50
PwoKSXQgaXMgbm90IGEgY3JpdGljYWwgc2VjdGlvbi4gSXQgaXMgYSBfZGVidWdnaW5nXyBmYWNp
bGl0eSB0byBoZWxwCmRpc2NvdmVyIGJsb2NraW5nIGNvbnRleHRzLgotLSAKTWljaGFsIEhvY2tv
ClNVU0UgTGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
