Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174A16938
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 19:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546436E801;
	Tue,  7 May 2019 17:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Tue, 07 May 2019 17:29:52 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B796E801
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 17:29:51 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x47HMurS031460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 May 2019 13:22:59 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 7D6D5420024; Tue,  7 May 2019 13:22:56 -0400 (EDT)
Date: Tue, 7 May 2019 13:22:56 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190507172256.GB5900@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Greg KH <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>,
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507080119.GB28121@kroah.com>
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
 Frank Rowand <frowand.list@gmail.com>, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, richard@nod.at,
 sboyd@kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTA6MDE6MTlBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiA+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgaW50ZW50IG9mIEtVbml0IGlzIHRvIGF2
b2lkIGJvb3RpbmcgYSBrZXJuZWwgb24KPiA+IHJlYWwgaGFyZHdhcmUgb3IgaW4gYSB2aXJ0dWFs
IG1hY2hpbmUuICBUaGF0IHNlZW1zIHRvIGJlIGEgbWF0dGVyIG9mIHNlbWFudGljcwo+ID4gdG8g
bWUgYmVjYXVzZSBpc24ndCBpbnZva2luZyBhIFVNTCBMaW51eCBqdXN0IHJ1bm5pbmcgdGhlIExp
bnV4IGtlcm5lbCBpbgo+ID4gYSBkaWZmZXJlbnQgZm9ybSBvZiB2aXJ0dWFsaXphdGlvbj8KPiA+
IAo+ID4gU28gSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgS1VuaXQgaXMgYW4gaW1wcm92ZW1lbnQg
b3ZlciBrc2VsZnRlc3QuCj4gPiAKPiA+IEl0IHNlZW1zIHRvIG1lIHRoYXQgS1VuaXQgaXMganVz
dCBhbm90aGVyIHBpZWNlIG9mIGluZnJhc3RydWN0dXJlIHRoYXQgSQo+ID4gYW0gZ29pbmcgdG8g
aGF2ZSB0byBiZSBmYW1pbGlhciB3aXRoIGFzIGEga2VybmVsIGRldmVsb3Blci4gIE1vcmUgb3Zl
cmhlYWQsCj4gPiBtb3JlIGluZm9ybWF0aW9uIHRvIHN0dWZmIGludG8gbXkgdGlueSBsaXR0bGUg
YnJhaW4uCj4gPiAKPiA+IEkgd291bGQgZ3Vlc3MgdGhhdCBzb21lIGRldmVsb3BlcnMgd2lsbCBm
b2N1cyBvbiBqdXN0IG9uZSBvZiB0aGUgdHdvIHRlc3QKPiA+IGVudmlyb25tZW50cyAoYW5kIHNv
bWUgd2lsbCBmb2N1cyBvbiBib3RoKSwgc3BsaXR0aW5nIHRoZSBkZXZlbG9wbWVudAo+ID4gcmVz
b3VyY2VzIGluc3RlYWQgb2YgcG9vbGluZyB0aGVtIG9uIGEgY29tbW9uIGluZnJhc3RydWN0dXJl
Lgo+ID4gCj4gPiBXaGF0IGFtIEkgbWlzc2luZz8KPiAKPiBrc2VsZnRlc3QgcHJvdmlkZXMgbm8g
aW4ta2VybmVsIGZyYW1ld29yayBmb3IgdGVzdGluZyBrZXJuZWwgY29kZQo+IHNwZWNpZmljYWxs
eS4gIFRoYXQgc2hvdWxkIGJlIHdoYXQga3VuaXQgcHJvdmlkZXMsIGFuICJlYXN5IiB3YXkgdG8K
PiB3cml0ZSBpbi1rZXJuZWwgdGVzdHMgZm9yIHRoaW5ncy4KPiAKPiBCcmVuZGFuLCBkaWQgSSBn
ZXQgaXQgcmlnaHQ/CgpZZXMsIHRoYXQncyBiYXNpY2FsbHkgcmlnaHQuICBZb3UgZG9uJ3QgKmhh
dmUqIHRvIHVzZSBLVW5pdC4gIEl0J3MKc3VwcG9zZWQgdG8gYmUgYSBzaW1wbGUgd2F5IHRvIHJ1
biBhIGxhcmdlIG51bWJlciBvZiBzbWFsbCB0ZXN0cyB0aGF0CmZvciBzcGVjaWZpYyBzbWFsbCBj
b21wb25lbnRzIGluIGEgc3lzdGVtLgoKRm9yIGV4YW1wbGUsIEkgY3VycmVudGx5IHVzZSB4ZnN0
ZXN0cyB1c2luZyBLVk0gYW5kIEdDRSB0byB0ZXN0IGFsbCBvZgpleHQ0LiAgVGhlc2UgdGVzdHMg
cmVxdWlyZSB1c2luZyBtdWx0aXBsZSA1IEdCIGFuZCAyMEdCIHZpcnR1YWwgZGlza3MsCmFuZCBp
dCB3b3JrcyBieSBtb3VudGluZyBleHQ0IGZpbGUgc3lzdGVtcyBhbmQgZXhlcmNpc2luZyBleHQ0
IHRocm91Z2gKdGhlIHN5c3RlbSBjYWxsIGludGVyZmFjZXMsIHVzaW5nIHVzZXJzcGFjZSB0b29s
cyBzdWNoIGFzIGZzc3RyZXNzLApmc3gsIGZpbywgZXRjLiAgSXQgcmVxdWlyZXMgdGltZSBvdmVy
aGVhZCB0byBzdGFydCB0aGUgVk0sIGNyZWF0ZSBhbmQKYWxsb2NhdGUgdmlydHVhbCBkaXNrcywg
ZXRjLiAgRm9yIGV4YW1wbGUsIHRvIHJ1biBhIHNpbmdsZSAzIHNlY29uZHMKeGZzdGVzdCAoZ2Vu
ZXJpYy8wMDEpLCBpdCByZXF1aXJlcyBmdWxsIDEwIHNlY29uZHMgdG8gcnVuIGl0IHZpYQprdm0t
eGZzdGVzdHMuCgpLVW5pdCBpcyBzb21ldGhpbmcgZWxzZTsgaXQncyBzcGVjaWZpY2FsbHkgaW50
ZW5kZWQgdG8gYWxsb3cgeW91IHRvCmNyZWF0ZSBsaWdodHdlaWdodCB0ZXN0cyBxdWlja2x5IGFu
ZCBlYXNpbHksIGFuZCBieSByZWR1Y2luZyB0aGUKZWZmb3J0IG5lZWRlZCB0byB3cml0ZSBhbmQg
cnVuIHVuaXQgdGVzdHMsIGhvcGVmdWxseSB3ZSdsbCBoYXZlIGEgbG90Cm1vcmUgb2YgdGhlbSBh
bmQgdGh1cyBpbXByb3ZlIGtlcm5lbCBxdWFsaXR5LgoKQXMgYW4gZXhhbXBsZSwgSSBoYXZlIGEg
dm9sdW50ZWVyIHdvcmtpbmcgb24gZGV2ZWxvcGluZyBLVWluaXQgdGVzdHMKZm9yIGV4dDQuICBX
ZSdyZSBnb2luZyB0byBzdGFydCBieSB0ZXN0aW5nIHRoZSBleHQ0IGV4dGVudCBzdGF0dXMKdHJl
ZS4gIFRoZSBzb3VyY2UgY29kZSBpcyBhdCBmcy9leHQ0L2V4dGVudF9zdGF0dXMuYzsgaXQncwph
cHByb3hpbWF0ZWx5IDE4MDAgTE9DLiAgVGhlIEt1bml0IHRlc3RzIGZvciB0aGUgZXh0ZW50IHN0
YXR1cyB0cmVlCndpbGwgZXhlcmNpc2UgYWxsIG9mIHRoZSBjb3JuZXIgY2FzZXMgZm9yIHRoZSB2
YXJpb3VzIGV4dGVudCBzdGF0dXMKdHJlZSBmdW5jdGlvbnMgLS0tIGUuZy4sIGV4dDRfZXNfaW5z
ZXJ0X2RlbGF5ZWRfYmxvY2soKSwKZXh0NF9lc19yZW1vdmVfZXh0ZW50KCksIGV4dDRfZXNfY2Fj
aGVfZXh0ZW50KCksIGV0Yy4gIEFuZCBpdCB3aWxsIGRvCnRoaXMgaW4gaXNvbGF0aW9uIHdpdGhv
dXQgb3VyIG5lZWRpbmcgdG8gY3JlYXRlIGEgdGVzdCBmaWxlIHN5c3RlbSBvcgp1c2luZyBhIHRl
c3QgYmxvY2sgZGV2aWNlLgoKTmV4dCB3ZSdsbCB0ZXN0IHRoZSBleHQ0IGJsb2NrIGFsbG9jYXRv
ciwgYWdhaW4gaW4gaXNvbGF0aW9uLiAgVG8gdGVzdAp0aGUgYmxvY2sgYWxsb2NhdG9yIHdlIHdp
bGwgaGF2ZSB0byB3cml0ZSAibW9jayBmdW5jdGlvbnMiIHdoaWNoCnNpbXVsYXRlIHJlYWRpbmcg
YWxsb2NhdGlvbiBiaXRtYXBzIGZyb20gZGlzay4gIEFnYWluLCB0aGlzIHdpbGwgYWxsb3cKdGhl
IHRlc3Qgd3JpdGVyIHRvIGV4cGxpY2l0bHkgY29uc3RydWN0IGNvcm5lciBjYXNlcyBhbmQgdmFs
aWRhdGUgdGhhdAp0aGUgYmxvY2sgYWxsb2NhdG9yIHdvcmtzIGFzIGV4cGVjdGVkIHdpdGhvdXQg
aGF2aW5nIHRvIHJldmVyZXNlCmVuZ2luZWVyIGZpbGUgc3lzdGVtIGRhdGEgc3RydWN0dXJlcyB3
aGljaCB3aWxsIGZvcmNlIGEgcGFydGljdWxhcgpjb2RlIHBhdGggdG8gYmUgZXhlY3V0ZWQuCgpT
byB0aGlzIGlzIHdoeSBpdCdzIGxhcmdlbHkgaXJyZWxldmFudCB0byBtZSB0aGF0IEtVaW5pdCB1
c2VzIFVNTC4gIEluCmZhY3QsIGl0J3MgYSBmZWF0dXJlLiAgV2UncmUgbm90IHRlc3RpbmcgZGV2
aWNlIGRyaXZlcnMsIG9yIHRoZQpzY2hlZHVsZXIsIG9yIGFueXRoaW5nIGVsc2UgYXJjaGl0ZWN0
dXJlLXNwZWNpZmljLiAgVU1MIGlzIG5vdCBhYm91dAp2aXJ0dWFsaXphdGlvbi4gIFdoYXQgaXQn
cyBhYm91dCBpbiB0aGlzIGNvbnRleHQgaXMgYWxsb3dpbmcgdXMgdG8Kc3RhcnQgcnVubmluZyB0
ZXN0IGNvZGUgYXMgcXVpY2tseSBhcyBwb3NzaWJsZS4gIEJvb3RpbmcgS1ZNIHRha2VzCmFib3V0
IDMtNCBzZWNvbmRzLCBhbmQgdGhpcyBpbmNsdWRlcyBpbml0aWFsaXppbmcgdmlydGlvX3Njc2kg
YW5kCm90aGVyIGRldmljZSBkcml2ZXJzLiAgSWYgYnkgdXNpbmcgVU1MIHdlIGNhbiBob2xkIHRo
ZSBhbW91bnQgb2YKdW5uZWNlc3Nhcnkga2VybmVsIHN1YnN5c3RlbSBpbml0aWFsaXphdGlvbiBk
b3duIHRvIHRoZSBhYnNvbHV0ZQptaW5pbXVtLCBhbmQgaWYgaXQgbWVhbnMgdGhhdCB3ZSBjYW4g
Y29tbXVuaWNhdGluZyB0byB0aGUgdGVzdApmcmFtZXdvcmsgdmlhIGEgdXNlcnNwYWNlICJwcmlu
dGYiIGZyb20gVU1ML0tVbml0IGNvZGUsIGFzIG9wcG9zZWQgdG8KdmlhIGEgdmlydHVhbCBzZXJp
YWwgcG9ydCB0byBLVk0ncyB2aXJ0dWFsIGNvbnNvbGUsIGl0IGFsbCBtYWtlcyBmb3IKbGlnaHRl
ciB3ZWlnaHQgdGVzdGluZy4KCldoeSBkaWQgSSBnbyBsb29raW5nIGZvciBhIHZvbHVudGVlciB0
byB3cml0ZSBLVW5pdCB0ZXN0cyBmb3IgZXh0ND8KV2VsbCwgSSBoYXZlIGEgcGxhbiB0byBtYWtl
IHNvbWUgY2hhbmdlcyBpbiByZXN0cnVjdGluZyBob3cgZXh0NCdzCndyaXRlIHBhdGggd29ya3Ms
IGluIG9yZGVyIHRvIHN1cHBvcnQgdGhpbmdzIGxpa2UgY29weS1vbi13cml0ZSwgYQptb3JlIGVm
ZmljaWVudCBkZWxheWVkIGFsbG9jYXRpb24gc3lzdGVtLCBldGMuICBUaGlzIHdpbGwgcmVxdWly
ZQptYWtpbmcgY2hhbmdlcyB0byB0aGUgZXh0ZW50IHN0YXR1cyB0cmVlLCBhbmQgYnkgaGF2aW5n
IHVuaXQgdGVzdHMgZm9yCnRoZSBleHRlbnQgc3RhdHVzIHRyZWUsIHdlJ2xsIGJlIGFibGUgdG8g
ZGV0ZWN0IGFueSBidWdzIHRoYXQgd2UgbWlnaHQKYWNjaWRlbnRhbGx5IGludHJvZHVjZSBpbiB0
aGUgZXMgdHJlZSBmYXIgbW9yZSBxdWlja2x5IHRoYW4gaWYgd2UKZGlkbid0IGhhdmUgdGhvc2Ug
dGVzdHMgYXZhaWxhYmxlLiAgR29vZ2xlIGhhcyBsb25nIGZvdW5kIHRoYXQgaGF2aW5nCnRoZXNl
IHNvcnRzIG9mIHVuaXQgdGVzdHMgaXMgYSByZWFsIHdpbiBmb3IgZGV2ZWxvcGVyIHZlbG9jaXR5
IGZvciBhbnkKbm9uLXRyaXZpYWwgY29kZSBtb2R1bGUgKG9yIEMrKyBjbGFzcyksIGV2ZW4gd2hl
biB5b3UgdGFrZSBpbnRvCmFjY291bnQgdGhlIHRpbWUgaXQgdGFrZXMgdG8gY3JlYXRlIHRoZSB1
bml0IHRlc3RzLgoKCQkJCQktIFRlZAoKUC5TLiAgTWFueSB0aGFua3MgdG8gQnJlbmRhbiBmb3Ig
ZmluZGluZyBzdWNoIGEgdm9sdW50ZWVyIGZvciBtZTsgdGhlCnBlcnNvbiBpbiBxdWVzdGlvbiBp
cyBhIFNSRSBmcm9tIFN3aXR6ZXJsYW5kIHdobyBpcyBpbnRlcmVzdGVkIGluCmdldHRpbmcgaW52
b2x2ZWQgd2l0aCBrZXJuZWwgdGVzdGluZywgYW5kIHRoaXMgaXMgZ29pbmcgdG8gYmUgdGhlaXIK
MjAlIHByb2plY3QuICA6LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
