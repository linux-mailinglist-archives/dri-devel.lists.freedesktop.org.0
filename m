Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A61836E
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 03:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2C9899BC;
	Thu,  9 May 2019 01:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A646789994
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 01:59:51 +0000 (UTC)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x491wvb2023686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 May 2019 21:58:57 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id D504A420024; Wed,  8 May 2019 21:58:56 -0400 (EDT)
Date: Wed, 8 May 2019 21:58:56 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190509015856.GB7031@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com,
 dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
 joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
 knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
 pmladek@suse.com, richard@nod.at, rientjes@google.com,
 rostedt@goodmis.org, wfg@linux.intel.com
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, keescook@google.com, linux-fsdevel@vger.kernel.org,
 logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDU6NDM6MzVQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IGtzZWxmdGVzdCBwcm92aWRlcyBhIG1lY2hhbmlzbSBmb3IgaW4ta2VybmVsIHRlc3Rz
IHZpYSBtb2R1bGVzLiAgRm9yCj4gZXhhbXBsZSwgc2VlOgo+IAo+ICAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvdm0vcnVuX3ZtdGVzdHMgaW52b2tlczoKPiAgICAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvdm0vdGVzdF92bWFsbG9jLnNoCj4gICAgICAgbG9hZHMgbW9kdWxlOgo+ICAgICAgICAg
dGVzdF92bWFsbG9jCj4gICAgICAgICAod2hpY2ggaXMgYnVpbHQgZnJvbSBsaWIvdGVzdF92bWFs
bG9jLmMgaWYgQ09ORklHX1RFU1RfVk1BTExPQykKClRoZSBtYWpvcml0eSBvZiB0aGUga3NlbGZ0
ZXN0cyBhcmUgaW1wbGVtZW50ZWQgYXMgdXNlcnNwYWNlIHByb2dyYW1zLgoKWW91ICpjYW4qIHJ1
biBpbi1rZXJuZWwgdGVzdCB1c2luZyBtb2R1bGVzOyBidXQgdGhlcmUgaXMgbm8gZnJhbWV3b3Jr
CmZvciB0aGUgaW4ta2VybmVsIGNvZGUgZm91bmQgaW4gdGhlIHRlc3QgbW9kdWxlcywgd2hpY2gg
bWVhbnMgZWFjaCBvZgp0aGUgaW4ta2VybmVsIGNvZGUgaGFzIHRvIGNyZWF0ZSB0aGVpciBvd24g
aW4ta2VybmVsIHRlc3QKaW5mcmFzdHJ1Y3R1cmUuICAKClRoYXQncyBtdWNoIGxpa2Ugc2F5aW5n
IHlvdSBjYW4gdXNlIHZpY2UgZ3JpcHMgdG8gdHVybiBhIG51dCBvcgpib2x0LWhlYWQuICBZb3Ug
KmNhbiosIGJ1dCBpdCBtaWdodCBiZSB0aGF0IHVzaW5nIGEgbW9ua2V5IHdyZW5jaAp3b3VsZCBi
ZSBhIG11Y2ggYmV0dGVyIHRvb2wgdGhhdCBpcyBtdWNoIGVhc2llci4KCldoYXQgd291bGQgeW91
IHNheSB0byBhIHdvb2Qgd29ya2VyIG9iamVjdGluZyB0aGF0IGEgdG9vbGJveCBzaG91bGQKY29u
dGFpbiBhIG1vbmtleSB3cmVuY2ggYmVjYXVzZSBoZSBhbHJlYWR5IGtub3dzIGhvdyB0byB1c2Ug
dmlzZQpncmlwcywgYW5kIGhpcyB0aW55IGJyYWluIHNob3VsZG4ndCBiZSBmb3JjZWQgdG8gbGVh
cm4gaG93IHRvIHVzZSBhCndyZW5jaCB3aGVuIGhlIGtub3dzIGhvdyB0byB1c2UgYSB2aXNlIGdy
aXAsIHdoaWNoIGlzIGEgcGVyZmVjdGx5IGdvb2QKdG9vbD8KCklmIHlvdSB3YW50IHRvIHVzZSB2
aWNlIGdyaXBzIGFzIGEgaGFtbWVyLCBzY3Jld2RyaXZlciwgbW9ua2V5IHdyZW5jaCwKZXRjLiAg
dGhlcmUncyBub3RoaW5nIHN0b3BwaW5nIHlvdSBmcm9tIGRvaW5nIHRoYXQuICBCdXQgaXQncyBu
b3QgZmFpcgp0byBvYmplY3QgdG8gb3RoZXIgcGVvcGxlIHdobyBtaWdodCB3YW50IHRvIHVzZSBi
ZXR0ZXIgdG9vbHMuCgpUaGUgcmVhbGl0eSBpcyB0aGF0IHdlIGhhdmUgYSBsb3Qgb2YgdGVzdGlu
ZyB0b29scy4gIEl0J3Mgbm90IGp1c3QKa3NlbGZ0ZXN0cy4gIFRoZXJlIGlzIHhmc3Rlc3RzIGZv
ciBmaWxlIHN5c3RlbSBjb2RlLCBibGt0ZXN0cyBmb3IKYmxvY2sgbGF5ZXIgdGVzdHMsIGV0Yy4g
ICBXZSB1c2UgdGhlIHJpZ2h0IHRvb2wgZm9yIHRoZSByaWdodCBqb2IuCgoJCQkJCQktIFRlZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
