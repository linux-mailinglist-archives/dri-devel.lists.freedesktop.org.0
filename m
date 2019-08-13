Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE708AE40
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1356E63B;
	Tue, 13 Aug 2019 04:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C9E6E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:57:47 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AF0A206C2;
 Tue, 13 Aug 2019 04:57:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com>
 <20190812234644.E054D20679@mail.kernel.org>
 <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
 <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:57:46 -0700
Message-Id: <20190813045747.3AF0A206C2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565672267;
 bh=DYjr3iNqzIZZG76leV1s359ko+TvTUQm8spLagGHMHw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BTwdTrkEp8drYKqfL8D9Ky5nkPDptSWvvGIAlm2zBb2UDU+0TVgv2y5RV+T+uAhfY
 tWPKzKIXLNFpV9AmAXD2trHaopP6q/JkL76VTk8Nk5HLsR0pl5LlSlCExSkq+YZ59Z
 pYb/52F6++Rtk7YAqglHez91WgCEV0yvDG9bHKxs=
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
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMjE6Mjc6MDUpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgNDo1NiBQTSBCcmVuZGFuIEhpZ2dpbnMKPiA8YnJlbmRhbmhpZ2dpbnNA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNDo0NiBQ
TSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBRdW90
aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wOC0xMiAxMToyNDowNykKPiA+ID4gPiArI2RlZmlu
ZSBLVU5JVF9JTklUX0ZBSUxfQVNTRVJUX1NUUlVDVCh0ZXN0LCB0eXBlKSB7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAgICAgICAgICAuYXNzZXJ0ID0gS1VOSVRf
SU5JVF9BU1NFUlRfU1RSVUNUKHRlc3QsICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSwg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBrdW5pdF9mYWlsX2Fzc2VydF9mb3JtYXQpICAgXAo+
ID4gPgo+ID4gPiBUaGlzIG9uZSBnb3QgaW5kZW50ZWQgb25lIHRvbyBtYW55IHRpbWVzPwo+ID4K
PiA+IE5vdCB1bmxlc3MgSSBoYXZlIGJlZW4gdXNpbmcgdGhlIHdyb25nIGZvcm1hdHRpbmcgZm9y
IG11bHRpbGluZQo+ID4gbWFjcm9zLiBZb3UgY2FuIHNlZSB0aGlzIGNvbW1pdCBhcHBsaWVkIGhl
cmU6Cj4gPiBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJjZS5jb20vbGludXgvKy84NzA5NjRkYTI5
OTA5MjAwMzA5OTBkZDFmZmI2NDdlZjQwOGU1MmRmL2luY2x1ZGUva3VuaXQvYXNzZXJ0LmgjNTkK
PiA+Cj4gPiBJIGhhdmUgdGVzdCwgdHlwZSwgYW5kIGt1bml0X2ZhaWxfYXNzZXJ0X2Zvcm1hdCBh
bGwgY29sdW1uIGFsaWduZWQgKGl0Cj4gPiBqdXN0IGRvZXNuJ3QgcmVuZGVyIG5pY2VseSBpbiB0
aGUgcGF0Y2ggZm9ybWF0KS4KPiAKPiBEaXNyZWdhcmQgdGhhdCBsYXN0IGNvbW1lbnQuIEkganVz
dCBsb29rZWQgYXQgdGhlIGxpbmUgaW1tZWRpYXRlbHkKPiBhYm92ZSB5b3VyIGNvbW1lbnQgYW5k
IHRob3VnaHQgaXQgbG9va2VkIGNvcnJlY3QuIFNvcnJ5IGFib3V0IHRoYXQKPiAoeW91IHdlcmUg
cG9pbnRpbmcgb3V0IHRoYXQgdGhlIC5hc3NlcnQgbGluZSBsb29rZWQgd3JvbmcsIGNvcnJlY3Q/
KS4KClllcy4gLmFzc2VydCBpcyBkb3VibGUgdGFiYmVkPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
