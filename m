Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9B19BCE
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 12:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819B189873;
	Fri, 10 May 2019 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF0C89873
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 10:44:43 +0000 (UTC)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4AAhcGQ005268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2019 06:43:39 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 8AE2E420024; Fri, 10 May 2019 06:43:38 -0400 (EDT)
Date: Fri, 10 May 2019 06:43:38 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190510104338.GB6889@mit.edu>
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
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <78e4d46e-6212-9871-51d6-dd2126f39d45@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78e4d46e-6212-9871-51d6-dd2126f39d45@gmail.com>
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

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMTA6MTE6MDFQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+ID4+IFlvdSAqY2FuKiBydW4gaW4ta2VybmVsIHRlc3QgdXNpbmcgbW9kdWxlczsgYnV0
IHRoZXJlIGlzIG5vIGZyYW1ld29yawo+ID4+IGZvciB0aGUgaW4ta2VybmVsIGNvZGUgZm91bmQg
aW4gdGhlIHRlc3QgbW9kdWxlcywgd2hpY2ggbWVhbnMgZWFjaCBvZgo+ID4+IHRoZSBpbi1rZXJu
ZWwgY29kZSBoYXMgdG8gY3JlYXRlIHRoZWlyIG93biBpbi1rZXJuZWwgdGVzdAo+ID4+IGluZnJh
c3RydWN0dXJlLgo+IAo+IFRoZSBrc2VsZnRlc3QgaW4ta2VybmVsIHRlc3RzIGZvbGxvdyBhIGNv
bW1vbiBwYXR0ZXJuLiAgQXMgc3VjaCwgdGhlcmUKPiBpcyBhIGZyYW1ld29yay4KClNvIHdlIG1h
eSBoYXZlIGRpZmZlcmVudCBkZWZpbml0aW9ucyBvZiAiZnJhbWV3b3JrIi4gIEluIG15IGJvb2ss
IGNvZGUKcmV1c2UgYnkgImN1dCBhbmQgcGFzdGUiIGRvZXMgbm90IG1ha2UgYSBmcmFtZXdvcmsu
ICBDb3VsZCB0aGV5IGJlCnJld3JpdHRlbiB0byAqdXNlKiBhIGZyYW1ld29yaywgd2hldGhlciBp
dCBiZSBLVEYgb3IgS1VuaXQ/ICBTdXJlIQpCdXQgdGhleSBhcmUgbm90IHVzaW5nIGEgZnJhbWV3
b3JrICp0b2RheSouCgo+IFRoaXMgbmV4dCB0d28gcGFyYWdyYXBocyB5b3UgaWdub3JlZCBlbnRp
cmVseSBpbiB5b3VyIHJlcGx5Ogo+IAo+ID4gV2h5IGNyZWF0ZSBhbiBlbnRpcmUgbmV3IHN1YnN5
c3RlbSAoS1VuaXQpIHdoZW4geW91IGNhbiBhZGQgYSBoZWFkZXIKPiA+IGZpbGUgKGFuZCAuYyBj
b2RlIGFzIGFwcHJvcHJpYXRlKSB0aGF0IG91dHB1dHMgdGhlIHByb3BlciBUQVAgZm9ybWF0dGVk
Cj4gPiByZXN1bHRzIGZyb20ga3NlbGZ0ZXN0IGtlcm5lbCB0ZXN0IG1vZHVsZXM/CgpBbmQgeW91
IGtlZXAgaWdub3JpbmcgbXkgbWFpbiBvYnNlcnZhdGlvbiwgd2hpY2ggaXMgdGhhdCBzcGlubmlu
ZyB1cCBhClZNLCBsZXR0aW5nIHN5c3RlbWQgc3RhcnQsIG1vdW50aW5nIGEgcm9vdCBmaWxlIHN5
c3RlbSwgZXRjLiwgaXMgYWxsCnVubmVjZXNzYXJ5IG92ZXJoZWFkIHdoaWNoIHRha2VzIHRpbWUu
ICBUaGlzIGlzIGltcG9ydGFudCB0byBtZSwKYmVjYXVzZSBkZXZlbG9wZXIgdmVsb2NpdHkgaXMg
ZXh0cmVtZWx5IGltcG9ydGFudCBpZiB5b3UgYXJlIGRvaW5nCnRlc3QgZHJpdmVuIGRldmVsb3Bt
ZW50LgoKWWVzLCB5b3UgY2FuIG1hbnVhbGx5IHVubG9hZCBhIG1vZHVsZSwgcmVjb21waWxlIHRo
ZSBtb2R1bGUsIHNvbWVob3cKZ2V0IHRoZSBtb2R1bGUgYmFjayBpbnRvIHRoZSBWTSAocGVyaGFw
cyBieSB1c2luZyB2aXJ0aW8tOXApLCBhbmQgdGhlbgpyZWxvYWRpbmcgdGhlIG1vZHVsZSB3aXRo
IHRoZSBpbi1rZXJuZWwgdGVzdCBjb2RlLCBhbmQgdGhlIHJlc3RhcnQgdGhlCnRlc3QuICBCVVQ6
IChhKSBldmVuIGlmIGl0IGlzIGZhc3RlciwgaXQgcmVxdWlyZXMgYSBsb3Qgb2YgbWFudWFsCnN0
ZXBzLCBhbmQgd291bGQgYmUgdmVyeSBoYXJkIHRvIGF1dG9tYXRlLCBhbmQgKGIpIGlmIHRoZSB0
ZXN0IGNvZGUKZXZlciBPT1BTIG9yIHRyaWdnZXJzIGEgbG9ja2RlcCB3YXJuaW5nLCB5b3Ugd2ls
bCBuZWVkIHRvIHJlc3RhcnQgdGhlClZNLCBhbmQgc28gdGhpcyBpbnZvbHZlcyBhbGwgb2YgdGhl
IFZNIHJlc3RhcnQgb3ZlcmhlYWQsIHBsdXMgdHJ5aW5nCnRvIGF1dG9tYXRlIGRldGVybWluaW5n
IHdoZW4geW91IGFjdHVhbGx5IGRvIG5lZWQgdG8gcmVzdGFydCB0aGUgVk0KdmVyc3VzIHVubG9h
ZGluZyBhbmQgcmVsb2FkaW5nIHRoZSBtb2R1bGUuICAgSXQncyBjbHVua3kuCgpCZWluZyBhYmxl
IHRvIGRvIHRoZSBlcXVpdmFsZW50IG9mICJtYWtlICYmIG1ha2UgY2hlY2siIGlzIGEgcmVhbGx5
CmJpZyBkZWFsLiAgQW5kICJtYWtlIGNoZWNrIiBuZWVkcyB0byBnbyBmYXN0LgoKWW91IGtlZXAg
aWdub3JlIHRoaXMgcG9pbnQsIHBlcmhhcHMgYmVjYXVzZSB5b3UgZG9uJ3QgY2FyZSBhYm91dCB0
aGlzCmlzc3VlPyAgV2hpY2ggaXMgZmluZSwgYW5kIHdoeSB3ZSBtYXkganVzdCBuZWVkIHRvIGFn
cmVlIHRvIGRpc2FncmVlLgoKQ2hlZXJzLAoKCQkJCQkJLSBUZWQKClAuUy4gIFJ1bm5pbmcgc2Ny
aXB0cyBpcyBUdXJpbmctZXF1aXZhbGVudCwgc28gaXQncyBzZWxmLWV2aWRlbnQgdGhhdAoqYW55
dGhpbmcqIHlvdSBjYW4gZG8gd2l0aCBvdGhlciB0ZXN0IGZyYW1ld29ya3MgeW91IGNhbiBzb21l
aG93IGRvIGluCmtzZWxmdGVzdHMuICBUaGF0IGFyZ3VtZW50IGRvZXNuJ3QgaW1wcmVzcyBtZSwg
YW5kIHdoeSBJIGRvIGNvbnNpZGVyCml0IHF1aXRlIGZsaXBwYW50LiAgKEhlY2ssIC9iaW4vdmkg
aXMgVHVyaW5nIGVxdWl2YWxlbnQgc28gd2UgY291bGQKdXNlIHZpIHRvIGFzIGEga2VybmVsIHRl
c3QgZnJhbWV3b3JrLiAgT3Igd2UgY291bGQgdXNlIGVtYWNzLiAgTGV0J3MKbm90LiAgOi0pCgpU
aGUgcXVlc3Rpb24gaXMgd2hldGhlciBpdCBpcyB0aGUgbW9zdCBiZXN0IGFuZCBtb3N0IGVmZmlj
aWVudCB3YXkgdG8KZG8gdGhhdCB0ZXN0aW5nLiAgQW5kIGRldmVsb3BlciB2ZWxvY2l0eSBpcyBh
IHJlYWxseSBiaWcgcGFydCBvZiBteQpldmFsdWF0aW9uIGZ1bmN0aW9uIHdoZW4ganVkZ2luZyB3
aGV0aGVyIG9yIGEgdGVzdCBmcmFtZXdvcmsgaXMgZml0CmZvciB0aGF0IHB1cnBvc2UuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
