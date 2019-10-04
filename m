Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5BCC63B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 01:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE926EC37;
	Fri,  4 Oct 2019 23:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F936EC36
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 23:10:42 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id e5so3803508pls.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 16:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tysgl1R46fdU3OksVKZHpW9zLqbqvPnl2oWqc0PQOqg=;
 b=I4XGMDm1YQ/E2cl90hkBXGkMnxRY6vaVzhNsIB3t7DRaV2lMG1JMh0leHouT6unvj1
 6u7vLi6CY/DSDn3zGioC+04oMvzTqMYntQaCAzvEZLbWDYFP03Yqnf5denfM9cLXr5nR
 W0j/95dUNXyzBVkhV9YCiTleA0BG2yL/95arNzI3cMRWOi12V+khuRUHUA7gVmpAtu8O
 cmZCyPeEldKodB0O6TgRyzRbVbi2m5MlJHcwMmCX6ID55JD0sqR5ABOtaEHv7qLoLbhZ
 uhyDb0XGEq8l0hxfJw8HjkSt2A4sa3qnNE+45DvX+KWEvC6t8HtdzZFCJTrzhb7QbzwR
 WCjQ==
X-Gm-Message-State: APjAAAXE34Ueby/EUNUhOop+sVTNDL8osAMePTMy5rR3CWbSzkQDgPp7
 75MlK/D/FgIP4Klx1Dck+8EvIXbaFjv+XHILif7F3g==
X-Google-Smtp-Source: APXvYqy2qn5i4A0WcBwjew4hCMmMwzQqLgVpE7PF0Xq4XlJnxlfT1jMDjTbCtnSFUQdVesOmn5ze08RzDHkU7ftVGYQ=
X-Received: by 2002:a17:902:ff0e:: with SMTP id
 f14mr18021468plj.325.1570230641399; 
 Fri, 04 Oct 2019 16:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
In-Reply-To: <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 4 Oct 2019 16:10:30 -0700
Message-ID: <CAFd5g46pzu=Bh5X7-ttfhTP+NYNDCAxN16OCGFxc5ohjTL-v0g@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tysgl1R46fdU3OksVKZHpW9zLqbqvPnl2oWqc0PQOqg=;
 b=oPja2LZ+ZjzWwIIgczPMTwtg+FNGcSbm7xxAV/JCINpx/yp1vQ08IQzQiHGs4wRyly
 YbCXc4ZHHHV54r6XkfIGN2kCtHFVjwM+le57/4du+XEYDcy5wbcSN0nM+dJDI0b12LcX
 ZikwBUxxg3PiGd3obfKj/XNiIWOlooyLyOV9DjUwS3qE50KzPo9cDH1z7dSJIljdr/Z7
 tZQByU/xEELr2sdcAOpmxavLs2sFF6O48uaUgeMrxepiwS44UUpA/LYAKV5RslwaYo6g
 n/2r9eiMcS73JaD7vmFn8z6h6xmtSUZ7znleGhm4+7S7T8FLqi/xStUsiRfiN3NRdDY9
 6J6Q==
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Logan Gunthorpe <logang@deltatee.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAzOjQ3IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDEwLzQvMTkgNDoyNyBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4g
T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDM6NTk6MTBQTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4g
Pj4gT24gMTAvNC8xOSAzOjQyIFBNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPiA+Pj4gT24gRnJp
LCBPY3QgNCwgMjAxOSBhdCAyOjM5IFBNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1pdC5lZHU+
IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IFRoaXMgcXVlc3Rpb24gaXMgcHJpbWFyaWx5IGRpcmVjdGVk
IGF0IFNodWFoIGFuZCBMaW51cy4uLi4KPiA+Pj4+Cj4gPj4+PiBXaGF0J3MgdGhlIGN1cnJlbnQg
c3RhdHVzIG9mIHRoZSBrdW5pdCBzZXJpZXMgbm93IHRoYXQgQnJlbmRhbiBoYXMKPiA+Pj4+IG1v
dmVkIGl0IG91dCBvZiB0aGUgdG9wLWxldmVsIGt1bml0IGRpcmVjdG9yeSBhcyBMaW51cyBoYXMg
cmVxdWVzdGVkPwo+ID4+Pgo+ID4+Cj4gPj4gVGhlIG1vdmUgaGFwcGVuZWQgc21hY2sgaW4gdGhl
IG1pZGRsZSBvZiBtZXJnZSB3aW5kb3cgYW5kIGxhbmRlZCBpbgo+ID4+IGxpbnV4LW5leHQgdG93
YXJkcyB0aGUgZW5kIG9mIHRoZSBtZXJnZSB3aW5kb3cuCj4gPj4KPiA+Pj4gV2Ugc2VlbWVkIHRv
IGRlY2lkZSB0byBqdXN0IHdhaXQgZm9yIDUuNSwgYnV0IHRoZXJlIGlzIG5vdGhpbmcgdGhhdAo+
ID4+PiBsb29rcyB0byBibG9jayB0aGF0LiBBbmQgSSBlbmNvdXJhZ2VkIFNodWFoIHRvIGZpbmQg
bW9yZSBrdW5pdCBjYXNlcwo+ID4+PiBmb3Igd2hlbiBpdCBfZG9lc18gZ2V0IG1lcmdlZC4KPiA+
Pj4KPiA+Pgo+ID4+IFJpZ2h0LiBJIGNvbW11bmljYXRlZCB0aGF0IHRvIEJyZW5kYW4gdGhhdCB3
ZSBjb3VsZCB3b3JrIG9uIGFkZGluZyBtb3JlCj4gPj4ga3VuaXQgYmFzZWQgdGVzdHMgd2hpY2gg
d291bGQgaGVscCBnZXQgbW9yZSBtaWxlYWdlIG9uIHRoZSBrdW5pdC4KPiA+Pgo+ID4+PiBTbyBp
ZiB0aGUga3VuaXQgYnJhbmNoIGlzIHN0YWJsZSwgYW5kIHBlb3BsZSB3YW50IHRvIHN0YXJ0IHVz
aW5nIGl0Cj4gPj4+IGZvciB0aGVpciB1bml0IHRlc3RzLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3Vs
ZCBiZSBhIGdvb2QgaWRlYSwgYW5kIHRoZW4KPiA+Pj4gZHVyaW5nIHRoZSA1LjUgbWVyZ2Ugd2lu
ZG93IHdlJ2xsIG5vdCBqdXN0IGdldCB0aGUgaW5mcmFzdHJ1Y3R1cmUsCj4gPj4+IHdlJ2xsIGdl
dCBhIGZldyBtb3JlIHVzZXJzIHRvbyBhbmQgbm90IGp1c3QgZXhhbXBsZXMuCj4gPgo+ID4gSSB3
YXMgcGxhbm5pbmcgb24gaG9sZGluZyBvZmYgb24gYWNjZXB0aW5nIG1vcmUgdGVzdHMvY2hhbmdl
cyB1bnRpbAo+ID4gS1VuaXQgaXMgaW4gdG9ydmFsZHMvbWFzdGVyLiBBcyBtdWNoIGFzIEkgd291
bGQgbGlrZSB0byBnbyBhcm91bmQKPiA+IHByb21vdGluZyBpdCwgSSBkb24ndCByZWFsbHkgd2Fu
dCB0byBwcm9tb3RlIHRvbyBtdWNoIGNvbXBsZXhpdHkgaW4gYQo+ID4gbm9uLXVwc3RyZWFtIGJy
YW5jaCBiZWZvcmUgZ2V0dGluZyBpdCB1cHN0cmVhbSBiZWNhdXNlIEkgZG9uJ3Qgd2FudCB0bwo+
ID4gcmlzayBhZGRpbmcgc29tZXRoaW5nIHRoYXQgbWlnaHQgY2F1c2UgaXQgdG8gZ2V0IHJlamVj
dGVkIGFnYWluLgo+ID4KPiA+IFRvIGJlIGNsZWFyLCBJIGNhbiB1bmRlcnN0YW5kIGZyb20geW91
ciBwZXJzcGVjdGl2ZSB3aHkgZ2V0dGluZyBtb3JlCj4gPiB0ZXN0cy91c2FnZSBiZWZvcmUgYWNj
ZXB0aW5nIGl0IGlzIGEgZ29vZCB0aGluZy4gVGhlIG1vcmUgcGVvcGxlIHRoYXQKPiA+IHBsYXkg
YXJvdW5kIHdpdGggaXQsIHRoZSBtb3JlIGxpa2VseSB0aGF0IHNvbWVvbmUgd2lsbCBmaW5kIGFu
IGlzc3VlCj4gPiB3aXRoIGl0LCBhbmQgbW9yZSBsaWtlbHkgdGhhdCB3aGF0IGlzIGFjY2VwdGVk
IGludG8gdG9ydmFsZHMvbWFzdGVyIGlzCj4gPiBvZiBoaWdoIHF1YWxpdHkuCj4gPgo+ID4gSG93
ZXZlciwgaWYgSSBlbmNvdXJhZ2UgYXJiaXRyYXJ5IHRlc3RzL2ltcHJvdmVtZW50cyBpbnRvIG15
IEtVbml0Cj4gPiBicmFuY2gsIGl0IGZ1cnRoZXIgZGl2ZXJnZXMgYXdheSBmcm9tIHRvcnZhbGRz
L21hc3RlciwgYW5kIGlzIG1vcmUKPiA+IGxpa2VseSB0aGF0IHRoZXJlIHdpbGwgYmUgYSBtZXJn
ZSBjb25mbGljdCBvciBpc3N1ZSB0aGF0IGlzIG5vdCByZWxhdGVkCj4gPiB0byB0aGUgY29yZSBL
VW5pdCBjaGFuZ2VzIHRoYXQgd2lsbCBjYXVzZSB0aGUgd2hvbGUgdGhpbmcgdG8gYmUKPiA+IHJl
amVjdGVkIGFnYWluIGluIHY1LjUuCj4gPgo+Cj4gVGhlIGlkZWEgaXMgdGhhdCB0aGUgbmV3IGRl
dmVsb3BtZW50IHdpbGwgaGFwcGVuIGJhc2VkIG9uIGt1bml0IGluCj4gbGludXgta3NlbGZ0ZXN0
IG5leHQuIEl0IHdpbGwgd29yayBqdXN0IGZpbmUuIEFzIHdlIGFjY2VwdHMgcGF0Y2hlcywKPiB0
aGV5IHdpbGwgZ28gb24gdG9wIG9mIGt1bml0IHRoYXQgaXMgaW4gbGludXgtbmV4dCBub3cuCgpC
dXQgdGhlbiB3b3VsZG4ndCB3ZSB3YW50IHRvIGxpbWl0IHdoYXQgS1VuaXQgY2hhbmdlcyBhcmUg
Z29pbmcgaW50bwpsaW51eC1rc2VsZnRlc3QgbmV4dCBmb3IgdjUuNT8gRm9yIGV4YW1wbGUsIHdl
IHByb2JhYmx5IGRvbid0IHdhbnQgdG8KZG8gYW55bW9yZSBmZWF0dXJlIGRldmVsb3BtZW50IG9u
IGl0IHVudGlsIGl0IGlzIGluIHY1LjUsIHNpbmNlIHRoZQpnb2FsIGlzIHRvIG1ha2UgaXQgbW9y
ZSBzdGFibGUsIHJpZ2h0PwoKSSBhbSBndWVzc2luZyB0aGF0IGl0IHdpbGwgcHJvYmFibHkgYmUg
ZmluZSwgYnV0IGl0IHN0aWxsIHNvdW5kcyBsaWtlCndlIG5lZWQgdG8gZXN0YWJsaXNoIHNvbWUg
Z3JvdW5kIHJ1bGVzLCBhbmQgcGxheSBpdCAqdmVyeSogc2FmZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
