Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7569E43
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 23:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95EC89FCA;
	Mon, 15 Jul 2019 21:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890389FD3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:57 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id t16so8001902pfe.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1iVnKb9KyH2VdRaa+1X1AxuS2MqitxfIlVlkn/kOv8=;
 b=aF7oMTD29OQqwYzkF36100QWCHDsGmcPP4UitNN0zpp5TWvdkekUW0EsnhEkiSa4pG
 5DMYgp36wgABq2ebNCQ01F/4XbxjELGAK0VP6LCIgnMvObE6ku1Z+9MHlD5y31/jSXOA
 himaIZi4ATV0DPQGbKtz6TlNZSwQhqwUL6VJObkVE+lsxzqbrR8fductvRfeYwzClYa8
 jIE6S/Ahvfx+k8R3e9Ybl926zdLzWzfZbw/G83K2/hmbqohGmz3lg13ZJ3I1oqy6PmRv
 JtuCxElXUGJ4YZIKu9a2Ri0J5zSA/IzJrK+J7k1eAr5iU5PfyHmjfPx+980pk5iKIAwA
 95NA==
X-Gm-Message-State: APjAAAWanyTNdvLdbLzOYFjXizOGbu+ascMR914hdAHVsoywPl5ws8dj
 WhRj0Z7LwbHxxvLiGfKiqXZ7K74MXloeVKOOn0yzGA==
X-Google-Smtp-Source: APXvYqxYpwH7M9Tn69WNYt23pvYEmwOFSLt2yT+zRsvwVW6B093wD7DIpVEsyGIo3whwBHoCVELofo1GZGIk7QmjTys=
X-Received: by 2002:a63:205f:: with SMTP id r31mr29138784pgm.159.1563225956600; 
 Mon, 15 Jul 2019 14:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-2-brendanhiggins@google.com>
 <20190715201054.C69AA2086C@mail.kernel.org>
In-Reply-To: <20190715201054.C69AA2086C@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 15 Jul 2019 14:25:45 -0700
Message-ID: <CAFd5g44kWHYceo85qxL98JKH2FYBwVLFuLzqNR+APpMC1aKWUQ@mail.gmail.com>
Subject: Re: [PATCH v9 01/18] kunit: test: add KUnit test runner core
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=L1iVnKb9KyH2VdRaa+1X1AxuS2MqitxfIlVlkn/kOv8=;
 b=OKadg9adfR8FnEoQT6HdGl96SBZxASHai1a3d6JJ7kS2KeuZ1gp/Sww0dZ4FNnRfmX
 dsWE9zqYktoShjIU+eYZsCRcFIJfFws6QoK2qlbR+qOq4rr/hOZP2M3LcnN2q482/I73
 uk9eNSjzCb/KkfhP4BJ2nmSyKV5xwGPcSeH7IrIsnT+SSVepNWQYB1x9JIyW2ECp5yWy
 v4jcSyoBZJSrmeWQFBgJn1mNjyDuuQcjVCEz7vy2pTS+5CwXEpnaX+c+7wd+NdqiTuWs
 jLfiDc8e4oMqUtNtGi1qAx20ReiWP9Qgxngtq/5EbA2D41xPwKDuHWOLS0EUq/G9lFRU
 uKpQ==
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMToxMCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTIgMDE6
MTc6MjcpCj4gPiBBZGQgY29yZSBmYWNpbGl0aWVzIGZvciBkZWZpbmluZyB1bml0IHRlc3RzOyB0
aGlzIHByb3ZpZGVzIGEgY29tbW9uIHdheQo+ID4gdG8gZGVmaW5lIHRlc3QgY2FzZXMsIGZ1bmN0
aW9ucyB0aGF0IGV4ZWN1dGUgY29kZSB3aGljaCBpcyB1bmRlciB0ZXN0Cj4gPiBhbmQgZGV0ZXJt
aW5lIHdoZXRoZXIgdGhlIGNvZGUgdW5kZXIgdGVzdCBiZWhhdmVzIGFzIGV4cGVjdGVkOyB0aGlz
IGFsc28KPiA+IHByb3ZpZGVzIGEgd2F5IHRvIGdyb3VwIHRvZ2V0aGVyIHJlbGF0ZWQgdGVzdCBj
YXNlcyBpbiB0ZXN0IHN1aXRlcyAoaGVyZQo+ID4gd2UgY2FsbCB0aGVtIHRlc3RfbW9kdWxlcyku
Cj4gPgo+ID4gSnVzdCBkZWZpbmUgdGVzdCBjYXNlcyBhbmQgaG93IHRvIGV4ZWN1dGUgdGhlbSBm
b3Igbm93OyBzZXR0aW5nCj4gPiBleHBlY3RhdGlvbnMgb24gY29kZSB3aWxsIGJlIGRlZmluZWQg
bGF0ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBl
IDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEx1aXMgQ2hhbWJlcmxhaW4g
PG1jZ3JvZkBrZXJuZWwub3JnPgo+Cj4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRA
a2VybmVsLm9yZz4KPgo+IE1pbm9yIG5pdHMgYmVsb3cuCj4KPiA+IGRpZmYgLS1naXQgYS9rdW5p
dC90ZXN0LmMgYi9rdW5pdC90ZXN0LmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAwLi41NzFlNGM2NWRlYjVjCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysg
Yi9rdW5pdC90ZXN0LmMKPiA+IEBAIC0wLDAgKzEsMTg5IEBACj4gPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsvKgo+ID4gKyAqIEJhc2UgdW5pdCB0ZXN0IChLVW5p
dCkgQVBJLgo+ID4gKyAqCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE5LCBHb29nbGUgTExDLgo+
ID4gKyAqIEF1dGhvcjogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29t
Pgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICsjaW5j
bHVkZSA8a3VuaXQvdGVzdC5oPgo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGt1bml0X3NldF9mYWls
dXJlKHN0cnVjdCBrdW5pdCAqdGVzdCkKPiA+ICt7Cj4gPiArICAgICAgIFdSSVRFX09OQ0UodGVz
dC0+c3VjY2VzcywgZmFsc2UpOwo+ID4gK30KPiA+ICsKPiBbLi4uXQo+ID4gKwo+ID4gK3ZvaWQg
a3VuaXRfaW5pdF90ZXN0KHN0cnVjdCBrdW5pdCAqdGVzdCwgY29uc3QgY2hhciAqbmFtZSkKPiA+
ICt7Cj4gPiArICAgICAgIHRlc3QtPm5hbWUgPSBuYW1lOwo+ID4gKyAgICAgICB0ZXN0LT5zdWNj
ZXNzID0gdHJ1ZTsKPiA+ICt9Cj4gPiArCj4gPiArLyoKPiA+ICsgKiBQZXJmb3JtcyBhbGwgbG9n
aWMgdG8gcnVuIGEgdGVzdCBjYXNlLgo+ID4gKyAqLwo+ID4gK3N0YXRpYyB2b2lkIGt1bml0X3J1
bl9jYXNlKHN0cnVjdCBrdW5pdF9zdWl0ZSAqc3VpdGUsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qga3VuaXRfY2FzZSAqdGVzdF9jYXNlKQo+ID4gK3sKPiA+ICsgICAgICAg
c3RydWN0IGt1bml0IHRlc3Q7Cj4gPiArICAgICAgIGludCByZXQgPSAwOwo+ID4gKwo+ID4gKyAg
ICAgICBrdW5pdF9pbml0X3Rlc3QoJnRlc3QsIHRlc3RfY2FzZS0+bmFtZSk7Cj4gPiArCj4gPiAr
ICAgICAgIGlmIChzdWl0ZS0+aW5pdCkgewo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHN1aXRl
LT5pbml0KCZ0ZXN0KTsKPgo+IENhbiB5b3UgcHVzaCB0aGUgcmV0IGRlZmluaXRpb24gaW50byB0
aGlzIGlmIHNjb3BlPyBUaGF0IHdheSB3ZSBjYW4KPiBhdm9pZCBkZWZhdWx0IGluaXRpYWxpemUg
dG8gMCBmb3IgaXQuCgpTdXJlISBJIHdvdWxkIGFjdHVhbGx5IHByZWZlciB0aGF0IGZyb20gYSBj
b3NtZXRpYyBzdGFuZHBvaW50LiBJIGp1c3QKdGhvdWdodCB0aGF0IG1peGluZyBkZWNsYXJhdGlv
bnMgYW5kIGNvZGUgd2FzIGFnYWluc3QgdGhlIHN0eWxlIGd1aWRlLgoKPiA+ICsgICAgICAgICAg
ICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBrdW5pdF9lcnIoJnRl
c3QsICJmYWlsZWQgdG8gaW5pdGlhbGl6ZTogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBrdW5pdF9zZXRfZmFpbHVyZSgmdGVzdCk7Cj4KPiBEbyB3ZSBuZWVkIHRvICd0
ZXN0X2Nhc2UtPnN1Y2Nlc3MgPSB0ZXN0LnN1Y2Nlc3MnIGhlcmUgdG9vPyBPciBpcyB0aGUKPiB0
ZXN0IGZhaWx1cmUgZXh0cmFjdGVkIHNvbWV3aGVyZSBlbHNlPwoKRXIsIHllcy4gVGhhdCdzIGtp
bmQgb2YgZW1iYXJyYXNzaW5nLiBHb29kIGNhdGNoLgoKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+
ICsgICAgICAgdGVzdF9jYXNlLT5ydW5fY2FzZSgmdGVzdCk7Cj4gPiArCj4gPiArICAgICAgIGlm
IChzdWl0ZS0+ZXhpdCkKPiA+ICsgICAgICAgICAgICAgICBzdWl0ZS0+ZXhpdCgmdGVzdCk7Cj4g
PiArCj4gPiArICAgICAgIHRlc3RfY2FzZS0+c3VjY2VzcyA9IHRlc3Quc3VjY2VzczsKClRoYW5r
cyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
