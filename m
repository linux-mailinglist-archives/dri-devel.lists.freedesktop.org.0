Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A72195AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 01:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236BB89CB8;
	Thu,  9 May 2019 23:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCC689CB8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 23:31:59 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x49NUiJg006219
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 May 2019 19:30:45 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id AC36A420024; Thu,  9 May 2019 19:30:43 -0400 (EDT)
Date: Thu, 9 May 2019 19:30:43 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190509233043.GC20877@mit.edu>
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
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
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

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDQ6MjA6MDVQTSAtMDYwMCwgTG9nYW4gR3VudGhvcnBl
IHdyb3RlOgo+IAo+IFRoZSBzZWNvbmQgaXRlbSwgYXJndWFibHksIGRvZXMgaGF2ZSBzaWduaWZp
Y2FudCBvdmVybGFwIHdpdGgga3NlbGZ0ZXN0Lgo+IFdoZXRoZXIgeW91IGFyZSBydW5uaW5nIHNo
b3J0IHRlc3RzIGluIGEgbGlnaHQgd2VpZ2h0IFVNTCBlbnZpcm9ubWVudCBvcgo+IGhpZ2hlciBs
ZXZlbCB0ZXN0cyBpbiBhbiBoZWF2aWVyIFZNIHRoZSB0d28gY291bGQgYmUgdXNpbmcgdGhlIHNh
bWUKPiBmcmFtZXdvcmsgZm9yIHdyaXRpbmcgb3IgZGVmaW5pbmcgaW4ta2VybmVsIHRlc3RzLiBJ
dCAqbWF5KiBhbHNvIGJlIHZhbHVhYmxlCj4gZm9yIHNvbWUgcGVvcGxlIHRvIGJlIGFibGUgdG8g
cnVuIGFsbCB0aGUgVU1MIHRlc3RzIGluIHRoZSBoZWF2eSBWTQo+IGVudmlyb25tZW50IGFsb25n
IHNpZGUgb3RoZXIgaGlnaGVyIGxldmVsIHRlc3RzLgo+IAo+IExvb2tpbmcgYXQgdGhlIHNlbGZ0
ZXN0cyB0cmVlIGluIHRoZSByZXBvLCB3ZSBhbHJlYWR5IGhhdmUgc2ltaWxhciBpdGVtcyB0bwo+
IHdoYXQgS3VuaXQgaXMgYWRkaW5nIGFzIEkgZGVzY3JpYmVkIGluIHBvaW50ICgyKSBhYm92ZS4g
a3NlbGZ0ZXN0X2hhcm5lc3MuaAo+IGNvbnRhaW5zIG1hY3JvcyBsaWtlIEVYUEVDVF8qIGFuZCBB
U1NFUlRfKiB3aXRoIHZlcnkgc2ltaWxhciBpbnRlbnRpb25zIHRvCj4gdGhlIG5ldyBLVU5JVF9F
WEVDUFRfKiBhbmQgS1VOSVRfQVNTRVJUXyogbWFjcm9zLgo+IAo+IEhvd2V2ZXIsIHRoZSBudW1i
ZXIgb2YgdXNlcnMgb2YgdGhpcyBoYXJuZXNzIGFwcGVhcnMgdG8gYmUgcXVpdGUgc21hbGwuIE1v
c3QKPiBvZiB0aGUgY29kZSBpbiB0aGUgc2VsZnRlc3RzIHRyZWUgc2VlbXMgdG8gYmUgYSByYW5k
b20gbWlzbWFzaCBvZiBzY3JpcHRzCj4gYW5kIHVzZXJzcGFjZSBjb2RlIHNvIGl0J3Mgbm90IGhh
cmQgdG8gc2VlIGl0IGFzIHNvbWV0aGluZyBjb21wbGV0ZWx5Cj4gZGlmZmVyZW50IGZyb20gdGhl
IG5ldyBLdW5pdDoKPiAKPiAkIGdpdCBncmVwIC0tZmlsZXMtd2l0aC1tYXRjaGVzIGtzZWxmdGVz
dF9oYXJuZXNzLmggKgoKVG8gdGhlIGV4dGVudCB0aGF0IHdlIGNhbiB1bmlmeSBob3cgdGVzdHMg
YXJlIHdyaXR0ZW4sIEkgYWdyZWUgdGhhdAp0aGlzIHdvdWxkIGJlIGEgZ29vZCB0aGluZy4gIEhv
d2V2ZXIsIHlvdSBzaG91bGQgbm90ZSB0aGF0CmtzZWxmdGVzdF9oYXJuZXNzLmggaXMgY3VycmVu
dGx5IGFzc3VtcyB0aGF0IGl0IHdpbGwgYmUgaW5jbHVkZWQgaW4KdXNlcnNwYWNlIHByb2dyYW1z
LiAgVGhpcyBpcyBtb3N0IG9idmlvdXNseSBzZWVuIGlmIHlvdSBsb29rIGNsb3NlbHkKYXQgdGhl
IGZ1bmN0aW9ucyBkZWZpbmVkIGluIHRoZSBoZWFkZXIgZmlsZXMgd2hpY2ggbWFrZXMgY2FsbHMg
dG8KZm9yaygpLCBhYm9ydCgpIGFuZCBmcHJpbnRmKCkuCgpTbyBLdW5pdCBjYW4ndCByZXVzZSBr
c2VsZnRlc3RfaGFybmVzcy5oIHVubW9kaWZpZWQuICBBbmQgd2hldGhlciBvcgpub3QgdGhlIGFj
dHVhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgaGVhZGVyIGZpbGUgY2FuIGJlIHJldXNlZCBvcgpy
ZWZhY3RvcmVkLCBtYWtpbmcgdGhlIHVuaXQgdGVzdHMgdXNlIHRoZSBzYW1lIG9yIHNpbWlsYXIg
c3ludGF4IHdvdWxkCmJlIGEgZ29vZCB0aGluZy4KCkNoZWVycywKCgkJCQkJCS0gVGVkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
