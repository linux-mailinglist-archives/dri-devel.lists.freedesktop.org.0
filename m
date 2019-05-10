Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8D197C6
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 06:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7530898EE;
	Fri, 10 May 2019 04:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED612898EE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 04:48:56 +0000 (UTC)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4A4livR031694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2019 00:47:45 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 11AEE420024; Fri, 10 May 2019 00:47:44 -0400 (EDT)
Date: Fri, 10 May 2019 00:47:43 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190510044743.GA6889@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Logan Gunthorpe <logang@deltatee.com>,
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
 mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
 rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com
References: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
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
 Frank Rowand <frowand.list@gmail.com>, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, richard@nod.at,
 sboyd@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, keescook@google.com, linux-fsdevel@vger.kernel.org,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDU6NDA6NDhQTSAtMDYwMCwgTG9nYW4gR3VudGhvcnBl
IHdyb3RlOgo+IAo+IEJhc2VkIG9uIHNvbWUgb2YgdGhlIG90aGVyIGNvbW1lbnRlcnMsIEkgd2Fz
IHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQKPiBrc2VsZnRlc3RzIGhhZCBpbi1rZXJuZWwgdGVz
dHMgYnV0IEknbSBub3Qgc3VyZSB3aGVyZSBvciBpZiB0aGV5IGV4aXN0LiBJZgo+IHRoZXkgZG8g
ZXhpc3RzLCBpdCBzZWVtcyBsaWtlIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gY29udmVydCB0aG9z
ZSB0byBrdW5pdAo+IGFuZCBoYXZlIEt1bml0IHRlc3RzIHJ1bi1hYmxlIGluIGEgVk0gb3IgYmFy
ZW1ldGFsIGluc3RhbmNlLgoKVGhlcmUgYXJlIGtzZWxmdGVzdHMgdGVzdHMgd2hpY2ggYXJlIHNo
ZWxsIHNjcmlwdHMgd2hpY2ggbG9hZCBhCm1vZHVsZSwgYW5kIHRoZSBtb2R1bGUgcnVucyB0aGUg
aW4ta2VybmVsIGNvZGUuICBIb3dldmVyLCBJIGRpZG4ndCBzZWUKbXVjaCBpbmZyYXN0cnVjdHVy
ZSBmb3IgdGhlIGluLWtlcm5lbCB0ZXN0IGNvZGU7IHRoZSBvbmUgb3IgdHdvIHRlc3QKbW9kdWxl
cyBjYWxsZWQgZnJvbSBrc2VsZnRlc3RzIGxvb2tlZCBwcmV0dHkgYWQgaG9jIHRvIG1lLgoKVGhh
dCdzIHdoeSBJIHVzZWQgdGhlICJ2aXNlIGdyaXBzIiBhbmFsb2d5LiAgWW91IGNhbiB1c2UgYSBw
YWlyIG9mCnZpc2UgZ3JpcHMgbGlrZSBhIG1vbmtleSB3cmVuY2g7IGJ1dCBpdCdzIG5vdCByZWFs
bHkgYSBtb25rZXkgd3JlbmNoLAphbmQgbWlnaHQgbm90IGJlIHRoZSBiZXN0IHRvb2wgdG8gbG9v
c2VuIG9yIHRpZ2h0ZW4gbnV0cyBhbmQgYm9sdHMuCgogICAgICAgCSAgIAkgICAgIAkgICAgICAg
CSAgIC0gVGVkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
