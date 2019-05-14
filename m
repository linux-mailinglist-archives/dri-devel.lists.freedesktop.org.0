Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A865D1C978
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 15:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C828789271;
	Tue, 14 May 2019 13:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839CE89271
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 13:34:26 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D706B740;
 Tue, 14 May 2019 13:34:23 +0000 (UTC)
Date: Tue, 14 May 2019 07:34:22 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v3 15/18] Documentation: kunit: add documentation for KUnit
Message-ID: <20190514073422.4287267c@lwn.net>
In-Reply-To: <20190514054251.186196-16-brendanhiggins@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, tytso@mit.edu,
 richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMyBNYXkgMjAxOSAyMjo0Mjo0OSAtMDcwMApCcmVuZGFuIEhpZ2dpbnMgPGJyZW5k
YW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgoKPiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgS1Vu
aXQsIHRoZSBMaW51eCBrZXJuZWwgdW5pdCB0ZXN0aW5nIGZyYW1ld29yay4KPiAtIEFkZCBpbnRy
byBhbmQgdXNhZ2UgZ3VpZGUgZm9yIEtVbml0Cj4gLSBBZGQgQVBJIHJlZmVyZW5jZQo+IAo+IFNp
Z25lZC1vZmYtYnk6IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4K
PiAtLS0KPiBDaGFuZ2VzIFNpbmNlIExhc3QgUmV2aXNpb246Cj4gIC0gQWRkcmVzc2VkIHJlZmVy
ZW5jZSB0byBpbmNvcnJlY3QgbnVtYmVyIG9mIHNlY3Rpb25zLCBhcyBwZXIgUmFuZHkncwo+ICAg
IGNvbW1lbnQuCj4gIC0gTWFrZSBzZWN0aW9uIHVuZGVybGluZXMgc2FtZSBsZW5ndGggYXMgdGhl
IHNlY3Rpb24gdGl0bGUsIGFzIHBlcgo+ICAgIFJhbmR5J3MgY29tbWVudHMuCj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vaW5kZXgucnN0ICAgICAgICAgICB8ICAgMSArCj4gIERvY3VtZW50YXRpb24v
a3VuaXQvYXBpL2luZGV4LnJzdCB8ICAxNiArCj4gIERvY3VtZW50YXRpb24va3VuaXQvYXBpL3Rl
c3QucnN0ICB8ICAxNCArCj4gIERvY3VtZW50YXRpb24va3VuaXQvZmFxLnJzdCAgICAgICB8ICA2
MiArKysrCj4gIERvY3VtZW50YXRpb24va3VuaXQvaW5kZXgucnN0ICAgICB8ICA3OSArKysrCj4g
IERvY3VtZW50YXRpb24va3VuaXQvc3RhcnQucnN0ICAgICB8IDE4MCArKysrKysrKysrCj4gIERv
Y3VtZW50YXRpb24va3VuaXQvdXNhZ2UucnN0ICAgICB8IDU3NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKCkNlcnRhaW5seSBpdCdzIGdyZWF0IHRvIHNlZSBhbGwgdGhpcyBkb2N1bWVu
dGF0aW9uIGNvbWluZyB3aXRoIHRoaXMKZmVhdHVyZSEKCk5hdHVyYWxseSwgdGhvdWdoLCBJIGhh
dmUgb25lIHJlcXVlc3Q6IEknZCByYXRoZXIgbm90IHNlZSB0aGlzIGF0IHRoZSB0b3AKbGV2ZWws
IHdoaWNoIGlzIG1vcmUgdGhhbiBjcm93ZGVkIGVub3VnaCBhcyBpdCBpcy4gIENhbiB0aGlzIG1h
dGVyaWFsCnBsZWFzZSBnbyBpbnRvIHRoZSBkZXZlbG9wbWVudCB0b29scyBib29rLCBhbG9uZ3Np
ZGUgdGhlIGtzZWxmdGVzdApkb2N1bWVudGF0aW9uPwoKVGhhbmtzLAoKam9uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
