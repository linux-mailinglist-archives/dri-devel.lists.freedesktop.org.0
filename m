Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DAC62A7E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 22:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CF0899B7;
	Mon,  8 Jul 2019 20:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B3D899B7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 20:40:39 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i189so8146171pfg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 13:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EH/dsB4RqvQOyHG8BqAIo5WKk7GQxacBNIaWqTFNQk=;
 b=GDtdWWGpsn3YFKG98emU+zkspB3eXl1+uyO4QHF+muKPRQxqc8SkloAx+AATpEKLf9
 V+kZFn/+CSfKg3DyEWb9H8irhGd8ulnpqEfnpedIeuytQ1wHwix60s9MzzGuZhJRtG/Q
 53MMG1kYkZLyohAPxy2paR7pYwF7/JYKsqTggUnkZiMO65zIleg1lqL5RYu2cHy1oCLk
 vgnWFAszY7bLAuJvCRDkauKF4cIev7wx5Lx9C7ZyrHPsWFdQgFGj/ApyUAozY8++qU57
 TkAY7dE5ZoogbUAg/nkJTsqgtu3Gf5+UwDHmaUHISgLLJLPsvTFd8aw3zT0kSj21Ii0h
 Desw==
X-Gm-Message-State: APjAAAVZGwBNVPWoY9hKHeTiQzhxkSVB1ltwNGv+Nf6aOkBXUK9t88+j
 h1D890T3jZFrZ3tQhJPbCgNH2iVo5Ivk8+Uj+Tm9MQ==
X-Google-Smtp-Source: APXvYqxcFK88vAm0YlECpUDpB3imcSno03RwL+0jyEa5ghv7TUPzQiwa16nbo1CO7XiLvpWqedp7ntBebsLNBqTl9bk=
X-Received: by 2002:a63:205f:: with SMTP id r31mr26169271pgm.159.1562618438201; 
 Mon, 08 Jul 2019 13:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com>
 <20190705201505.GA19023@42.do-not-panic.com>
 <CAFd5g45cF9rYc8YupnCgd=7xz_yW+_TMp_L+cSFUBW7d9njnVQ@mail.gmail.com>
In-Reply-To: <CAFd5g45cF9rYc8YupnCgd=7xz_yW+_TMp_L+cSFUBW7d9njnVQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 Jul 2019 13:40:26 -0700
Message-ID: <CAFd5g44XV0zDpNgyDPSFMq86kSvwGb_WjhxzK=AoDMjwXD5CgQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/EH/dsB4RqvQOyHG8BqAIo5WKk7GQxacBNIaWqTFNQk=;
 b=Cdb6f6dII91+peQ4OxFhgsypxNIcC8Z96r5C/ePNEUz85za5Vbi9Ob9WFL7Wp+O6qA
 s2FU4elMc5PHawGRh4mEgei2UKYeL/Om110iQOt9EZjbTGZ35yhM+QknG6GV4EILqbGV
 fSE/mjTDSVLrTvE9E8XjufRwxMYJiGpgmnm9Gj+28y8fI57C27MrUrxnEuTgssOH22rV
 X2wra0aYtt04uPd5Nd5e58e/ejOR/kNGkFgfkF6uBhS0Gc+UnNjzMr5rpGuXODaRO3/6
 S/LEDw4EBPf512R+tktyLb6BY2Kbd/uedF4s+xPbNcfpXnjQo8TaENBYjaBvCticdcKk
 s+NQ==
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

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxMTowOCBBTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxOjE1
IFBNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBXZWQsIEp1bCAwMywgMjAxOSBhdCAwNTozNTo1OFBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMg
d3JvdGU6Cj4gPiA+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nIHVuaXQgdGVzdHM7
IHRoaXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4gPiA+IHRvIGRlZmluZSB0ZXN0IGNhc2VzLCBm
dW5jdGlvbnMgdGhhdCBleGVjdXRlIGNvZGUgd2hpY2ggaXMgdW5kZXIgdGVzdAo+ID4gPiBhbmQg
ZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNvZGUgdW5kZXIgdGVzdCBiZWhhdmVzIGFzIGV4cGVjdGVk
OyB0aGlzIGFsc28KPiA+ID4gcHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAgdG9nZXRoZXIgcmVsYXRl
ZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3VpdGVzIChoZXJlCj4gPiA+IHdlIGNhbGwgdGhlbSB0ZXN0
X21vZHVsZXMpLgo+ID4gPgo+ID4gPiBKdXN0IGRlZmluZSB0ZXN0IGNhc2VzIGFuZCBob3cgdG8g
ZXhlY3V0ZSB0aGVtIGZvciBub3c7IHNldHRpbmcKPiA+ID4gZXhwZWN0YXRpb25zIG9uIGNvZGUg
d2lsbCBiZSBkZWZpbmVkIGxhdGVyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFu
IEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gPiBSZXZp
ZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+ID4KPiA+IFJl
dmlld2VkLWJ5OiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KPiA+Cj4gPiBC
dXQgYSBuaXRwaWNrIGJlbG93LCBJIHRoaW5rIHRoYXQgY2FuIGJlIGZpeGVkIGxhdGVyIHdpdGgg
YSBmb2xsb3cgdXAKPiA+IHBhdGNoLgo+ID4KPiA+ID4gKy8qKgo+ID4gPiArICogc3RydWN0IGt1
bml0IC0gcmVwcmVzZW50cyBhIHJ1bm5pbmcgaW5zdGFuY2Ugb2YgYSB0ZXN0Lgo+ID4gPiArICog
QHByaXY6IGZvciB1c2VyIHRvIHN0b3JlIGFyYml0cmFyeSBkYXRhLiBDb21tb25seSB1c2VkIHRv
IHBhc3MgZGF0YSBjcmVhdGVkCj4gPiA+ICsgKiBpbiB0aGUgaW5pdCBmdW5jdGlvbiAoc2VlICZz
dHJ1Y3Qga3VuaXRfc3VpdGUpLgo+ID4gPiArICoKPiA+ID4gKyAqIFVzZWQgdG8gc3RvcmUgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIGN1cnJlbnQgY29udGV4dCB1bmRlciB3aGljaCB0aGUgdGVzdCBp
cwo+ID4gPiArICogcnVubmluZy4gTW9zdCBvZiB0aGlzIGRhdGEgaXMgcHJpdmF0ZSBhbmQgc2hv
dWxkIG9ubHkgYmUgYWNjZXNzZWQgaW5kaXJlY3RseQo+ID4gPiArICogdmlhIHB1YmxpYyBmdW5j
dGlvbnM7IHRoZSBvbmUgZXhjZXB0aW9uIGlzIEBwcml2IHdoaWNoIGNhbiBiZSB1c2VkIGJ5IHRo
ZQo+ID4gPiArICogdGVzdCB3cml0ZXIgdG8gc3RvcmUgYXJiaXRyYXJ5IGRhdGEuCj4gPiA+ICsg
Kgo+ID4gPiArICogQSBicmllZiBub3RlIG9uIGxvY2tpbmc6Cj4gPiA+ICsgKgo+ID4gPiArICog
Rmlyc3Qgb2ZmLCB3ZSBuZWVkIHRvIGxvY2sgYmVjYXVzZSBpbiBjZXJ0YWluIGNhc2VzIGEgdXNl
ciBtYXkgd2FudCB0byB1c2UgYW4KPiA+ID4gKyAqIGV4cGVjdGF0aW9uIGluIGEgdGhyZWFkIG90
aGVyIHRoYW4gdGhlIHRocmVhZCB0aGF0IHRoZSB0ZXN0IGNhc2UgaXMgcnVubmluZwo+ID4gPiAr
ICogaW4uCj4gPgo+ID4gVGhpcyBhcyBhIHByZWZpeCB0byB0aGUgc3RydWN0IHdpdGhvdXQgYSBs
b2NrIHNlZW1zIG9kZC4gSXQgd291bGQgYmUKPiA+IGNsZWFyZXIgSSB0aGluayBpZiB5b3UnZCBl
eHBsYWluIGhlcmUgd2hhdCBsb2NraW5nIG1lY2hhbmlzbSB3ZSBkZWNpZGVkCj4gPiB0byB1c2Ug
YW5kIHdoeSBpdCBzdWZmaWNlcyB0b2RheS4KPgo+IFdob29wcywgc29ycnkgdGhpcyBzaG91bGQg
aGF2ZSBiZWVuIGluIHRoZSBuZXh0IHBhdGNoLiBXaWxsIGZpeC4KCkVyci4ubm8sIHRoaXMgc2hv
dWxkbid0IGJlIGhlcmUgYXQgYWxsLiBTb3JyeSBhYm91dCB0aGF0LiBJIGp1c3QgbmVlZAp0byBy
ZXdyaXRlIHRoZSBjb21tZW50LgoKPiA+ID4gKy8qKgo+ID4gPiArICogc3VpdGVfdGVzdCgpIC0g
dXNlZCB0byByZWdpc3RlciBhICZzdHJ1Y3Qga3VuaXRfc3VpdGUgd2l0aCBLVW5pdC4KPiA+Cj4g
PiBZb3UgbWVhbiBrdW5pdF90ZXN0X3N1aXRlKCk/Cj4KPiBZZXAsIHNvcnJ5IGFib3V0IHRoYXQu
IFdpbGwgZml4Lgo+Cj4gPiA+ICsgKiBAc3VpdGU6IGEgc3RhdGljYWxseSBhbGxvY2F0ZWQgJnN0
cnVjdCBrdW5pdF9zdWl0ZS4KPiA+ID4gKyAqCj4gPiA+ICsgKiBSZWdpc3RlcnMgQHN1aXRlIHdp
dGggdGhlIHRlc3QgZnJhbWV3b3JrLiBTZWUgJnN0cnVjdCBrdW5pdF9zdWl0ZSBmb3IgbW9yZQo+
ID4gPiArICogaW5mb3JtYXRpb24uCj4gPiA+ICsgKgo+ID4gPiArICogTk9URTogQ3VycmVudGx5
IEtVbml0IHRlc3RzIGFyZSBhbGwgcnVuIGFzIGxhdGVfaW5pdGNhbGxzOyB0aGlzIG1lYW5zIHRo
YXQKPiA+ID4gKyAqIHRoZXkgY2Fubm90IHRlc3QgYW55dGhpbmcgd2hlcmUgdGVzdHMgbXVzdCBy
dW4gYXQgYSBkaWZmZXJlbnQgaW5pdCBwaGFzZS4gT25lCj4gPiA+ICsgKiBzaWduaWZpY2FudCBy
ZXN0cmljdGlvbiByZXN1bHRpbmcgZnJvbSB0aGlzIGlzIHRoYXQgS1VuaXQgY2Fubm90IHJlbGlh
Ymx5Cj4gPiA+ICsgKiB0ZXN0IGFueXRoaW5nIHRoYXQgaXMgaW5pdGlhbGl6ZSBpbiB0aGUgbGF0
ZV9pbml0IHBoYXNlLgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluaXRpYWxpemUg
cHJpb3IgdG8gdGhlIGxhdGUgaW5pdCBwaGFzZS4KPiA+Cj4gPgo+ID4gVGhhdCBpcywgdGhpcyBp
cyB1c2VsZXNzIHRvIHRlc3QgdGhpbmdzIHJ1bm5pbmcgZWFybHkuCj4KPiBZZWFoLCBJIGNhbiBh
ZGQgdGhhdCBwaHJhc2luZyBpbi4KPgo+ID4gPiArICoKPiA+ID4gKyAqIFRPRE8oYnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbSk6IERvbid0IHJ1biBhbGwgS1VuaXQgdGVzdHMgYXMgbGF0ZV9pbml0
Y2FsbHMuCj4gPiA+ICsgKiBJIGhhdmUgc29tZSBmdXR1cmUgd29yayBwbGFubmVkIHRvIGRpc3Bh
dGNoIGFsbCBLVW5pdCB0ZXN0cyBmcm9tIHRoZSBzYW1lCj4gPiA+ICsgKiBwbGFjZSwgYW5kIGF0
IHRoZSB2ZXJ5IGxlYXN0IHRvIGRvIHNvIGFmdGVyIGV2ZXJ5dGhpbmcgZWxzZSBpcyBkZWZpbml0
ZWx5Cj4gPiA+ICsgKiBpbml0aWFsaXplZC4KPiA+Cj4gPiBUT0RPcyBhcmUgb2RkIHRvIGJlIGFk
ZGluZyB0byBkb2N1bWVudGF0aW9uLCB0aGlzIGlzIGp1c3Qgbm90IGNvbW1vbgo+ID4gcGxhY2Ug
cHJhY3RpY2UuIFRoZSBOT1RFIHNob3VsZCBzdWZmaWNlIGZvciB5b3UuCj4KPiBCZWNhdXNlIGl0
IGlzIGEga2VybmVsIGRvYz8gV291bGQgeW91IHVzdWFsbHkgbWFrZSBhIHNlcGFyYXRlCj4gbm9u
LWtlcm5lbCBkb2MgY29tbWVudCBmb3IgYSBUT0RPPyBJIGd1ZXNzIHRoYXQgbWFrZXMgc2Vuc2Uu
Cj4KPiBUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
