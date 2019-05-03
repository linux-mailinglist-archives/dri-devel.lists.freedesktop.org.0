Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990F127E2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13329895B4;
	Fri,  3 May 2019 06:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A827895B4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 06:41:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CC3D2075E;
 Fri,  3 May 2019 06:41:51 +0000 (UTC)
Date: Fri, 3 May 2019 08:41:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
Message-ID: <20190503064149.GB20723@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
 <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556865712;
 bh=qAxjj5uiF5zEnzRbrg8NBWm/r/MITYyDqVpA7K94d04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/xHj6l6GTULrzqty/QE9n+V3E7brgc1EE3YPacTpehUKVBEwYEB8Kjpj6eaNywET
 vOVTIu5pClz9D1ixUfyq2wi+fG23/JAt0fEXA4iWbz4fYGFM70dWGs3kIuIpiDPLE5
 z1ZErmGEyIuJkJ4kZlIVEyXnanSfyuAg225XdKNg=
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDQ6NDU6MjlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFRodSwgTWF5IDIsIDIwMTkgYXQgMjoxNiBQTSBGcmFuayBSb3dhbmQgPGZy
b3dhbmQubGlzdEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDUvMi8xOSAxMTowNyBBTSwg
QnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDQ6MDIg
QU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+
ID4+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDA0OjAxOjIxUE0gLTA3MDAsIEJyZW5kYW4gSGln
Z2lucyB3cm90ZToKPiA+ID4+PiBGcm9tOiBGZWxpeCBHdW8gPGZlbGl4Z3VveGl1cGluZ0BnbWFp
bC5jb20+Cj4gPiA+Pj4KPiA+ID4+PiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBjcmVhdGUgbWlu
aW1hbCBpc29sYXRlZCB0ZXN0IGJpbmFyaWVzOyBpbiB0aGUKPiA+ID4+PiBtZWFudGltZSB3ZSBh
cmUgdXNpbmcgVU1MIHRvIHByb3ZpZGUgdGhlIGluZnJhc3RydWN0dXJlIHRvIHJ1biB0ZXN0cywg
c28KPiA+ID4+PiBkZWZpbmUgYW4gYWJzdHJhY3Qgd2F5IHRvIGNvbmZpZ3VyZSBhbmQgcnVuIHRl
c3RzIHRoYXQgYWxsb3cgdXMgdG8KPiA+ID4+PiBjaGFuZ2UgdGhlIGNvbnRleHQgaW4gd2hpY2gg
dGVzdHMgYXJlIGJ1aWx0IHdpdGhvdXQgYWZmZWN0aW5nIHRoZSB1c2VyLgo+ID4gPj4+IFRoaXMg
YWxzbyBtYWtlcyBwcmV0dHkgYW5kIGR5bmFtaWMgZXJyb3IgcmVwb3J0aW5nLCBhbmQgYSBsb3Qg
b2Ygb3RoZXIKPiA+ID4+PiBuaWNlIGZlYXR1cmVzIGVhc2llci4KPiA+ID4+Pgo+ID4gPj4+IGt1
bml0X2NvbmZpZy5weToKPiA+ID4+PiAgIC0gcGFyc2UgLmNvbmZpZyBhbmQgS2NvbmZpZyBmaWxl
cy4KPiA+ID4+Pgo+ID4gPj4+IGt1bml0X2tlcm5lbC5weTogcHJvdmlkZXMgaGVscGVyIGZ1bmN0
aW9ucyB0bzoKPiA+ID4+PiAgIC0gY29uZmlndXJlIHRoZSBrZXJuZWwgdXNpbmcga3VuaXRjb25m
aWcuCj4gPiA+Pj4gICAtIGJ1aWxkIHRoZSBrZXJuZWwgd2l0aCB0aGUgYXBwcm9wcmlhdGUgY29u
ZmlndXJhdGlvbi4KPiA+ID4+PiAgIC0gcHJvdmlkZSBmdW5jdGlvbiB0byBpbnZva2UgdGhlIGtl
cm5lbCBhbmQgc3RyZWFtIHRoZSBvdXRwdXQgYmFjay4KPiA+ID4+Pgo+ID4gPj4+IFNpZ25lZC1v
ZmYtYnk6IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiA+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4g
PiA+Pgo+ID4gPj4gQWgsIGhlcmUncyBwcm9iYWJseSBteSBhbnN3ZXIgdG8gbXkgcHJldmlvdXMg
bG9nZ2luZyBmb3JtYXQgcXVlc3Rpb24sCj4gPiA+PiByaWdodD8gIFdoYXQncyB0aGUgY2hhbmNl
IHRoYXQgdGhlc2Ugd3JhcHBlcnMgb3V0cHV0IHN0dWZmIGluIGEgc3RhbmRhcmQKPiA+ID4+IGZv
cm1hdCB0aGF0IHRlc3QtZnJhbWV3b3JrLXRvb2xzIGNhbiBhbHJlYWR5IHBhcnNlPyAgOikKPiAK
PiBUbyBiZSBjbGVhciwgdGhlIHRlc3QtZnJhbWV3b3JrLXRvb2xzIGZvcm1hdCB3ZSBhcmUgdGFs
a2luZyBhYm91dCBpcwo+IFRBUDEzWzFdLCBjb3JyZWN0PwoKWWVzLgoKPiBNeSB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgaXMgd2hhdCBrc2VsZnRlc3QgaXMgYmVpbmcgY29udmVydGVkIHRvIHVzZS4K
ClllcywgYW5kIEkgdGhpbmsgaXQncyBhbG1vc3QgZG9uZS4gIFRoZSBjb3JlIG9mIGtzZWxmdGVz
dCBwcm92aWRlcwpmdW5jdGlvbnMgdGhhdCBhbGwgdGVzdHMgY2FuIHVzZSB0byBsb2cgbWVzc2Fn
ZXMgaW4gdGhlIGNvcnJlY3QgZm9ybWF0LgoKVGhlIGNvcmUgb2Yga3VuaXQgc2hvdWxkIGFsc28g
bG9nIHRoZSBtZXNzYWdlcyBpbiB0aGlzIGZvcm1hdCBhcyB3ZWxsLAphbmQgbm90IHJlbHkgb24g
dGhlIGhlbHBlciBzY3JpcHRzIGFzIEZyYW5rIHBvaW50cyBvdXQsIG5vdCBldmVyeW9uZQp3aWxs
IHVzZS93YW50IHRoZW0uICBNaWdodCBhcyB3ZWxsIG1ha2UgaXQgZWFzeSBmb3IgZXZlcnlvbmUg
dG8gYWx3YXlzCmRvIHRoZSByaWdodCB0aGluZyBhbmQgbm90IGZvcmNlIGl0IHRvIGFsd2F5cyBi
ZSBhZGRlZCBpbiBsYXRlci4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
