Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E84589A5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 20:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83F46E354;
	Thu, 27 Jun 2019 18:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3566E354
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 18:16:36 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EA752064A;
 Thu, 27 Jun 2019 18:16:36 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g46zHAupdUh3wDuqPJti2M+_=oje_5weFe7AVLQfkDDM6A@mail.gmail.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
 <20190626034100.B238520883@mail.kernel.org>
 <CAFd5g46zHAupdUh3wDuqPJti2M+_=oje_5weFe7AVLQfkDDM6A@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
User-Agent: alot/0.8.1
Date: Thu, 27 Jun 2019 11:16:35 -0700
Message-Id: <20190627181636.5EA752064A@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561659396;
 bh=2oWUiLUFI+CqOolaOKVa4jJ21rR9UR/fuLhE4nLYjdw=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=zM1PuCQOlI4msEkFixz730kc8/zFbvwJnRkqkjMyx+3IZ/8lQrJkX5bjK8+tcjTpD
 9YTsqw4mLY9MvEtPAy8WslYPIgMqfSsLuNDFSuTYyeTtiNsbbEN2c2e7JVMq1S+AoJ
 JJirWvQWTUXBy4OsdUUrOSg+eULRykDPesnCIHuI=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDYtMjYgMTY6MDA6NDApCj4gT24gVHVlLCBK
dW4gMjUsIDIwMTkgYXQgODo0MSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+IAo+ID4gc2NlbmFyaW8gbGlrZSBiZWxvdywgYnV0IHdoZXJlIGl0IGlzIGEgcHJvYmxl
bS4gVGhlcmUgY291bGQgYmUgdGhyZWUKPiA+IENQVXMsIG9yIGV2ZW4gb25lIENQVSBhbmQgdGhy
ZWUgdGhyZWFkcyBpZiB5b3Ugd2FudCB0byBkZXNjcmliZSB0aGUKPiA+IGV4dHJhIHRocmVhZCBz
Y2VuYXJpby4KPiA+Cj4gPiBIZXJlJ3MgbXkgc2NlbmFyaW8gd2hlcmUgaXQgaXNuJ3QgbmVlZGVk
Ogo+ID4KPiA+ICAgICBDUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBD
UFUxCj4gPiAgICAgLS0tLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0t
LQo+ID4gICAgIGt1bml0X3J1bl90ZXN0KCZ0ZXN0KQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfY2FzZV9mdW5jKCkKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLi4KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbbW9jayBoYXJkaXJxXQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfc2V0X3N1
Y2Nlc3MoJnRlc3QpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgW2hhcmRpcnEgZW5kc10KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC4uLgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGxldGUoJnRlc3RfZG9uZSkKPiA+ICAgICAgIHdhaXRfZm9yX2Nv
bXBsZXRpb24oJnRlc3RfZG9uZSkKPiA+ICAgICAgIGt1bml0X2dldF9zdWNjZXNzKCZ0ZXN0KQo+
ID4KPiA+IFdlIGRvbid0IG5lZWQgdG8gY2FyZSBhYm91dCBoYXZpbmcgbG9ja2luZyBoZXJlIGJl
Y2F1c2Ugc3VjY2VzcyBvcgo+ID4gZmFpbHVyZSBvbmx5IGhhcHBlbnMgaW4gb25lIHBsYWNlIGFu
ZCBpdCdzIHN5bmNocm9uaXplZCB3aXRoIHRoZQo+ID4gY29tcGxldGlvbi4KPiAKPiBIZXJlIGlz
IHRoZSBzY2VuYXJpbyBJIGFtIGNvbmNlcm5lZCBhYm91dDoKPiAKPiBDUFUwICAgICAgICAgICAg
ICAgICAgICAgIENQVTEgICAgICAgICAgICAgICAgICAgICAgIENQVTIKPiAtLS0tICAgICAgICAg
ICAgICAgICAgICAgIC0tLS0gICAgICAgICAgICAgICAgICAgICAgIC0tLS0KPiBrdW5pdF9ydW5f
dGVzdCgmdGVzdCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfY2FzZV9mdW5jKCkK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzY2hlZHVsZV93b3JrKGZvb19mdW5jKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgW21vY2sgaGFyZGlycV0gICAgICAgICAgICAgZm9vX2Z1bmMoKQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAuLi4gICAgICAgICAgICAgICAgICAgICAgICAuLi4KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAga3VuaXRfc2V0X3N1Y2Nlc3MoZmFsc2UpICAga3VuaXRfc2V0X3N1
Y2Nlc3MoZmFsc2UpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBbaGFyZGlycSBlbmRzXSAg
ICAgICAgICAgICAgIC4uLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuLi4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGxldGUoJnRlc3RfZG9uZSkKPiAgIHdhaXRfZm9y
X2NvbXBsZXRpb24oLi4uKQo+ICAga3VuaXRfZ2V0X3N1Y2Nlc3MoJnRlc3QpCj4gCj4gSW4gbXkg
c2NlbmFyaW8sIHNpbmNlIGJvdGggQ1BVMSBhbmQgQ1BVMiB1cGRhdGUgdGhlIHN1Y2Nlc3Mgc3Rh
dHVzIG9mCj4gdGhlIHRlc3Qgc2ltdWx0YW5lb3VzbHksIGV2ZW4gdGhvdWdoIHRoZXkgYXJlIHNl
dHRpbmcgaXQgdG8gdGhlIHNhbWUKPiB2YWx1ZS4gSWYgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3Jy
ZWN0LCB0aGlzIGNvdWxkIHJlc3VsdCBpbiBhCj4gd3JpdGUtdGVhciBvbiBzb21lIGFyY2hpdGVj
dHVyZXMgaW4gc29tZSBjaXJjdW1zdGFuY2VzLiBJIHN1cHBvc2Ugd2UKPiBjb3VsZCBqdXN0IG1h
a2UgaXQgYW4gYXRvbWljIGJvb2xlYW4sIGJ1dCBJIGZpZ3VyZWQgbG9ja2luZyBpcyBhbHNvCj4g
ZmluZSwgYW5kIGdlbmVyYWxseSBwcmVmZXJyZWQuCgpUaGlzIGlzIHdoYXQgd2UgaGF2ZSBXUklU
RV9PTkNFKCkgYW5kIFJFQURfT05DRSgpIGZvci4gTWF5YmUgeW91IGNvdWxkCmp1c3QgdXNlIHRo
YXQgaW4gdGhlIGdldHRlciBhbmQgc2V0dGVycyBhbmQgcmVtb3ZlIHRoZSBsb2NrIGlmIGl0IGlz
bid0CnVzZWQgZm9yIGFueXRoaW5nIGVsc2UuCgpJdCBtYXkgYWxzbyBiZSBhIGdvb2QgaWRlYSB0
byBoYXZlIGEga3VuaXRfZmFpbF90ZXN0KCkgQVBJIHRoYXQgZmFpbHMKdGhlIHRlc3QgcGFzc2Vk
IGluIHdpdGggYSBXUklURV9PTkNFKGZhbHNlKS4gT3RoZXJ3aXNlLCB0aGUgdGVzdCBpcwphc3N1
bWVkIHN1Y2Nlc3NmdWwgYW5kIGl0IGlzbid0IGV2ZW4gcG9zc2libGUgZm9yIGEgdGVzdCB0byBj
aGFuZ2UgdGhlCnN0YXRlIGZyb20gZmFpbHVyZSB0byBzdWNjZXNzIGR1ZSB0byBhIGxvZ2ljYWwg
ZXJyb3IgYmVjYXVzZSB0aGUgQVBJCmlzbid0IGF2YWlsYWJsZS4gVGhlbiB3ZSBkb24ndCByZWFs
bHkgbmVlZCB0byBoYXZlIGEgZ2VuZXJpYwprdW5pdF9zZXRfc3VjY2VzcygpIGZ1bmN0aW9uIGF0
IGFsbC4gV2UgY291bGQgaGF2ZSBhIGt1bml0X3Rlc3RfZmFpbGVkKCkKZnVuY3Rpb24gdG9vIHRo
YXQgcmVwbGFjZXMgdGhlIGt1bml0X2dldF9zdWNjZXNzKCkgZnVuY3Rpb24uIFRoYXQgd291bGQK
cmVhZCBiZXR0ZXIgaW4gYW4gaWYgY29uZGl0aW9uLgoKPiAKPiBBbHNvLCB0byBiZSBjbGVhciwg
SSBhbSBvbmJvYXJkIHdpdGggZHJvcHBpbmcgdGhlbiBJUlEgc3R1ZmYgZm9yIG5vdy4KPiBJIGFt
IGZpbmUgbW92aW5nIHRvIGEgbXV0ZXggZm9yIHRoZSB0aW1lIGJlaW5nLgo+IAoKT2suCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
