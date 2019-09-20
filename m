Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD0BA22A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C2F6E112;
	Sun, 22 Sep 2019 12:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B076E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 07:20:54 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48BBA20644;
 Fri, 20 Sep 2019 23:36:00 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190920231923.141900-7-brendanhiggins@google.com>
References: <20190920231923.141900-1-brendanhiggins@google.com>
 <20190920231923.141900-7-brendanhiggins@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v16 06/19] lib: enable building KUnit in lib/
User-Agent: alot/0.8.1
Date: Fri, 20 Sep 2019 16:35:59 -0700
Message-Id: <20190920233600.48BBA20644@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569022560;
 bh=5sglSv+9hSOJc0b2FWY8nQeYj0FpLkqsXtS/3eUTZSE=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=QoMrsX259uVvKBLBgqFjYCWW1WAj3R7P2E6eLBj5gAyIaMIeiTZjnJfb1ejgaJusJ
 UkwBwgUAjsyBgNEGV13XM9dZr3pmhCUgchYJf34niV3DUvIrN8ruCbCxuAbZoqAL58
 4PWBzZepSAwldwciLUi98T3R3UO3RBc/aPRrzFTw=
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
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org,
 julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at,
 torvalds@linux-foundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDktMjAgMTY6MTk6MTApCj4gS1VuaXQgaXMg
YSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQgd2hlbiB1c2Vk
IGlzCj4gYnVpbHQgaW50byB0aGUga2VybmVsIGFzIGEgcGFydCBvZiBpdC4gQWRkIEtVbml0IHRv
IHRoZSBsaWIgS2NvbmZpZyBhbmQKPiBNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBhY3R1YWxs
eSBidWlsdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdn
aW5zQGdvb2dsZS5jb20+Cj4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IENjOiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgbGliL0tjb25maWcuZGVidWcg
fCAyICsrCj4gIGxpYi9NYWtlZmlsZSAgICAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvS2NvbmZpZy5kZWJ1ZyBiL2xpYi9L
Y29uZmlnLmRlYnVnCj4gaW5kZXggNTk2MGUyOTgwYThhLi41ODcwZmJlMTFlOWIgMTAwNjQ0Cj4g
LS0tIGEvbGliL0tjb25maWcuZGVidWcKPiArKysgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+IEBAIC0y
MTQ0LDQgKzIxNDQsNiBAQCBjb25maWcgSU9fU1RSSUNUX0RFVk1FTQo+ICAKPiAgc291cmNlICJh
cmNoLyQoU1JDQVJDSCkvS2NvbmZpZy5kZWJ1ZyIKPiAgCj4gK3NvdXJjZSAibGliL2t1bml0L0tj
b25maWciCj4gKwoKUGVyaGFwcyB0aGlzIHNob3VsZCBnbyBieSB0aGUgIlJ1bnRpbWUgVGVzdGlu
ZyIgcGFydD8gQmVmb3JlIG9yIGFmdGVyLgoKPiAgZW5kbWVudSAjIEtlcm5lbCBoYWNraW5nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
