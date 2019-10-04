Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE285CC68B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 01:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AD66EC36;
	Fri,  4 Oct 2019 23:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECF16EC36
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 23:31:02 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x94NTuAQ024308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2019 19:29:57 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id CCF8D42088C; Fri,  4 Oct 2019 19:29:55 -0400 (EDT)
Date: Fri, 4 Oct 2019 19:29:55 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: shuah <shuah@kernel.org>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20191004232955.GC12012@mit.edu>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Brendan Higgins <brendanhiggins@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, khilman@baylibre.com,
 knut.omang@oracle.com, kieran.bingham@ideasonboard.com, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, logang@deltatee.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6NDc6MDlQTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4g
PiBIb3dldmVyLCBpZiBJIGVuY291cmFnZSBhcmJpdHJhcnkgdGVzdHMvaW1wcm92ZW1lbnRzIGlu
dG8gbXkgS1VuaXQKPiA+IGJyYW5jaCwgaXQgZnVydGhlciBkaXZlcmdlcyBhd2F5IGZyb20gdG9y
dmFsZHMvbWFzdGVyLCBhbmQgaXMgbW9yZQo+ID4gbGlrZWx5IHRoYXQgdGhlcmUgd2lsbCBiZSBh
IG1lcmdlIGNvbmZsaWN0IG9yIGlzc3VlIHRoYXQgaXMgbm90IHJlbGF0ZWQKPiA+IHRvIHRoZSBj
b3JlIEtVbml0IGNoYW5nZXMgdGhhdCB3aWxsIGNhdXNlIHRoZSB3aG9sZSB0aGluZyB0byBiZQo+
ID4gcmVqZWN0ZWQgYWdhaW4gaW4gdjUuNS4KPiAKPiBUaGUgaWRlYSBpcyB0aGF0IHRoZSBuZXcg
ZGV2ZWxvcG1lbnQgd2lsbCBoYXBwZW4gYmFzZWQgb24ga3VuaXQgaW4KPiBsaW51eC1rc2VsZnRl
c3QgbmV4dC4gSXQgd2lsbCB3b3JrIGp1c3QgZmluZS4gQXMgd2UgYWNjZXB0cyBwYXRjaGVzLAo+
IHRoZXkgd2lsbCBnbyBvbiB0b3Agb2Yga3VuaXQgdGhhdCBpcyBpbiBsaW51eC1uZXh0IG5vdy4K
CkkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHdvdWxkIHdvcmsuICBJZiBJIGFkZCB1bml0IHRlc3RzIHRv
IGV4dDQsIHRoZXkKd291bGQgYmUgaW4gZnMvZXh0NC4gIEFuZCB0byB0aGUgZXh0ZW50IHRoYXQg
SSBuZWVkIHRvIGFkZCB0ZXN0IG1vY2tzCnRvIGFsbG93IHRoZSB1bml0IHRlc3RzIHRvIHdvcmss
IHRoZXkgd2lsbCBpbnZvbHZlIGNoYW5nZXMgdG8gZXhpc3RpbmcKZmlsZXMgaW4gZnMvZXh0NC4g
IEkgY2FuJ3QgcHV0IHRoZW0gaW4gdGhlIGV4dDQuZ2l0IHRyZWUgd2l0aG91dApwdWxsaW5nIGlu
IHRoZSBrdW5pdCBjaGFuZ2VzIGludG8gdGhlIGV4dDQgZ2l0IHRyZWUuICBBbmQgaWYgdGhleSBl
eHQ0CnVuaXQgdGVzdHMgbGFuZCBpbiB0aGUga3VuaXQgdHJlZSwgaXQgd291bGQgYmUgYSByZWNl
aXBlIGZvciBsYXJnZQpudW1iZXJzIG9mIG1lcmdlIGNvbmZsaWN0cy4KCgkJCQkJCS0gVGVkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
