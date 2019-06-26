Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EF563BE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AF26E2BA;
	Wed, 26 Jun 2019 07:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDA06E2BA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:53:30 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t7so966804plr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 00:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JHqsYYLzLAosbxbz1ZkSkQroLN+I/zt1AzacawmONrY=;
 b=UVYDGyBCLRrmCl2dETbb2Efa23mTua7Bze0Toa8LWWmsO7qjGjwr2mjQhC9oVAvg8w
 hC7Icx7BrRphH0QOK/g9QBLAenKptf8tEJjOjWWlVImsIPBidnNeF9O9FyrXvvjJhxCr
 YqtF5qUatgJhZlMVE4GpsGcJ79a/on/+IWUE7PXviDMJaiZhvokGXD7NmO+ER3keq6Z7
 ivcNHFQMKdL7nkDCCytCEhaHiKS/y7q29OvKUKGPPuUyy5VQIzjYOr8ic74L5Sl3L77c
 qSy85ga6641wHffN7Ujvz6ipK5PgzakBeqbI0H0OqIvNqNg872Ggm01cXjdja8Ji0KPx
 x0yw==
X-Gm-Message-State: APjAAAVNfwPbhyekOrdj2VlnHAOqTUAJNcuhtyN9siXHQhFbxMGjXgri
 7qZIozafANyciZ4Df3hTnS8HbLYG7D94mEaN7JQ29w==
X-Google-Smtp-Source: APXvYqx0OC49B+0u9fYvW2+xXIuYcGfgocchgfhlK03aaHz2u6I5PoagyCc52QVITc8deDrbZKlEXXtykOtZNEDzro4=
X-Received: by 2002:a17:902:1004:: with SMTP id
 b4mr3862082pla.325.1561535609164; 
 Wed, 26 Jun 2019 00:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-8-brendanhiggins@google.com>
 <20190625232249.GS19023@42.do-not-panic.com>
In-Reply-To: <20190625232249.GS19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 26 Jun 2019 00:53:18 -0700
Message-ID: <CAFd5g46mnd=a0OqFCx0hOHX+DxW+5yA2LXH5Q0gEg8yUZK=4FA@mail.gmail.com>
Subject: Re: [PATCH v5 07/18] kunit: test: add initial tests
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JHqsYYLzLAosbxbz1ZkSkQroLN+I/zt1AzacawmONrY=;
 b=WyqM1jV2u/kxM67gNNChMCD/srWLt8UFxif+PHuGpzbgE3LpTJrt7rEbevH6EDg7EA
 xF8tH7Jbh3PLlZYXRvyhQyTIN9G45hD9SE3+nPI4rxVnH9lZ6Wb6PT2UPR9Z7e8qw5Vo
 j4hYPGbTDYxJLGb6+arVCfAloAtiPanpPW4Xadwr7qterJdRgNGgoWGT+JtgLvBc9l+M
 DYSnM5SC1DrNcCapOU3OT8L/UFesJC+ezl51GMqT04qGxB9qB/8ifxdT+misqvwEisfJ
 +/kivnaJfyaOnnN1uM1pke3PaHrKRWJDezKNt97NibKS5p1mAANOOVhiidQQgXRP+WeK
 EcUQ==
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNDoyMiBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwMToyNjowMkFN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEva3VuaXQvZXhh
bXBsZS10ZXN0LmMgYi9rdW5pdC9leGFtcGxlLXRlc3QuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmY0NGI4ZWNlNDg4YmIKPiA+IC0tLSAvZGV2L251
bGwKPiA+ICsrKyBiL2t1bml0L2V4YW1wbGUtdGVzdC5jCj4KPiA8LS0gc25pcCAtLT4KPgo+ID4g
Ky8qCj4gPiArICogVGhpcyBkZWZpbmVzIGEgc3VpdGUgb3IgZ3JvdXBpbmcgb2YgdGVzdHMuCj4g
PiArICoKPiA+ICsgKiBUZXN0IGNhc2VzIGFyZSBkZWZpbmVkIGFzIGJlbG9uZ2luZyB0byB0aGUg
c3VpdGUgYnkgYWRkaW5nIHRoZW0gdG8KPiA+ICsgKiBga3VuaXRfY2FzZXNgLgo+ID4gKyAqCj4g
PiArICogT2Z0ZW4gaXQgaXMgZGVzaXJhYmxlIHRvIHJ1biBzb21lIGZ1bmN0aW9uIHdoaWNoIHdp
bGwgc2V0IHVwIHRoaW5ncyB3aGljaAo+ID4gKyAqIHdpbGwgYmUgdXNlZCBieSBldmVyeSB0ZXN0
OyB0aGlzIGlzIGFjY29tcGxpc2hlZCB3aXRoIGFuIGBpbml0YCBmdW5jdGlvbgo+ID4gKyAqIHdo
aWNoIHJ1bnMgYmVmb3JlIGVhY2ggdGVzdCBjYXNlIGlzIGludm9rZWQuIFNpbWlsYXJseSwgYW4g
YGV4aXRgIGZ1bmN0aW9uCj4gPiArICogbWF5IGJlIHNwZWNpZmllZCB3aGljaCBydW5zIGFmdGVy
IGV2ZXJ5IHRlc3QgY2FzZSBhbmQgY2FuIGJlIHVzZWQgdG8gZm9yCj4gPiArICogY2xlYW51cC4g
Rm9yIGNsYXJpdHksIHJ1bm5pbmcgdGVzdHMgaW4gYSB0ZXN0IG1vZHVsZSB3b3VsZCBiZWhhdmUg
YXMgZm9sbG93czoKPiA+ICsgKgo+Cj4gVG8gYmUgY2xlYXIgdGhpcyBpcyBub3QgdGhlIGtlcm5l
bCBtb2R1bGUgaW5pdCwgYnV0IHJhdGhlciB0aGUga3VuaXQKPiBtb2R1bGUgaW5pdC4gSSB0aGlu
ayB1c2luZyBrbW9kdWxlIHdvdWxkIG1ha2UgdGhpcyBjbGVhcmVyIHRvIGEgcmVhZGVyLgoKU2Vl
bXMgcmVhc29uYWJsZS4gV2lsbCBmaXggaW4gbmV4dCByZXZpc2lvbi4KCj4gPiArICogbW9kdWxl
LmluaXQodGVzdCk7Cj4gPiArICogbW9kdWxlLnRlc3RfY2FzZVswXSh0ZXN0KTsKPiA+ICsgKiBt
b2R1bGUuZXhpdCh0ZXN0KTsKPiA+ICsgKiBtb2R1bGUuaW5pdCh0ZXN0KTsKPiA+ICsgKiBtb2R1
bGUudGVzdF9jYXNlWzFdKHRlc3QpOwo+ID4gKyAqIG1vZHVsZS5leGl0KHRlc3QpOwo+ID4gKyAq
IC4uLjsKPiA+ICsgKi8KPgo+ICAgTHVpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
