Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9115EBB
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2089EB8;
	Tue,  7 May 2019 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DA689EB8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:01:22 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6057820B7C;
 Tue,  7 May 2019 08:01:21 +0000 (UTC)
Date: Tue, 7 May 2019 10:01:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190507080119.GB28121@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557216081;
 bh=QzyiMEIgGcOHF7/0RhAcYYAteXaKFmx6V5mlxAloU/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYZnGuH3Pbk4yrhdCzdKoMJOLOSIlgRBPlakGO9b31IdpbGDZVFQSkxHJZke5YiqF
 kLlxf+8LdYwPSAUw422OvFILYSfk5W9idQInw+r9Pj1esrAbnpH/5dYqp76eoeqJjE
 y7EgY8L7QWLFChBoIcI/eDpJ/HS6IYXXX+xBrQeg=
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
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDg6MTQ6MTJQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IE9uIDUvMS8xOSA0OjAxIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiAjIyBU
TERSCj4gPiAKPiA+IEkgcmViYXNlZCB0aGUgbGFzdCBwYXRjaHNldCBvbiA1LjEtcmM3IGluIGhv
cGVzIHRoYXQgd2UgY2FuIGdldCB0aGlzIGluCj4gPiA1LjIuCj4gPiAKPiA+IFNodWFoLCBJIHRo
aW5rIHlvdSwgR3JlZyBLSCwgYW5kIG15c2VsZiB0YWxrZWQgb2ZmIHRocmVhZCwgYW5kIHdlIGFn
cmVlZAo+ID4gd2Ugd291bGQgbWVyZ2UgdGhyb3VnaCB5b3VyIHRyZWUgd2hlbiB0aGUgdGltZSBj
YW1lPyBBbSBJIHJlbWVtYmVyaW5nCj4gPiBjb3JyZWN0bHk/Cj4gPiAKPiA+ICMjIEJhY2tncm91
bmQKPiA+IAo+ID4gVGhpcyBwYXRjaCBzZXQgcHJvcG9zZXMgS1VuaXQsIGEgbGlnaHR3ZWlnaHQg
dW5pdCB0ZXN0aW5nIGFuZCBtb2NraW5nCj4gPiBmcmFtZXdvcmsgZm9yIHRoZSBMaW51eCBrZXJu
ZWwuCj4gPiAKPiA+IFVubGlrZSBBdXRvdGVzdCBhbmQga3NlbGZ0ZXN0LCBLVW5pdCBpcyBhIHRy
dWUgdW5pdCB0ZXN0aW5nIGZyYW1ld29yazsKPiA+IGl0IGRvZXMgbm90IHJlcXVpcmUgaW5zdGFs
bGluZyB0aGUga2VybmVsIG9uIGEgdGVzdCBtYWNoaW5lIG9yIGluIGEgVk0KPiA+IGFuZCBkb2Vz
IG5vdCByZXF1aXJlIHRlc3RzIHRvIGJlIHdyaXR0ZW4gaW4gdXNlcnNwYWNlIHJ1bm5pbmcgb24g
YSBob3N0Cj4gPiBrZXJuZWwuIEFkZGl0aW9uYWxseSwgS1VuaXQgaXMgZmFzdDogRnJvbSBpbnZv
Y2F0aW9uIHRvIGNvbXBsZXRpb24gS1VuaXQKPiA+IGNhbiBydW4gc2V2ZXJhbCBkb3plbiB0ZXN0
cyBpbiB1bmRlciBhIHNlY29uZC4gQ3VycmVudGx5LCB0aGUgZW50aXJlCj4gPiBLVW5pdCB0ZXN0
IHN1aXRlIGZvciBLVW5pdCBydW5zIGluIHVuZGVyIGEgc2Vjb25kIGZyb20gdGhlIGluaXRpYWwK
PiA+IGludm9jYXRpb24gKGJ1aWxkIHRpbWUgZXhjbHVkZWQpLgo+ID4gCj4gPiBLVW5pdCBpcyBo
ZWF2aWx5IGluc3BpcmVkIGJ5IEpVbml0LCBQeXRob24ncyB1bml0dGVzdC5tb2NrLCBhbmQKPiA+
IEdvb2dsZXRlc3QvR29vZ2xlbW9jayBmb3IgQysrLiBLVW5pdCBwcm92aWRlcyBmYWNpbGl0aWVz
IGZvciBkZWZpbmluZwo+ID4gdW5pdCB0ZXN0IGNhc2VzLCBncm91cGluZyByZWxhdGVkIHRlc3Qg
Y2FzZXMgaW50byB0ZXN0IHN1aXRlcywgcHJvdmlkaW5nCj4gPiBjb21tb24gaW5mcmFzdHJ1Y3R1
cmUgZm9yIHJ1bm5pbmcgdGVzdHMsIG1vY2tpbmcsIHNweWluZywgYW5kIG11Y2ggbW9yZS4KPiAK
PiBBcyBhIHJlc3VsdCBvZiB0aGUgZW1haWxzIHJlcGx5aW5nIHRvIHRoaXMgcGF0Y2ggdGhyZWFk
LCBJIGFtIG5vdwo+IHN0YXJ0aW5nIHRvIGxvb2sgYXQga3NlbGZ0ZXN0LiAgTXkgbGV2ZWwgb2Yg
dW5kZXJzdGFuZGluZyBpcyBiYXNlZAo+IG9uIHNvbWUgc2xpZGUgcHJlc2VudGF0aW9ucywgYW4g
TFdOIGFydGljbGUsIGh0dHBzOi8va3NlbGZ0ZXN0Lndpa2kua2VybmVsLm9yZy8KPiBhbmQgYSBf
dGlueV8gYml0IG9mIGxvb2tpbmcgYXQga3NlbGZ0ZXN0IGNvZGUuCj4gCj4gdGw7ZHI7IEkgZG9u
J3QgcmVhbGx5IHVuZGVyc3RhbmQga3NlbGZ0ZXN0IHlldC4KPiAKPiAKPiAoMSkgd2h5IEtVbml0
IGV4aXN0cwo+IAo+ID4gIyMgV2hhdCdzIHNvIHNwZWNpYWwgYWJvdXQgdW5pdCB0ZXN0aW5nPwo+
ID4gCj4gPiBBIHVuaXQgdGVzdCBpcyBzdXBwb3NlZCB0byB0ZXN0IGEgc2luZ2xlIHVuaXQgb2Yg
Y29kZSBpbiBpc29sYXRpb24sCj4gPiBoZW5jZSB0aGUgbmFtZS4gVGhlcmUgc2hvdWxkIGJlIG5v
IGRlcGVuZGVuY2llcyBvdXRzaWRlIHRoZSBjb250cm9sIG9mCj4gPiB0aGUgdGVzdDsgdGhpcyBt
ZWFucyBubyBleHRlcm5hbCBkZXBlbmRlbmNpZXMsIHdoaWNoIG1ha2VzIHRlc3RzIG9yZGVycwo+
ID4gb2YgbWFnbml0dWRlcyBmYXN0ZXIuIExpa2V3aXNlLCBzaW5jZSB0aGVyZSBhcmUgbm8gZXh0
ZXJuYWwgZGVwZW5kZW5jaWVzLAo+ID4gdGhlcmUgYXJlIG5vIGhvb3BzIHRvIGp1bXAgdGhyb3Vn
aCB0byBydW4gdGhlIHRlc3RzLiBBZGRpdGlvbmFsbHksIHRoaXMKPiA+IG1ha2VzIHVuaXQgdGVz
dHMgZGV0ZXJtaW5pc3RpYzogYSBmYWlsaW5nIHVuaXQgdGVzdCBhbHdheXMgaW5kaWNhdGVzIGEK
PiA+IHByb2JsZW0uIEZpbmFsbHksIGJlY2F1c2UgdW5pdCB0ZXN0cyBuZWNlc3NhcmlseSBoYXZl
IGZpbmVyIGdyYW51bGFyaXR5LAo+ID4gdGhleSBhcmUgYWJsZSB0byB0ZXN0IGFsbCBjb2RlIHBh
dGhzIGVhc2lseSBzb2x2aW5nIHRoZSBjbGFzc2ljIHByb2JsZW0KPiA+IG9mIGRpZmZpY3VsdHkg
aW4gZXhlcmNpc2luZyBlcnJvciBoYW5kbGluZyBjb2RlLgo+IAo+ICgyKSBLVW5pdCBpcyBub3Qg
bWVhbnQgdG8gcmVwbGFjZSBrc2VsZnRlc3QKPiAKPiA+ICMjIElzIEtVbml0IHRyeWluZyB0byBy
ZXBsYWNlIG90aGVyIHRlc3RpbmcgZnJhbWV3b3JrcyBmb3IgdGhlIGtlcm5lbD8KPiA+IAo+ID4g
Tm8uIE1vc3QgZXhpc3RpbmcgdGVzdHMgZm9yIHRoZSBMaW51eCBrZXJuZWwgYXJlIGVuZC10by1l
bmQgdGVzdHMsIHdoaWNoCj4gPiBoYXZlIHRoZWlyIHBsYWNlLiBBIHdlbGwgdGVzdGVkIHN5c3Rl
bSBoYXMgbG90cyBvZiB1bml0IHRlc3RzLCBhCj4gPiByZWFzb25hYmxlIG51bWJlciBvZiBpbnRl
Z3JhdGlvbiB0ZXN0cywgYW5kIHNvbWUgZW5kLXRvLWVuZCB0ZXN0cy4gS1VuaXQKPiA+IGlzIGp1
c3QgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIHVuaXQgdGVzdCBzcGFjZSB3aGljaCBpcyBjdXJyZW50
bHkgbm90Cj4gPiBiZWluZyBhZGRyZXNzZWQuCj4gCj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0
IHRoZSBpbnRlbnQgb2YgS1VuaXQgaXMgdG8gYXZvaWQgYm9vdGluZyBhIGtlcm5lbCBvbgo+IHJl
YWwgaGFyZHdhcmUgb3IgaW4gYSB2aXJ0dWFsIG1hY2hpbmUuICBUaGF0IHNlZW1zIHRvIGJlIGEg
bWF0dGVyIG9mIHNlbWFudGljcwo+IHRvIG1lIGJlY2F1c2UgaXNuJ3QgaW52b2tpbmcgYSBVTUwg
TGludXgganVzdCBydW5uaW5nIHRoZSBMaW51eCBrZXJuZWwgaW4KPiBhIGRpZmZlcmVudCBmb3Jt
IG9mIHZpcnR1YWxpemF0aW9uPwo+IAo+IFNvIEkgZG8gbm90IHVuZGVyc3RhbmQgd2h5IEtVbml0
IGlzIGFuIGltcHJvdmVtZW50IG92ZXIga3NlbGZ0ZXN0Lgo+IAo+IEl0IHNlZW1zIHRvIG1lIHRo
YXQgS1VuaXQgaXMganVzdCBhbm90aGVyIHBpZWNlIG9mIGluZnJhc3RydWN0dXJlIHRoYXQgSQo+
IGFtIGdvaW5nIHRvIGhhdmUgdG8gYmUgZmFtaWxpYXIgd2l0aCBhcyBhIGtlcm5lbCBkZXZlbG9w
ZXIuICBNb3JlIG92ZXJoZWFkLAo+IG1vcmUgaW5mb3JtYXRpb24gdG8gc3R1ZmYgaW50byBteSB0
aW55IGxpdHRsZSBicmFpbi4KPiAKPiBJIHdvdWxkIGd1ZXNzIHRoYXQgc29tZSBkZXZlbG9wZXJz
IHdpbGwgZm9jdXMgb24ganVzdCBvbmUgb2YgdGhlIHR3byB0ZXN0Cj4gZW52aXJvbm1lbnRzIChh
bmQgc29tZSB3aWxsIGZvY3VzIG9uIGJvdGgpLCBzcGxpdHRpbmcgdGhlIGRldmVsb3BtZW50Cj4g
cmVzb3VyY2VzIGluc3RlYWQgb2YgcG9vbGluZyB0aGVtIG9uIGEgY29tbW9uIGluZnJhc3RydWN0
dXJlLgo+IAo+IFdoYXQgYW0gSSBtaXNzaW5nPwoKa3NlbGZ0ZXN0IHByb3ZpZGVzIG5vIGluLWtl
cm5lbCBmcmFtZXdvcmsgZm9yIHRlc3Rpbmcga2VybmVsIGNvZGUKc3BlY2lmaWNhbGx5LiAgVGhh
dCBzaG91bGQgYmUgd2hhdCBrdW5pdCBwcm92aWRlcywgYW4gImVhc3kiIHdheSB0bwp3cml0ZSBp
bi1rZXJuZWwgdGVzdHMgZm9yIHRoaW5ncy4KCkJyZW5kYW4sIGRpZCBJIGdldCBpdCByaWdodD8K
CnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
