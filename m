Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CEACC529
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 23:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA856E348;
	Fri,  4 Oct 2019 21:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 444 seconds by postgrey-1.36 at gabe;
 Fri, 04 Oct 2019 21:47:13 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7C6E348
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 21:47:13 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x94LcCr9027392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2019 17:38:15 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 9FA7C42088C; Fri,  4 Oct 2019 17:38:12 -0400 (EDT)
Date: Fri, 4 Oct 2019 17:38:12 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20191004213812.GA24644@mit.edu>
References: <20190923090249.127984-1-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, torvalds@linux-foundation.org,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, jpoimboe@redhat.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDI6MDI6MzBBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ICMjIFRMO0RSCj4gCj4gVGhpcyByZXZpc2lvbiBhZGRyZXNzZXMgY29tbWVudHMg
ZnJvbSBMaW51c1sxXSBhbmQgUmFuZHlbMl0sIGJ5IG1vdmluZwo+IHRvcCBsZXZlbCBga3VuaXQv
YCBkaXJlY3RvcnkgdG8gYGxpYi9rdW5pdC9gIGFuZCBsaWtld2lzZSBtb3ZlcyB0b3AKPiBsZXZl
bCBLY29uZmlnIGVudHJ5IHVuZGVyIGxpYi9LY29uZmlnLmRlYnVnLCBzbyB0aGUgS1VuaXQgc3Vi
bWVudSBub3cKPiBzaG93cyB1cCB1bmRlciB0aGUgIktlcm5lbCBIYWNraW5nIiBtZW51LgoKVGhp
cyBxdWVzdGlvbiBpcyBwcmltYXJpbHkgZGlyZWN0ZWQgYXQgU2h1YWggYW5kIExpbnVzLi4uLgoK
V2hhdCdzIHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUga3VuaXQgc2VyaWVzIG5vdyB0aGF0IEJy
ZW5kYW4gaGFzCm1vdmVkIGl0IG91dCBvZiB0aGUgdG9wLWxldmVsIGt1bml0IGRpcmVjdG9yeSBh
cyBMaW51cyBoYXMgcmVxdWVzdGVkPwoKVGhlcmUgZG9lc24ndCBhcHBlYXIgdG8gaGF2ZSBiZWVu
IG1hbnkgY29tbWVudHMgb3IgY2hhbmdlcyBzaW5jZSBzaW5jZQpTZXB0ZW1iZXIgMjNyZCwgYW5k
IEkgd2FzIHZlcnkgbXVjaCBob3BpbmcgdGhleSBjb3VsZCBsYW5kIGJlZm9yZQotcmMyLCBzaW5j
ZSBJJ3ZlIGJlZW4gaG9waW5nIHRvIGFkZCB1bml0IHRlc3RzIGZvciBleHQ0LgoKSXMga3VuaXQg
bGlrZWx5IHRvIGJlIGFibGUgdG8gYmUgbGFuZGVkIGluIExpbnVzJ3MgdHJlZSBkdXJpbmcgdGhp
cwpkZXZlbG9wbWVudCBjeWNsZT8KCk1hbnkgdGhhbmtzIQoKCQkJCQktIFRlZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
