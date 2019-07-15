Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B498C69D15
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 22:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FBA898CC;
	Mon, 15 Jul 2019 20:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D9789B05
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:49:50 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96A292145D;
 Mon, 15 Jul 2019 20:49:49 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190712081744.87097-7-brendanhiggins@google.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-7-brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
Subject: Re: [PATCH v9 06/18] kbuild: enable building KUnit
User-Agent: alot/0.8.1
Date: Mon, 15 Jul 2019 13:49:48 -0700
Message-Id: <20190715204949.96A292145D@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563223789;
 bh=0eRTix/Lpgnym75b99LGPTKC4kIZbevGRLJucViLRRM=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=aIF9Xc7kksoCd5+piTlYItO2JJkplr3Zs63iETQ8IW811WfXwuxPAPJI1oh+5quib
 rXKPgHWrXlwCMiqD7m50O6ehrnfpk/sPNoDrpTZhRJwAnlAyWAh6JjKOS2Tt/SLIaG
 n16Oh2OnOo8KfLr1uolIPKFySXqgf16LCNWWJdqE=
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
 Michal Marek <michal.lkml@markovi.net>, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTIgMDE6MTc6MzIpCj4gS1VuaXQgaXMg
YSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQgd2hlbiB1c2Vk
IGlzCj4gYnVpbHQgaW50byB0aGUga2VybmVsIGFzIGEgcGFydCBvZiBpdC4gQWRkIEtVbml0IHRv
IHRoZSByb290IEtjb25maWcgYW5kCj4gTWFrZWZpbGUgdG8gYWxsb3cgaXQgdG8gYmUgYWN0dWFs
bHkgYnVpbHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgo+IEFja2VkLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNh
aGlyb0Bzb2Npb25leHQuY29tPgo+IENjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtv
dmkubmV0Pgo+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgo+IFJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0
YXRlZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwu
b3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
