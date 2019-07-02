Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1A55D7AD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 22:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017316E092;
	Tue,  2 Jul 2019 20:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3CB6E092
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 20:57:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z75so8284718pgz.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 13:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DtQmDM1bjxYXcqNKxDIhe3kpTPPYxiOv+5lbfQfOZdE=;
 b=tu/1E0+oURyWwVW8QUVKcJYW/2mm2lNMkreDd178m2LxlApEia0ZxQDtD/ayFowGKs
 9mgqFepeoyQMNAVQ/HNZD99plzJWrPmEN265heEmvW8EP6rYEuFK0ZyTT7SH+cu35A2v
 m9vzOu+jRWaUnnZjMHwZzsCMPMD0o6Ml3N6tkytuBXHEfLP2EZZeVVrFjFKaIjfcOznH
 0BkEsg/VAtbjt8xukk7quyTOKRWf7jQdgVamEPoT1D5A8wssrRhB9XdaNap1/R0aqeyE
 KsUQUViOA4M0qlF1NXTxj0fZXwmytXxEZNXJ1/tZlB10yAap97FxV6JgCLvC7vLI1KGW
 1U2w==
X-Gm-Message-State: APjAAAXPP9Z27gYx+7gbtcJE3IhHQWLaF5f8Ahw+I3Xuh2gI8/7I/S5/
 Dx+kBU23xQOnq1YftDwRdu8=
X-Google-Smtp-Source: APXvYqxgfIVc55JlioUk1yKtSLmO9ntomZUFE6/lH8QIzZr758B9lCLwgU+mAmopE2kMlm4WWSK35A==
X-Received: by 2002:a63:f342:: with SMTP id t2mr30570356pgj.83.1562101035558; 
 Tue, 02 Jul 2019 13:57:15 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id d26sm16963231pfn.29.2019.07.02.13.57.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:57:13 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id DC91A40251; Tue,  2 Jul 2019 20:57:12 +0000 (UTC)
Date: Tue, 2 Jul 2019 20:57:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 07/18] kunit: test: add initial tests
Message-ID: <20190702205712.GS19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-8-brendanhiggins@google.com>
 <20190625232249.GS19023@42.do-not-panic.com>
 <CAFd5g46mnd=a0OqFCx0hOHX+DxW+5yA2LXH5Q0gEg8yUZK=4FA@mail.gmail.com>
 <CAFd5g46=7OQDREdLDTiMgVWq-Xj2zfOw8cRhPJEihSbO89MDyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g46=7OQDREdLDTiMgVWq-Xj2zfOw8cRhPJEihSbO89MDyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMTA6NTI6NTBBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDEyOjUzIEFNIEJyZW5kYW4gSGlnZ2lu
cwo+IDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEp1
biAyNSwgMjAxOSBhdCA0OjIyIFBNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjY6MDJBTSAt
MDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9rdW5pdC9l
eGFtcGxlLXRlc3QuYyBiL2t1bml0L2V4YW1wbGUtdGVzdC5jCj4gPiA+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5mNDRiOGVjZTQ4OGJiCj4gPiA+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL2t1bml0L2V4YW1wbGUtdGVzdC5jCj4gPiA+
Cj4gPiA+IDwtLSBzbmlwIC0tPgo+ID4gPgo+ID4gPiA+ICsvKgo+ID4gPiA+ICsgKiBUaGlzIGRl
ZmluZXMgYSBzdWl0ZSBvciBncm91cGluZyBvZiB0ZXN0cy4KPiA+ID4gPiArICoKPiA+ID4gPiAr
ICogVGVzdCBjYXNlcyBhcmUgZGVmaW5lZCBhcyBiZWxvbmdpbmcgdG8gdGhlIHN1aXRlIGJ5IGFk
ZGluZyB0aGVtIHRvCj4gPiA+ID4gKyAqIGBrdW5pdF9jYXNlc2AuCj4gPiA+ID4gKyAqCj4gPiA+
ID4gKyAqIE9mdGVuIGl0IGlzIGRlc2lyYWJsZSB0byBydW4gc29tZSBmdW5jdGlvbiB3aGljaCB3
aWxsIHNldCB1cCB0aGluZ3Mgd2hpY2gKPiA+ID4gPiArICogd2lsbCBiZSB1c2VkIGJ5IGV2ZXJ5
IHRlc3Q7IHRoaXMgaXMgYWNjb21wbGlzaGVkIHdpdGggYW4gYGluaXRgIGZ1bmN0aW9uCj4gPiA+
ID4gKyAqIHdoaWNoIHJ1bnMgYmVmb3JlIGVhY2ggdGVzdCBjYXNlIGlzIGludm9rZWQuIFNpbWls
YXJseSwgYW4gYGV4aXRgIGZ1bmN0aW9uCj4gPiA+ID4gKyAqIG1heSBiZSBzcGVjaWZpZWQgd2hp
Y2ggcnVucyBhZnRlciBldmVyeSB0ZXN0IGNhc2UgYW5kIGNhbiBiZSB1c2VkIHRvIGZvcgo+ID4g
PiA+ICsgKiBjbGVhbnVwLiBGb3IgY2xhcml0eSwgcnVubmluZyB0ZXN0cyBpbiBhIHRlc3QgbW9k
dWxlIHdvdWxkIGJlaGF2ZSBhcyBmb2xsb3dzOgo+ID4gPiA+ICsgKgo+ID4gPgo+ID4gPiBUbyBi
ZSBjbGVhciB0aGlzIGlzIG5vdCB0aGUga2VybmVsIG1vZHVsZSBpbml0LCBidXQgcmF0aGVyIHRo
ZSBrdW5pdAo+ID4gPiBtb2R1bGUgaW5pdC4gSSB0aGluayB1c2luZyBrbW9kdWxlIHdvdWxkIG1h
a2UgdGhpcyBjbGVhcmVyIHRvIGEgcmVhZGVyLgo+ID4KPiA+IFNlZW1zIHJlYXNvbmFibGUuIFdp
bGwgZml4IGluIG5leHQgcmV2aXNpb24uCj4gPgo+ID4gPiA+ICsgKiBtb2R1bGUuaW5pdCh0ZXN0
KTsKPiA+ID4gPiArICogbW9kdWxlLnRlc3RfY2FzZVswXSh0ZXN0KTsKPiA+ID4gPiArICogbW9k
dWxlLmV4aXQodGVzdCk7Cj4gPiA+ID4gKyAqIG1vZHVsZS5pbml0KHRlc3QpOwo+ID4gPiA+ICsg
KiBtb2R1bGUudGVzdF9jYXNlWzFdKHRlc3QpOwo+ID4gPiA+ICsgKiBtb2R1bGUuZXhpdCh0ZXN0
KTsKPiA+ID4gPiArICogLi4uOwo+ID4gPiA+ICsgKi8KPiAKPiBEbyB5b3UgdGhpbmsgaXQgbWln
aHQgYmUgY2xlYXJlciB5ZXQgdG8gcmVuYW1lIGBzdHJ1Y3Qga3VuaXRfbW9kdWxlCj4gKm1vZHVs
ZTtgIHRvIGBzdHJ1Y3Qga3VuaXRfc3VpdGUgKnN1aXRlO2A/CgpZZXMuIERlZmluaXRlbHkuIE9y
IHN0cnVjdCBrdW5pdF90ZXN0LiBVcCB0byB5b3UuCgogIEx1aXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
