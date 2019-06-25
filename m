Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2351655AD7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 00:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6DD6E25D;
	Tue, 25 Jun 2019 22:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFED96E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 22:14:57 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id y72so118794pgd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 15:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3T/u7V091HbAklhSEBy2pvLlCGAKMdVNlTSclQyRnpc=;
 b=qQSwpWiqHOpLGd6zFxrVJRP7i/0HS6Z3QFQAfbSKp6MXFZnj3hVCV0xIMW1nYfaTby
 ucVAylVRihx7IRkPhw1izjReJpJ3yOQsm7agWjIL3X+ODAlVoQjdyh1IWcid447e9yEg
 n1vltu+oV6vZsawW8Ceti7r/WXa2GM0W4e8KphI1irfUu/x9O5X4fJpwSACEP58MHygu
 ImJDDd9MCR9byXQE8YLkqjf5xiT6YInHcuWRLEJNzDtdRQc1cr761tsqaW4Ps9zn3dMk
 QFS3fDSWI4uVa1Zx65hYQSgQqb1/DFmWwsv21safrLN5HR/5RBk7d8wel97qmlVHKrR9
 6BAQ==
X-Gm-Message-State: APjAAAVzOlWrScsy8udYXCYRsO/Ej5C71mWXl8LLbPofbr21ssZvnyrl
 s8Cd7FijZq5U4qpgt8KQ/8FcLWpBqCp0QTFL6u52qw==
X-Google-Smtp-Source: APXvYqzlEoDZX+cOnuipK7PjmAMWm3uFqbtUZEXyCZSNz1gEBa4cWncDmW9O+QuwSqz4K1dG1pGT/q+vccTvIeTjlVo=
X-Received: by 2002:a63:1459:: with SMTP id 25mr40704314pgu.201.1561500896729; 
 Tue, 25 Jun 2019 15:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
 <20190625214427.GN19023@42.do-not-panic.com>
In-Reply-To: <20190625214427.GN19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Jun 2019 15:14:45 -0700
Message-ID: <CAFd5g47OABqN127cPKqoCOA_Wr9w=LFh_0XkF7LXu2iY9sFkSw@mail.gmail.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3T/u7V091HbAklhSEBy2pvLlCGAKMdVNlTSclQyRnpc=;
 b=ZoosysAkLc7RgErWxK5FnvM9RfcOs6mWm5WOqtPjUqxIqHpReyhsVFvslRzLoV3q6k
 miAcaLs/6/zELponnm9xpGa9FZgG6JHCtwbwwbsHrYPAVLPTXKnsAGZekzo/1E+v3r7q
 MAyz+XT8oIYL+RBKU6gcMfBPkx0i9G9kx5C+icFSHWtjKBEQssSIkQPmyDMJkhDb/APn
 rRRqx5pehUt6wHDwbMbahfsOf2X1S8Q3jv4bjOdkgKsJGdYPvje9VOWjIuTF7Q/SCVfF
 wDn/9hiMVLqSYlkj9TG58JxRLAwgxPn7xvEpgJy0gDIbJSP6wZCqkWFGLqYmeLIB06YQ
 qR2w==
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMjo0NCBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwMToyODoyNVBN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBh
dCA1OjE1IFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA2LTE3IDAxOjI1OjU2KQo+ID4gPiA+
IGRpZmYgLS1naXQgYS9rdW5pdC90ZXN0LmMgYi9rdW5pdC90ZXN0LmMKPiA+ID4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmQwNWQyNTRmMTUyMWYK
PiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIva3VuaXQvdGVzdC5jCj4gPiA+ID4g
QEAgLTAsMCArMSwyMTAgQEAKPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKPiA+ID4gPiArLyoKPiA+ID4gPiArICogQmFzZSB1bml0IHRlc3QgKEtVbml0KSBBUEku
Cj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29vZ2xlIExMQy4K
PiA+ID4gPiArICogQXV0aG9yOiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2ds
ZS5jb20+Cj4gPiA+ID4gKyAqLwo+ID4gPiA+ICsKPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3Nj
aGVkL2RlYnVnLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxrdW5pdC90ZXN0Lmg+Cj4gPiA+ID4gKwo+
ID4gPiA+ICtzdGF0aWMgYm9vbCBrdW5pdF9nZXRfc3VjY2VzcyhzdHJ1Y3Qga3VuaXQgKnRlc3Qp
Cj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPiA+ID4g
KyAgICAgICBib29sIHN1Y2Nlc3M7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgc3Bpbl9sb2Nr
X2lycXNhdmUoJnRlc3QtPmxvY2ssIGZsYWdzKTsKPiA+ID4gPiArICAgICAgIHN1Y2Nlc3MgPSB0
ZXN0LT5zdWNjZXNzOwo+ID4gPiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdGVz
dC0+bG9jaywgZmxhZ3MpOwo+ID4gPgo+ID4gPiBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgdGhl
IGxvY2tpbmcgc2NoZW1lIGluIHRoaXMgY29kZS4gSXMgdGhlCj4gPiA+IGludGVudGlvbiB0byBt
YWtlIGdldHRlciBhbmQgc2V0dGVyIEFQSXMgdGhhdCBhcmUgInNhZmUiIGJ5IGFkZGluZyBpbiBh
Cj4gPiA+IHNwaW5sb2NrIHRoYXQgaXMgaGVsZCBhcm91bmQgZ2V0dGluZyBhbmQgc2V0dGluZyB2
YXJpb3VzIG1lbWJlcnMgaW4gdGhlCj4gPiA+IGt1bml0IHN0cnVjdHVyZT8KPiA+Cj4gPiBZZXMs
IHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBJdCBpcyBwb3NzaWJsZSBmb3IgYSB1c2Vy
IHRvIHdyaXRlCj4gPiBhIHRlc3Qgc3VjaCB0aGF0IGNlcnRhaW4gZWxlbWVudHMgbWF5IGJlIHVw
ZGF0ZWQgaW4gZGlmZmVyZW50IHRocmVhZHM7Cj4gPiB0aGlzIHdvdWxkIG1vc3QgbGlrZWx5IGhh
cHBlbiBpbiB0aGUgY2FzZSB3aGVyZSBzb21lb25lIHdhbnRzIHRvIG1ha2UKPiA+IGFuIGFzc2Vy
dGlvbiBvciBhbiBleHBlY3RhdGlvbiBpbiBhIHRocmVhZCBjcmVhdGVkIGJ5IGEgcGllY2Ugb2Yg
Y29kZQo+ID4gdW5kZXIgdGVzdC4gQWx0aG91Z2ggdGhpcyBzaG91bGQgZ2VuZXJhbGx5IGJlIGF2
b2lkZWQsIGl0IGlzIHBvc3NpYmxlLAo+ID4gYW5kIHRoZXJlIGFyZSBvY2Nhc2lvbmFsbHkgZ29v
ZCByZWFzb25zIHRvIGRvIHNvLCBzbyBpdCBpcwo+ID4gZnVuY3Rpb25hbGl0eSB0aGF0IHdlIHNo
b3VsZCBzdXBwb3J0Lgo+ID4KPiA+IERvIHlvdSB0aGluayBJIHNob3VsZCBhZGQgYSBjb21tZW50
IHRvIHRoaXMgZWZmZWN0Pwo+ID4KPiA+ID4gSW4gd2hhdCBzaXR1YXRpb24gaXMgdGhlcmUgbW9y
ZSB0aGFuIG9uZSB0aHJlYWQgcmVhZGluZyBvciB3cml0aW5nIHRoZQo+ID4gPiBrdW5pdCBzdHJ1
Y3Q/IElzbid0IGl0IG9ubHkgYSBzaW5nbGUgcHJvY2VzcyB0aGF0IGlzIGdvaW5nIHRvIGJlCj4g
Pgo+ID4gQXMgSSBzYWlkIGFib3ZlLCBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZSBjb2RlIHVuZGVy
IHRlc3QgbWF5IHNwYXduIGEKPiA+IG5ldyB0aHJlYWQgdGhhdCBtYXkgbWFrZSBhbiBleHBlY3Rh
dGlvbiBvciBhbiBhc3NlcnRpb24uIEl0IGlzIG5vdCBhCj4gPiBzdXBlciBjb21tb24gdXNlIGNh
c2UsIGJ1dCBpdCBpcyBwb3NzaWJsZS4KPgo+IEkgd29uZGVyIGlmIGl0IGlzIHdvcnRoIHRvIGhh
dmUgdGhlbiBkaWZmZXJlbnQgdHlwZXMgb2YgdGVzdHMgYmFzZWQgb24KPiBsb2NraW5nIHJlcXVp
cmVtZW50cy4gT25lIHdpdGggbm8gbG9ja2luZywgc2luY2UgaXQgc2VlbXMgeW91IGltcGx5Cj4g
bW9zdCB0ZXN0cyB3b3VsZCBmYWxsIHVuZGVyIHRoaXMgY2F0ZWdvcnksIHRoZW4gbG9ja2luZywg
YW5kIGFub3RoZXIKPiB3aXRoIElSUSBjb250ZXh0Lgo+Cj4gSWYgbm8gbG9ja2luZyBpcyBkb25l
IGF0IGFsbCBmb3IgYWxsIHRlc3RzIHdoaWNoIGRvIG5vdCByZXF1aXJlIGxvY2tpbmcsCj4gaXMg
dGhlcmUgYW55IGdhaW5zIGF0IHJ1biB0aW1lPyBJJ20gc3VyZSBpdCBtaWdodCBiZSBtaW5pbXVt
IGJ1dAo+IGN1cmlvdXMuCgpZZWFoLCBJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnRoIGl0LgoKSSBk
b24ndCB0aGluayB3ZSBuZWVkIHRvIGJlIHNxdWVlemluZyBldmVyeSBvdW5jZSBvZiBwZXJmb3Jt
YW5jZSBvdXQKb2YgdW5pdCB0ZXN0cywgc2luY2UgdGhleSBhcmUgaW5oZXJlbnRseSBhIGNvc3Qg
YW5kIGFyZSBub3QgaW50ZW5kZWQKdG8gYmUgcnVuIGluIGEgcHJvZHVjdGlvbiBkZXBsb3llZCBr
ZXJuZWwgYXMgcGFydCBvZiBub3JtYWwgcHJvZHVjdGlvbgp1c2FnZS4KCj4gPiA+IG9wZXJhdGlu
ZyBvbiB0aGlzIHN0cnVjdHVyZT8gQW5kIHdoeSBkbyB3ZSBuZWVkIHRvIGRpc2FibGUgaXJxcz8g
QXJlIHdlCj4gPiA+IGV4cGVjdGluZyB0byBiZSBtb2RpZnlpbmcgdGhlIHVuaXQgdGVzdHMgZnJv
bSBpcnEgY29udGV4dHM/Cj4gPgo+ID4gVGhlcmUgYXJlIGluc3RhbmNlcyB3aGVyZSBzb21lb25l
IG1heSB3YW50IHRvIHRlc3QgYSBkcml2ZXIgd2hpY2ggaGFzCj4gPiBhbiBpbnRlcnJ1cHQgaGFu
ZGxlciBpbiBpdC4gSSBhY3R1YWxseSBoYXZlIChub3QgdGhlIGdyZWF0ZXN0KSBleGFtcGxlCj4g
PiBoZXJlLiBOb3cgaW4gdGhlc2UgY2FzZXMsIEkgZXhwZWN0IHNvbWVvbmUgdG8gdXNlIGEgbW9j
ayBpcnFjaGlwIG9yCj4gPiBzb21lIG90aGVyIGZha2UgbWVjaGFuaXNtIHRvIHRyaWdnZXIgdGhl
IGludGVycnVwdCBoYW5kbGVyIGFuZCBub3QKPiA+IGFjdHVhbCBoYXJkd2FyZTsgdGVjaG5pY2Fs
bHkgc3BlYWtpbmcgaW4gdGhpcyBjYXNlLCBpdCBpcyBub3QgZ29pbmcgdG8KPiA+IGJlIGFjY2Vz
c2VkIGZyb20gYSAicmVhbCIgaXJxIGNvbnRleHQ7IGhvd2V2ZXIsIHRoZSBjb2RlIHVuZGVyIHRl
c3QKPiA+IHNob3VsZCB0aGluayB0aGF0IGl0IGlzIGluIGFuIGlycSBjb250ZXh0OyBnaXZlbiB0
aGF0LCBJIGZpZ3VyZWQgaXQgaXMKPiA+IGJlc3QgdG8ganVzdCB0cmVhdCBpdCBhcyBhIHJlYWwg
aXJxIGNvbnRleHQuIERvZXMgdGhhdCBtYWtlIHNlbnNlPwo+Cj4gU2luY2UgaXRzIGEgbmV3IGFy
Y2hpdGVjdHVyZSBhbmQgc2luY2UgeW91IHNlZW0gdG8gaW1wbHkgbW9zdCB0ZXN0cwo+IGRvbid0
IHJlcXVpcmUgbG9ja2luZyBvciBldmVuIElSUXMgZGlzYWJsZWQsIEkgdGhpbmsgaXRzIHdvcnRo
IHRvCj4gY29uc2lkZXIgdGhlIGltcGFjdCBvZiBhZGRpbmcgc3VjaCBleHRyZW1lIGxvY2tpbmcg
cmVxdWlyZW1lbnRzIGZvcgo+IGFuIGluaXRpYWwgcmFtcCB1cC4KCkZhaXIgZW5vdWdoLCBJIGNh
biBzZWUgdGhlIHBvaW50IG9mIG5vdCB3YW50aW5nIHRvIHVzZSBpcnEgZGlzYWJsZWQKdW50aWwg
d2UgZ2V0IHNvbWVvbmUgY29tcGxhaW5pbmcgYWJvdXQgaXQsIGJ1dCBJIHRoaW5rIG1ha2luZyBp
dAp0aHJlYWQgc2FmZSBpcyByZWFzb25hYmxlLiBJdCBtZWFucyB0aGVyZSBpcyBvbmUgbGVzcyB0
aGluZyB0byBjb25mdXNlCmEgS1VuaXQgdXNlciBhbmQgdGhlIG9ubHkgcGVuYWx0eSBwYWlkIGlz
IHNvbWUgdmVyeSBtaW5vciBwZXJmb3JtYW5jZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
