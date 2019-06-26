Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952E55FA4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038746E260;
	Wed, 26 Jun 2019 03:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332EB6E260
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:41:01 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B238520883;
 Wed, 26 Jun 2019 03:41:00 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
User-Agent: alot/0.8.1
Date: Tue, 25 Jun 2019 20:40:59 -0700
Message-Id: <20190626034100.B238520883@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520460;
 bh=YjnOrrgSNhT6RWlqKXwtbjuCaQYM6DgeF+J68o3kqsE=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=TozaXDPsvQQt/kVas3URc54NSndgjkoC4JTDYWEqG70XXqn3fWJpPNfLyDu06hZCO
 ksLT9uE8zoDvTnwOTaGmRz8VF+Rm9bpa8KzXo9tWm3/qM5QRpGdRrtfc1krtZGPl7s
 UrIkXsoPp/B2GQ3tBVMxOkqmDHBq+Vr71I5oFTqc=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDYtMjUgMTM6Mjg6MjUpCj4gT24gV2VkLCBK
dW4gMTksIDIwMTkgYXQgNToxNSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA2LTE3IDAxOjI1OjU2
KQo+ID4gPiBkaWZmIC0tZ2l0IGEva3VuaXQvdGVzdC5jIGIva3VuaXQvdGVzdC5jCj4gPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmQwNWQyNTRmMTUy
MWYKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9rdW5pdC90ZXN0LmMKPiA+ID4gQEAg
LTAsMCArMSwyMTAgQEAKPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gPiA+ICsvKgo+ID4gPiArICogQmFzZSB1bml0IHRlc3QgKEtVbml0KSBBUEkuCj4gPiA+ICsg
Kgo+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDE5LCBHb29nbGUgTExDLgo+ID4gPiArICogQXV0
aG9yOiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiA+ICsg
Ki8KPiA+ID4gKwo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVnLmg+Cj4gPiA+ICsj
aW5jbHVkZSA8a3VuaXQvdGVzdC5oPgo+ID4gPiArCj4gPiA+ICtzdGF0aWMgYm9vbCBrdW5pdF9n
ZXRfc3VjY2VzcyhzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsKPiA+ID4gKyAgICAgICBib29sIHN1Y2Nlc3M7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdGVzdC0+bG9jaywgZmxhZ3MpOwo+ID4gPiAr
ICAgICAgIHN1Y2Nlc3MgPSB0ZXN0LT5zdWNjZXNzOwo+ID4gPiArICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnRlc3QtPmxvY2ssIGZsYWdzKTsKPiA+Cj4gPiBJIHN0aWxsIGRvbid0IHVu
ZGVyc3RhbmQgdGhlIGxvY2tpbmcgc2NoZW1lIGluIHRoaXMgY29kZS4gSXMgdGhlCj4gPiBpbnRl
bnRpb24gdG8gbWFrZSBnZXR0ZXIgYW5kIHNldHRlciBBUElzIHRoYXQgYXJlICJzYWZlIiBieSBh
ZGRpbmcgaW4gYQo+ID4gc3BpbmxvY2sgdGhhdCBpcyBoZWxkIGFyb3VuZCBnZXR0aW5nIGFuZCBz
ZXR0aW5nIHZhcmlvdXMgbWVtYmVycyBpbiB0aGUKPiA+IGt1bml0IHN0cnVjdHVyZT8KPiAKPiBZ
ZXMsIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBJdCBpcyBwb3NzaWJsZSBmb3IgYSB1
c2VyIHRvIHdyaXRlCj4gYSB0ZXN0IHN1Y2ggdGhhdCBjZXJ0YWluIGVsZW1lbnRzIG1heSBiZSB1
cGRhdGVkIGluIGRpZmZlcmVudCB0aHJlYWRzOwo+IHRoaXMgd291bGQgbW9zdCBsaWtlbHkgaGFw
cGVuIGluIHRoZSBjYXNlIHdoZXJlIHNvbWVvbmUgd2FudHMgdG8gbWFrZQo+IGFuIGFzc2VydGlv
biBvciBhbiBleHBlY3RhdGlvbiBpbiBhIHRocmVhZCBjcmVhdGVkIGJ5IGEgcGllY2Ugb2YgY29k
ZQo+IHVuZGVyIHRlc3QuIEFsdGhvdWdoIHRoaXMgc2hvdWxkIGdlbmVyYWxseSBiZSBhdm9pZGVk
LCBpdCBpcyBwb3NzaWJsZSwKPiBhbmQgdGhlcmUgYXJlIG9jY2FzaW9uYWxseSBnb29kIHJlYXNv
bnMgdG8gZG8gc28sIHNvIGl0IGlzCj4gZnVuY3Rpb25hbGl0eSB0aGF0IHdlIHNob3VsZCBzdXBw
b3J0Lgo+IAo+IERvIHlvdSB0aGluayBJIHNob3VsZCBhZGQgYSBjb21tZW50IHRvIHRoaXMgZWZm
ZWN0PwoKTm8sIEkgdGhpbmsgdGhlIGxvY2tpbmcgc2hvdWxkIGJlIHJlbW92ZWQuCgo+IAo+ID4g
SW4gd2hhdCBzaXR1YXRpb24gaXMgdGhlcmUgbW9yZSB0aGFuIG9uZSB0aHJlYWQgcmVhZGluZyBv
ciB3cml0aW5nIHRoZQo+ID4ga3VuaXQgc3RydWN0PyBJc24ndCBpdCBvbmx5IGEgc2luZ2xlIHBy
b2Nlc3MgdGhhdCBpcyBnb2luZyB0byBiZQo+IAo+IEFzIEkgc2FpZCBhYm92ZSwgaXQgaXMgcG9z
c2libGUgdGhhdCB0aGUgY29kZSB1bmRlciB0ZXN0IG1heSBzcGF3biBhCj4gbmV3IHRocmVhZCB0
aGF0IG1heSBtYWtlIGFuIGV4cGVjdGF0aW9uIG9yIGFuIGFzc2VydGlvbi4gSXQgaXMgbm90IGEK
PiBzdXBlciBjb21tb24gdXNlIGNhc2UsIGJ1dCBpdCBpcyBwb3NzaWJsZS4KClN1cmUsIHNvdW5k
cyBzdXBlciBwb3NzaWJsZSBhbmQgT0suCgo+IAo+ID4gb3BlcmF0aW5nIG9uIHRoaXMgc3RydWN0
dXJlPyBBbmQgd2h5IGRvIHdlIG5lZWQgdG8gZGlzYWJsZSBpcnFzPyBBcmUgd2UKPiA+IGV4cGVj
dGluZyB0byBiZSBtb2RpZnlpbmcgdGhlIHVuaXQgdGVzdHMgZnJvbSBpcnEgY29udGV4dHM/Cj4g
Cj4gVGhlcmUgYXJlIGluc3RhbmNlcyB3aGVyZSBzb21lb25lIG1heSB3YW50IHRvIHRlc3QgYSBk
cml2ZXIgd2hpY2ggaGFzCj4gYW4gaW50ZXJydXB0IGhhbmRsZXIgaW4gaXQuIEkgYWN0dWFsbHkg
aGF2ZSAobm90IHRoZSBncmVhdGVzdCkgZXhhbXBsZQo+IGhlcmUuIE5vdyBpbiB0aGVzZSBjYXNl
cywgSSBleHBlY3Qgc29tZW9uZSB0byB1c2UgYSBtb2NrIGlycWNoaXAgb3IKPiBzb21lIG90aGVy
IGZha2UgbWVjaGFuaXNtIHRvIHRyaWdnZXIgdGhlIGludGVycnVwdCBoYW5kbGVyIGFuZCBub3QK
PiBhY3R1YWwgaGFyZHdhcmU7IHRlY2huaWNhbGx5IHNwZWFraW5nIGluIHRoaXMgY2FzZSwgaXQg
aXMgbm90IGdvaW5nIHRvCj4gYmUgYWNjZXNzZWQgZnJvbSBhICJyZWFsIiBpcnEgY29udGV4dDsg
aG93ZXZlciwgdGhlIGNvZGUgdW5kZXIgdGVzdAo+IHNob3VsZCB0aGluayB0aGF0IGl0IGlzIGlu
IGFuIGlycSBjb250ZXh0OyBnaXZlbiB0aGF0LCBJIGZpZ3VyZWQgaXQgaXMKPiBiZXN0IHRvIGp1
c3QgdHJlYXQgaXQgYXMgYSByZWFsIGlycSBjb250ZXh0LiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8K
CkNhbiB5b3UgcGxlYXNlIGRlc2NyaWJlIHRoZSBzY2VuYXJpbyBpbiB3aGljaCBncmFiYmluZyB0
aGUgbG9jayBoZXJlLAp1cGRhdGluZyBhIHNpbmdsZSB2YXJpYWJsZSwgYW5kIHRoZW4gcmVsZWFz
aW5nIHRoZSBsb2NrIHJpZ2h0IGFmdGVyCmRvZXMgYW55dGhpbmcgdXNlZnVsIHZzLiBub3QgaGF2
aW5nIHRoZSBsb2NrPyBJJ20gbG9va2luZyBmb3IgYSB0d28gQ1BVCnNjZW5hcmlvIGxpa2UgYmVs
b3csIGJ1dCB3aGVyZSBpdCBpcyBhIHByb2JsZW0uIFRoZXJlIGNvdWxkIGJlIHRocmVlCkNQVXMs
IG9yIGV2ZW4gb25lIENQVSBhbmQgdGhyZWUgdGhyZWFkcyBpZiB5b3Ugd2FudCB0byBkZXNjcmli
ZSB0aGUKZXh0cmEgdGhyZWFkIHNjZW5hcmlvLgoKSGVyZSdzIG15IHNjZW5hcmlvIHdoZXJlIGl0
IGlzbid0IG5lZWRlZDoKCiAgICBDUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBDUFUxCiAgICAtLS0tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LS0tCiAgICBrdW5pdF9ydW5fdGVzdCgmdGVzdCkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRlc3RfY2FzZV9mdW5jKCkKCQkJCQkgICAgICAgIC4uLi4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFttb2NrIGhhcmRpcnFd
CgkJCQkJICAgICAgICBrdW5pdF9zZXRfc3VjY2VzcygmdGVzdCkKCQkJCQkgICAgICBbaGFyZGly
cSBlbmRzXQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAu
Li4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGxl
dGUoJnRlc3RfZG9uZSkKICAgICAgd2FpdF9mb3JfY29tcGxldGlvbigmdGVzdF9kb25lKQogICAg
ICBrdW5pdF9nZXRfc3VjY2VzcygmdGVzdCkKCldlIGRvbid0IG5lZWQgdG8gY2FyZSBhYm91dCBo
YXZpbmcgbG9ja2luZyBoZXJlIGJlY2F1c2Ugc3VjY2VzcyBvcgpmYWlsdXJlIG9ubHkgaGFwcGVu
cyBpbiBvbmUgcGxhY2UgYW5kIGl0J3Mgc3luY2hyb25pemVkIHdpdGggdGhlCmNvbXBsZXRpb24u
Cgo+IAo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0dXJuIHN1Y2Nlc3M7Cj4gPiA+ICt9Cj4gPiA+
ICsKPiA+ID4gK3N0YXRpYyB2b2lkIGt1bml0X3NldF9zdWNjZXNzKHN0cnVjdCBrdW5pdCAqdGVz
dCwgYm9vbCBzdWNjZXNzKQo+ID4gPiArewo+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdGVzdC0+bG9jaywg
ZmxhZ3MpOwo+ID4gPiArICAgICAgIHRlc3QtPnN1Y2Nlc3MgPSBzdWNjZXNzOwo+ID4gPiArICAg
ICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnRlc3QtPmxvY2ssIGZsYWdzKTsKPiA+ID4gK30K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
