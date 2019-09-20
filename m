Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79548BA28B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC64B6E075;
	Sun, 22 Sep 2019 12:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868C76E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 08:26:28 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id q24so4281468plr.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 01:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lqDIHj9lZasR/zDtsnve221vNIVF3/3BuxETCeMHCc4=;
 b=pZ5+ghZKB1iwivEsEJX0QP8hOq6lvAdzfeI17rgRZrCDd2NYlZzsuPrcmlkPPKZYPP
 799iGpw1S/monG2DmEtxUaJdvpPVS5fKUG2t6Tz4rvbmzq+V9HGewacYOqzgPNZH+PzB
 2WoRp7r9qfeLIeqv2h+RYBa7PiHkdog55gy7MPpvtxPfgThos8LlaFsdwbAJE1OsR1j9
 HtnERozyqFnJi2a6Cbdqp9z3AvWmA2SkZ5WksD5Ipy8g7VDhCC4P7uNfo+H7HSXsUWgR
 ESgAI5L7wKFQiSYPh4P8mDXH3HfWN/NShI7xI4c0mZbjCiMGS+OazgDKrQ+cc1nlyw4H
 lOtw==
X-Gm-Message-State: APjAAAW0OWB8j6MrbHH1jBoo5gUBw6DQvG7D2HlzNXtQBVVbPQ5TyOVp
 Lb5sfMPXE8sRV+6LCxyxysDxdnthacqKkOarwkJhB/Qfwvs=
X-Google-Smtp-Source: APXvYqyNiRlbO6R3uG9HEH5vDFWKxf6oFNbwaLwTM4FngoMH0rrK0KW2vni8a9ARb9jmWGlDeibYyIhP8RN53cwInWk=
X-Received: by 2002:a17:902:ff0e:: with SMTP id
 f14mr19947847plj.325.1569023089386; 
 Fri, 20 Sep 2019 16:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
 <20190920231923.141900-7-brendanhiggins@google.com>
 <20190920233600.48BBA20644@mail.kernel.org>
In-Reply-To: <20190920233600.48BBA20644@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 20 Sep 2019 16:44:38 -0700
Message-ID: <CAFd5g46pndA_gOD9i8M5e5fb8x4mSL9mcgMDujN7XufeFs8bmQ@mail.gmail.com>
Subject: Re: [PATCH v16 06/19] lib: enable building KUnit in lib/
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lqDIHj9lZasR/zDtsnve221vNIVF3/3BuxETCeMHCc4=;
 b=XSaBvr71r6CXxRkl47+im5CtQOOiRKY/iuu1X/oF7O0195aBtQdo4E6H31j2DRdwMB
 s+h2SbgX6KwCSKPN/vksW+oTjyn/PocXCe2Kbp7D50FyleyNJKKiDms9wE4+010NuDGz
 Tq75Lq2/Of0H+EgT6rh/B7HmjzNMrYZDTILOvyQjFxsnvmyOoLNZmh4oqM1yuhhFP8pe
 sRZaN6hX2UO3lPWFmdzLQbJnBe69O1mU2qIHiv3K3roTU3fxgbwZK3OKCga8hxSzWAhk
 hBJHVhNvM+mzWFILJB/Im3xuyQ/V1FTP6vSQ4wkxN1OHoJdGyrC0V7kg/MssknjtxoVt
 FgJg==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgNDozNiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDktMjAgMTY6
MTk6MTApCj4gPiBLVW5pdCBpcyBhIG5ldyB1bml0IHRlc3RpbmcgZnJhbWV3b3JrIGZvciB0aGUg
a2VybmVsIGFuZCB3aGVuIHVzZWQgaXMKPiA+IGJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBh
cnQgb2YgaXQuIEFkZCBLVW5pdCB0byB0aGUgbGliIEtjb25maWcgYW5kCj4gPiBNYWtlZmlsZSB0
byBhbGxvdyBpdCB0byBiZSBhY3R1YWxseSBidWlsdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBC
cmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiBDYzogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPgo+ID4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgo+ID4gLS0tCj4gPiAgbGliL0tjb25maWcuZGVidWcgfCAyICsrCj4gPiAgbGliL01h
a2VmaWxlICAgICAgfCAyICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL0tjb25maWcuZGVidWcgYi9saWIvS2NvbmZpZy5kZWJ1
Zwo+ID4gaW5kZXggNTk2MGUyOTgwYThhLi41ODcwZmJlMTFlOWIgMTAwNjQ0Cj4gPiAtLS0gYS9s
aWIvS2NvbmZpZy5kZWJ1Zwo+ID4gKysrIGIvbGliL0tjb25maWcuZGVidWcKPiA+IEBAIC0yMTQ0
LDQgKzIxNDQsNiBAQCBjb25maWcgSU9fU1RSSUNUX0RFVk1FTQo+ID4KPiA+ICBzb3VyY2UgImFy
Y2gvJChTUkNBUkNIKS9LY29uZmlnLmRlYnVnIgo+ID4KPiA+ICtzb3VyY2UgImxpYi9rdW5pdC9L
Y29uZmlnIgo+ID4gKwo+Cj4gUGVyaGFwcyB0aGlzIHNob3VsZCBnbyBieSB0aGUgIlJ1bnRpbWUg
VGVzdGluZyIgcGFydD8gQmVmb3JlIG9yIGFmdGVyLgoKWWVhaCwgdGhhdCBwcm9iYWJseSBtYWtl
cyBzZW5zZS4KCj4gPiAgZW5kbWVudSAjIEtlcm5lbCBoYWNraW5nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
