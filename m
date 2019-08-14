Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8F8D832
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 18:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693136E6A5;
	Wed, 14 Aug 2019 16:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859916E6A5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 16:37:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 495CE803C6;
 Wed, 14 Aug 2019 18:36:59 +0200 (CEST)
Date: Wed, 14 Aug 2019 18:36:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] drm: drop drmP in tda998x, tegra, arm, armada
Message-ID: <20190814163657.GA26556@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190812203805.GA10640@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812203805.GA10640@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=0SJT8KT_22iOycAb6FwA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IFRoaXMgc2V0IG9mIHBhdGNoZXMgaXMgb25lIG9mIHRoZSBmaW5hbCBzdGVwcyBiZWZvcmUK
PiA+IHdlIGhhdmUgc3VjY2VlZGVkIHRvIHN0b3AgdXNpbmcgZHJtUC5oIGluIGFsbCBvZiBkcm0v
Lgo+ID4gCj4gPiBUaGVyZSBpcyBhIGZldyBwYXRjaGVzIGluIGZsaWdodCB0aHJvdWdoIG90aGVy
IHRyZWVzCj4gPiBhbmQgdGhlIHBsYW4gaXMgdGhhdCBhbGwgdXNlcnMgc2hhbGwgYmUgZ29uZSBp
biB0aGUKPiA+IHVwc3RyZWFtIGtlcm5lbCBhZnRlciBuZXh0IG1lcmdlIHdpbmRvdy4KPiA+IAo+
ID4gVGhlIHBhdGNoZXMgaGFzIHNlZW4gYnVpbGQgdGVzdCB3aXRoIHZhcmlvdXMgY29uZmlncwo+
ID4gd2l0aCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCj4gPiAKPiA+IFRoZSBwYXRjaGVzIGhhcyBi
ZWVuIHNlbnQgYmVmb3JlLCBidXQgdG8gbXkgYmVzdCBrbm93bGVkZ2UKPiA+IHRoZXkgaGF2ZSBu
b3QgYmVlbiBhcHBsaWVkIGFueXdoZXJlLgo+ID4gQWxsIGZvdXIgcGF0Y2hlcyBhcmUgYmFzZWQg
b24gZHJtLW1pc2MtbmV4dCwKPiA+IGJ1dCBJIGNoZWNrZWQgdGhhdCB0aGUgdGRhOTk4eCBwYXRj
aCBjYW4gYmUgYXBwbGllZCB0bwo+ID4gdGhlIHRkYTk5OHggdHJlZS4KPiA+IAo+ID4gVGhlcmUg
YXJlIG5vIGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZSBwYXRjaGVzLgo+ID4gCj4gPiB2MjoKPiA+
IC0gcmViYXNlIG9uIHRvcCBvZiBkcm0tbWlzYy1uZXh0Cj4gPiAKPiA+IFRvIG1haW50YWluZXJz
OiAoQXNzdW1pbmcgdGhlIHBhdGNoIGFyZSBPSykKPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3UgdGFrZSB0aGUgcGF0Y2gsIG9yIHJlcXVlc3QKPiA+IG1lIHRvIGFwcGx5IGl0IHRvIGRybS1t
aXNjLW5leHQuCj4gPiBPciBsZXQgbWUgbWUga25vdyBpZiB0aGUgcGF0Y2ggc2hvdWxkIGJlIGJh
c2VkIG9uIGFub3RoZXIgdHJlZS4KPiAKPiBwaW5nLi4uCj4gCj4gVGhpcyBwYXRjaHNldCBpcyBv
bmUgb2YgdGhlIGxhc3Qgc3RlcHMgdG8gZ2V0IHJpZCBvZiBkcm1QLmguCj4gT3RoZXIgcGF0Y2hl
cyBhcmUgYXBwbGllZCB0byB2YXJpb3VzIHN1Yi1zeXN0ZW0gdHJlZXMuCj4gCj4gVGhlIGlkZWEg
aXMgdGhhdCBhZnRlciBuZXh0IG1lcmdlIHdpbmRvdyBjYW4gZHJvcCBkcm1QLmguCj4gQXMgbG9u
ZyBhcyB3ZSBrZWVwIGRybVAuaCBhcm91bmQgbmV3IHVzZXJzIHdpbGwgc25lYWsgaW4uCgpUaGll
cnJ5IHJldmlld2VkIGFsbCBwYXRjaGVzIC0gdGhhbmtzIQoKQXBwbGllZCB0byBkcm0tbWlzYy1u
ZXh0IGFuZCBwdXNoZWQgb3V0LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
