Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E244EEBC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 20:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA02E6E90C;
	Fri, 21 Jun 2019 18:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Fri, 21 Jun 2019 18:20:47 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6346E90C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 18:20:46 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5LIDgGF021070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2019 14:13:44 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 441B9420484; Fri, 21 Jun 2019 14:13:42 -0400 (EDT)
Date: Fri, 21 Jun 2019 14:13:42 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: shuah <shuah@kernel.org>
Subject: Re: [PATCH v5 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190621181342.GA17166@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>, shuah <shuah@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com,
 keescook@google.com, kieran.bingham@ideasonboard.com,
 mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org,
 sboyd@kernel.org, yamada.masahiro@socionext.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
 Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
 amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
 jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
 khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
 mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
 richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <10feac3e-7621-65e5-fbf0-9c63fcbe09c9@gmail.com>
 <69809117-dcda-160a-ee0a-d1d3b4c5cd8a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69809117-dcda-160a-ee0a-d1d3b4c5cd8a@kernel.org>
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, Brendan Higgins <brendanhiggins@google.com>,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, kunit-dev@googlegroups.com, richard@nod.at,
 sboyd@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDg6NTk6NDhBTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4g
PiA+ICMjIyBCdXQgd2FpdCEgRG9lc24ndCBrc2VsZnRlc3Qgc3VwcG9ydCBpbiBrZXJuZWwgdGVz
dGluZz8hCj4gPiA+Cj4gPiA+IC4uLi4KPiAKPiBJIHRoaW5rIEkgY29tbWVudGVkIG9uIHRoaXMg
YmVmb3JlLiBJIGFncmVlIHdpdGggdGhlIHN0YXRlbWVudCB0aGF0Cj4gdGhlcmUgaXMgbm8gb3Zl
cmxhcCBiZXR3ZWVuIEtzZWxmdGVzdCBhbmQgS1VuaXQuIEkgd291bGQgbGlrZSBzZWUgdGhpcwo+
IHJlbW92ZWQuIEtzZWxmdGVzdCBtb2R1bGUgc3VwcG9ydCBzdXBwb3J0cyB1c2UtY2FzZXMgS1Vu
aXQgd29uJ3QgYmUgYWJsZQo+IHRvLiBJIGNhbiBidWlsZCBhbiBrZXJuZWwgd2l0aCBLc2VsZnRl
c3QgdGVzdCBtb2R1bGVzIGFuZCB1c2UgaXQgaW4gdGhlCj4gZmlsZWQgdG8gbG9hZCBhbmQgcnVu
IHRlc3RzIGlmIEkgbmVlZCB0byBkZWJ1ZyBhIHByb2JsZW0gYW5kIGdldCBkYXRhCj4gZnJvbSBh
IHN5c3RlbS4gSSBjYW4ndCBkbyB0aGF0IHdpdGggS1VuaXQuCj4gCj4gSW4gbXkgbWluZCwgSSBh
bSBub3Qgdmlld2luZyB0aGlzIGFzIHdoaWNoIGlzIGJldHRlci4gS3NlbGZ0ZXN0IGFuZAo+IEtV
bml0IGJvdGggaGF2ZSB0aGVpciBwbGFjZSBpbiB0aGUga2VybmVsIGRldmVsb3BtZW50IHByb2Nl
c3MuIEl0IGlzbid0Cj4gcHJvZHVjdGl2ZSBhbmQvb3IgbmVjZXNzYXJ5IHRvIGNvbXBhcmluZyBL
c2VsZnRlc3QgYW5kIEtVbml0IHdpdGhvdXQgYQo+IGdvb2QgdW5kZXJzdGFuZGluZyBvZiB0aGUg
cHJvYmxlbSBzcGFjZXMgZm9yIGVhY2ggb2YgdGhlc2UuCj4KPiBJIHdvdWxkIHN0cm9uZ2x5IHJl
Y29tbWVuZCBub3QgbWFraW5nIHJlZmVyZW5jZSB0byBLc2VsZnRlc3QgYW5kIHRhbGsKPiBhYm91
dCB3aGF0IEtVbml0IG9mZmVycy4KClNodWFoLAoKSnVzdCB0byByZWNhbGwgdGhlIGhpc3Rvcnks
IHRoaXMgc2VjdGlvbiBvZiB0aGUgRkFRIHdhcyBhZGRlZCB0byByZWJ1dAp0aGUgKioqdmVyeSoq
KiBzdHJvbmcgc3RhdGVtZW50cyB0aGF0IEZyYW5rIG1hZGUgdGhhdCB0aGVyZSB3YXMKb3Zlcmxh
cCBiZXR3ZWVuIEtzZWxmdGVzdCBhbmQgS3VuaXQsIGFuZCB0aGF0IGhhdmluZyB0b28gbWFueSB3
YXlzIGZvcgprZXJuZWwgZGV2ZWxvcGVycyB0byBkbyB0aGUgaWRlbnRpY2FsIHRoaW5nIHdhcyBo
YXJtZnVsIChoZSBzYWlkIGl0CndhcyB0b28gbXVjaCBvZiBhIGJ1cmRlbiBvbiBhIGtlcm5lbCBk
ZXZlbG9wZXIpIC0tLSBhbmQgdGhpcyB3YXMgYW4KYXJndW1lbnQgZm9yIG5vdCBpbmNsdWRpbmcg
S3VuaXQgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbC4KCklmIHdlJ3JlIHBhc3QgdGhhdCBvYmplY3Rp
b24sIHRoZW4gcGVyaGFwcyB0aGlzIHNlY3Rpb24gY2FuIGJlCmRyb3BwZWQsIGJ1dCB0aGVyZSdz
IGEgdmVyeSBnb29kIHJlYXNvbiB3aHkgaXQgd2FzIHRoZXJlLiAgSSB3b3VsZG4ndApCcmVuZGFu
IHRvIGJlIGFjY3VzZWQgb2YgaWdub3JpbmcgZmVlZGJhY2sgZnJvbSB0aG9zZSB3aG8gcmV2aWV3
ZWQgaGlzCnBhdGNoZXMuICAgOi0pCgoJCQkJCQktIFRlZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
