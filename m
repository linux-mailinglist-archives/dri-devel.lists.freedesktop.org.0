Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84D8ADFE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9F6E3FE;
	Tue, 13 Aug 2019 04:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC076E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:46:38 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FE742063F;
 Tue, 13 Aug 2019 04:46:38 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-16-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-16-brendanhiggins@google.com>
Subject: Re: [PATCH v12 15/18] Documentation: kunit: add documentation for
 KUnit
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:46:37 -0700
Message-Id: <20190813044638.7FE742063F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565671598;
 bh=Z0Svjt3Fo8yC4rslfkTmnZfxHx3ViQG+m+g6HFA41bY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=p83RZOpoKeUNPUd+BdLuIegfK0mpL5tQfiQzpBv6UO83yoxyp6adRidjeuhcOC4wC
 s338nTaCM7+3P21nyMlcXltcWN54xO5KBDwL0hp97UL6MvRD39sidLzFl/y7TD+7lb
 qRCWhAmLlx4CTBKgLcjNqWOK/XK9pEWO4ut/NKQY=
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
 Jonathan Corbet <corbet@lwn.net>, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTgpCj4gQWRkIGRvY3Vt
ZW50YXRpb24gZm9yIEtVbml0LCB0aGUgTGludXgga2VybmVsIHVuaXQgdGVzdGluZyBmcmFtZXdv
cmsuCj4gLSBBZGQgaW50cm8gYW5kIHVzYWdlIGd1aWRlIGZvciBLVW5pdAo+IC0gQWRkIEFQSSBy
ZWZlcmVuY2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdW8gPGZlbGl4Z3VveGl1cGluZ0Bn
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2lu
c0Bnb29nbGUuY29tPgo+IENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+IFJl
dmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Pgo+IFJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4g
LS0tCgpSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
