Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A778DFFF7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE586E480;
	Tue, 22 Oct 2019 08:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765716E480
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:48:50 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:45890)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iMpqC-00065m-AN; Tue, 22 Oct 2019 09:48:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iMpq6-0004PU-O5; Tue, 22 Oct 2019 09:48:26 +0100
Date: Tue, 22 Oct 2019 09:48:26 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Message-ID: <20191022084826.GP25745@shell.armlinux.org.uk>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300>
 <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
 <20191022084210.GX11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022084210.GX11828@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MtL3YOiN71djeLoYB9yivNmcp6DZe3ZfGe1tUxOoKk8=; b=nZdVxcSfO3OODaDonUKkJDZp+
 p/ojEa1+QNdV4Bar+TtDVx0SS/00km22RcUYQoZOh45qChHxG9hFOihQBSiJFSfHMz0k5g+ETpQCF
 D0P9k5sJzwS5JlHx8zOhs+jG/Ydc7HXmHlAtIpnTtsTvylN7nA6z1qZuV1tl7y3PKfkUg97E4Wo/k
 ff6wUb744sqaA2kix/oN5v08RmSNsQGzl9VgUWYWey+m6+CeJoAJvK91DRhsL6LCZxA5n3hRx5rrM
 5b6PBXuuBB/bqjejOKT/VkIW/fOojFJgYYNWKTJ2+kvN654lhZ3zOrNMAgW2WPCSvRaqfzWuh6keh
 A21EgMV1A==;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6NDI6MTBBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMjo0MTozN1BNICswMTAwLCBSdXNzZWxs
IEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBh
dCAxMDo0ODoxMkFNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9j
dCAxNywgMjAxOSBhdCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAwODoy
MDo1NkFNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBPY3Qg
MTcsIDIwMTkgYXQgMDM6MDc6NTlBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0
OjIyOjA3UE0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gSWYgSmFtZXMgaXMgc3Ryb25nbHkgYWdhaW5zdCBtZXJnaW5nIHRoaXMsIG1heWJl
IHdlIGp1c3Qgc3dhcAo+ID4gPiA+ID4gPiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3Ig
bWUsIHRoZSBwcmFnbWF0aWMgYXBwcm9hY2ggd291bGQgYmUgdGhpcwo+ID4gPiA+ID4gPiA+IHN0
b3AtZ2FwLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGlzIGlzIGEg
Z29vZCBpZGVhLCBhbmQgSSB2b3RlICtVTE9OR19NQVggOikKPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4IGRyaXZlciwgaXQgc3VwcG9ydHMgYnJpZGdl
LiBzbyBzd2FwIHRoZQo+ID4gPiA+ID4gPiB3aG9sZXNhbGUgdG8gYnJpZ2UgaXMgcGVyZmVjdC4g
OikKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdlbGwsIGFzIE1paGFpbCB3cm90
ZSwgaXQncyBkZWZpbml0ZWx5IG5vdCBwZXJmZWN0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUb2Rh
eSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZlciBzdGlsbCBsb2FkZWQs
Cj4gPiA+ID4gPiBldmVyeXRoaW5nIHdpbGwgYmUgdW5ib3VuZCBncmFjZWZ1bGx5Lgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBJZiB3ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdpbmcgdGRhOTk4
eCAob3IgYW55IG90aGVyIGJyaWRnZQo+ID4gPiA+ID4gZHJpdmVyIHRoZSBEUFUgaXMgdXNpbmcp
IHdpdGggdGhlIERQVSBkcml2ZXIgc3RpbGwgbG9hZGVkIHdpbGwgcmVzdWx0Cj4gPiA+ID4gPiBp
biBhIGNyYXNoLgo+ID4gPiA+IAo+ID4gPiA+IEkgaGF2ZW4ndCByZWFkIHRoZSBicmlkZ2UgY29k
ZSwgYnV0IHNlZW1zIHRoaXMgaXMgYSBidWcgb2YgZHJtX2JyaWRnZSwKPiA+ID4gPiBzaW5jZSBp
ZiB0aGUgYnJpZGdlIGlzIHN0aWxsIGluIHVzaW5nIGJ5IG90aGVycywgdGhlIHJtbW9kIHNob3Vs
ZCBmYWlsCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBDb3JyZWN0LCBidXQgdGhlcmUncyBubyBmaXgg
Zm9yIHRoYXQgdG9kYXkuIFlvdSBjYW4gYWxzbyB0YWtlIGEgbG9vawo+ID4gPiBhdCB0aGUgdGhy
ZWFkIGxpbmtlZCBmcm9tIE1paGFpbCdzIGNvdmVyIGxldHRlci4KPiA+ID4gCj4gPiA+ID4gQW5k
IHBlcnNvbmFsbHkgb3BpbmlvbiwgaWYgdGhlIGJyaWRnZSBkb2Vzbid0IGhhbmRsZSB0aGUgZGVw
ZW5kZW5jZS4KPiA+ID4gPiBmb3IgdXM6Cj4gPiA+ID4gCj4gPiA+ID4gLSBhZGQgc3VjaCBzdXBw
b3J0IHRvIGJyaWRnZQo+ID4gPiAKPiA+ID4gVGhhdCB3b3VsZCBjZXJ0YWlubHkgYmUgaGVscGZ1
bC4gSSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgY29uc2Vuc3VzIG9uCj4gPiA+IGhvdyB0byBkbyB0
aGF0Lgo+ID4gPiAKPiA+ID4gPiAgIG9yCj4gPiA+ID4gLSBqdXN0IGRvIHRoZSBpbnNtb2Qvcm1t
b2QgaW4gY29ycmVjdCBvcmRlci4KPiA+ID4gPiAKPiA+ID4gPiA+IFNvLCB0aGVyZSByZWFsbHkg
YXJlIHByb3BlciBiZW5lZml0cyB0byBzdGlja2luZyB3aXRoIHRoZSBjb21wb25lbnQKPiA+ID4g
PiA+IGNvZGUgZm9yIHRkYTk5OHgsIHdoaWNoIGlzIHdoeSBJJ2QgbGlrZSB0byB1bmRlcnN0YW5k
IHdoeSB5b3UncmUgc28KPiA+ID4gPiA+IGFnYWluc3QgdGhpcyBwYXRjaD8KPiA+ID4gPiA+Cj4g
PiA+ID4gCj4gPiA+ID4gVGhpcyBjaGFuZ2UgaGFuZGxlcyB0d28gZGlmZmVyZW50IGNvbm5lY3Rv
cnMgaW4ga29tZWRhIGludGVybmFsbHksIGNvbXBhcmUKPiA+ID4gPiB3aXRoIG9uZSBpbnRlcmZh
Y2UsIGl0IGluY3JlYXNlcyB0aGUgY29tcGxleGl0eSwgbW9yZSByaXNrIG9mIGJ1ZyBhbmQgbW9y
ZQo+ID4gPiA+IGNvc3Qgb2YgbWFpbnRhaW5hbmNlLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gV2Vs
bCwgaXQncyBvbmx5IGFib3V0IGhvdyB0byBiaW5kIHRoZSBkcml2ZXJzIC0gdHdvIGRpZmZlcmVu
dCBtZXRob2RzCj4gPiA+IG9mIGJpbmRpbmcsIG5vdCB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMu
IEkgd291bGQgYXJndWUgdGhhdCBjYXJyeWluZwo+ID4gPiBvdXIgb3V0LW9mLXRyZWUgcGF0Y2hl
cyB0byBzdXBwb3J0IGJvdGggcGxhdGZvcm1zIGlzIGEgbGFyZ2VyCj4gPiA+IG1haW50ZW5hbmNl
IGJ1cmRlbi4KPiA+ID4gCj4gPiA+IEhvbmVzdGx5IHRoaXMgbG9va3MgbGlrZSBhIHdpbi13aW4g
dG8gbWUuIFdlIGdldCB0aGUgc3VwZXJpb3IgYXBwcm9hY2gKPiA+ID4gd2hlbiBpdHMgc3VwcG9y
dGVkLCBhbmQgc3RpbGwgZ2V0IHRvIHN1cHBvcnQgYnJpZGdlcyB3aGljaCBhcmUgbW9yZQo+ID4g
PiBjb21tb24uCj4gPiA+IAo+ID4gPiBBcy93aGVuIGltcHJvdmVtZW50cyBhcmUgbWFkZSB0byB0
aGUgYnJpZGdlIGNvZGUgd2UgY2FuIHJlbW92ZSB0aGUKPiA+ID4gY29tcG9uZW50IGJpdHMgYW5k
IG5vdCBsb3NlIGFueXRoaW5nLgo+ID4gCj4gPiBUaGVyZSB3YXMgYW4gaWRlYSBhIHdoaWxlIGJh
Y2sgYWJvdXQgdXNpbmcgdGhlIGRldmljZSBsaW5rcyBjb2RlIHRvCj4gPiBzb2x2ZSB0aGUgYnJp
ZGdlIGlzc3VlIC0gYnV0IGF0IHRoZSB0aW1lIHRoZSBkZXZpY2UgbGlua3MgY29kZSB3YXNuJ3QK
PiA+IHVwIHRvIHRoZSBqb2IuICBJIHRoaW5rIHRoYXQncyBiZWVuIHJlc29sdmVkIG5vdywgYnV0
IEkgaGF2ZW4ndCBiZWVuCj4gPiBhYmxlIHRvIGNvbmZpcm0gaXQuICBJIGRpZCBwcm9wb3NlIHNv
bWUgcGF0Y2hlcyBmb3IgYnJpZGdlIGF0IHRoZQo+ID4gdGltZSBidXQgdGhleSBwcm9iYWJseSBu
ZWVkIHVwZGF0aW5nLgo+IAo+IEkgdGhpbmsgdGhlIG9ubHkgcGF0Y2hlcyB0aGF0IGV4aXN0ZWQg
d2hlcmUgZm9yIHBhbmVsLCBhbmQgd2Ugb25seQo+IGRpc2N1c3NlZCB0aGUgYnJpZGdlIGNhc2Uu
IEF0IGxlYXN0IEkgY2FuIG9ubHkgZmluZCBwYXRjaGVzIGZvciBwYW5lbCxub3QKPiBicmlkZ2Us
IGJ1dCBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZy4KCkkgaGFkIGEgcGF0Y2hlcywgd2hpY2gg
aXMgd2h5IEkgcmFpc2VkIHRoZSBwcm9ibGVtIHdpdGggdGhlIGNvcmU6Cgo2OTYxZWRmZWUyNmQg
YnJpZGdlIGhhY2tzIHVzaW5nIGRldmljZSBsaW5rcwoKYnV0IGl0IG5ldmVyIHdlbnQgZnVydGhl
ciB0aGFuIGFuIGV4cGVyaW1lbnQgYXQgdGhlIHRpbWUgYmVjYXVzZSBvZiB0aGUKcHJvYmxlbXMg
aW4gdGhlIGNvcmUuICBBcyBpdCB3YXMgYSBoYWNrLCBpdCBuZXZlciBnb3QgcG9zdGVkLiAgU2Vl
bXMKdGhhdCBrZXJuZWwgdHJlZSAoZm9yIHRoZSBjdWJveCkgaXMgc3RpbGwgNS4yIGJhc2VkLCBz
byBoYXMgYSBsb3Qgb2YKcGF0Y2hlcyBhbmQgbWlnaHQgbmVlZCB1cGRhdGluZyB0byBhIG1vcmUg
cmVjZW50IGJhc2UgYmVmb3JlIGFueXRoaW5nCmNhbiBiZSB0ZXN0ZWQuCgotLSAKUk1LJ3MgUGF0
Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMv
CkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIu
MU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJw
cyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
