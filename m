Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB0595C2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4E6E885;
	Fri, 28 Jun 2019 08:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D38E6E885
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 08:09:56 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w10so2240714pgj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 01:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yibP/Iv6ps2Lbs4MfioQUnaQ1X0MZgCBiZaerRAAUs0=;
 b=NFDkWTvtMnBmRhwUQWcp6YlTGk3wmRkjhz4gHEOupXGkF7XSakcODp1SDrCHf3tpwz
 U2jWZZgAzJLZMJjo7FAfNN0ky3UECzn+at2QRuAvxJB5QDaoQHsAgTy7hVXSqqrE8VoD
 17nBqEg4SUn1JkJkY9XOLu+K6hCZtYV1eE6bnRcDS6T4wnmwP6v6B0ZsN4mCD5os/85n
 6aYpOCjU8auML/y0UXqVS7NoancjPbALhqlv7G5Qkw2TkSmhy56/KDOWTOu4j4sUcX45
 NqFg4JeN0nGoU1wxHblT/DydZF3uidHJvck2ektcr4G7K5J3mwn4kj4kbzEXMe/+k7ha
 5FmQ==
X-Gm-Message-State: APjAAAUvgihq9L7/T5Mc7mIJ1Nu6ABhdGq1CgU/KmKHZCHagDIP4h9l3
 HgghdhjidyqOV4xYkUwNN1F6d71zIuZGmzu+HwMBsA==
X-Google-Smtp-Source: APXvYqwa5Gi43WdeQYYulM3cScojWTt0/MI+kDN9NbNdt1CeW4jxKTFR3Algm98Jmh+XvwAADJqdAi9a1c1dDVA05Ew=
X-Received: by 2002:a17:90a:be0d:: with SMTP id
 a13mr11033056pjs.84.1561709395368; 
 Fri, 28 Jun 2019 01:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
 <20190626034100.B238520883@mail.kernel.org>
 <CAFd5g46zHAupdUh3wDuqPJti2M+_=oje_5weFe7AVLQfkDDM6A@mail.gmail.com>
 <20190627181636.5EA752064A@mail.kernel.org>
In-Reply-To: <20190627181636.5EA752064A@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Jun 2019 01:09:44 -0700
Message-ID: <CAFd5g44V3ZLNazUOgOo2sFR3zzbNnTkH4e9uxGX4iHi7G73Mzw@mail.gmail.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yibP/Iv6ps2Lbs4MfioQUnaQ1X0MZgCBiZaerRAAUs0=;
 b=e5kLlPi61UOlg3aWbm3hyHJ6zEvPrbJg4WaMTgr5J7N6beCFHbvMVMWvXm34zFIMK6
 sy+TCthgNvl6QKdGAvF199JWgLSzY0riL7Qema9Z8eQSMrEVD7QmDgObmKA9VnGm6jQk
 Qk9Vw4tG1NS/Rsaor+MwqJJtzbW9NLCCg64qdKIwo/lqdLjqjD0HoEJZR2UkGwIQNQU7
 B8LVi8olEdiEG1gQQPAGB3QH7tntl/R65/A9R5rItsLpolqg+IRJEp1Du/WH5LqoOfL3
 I3l8I0kuDspWHSG/V5vI+q5UJh9nND3VlxUlk753w0GhWsuvm1nMSIm2VqKl1wq8mbGo
 9uhw==
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

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6MTYgQU0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA2LTI2IDE2
OjAwOjQwKQo+ID4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgODo0MSBQTSBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gc2NlbmFyaW8gbGlrZSBiZWxvdywg
YnV0IHdoZXJlIGl0IGlzIGEgcHJvYmxlbS4gVGhlcmUgY291bGQgYmUgdGhyZWUKPiA+ID4gQ1BV
cywgb3IgZXZlbiBvbmUgQ1BVIGFuZCB0aHJlZSB0aHJlYWRzIGlmIHlvdSB3YW50IHRvIGRlc2Ny
aWJlIHRoZQo+ID4gPiBleHRyYSB0aHJlYWQgc2NlbmFyaW8uCj4gPiA+Cj4gPiA+IEhlcmUncyBt
eSBzY2VuYXJpbyB3aGVyZSBpdCBpc24ndCBuZWVkZWQ6Cj4gPiA+Cj4gPiA+ICAgICBDUFUwICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUxCj4gPiA+ICAgICAtLS0tICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tCj4gPiA+ICAgICBrdW5pdF9y
dW5fdGVzdCgmdGVzdCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHRlc3RfY2FzZV9mdW5jKCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgW21vY2sgaGFyZGlycV0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfc2V0X3N1Y2Nlc3MoJnRl
c3QpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBb
aGFyZGlycSBlbmRzXQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAuLi4KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGxldGUoJnRlc3RfZG9uZSkKPiA+ID4gICAgICAgd2FpdF9mb3JfY29t
cGxldGlvbigmdGVzdF9kb25lKQo+ID4gPiAgICAgICBrdW5pdF9nZXRfc3VjY2VzcygmdGVzdCkK
PiA+ID4KPiA+ID4gV2UgZG9uJ3QgbmVlZCB0byBjYXJlIGFib3V0IGhhdmluZyBsb2NraW5nIGhl
cmUgYmVjYXVzZSBzdWNjZXNzIG9yCj4gPiA+IGZhaWx1cmUgb25seSBoYXBwZW5zIGluIG9uZSBw
bGFjZSBhbmQgaXQncyBzeW5jaHJvbml6ZWQgd2l0aCB0aGUKPiA+ID4gY29tcGxldGlvbi4KPiA+
Cj4gPiBIZXJlIGlzIHRoZSBzY2VuYXJpbyBJIGFtIGNvbmNlcm5lZCBhYm91dDoKPiA+Cj4gPiBD
UFUwICAgICAgICAgICAgICAgICAgICAgIENQVTEgICAgICAgICAgICAgICAgICAgICAgIENQVTIK
PiA+IC0tLS0gICAgICAgICAgICAgICAgICAgICAgLS0tLSAgICAgICAgICAgICAgICAgICAgICAg
LS0tLQo+ID4ga3VuaXRfcnVuX3Rlc3QoJnRlc3QpCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRlc3RfY2FzZV9mdW5jKCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuLi4u
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NoZWR1bGVfd29yayhmb29fZnVuYykK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgW21vY2sgaGFyZGlycV0gICAgICAgICAgICAg
Zm9vX2Z1bmMoKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLiAgICAgICAgICAg
ICAgICAgICAgICAgIC4uLgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt1bml0X3Nl
dF9zdWNjZXNzKGZhbHNlKSAgIGt1bml0X3NldF9zdWNjZXNzKGZhbHNlKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBbaGFyZGlycSBlbmRzXSAgICAgICAgICAgICAgIC4uLgo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC4uLgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBsZXRlKCZ0ZXN0X2RvbmUpCj4gPiAgIHdhaXRfZm9yX2NvbXBsZXRpb24oLi4uKQo+
ID4gICBrdW5pdF9nZXRfc3VjY2VzcygmdGVzdCkKPiA+Cj4gPiBJbiBteSBzY2VuYXJpbywgc2lu
Y2UgYm90aCBDUFUxIGFuZCBDUFUyIHVwZGF0ZSB0aGUgc3VjY2VzcyBzdGF0dXMgb2YKPiA+IHRo
ZSB0ZXN0IHNpbXVsdGFuZW91c2x5LCBldmVuIHRob3VnaCB0aGV5IGFyZSBzZXR0aW5nIGl0IHRv
IHRoZSBzYW1lCj4gPiB2YWx1ZS4gSWYgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LCB0aGlz
IGNvdWxkIHJlc3VsdCBpbiBhCj4gPiB3cml0ZS10ZWFyIG9uIHNvbWUgYXJjaGl0ZWN0dXJlcyBp
biBzb21lIGNpcmN1bXN0YW5jZXMuIEkgc3VwcG9zZSB3ZQo+ID4gY291bGQganVzdCBtYWtlIGl0
IGFuIGF0b21pYyBib29sZWFuLCBidXQgSSBmaWd1cmVkIGxvY2tpbmcgaXMgYWxzbwo+ID4gZmlu
ZSwgYW5kIGdlbmVyYWxseSBwcmVmZXJyZWQuCj4KPiBUaGlzIGlzIHdoYXQgd2UgaGF2ZSBXUklU
RV9PTkNFKCkgYW5kIFJFQURfT05DRSgpIGZvci4gTWF5YmUgeW91IGNvdWxkCj4ganVzdCB1c2Ug
dGhhdCBpbiB0aGUgZ2V0dGVyIGFuZCBzZXR0ZXJzIGFuZCByZW1vdmUgdGhlIGxvY2sgaWYgaXQg
aXNuJ3QKPiB1c2VkIGZvciBhbnl0aGluZyBlbHNlLgo+Cj4gSXQgbWF5IGFsc28gYmUgYSBnb29k
IGlkZWEgdG8gaGF2ZSBhIGt1bml0X2ZhaWxfdGVzdCgpIEFQSSB0aGF0IGZhaWxzCj4gdGhlIHRl
c3QgcGFzc2VkIGluIHdpdGggYSBXUklURV9PTkNFKGZhbHNlKS4gT3RoZXJ3aXNlLCB0aGUgdGVz
dCBpcwo+IGFzc3VtZWQgc3VjY2Vzc2Z1bCBhbmQgaXQgaXNuJ3QgZXZlbiBwb3NzaWJsZSBmb3Ig
YSB0ZXN0IHRvIGNoYW5nZSB0aGUKPiBzdGF0ZSBmcm9tIGZhaWx1cmUgdG8gc3VjY2VzcyBkdWUg
dG8gYSBsb2dpY2FsIGVycm9yIGJlY2F1c2UgdGhlIEFQSQo+IGlzbid0IGF2YWlsYWJsZS4gVGhl
biB3ZSBkb24ndCByZWFsbHkgbmVlZCB0byBoYXZlIGEgZ2VuZXJpYwo+IGt1bml0X3NldF9zdWNj
ZXNzKCkgZnVuY3Rpb24gYXQgYWxsLiBXZSBjb3VsZCBoYXZlIGEga3VuaXRfdGVzdF9mYWlsZWQo
KQo+IGZ1bmN0aW9uIHRvbyB0aGF0IHJlcGxhY2VzIHRoZSBrdW5pdF9nZXRfc3VjY2VzcygpIGZ1
bmN0aW9uLiBUaGF0IHdvdWxkCj4gcmVhZCBiZXR0ZXIgaW4gYW4gaWYgY29uZGl0aW9uLgoKWW91
IGtub3cgd2hhdCwgSSB0aGluayB5b3UgYXJlIHJpZ2h0LgoKU29ycnksIGZvciBub3QgcmVhbGl6
aW5nIHRoaXMgZWFybGllciwgSSB0aGluayB5b3UgbWVudGlvbmVkIHNvbWV0aGluZwphbG9uZyB0
aGVzZSBsaW5lcyBhIGxvbmcgdGltZSBhZ28uCgpUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2UhCgo+
ID4KPiA+IEFsc28sIHRvIGJlIGNsZWFyLCBJIGFtIG9uYm9hcmQgd2l0aCBkcm9wcGluZyB0aGVu
IElSUSBzdHVmZiBmb3Igbm93Lgo+ID4gSSBhbSBmaW5lIG1vdmluZyB0byBhIG11dGV4IGZvciB0
aGUgdGltZSBiZWluZy4KPiA+Cj4KPiBPay4KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
