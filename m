Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F78F5F5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 22:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EAD89C55;
	Thu, 15 Aug 2019 20:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E18889C3B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:49:44 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id a21so3261329oie.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgnLIsY3NAF2I8cARaxRotDmNV7GudD+acm8febioSE=;
 b=XHFlQXQH3SPNSRHto0MqOMOM4h+c6b/6zcSr5zoCG9JotP3ODznF/qO63G6sZ1VFDv
 gjmmhRJ1ZGOuGSPccHzBEyGyy3VlEFARnHx7kwV2OHox9LJOekkLTqH8Fs58MlPyrRMW
 mEPQg31QrfnFSYIs4BNgALUZp3fLEPdae2TulQDx3I+MzDiicJK3G73eakUXT+t3TYDY
 bmHuxwBZzBR32Wm/aLCjCub0m/ANXAVN7+LL5IwthcmZ70Ijf3pHkpjaRLNn8X4K3MLG
 baWBAwjcrjCVK63TyP9CzzRvBGbkXr9xHLIcC9DDRHVqyFxHPjCTpjux2dtANKJF3hIN
 M1kg==
X-Gm-Message-State: APjAAAXWVpV89FDJf3TRK5T9U2ylNGoGF58thrpkTQcECxRwJ83aK4bx
 gejKyZ2IACyl4GGV/FwcEOzaApGJRb1T9ubqW8bCAg==
X-Google-Smtp-Source: APXvYqwzZ/kApGN6PiSs4Jakj+3xLiJKsdwsUzoZ79QigfmdRjFBzCS/DYJGNsj8cG6QhlWGKnUS/ZCe5UFKl5trWe8=
X-Received: by 2002:aca:4994:: with SMTP id w142mr2705861oia.132.1565902183316; 
 Thu, 15 Aug 2019 13:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz> <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz> <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz> <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
In-Reply-To: <20190815202721.GV21596@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Aug 2019 22:49:31 +0200
Message-ID: <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lgnLIsY3NAF2I8cARaxRotDmNV7GudD+acm8febioSE=;
 b=YIJ7YIpMxznBPHgTdpSwquDHILTgLsnpo12EU8rkd+AHKFJZ5ZwqKoIwrRqaFSFR8y
 OSm/+kJt94YLyv2W7RB5Syzoulous/GPdyhQE4c6S/acM0xv4AIF2T1fqDaLkhBzGFIm
 8xguUk+swY546hiuNvL1kRCs6fhSMGv4cUMt8=
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MjcgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEwOjE2OjQzUE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBTbyBpZiBzb21lb25lIGNhbiBleHBsYWluIHRvIG1l
IGhvdyB0aGF0IHdvcmtzIHdpdGggbG9ja2RlcCBJIGNhbiBvZgo+ID4gY291cnNlIGltcGxlbWVu
dCBpdC4gQnV0IGFmYWljcyB0aGF0IGRvZXNuJ3QgZXhpc3QgKEkgdHJpZWQgdG8gZXhwbGFpbgo+
ID4gdGhhdCBzb21ld2hlcmUgZWxzZSBhbHJlYWR5KSwgYW5kIEknbSBubyByZWFsbHkgbG9va2lu
ZyBmb3J3YXJkIHRvCj4gPiBoYWNraW5nIGFsc28gb24gbG9ja2RlcCBmb3IgdGhpcyBsaXR0bGUg
c2VyaWVzLgo+Cj4gSG1tLCBraW5kIG9mIGxvb2tzIGxpa2UgaXQgaXMgZG9uZSBieSBjYWxsaW5n
IHByZWVtcHRfZGlzYWJsZSgpCgpZdXAuIFRoYXQgd2FzIHYxLCB0aGVuIGNhbWUgdGhlIHN1Z2dl
c3Rpb24gdGhhdCBkaXNhYmxpbmcgcHJlZW1wdGlvbgppcyBtYXliZSBub3QgdGhlIGJlc3QgdGhp
bmcgKHRoZSBvb20gcmVhcGVyIGNvdWxkIHN0aWxsIHJ1biBmb3IgYSBsb25nCnRpbWUgY29tcGFy
YXRpdmVseSwgaWYgaXQncyBjbGVhbmluZyBvdXQgZ2lnYWJ5dGVzIG9mIHByb2Nlc3MgbWVtb3J5
Cm9yIHdoYXQgbm90LCBoZW5jZSB0aGlzIGRlZGljYXRlZCBkZWJ1ZyBpbmZyYXN0cnVjdHVyZSku
Cgo+IFByb2JhYmx5IHRoZSBkZWJ1ZyBvcHRpb24gaXMgQ09ORklHX0RFQlVHX1BSRUVNUFQsIG5v
dCBsb2NrZGVwPwoKQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUC4gTGlrZSBpbiBteSBwYXRjaC4K
LURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
