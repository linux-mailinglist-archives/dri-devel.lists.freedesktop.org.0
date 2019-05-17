Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80F21151
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 02:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BBC89791;
	Fri, 17 May 2019 00:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45207897D4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 00:35:23 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A48A7206BF;
 Fri, 17 May 2019 00:35:22 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190514221711.248228-2-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-2-brendanhiggins@google.com>
Subject: Re: [PATCH v4 01/18] kunit: test: add KUnit test runner core
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Thu, 16 May 2019 17:35:21 -0700
Message-Id: <20190517003522.A48A7206BF@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558053322;
 bh=7TW9YRtA+zrn9bZVhm3pRMCNMOGMBXRGC3+aYbhED+Q=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=2IVzgl9AIPO++Ch2lD+HPwvhsbPyCjqMp1srxLDmXKAwP6rd65u7Wus1PDx6ERIac
 JgIJlEX6orOSTCbWhyMS/r6KVO9ATGZRYWIsOwLBH7NuKkS7fRkhmj+govo4YPjBBW
 njgrIlohapBLa9e+A8WE0GpgY53wrangCoB5QG44=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDUtMTQgMTU6MTY6NTQpCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmU2ODJlYTBlMWY5YTUKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgKPiBAQCAtMCwwICsxLDE2MiBA
QApbLi5dCj4gKy8qKgo+ICsgKiBzdHJ1Y3Qga3VuaXQgLSByZXByZXNlbnRzIGEgcnVubmluZyBp
bnN0YW5jZSBvZiBhIHRlc3QuCj4gKyAqIEBwcml2OiBmb3IgdXNlciB0byBzdG9yZSBhcmJpdHJh
cnkgZGF0YS4gQ29tbW9ubHkgdXNlZCB0byBwYXNzIGRhdGEgY3JlYXRlZAo+ICsgKiBpbiB0aGUg
aW5pdCBmdW5jdGlvbiAoc2VlICZzdHJ1Y3Qga3VuaXRfbW9kdWxlKS4KPiArICoKPiArICogVXNl
ZCB0byBzdG9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgY3VycmVudCBjb250ZXh0IHVuZGVyIHdo
aWNoIHRoZSB0ZXN0IGlzCj4gKyAqIHJ1bm5pbmcuIE1vc3Qgb2YgdGhpcyBkYXRhIGlzIHByaXZh
dGUgYW5kIHNob3VsZCBvbmx5IGJlIGFjY2Vzc2VkIGluZGlyZWN0bHkKPiArICogdmlhIHB1Ymxp
YyBmdW5jdGlvbnM7IHRoZSBvbmUgZXhjZXB0aW9uIGlzIEBwcml2IHdoaWNoIGNhbiBiZSB1c2Vk
IGJ5IHRoZQo+ICsgKiB0ZXN0IHdyaXRlciB0byBzdG9yZSBhcmJpdHJhcnkgZGF0YS4KPiArICov
Cj4gK3N0cnVjdCBrdW5pdCB7Cj4gKyAgICAgICB2b2lkICpwcml2Owo+ICsKPiArICAgICAgIC8q
IHByaXZhdGU6IGludGVybmFsIHVzZSBvbmx5LiAqLwo+ICsgICAgICAgY29uc3QgY2hhciAqbmFt
ZTsgLyogUmVhZCBvbmx5IGFmdGVyIGluaXRpYWxpemF0aW9uISAqLwo+ICsgICAgICAgc3Bpbmxv
Y2tfdCBsb2NrOyAvKiBHYXVyZHMgYWxsIG11dGFibGUgdGVzdCBzdGF0ZS4gKi8KPiArICAgICAg
IGJvb2wgc3VjY2VzczsgLyogUHJvdGVjdGVkIGJ5IGxvY2suICovCgpJcyB0aGlzIGFsbCB0aGUg
c3BpbmxvY2sgcHJvdGVjdHM/IERvZXNuJ3Qgc2VlbSB1c2VmdWwgaWYgaXQncyBqdXN0CnByb3Rl
Y3RpbmcgYWNjZXNzIHRvIHRoZSB2YXJpYWJsZSBiZWluZyBzZXQgb3Igbm90IGJlY2F1c2UgY29k
ZSB0aGF0CnJlYWRzIGl0IHdpbGwgaGF2ZSBhIHN0YWxlIHZpZXcgb2YgdGhlIHZhbHVlLgoKPiBk
aWZmIC0tZ2l0IGEva3VuaXQvdGVzdC5jIGIva3VuaXQvdGVzdC5jCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi44NmY2NWJhMmJjZjkyCj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL2t1bml0L3Rlc3QuYwo+IEBAIC0wLDAgKzEsMjI5IEBACj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIEJhc2UgdW5pdCB0ZXN0IChLVW5p
dCkgQVBJLgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTksIEdvb2dsZSBMTEMuCj4gKyAq
IEF1dGhvcjogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ICsg
Ki8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2No
ZWQvZGVidWcuaD4KPiArI2luY2x1ZGUgPGt1bml0L3Rlc3QuaD4KPiArClsuLi5dCj4gKwo+ICtz
aXplX3Qga3VuaXRfbW9kdWxlX2NvdW50ZXIgPSAxOwoKc3RhdGljPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
