Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37191CD3B6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 18:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5766D6E400;
	Sun,  6 Oct 2019 16:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426036E400
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 16:56:05 +0000 (UTC)
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x96GsaNE023214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 6 Oct 2019 12:54:38 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id A922942088C; Sun,  6 Oct 2019 12:54:36 -0400 (EDT)
Date: Sun, 6 Oct 2019 12:54:36 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20191006165436.GA29585@mit.edu>
References: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
 <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, shuah <shuah@kernel.org>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Logan Gunthorpe <logang@deltatee.com>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDY6MTg6MDRQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ID4gTGV0J3MgdGFsayBhYm91dCBjdXJyZW50IHN0YXRlLiBSaWdodCBub3cga3Vu
aXQgaXMgaW4gbGludXgtbmV4dCBhbmQKPiA+IHdlIHdhbnQgdG8gYWRkIGEgZmV3IG1vcmUgdGVz
dHMuIFdlIHdpbGwgaGF2ZSB0byBjb29yZGluYXRlIHRoZSBlZmZvcnQuCj4gPiBPbmNlIGt1bml0
IGdldCBpbnRvIG1haW5saW5lLCB0aGVuIHRoZSBuZWVkIGZvciB0aGlzIGNvb3JkaW5hdGlvbiBn
b2VzCj4gPiBkb3duLgo+IAo+IFN1cmUsIEkgd2FzIGp1c3QgdGhpbmtpbmcgdGhhdCBnZXR0aW5n
IG90aGVyIHBlb3BsZSB0byB3cml0ZSB0aGUgdGVzdHMKPiB3b3VsZCBiZSBiZXR0ZXIuIFNpbmNl
IG5vdCBvbmx5IGlzIGl0IHRoZW4gdXNlZnVsIHRvIHNvbWVvbmUgZWxzZSwgaXQKPiBwcm92aWRl
cyB0aGUgYmVzdCBwb3NzaWJsZSBleGVyY2lzZSBvZiBLVW5pdC4KCldlbGwsIG9uZSB0aGluZyB3
ZSAqY2FuKiBkbyBpcyBpZiAoYSkgaWYgd2UgY2FuIGNyZWF0ZSBhIGtzZWxmdGVzdApicmFuY2gg
d2hpY2ggd2Uga25vdyBpcyBzdGFibGUgYW5kIHdvbid0IGNoYW5nZSwgYW5kIChiKSB3ZSBjYW4g
Z2V0CmFzc3VyYW5jZXMgdGhhdCBMaW51cyAqd2lsbCogYWNjZXB0IHRoYXQgYnJhbmNoIGR1cmlu
ZyB0aGUgbmV4dCBtZXJnZQp3aW5kb3csIHRob3NlIHN1YnN5c3RlbXMgd2hpY2ggd2FudCB0byB1
c2Uga3NlbGYgdGVzdCBjYW4gc2ltcGx5IHB1bGwKaXQgaW50byB0aGVpciB0cmVlLgoKV2UndmUg
ZG9uZSB0aGlzIGJlZm9yZSBpbiB0aGUgZmlsZSBzeXN0ZW0gd29ybGQsIHdoZW4gdGhlcmUgaGFz
IGJlZW4Kc29tZSBjb21tb24gc2V0IG9mIGNoYW5nZXMgbmVlZGVkIHRvIGltcHJvdmUsIHNheSwg
RGlyZWN0IEkvTywgd2hlcmUKdGhlIGNoYW5nZXMgYXJlIHB1dCBpbnRvIGEgc3RhbmRhbG9uZSBi
cmFuY2gsIHNheSwgaW4gdGhlIHhmcyB0cmVlLAphbmQgdGhvc2UgZmlsZSBzeXN0ZW1zIHdoaWNo
IG5lZWQgaXQgYXMgYSBidWlsZGluZyBibG9jayBjYW4gcHVsbCBpdAppbnRvIHRoZWlyIHRyZWUs
IGFuZCB0aGVuIGFkZCB0aGUgY2hhbmdlcyBuZWVkZWQgdG8gdXNlIHRob3NlIGNoYW5nZXMKaW50
byB0aGVpciBmaWxlIHN5c3RlbSBnaXQgdHJlZS4gIFRoZXNlIGNoYW5nZXMgYXJlIGdlbmVyYWxs
eSBub3QKdGVycmlibHkgY29udHJvdmVyc2lhbCwgYW5kIHdlJ3ZlIG5vdCBoYWQgdG8gd29ycnkg
YWJvdXQgcGVvcGxlIHdhbnQKdG8gYmlrZXNoZWQgdGhlIGNoYW5nZXMuCgpUaGVyZSBpcyBhIHJp
c2sgd2l0aCBkb2luZyB0aGlzIG9mIGNvdXJzZSwgd2hpY2ggaXMgdGhhdCBpZiB0aGUgYnJhbmNo
CippcyogY29udHJvdmVyc2lhbCwgb3IgZ2V0cyBiaWtlLXNoZWRkZWQgZm9yIHNvbWUgcmVhc29u
LCB0aGVuIExpbnVzCmdldHMgdXBzZXQgYW5kIGFueSBicmFuY2hlcyB3aGljaCBkZXBlbmRlZCBv
biBzYWlkIGJyYW5jaCB3aWxsIGdldApyZWplY3RlZCBhdCB0aGUgbmV4dCBtZXJnZSB3aW5kb3cu
ICBXaGljaCBpcyB0aGUgcmVxdWlyZW1lbnQgZm9yIChhKQphbmQgKGIpIGFib3ZlLiAgUHJlc3Vt
YWJseSwgdGhlIGZhY3QgdGhhdCBwZW9wbGUgd2VyZSB1bndpbGxpbmcgdG8gbGV0Ckt1bml0IGxh
bmQgZHVyaW5nIHRoaXMgbWVyZ2Ugd2luZG93IG1pZ2h0IHdpbGwgKmJlY2F1c2UqIHdlIHRoaW5r
IG1vcmUKY2hhbmdlcyBtaWdodCBiZSBwZW5kaW5nPwoKVGhlIG90aGVyIHRoaW5nIEkgc3VwcG9z
ZSBJIGNhbiBkbyBpcyB0byBsZXQgdGhlIGV4dDQga3VuaXQgdGVzdHMgbGFuZAppbiBleHQ0IHRy
ZWUsIGJ1dCB3aXRoIHRoZSBuZWNlc3NhcnkgI2lmZGVmJ3MgYXJvdW5kIHRoaW5ncyBsaWtlCiIj
aW5jbHVkZSA8a3VuaXQvdGVzdC5oPiIgc28gdGhhdCB0aGUgYnVpbGQgd29uJ3QgYmxvdyB1cCB3
L28ga3VuaXQKY2hhbmdlcyBiZWluZyBpbiB0aGUgdHJlZSB0aGF0IEknbSBidWlsZGluZy4gIEl0
IG1lYW5zIEkgd29uJ3QgYmUgYWJsZQp0byBydW4gdGhlIHRlc3RzIHdpdGhvdXQgY3JlYXRpbmcg
YSB0ZXN0IGludGVncmF0aW9uIGJyYW5jaCBhbmQKbWVyZ2luZyBpbiBrdW5pdCBieSBoYW5kLCB3
aGljaCB3aWxsIHN1cGVyLWFubm95aW5nLCBvZiBjb3Vyc2UuICBBbmQKaWYgc29tZSBvZiB0aGUg
YmlrZS1zaGVkZGluZyBpcyBpbiBLdW5pdCdzIGludGVyZmFjZXMsIHRoZW4gdGhhdApiZWNvbWVz
IHByb2JsZW1hdGljIGFzIHdlbGwsIHNpbmNlIGFueSB0ZXN0cyB0aGF0IGFyZSBpbiBleHQ0Lmdp
dCB0cmVlCm1pZ2h0IGNoYW5nZSBpZiBwZW9wbGUgd2FudCB0byByZW5hbWUgS3VuaXQncyBwdWJs
aWNhbGx5IGV4cG9ydGVkCmZ1bmN0aW9ucyAoZm9yIGV4YW1wbGUpLgoKPiBIZXkgVGVkLCBkbyB5
b3Uga25vdyBpZiB0aGF0IGV4dDQgdGltZXN0YW1wIHRlc3QgY2FuIGdvIGluIHRocm91Z2gKPiBs
aW51eC1rc2VsZnRlc3Q/IEl0IHNlZW1lZCBmYWlybHkgc2VsZi1jb250YWluZWQuIE9yIGlzIHRo
YXQgd2hhdCB5b3UKPiB3ZXJlIHNheWluZyB3b3VsZG4ndCB3b3JrIGZvciB5b3U/CgpXZWxsLCBJ
IHdhcyBob3BpbmcgdGhhdCB3ZSBtaWdodCBzdGFydCBjcmVhdGluZyBtb3JlIHRlc3RzIGJleW9u
ZCBqdXN0CnRoZSBleHQ0IHRpbWVzdGFtcCB0ZXN0cy4uLi4KCgkJCQkJCS0gVGVkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
