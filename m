Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78E591150
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62226E542;
	Sat, 17 Aug 2019 15:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489796EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 01:00:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 125so3402166qkl.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 18:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ae7oLtYinKvgCP13tnVSH7l6maTQr55HBH5L3FO3DiI=;
 b=Ys9Z9hLdXOFv3aKF6UZj6Phn6bwtSDgrqWp0xbZZLYhIdZ034ycxwtkKCTQF4S9hUO
 aF+AgAwVtLr/dZo5U3nmn1CLfHDRpmn31QDxXktFFpPaNqX6KYUSIaUO7WE10DHOhGIm
 jtNEF+ar1K5TYQk2Acd2tAZcjK2YWz8L9H65DC2+03kLN1REeyGgKpHC/00pzl74nx+D
 lynUG2pKJqOiScqrIQZNL2k2D+K8xQZ53MTEV/r2dFlCOola5PgYVmgjzAreIHZnwf8u
 FoytTb9AjWvMhErN2ft009S9g6XgeGZfL7vvjuTd2XKSWtRnUylr6Qq4I+xXa9FhY8UK
 BQtw==
X-Gm-Message-State: APjAAAVk4ZrsyxA1aD9tWdbhdX8dLYh/VyyH+t0poBW3vSVSzi/u7Yin
 c90GT3syoyulu7SCl2TrPljAlw==
X-Google-Smtp-Source: APXvYqyxI9OS6AUw/7wEeJomE7hGeWSroP0/H9Q9E+ZoJynGDvtwyvcA9yHhjJMm3q3CVcLQLGNODw==
X-Received: by 2002:a37:aa57:: with SMTP id t84mr6562963qke.34.1565917237376; 
 Thu, 15 Aug 2019 18:00:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id t15sm2084806qtr.88.2019.08.15.18.00.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 18:00:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyQbc-0002v2-3C; Thu, 15 Aug 2019 22:00:36 -0300
Date: Thu, 15 Aug 2019 22:00:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816010036.GA9915@ziepe.ca>
References: <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ae7oLtYinKvgCP13tnVSH7l6maTQr55HBH5L3FO3DiI=;
 b=KcW7SJTCvYMKEBr6ZA7ZBCVrwhTBhrxBAzKDZCEQfgTQ1UAU1/yBqq/rXTp4rQSuMJ
 IO3knBqpn2AdA04HAixLj3yCozsg1UAo/yGd5mtobT9P7ox1cF3Az+gzxvSHjtS74RUp
 WvaqkLapT2Ubt9ToChKBB0qe0ngW33kWeP+H8aeA2AYYZE14PPhIZ/S3lqmaw6o7OQOc
 +NqXbwj2Kf5YIU09s9BqFI5Fx6K9MIW9Pox2mvr2sLTsxwPMikvBFCp/EFlqT78uepMz
 rSFX7X+6jzzyCjzCiQ0A93GLozvhXSdE0CeSM6/pkHRgn74yKYamKJEUnwca6vz4+PPL
 iGog==
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
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6NDk6MzFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDoyNyBQTSBKYXNvbiBHdW50aG9ycGUg
PGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDoxNjo0
M1BNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBTbyBpZiBzb21lb25lIGNhbiBl
eHBsYWluIHRvIG1lIGhvdyB0aGF0IHdvcmtzIHdpdGggbG9ja2RlcCBJIGNhbiBvZgo+ID4gPiBj
b3Vyc2UgaW1wbGVtZW50IGl0LiBCdXQgYWZhaWNzIHRoYXQgZG9lc24ndCBleGlzdCAoSSB0cmll
ZCB0byBleHBsYWluCj4gPiA+IHRoYXQgc29tZXdoZXJlIGVsc2UgYWxyZWFkeSksIGFuZCBJJ20g
bm8gcmVhbGx5IGxvb2tpbmcgZm9yd2FyZCB0bwo+ID4gPiBoYWNraW5nIGFsc28gb24gbG9ja2Rl
cCBmb3IgdGhpcyBsaXR0bGUgc2VyaWVzLgo+ID4KPiA+IEhtbSwga2luZCBvZiBsb29rcyBsaWtl
IGl0IGlzIGRvbmUgYnkgY2FsbGluZyBwcmVlbXB0X2Rpc2FibGUoKQo+IAo+IFl1cC4gVGhhdCB3
YXMgdjEsIHRoZW4gY2FtZSB0aGUgc3VnZ2VzdGlvbiB0aGF0IGRpc2FibGluZyBwcmVlbXB0aW9u
Cj4gaXMgbWF5YmUgbm90IHRoZSBiZXN0IHRoaW5nICh0aGUgb29tIHJlYXBlciBjb3VsZCBzdGls
bCBydW4gZm9yIGEgbG9uZwo+IHRpbWUgY29tcGFyYXRpdmVseSwgaWYgaXQncyBjbGVhbmluZyBv
dXQgZ2lnYWJ5dGVzIG9mIHByb2Nlc3MgbWVtb3J5Cj4gb3Igd2hhdCBub3QsIGhlbmNlIHRoaXMg
ZGVkaWNhdGVkIGRlYnVnIGluZnJhc3RydWN0dXJlKS4KCk9oLCBJJ20gY29taW5nIGluIGxhdGUs
IHNvcnJ5CgpBbnlob3csIEkgd2FzIHRoaW5raW5nIHNpbmNlIHdlIGFncmVlZCB0aGlzIGNhbiB0
cmlnZ2VyIG9uIHNvbWUKQ09ORklHX0RFQlVHIGZsYWcsIHNvbWV0aGluZyBsaWtlCgogICAgLyog
VGhpcyBpcyBhIHNsZWVwYWJsZSByZWdpb24sIGJ1dCB1c2UgcHJlZW1wdF9kaXNhYmxlIHRvIGdl
dCBkZWJ1Z2dpbmcKICAgICAqIGZvciBjYWxscyB0aGF0IGFyZSBub3QgYWxsb3dlZCB0byBibG9j
ayBmb3IgT09NIFsuLiBpbnNlcnQKICAgICAqIE1pY2hhbCdzIGV4cGxhbmF0aW9uLi4gXSAqLwog
ICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUCkgJiYgIW1tdV9ub3Rp
Zmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQoJcHJlZW1wdF9kaXNhYmxlKCk7CiAgICBvcHMt
PmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKTsKCkFuZCBJIGhhdmUgYWxzbyBiZWVuIGlkbHkgbXVs
bGluZyBkb2luZyBzb21ldGhpbmcgbGlrZQoKICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVH
X05PVElGSUVSUykgJiYgCiAgICAgICByYW5kICYmCiAgICAgICBtbXVfbm90aWZpZXJfcmFuZ2Vf
YmxvY2thYmxlKHJhbmdlKSkgewogICAgIHJhbmdlLT5mbGFncyA9IDAKICAgICBpZiAoIW9wcy0+
aW52YWxpZGF0ZV9yYW5nZV9zdGFydChyYW5nZSkpCgljb250aW51ZQoKICAgICAvLyBGYWlsZWQs
IHRyeSBhZ2FpbiBhcyBibG9ja2FibGUKICAgICByYW5nZS0+ZmxhZ3MgPSBNTVVfTk9USUZJRVJf
UkFOR0VfQkxPQ0tBQkxFCiAgIH0KICAgb3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHJhbmdl
KTsKCldoaWNoIHdvdWxkIGdpdmUgY292ZXJhZ2UgZm9yIHRoaXMgY29ybmVyIGNhc2Ugd2l0aG91
dCBmb3JjaW5nIE9PTS4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
