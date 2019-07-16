Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D516ABD8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 17:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F386E141;
	Tue, 16 Jul 2019 15:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD7C6E141
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 15:34:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CB182054F;
 Tue, 16 Jul 2019 15:34:00 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g47y4vDB2P=EsGN8305LGeQPCTveNs-Jd5-=6K-XKY==CA@mail.gmail.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-4-brendanhiggins@google.com>
 <20190715204356.4E3F92145D@mail.kernel.org>
 <CAFd5g47481sRaez=yEJN4_ghiXZbxayk1Y04tAZpuzPLsmnhKg@mail.gmail.com>
 <20190715220407.0030420665@mail.kernel.org>
 <CAFd5g44bE0F=wq_fOAnxFTtoOyx1dUshhDAkKWr5hX9ipJ4Sxw@mail.gmail.com>
 <CAFd5g47y4vDB2P=EsGN8305LGeQPCTveNs-Jd5-=6K-XKY==CA@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v9 03/18] kunit: test: add string_stream a std::stream
 like string builder
User-Agent: alot/0.8.1
Date: Tue, 16 Jul 2019 08:33:59 -0700
Message-Id: <20190716153400.5CB182054F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563291240;
 bh=V4ev/UU39RHvFkNjkPsY3SOAdIqI9PBECtJV0Q6gb5E=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=OI5X53OX1byrP6tlrUCjRpeJ1oQOTnBd5OqI0zkPlySCP8J7YdSPWzyzurB0yXcW5
 tojB8NLHwRsWz19d2LLzm7R0Y/GV+eoAx6B2iENKbOicQFlEaTQrErT0xo7BH5fqoh
 gpLKApR/IyGssgFicaQIy6L8qsIKeBP/gh0ZNKpo=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTUgMTU6NDM6MjApCj4gT24gTW9uLCBK
dWwgMTUsIDIwMTkgYXQgMzoxMSBQTSBCcmVuZGFuIEhpZ2dpbnMKPiA8YnJlbmRhbmhpZ2dpbnNA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMzowNCBQ
TSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBRdW90
aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wNy0xNSAxNDoxMTo1MCkKPiA+ID4gPiBPbiBNb24s
IEp1bCAxNSwgMjAxOSBhdCAxOjQzIFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBhbHNvIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8ganVzdCBoYXZlIGEgYmlnIHNsb3AgYnVmZmVyIG9mIGEKPiA+ID4gPiA+IDRLIHBh
Z2Ugb3Igc29tZXRoaW5nIHNvIHRoYXQgd2UgYWxtb3N0IG5ldmVyIGhhdmUgdG8gYWxsb2NhdGUg
YW55dGhpbmcKPiA+ID4gPiA+IHdpdGggYSBzdHJpbmdfc3RyZWFtIGFuZCB3ZSBjYW4ganVzdCBy
ZWx5IG9uIGEgcmVhZGVyIGNvbnN1bWluZyBkYXRhCj4gPiA+ID4gPiB3aGlsZSB3cml0ZXJzIGFy
ZSB3cml0aW5nLiBUaGF0IG1pZ2h0IHdvcmsgb3V0IGJldHRlciwgYnV0IEkgZG9uJ3QgcXVpdGUK
PiA+ID4gPiA+IHVuZGVyc3RhbmQgdGhlIHVzZSBjYXNlIGZvciB0aGUgc3RyaW5nIHN0cmVhbS4K
PiA+ID4gPgo+ID4gPiA+IFRoYXQgbWFrZXMgc2Vuc2UsIGJ1dCBtaWdodCB0aGF0IGFsc28gd2Fz
dGUgbWVtb3J5IHNpbmNlIHdlIHdpbGwKPiA+ID4gPiBhbG1vc3QgbmV2ZXIgbmVlZCB0aGF0IG11
Y2ggbWVtb3J5Pwo+ID4gPgo+ID4gPiBXaHkgZG8gd2UgY2FyZT8gVGhlc2UgYXJlIHVuaXQgdGVz
dHMuCj4gPgo+ID4gQWdyZWVkLgo+ID4KPiA+ID4gSGF2aW5nIGFsbG9jYXRpb25zIGluIGhlcmUg
bWFrZXMKPiA+ID4gdGhpbmdzIG1vcmUgY29tcGxpY2F0ZWQsIHdoZXJlYXMgaXQgd291bGQgYmUg
c2ltcGxlciB0byBoYXZlIGEgcG9pbnRlcgo+ID4gPiBhbmQgYSBzcGlubG9jayBvcGVyYXRpbmcg
b24gYSBjaHVuayBvZiBtZW1vcnkgdGhhdCBnZXRzIGZsdXNoZWQgb3V0Cj4gPiA+IHBlcmlvZGlj
YWxseS4KPiA+Cj4gPiBJIGFtIG5vdCBzbyBzdXJlLiBJIGhhdmUgdG8gaGF2ZSB0aGUgbG9naWMg
dG8gYWxsb2NhdGUgbWVtb3J5IGluIHNvbWUKPiA+IGNhc2Ugbm8gbWF0dGVyIHdoYXQgKHdoYXQg
aWYgSSBuZWVkIG1vcmUgbWVtb3J5IHRoYXQgbXkgcHJlYWxsb2NhdGVkCj4gPiBjaHVjaz8pLiBJ
IHRoaW5rIGl0IGlzIHNpbXBsZXIgdG8gYWx3YXlzIHJlcXVlc3QgYW4gYWxsb2NhdGlvbiB0aGFu
IHRvCj4gPiBvbmx5IHNvbWV0aW1lcyByZXF1ZXN0IGFuIGFsbG9jYXRpb24uCj4gCj4gQW5vdGhl
ciBldmVuIHNpbXBsZXIgYWx0ZXJuYXRpdmUgbWlnaHQgYmUgdG8ganVzdCBhbGxvY2F0ZSBtZW1v
cnkKPiB1c2luZyBrdW5pdF9rbWFsbG9jIGFzIHdlIG5lZWQgaXQgYW5kIGp1c3QgbGV0IHRoZSBr
dW5pdF9yZXNvdXJjZSBjb2RlCj4gaGFuZGxlIGNsZWFuaW5nIGl0IGFsbCB1cCB3aGVuIHRoZSB0
ZXN0IGNhc2UgZmluaXNoZXMuCgpTdXJlLCBzb3VuZHMgbGlrZSBhIG5pY2Ugd2F5IHRvIGF2b2lk
IGR1cGxpY2F0aW5nIHNpbWlsYXIgbG9naWMgdG8KbWFpbnRhaW4gYSBsaXN0IG9mIHRoaW5ncyB0
byBmcmVlIGxhdGVyLgoKPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8KCklmIHlvdSBnbyB0aGUgYWxs
b2NhdGlvbiByb3V0ZSB0aGVuIHlvdSdsbCBuZWVkIHRvIGhhdmUgdGhlIGZsYWdzIHRvCmtub3cg
d2hhdCBjb250ZXh0IHlvdSdyZSBpbiB0byBhbGxvY2F0ZSBhcHByb3ByaWF0ZWx5LiBEb2VzIHRo
YXQgbWVhbgphbGwgdGhlIHN0cmluZyBvcGVyYXRpb25zIHdpbGwgbm93IHRha2UgR0ZQIGZsYWdz
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
