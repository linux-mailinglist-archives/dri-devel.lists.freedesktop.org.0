Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CCC8D03B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 12:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EF66E4B2;
	Wed, 14 Aug 2019 10:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A2E6E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:04:00 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id g2so53295466pfq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8hpxCTzvYAcZn9UvY3kAbimH8cB/wVPQT2NUqi4FTg=;
 b=t1g0PnB3Ki7jgOe3KjqOGQZsMo1w3DJzRxmoDGPJJYkWjpr5N53m3JzvfT1rnmS6Eb
 khTOpqx1/ij6IUij5FcJPbz7Ubt8eQjRNyskvBd+nPR+lFRh2mzXu9Vn5YUOE78dj3Wl
 wcoHfD0IittkwHpnQVUI5I8QQgp4MuQiyFBz7CVlJBy8AvvvoJQNXolKkVWqpx0b4eok
 X8PjS+1z8tFC9lHshMaWkpenFISsAmjrwUSrP7BCuKDadslQbv1EA8YmWzdZFKiM+hX8
 pq+urjIF/zgqfUE9gUqbwi9U+YNvwylgx/0eSsFH4Xp3VS+lmO9Zi899vlLLvEHZk2Mx
 45yw==
X-Gm-Message-State: APjAAAWnB07X5P4BWjosvqMB1fy7CGdWTHAFnu0fl9hB9HU/UOur3/MS
 rlAnJqlJhEY1Ddt0jGT8PA63xuTIMkSVvfpst7RVmw==
X-Google-Smtp-Source: APXvYqxyXqiNwjdTK3oFKny5yM7CmoKjVDpDDnZBrvH4fSE28h1/JfZ1mGpG1xfSCFWK+kgS1gJNI6SNjgBRmNUJeQM=
X-Received: by 2002:a63:205f:: with SMTP id r31mr36074127pgm.159.1565777039574; 
 Wed, 14 Aug 2019 03:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 14 Aug 2019 03:03:47 -0700
Message-ID: <CAFd5g45NdQEcP0JQpZc3HYYgNZfsBsHL+ByXRK+OupWObwMuqg@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Luis Chamberlain <mcgrof@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 shuah <shuah@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A8hpxCTzvYAcZn9UvY3kAbimH8cB/wVPQT2NUqi4FTg=;
 b=mX9zQWTJ21YVDsg/IO/lw3vK/5gRG1WKeYfq5hAVfRdrbxBQb/LOP7585An8TcS5uX
 tQfD//4o9HuUJa0OuyeBf0yYOxvzPAaOMjQC0e2XsG/XzCmrU1JU4X/cHR16Fl4JFHLe
 Zi0Tt+GUrI9Wq+kCxNmISk1ZO0HC18yrn6Nwe48kfT9CiA+xyYq2zY+VKjPraHI0VO+y
 z/s0hx02KzWhdnSkkt85Mam6mmVNYQ/kS61kWPXi/v/57imnYMdAPEqFsVlbDExrl+Ld
 2hdI8g4c1e8Cjj/bm8uvF1dfC8bBYtWFJT7eA1eUTgYFQ5SiQc/BI8jH+SCjQE2t4VrR
 5trQ==
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
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Bjorn Helgaas <bhelgaas@google.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTA6NTIgUE0gQnJlbmRhbiBIaWdnaW5zCjxicmVuZGFu
aGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+ICMjIFRMO0RSCj4KPiBUaGlzIHJldmlzaW9u
IGFkZHJlc3NlcyBjb21tZW50cyBmcm9tIFN0ZXBoZW4gYW5kIEJqb3JuIEhlbGdhYXMuIE1vc3QK
PiBjaGFuZ2VzIGFyZSBwcmV0dHkgbWlub3Igc3R1ZmYgdGhhdCBkb2Vzbid0IGFmZmVjdCB0aGUg
QVBJIGluIGFueXdheS4KPiBPbmUgc2lnbmlmaWNhbnQgY2hhbmdlLCBob3dldmVyLCBpcyB0aGF0
IEkgYWRkZWQgc3VwcG9ydCBmb3IgZnJlZWluZwo+IGt1bml0X3Jlc291cmNlIG1hbmFnZWQgcmVz
b3VyY2VzIGJlZm9yZSB0aGUgdGVzdCBjYXNlIGlzIGZpbmlzaGVkIHZpYQo+IGt1bml0X3Jlc291
cmNlX2Rlc3Ryb3koKS4gQWRkaXRpb25hbGx5LCBCam9ybiBwb2ludGVkIG91dCB0aGF0IEkgYnJv
a2UKPiBLVW5pdCBvbiBjZXJ0YWluIGNvbmZpZ3VyYXRpb25zIChsaWtlIHRoZSBkZWZhdWx0IG9u
ZSBmb3IgeDg2LCB3aG9vcHMpLgo+Cj4gQmFzZWQgb24gU3RlcGhlbidzIGZlZWRiYWNrIG9uIHRo
ZSBwcmV2aW91cyBjaGFuZ2UsIEkgdGhpbmsgd2UgYXJlCj4gcHJldHR5IGNsb3NlLiBJIGFtIG5v
dCBleHBlY3RpbmcgYW55IHNpZ25pZmljYW50IGNoYW5nZXMgZnJvbSBoZXJlIG9uCj4gb3V0LgoK
U3RlcGhlbiwgaXQgbG9va3MgbGlrZSB5b3UgaGF2ZSBqdXN0IHJlcGxpZWQgd2l0aCAiUmV2aWV3
ZWQtYnlzIiBvbgphbGwgdGhlIHJlbWFpbmluZyBlbWFpbHMgdGhhdCB5b3UgbG9va2VkIGF0LiBJ
cyB0aGVyZSBhbnl0aGluZyBlbHNlCnRoYXQgd2UgYXJlIG1pc3Npbmc/IE9yIGlzIHRoaXMgcmVh
ZHkgZm9yIFNodWFoIHRvIGFwcGx5PwoKWy4uLl0KCkNoZWVycyEKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
