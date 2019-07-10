Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E463F55
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 04:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF98689907;
	Wed, 10 Jul 2019 02:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDC889907
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 02:31:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4796E5AFE9;
 Wed, 10 Jul 2019 02:31:34 +0000 (UTC)
Received: from treble (ovpn-112-43.rdu2.redhat.com [10.10.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A90BE5F9D8;
 Wed, 10 Jul 2019 02:31:25 +0000 (UTC)
Date: Tue, 9 Jul 2019 21:31:23 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v7 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Message-ID: <20190710023123.ifnt5osimvzoe5hf@treble>
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-9-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709063023.251446-9-brendanhiggins@google.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 10 Jul 2019 02:31:35 +0000 (UTC)
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
 kbuild test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 tytso@mit.edu, richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTE6MzA6MTNQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEZpeCB0aGUgZm9sbG93aW5nIHdhcm5pbmcgc2VlbiBvbiBHQ0MgNy4zOgo+ICAg
a3VuaXQvdGVzdC10ZXN0Lm86IHdhcm5pbmc6IG9ianRvb2w6IGt1bml0X3Rlc3RfdW5zdWNjZXNz
ZnVsX3RyeSgpIGZhbGxzIHRocm91Z2ggdG8gbmV4dCBmdW5jdGlvbiBrdW5pdF90ZXN0X2NhdGNo
KCkKPiAKPiBrdW5pdF90cnlfY2F0Y2hfdGhyb3cgaXMgYSBmdW5jdGlvbiBhZGRlZCBpbiB0aGUg
Zm9sbG93aW5nIHBhdGNoIGluIHRoaXMKPiBzZXJpZXM7IGl0IGFsbG93cyBLVW5pdCwgYSB1bml0
IHRlc3RpbmcgZnJhbWV3b3JrIGZvciB0aGUga2VybmVsLCB0bwo+IGJhaWwgb3V0IG9mIGEgYnJv
a2VuIHRlc3QuIEFzIGEgY29uc2VxdWVuY2UsIGl0IGlzIGEgbmV3IF9fbm9yZXR1cm4KPiBmdW5j
dGlvbiB0aGF0IG9ianRvb2wgdGhpbmtzIGlzIGJyb2tlbiAoYXMgc2VlbiBhYm92ZSkuIFNvIGZp
eCB0aGlzCj4gd2FybmluZyBieSBhZGRpbmcga3VuaXRfdHJ5X2NhdGNoX3Rocm93IHRvIG9ianRv
b2wncyBub3JldHVybiBsaXN0Lgo+IAo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+Cj4gTGluazogaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMv
bGludXgta2J1aWxkL21zZzIxNzA4Lmh0bWwKPiBDYzogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9l
QHJlZGhhdC5jb20+Cj4gQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4K
PiAtLS0KPiAgdG9vbHMvb2JqdG9vbC9jaGVjay5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMgYi90
b29scy9vYmp0b29sL2NoZWNrLmMKPiBpbmRleCAxNzJmOTkxOTU3MjY5Li45OGRiNWZlODVjNzk3
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL29ianRvb2wvY2hlY2suYwo+ICsrKyBiL3Rvb2xzL29ianRv
b2wvY2hlY2suYwo+IEBAIC0xMzQsNiArMTM0LDcgQEAgc3RhdGljIGludCBfX2RlYWRfZW5kX2Z1
bmN0aW9uKHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUsIHN0cnVjdCBzeW1ib2wgKmZ1bmMsCj4g
IAkJInVzZXJjb3B5X2Fib3J0IiwKPiAgCQkibWFjaGluZV9yZWFsX3Jlc3RhcnQiLAo+ICAJCSJy
ZXdpbmRfc3RhY2tfZG9fZXhpdCIsCj4gKwkJImt1bml0X3RyeV9jYXRjaF90aHJvdyIsCj4gIAl9
Owo+ICAKPiAgCWlmIChmdW5jLT5iaW5kID09IFNUQl9XRUFLKQo+IC0tIAo+IDIuMjIuMC40MTAu
Z2Q4ZmRiZTIxYjUtZ29vZwo+IAoKQWNrZWQtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBy
ZWRoYXQuY29tPgoKLS0gCkpvc2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
