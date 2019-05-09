Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF918356
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 03:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA2389274;
	Thu,  9 May 2019 01:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3289274
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 01:45:11 +0000 (UTC)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x491i7RW019749
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 May 2019 21:44:09 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 9759E420024; Wed,  8 May 2019 21:44:07 -0400 (EDT)
Date: Wed, 8 May 2019 21:44:07 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190509014407.GA7031@mit.edu>
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
 <20190507080119.GB28121@kroah.com> <20190507172256.GB5900@mit.edu>
 <4d963cdc-1cbb-35a3-292c-552f865ed1f7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d963cdc-1cbb-35a3-292c-552f865ed1f7@gmail.com>
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

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDU6NTg6NDlQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IAo+IElmIEtVbml0IGlzIGFkZGVkIHRvIHRoZSBrZXJuZWwsIGFuZCBhIHN1YnN5c3Rl
bSB0aGF0IEkgYW0gc3VibWl0dGluZwo+IGNvZGUgZm9yIGhhcyBjaG9zZW4gdG8gdXNlIEtVbml0
IGluc3RlYWQgb2Yga3NlbGZ0ZXN0LCB0aGVuIHllcywgSSBkbwo+ICpoYXZlKiB0byB1c2UgS1Vu
aXQgaWYgbXkgc3VibWlzc2lvbiBuZWVkcyB0byBjb250YWluIGEgdGVzdCBmb3IgdGhlCj4gY29k
ZSB1bmxlc3MgSSB3YW50IHRvIGNvbnZpbmNlIHRoZSBtYWludGFpbmVyIHRoYXQgc29tZWhvdyBt
eSBjYXNlCj4gaXMgc3BlY2lhbCBhbmQgSSBwcmVmZXIgdG8gdXNlIGtzZWxmdGVzdCBpbnN0ZWFk
IG9mIEtVbml0dGVzdC4KClRoYXQncyBnb2luZyB0byBiZSBiZXR3ZWVuIHlvdSBhbmQgdGhlIG1h
aW50YWluZXIuICBUb2RheSwgaWYgeW91IHdhbnQKdG8gc3VibWl0IGEgc3Vic3RhbnRpdmUgY2hh
bmdlIHRvIHhmcyBvciBleHQ0LCB5b3UncmUgZ29pbmcgdG8gYmUKYXNrZWQgdG8gY3JlYXRlIHRl
c3QgZm9yIHRoYXQgbmV3IGZlYXR1cmUgdXNpbmcgeGZzdGVzdHMuICBJdCBkb2Vzbid0Cm1hdHRl
ciB0aGF0IHhmc3Rlc3RzIGlzbid0IGluIHRoZSBrZXJuZWwgLS0tIGlmIHRoYXQncyB3aGF0IGlz
CnJlcXVpcmVkIGJ5IHRoZSBtYWludGFpbmVyLgoKPiA+IHN1cHBvc2VkIHRvIGJlIGEgc2ltcGxl
IHdheSB0byBydW4gYSBsYXJnZSBudW1iZXIgb2Ygc21hbGwgdGVzdHMgdGhhdAo+ID4gZm9yIHNw
ZWNpZmljIHNtYWxsIGNvbXBvbmVudHMgaW4gYSBzeXN0ZW0uCj4gCj4ga3NlbGZ0ZXN0IGFsc28g
c3VwcG9ydHMgcnVubmluZyBhIHN1YnNldCBvZiB0ZXN0cy4gIFRoYXQgc3Vic2V0IG9mIHRlc3Rz
Cj4gY2FuIGFsc28gYmUgYSBsYXJnZSBudW1iZXIgb2Ygc21hbGwgdGVzdHMuICBUaGVyZSBpcyBu
b3RoaW5nIGluaGVyZW50Cj4gaW4gS1VuaXQgdnMga3NlbGZ0ZXN0IGluIHRoaXMgcmVnYXJkLCBh
cyBmYXIgYXMgSSBhbSBhd2FyZS4KClRoZSBiaWcgZGlmZmVyZW5jZSBpcyB0aGF0IGtzZWxmdGVz
dHMgYXJlIGRyaXZlbiBieSBhIEMgcHJvZ3JhbSB0aGF0CnJ1bnMgaW4gdXNlcnNwYWNlLiAgVGFr
ZSBhIGxvb2sgYXQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZmlsZXN5c3RlbS9kbm90aWZ5X3Rl
c3QuYwppdCBoYXMgYSBtYWluKGludCBhcmdjLCBjaGFyICphcmd2KSBmdW5jdGlvbi4KCkluIGNv
bnRyYXN0LCBLVW5pdCBhcmUgZnJhZ21lbnRzIG9mIEMgY29kZSB3aGljaCBydW4gaW4gdGhlIGtl
cm5lbDsKbm90IGluIHVzZXJzcGFjZS4gIFRoaXMgYWxsb3dzIHVzIHRvIHRlc3QgaW50ZXJuYWwg
ZnVuY3Rpb25zIGluc2lkZQpjb21wbGV4IGZpbGUgc3lzdGVtIChzdWNoIGFzIHRoZSBibG9jayBh
bGxvY2F0b3IgaW4gZXh0NCkgZGlyZWN0bHkuClRoaXMgbWFrZXMgaXQgKmZ1bmRhbWVudGFsbHkq
IGRpZmZlcmVudCBmcm9tIGtzZWxmdGVzdC4KCkNoZWVycywKCgkJCQkJCS0gVGVkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
