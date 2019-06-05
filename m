Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA696354B3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 02:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF27B89CB3;
	Wed,  5 Jun 2019 00:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B4E89CB3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 00:19:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h11so21518613ljb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 17:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wdmJ9l6dKN/M8KJKaReWlFRx3EElIyLoR59kmGQ0ajY=;
 b=YuqwNq1gTfDCklMFKoaMXUvyG2AsZzpVXKV5TiW6bLg48wTMNyg3MVKSJRCTQRvqIq
 3gcxy5TGE+yLhSGjFMPClQAjL+jz0kdxSISUaSwg5a735TCAS2UAHVOM44jf2xw9PpsJ
 m5btLALosczx7RztB/HCxgwO/kqF+tvZZdKdiw6KP2qwiRuScGeI1OUX8CGncFYDM5eM
 3TzVHJwKnuktoGNNil/cg+eav1CqSaJkvH+jy1l3+8ZUlh+4Vm5cmc4AleTsnYPoNzM7
 GCCHhYrdoBmnLTeSHoimUaeeHr9gCkTUVtS9V5UyQmCpVl+mfLRYQOgyQ3txcxkJuX0P
 VwzA==
X-Gm-Message-State: APjAAAUYy7AbZAs/F9PQoH4JmuX18KiTrfytgEehzCTtc6E9YaNVQtoH
 X8IBIylSxmAr3kCvlRI+AfYpGIcenymhzkcsFSr+Xw==
X-Google-Smtp-Source: APXvYqz12ZqA7QhRnSs7NCGRounbiJim0N2d6mvCnGBaDXvxAiRpIwE1RpZWUzCT4YdYhAmjp6wliW9IQj3YJNSuaRI=
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr3500ljk.120.1559693980056;
 Tue, 04 Jun 2019 17:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-4-brendanhiggins@google.com>
 <20190517174300.7949F20848@mail.kernel.org>
In-Reply-To: <20190517174300.7949F20848@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 4 Jun 2019 17:19:28 -0700
Message-ID: <CAFd5g45WrARi7eXsVKyq2eJH5j+wSrCCaHHSHrMptG7+MnNiTg@mail.gmail.com>
Subject: Re: [PATCH v4 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wdmJ9l6dKN/M8KJKaReWlFRx3EElIyLoR59kmGQ0ajY=;
 b=mWp51IFY9ldz1n3pj1fKrjbn8ZSGPWgwyelkcW6/s7v+y0e0DR/V8GR1ZxM1BsBeAX
 mqVaa/tfXDd/6MEO1OGM22zX0t4jPSi2d71oCngZuhbWkZxio6+sFzeQvWqDrIYIpJuw
 nH2s7y3MrUSzM3dAVIORTn4j8f2hTE4FKXFXiB6vbyOyWM+8sm7qnuJAdZe0dYu2FmQB
 G/4Hd50+HcTF52V70z6ii5Z+BoWQp+0M49tLLSAs+EJ/ROKxeK9GHDSjTGCoNxZTB406
 eMV8PQsiA3EH2MFRRpS50GYwQWxdJ7xN9x1Gd1qekPsZCFSmXsLb0mvz92xMWF6zHTLn
 it2A==
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

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6NDMgQU0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA1LTE0IDE1
OjE2OjU2KQo+ID4gQSBudW1iZXIgb2YgdGVzdCBmZWF0dXJlcyBuZWVkIHRvIGRvIHByZXR0eSBj
b21wbGljYXRlZCBzdHJpbmcgcHJpbnRpbmcKPiA+IHdoZXJlIGl0IG1heSBub3QgYmUgcG9zc2li
bGUgdG8gcmVseSBvbiBhIHNpbmdsZSBwcmVhbGxvY2F0ZWQgc3RyaW5nCj4gPiB3aXRoIHBhcmFt
ZXRlcnMuCj4gPgo+ID4gU28gcHJvdmlkZSBhIGxpYnJhcnkgZm9yIGNvbnN0cnVjdGluZyB0aGUg
c3RyaW5nIGFzIHlvdSBnbyBzaW1pbGFyIHRvCj4gPiBDKysncyBzdGQ6OnN0cmluZy4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0
YXRlZS5jb20+Cj4KPiBJcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB3ZSBjYW4ndCB1c2UgdGhlIHNl
cWZpbGUgQVBJIGZvciB0aGlzPyBUaGVzZQo+IGJvdGggc2hhcmUgYSBzaW1pbGFyIGdvYWwsIGZv
cm1hdHRpbmcgc3RyaW5ncyBpbnRvIGEgYnVmZmVyIHRvIGJlIHJlYWQKPiBsYXRlci4gTWF5YmUg
c29tZSBuZXcgQVBJcyB3b3VsZCBiZSBuZWVkZWQgdG8gZXh0cmFjdCB0aGUgYnVmZmVyCj4gZGlm
ZmVyZW50bHksIGJ1dCBJIGhvcGUgd2UgY291bGQgc2hhcmUgdGhlIGNvZGUuCgpJIGNhbiBzZWUg
d2h5IHlvdSBhcmUgYXNraW5nLiBJdCBzZWVtcyBhcyB0aG91Z2ggdGhleSBhcmUgdHJ5aW5nIHRv
IGRvCipzaW1pbGFyKiB0aGluZ3MsIGFuZCBpdCBzZWVtcyBwb3NzaWJsZSB0aGF0IHdlIG1pZ2h0
IGJlIGFibGUgdG8KZXh0cmFjdCBzb21lIGNvbW1vbiBmdW5jdGlvbmFsaXR5IG91dCBvZiBzZXFf
ZmlsZSB0aGF0IGNvdWxkIHJlcGxhY2UKdGhpczsgaG93ZXZlciwgaXQgbG9va3MgbGlrZSBpdCB3
b3VsZCBiZSByZXF1aXJlIGEgc2lnbmlmaWNhbnQKcmVmYWN0b3Jpbmcgb2Ygc2VxX2ZpbGUgdG8g
c2VwYXJhdGUgb3V0IHRoZSBmaWxlIHN5c3RlbSBzcGVjaWZpYyBiaXRzCmZyb20gdGhlIG1vcmUg
Z2VuZXJhbCBzdHJpbmdidWlsZGVyIGZ1bmN0aW9uYWxpdHkuCgpJbiBteSBvcGluaW9uLCBhIHJl
ZmFjdG9yaW5nIGxpa2UgdGhpcyBtYWtlcyBubyBzZW5zZSBpbiB0aGlzCnBhdGNoc2V0OyBpdCBw
cm9iYWJseSBiZWxvbmdzIGluIGl0cyBvd24gcGF0Y2hzZXQgKHByZWZlcmFibHkgYXMgYQpmb2xs
b3cgb24pLiBJIGFsc28gYW0gbm90IHN1cmUgaWYgdGhlIEZTIHBlb3BsZSB3b3VsZCBhcHByZWNp
YXRlCmluZGlyZWN0aW9uIHRoYXQgc2VydmVzIHRoZW0gbm8gYmVuZWZpdCwgYnV0IEkgY2FuIGFz
ayBpZiB5b3UgbGlrZS4KCj4gSWYgaXQgY2FuJ3QgYmUgdXNlZCwgY2FuIHlvdSBwbGVhc2UgYWRk
IHRoZSByZWFzb25pbmcgdG8gdGhlIGNvbW1pdCB0ZXh0Cj4gaGVyZT8KCldpbGwgZG8uCgpUaGFu
a3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
