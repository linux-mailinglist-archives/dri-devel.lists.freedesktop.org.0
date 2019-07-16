Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F26ADE8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5016E169;
	Tue, 16 Jul 2019 17:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA8B6E169
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 17:50:22 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CA412173C;
 Tue, 16 Jul 2019 17:50:21 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-5-brendanhiggins@google.com>
 <20190715221554.8417320665@mail.kernel.org>
 <CAFd5g47ikJmA0uGoavAFsh+hQvDmgsOi26tyii0612R=rt7iiw@mail.gmail.com>
 <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
User-Agent: alot/0.8.1
Date: Tue, 16 Jul 2019 10:50:20 -0700
Message-Id: <20190716175021.9CA412173C@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563299421;
 bh=G8HZaTkY2j5PHpLqA7tOHBlpXfS88fwdr/i1I0KvhMc=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=SnmjZaJScqEkihvVKGQqkSTD5onJWfK+cHhQQBbW17pnjC+nIb+4uWvnjgWV9lKVf
 RdeeDLVXiDN2OyNKReRvzCItePqhEAfh7wbGzPcKWhCodyowk7MK4OaaP5GrxgXHmA
 SzXYxjU8ExAf2vD0GT0p9eiAqUSs49f1Guip83jU=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTYgMDE6Mzc6MzQpCj4gT24gVHVlLCBK
dWwgMTYsIDIwMTkgYXQgMTI6NTcgQU0gQnJlbmRhbiBIaWdnaW5zCj4gPGJyZW5kYW5oaWdnaW5z
QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IEEgYHN0cnVjdCBrdW5pdF9zdHJlYW1gIGlzIHVz
dWFsbHkgYXNzb2NpYXRlZCB3aXRoIGEgbWVzc2FnZSB0aGF0IGlzCj4gPiBiZWluZyBidWlsdCB1
cCBvdmVyIHRpbWUgbGlrZSBtYXliZSBhbiBleHBlY3RhdGlvbjsgaXQgaXMgbWVhbnQgdG8KPiA+
IGNhcHR1cmUgdGhlIGlkZWEgdGhhdCB3ZSBtaWdodCB3YW50IHRvIHNlbmQgc29tZSBpbmZvcm1h
dGlvbiBvdXQgdG8KPiA+IHRoZSB1c2VyIHBlcnRhaW5pbmcgdG8gc29tZSB0aGluZyAnWCcsIGJ1
dCB3ZSBhcmVuJ3Qgc3VyZSB0aGF0IHdlCj4gPiBhY3R1YWxseSB3YW50IHRvIHNlbmQgaXQgdW50
aWwgJ1gnIGlzIGNvbXBsZXRlLCBidXQgZG8gdG8gdGhlIG5hdHVyZQo+ID4gb2YgJ1gnIGl0IGlz
IGVhc2llciB0byBzdGFydCBjb25zdHJ1Y3RpbmcgdGhlIG1lc3NhZ2UgYmVmb3JlICdYJyBpcwo+
ID4gY29tcGxldGUuCj4gPgo+ID4gQ29uc2lkZXIgYSBjb21wbGljYXRlZCBleHBlY3RhdGlvbiwg
dGhlcmUgbWlnaHQgYmUgbXVsdGlwbGUgY29uZGl0aW9ucwo+ID4gdGhhdCBzYXRpc2Z5IGl0IGFu
ZCBtdWx0aXBsZSBjb25kaXRpb25zIHdoaWNoIGNvdWxkIG1ha2UgaXQgZmFpbC4gQXMKPiA+IHdl
IHN0YXJ0IGV4cGxvcmluZyB0aGUgaW5wdXQgdG8gdGhlIGV4cGVjdGF0aW9uIHdlIGdhaW4gaW5m
b3JtYXRpb24KPiA+IHRoYXQgd2UgbWlnaHQgd2FudCB0byBzaGFyZSBiYWNrIHdpdGggdGhlIHVz
ZXIgaWYgdGhlIGV4cGVjdGF0aW9uIHdlcmUKPiA+IHRvIGZhaWwgYW5kIHdlIG1pZ2h0IGdldCB0
aGF0IGluZm9ybWF0aW9uIGJlZm9yZSB3ZSBhcmUgYWN0dWFsbHkgc3VyZQo+ID4gdGhhdCB0aGUg
ZXhwZWN0YXRpb24gZG9lcyBpbmRlZWQgZmFpbC4KPiA+Cj4gPiBXaGVuIHdlIGZpcnN0IHN0ZXAg
aW50byB0aGUgZXhwZWN0YXRpb24gd2UgaW1tZWRpYXRlbHkga25vdyB0aGUKPiA+IGZ1bmN0aW9u
IG5hbWUsIGZpbGUgbmFtZSwgYW5kIGxpbmUgbnVtYmVyIHdoZXJlIHdlIGFyZSBjYWxsZWQgYW5k
Cj4gPiB3b3VsZCB3YW50IHRvIHB1dCB0aGF0IGluZm9ybWF0aW9uIGludG8gYW55IG1lc3NhZ2Ug
d2Ugd291bGQgc2VuZCB0bwo+ID4gdGhlIHVzZXIgYWJvdXQgdGhpcyBleHBlY3RhdGlvbi4gTmV4
dCwgd2UgbWlnaHQgd2FudCB0byBjaGVjayBhCj4gPiBwcm9wZXJ0eSBvZiB0aGUgaW5wdXQsIGl0
IG1heSBvciBtYXkgbm90IGJlIGVub3VnaCBpbmZvcm1hdGlvbiBvbiBpdHMKPiA+IG93biBmb3Ig
dGhlIGV4cGVjdGF0aW9uIHRvIGZhaWwsIGJ1dCB3ZSB3YW50IHRvIHNoYXJlIHRoZSByZXN1bHQg
b2YKPiA+IHRoZSBwcm9wZXJ0eSBjaGVjayB3aXRoIHRoZSB1c2VyIHJlZ2FyZGxlc3MsIEJVVCBv
bmx5IGlmIHRoZQo+ID4gZXhwZWN0YXRpb24gYXMgYSB3aG9sZSBmYWlscy4KPiA+Cj4gPiBIZW5j
ZSwgd2UgY2FuIGhhdmUgbXVsdGlwbGUgYHN0cnVjdCBrdW5pdF9zdHJlYW1gcyBhc3NvY2lhdGVk
IHdpdGggYQo+ID4gYHN0cnVjdCBrdW5pdGAgYWN0aXZlIGF0IGFueSBnaXZlbiB0aW1lLgoKSSdt
IGNvbWluZyBiYWNrIHRvIHRoaXMgbm93IGFmdGVyIHJlYWRpbmcgdGhlIHJlc3Qgb2YgdGhlIHBh
dGNoZXMgdGhhdApkZWFsIHdpdGggYXNzZXJ0aW9ucyBhbmQgZXhwZWN0YXRpb25zLiBJdCBsb29r
cyBsaWtlIHRoZSBzdHJpbmcgc3RyZWFtCmlzIHRoZXJlIHRvIGhvbGQgYSBmZXcgZGlmZmVyZW50
IHBpZWNlcyBvZiBpbmZvcm1hdGlvbjoKCiAtIExpbmUgTnVtYmVyCiAtIEZpbGUgTmFtZQogLSBG
dW5jdGlvbiBOYW1lCgpUaGUgYWJvdmUgaXRlbXMgY291bGQgYmUgc3RvcmVkIGluIGEgc3RydWN0
dXJlIG9uIHRoZSBzdGFjayB0aGF0IHRoZW4KZ2V0cyBwcmludGVkIGFuZCBmb3JtYXR0ZWQgd2hl
biB0aGUgZXhwZWN0YXRpb24gb3IgYXNzZXJ0aW9uIGZhaWxzLiBUaGF0CndvdWxkIG1ha2UgdGhl
IHdob2xlIHN0cmluZyBzdHJlYW0gc3RydWN0dXJlIGFuZCBjb2RlIHVubmVjZXNzYXJ5LgoKVGhl
IG9ubHkgaHlwb3RoZXRpY2FsIGNhc2Ugd2hlcmUgdGhpcyBjYW4ndCBiZSBkb25lIGlzIGEgY29t
cGxpY2F0ZWQKYXNzZXJ0aW9uIG9yIGV4cGVjdGF0aW9uIHRoYXQgZG9lcyBtb3JlIHRoYW4gb25l
IGNoZWNrIGFuZCBjYW4ndCBiZQp3cml0dGVuIGFzIGEgZnVuY3Rpb24gdGhhdCBkdW1wcyBvdXQg
d2hhdCB3ZW50IHdyb25nLiBJcyB0aGlzIGEgcmVhbApwcm9ibGVtPyBNYXliZSBzdWNoIGFuIGFz
c2VydGlvbiBzaG91bGQganVzdCBvcGVuIGNvZGUgdGhhdCBsb2dpYyBzbyB3ZQpkb24ndCBoYXZl
IHRvIGJ1aWxkIHVwIGEgc3RyaW5nIGZvciBhbGwgdGhlIG90aGVyIHNpbXBsZSBjYXNlcy4KCkl0
IHNlZW1zIGZhciBzaW1wbGVyIHRvIGdldCByaWQgb2YgdGhlIHN0cmluZyBzdHJlYW0gQVBJIGFu
ZCBqdXN0IGhhdmUgYQpzdHJ1Y3QgZm9yIHRoaXMuCgoJc3RydWN0IGt1bml0X2ZhaWxfbXNnIHsK
CQljb25zdCBjaGFyICpsaW5lOwoJCWNvbnN0IGNoYXIgKmZpbGU7CgkJY29uc3QgY2hhciAqZnVu
YzsKCQljb25zdCBjaGFyICptc2c7Cgl9OwoKVGhlbiB5b3UgY2FuIGhhdmUgdGhlIGFzc2VydGlv
biBtYWNyb3MgY3JlYXRlIHRoaXMgb24gdGhlIHN0YWNrICh3aXRoCmFub3RoZXIgbWFjcm8/KS4K
CgkjZGVmaW5lIERFRklORV9LVU5JVF9GQUlMX01TRyhuYW1lLCBfbXNnKSBcCgkJc3RydWN0IGt1
bml0X2ZhaWxfbXNnIG5hbWUgPSB7IFwKCQkJLmxpbmUgPSAgX19MSU5FX18sIFwKCQkJLmZpbGUg
PSBfX0ZJTEVfXywgXAoJCQkuZnVuYyA9IF9fZnVuY19fLCBcCgkJCS5tc2cgPSBfbXNnLCBcCgkJ
fQoKTm90ZTogSSBkb24ndCBrbm93IGlmIHRoZSBfX0xJTkVfXyBhYm92ZSB3aWxsIHVzZSB0aGUg
bWFjcm8gbG9jYXRpb24sIHNvCnRoaXMgcHJvYmFibHkgbmVlZHMgYW5vdGhlciB3cmFwcGVyIHRv
IHB1dCB0aGUgcmlnaHQgbGluZSBudW1iZXIgdGhlcmUuCgpJIGRvbid0IHdhbnQgdG8gZGVyYWls
IHRoaXMgd2hvbGUgc2VyaWVzIG9uIHRoaXMgdG9waWMsIGJ1dCBpdCBzZWVtcwpsaWtlIGEgYnVu
Y2ggb2YgY29kZSBpcyB0aGVyZSB0byBjb25zdHJ1Y3QgdGhpcyBzYW1lIHNldCBvZiBpbmZvcm1h
dGlvbgpvdmVyIGFuZCBvdmVyIGFnYWluIGludG8gYSBidWZmZXIgYSBsaXR0bGUgYml0IGF0IGEg
dGltZSBhbmQgdGhlbiB0aHJvdwppdCBhd2F5IHdoZW4gbm90aGluZyBmYWlscyBqdXN0IGJlY2F1
c2Ugd2UgbWF5IHdhbnQgdG8gc3VwcG9ydCB0aGUgY2FzZQp3aGVyZSB3ZSBoYXZlIHNvbWUgdW5z
dHJ1Y3R1cmVkIGRhdGEgdG8gaW5mb3JtIHRoZSB1c2VyIGFib3V0LgoKV2h5IG5vdCBidWlsZCBp
biB0aGUgc3RydWN0dXJlZCBwYXJ0IGludG8gdGhlIGZyYW1ld29yayAoaS5lLiB0aGUgc3RydWN0
CmFib3ZlKSBzbyB0aGF0IGl0J3MgYWx3YXlzIHRoZXJlIGFuZCB0aGVuIGFkZCB0aGUgc3RyaW5n
IGJ1aWxkaW5nIHBhcnQKbGF0ZXIgd2hlbiB3ZSBoYXZlIHRvPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
