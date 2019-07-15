Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3369F18
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 00:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296EB89DE1;
	Mon, 15 Jul 2019 22:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA4E89DE1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 22:43:34 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id o13so8382129pgp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0dmaddygNqZgaGUDAa6cmxBvESBVDt3nRTuc2Ed70Y=;
 b=DfxvPqh7t8WuHA/X2TvAID/H7MqH2BYslXjGj8EuHB4171RlheWZfE9kMo6yz6tMHB
 OSojOwE5GxCVmFGt2M0PTJ7ExA0UuPTvHjWFeY5LtKa8Y6+kTILU657SfVxmSn1iDnQ0
 5RFT/egrHGoxhzP47dsZOnac60Z1UE34BlUY/Yg1pyD3dfUdyKqhtNZmWOJDDYpp5qi5
 Se8xy30eqmKX/uYQqhmncDBsP3Od0/93TCM/J2s3Z2ZSXB3Hxe8xaliQQ91fw+ivhKzj
 0sZs1pu6XWwUwQ8pb4dhZcWJT8vbNVcL3wthGEt7bmtjXodIcAvkYXNAl1VdlZryFStw
 u8ZA==
X-Gm-Message-State: APjAAAWTog7lgkdquUtU7VXnNOOXwGLxbTuVU+3tPYGFXlOPMvob3QqK
 SXeZiemKaqp6T1Qjq+d+pI1oSuUhhdhbAi1JRdwLyw==
X-Google-Smtp-Source: APXvYqwafDOiX+PiabduZWro+OOpT5RPBS9Ci2pxCrNN9UWVIxex8mHl/Rh2UWEvSxgoEZAT49mdKVcWgja67R7I7ck=
X-Received: by 2002:a63:eb51:: with SMTP id b17mr28611693pgk.384.1563230612372; 
 Mon, 15 Jul 2019 15:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-4-brendanhiggins@google.com>
 <20190715204356.4E3F92145D@mail.kernel.org>
 <CAFd5g47481sRaez=yEJN4_ghiXZbxayk1Y04tAZpuzPLsmnhKg@mail.gmail.com>
 <20190715220407.0030420665@mail.kernel.org>
 <CAFd5g44bE0F=wq_fOAnxFTtoOyx1dUshhDAkKWr5hX9ipJ4Sxw@mail.gmail.com>
In-Reply-To: <CAFd5g44bE0F=wq_fOAnxFTtoOyx1dUshhDAkKWr5hX9ipJ4Sxw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 15 Jul 2019 15:43:20 -0700
Message-ID: <CAFd5g47y4vDB2P=EsGN8305LGeQPCTveNs-Jd5-=6K-XKY==CA@mail.gmail.com>
Subject: Re: [PATCH v9 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=B0dmaddygNqZgaGUDAa6cmxBvESBVDt3nRTuc2Ed70Y=;
 b=TvefYQ4CXwYECIE1DD5mMNTXSS5HYvyG/pzvPIWc/AcUeE000MlMBoQ+UnA0lQ1n5F
 J7msY35wgId7ntbvKXqQfoaqQ86v3mXkjix4KiLl4u6U93/fC5IaevmselacDdowCR/G
 iyLUy9PuUK6XnxYy7VDz4MJceIVqGDB7wOfFH9e4PAIu+KvegnYNT6RGkjvCG2CcAryr
 zNpIkVs0KHES2MAvXC6bkPoPCjnPfiickXXO58iW726KzLdfp/yLgSvrpmy/5Ix9KBQ0
 9sghkw+DYAjzdFPtaBU764DprOajqeRr5/CW8du6jhE57m3uscWi90TZpp/kvfYXdZoS
 /10w==
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMzoxMSBQTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMzow
NCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFF1b3Rp
bmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA3LTE1IDE0OjExOjUwKQo+ID4gPiBPbiBNb24sIEp1
bCAxNSwgMjAxOSBhdCAxOjQzIFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBJIGFsc28gd29uZGVyIGlmIGl0IHdvdWxkIGJlIGJldHRlciB0
byBqdXN0IGhhdmUgYSBiaWcgc2xvcCBidWZmZXIgb2YgYQo+ID4gPiA+IDRLIHBhZ2Ugb3Igc29t
ZXRoaW5nIHNvIHRoYXQgd2UgYWxtb3N0IG5ldmVyIGhhdmUgdG8gYWxsb2NhdGUgYW55dGhpbmcK
PiA+ID4gPiB3aXRoIGEgc3RyaW5nX3N0cmVhbSBhbmQgd2UgY2FuIGp1c3QgcmVseSBvbiBhIHJl
YWRlciBjb25zdW1pbmcgZGF0YQo+ID4gPiA+IHdoaWxlIHdyaXRlcnMgYXJlIHdyaXRpbmcuIFRo
YXQgbWlnaHQgd29yayBvdXQgYmV0dGVyLCBidXQgSSBkb24ndCBxdWl0ZQo+ID4gPiA+IHVuZGVy
c3RhbmQgdGhlIHVzZSBjYXNlIGZvciB0aGUgc3RyaW5nIHN0cmVhbS4KPiA+ID4KPiA+ID4gVGhh
dCBtYWtlcyBzZW5zZSwgYnV0IG1pZ2h0IHRoYXQgYWxzbyB3YXN0ZSBtZW1vcnkgc2luY2Ugd2Ug
d2lsbAo+ID4gPiBhbG1vc3QgbmV2ZXIgbmVlZCB0aGF0IG11Y2ggbWVtb3J5Pwo+ID4KPiA+IFdo
eSBkbyB3ZSBjYXJlPyBUaGVzZSBhcmUgdW5pdCB0ZXN0cy4KPgo+IEFncmVlZC4KPgo+ID4gSGF2
aW5nIGFsbG9jYXRpb25zIGluIGhlcmUgbWFrZXMKPiA+IHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVk
LCB3aGVyZWFzIGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gaGF2ZSBhIHBvaW50ZXIKPiA+IGFuZCBh
IHNwaW5sb2NrIG9wZXJhdGluZyBvbiBhIGNodW5rIG9mIG1lbW9yeSB0aGF0IGdldHMgZmx1c2hl
ZCBvdXQKPiA+IHBlcmlvZGljYWxseS4KPgo+IEkgYW0gbm90IHNvIHN1cmUuIEkgaGF2ZSB0byBo
YXZlIHRoZSBsb2dpYyB0byBhbGxvY2F0ZSBtZW1vcnkgaW4gc29tZQo+IGNhc2Ugbm8gbWF0dGVy
IHdoYXQgKHdoYXQgaWYgSSBuZWVkIG1vcmUgbWVtb3J5IHRoYXQgbXkgcHJlYWxsb2NhdGVkCj4g
Y2h1Y2s/KS4gSSB0aGluayBpdCBpcyBzaW1wbGVyIHRvIGFsd2F5cyByZXF1ZXN0IGFuIGFsbG9j
YXRpb24gdGhhbiB0bwo+IG9ubHkgc29tZXRpbWVzIHJlcXVlc3QgYW4gYWxsb2NhdGlvbi4KCkFu
b3RoZXIgZXZlbiBzaW1wbGVyIGFsdGVybmF0aXZlIG1pZ2h0IGJlIHRvIGp1c3QgYWxsb2NhdGUg
bWVtb3J5CnVzaW5nIGt1bml0X2ttYWxsb2MgYXMgd2UgbmVlZCBpdCBhbmQganVzdCBsZXQgdGhl
IGt1bml0X3Jlc291cmNlIGNvZGUKaGFuZGxlIGNsZWFuaW5nIGl0IGFsbCB1cCB3aGVuIHRoZSB0
ZXN0IGNhc2UgZmluaXNoZXMuCgpXaGF0IGRvIHlvdSB0aGluaz8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
