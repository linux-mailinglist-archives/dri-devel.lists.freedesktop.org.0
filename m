Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A031A8CA
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 19:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333589BAC;
	Sat, 11 May 2019 17:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C1589BAC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 17:35:10 +0000 (UTC)
Received: from callcc.thunk.org (rrcs-67-53-55-100.west.biz.rr.com
 [67.53.55.100]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4BHXkiw001051
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 May 2019 13:33:50 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id DFD64420024; Sat, 11 May 2019 13:33:44 -0400 (EDT)
Date: Sat, 11 May 2019 13:33:44 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190511173344.GA8507@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Frank Rowand <frowand.list@gmail.com>, Tim.Bird@sony.com,
 knut.omang@oracle.com, gregkh@linuxfoundation.org,
 brendanhiggins@google.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 amir73il@gmail.com, dan.carpenter@oracle.com,
 dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
 joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
 logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com,
 richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
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
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDI6MTI6NDBQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IEhvd2V2ZXIsIHRoZSByZXBseSBpcyBpbmNvcnJlY3QuICBLc2VsZnRlc3QgaW4ta2Vy
bmVsIHRlc3RzICh3aGljaAo+IGlzIHRoZSBjb250ZXh0IGhlcmUpIGNhbiBiZSBjb25maWd1cmVk
IGFzIGJ1aWx0IGluIGluc3RlYWQgb2YgYXMKPiBhIG1vZHVsZSwgYW5kIGJ1aWx0IGluIGEgVU1M
IGtlcm5lbC4gIFRoZSBVTUwga2VybmVsIGNhbiBib290LAo+IHJ1bm5pbmcgdGhlIGluLWtlcm5l
bCB0ZXN0cyBiZWZvcmUgVU1MIGF0dGVtcHRzIHRvIGludm9rZSB0aGUKPiBpbml0IHByb2Nlc3Mu
CgpVbSwgQ2l0YXRpb24gbmVlZGVkPwoKSSBkb24ndCBzZWUgYW55IGV2aWRlbmNlIGZvciB0aGlz
IGluIHRoZSBrc2VsZnRlc3QgZG9jdW1lbnRhdGlvbiwgbm9yCmRvIEkgc2VlIGFueSBldmlkZW5j
ZSBvZiB0aGlzIGluIHRoZSBrc2VsZnRlc3QgTWFrZWZpbGVzLgoKVGhlcmUgZXhpc3RzIHRlc3Qg
bW9kdWxlcyBpbiB0aGUga2VybmVsIHRoYXQgcnVuIGJlZm9yZSB0aGUgaW5pdApzY3JpcHRzIHJ1
biAtLS0gYnV0IHRoYXQncyBub3Qgc3RyaWN0bHkgc3BlYWtpbmcgcGFydCBvZiBrc2VsZnRlc3Rz
LAphbmQgZG8gbm90IGhhdmUgYW55IGtpbmQgb2YgaW5mcmFzdHJ1Y3R1cmUuICBBcyBub3RlZCwg
dGhlCmtzZWxmdGVzdHNfaGFybmVzcyBoZWFkZXIgZmlsZSBmdW5kYW1lbnRhbGx5IGFzc3VtZXMg
dGhhdCB5b3UgYXJlCnJ1bm5pbmcgdGVzdCBjb2RlIGluIHVzZXJzcGFjZS4KCgkJCQktIFRlZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
