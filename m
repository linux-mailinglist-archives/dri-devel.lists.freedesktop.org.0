Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA271E7AC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 06:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F87A8945B;
	Wed, 15 May 2019 04:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262178945B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 04:29:54 +0000 (UTC)
Received: from callcc.thunk.org (168-215-239-3.static.ctl.one [168.215.239.3]
 (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4F4SdqA023241
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2019 00:28:43 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 8480F420024; Wed, 15 May 2019 00:28:38 -0400 (EDT)
Date: Wed, 15 May 2019 00:28:38 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190515042838.GA26954@mit.edu>
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
References: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <a305c732-9953-8724-b4a4-25aa50c89365@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a305c732-9953-8724-b4a4-25aa50c89365@gmail.com>
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDU6MjY6NDdQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IE9uIDUvMTEvMTkgMTA6MzMgQU0sIFRoZW9kb3JlIFRzJ28gd3JvdGU6Cj4gPiBPbiBG
cmksIE1heSAxMCwgMjAxOSBhdCAwMjoxMjo0MFBNIC0wNzAwLCBGcmFuayBSb3dhbmQgd3JvdGU6
Cj4gPj4gSG93ZXZlciwgdGhlIHJlcGx5IGlzIGluY29ycmVjdC4gIEtzZWxmdGVzdCBpbi1rZXJu
ZWwgdGVzdHMgKHdoaWNoCj4gPj4gaXMgdGhlIGNvbnRleHQgaGVyZSkgY2FuIGJlIGNvbmZpZ3Vy
ZWQgYXMgYnVpbHQgaW4gaW5zdGVhZCBvZiBhcwo+ID4+IGEgbW9kdWxlLCBhbmQgYnVpbHQgaW4g
YSBVTUwga2VybmVsLiAgVGhlIFVNTCBrZXJuZWwgY2FuIGJvb3QsCj4gPj4gcnVubmluZyB0aGUg
aW4ta2VybmVsIHRlc3RzIGJlZm9yZSBVTUwgYXR0ZW1wdHMgdG8gaW52b2tlIHRoZQo+ID4+IGlu
aXQgcHJvY2Vzcy4KPiA+IAo+ID4gVW0sIENpdGF0aW9uIG5lZWRlZD8KPiAKPiBUaGUgcGFyYWdy
YXBoIHRoYXQgeW91IHF1b3RlZCB0ZWxscyB5b3UgZXhhY3RseSBob3cgdG8gcnVuIGEga3NlbGZ0
ZXN0Cj4gaW4ta2VybmVsIHRlc3QgaW4gYSBVTUwga2VybmVsLiAgSnVzdCB0byB3aGF0IHRoYXQg
cGFyYWdyYXBoIHNheXMuCgpJIGRpZG4ndCBxdW90ZSBhIHBhcmFncmFwaC4gIEJ1dCBJJ2xsIHF1
b3RlIGZyb20gaXQgbm93OgoKICAkIG1ha2UgLUMgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMgcnVu
X3Rlc3RzCgpUaGlzIHJ1bnMgdGhlIGtzZWxmdGVzdCBoYXJuZXNzLCAqaW4gdXNlcnNwYWNlKi4g
IFRoYXQgbWVhbnMgeW91IGhhdmUKdG8gaGF2ZSBhIHJvb3QgZmlsZSBzeXN0ZW0sIGFuZCBpdCdz
IHJ1biBhZnRlciBpbml0IGhhcyBzdGFydGVkLCBieQpkZWZhdWx0LiAgWW91IGFzc2VydGVkIHRo
YXQga3NlbGZ0ZXN0cyBhbGxvd3MgeW91IHRvIHJ1biBtb2R1bGVzCmJlZm9yZSBpbml0IGhhcyBz
dGFydGVkLiAgVGhlcmUgaXMgYWJzb2x1dGVseSB6ZXJvLCBjZXJvLCBuYWRhLCB6aWxjaAptZW50
aW9ucyBvZiBhbnkgb2YgYW55dGhpbmcgbGlrZSB0aGF0IGluIERvY3VtZW50YXRpb24vZGV2LXRv
b2xzL2tzZWxmdGVzdHMucnN0Cgo+ID4gVGhlcmUgZXhpc3RzIHRlc3QgbW9kdWxlcyBpbiB0aGUg
a2VybmVsIHRoYXQgcnVuIGJlZm9yZSB0aGUgaW5pdAo+ID4gc2NyaXB0cyBydW4gLS0tIGJ1dCB0
aGF0J3Mgbm90IHN0cmljdGx5IHNwZWFraW5nIHBhcnQgb2Yga3NlbGZ0ZXN0cywKPiA+IGFuZCBk
byBub3QgaGF2ZSBhbnkga2luZCBvZiBpbmZyYXN0cnVjdHVyZS4gIEFzIG5vdGVkLCB0aGUKPiA+
IGtzZWxmdGVzdHNfaGFybmVzcyBoZWFkZXIgZmlsZSBmdW5kYW1lbnRhbGx5IGFzc3VtZXMgdGhh
dCB5b3UgYXJlCj4gPiBydW5uaW5nIHRlc3QgY29kZSBpbiB1c2Vyc3BhY2UuCj4gCj4gWW91IGFy
ZSBpZ25vcmluZyB0aGUga3NlbGZ0ZXN0IGluLWtlcm5lbCB0ZXN0cy4KCkknbSB0YWxraW5nIHNw
ZWNpZmljYWxseSBhYm91dCB3aGF0IHlvdSBoYXZlIGJlZW4gKmNsYWltaW5nKiB0byBiZQprc2Vs
ZnRlc3QgaW4ta2VybmVsIHRlc3RzIGFib3ZlLiAgQW5kIEknbSBhc3NlcnRpbmcgdGhleSBhcmUg
cmVhbGx5Cm5vdCBrc2VsZnRlc3RzLiAgVGhleSBhcmUganVzdCBhZCBob2MgdGVzdHMgdGhhdCBh
cmUgcnVuIGluIGtlcm5lbApzcGFjZSwgd2hpY2gsIHdoZW4gY29tcGlsZWQgYXMgbW9kdWxlcywg
Y2FuIGJlIGxvYWRlZCBieSBhIGtzZWxmdGVzdApzaGVsbCBzY3JpcHQuICBZb3UgY2FuIGNlcnRh
aW5seSBob29rIGluIHRoZXNlIGFkIGhvYyBpbi1rZXJuZWwgdGVzdHMKdmlhIGtzZWxmdGVzdHMg
LS0tIGJ1dCB0aGVuIHRoZXkgYXJlbid0IHJ1biBiZWZvcmUgaW5pdCBzdGFydHMsCmJlY2F1c2Ug
a3NlbGZ0ZXN0cyBpcyBpbmhlcmVudGx5IGEgdXNlcnNwYWNlLWRyaXZlbiBzeXN0ZW0uCgpJZiB5
b3UgYnVpbGQgdGhlc2UgdGVzdHMgKG1hbnkgb2Ygd2hpY2ggZXhpc3RlZCBiZWZvcmUga3NlbGZ0
ZXN0cyB3YXMKbWVyZ2VkKSBpbnRvIHRoZSBrZXJuZWwgc3VjaCB0aGF0IHRoZXkgYXJlIHJ1biBi
ZWZvcmUgaW5pdCBzdGFydHMsCndpdGhvdXQgdGhlIGtzZWxmdGVzdCBoYXJuZXNzLCB0aGVuIHRo
ZXkgYXJlIG5vdCBrc2VsZnRlc3RzLCBieQpkZWZpbml0aW9uLiAgQm90aCBpbiBob3cgdGhleSBh
cmUgcnVuLCBhbmQgc2luY2UgbWFueSBvZiB0aGVzZQppbi1rZXJuZWwgdGVzdHMgcHJlZGF0ZSB0
aGUgaW50cm9kdWN0aW9uIG9mIGtzZWxmdGVzdHMgLS0tIGluIHNvbWUKY2FzZXMsIGJ5IG1hbnkg
eWVhcnMuCgo+IFdlIGFyZSB0YWxraW5nIGluIGNpcmNsZXMuICBJJ20gZG9uZSB3aXRoIHRoaXMg
dGhyZWFkLgoKWWVzLCB0aGF0IHNvdW5kcyBsaWtlIGl0IHdvdWxkIGJlIGJlc3QuCgoJCQkJCQkt
IFRlZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
