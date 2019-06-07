Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0E39888
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 00:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811298914B;
	Fri,  7 Jun 2019 22:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EFE8914B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 22:23:05 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id s24so1325196plr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 15:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OscIWC1H8BYVUTSTRMLtHcpa3RbQBWs93JhulNsk+jk=;
 b=aRbfzOle47yTX8c6W9YFRlEifo3sMrcSGM7FVK5IElCGZqgmwn14yXbjctvhqd9N1A
 rvUKgDAGpelyloXN5TVAeHd4yQE6pMlaCJ3gOHpLBotZ2e/1pTwtPWEGGo3ldkruli0p
 tENJnFfKyh6ax0DOjAWI8CDwooxvVBh6syWBe+ZEwHCyE+cDwh9cqoc86o0Z6rbEzFyO
 ptkpTs+4z5ckvOrBQ5xZslhCvkW+UC4xe/BvPCrNfFU97FbTeqSY6S1izntBvPAz/e2Q
 7b9yMal1CaZPcz2VKzvou1zrgpW3I0lREH7jvzdqeHcQ8KMv5khLI9NQbFZXDSnygh8Z
 b/iA==
X-Gm-Message-State: APjAAAVGf/+xJ9MQMGab4xIAoWAS+16Aan0pRnzvzyliMizoVaKMuVa1
 hIZerXf2N7lbvu9LYZJa5NDLIgNxvRPljqTew5CxFQ==
X-Google-Smtp-Source: APXvYqxqRVfuyQEdyfJNNkPVX/y1rXYgnEMZVKj/CtJa0Fm8bihW1BebEYmymKIH0C8/tAoxb6DpKUorgA1wvW4QAXM=
X-Received: by 2002:a17:902:624:: with SMTP id
 33mr59045206plg.325.1559946184199; 
 Fri, 07 Jun 2019 15:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-18-brendanhiggins@google.com>
 <20190517182254.548EA20815@mail.kernel.org>
 <CAAXuY3p4qhKVsSpQ44_kQeGDMfg7OuFLgFyxhcFWS3yf-5A_7g@mail.gmail.com>
 <20190607190047.C3E7A20868@mail.kernel.org>
In-Reply-To: <20190607190047.C3E7A20868@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 7 Jun 2019 15:22:53 -0700
Message-ID: <CAFd5g475eUKnpNM3kDe_9PboCyZ=aanPeV2gTuzuJXRp-xbsWg@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OscIWC1H8BYVUTSTRMLtHcpa3RbQBWs93JhulNsk+jk=;
 b=kdR49OFNsFx7GSx/8YCa4OAXnuGm9wR3mA3FGM2j9z9kYOvNzqrt6gDMUmNTCF4V83
 UuY0GuaC7cU7suXulXpVOn5N4HicehNGLM2Gv1N1iXUCkOIxaL4tP0q7CFg3Zr0ELRoH
 c1K2fAfx/OZnoqY6EocLtP4K2Gyk7fJHcbAd5+nbSwsumoNC9uZdy1ZbqRPl2ZGb2KR0
 5790YANxN6yo4XDpToutn8HtDWJ9qc4x2RtxrkIe4yf2ys4A7CKPGFlNlR6vaeXcDbDI
 eCRkI67w15jEuFPGTFzQI8EIXARxKyvN1+GR9F9Qoev+vDDjbBqEj+ZoKNPmKxLF0J5U
 DgLQ==
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
 Iurii Zaikin <yzaikin@google.com>, Jeff Dike <jdike@addtoit.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
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

T24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMjowMCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBJdXJpaSBaYWlraW4gKDIwMTktMDYtMDUgMTg6Mjk6
NDIpCj4gPiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAxMToyMiBBTSBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lu
cyAoMjAxOS0wNS0xNCAxNToxNzoxMCkKPiA+ID4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL3N5c2N0
bC10ZXN0LmMgYi9rZXJuZWwvc3lzY3RsLXRlc3QuYwo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZmUwZjJiYWU2NjA4NQo+ID4gPiA+IC0t
LSAvZGV2L251bGwKPiA+ID4gPiArKysgYi9rZXJuZWwvc3lzY3RsLXRlc3QuYwo+ID4gPiA+ICsK
PiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHN5c2N0bF90ZXN0X2RvaW50dmVjX2hhcHB5
X3NpbmdsZV9uZWdhdGl2ZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gPiA+ID4gK3sKPiA+ID4gPiAr
ICAgICAgIHN0cnVjdCBjdGxfdGFibGUgdGFibGUgPSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAg
IC5wcm9jbmFtZSA9ICJmb28iLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAuZGF0YSAgICAgICAg
ICAgPSAmdGVzdF9kYXRhLmludF8wMDAxLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAubWF4bGVu
ICAgICAgICAgPSBzaXplb2YoaW50KSwKPiA+ID4gPiArICAgICAgICAgICAgICAgLm1vZGUgICAg
ICAgICAgID0gMDY0NCwKPiA+ID4gPiArICAgICAgICAgICAgICAgLnByb2NfaGFuZGxlciAgID0g
cHJvY19kb2ludHZlYywKPiA+ID4gPiArICAgICAgICAgICAgICAgLmV4dHJhMSAgICAgICAgID0g
JmlfemVybywKPiA+ID4gPiArICAgICAgICAgICAgICAgLmV4dHJhMiAgICAgICAgID0gJmlfb25l
X2h1bmRyZWQsCj4gPiA+ID4gKyAgICAgICB9Owo+ID4gPiA+ICsgICAgICAgY2hhciBpbnB1dFtd
ID0gIi05IjsKPiA+ID4gPiArICAgICAgIHNpemVfdCBsZW4gPSBzaXplb2YoaW5wdXQpIC0gMTsK
PiA+ID4gPiArICAgICAgIGxvZmZfdCBwb3MgPSAwOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAg
IHRhYmxlLmRhdGEgPSBrdW5pdF9remFsbG9jKHRlc3QsIHNpemVvZihpbnQpLCBHRlBfVVNFUik7
Cj4gPiA+ID4gKyAgICAgICBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgMCwgcHJvY19kb2ludHZlYygm
dGFibGUsIDEsIGlucHV0LCAmbGVuLCAmcG9zKSk7Cj4gPiA+ID4gKyAgICAgICBLVU5JVF9FWFBF
Q1RfRVEodGVzdCwgc2l6ZW9mKGlucHV0KSAtIDEsIGxlbik7Cj4gPiA+ID4gKyAgICAgICBLVU5J
VF9FWFBFQ1RfRVEodGVzdCwgc2l6ZW9mKGlucHV0KSAtIDEsIHBvcyk7Cj4gPiA+ID4gKyAgICAg
ICBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgLTksICooaW50ICopdGFibGUuZGF0YSk7Cj4gPiA+Cj4g
PiA+IElzIHRoZSBjYXN0aW5nIG5lY2Vzc2FyeT8gT3IgY2FuIHRoZSBtYWNybyBkbyBhIHR5cGUg
Y29lcmNpb24gb2YgdGhlCj4gPiA+IHNlY29uZCBwYXJhbWV0ZXIgYmFzZWQgb24gdGhlIGZpcnN0
IHR5cGU/Cj4gPiAgRGF0YSBmaWVsZCBpcyBkZWZpbmVkIGFzIHZvaWQqIHNvIEkgYmVsaWV2ZSBj
YXN0aW5nIGlzIG5lY2Vzc2FyeSB0bwo+ID4gZGVyZWZlcmVuY2UgaXQgYXMgYSBwb2ludGVyIHRv
IGFuIGFycmF5IG9mIGludHMuIEkgZG9uJ3QgdGhpbmsgdGhlCj4gPiBtYWNybyBzaG91bGQgZG8g
YW55IHR5cGUgY29lcmNpb24gdGhhdCA9PSBvcGVyYXRvciB3b3VsZG4ndCBkby4KPiA+ICBJIGRp
ZCBjaGFuZ2UgdGhlIGNhc3QgdG8gbWFrZSBpdCBtb3JlIGNsZWFyIHRoYXQgaXQncyBhIHBvaW50
ZXIgdG8gYW4KPiA+IGFycmF5IG9mIGludHMgYmVpbmcgZGVyZWZlcmVuY2VkLgo+Cj4gT2ssIEkg
c3RpbGwgd29uZGVyIGlmIHdlIHNob3VsZCBtYWtlIEtVTklUX0VYUEVDVF9FUSBjaGVjayB0aGUg
dHlwZXMgb24KPiBib3RoIHNpZGVzIGFuZCBjYXVzZSBhIGJ1aWxkIHdhcm5pbmcvZXJyb3IgaWYg
dGhlIHR5cGVzIGFyZW4ndCB0aGUgc2FtZS4KPiBUaGlzIHdvdWxkIGJlIHNpbWlsYXIgdG8gb3Vy
IG1pbi9tYXggbWFjcm9zIHRoYXQgY29tcGxhaW4gYWJvdXQKPiBtaXNtYXRjaGVkIHR5cGVzIGlu
IHRoZSBjb21wYXJpc29ucy4gVGhlbiBpZiBhIHRlc3QgZGV2ZWxvcGVyIG5lZWRzIHRvCj4gY29u
dmVydCBvbmUgdHlwZSBvciB0aGUgb3RoZXIgdGhleSBjb3VsZCBkbyBzbyB3aXRoIGEKPiBLVU5J
VF9FWFBFQ1RfRVFfVCgpIG1hY3JvIHRoYXQgbGlzdHMgdGhlIHR5cGVzIHRvIGNvZXJjZSBib3Ro
IHNpZGVzIHRvCj4gZXhwbGljaXRseS4KCkdvb2QgcG9pbnQuIEkgd291bGQgZGVmaW5pdGVseSBs
aWtlIHRvIGRvIHRoaXMsIGZvciBtZSBpdCBpcyBvbmx5IGEKcXVlc3Rpb24gb2YgaG93IGRpZmZp
Y3VsdCBpdCB3b3VsZCBiZSB0byBtYWtlIGFsbCB0aGF0IGhhcHBlbi4KCldlIHdpbGwgaW52ZXN0
aWdhdGUgYW5kIHJlcG9ydCBiYWNrIG9uIGl0LgoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEg
SXQncyBhIHJlYWxseSBnb29kIGlkZWEhCgpDaGVlcnMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
