Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FE55A24
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 23:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300186E250;
	Tue, 25 Jun 2019 21:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3901F6E250
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 21:44:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n2so78686pgp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9dxyIPqcP8jDSy0GUtYumC+DRq05muFlYTTdqsbRigE=;
 b=n4F1FJOQ95ieBajVrtUl3bFDggOiqnHiGA8Gx/CH2Pwkb9OhiLXEDAXxPEiEUPS/Ms
 mwcd6Ez0zuOo4TvOnrlRtVwdcPsWFA6nunJW/yroJ0y8ZrqHvLJf2wV3GhS7Irw2uVDJ
 /8MVnKsFH+NvYDYENJ30auL5XdIH6LsuoqEW5VaHAsJWUyr3CXO2ev9JhMF4pjfaQEoo
 bjPTSuLmtae2xW1tGjWULt/acC9rsUAtJOKOzXGg+GQC70NzXN1KxOj0rnHTMSNCy8Ak
 IdgTtutPdKngVTHsKCFTfnYuyr8GUApNm3djwt6o9WsO9MU1r3fSBDG7Wt2FBkSb4XSq
 0S5A==
X-Gm-Message-State: APjAAAUrQ+PtY7gX+mEzalLnZ8yDXw78o5qOVuxMH97uzNjjNLkuQE5l
 S+puRFNqxTr/faTRkmZkPpg=
X-Google-Smtp-Source: APXvYqz8MfGhRhi/dlXuLkoaF1E80HXc/ju/CwZ7//TYZw6Vnsx8tuHl88GSOvVc/go3GBogDeg5Ig==
X-Received: by 2002:a63:7d18:: with SMTP id y24mr36133502pgc.438.1561499069415; 
 Tue, 25 Jun 2019 14:44:29 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id a20sm13423142pgb.72.2019.06.25.14.44.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 14:44:27 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 3C710401EB; Tue, 25 Jun 2019 21:44:27 +0000 (UTC)
Date: Tue, 25 Jun 2019 21:44:27 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190625214427.GN19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDE6Mjg6MjVQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDU6MTUgUE0gU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAo
MjAxOS0wNi0xNyAwMToyNTo1NikKPiA+ID4gZGlmZiAtLWdpdCBhL2t1bml0L3Rlc3QuYyBiL2t1
bml0L3Rlc3QuYwo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAw
MDAwMDAwLi5kMDVkMjU0ZjE1MjFmCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIva3Vu
aXQvdGVzdC5jCj4gPiA+IEBAIC0wLDAgKzEsMjEwIEBACj4gPiA+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiArLyoKPiA+ID4gKyAqIEJhc2UgdW5pdCB0ZXN0IChL
VW5pdCkgQVBJLgo+ID4gPiArICoKPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29vZ2xl
IExMQy4KPiA+ID4gKyAqIEF1dGhvcjogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bn
b29nbGUuY29tPgo+ID4gPiArICovCj4gPiA+ICsKPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zY2hl
ZC9kZWJ1Zy5oPgo+ID4gPiArI2luY2x1ZGUgPGt1bml0L3Rlc3QuaD4KPiA+ID4gKwo+ID4gPiAr
c3RhdGljIGJvb2wga3VuaXRfZ2V0X3N1Y2Nlc3Moc3RydWN0IGt1bml0ICp0ZXN0KQo+ID4gPiAr
ewo+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPiA+ICsgICAgICAgYm9vbCBz
dWNjZXNzOwo+ID4gPiArCj4gPiA+ICsgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnRlc3QtPmxv
Y2ssIGZsYWdzKTsKPiA+ID4gKyAgICAgICBzdWNjZXNzID0gdGVzdC0+c3VjY2VzczsKPiA+ID4g
KyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ0ZXN0LT5sb2NrLCBmbGFncyk7Cj4gPgo+
ID4gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHRoZSBsb2NraW5nIHNjaGVtZSBpbiB0aGlzIGNv
ZGUuIElzIHRoZQo+ID4gaW50ZW50aW9uIHRvIG1ha2UgZ2V0dGVyIGFuZCBzZXR0ZXIgQVBJcyB0
aGF0IGFyZSAic2FmZSIgYnkgYWRkaW5nIGluIGEKPiA+IHNwaW5sb2NrIHRoYXQgaXMgaGVsZCBh
cm91bmQgZ2V0dGluZyBhbmQgc2V0dGluZyB2YXJpb3VzIG1lbWJlcnMgaW4gdGhlCj4gPiBrdW5p
dCBzdHJ1Y3R1cmU/Cj4gCj4gWWVzLCB5b3VyIHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdC4gSXQg
aXMgcG9zc2libGUgZm9yIGEgdXNlciB0byB3cml0ZQo+IGEgdGVzdCBzdWNoIHRoYXQgY2VydGFp
biBlbGVtZW50cyBtYXkgYmUgdXBkYXRlZCBpbiBkaWZmZXJlbnQgdGhyZWFkczsKPiB0aGlzIHdv
dWxkIG1vc3QgbGlrZWx5IGhhcHBlbiBpbiB0aGUgY2FzZSB3aGVyZSBzb21lb25lIHdhbnRzIHRv
IG1ha2UKPiBhbiBhc3NlcnRpb24gb3IgYW4gZXhwZWN0YXRpb24gaW4gYSB0aHJlYWQgY3JlYXRl
ZCBieSBhIHBpZWNlIG9mIGNvZGUKPiB1bmRlciB0ZXN0LiBBbHRob3VnaCB0aGlzIHNob3VsZCBn
ZW5lcmFsbHkgYmUgYXZvaWRlZCwgaXQgaXMgcG9zc2libGUsCj4gYW5kIHRoZXJlIGFyZSBvY2Nh
c2lvbmFsbHkgZ29vZCByZWFzb25zIHRvIGRvIHNvLCBzbyBpdCBpcwo+IGZ1bmN0aW9uYWxpdHkg
dGhhdCB3ZSBzaG91bGQgc3VwcG9ydC4KPiAKPiBEbyB5b3UgdGhpbmsgSSBzaG91bGQgYWRkIGEg
Y29tbWVudCB0byB0aGlzIGVmZmVjdD8KPiAKPiA+IEluIHdoYXQgc2l0dWF0aW9uIGlzIHRoZXJl
IG1vcmUgdGhhbiBvbmUgdGhyZWFkIHJlYWRpbmcgb3Igd3JpdGluZyB0aGUKPiA+IGt1bml0IHN0
cnVjdD8gSXNuJ3QgaXQgb25seSBhIHNpbmdsZSBwcm9jZXNzIHRoYXQgaXMgZ29pbmcgdG8gYmUK
PiAKPiBBcyBJIHNhaWQgYWJvdmUsIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGNvZGUgdW5kZXIg
dGVzdCBtYXkgc3Bhd24gYQo+IG5ldyB0aHJlYWQgdGhhdCBtYXkgbWFrZSBhbiBleHBlY3RhdGlv
biBvciBhbiBhc3NlcnRpb24uIEl0IGlzIG5vdCBhCj4gc3VwZXIgY29tbW9uIHVzZSBjYXNlLCBi
dXQgaXQgaXMgcG9zc2libGUuCgpJIHdvbmRlciBpZiBpdCBpcyB3b3J0aCB0byBoYXZlIHRoZW4g
ZGlmZmVyZW50IHR5cGVzIG9mIHRlc3RzIGJhc2VkIG9uCmxvY2tpbmcgcmVxdWlyZW1lbnRzLiBP
bmUgd2l0aCBubyBsb2NraW5nLCBzaW5jZSBpdCBzZWVtcyB5b3UgaW1wbHkKbW9zdCB0ZXN0cyB3
b3VsZCBmYWxsIHVuZGVyIHRoaXMgY2F0ZWdvcnksIHRoZW4gbG9ja2luZywgYW5kIGFub3RoZXIK
d2l0aCBJUlEgY29udGV4dC4KCklmIG5vIGxvY2tpbmcgaXMgZG9uZSBhdCBhbGwgZm9yIGFsbCB0
ZXN0cyB3aGljaCBkbyBub3QgcmVxdWlyZSBsb2NraW5nLAppcyB0aGVyZSBhbnkgZ2FpbnMgYXQg
cnVuIHRpbWU/IEknbSBzdXJlIGl0IG1pZ2h0IGJlIG1pbmltdW0gYnV0CmN1cmlvdXMuCgo+ID4g
b3BlcmF0aW5nIG9uIHRoaXMgc3RydWN0dXJlPyBBbmQgd2h5IGRvIHdlIG5lZWQgdG8gZGlzYWJs
ZSBpcnFzPyBBcmUgd2UKPiA+IGV4cGVjdGluZyB0byBiZSBtb2RpZnlpbmcgdGhlIHVuaXQgdGVz
dHMgZnJvbSBpcnEgY29udGV4dHM/Cj4gCj4gVGhlcmUgYXJlIGluc3RhbmNlcyB3aGVyZSBzb21l
b25lIG1heSB3YW50IHRvIHRlc3QgYSBkcml2ZXIgd2hpY2ggaGFzCj4gYW4gaW50ZXJydXB0IGhh
bmRsZXIgaW4gaXQuIEkgYWN0dWFsbHkgaGF2ZSAobm90IHRoZSBncmVhdGVzdCkgZXhhbXBsZQo+
IGhlcmUuIE5vdyBpbiB0aGVzZSBjYXNlcywgSSBleHBlY3Qgc29tZW9uZSB0byB1c2UgYSBtb2Nr
IGlycWNoaXAgb3IKPiBzb21lIG90aGVyIGZha2UgbWVjaGFuaXNtIHRvIHRyaWdnZXIgdGhlIGlu
dGVycnVwdCBoYW5kbGVyIGFuZCBub3QKPiBhY3R1YWwgaGFyZHdhcmU7IHRlY2huaWNhbGx5IHNw
ZWFraW5nIGluIHRoaXMgY2FzZSwgaXQgaXMgbm90IGdvaW5nIHRvCj4gYmUgYWNjZXNzZWQgZnJv
bSBhICJyZWFsIiBpcnEgY29udGV4dDsgaG93ZXZlciwgdGhlIGNvZGUgdW5kZXIgdGVzdAo+IHNo
b3VsZCB0aGluayB0aGF0IGl0IGlzIGluIGFuIGlycSBjb250ZXh0OyBnaXZlbiB0aGF0LCBJIGZp
Z3VyZWQgaXQgaXMKPiBiZXN0IHRvIGp1c3QgdHJlYXQgaXQgYXMgYSByZWFsIGlycSBjb250ZXh0
LiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KClNpbmNlIGl0cyBhIG5ldyBhcmNoaXRlY3R1cmUgYW5k
IHNpbmNlIHlvdSBzZWVtIHRvIGltcGx5IG1vc3QgdGVzdHMKZG9uJ3QgcmVxdWlyZSBsb2NraW5n
IG9yIGV2ZW4gSVJRcyBkaXNhYmxlZCwgSSB0aGluayBpdHMgd29ydGggdG8KY29uc2lkZXIgdGhl
IGltcGFjdCBvZiBhZGRpbmcgc3VjaCBleHRyZW1lIGxvY2tpbmcgcmVxdWlyZW1lbnRzIGZvcgph
biBpbml0aWFsIHJhbXAgdXAuCgogIEx1aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
