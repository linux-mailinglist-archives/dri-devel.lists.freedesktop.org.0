Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77FB62818
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 20:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F380B89E11;
	Mon,  8 Jul 2019 18:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89CF89E11
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 18:13:07 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j2so7986879pfe.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 11:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCk1WdM0E6nhQWvL7vJ1kxAIGG56jCba8QRd4SGiDCA=;
 b=nXkbHpyUN+MhQZQv/AJi6WsLXK4WmLuU//6pnxjSJ3dh5nO8yBsZkr2PbNCwgfcZqt
 vdnAZapg/LHe91YvaEw/fcg5zyUTmu6i0GlG4bHhHzaCa/OTpfjNtN8vIDv/wsFtYfoK
 w3StbJDinP0YlfMDcjel5b/IMNgRcwwIOttx4e+8MgR9i2edW6mg8/ciJ9Vc+Ebx7n5R
 S0bF8ln4ArJR/n8iJnue20VeiOvMmry3r7JWylyXm3K/1CymrVBRalDPU/htgQObcCkB
 YBjapZypzkvl4lbyklR+FTQ9Sb6VpDxjCw07lrFlnmFXu7myvZDCJZ5zZR6Kqi1qVTBk
 BekA==
X-Gm-Message-State: APjAAAWKQxCxXRc8E8Ax2r/6EYgdcW9uEWCwcuRazbfXZZ0zJIJvWG6s
 854lAq/ukbnc9gGqOvOXsfQb7hjaJC+BHfoS60nKKA==
X-Google-Smtp-Source: APXvYqwC0igtuHeVBLKgctH3AD+JJSF1DFvHIy3IKlb3b8t5WGygrYUkxCrtO7R9CSN2ItDaerVKeb0U4IrWm5FTm44=
X-Received: by 2002:a17:90b:f0e:: with SMTP id
 br14mr27407161pjb.117.1562609586818; 
 Mon, 08 Jul 2019 11:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com>
 <20190705202051.GB19023@42.do-not-panic.com>
In-Reply-To: <20190705202051.GB19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 Jul 2019 11:12:55 -0700
Message-ID: <CAFd5g44_NoGHsMRfZJ-V42=8U6QYOYZV7zUmEdx-6V4xGarxHg@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JCk1WdM0E6nhQWvL7vJ1kxAIGG56jCba8QRd4SGiDCA=;
 b=OgF8cL2jlYPassQya/5LPanMn4rdt4wOzgmrqwzZxEQPZIqKVwIc/cbAKjQaKs4FzI
 MO+lSWFVjE1BjbNrUM+omMAeEVXWMjykV41krvzt8AWSDOTa5viWTuQtJ9ep0X0LXNYj
 OdiZ626za04Q5e0ee0vw+VtEjSvuMHfSSgdE6F33EKsPb+2cKBbfbxgMScj9OazVWVAS
 RUi9fLCfATh+IjCkIXVEG9DerSHN7LKc7YsX4AxnaewNdUelqDZmIgeZ0zeSR0DCe4sE
 eOaHDJj5UB+8gGaq9GRuZY4qOho86pU0SRPsJdJUsDSn1VzYLTJqJx6RyW6gChbKWFWj
 8y+g==
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@google.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxOjIwIFBNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDA1OjM1OjU4UE0g
LTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ICtzdHJ1Y3Qga3VuaXQgewo+ID4gKyAg
ICAgdm9pZCAqcHJpdjsKPiA+ICsKPiA+ICsgICAgIC8qIHByaXZhdGU6IGludGVybmFsIHVzZSBv
bmx5LiAqLwo+ID4gKyAgICAgY29uc3QgY2hhciAqbmFtZTsgLyogUmVhZCBvbmx5IGFmdGVyIGlu
aXRpYWxpemF0aW9uISAqLwo+ID4gKyAgICAgYm9vbCBzdWNjZXNzOyAvKiBSZWFkIG9ubHkgYWZ0
ZXIgdGVzdF9jYXNlIGZpbmlzaGVzISAqLwo+ID4gK307Cj4KPiBObyBsb2NrIGF0dHJpYnV0ZSBh
Ym92ZS4KPgo+ID4gK3ZvaWQga3VuaXRfaW5pdF90ZXN0KHN0cnVjdCBrdW5pdCAqdGVzdCwgY29u
c3QgY2hhciAqbmFtZSkKPiA+ICt7Cj4gPiArICAgICBzcGluX2xvY2tfaW5pdCgmdGVzdC0+bG9j
ayk7Cj4gPiArICAgICB0ZXN0LT5uYW1lID0gbmFtZTsKPiA+ICsgICAgIHRlc3QtPnN1Y2Nlc3Mg
PSB0cnVlOwo+ID4gK30KPgo+IEFuZCB5ZXQgaGVyZSB5b3UgaW5pdGlhbGl6ZSBhIHNwaW4gbG9j
ay4uLiBUaGlzIHdvbid0IGNvbXBpbGUuIFNlZW1zCj4geW91IGZvcmdvdCB0byByZW1vdmUgdGhp
cyBsaW5lLiBTbyBJIGd1ZXNzIGEgcmUtc3BpbiBpcyBiZXR0ZXIuCgpPaCBjcmFwLCBzb3JyeSBh
Ym91dCB0aGF0LiBZb3UgY2FuJ3QgY29tcGlsZSB0aGVzZSBwYXRjaGVzIHVudGlsIHRoZQprYnVp
bGQgcGF0Y2guIEkgd2lsbCBmaXggdGhpcyBhbmQgbWFrZSBzdXJlIEkgZGlkbid0IG1ha2UgYW55
IHNpbWlsYXIKbWlzdGFrZXMgb24gdGhlc2UgZWFybHkgcGF0Y2hlcy4KClRoYW5rcyEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
