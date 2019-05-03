Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA71270B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 07:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4198945A;
	Fri,  3 May 2019 05:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1628945A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 05:18:35 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id w6so4260515otl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 22:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TcYMhvle0qn3Vbr1jw5wZlfwobq39YCNyqpLb7cb7Ao=;
 b=bS7fVuz4J7+ADYigt5mEpn+vd12AaIT3/0GlVs/4eSg96CJq/ndhcBjQPFcZJEJ/9l
 ibyBc39FCkNOok0ULjNavlIvD7zhMQM/bP/ZcIcTZt97PUlNOElUUmgVxhTIWFu6NE7l
 O9nn+0W8nhp6WgQKA+snKVesy69roIKCKdxq/XxOyuB7PDJ28ZotjIEQRsgy3l1FNVtB
 8FAZjQJ2QaiNO0iP9CbZIUwi8TQX8Oj4rp51Xn45e0KUth69wYhm0NDWccU4czOP0Uon
 rfsZXzYrbg3hyLsPYlZAOjjlwNMZsJu9EOiaQGGggNiloQpdXASTfsA2ky1J4oZ4PLoZ
 pU9Q==
X-Gm-Message-State: APjAAAVChE953COg3RfCF9UbK6K9sbrqhc15z5cqfXX9t13BxsNXMpfE
 H+2pq6WUiZ5Vb3JfOHO1+FIlclfqISPkWqgHyENWTA==
X-Google-Smtp-Source: APXvYqyA2rSR/zhocpuvfAEjnR+/hEY11wb5Z34WyJg2tb2IGWD/sjsI629/w4anWfW9OX32ft4Cf8TKrI7DL3H8Uik=
X-Received: by 2002:a05:6830:204a:: with SMTP id
 f10mr4960513otp.83.1556860714114; 
 Thu, 02 May 2019 22:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-8-brendanhiggins@google.com>
 <d4934565-9b41-880e-3bbe-984224b50fac@kernel.org>
In-Reply-To: <d4934565-9b41-880e-3bbe-984224b50fac@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 22:18:22 -0700
Message-ID: <CAFd5g44ex8B71K78V7-kRqcRw18Jou_c0KFtTR7wBpArw+P+MQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/17] kunit: test: add initial tests
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TcYMhvle0qn3Vbr1jw5wZlfwobq39YCNyqpLb7cb7Ao=;
 b=vMgoD4BZW5GJfaQp5wHB4n5Uh0dHYfDvtMT6no12+p0edzsKljaBNtH2QSDc0E6VzT
 LcuVJrv7cdGqX7U8FfKi5bagOC/nhHdsiKYsGPft1mReUq108TVFisXe9TJrijP3ncN9
 v39q83CXeT5lkt4WLd/fwqU8g5riscYutv4Dl0z3LH4QLnkrqcMdMPzrzbEAqplHU0Uu
 m3PA8EGRjwXV1jBeELzeCCKDGehqdroKwQf1lX98y7iQ89oh7pPsirzbD3JpTdCcD6Pl
 9jznQM6AV2RqS1bTQE7nMwTk67da6P41iEI1afzG3TYud6oBdVc8/EIcpi2ctCF9A2Zz
 QXpg==
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 skhan@linuxfoundation.org, Dan Williams <dan.j.williams@intel.com>,
 kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA2OjI3IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDUvMS8xOSA1OjAxIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBB
ZGQgYSB0ZXN0IGZvciBzdHJpbmcgc3RyZWFtIGFsb25nIHdpdGggYSBzaW1wbGVyIGV4YW1wbGUu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bn
b29nbGUuY29tPgo+ID4gLS0tCj4gPiAgIGt1bml0L0tjb25maWcgICAgICAgICAgICAgIHwgMTIg
KysrKysrCj4gPiAgIGt1bml0L01ha2VmaWxlICAgICAgICAgICAgIHwgIDQgKysKPiA+ICAga3Vu
aXQvZXhhbXBsZS10ZXN0LmMgICAgICAgfCA4OCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gICBrdW5pdC9zdHJpbmctc3RyZWFtLXRlc3QuYyB8IDYxICsrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTY1IGluc2VydGlvbnMo
KykKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGt1bml0L2V4YW1wbGUtdGVzdC5jCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC9zdHJpbmctc3RyZWFtLXRlc3QuYwo+ID4KPiA+IGRpZmYg
LS1naXQgYS9rdW5pdC9LY29uZmlnIGIva3VuaXQvS2NvbmZpZwo+ID4gaW5kZXggNjQ0ODAwOTJi
MmMyNC4uNWNiNTAwMzU1Yzg3MyAxMDA2NDQKPiA+IC0tLSBhL2t1bml0L0tjb25maWcKPiA+ICsr
KyBiL2t1bml0L0tjb25maWcKPiA+IEBAIC0xMyw0ICsxMywxNiBAQCBjb25maWcgS1VOSVQKPiA+
ICAgICAgICAgc3BlY2lhbCBoYXJkd2FyZS4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHBsZWFzZSBz
ZWUKPiA+ICAgICAgICAgRG9jdW1lbnRhdGlvbi9rdW5pdC8KPiA+Cj4gPiArY29uZmlnIEtVTklU
X1RFU1QKPiA+ICsgICAgIGJvb2wgIktVbml0IHRlc3QgZm9yIEtVbml0Igo+ID4gKyAgICAgZGVw
ZW5kcyBvbiBLVU5JVAo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBFbmFibGVzIEtVbml0IHRl
c3QgdG8gdGVzdCBLVW5pdC4KPiA+ICsKPgo+IFBsZWFzZSBhZGQgYSBiaXQgbW9yZSBpbmZvcm1h
dGlvbiBvbiB3aGF0IHRoaXMgY29uZmlnIG9wdGlvbgo+IGRvZXMuIFdoeSBzaG91bGQgdXNlciBj
YXJlIHRvIGVuYWJsZSBpdD8KPgo+ID4gK2NvbmZpZyBLVU5JVF9FWEFNUExFX1RFU1QKPiA+ICsg
ICAgIGJvb2wgIkV4YW1wbGUgdGVzdCBmb3IgS1VuaXQiCj4gPiArICAgICBkZXBlbmRzIG9uIEtV
TklUCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEVuYWJsZXMgZXhhbXBsZSBLVW5pdCB0ZXN0
IHRvIGRlbW8gZmVhdHVyZXMgb2YgS1VuaXQuCj4gPiArCj4KPiBTYW1lIGhlcmUuCgpTb3VuZHMg
cmVhc29uYWJsZS4gV2lsbCBmaXggaW4gdGhlIG5leHQgcmV2aXNpb24uCgo8IHNuaXAgPgoKVGhh
bmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
