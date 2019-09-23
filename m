Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414CBB807
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 17:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254C66E94D;
	Mon, 23 Sep 2019 15:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7496E94D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:35:15 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0527C207FD;
 Mon, 23 Sep 2019 15:35:15 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190923090249.127984-7-brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-7-brendanhiggins@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v18 06/19] lib: enable building KUnit in lib/
User-Agent: alot/0.8.1
Date: Mon, 23 Sep 2019 08:35:14 -0700
Message-Id: <20190923153515.0527C207FD@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569252915;
 bh=2FPlDjb8XVt8THJD+0aTE8cWQwTrhqJ59wvCTT/dFXo=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=DHg5vHXzTVIyFtG8opYARU3tZh8iFwFZhkUnJ3+20AKCyJHwLNvoN2QlqG8RrT3Hd
 rUOa4bAgT4ApawuXS6EwQZqyC5G22AacapVSbhQrFbBw7zxPB+CDSCX6YhdorG68rR
 3oDUtYpSOFmGtxFk/v9nDjlUnZYZcbXp/hTb55Ro=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDktMjMgMDI6MDI6MzYpCj4gS1VuaXQgaXMg
YSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQgd2hlbiB1c2Vk
IGlzCj4gYnVpbHQgaW50byB0aGUga2VybmVsIGFzIGEgcGFydCBvZiBpdC4gQWRkIEtVbml0IHRv
IHRoZSBsaWIgS2NvbmZpZyBhbmQKPiBNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBhY3R1YWxs
eSBidWlsdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdn
aW5zQGdvb2dsZS5jb20+Cj4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IENjOiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVu
IEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
