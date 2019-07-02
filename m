Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F55D5AD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 19:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50D989904;
	Tue,  2 Jul 2019 17:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C204289904
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 17:53:02 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id m4so8054803pgk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 10:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUzLBUlR97uqGXzOFylb6nkkxBtyYZ1OhN+qvdTrCD0=;
 b=a242AJai8TOLKWANaWTcgmzaMRehDbaX0dQmf5ZcFSUvE9SnGIJ4VZO2tma/lrkZ28
 AWIlNY9jEkeXAGDXoQIl2/QrLEfSOYt3/6IPxAkDhmDABlG7B3q+r/z0EUR95iWO3cNQ
 HdSscKlSij+XmTpqN/xbu2hjgxMZLlGBXERXuQjnNgt5Acf4Gzky19h7+YCmxAFsxdv+
 OKvkK+yIfDZyGY3eUT7LtZARMLipZlLBpyX6uZVaRUate/nEQcm9prLoTFQojNHRpxEi
 SAEpdLRPBFfi4qmt3JX9Ww2upzcJ9dxNGqS1syX8MokhM6eWF5eN/G6zi2Rk7x6MZMY2
 peiQ==
X-Gm-Message-State: APjAAAWxz/JlAg2aGgSB5v4aOIlcCsd45NbZya8UxZ7Q5C3B8XKL97Xc
 9IHCB9CdYi6KyTyO9+H0+yAEaZnF5GJSctRBeIE5Iw==
X-Google-Smtp-Source: APXvYqw1QIOarVsPwN3Ymzn8KxtORstMAVkiFcCA6YNhVqWiDT/WJraRMIndv08KnJT+5qaDY4tAvp9OnwXy65WsZqM=
X-Received: by 2002:a63:205f:: with SMTP id r31mr23471478pgm.159.1562089981635; 
 Tue, 02 Jul 2019 10:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-8-brendanhiggins@google.com>
 <20190625232249.GS19023@42.do-not-panic.com>
 <CAFd5g46mnd=a0OqFCx0hOHX+DxW+5yA2LXH5Q0gEg8yUZK=4FA@mail.gmail.com>
In-Reply-To: <CAFd5g46mnd=a0OqFCx0hOHX+DxW+5yA2LXH5Q0gEg8yUZK=4FA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 2 Jul 2019 10:52:50 -0700
Message-ID: <CAFd5g46=7OQDREdLDTiMgVWq-Xj2zfOw8cRhPJEihSbO89MDyA@mail.gmail.com>
Subject: Re: [PATCH v5 07/18] kunit: test: add initial tests
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cUzLBUlR97uqGXzOFylb6nkkxBtyYZ1OhN+qvdTrCD0=;
 b=roBJOIwXGuFOf1wltfxmsClcFxlkrjzp9+21T7P87pZ44BH/GjP/X/NuZ8mK2FoMzO
 XotmCr6d6KsdJATAIIUbq5Oy4zR4Azgkp4HhOE4XiupuZAs2/ZBggUQTxGqGQNrNXKUR
 RK1F2iELvIHqPezIMEexxn9HQjKb0Q7OjYsSgJwmHDUbD4xwBf6WQFlfeS4XFqE89Pff
 n78AWxKci0ljIJl3H7X5khQxePoPu8jM9jZ95VMb0Zsz46NlIICQ2qPhYIcCIBC8U20Z
 P1PLSOLwoWTdUhh3getWGZNkHFehqyZ7w/vmIfDcbd6OQGJv5O6KIgY9x4cjlJKaYt87
 yyiQ==
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTI6NTMgQU0gQnJlbmRhbiBIaWdnaW5zCjxicmVuZGFu
aGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDQ6
MjIgUE0gTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDAxOjI2OjAyQU0gLTA3MDAsIEJyZW5kYW4gSGlnZ2lu
cyB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL2t1bml0L2V4YW1wbGUtdGVzdC5jIGIva3VuaXQv
ZXhhbXBsZS10ZXN0LmMKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAw
MDAwMDAwMDAwMC4uZjQ0YjhlY2U0ODhiYgo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBi
L2t1bml0L2V4YW1wbGUtdGVzdC5jCj4gPgo+ID4gPC0tIHNuaXAgLS0+Cj4gPgo+ID4gPiArLyoK
PiA+ID4gKyAqIFRoaXMgZGVmaW5lcyBhIHN1aXRlIG9yIGdyb3VwaW5nIG9mIHRlc3RzLgo+ID4g
PiArICoKPiA+ID4gKyAqIFRlc3QgY2FzZXMgYXJlIGRlZmluZWQgYXMgYmVsb25naW5nIHRvIHRo
ZSBzdWl0ZSBieSBhZGRpbmcgdGhlbSB0bwo+ID4gPiArICogYGt1bml0X2Nhc2VzYC4KPiA+ID4g
KyAqCj4gPiA+ICsgKiBPZnRlbiBpdCBpcyBkZXNpcmFibGUgdG8gcnVuIHNvbWUgZnVuY3Rpb24g
d2hpY2ggd2lsbCBzZXQgdXAgdGhpbmdzIHdoaWNoCj4gPiA+ICsgKiB3aWxsIGJlIHVzZWQgYnkg
ZXZlcnkgdGVzdDsgdGhpcyBpcyBhY2NvbXBsaXNoZWQgd2l0aCBhbiBgaW5pdGAgZnVuY3Rpb24K
PiA+ID4gKyAqIHdoaWNoIHJ1bnMgYmVmb3JlIGVhY2ggdGVzdCBjYXNlIGlzIGludm9rZWQuIFNp
bWlsYXJseSwgYW4gYGV4aXRgIGZ1bmN0aW9uCj4gPiA+ICsgKiBtYXkgYmUgc3BlY2lmaWVkIHdo
aWNoIHJ1bnMgYWZ0ZXIgZXZlcnkgdGVzdCBjYXNlIGFuZCBjYW4gYmUgdXNlZCB0byBmb3IKPiA+
ID4gKyAqIGNsZWFudXAuIEZvciBjbGFyaXR5LCBydW5uaW5nIHRlc3RzIGluIGEgdGVzdCBtb2R1
bGUgd291bGQgYmVoYXZlIGFzIGZvbGxvd3M6Cj4gPiA+ICsgKgo+ID4KPiA+IFRvIGJlIGNsZWFy
IHRoaXMgaXMgbm90IHRoZSBrZXJuZWwgbW9kdWxlIGluaXQsIGJ1dCByYXRoZXIgdGhlIGt1bml0
Cj4gPiBtb2R1bGUgaW5pdC4gSSB0aGluayB1c2luZyBrbW9kdWxlIHdvdWxkIG1ha2UgdGhpcyBj
bGVhcmVyIHRvIGEgcmVhZGVyLgo+Cj4gU2VlbXMgcmVhc29uYWJsZS4gV2lsbCBmaXggaW4gbmV4
dCByZXZpc2lvbi4KPgo+ID4gPiArICogbW9kdWxlLmluaXQodGVzdCk7Cj4gPiA+ICsgKiBtb2R1
bGUudGVzdF9jYXNlWzBdKHRlc3QpOwo+ID4gPiArICogbW9kdWxlLmV4aXQodGVzdCk7Cj4gPiA+
ICsgKiBtb2R1bGUuaW5pdCh0ZXN0KTsKPiA+ID4gKyAqIG1vZHVsZS50ZXN0X2Nhc2VbMV0odGVz
dCk7Cj4gPiA+ICsgKiBtb2R1bGUuZXhpdCh0ZXN0KTsKPiA+ID4gKyAqIC4uLjsKPiA+ID4gKyAq
LwoKRG8geW91IHRoaW5rIGl0IG1pZ2h0IGJlIGNsZWFyZXIgeWV0IHRvIHJlbmFtZSBgc3RydWN0
IGt1bml0X21vZHVsZQoqbW9kdWxlO2AgdG8gYHN0cnVjdCBrdW5pdF9zdWl0ZSAqc3VpdGU7YD8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
