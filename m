Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C4321CB3
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 19:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B5F8995F;
	Fri, 17 May 2019 17:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCB18995F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 17:43:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7949F20848;
 Fri, 17 May 2019 17:43:00 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190514221711.248228-4-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-4-brendanhiggins@google.com>
Subject: Re: [PATCH v4 03/18] kunit: test: add string_stream a std::stream
 like string builder
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Fri, 17 May 2019 10:42:59 -0700
Message-Id: <20190517174300.7949F20848@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558114980;
 bh=u/0Sx+bL+E5OWSceo4KC7dtRetcFC6sUsN/PmJnAhk0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PNqM78LYOJE6AFjPJJqvmTe4yn4ExZJELAbLm7PWYtx4RRA91ZKFjxcmNXwvJ9vzj
 fmGUSDTS/JYHIyMuqufLahPQm7zrEzVN7bmVMlPf43vv70uVQT6W1uTjAQhlpB0K3J
 fS21ZYISzd9n+BoS1phKk9f2kydOWWs9fMzaLlI0=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDUtMTQgMTU6MTY6NTYpCj4gQSBudW1iZXIg
b2YgdGVzdCBmZWF0dXJlcyBuZWVkIHRvIGRvIHByZXR0eSBjb21wbGljYXRlZCBzdHJpbmcgcHJp
bnRpbmcKPiB3aGVyZSBpdCBtYXkgbm90IGJlIHBvc3NpYmxlIHRvIHJlbHkgb24gYSBzaW5nbGUg
cHJlYWxsb2NhdGVkIHN0cmluZwo+IHdpdGggcGFyYW1ldGVycy4KPiAKPiBTbyBwcm92aWRlIGEg
bGlicmFyeSBmb3IgY29uc3RydWN0aW5nIHRoZSBzdHJpbmcgYXMgeW91IGdvIHNpbWlsYXIgdG8K
PiBDKysncyBzdGQ6OnN0cmluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMg
PGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1
bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KCklzIHRoZXJlIGFueSByZWFzb24gd2h5IHdl
IGNhbid0IHVzZSB0aGUgc2VxZmlsZSBBUEkgZm9yIHRoaXM/IFRoZXNlCmJvdGggc2hhcmUgYSBz
aW1pbGFyIGdvYWwsIGZvcm1hdHRpbmcgc3RyaW5ncyBpbnRvIGEgYnVmZmVyIHRvIGJlIHJlYWQK
bGF0ZXIuIE1heWJlIHNvbWUgbmV3IEFQSXMgd291bGQgYmUgbmVlZGVkIHRvIGV4dHJhY3QgdGhl
IGJ1ZmZlcgpkaWZmZXJlbnRseSwgYnV0IEkgaG9wZSB3ZSBjb3VsZCBzaGFyZSB0aGUgY29kZS4K
CklmIGl0IGNhbid0IGJlIHVzZWQsIGNhbiB5b3UgcGxlYXNlIGFkZCB0aGUgcmVhc29uaW5nIHRv
IHRoZSBjb21taXQgdGV4dApoZXJlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
