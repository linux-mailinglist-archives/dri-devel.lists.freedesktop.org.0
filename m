Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A48CC75
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD476E278;
	Wed, 14 Aug 2019 07:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5470D6E278
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:17:52 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CF0F2054F;
 Wed, 14 Aug 2019 07:17:52 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190814055108.214253-4-brendanhiggins@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <20190814055108.214253-4-brendanhiggins@google.com>
Subject: Re: [PATCH v13 03/18] kunit: test: add string_stream a std::stream
 like string builder
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Wed, 14 Aug 2019 00:17:51 -0700
Message-Id: <20190814071752.1CF0F2054F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565767072;
 bh=fFSODLNozIGjhPTZNb2HDDCi9OpfDQhPl8bfSqvMcsU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Tig6bqO+uLutcqoP8F96ocG1Zw8W4tfd0g/H7BQWrNvKiL9x7S1IaLUnEFmD/GI5B
 3SZl55sPYQvUA5FzyIIn/HDJC+7sZkqtLbaf9LMihXQ+w5Rq1lRJj6TTVrLTSzMJ6b
 Y6Dgtp5Id7PoxZl5W+jvWsXN4ST7X/w3KSvEKsMI=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTMgMjI6NTA6NTMpCj4gQSBudW1iZXIg
b2YgdGVzdCBmZWF0dXJlcyBuZWVkIHRvIGRvIHByZXR0eSBjb21wbGljYXRlZCBzdHJpbmcgcHJp
bnRpbmcKPiB3aGVyZSBpdCBtYXkgbm90IGJlIHBvc3NpYmxlIHRvIHJlbHkgb24gYSBzaW5nbGUg
cHJlYWxsb2NhdGVkIHN0cmluZwo+IHdpdGggcGFyYW1ldGVycy4KPiAKPiBTbyBwcm92aWRlIGEg
bGlicmFyeSBmb3IgY29uc3RydWN0aW5nIHRoZSBzdHJpbmcgYXMgeW91IGdvIHNpbWlsYXIgdG8K
PiBDKysncyBzdGQ6OnN0cmluZy4gc3RyaW5nX3N0cmVhbSBpcyByZWFsbHkganVzdCBhIHN0cmlu
ZyBidWlsZGVyLAo+IG5vdGhpbmcgbW9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IExv
Z2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBT
dGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+CgpUaGUgc3BpbmxvY2tzIHdpbGwgcHJv
YmFibHkgbmVlZCB0byBjaGFuZ2UgdG8gYmUgaXJxc2F2ZXMgaW4gdGhlIGZ1dHVyZSwKYnV0IEkg
Z3Vlc3Mgd2UgY2FuIGNyb3NzIHRoYXQgYnJpZGdlIHdoZW4gd2UgY29tZSB0byBpdC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
