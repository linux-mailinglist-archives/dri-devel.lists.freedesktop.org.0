Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC498CC80
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 09:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601B6E279;
	Wed, 14 Aug 2019 07:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2494D6E279
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:18:41 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E76072054F;
 Wed, 14 Aug 2019 07:18:40 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190814055108.214253-13-brendanhiggins@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <20190814055108.214253-13-brendanhiggins@google.com>
Subject: Re: [PATCH v13 12/18] kunit: test: add tests for KUnit managed
 resources
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Wed, 14 Aug 2019 00:18:40 -0700
Message-Id: <20190814071840.E76072054F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565767121;
 bh=pa8ZM0cB7Ynd5h1v6jDVACGMr40DuVATemDtrICxNrI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gFnMnbltojWFSsXrQHAtHzmV8Q0rNvZIWkw018qtr3Fxuh94zPr/qzmIgXjlo/Pzb
 ueeNYjpdxcdtYM/fj/HS0Gzo8HhvRxS/Pbf3S8gXc0JRsgzdUsUzYLi6pw/xzuct4F
 D32CJqllklCakBmqBQMSV8Swqw4sBNLi+YJG9e0o=
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
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 Avinash Kondareddy <akndr41@gmail.com>, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTMgMjI6NTE6MDIpCj4gRnJvbTogQXZp
bmFzaCBLb25kYXJlZGR5IDxha25kcjQxQGdtYWlsLmNvbT4KPiAKPiBBZGQgdW5pdCB0ZXN0cyBm
b3IgS1VuaXQgbWFuYWdlZCByZXNvdXJjZXMuIEtVbml0IG1hbmFnZWQgcmVzb3VyY2VzCj4gKHN0
cnVjdCBrdW5pdF9yZXNvdXJjZSkgYXJlIHJlc291cmNlcyB0aGF0IGFyZSBhdXRvbWF0aWNhbGx5
IGNsZWFuZWQgdXAKPiBhdCB0aGUgZW5kIG9mIGEgS1VuaXQgdGVzdCwgc2ltaWxhciB0byB0aGUg
Y29uY2VwdCBvZiBkZXZtXyogbWFuYWdlZAo+IHJlc291cmNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBdmluYXNoIEtvbmRhcmVkZHkgPGFrbmRyNDFAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdlZC1i
eTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZp
ZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+IC0tLQoKUmV2
aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
