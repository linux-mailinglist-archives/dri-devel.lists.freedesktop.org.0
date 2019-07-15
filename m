Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6C69C63
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 22:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789DC89A8B;
	Mon, 15 Jul 2019 20:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196A89A7A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:10:55 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C69AA2086C;
 Mon, 15 Jul 2019 20:10:54 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190712081744.87097-2-brendanhiggins@google.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-2-brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
Subject: Re: [PATCH v9 01/18] kunit: test: add KUnit test runner core
User-Agent: alot/0.8.1
Date: Mon, 15 Jul 2019 13:10:53 -0700
Message-Id: <20190715201054.C69AA2086C@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563221454;
 bh=VRTZWx/5sKJHdH3qQkzEYYxjC5JMv+S2b65daQVUdGU=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=JQmD4doZtzPy2RsxVJTfXU4+HVaWbuij6HH8oF8RC7zWY3b+zfLb6BjosM4nFE8Zv
 mrb4jXugiyvntNyKdYloWJPzuahddLnXpqJKuYJRQSRO/Vb9WmX1qLLp99cO9XQ/uR
 gs7n762HrytDofL3ccz7u/kjKohqqEh0qv06XoyM=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTIgMDE6MTc6MjcpCj4gQWRkIGNvcmUg
ZmFjaWxpdGllcyBmb3IgZGVmaW5pbmcgdW5pdCB0ZXN0czsgdGhpcyBwcm92aWRlcyBhIGNvbW1v
biB3YXkKPiB0byBkZWZpbmUgdGVzdCBjYXNlcywgZnVuY3Rpb25zIHRoYXQgZXhlY3V0ZSBjb2Rl
IHdoaWNoIGlzIHVuZGVyIHRlc3QKPiBhbmQgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNvZGUgdW5k
ZXIgdGVzdCBiZWhhdmVzIGFzIGV4cGVjdGVkOyB0aGlzIGFsc28KPiBwcm92aWRlcyBhIHdheSB0
byBncm91cCB0b2dldGhlciByZWxhdGVkIHRlc3QgY2FzZXMgaW4gdGVzdCBzdWl0ZXMgKGhlcmUK
PiB3ZSBjYWxsIHRoZW0gdGVzdF9tb2R1bGVzKS4KPiAKPiBKdXN0IGRlZmluZSB0ZXN0IGNhc2Vz
IGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZvciBub3c7IHNldHRpbmcKPiBleHBlY3RhdGlvbnMg
b24gY29kZSB3aWxsIGJlIGRlZmluZWQgbGF0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJlbmRh
biBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+IFJldmlld2VkLWJ5OiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFJldmlld2VkLWJ5
OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEx1
aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN0ZXBoZW4g
Qm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCk1pbm9yIG5pdHMgYmVsb3cuCgo+IGRpZmYgLS1naXQg
YS9rdW5pdC90ZXN0LmMgYi9rdW5pdC90ZXN0LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAwMDAuLjU3MWU0YzY1ZGViNWMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
a3VuaXQvdGVzdC5jCj4gQEAgLTAsMCArMSwxODkgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogQmFzZSB1bml0IHRlc3QgKEtVbml0KSBBUEkuCj4g
KyAqCj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29vZ2xlIExMQy4KPiArICogQXV0aG9yOiBC
cmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gKyAqLwo+ICsKPiAr
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVkZSA8a3VuaXQvdGVzdC5oPgo+ICsK
PiArc3RhdGljIHZvaWQga3VuaXRfc2V0X2ZhaWx1cmUoc3RydWN0IGt1bml0ICp0ZXN0KQo+ICt7
Cj4gKyAgICAgICBXUklURV9PTkNFKHRlc3QtPnN1Y2Nlc3MsIGZhbHNlKTsKPiArfQo+ICsKWy4u
Ll0KPiArCj4gK3ZvaWQga3VuaXRfaW5pdF90ZXN0KHN0cnVjdCBrdW5pdCAqdGVzdCwgY29uc3Qg
Y2hhciAqbmFtZSkKPiArewo+ICsgICAgICAgdGVzdC0+bmFtZSA9IG5hbWU7Cj4gKyAgICAgICB0
ZXN0LT5zdWNjZXNzID0gdHJ1ZTsKPiArfQo+ICsKPiArLyoKPiArICogUGVyZm9ybXMgYWxsIGxv
Z2ljIHRvIHJ1biBhIHRlc3QgY2FzZS4KPiArICovCj4gK3N0YXRpYyB2b2lkIGt1bml0X3J1bl9j
YXNlKHN0cnVjdCBrdW5pdF9zdWl0ZSAqc3VpdGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGt1bml0X2Nhc2UgKnRlc3RfY2FzZSkKPiArewo+ICsgICAgICAgc3RydWN0IGt1
bml0IHRlc3Q7Cj4gKyAgICAgICBpbnQgcmV0ID0gMDsKPiArCj4gKyAgICAgICBrdW5pdF9pbml0
X3Rlc3QoJnRlc3QsIHRlc3RfY2FzZS0+bmFtZSk7Cj4gKwo+ICsgICAgICAgaWYgKHN1aXRlLT5p
bml0KSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IHN1aXRlLT5pbml0KCZ0ZXN0KTsKCkNhbiB5
b3UgcHVzaCB0aGUgcmV0IGRlZmluaXRpb24gaW50byB0aGlzIGlmIHNjb3BlPyBUaGF0IHdheSB3
ZSBjYW4KYXZvaWQgZGVmYXVsdCBpbml0aWFsaXplIHRvIDAgZm9yIGl0LgoKPiArICAgICAgICAg
ICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGt1bml0X2VycigmdGVz
dCwgImZhaWxlZCB0byBpbml0aWFsaXplOiAlZFxuIiwgcmV0KTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBrdW5pdF9zZXRfZmFpbHVyZSgmdGVzdCk7CgpEbyB3ZSBuZWVkIHRvICd0ZXN0X2Nh
c2UtPnN1Y2Nlc3MgPSB0ZXN0LnN1Y2Nlc3MnIGhlcmUgdG9vPyBPciBpcyB0aGUKdGVzdCBmYWls
dXJlIGV4dHJhY3RlZCBzb21ld2hlcmUgZWxzZT8KCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgdGVz
dF9jYXNlLT5ydW5fY2FzZSgmdGVzdCk7Cj4gKwo+ICsgICAgICAgaWYgKHN1aXRlLT5leGl0KQo+
ICsgICAgICAgICAgICAgICBzdWl0ZS0+ZXhpdCgmdGVzdCk7Cj4gKwo+ICsgICAgICAgdGVzdF9j
YXNlLT5zdWNjZXNzID0gdGVzdC5zdWNjZXNzOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
