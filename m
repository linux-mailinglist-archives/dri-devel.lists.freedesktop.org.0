Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C885BD7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008776E7AF;
	Thu,  8 Aug 2019 07:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0E1E6E046
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 12:38:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3757F28;
 Wed,  7 Aug 2019 05:38:12 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358E03F575;
 Wed,  7 Aug 2019 05:38:10 -0700 (PDT)
Date: Wed, 7 Aug 2019 13:38:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190807123807.GD54191@lakrids.cambridge.arm.com>
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDk6MzE6NTVBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQgNzozNSBBTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0
bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwNzox
MTo0MUFNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgQXVnIDYsIDIwMTkg
YXQgMTo0OCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiBUaGlzIGdvZXMgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4gIGRybV9jZmx1c2hfKiBh
cmUgYSBiYWQgQVBJIHdlIG5lZWQgdG8KPiA+ID4gPiBnZXQgcmlkIG9mLCBub3QgYWRkIHVzZSBv
ZiBpdC4gIFRoZSByZWFzb24gZm9yIHRoYXQgaXMgdHdvLWZvbGQ6Cj4gPiA+ID4KPiA+ID4gPiAg
YSkgaXQgZG9lc24ndCBhZGRyZXNzIGhvdyBjYWNoZSBtYWludGFpbmNlIGFjdHVhbGx5IHdvcmtz
IGluIG1vc3QKPiA+ID4gPiAgICAgcGxhdGZvcm1zLiAgV2hlbiB0YWxraW5nIGFib3V0IGEgY2Fj
aGUgd2UgdGhyZWUgZnVuZGFtZW50YWwgb3BlcmF0aW9uczoKPiA+ID4gPgo+ID4gPiA+ICAgICAg
ICAgMSkgd3JpdGUgYmFjayAtIHRoaXMgd3JpdGVzIHRoZSBjb250ZW50IG9mIHRoZSBjYWNoZSBi
YWNrIHRvIHRoZQo+ID4gPiA+ICAgICAgICAgICAgYmFja2luZyBtZW1vcnkKPiA+ID4gPiAgICAg
ICAgIDIpIGludmFsaWRhdGUgLSB0aGlzIHJlbW92ZSB0aGUgY29udGVudCBvZiB0aGUgY2FjaGUK
PiA+ID4gPiAgICAgICAgIDMpIHdyaXRlIGJhY2sgKyBpbnZhbGlkYXRlIC0gZG8gYm90aCBvZiB0
aGUgYWJvdmUKPiA+ID4KPiA+ID4gQWdyZWVkIHRoYXQgZHJtX2NmbHVzaF8qIGlzbid0IGEgZ3Jl
YXQgQVBJLiAgSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UKPiA+ID4gKElJVUMpLCBJIG5lZWQgd2Ir
aW52IHNvIHRoYXQgdGhlcmUgYXJlbid0IGRpcnR5IGNhY2hlIGxpbmVzIHRoYXQgZHJvcAo+ID4g
PiBvdXQgdG8gbWVtb3J5IGxhdGVyLCBhbmQgc28gdGhhdCBJIGRvbid0IGdldCBhIGNhY2hlIGhp
dCBvbgo+ID4gPiB1bmNhY2hlZC93YyBtbWFwJ2luZy4KPiA+Cj4gPiBJcyB0aGVyZSBhIGNhY2hl
YWJsZSBhbGlhcyBseWluZyBhcm91bmQgKGUuZy4gdGhlIGxpbmVhciBtYXApLCBvciBhcmUKPiA+
IHRoZXNlIGFkZHJlc3NlcyBvbmx5IG1hcHBlZCB1bmNhY2hlZC93Yz8KPiA+Cj4gPiBJZiB0aGVy
ZSdzIGEgY2FjaGVhYmxlIGFsaWFzLCBwZXJmb3JtaW5nIGFuIGludmFsaWRhdGUgaXNuJ3Qgc3Vm
ZmljaWVudCwKPiA+IHNpbmNlIGEgQ1BVIGNhbiBhbGxvY2F0ZSBhIG5ldyAoY2xlYW4pIGVudHJ5
IGF0IGFueSBwb2ludCBpbiB0aW1lIChlLmcuCj4gPiBhcyBhIHJlc3VsdCBvZiBwcmVmZXRjaGlu
ZyBvciBhcmJpdHJhcnkgc3BlY3VsYXRpb24pLgo+IAo+IEkgKmJlbGlldmUqIHRoYXQgdGhlcmUg
YXJlIG5vdCBhbGlhcyBtYXBwaW5ncyAodGhhdCBJIGRvbid0IGNvbnRyb2wKPiBteXNlbGYpIGZv
ciBwYWdlcyBjb21pbmcgZnJvbQo+IHNobWVtX2ZpbGVfc2V0dXAoKS9zaG1lbV9yZWFkX21hcHBp
bmdfcGFnZSgpLi4gIAoKQUZBSUNULCB0aGF0J3MgcmVndWxhciBhbm9ueW1vdXMgbWVtb3J5LCBz
byB0aGVyZSB3aWxsIGJlIGEgY2FjaGVhYmxlCmFsaWFzIGluIHRoZSBsaW5lYXIvZGlyZWN0IG1h
cC4KCj4gZGlnZ2luZyBhcm91bmQgYXQgd2hhdCBkbWFfc3luY19zZ18qIGRvZXMgdW5kZXIgdGhl
IGhvb2QsIGl0IGxvb2tzCj4gbGlrZSBpdCBpcyBqdXN0IGFyY2hfc3luY19kbWFfZm9yX2NwdS9k
ZXZpY2UoKSwgc28gSSBndWVzcyB0aGF0IHNob3VsZAo+IGJlIHN1ZmZpY2llbnQgZm9yIHdoYXQg
SSBuZWVkLgoKSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIGNhc2UsIHBlciB0aGUgZXhhbXBsZSBJ
IGdhdmUgYWJvdmUuCgpUaGFua3MsCk1hcmsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
