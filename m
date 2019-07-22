Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80E70DB0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 01:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04C89F27;
	Mon, 22 Jul 2019 23:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638FE89F27
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:54:11 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06C1320840;
 Mon, 22 Jul 2019 23:54:11 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g45hdCxEavSxirr0un_uLzo5Z-J4gHRA06qjzcQrTzmjVg@mail.gmail.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <CAFd5g47ikJmA0uGoavAFsh+hQvDmgsOi26tyii0612R=rt7iiw@mail.gmail.com>
 <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
 <20190716175021.9CA412173C@mail.kernel.org>
 <CAFd5g453vXeSUCZenCk_CzJ-8a1ym9RaPo0NVF=FujF9ac-5Ag@mail.gmail.com>
 <20190718175024.C3EC421019@mail.kernel.org>
 <CAFd5g46a7C1+R6ZcE_SkqaYqgrH5Rx3M=X7orFyaMgFLDbeYYA@mail.gmail.com>
 <20190719000834.GA3228@google.com>
 <20190722200347.261D3218C9@mail.kernel.org>
 <CAFd5g45hdCxEavSxirr0un_uLzo5Z-J4gHRA06qjzcQrTzmjVg@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
To: Brendan Higgins <brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Mon, 22 Jul 2019 16:54:10 -0700
Message-Id: <20190722235411.06C1320840@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563839651;
 bh=7riE0sVQmQS5QgS4pP9ptPUvfmyCxgbuxcUzFNIX2L8=;
 h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
 b=lMfzRRCskgjYJCyPlokQPKY6jX+VpgCrEwPkMIQvRxf8iOB5wgrS9PjXaN0wjtfWh
 RiuaqfDlvSUHC1e16Pk0GMsnB1H5f28N5075BUdTFeSOe4/ZlQbTkjJF0oMcqI6dyP
 T+b1BFHi89keU/CNeTzd05/B7YC7Rqku9pnyKVeY=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMjIgMTU6MzA6NDkpCj4gT24gTW9uLCBK
dWwgMjIsIDIwMTkgYXQgMTowMyBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+Cj4gPiBXaGF0J3MgdGhlIGNhbGxpbmcgY29udGV4dCBvZiB0aGUgYXNzZXJ0
aW9ucyBhbmQgZXhwZWN0YXRpb25zPyBJIHN0aWxsCj4gPiBkb24ndCBsaWtlIHRoZSBmYWN0IHRo
YXQgc3RyaW5nIHN0cmVhbSBuZWVkcyB0byBhbGxvY2F0ZSBidWZmZXJzIGFuZAo+ID4gdGhyb3cg
dGhlbSBpbnRvIGEgbGlzdCBzb21ld2hlcmUgYmVjYXVzZSB0aGUgY2FsbGluZyBjb250ZXh0IG1h
dHRlcnMKPiA+IHRoZXJlLgo+IAo+IFRoZSBjYWxsaW5nIGNvbnRleHQgaXMgdGhlIHNhbWUgYXMg
YmVmb3JlLCB3aGljaCBpcyBhbnl3aGVyZS4KCk9rLiBUaGF0J3MgY29uY2VybmluZyB0aGVuLgoK
PiAKPiA+IEknZCBwcmVmZXIgd2UganVzdCB3cm90ZSBkaXJlY3RseSB0byB0aGUgY29uc29sZS9s
b2cgdmlhIHByaW50awo+ID4gaW5zdGVhZC4gVGhhdCB3YXkgdGhpbmdzIGFyZSBzaW1wbGUgYmVj
YXVzZSB3ZSB1c2UgdGhlIGV4aXN0aW5nCj4gPiBidWZmZXJpbmcgcGF0aCBvZiBwcmludGssIGJ1
dCBtYXliZSB0aGVyZSdzIHNvbWUgYmVuZWZpdCB0byB0aGUgc3RyaW5nCj4gPiBzdHJlYW0gdGhh
dCBJIGRvbid0IHNlZT8gUmlnaHQgbm93IGl0IGxvb2tzIGxpa2UgaXQgYnVpbGRzIGEgc3RyaW5n
IGFuZAo+ID4gdGhlbiBkdW1wcyBpdCB0byBwcmludGsgc28gSSdtIHNvcnQgb2YgbG9zdCB3aGF0
IHRoZSBiZW5lZml0IGlzIG92ZXIKPiA+IGp1c3Qgd3JpdGluZyBkaXJlY3RseSB3aXRoIHByaW50
ay4KPiAKPiBJdCdzIGp1c3QgYnVmZmVyaW5nIGl0IHNvIHRoZSB3aG9sZSBzdHJpbmcgZ2V0cyBw
cmludGVkIHVuaW50ZXJydXB0ZWQuCj4gSWYgd2Ugd2VyZSB0byBwcmludCBvdXQgcGllY2VtZWFs
IHRvIHByaW50aywgY291bGRuJ3Qgd2UgaGF2ZSBhbm90aGVyCj4gY2FsbCB0byBwcmludGsgY29t
ZSBpbiBjYXVzaW5nIGl0IHRvIGdhcmJsZSB0aGUgS1VuaXQgbWVzc2FnZSB3ZSBhcmUKPiBpbiB0
aGUgbWlkZGxlIG9mIHByaW50aW5nPwoKWWVzLCBwcmludGluZyBwaWVjZW1lYWwgYnkgY2FsbGlu
ZyBwcmludGsgbWFueSB0aW1lcyBjb3VsZCBsZWFkIHRvCmludGVybGVhdmluZyBvZiBtZXNzYWdl
cyBpZiBzb21ldGhpbmcgZWxzZSBjb21lcyBpbiBzdWNoIGFzIGFuIGludGVycnVwdApwcmludGlu
ZyBzb21ldGhpbmcuIFByaW50ayBoYXMgc29tZSBzdXBwb3J0IHRvIGhvbGQgInJlY29yZHMiIGJ1
dCBJJ20Kbm90IHN1cmUgaG93IHRoYXQgd291bGQgd29yayBoZXJlIGJlY2F1c2UgS0VSTl9DT05U
IHRhbGtzIGFib3V0IG9ubHkKYmVpbmcgdXNlZCBlYXJseSBvbiBpbiBib290IGNvZGUuIEkgaGF2
ZW4ndCBsb29rZWQgYXQgcHJpbnRrIGluIGRldGFpbAp0aG91Z2ggc28gbWF5YmUgSSdtIGFsbCB3
cm9uZyBhbmQgS0VSTl9DT05UIGp1c3Qgd29ya3M/CgpDYW4gcHJpbnRrIGJlIGNhbGxlZCBvbmNl
IHdpdGggd2hhdGV2ZXIgaXMgaW4gdGhlIHN0cnVjdD8gT3RoZXJ3aXNlIGlmCnRoaXMgaXMgYWJv
dXQgbWFraW5nIHByaW50ayBpbnRvIGEgc3RydWN0dXJlZCBsb2cgdGhlbiBtYXliZSBwcmludGsK
aXNuJ3QgdGhlIHByb3BlciBzb2x1dGlvbiBhbnl3YXkuIE1heWJlIGEgZGV2IGludGVyZmFjZSBz
aG91bGQgYmUgdXNlZAppbnN0ZWFkIHRoYXQgY2FuIGhhbmRsZSBzdGFydGluZyBhbmQgc3RvcHBp
bmcgdGVzdHMgKHZpYSBpb2N0bCkgaW4KYWRkaXRpb24gdG8gcmVhZGluZyB0ZXN0IHJlc3VsdHMs
IHJlY29yZHMsIGV0Yy4gd2l0aCByZWFkKCkgYW5kIGEKY2xlYXJpbmcgb2YgdGhlIHJlY29yZHMu
IFRoZW4gdGhlIHNlcWZpbGUgQVBJIHdvcmtzIG5hdHVyYWxseS4gQWxsIG9mCnRoaXMgaXMgYSBi
aXQgcHJlbWF0dXJlLCBidXQgaXQgbG9va3MgbGlrZSB5b3UncmUgZ29pbmcgZG93biB0aGUgcGF0
aCBvZgptYWtpbmcgc29tZXRoaW5nIGFraW4gdG8gZnRyYWNlIHRoYXQgc3RvcmVzIGJpbmFyeSBm
b3JtYXR0ZWQKYXNzZXJ0aW9uL2V4cGVjdGF0aW9uIHJlY29yZHMgaW4gYSBsb2NrbGVzcyByaW5n
IGJ1ZmZlciB0aGF0IHRoZW4KZm9ybWF0cyB0aG9zZSByZWNvcmRzIHdoZW4gdGhlIHVzZXIgYXNr
cyBmb3IgdGhlbS4KCkkgY2FuIGltYWdpbmUgc29tZW9uZSB3YW50aW5nIHRvIHdyaXRlIHVuaXQg
dGVzdHMgdGhhdCBjaGVjayBjb25kaXRpb25zCmZyb20gYSBzaW11bGF0ZWQgaGFyZGlycSBjb250
ZXh0IHZpYSBpcnEgd29ya3MgKGEgZHJpdmVyIG1vY2sKZnJhbWV3b3JrPyksIHNvIHRoaXMgZG9l
c24ndCBzZWVtIGZhciBvZmYuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
