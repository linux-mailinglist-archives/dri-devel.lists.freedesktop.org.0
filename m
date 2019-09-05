Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F4AA4B0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322E76E0CE;
	Thu,  5 Sep 2019 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47086E0CE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:39:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98B5526D;
 Thu,  5 Sep 2019 15:39:11 +0200 (CEST)
Date: Thu, 5 Sep 2019 16:39:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Message-ID: <20190905133905.GN5035@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
 <20190827002422.GQ5031@pendragon.ideasonboard.com>
 <20190827145619.33s7gkv7tgtsr6nz@uno.localdomain>
 <20190827163423.GB5054@pendragon.ideasonboard.com>
 <20190905095757.gg6s5pse5tvivxbs@uno.localdomain>
 <20190905111712.GG5035@pendragon.ideasonboard.com>
 <20190905131453.7ortosddn4afxd5j@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905131453.7ortosddn4afxd5j@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567690751;
 bh=b3KOuttUiB2EelRovaVecGiYFMN3AldXDLjxRMlXjhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwhgx2pxxHSjX7GaaFLi+jq16LH1ajMUk+bPprjKFjMCRXI85GuGACbKvWQcCTmx9
 +Gv5Xwnf60GMV4XjfcDcY9KRpH7dHhWEswVZFb3ZBdrzqk5dkJl2aay4DQU2Z0RChH
 9U0Q8tx9RIT61cB9EAinoS2G2+LWnyneEecbsIU8=
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDM6MTQ6NTNQTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDAyOjE3OjEyUE0gKzAz
MDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBIaSBKYWNvcG8sCj4gPgo+ID4+Pj4+PiAr
LyoqCj4gPj4+Pj4+ICsgKiByY2FyX2NtbV9lbmFibGUoKSAtIGVuYWJsZSB0aGUgQ01NIHVuaXQK
PiA+Pj4+Pj4gKyAqCj4gPj4+Pj4+ICsgKiBAcGRldjogVGhlIHBsYXRmb3JtIGRldmljZSBhc3Nv
Y2lhdGVkIHdpdGggdGhlIENNTSBpbnN0YW5jZQo+ID4+Pj4+PiArICoKPiA+Pj4+Pj4gKyAqIEVu
YWJsZSB0aGUgQ01NIHVuaXQgYnkgZW5hYmxpbmcgdGhlIHBhcmVudCBjbG9jayBhbmQgZW5hYmxp
bmcgdGhlIENNTQo+ID4+Pj4+PiArICogY29tcG9uZW50cywgc3VjaCBhcyAxLUQgTFVULCBpZiBy
ZXF1ZXN0ZWQuCj4gPj4+Pj4+ICsgKi8KPiA+Pj4+Pj4gK2ludCByY2FyX2NtbV9lbmFibGUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+Pj4+Pj4gK3sKPiA+Pj4+Pj4gKwlzdHJ1Y3Qg
cmNhcl9jbW0gKnJjbW0gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiA+Pj4+Pj4gKwlp
bnQgcmV0Owo+ID4+Pj4+PiArCj4gPj4+Pj4+ICsJaWYgKCFyY21tKQo+ID4+Pj4+PiArCQlyZXR1
cm4gLUVQUk9CRV9ERUZFUjsKPiA+Pj4+Pgo+ID4+Pj4+IFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVk
IGluIHJjYXJfZHVfY3J0Y19hdG9taWNfZW5hYmxlKCksIHNvIHRoYXQncyBub3QKPiA+Pj4+PiB0
aGUgcmlnaHQgZXJyb3IgY29kZS4gSXQgc2VlbXMgd2UgbmVlZCBhbm90aGVyIGZ1bmN0aW9uIGZv
ciB0aGUgQ01NIEFQSQo+ID4+Pj4+IHRvIGRlZmVyIHByb2JpbmcgOi0vIEkgd291bGQgY2FsbCBp
dCByY2FyX2NtbV9pbml0KCkuIFRoaXMgY2hlY2sgd291bGQKPiA+Pj4+PiB0aGVuIGJlIHJlbW92
ZWQuCj4gPj4+Pgo+ID4+Pj4gSSBhZ3JlZSBhYm91dCB0aGUgcmV0dXJuIGNvZGUsIGJ1dCBub3Qg
dGhlIG5hbWUsIGFzIHRoaXMgZnVuY3Rpb24KPiA+Pj4+IGFjdHVhbGx5IGVuYWJsZXMgdGhlIENN
TS4KPiA+Pj4KPiA+Pj4gSSBtZWFudCBjcmVhdGluZyBhIG5ldyByY2FyX2NtbV9pbml0KCkgZnVu
Y3Rpb24gdGhhdCB3b3VsZCBqdXN0IGhhdmUgdGhlCj4gPj4+ICFyY21tIGNoZWNrLgo+ID4+Pgo+
ID4+Pj4gUFJPQkVfREVGRVIgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UgaGVyZSwgSQo+ID4+Pj4g
d29uZGVyIHdoZXJlIGl0IGNvbWUgZnJvbSwgYXMgdGhlIHByb2Jpbmcgb2YgQ01NIGFuZCBEVSBo
YXMgbG9uZwo+ID4+Pj4gaGFwcGVuZWQgb25jZSB3ZSBnZXQgaGVyZSAoYXQgbGVhc3QsIEkgYXNz
dW1lIHNvLCBpZiB3ZSByZWNlaXZlIGEKPiA+Pj4+IGdhbW1hX3RhYmxlLCB1c2Vyc3BhY2UgaGFz
IGFscmVhZHkgYmVlbiBydW5uaW5nLCBhbmQgYm90aCBEVSBhbmQgQ01NCj4gPj4+PiBzaG91bGQg
aGF2ZSBwcm9iZWQuIE90aGVyd2lzZSwgd2UgY2FuIGV4cGxvaXQgdGhlIG5ld2x5IGNyZWF0ZWQg
ZGV2aWNlCj4gPj4+PiBsaW5rLCBhbmQgbWFrZSBzdXJlIERVIHByb2JlcyBhZnRlciB0aGUgQ01N
KS4KPiA+Pj4+Cj4gPj4+PiBJIHdvdWxkIGp1c3QgY2hhbmdlIHRoZSByZXR1cm4gdmFsdWUgaGVy
ZSwgYW5kIHBvc3NpYmx5IHVzZSB0aGUgZGV2aWNlCj4gPj4+PiBsaW5rIHRvIGVuc3VyZSB0aGUg
Y29ycmVjdCBwcm9iaW5nIHNlcXVlbmNlLgo+ID4+Pgo+ID4+PiBIb3cgZG9lcyBkZXZpY2UgbGlu
ayBoZWxwIGhlcmUgPwo+ID4+Cj4gPj4gQ3VycmVudGx5IGl0IGRvZXNuJ3QsIGFzIHdlIGFyZSBj
cmVhdGluZyBhIHN0YXRlbGVzcyBsaW5rLgo+ID4+Cj4gPj4gQnV0IGlmIHdlIGdvIGZvciBhIG1h
bmFnZWQgZGV2aWNlIGxpbmsgKHdoaWNoIGlzIHRoZSBkZWZhdWx0LCBieSB0aGUKPiA+PiB3YXks
IHlvdSBoYXZlIHRvIG9wdC1vdXQgZnJvbSBpdCkgd2UgY2FuIGd1YXJhbnRlZSB0aGUgQ01NIGhh
cyBwcm9iZWQKPiA+PiBiZWZvcmUgdGhlIERVIHByb2Jlcywgc28gdGhhdCB3ZSBoYXZlIGEgZ3Vh
cmFudGVlIHdoZW4gd2UgZ2V0IGhlcmUKPiA+PiAhcmNtbSBjYW5ub3QgaGFwcGVuLgo+ID4+Cj4g
Pj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4yLXJjNy9kcml2ZXItYXBpL2Rl
dmljZV9saW5rLmh0bWwKPiA+PiAiVGhlIGNvbnN1bWVyIGRldmljZXMgYXJlIG5vdCBwcm9iZWQg
YmVmb3JlIHRoZSBzdXBwbGllciBpcyBib3VuZCB0byBhIGRyaXZlciwKPiA+PiAgYW5kIHRoZXni
gJlyZSB1bmJvdW5kIGJlZm9yZSB0aGUgc3VwcGxpZXIgaXMgdW5ib3VuZC4iCj4gPj4KPiA+PiBB
cyB3ZSBjcmVhdGUgdGhlIGxpbmssIHRoZSBDTU0gaXMgdGhlIHN1cHBsaWVyIG9mIERVLCBzbyB3
ZSBjb3VsZCBqdXN0Cj4gPj4gZHJvcCB0aGUgRExfRkxBR19TVEFURUxFU1MgZmxhZyBpbiBkZXZp
Y2VfbGlua19hZGQoKSBpbiAxMC8xNC4KPiA+Pgo+ID4+IERvZXMgdGhpcyBtYXRjaCB5b3VyIHVu
ZGVyc3RhbmRpbmcgPwo+ID4KPiA+IEV4Y2VwdCB0aGVyZSdzIGEgYml0IG9mIGEgY2hpY2tlbiBh
bmQgZWdnIGlzc3VlLCBhcyB5b3UgY2FsbAo+ID4gZGV2aWNlX2xpbmtfYWRkKCkgZnJvbSByY2Fy
X2R1X2NtbV9pbml0KCksIHdoaWNoIHRodXMgcmVxdWlyZSB0aGUgRFUKPiA+IGRyaXZlciB0byBw
cm9iZSBmaXJzdCA6LSkgRm9yIHRoaXMgdG8gd29yayB3ZSB3b3VsZCBwcm9iYWJseSBuZWVkIGFu
Cj4gPiBlYXJseSBpbml0Y2FsbCBpbiB0aGUgRFUgZHJpdmVyLgo+IAo+IFllcyBpbmRlZWQsIHRo
ZSBwb2ludCB3aGVyZSB0aGUgbGluayBpcyBjcmVhdGVkIGF0IHRoZSBtb21lbnQgaXMgdG9vCj4g
bGF0ZS4uLiBJcyBpdCB3b3J0aCBhbiBlYXJseSBpbml0Y2FsbCwgb3Igc2hvdWxkIHdlIGp1c3Qg
YXNzdW1lIHRoYXQKPiBhdCB0aGUgcG9pbnQgd2hlcmUgdGhlIExVVCBpcyBvcGVyYXRlZCB1c2Vy
c3BhY2UgaGFzIGFscmVhZHkgYmVlbgo+IHJ1bm5pbmcgYW5kIGJvdGggdGhlIENNTSBhbmQgdGhl
IERVIGhhdmUgcHJvYmVkIGFscmVhZHk/CgpXZSBzaG91bGQgYXQgbGVhc3QgZ3VhcmQgYWdhaW5z
dCBjcmFzaGVzLCB0aGF0J3Mgd2h5IEkndmUgcHJvcG9zZWQgYW4KaW5pdCBmdW5jdGlvbiBpbiB0
aGUgQ01NIGRyaXZlciBmb3IgdGhlIHNvbGUgcHVycG9zZSBvZiBtYWtpbmcgc3VyZSB0aGUKZGV2
aWNlIGhhcyBiZWVuIHByb2JlZCwgYW5kIGRlZmVycmluZyBwcm9iZSBvZiB0aGUgRFUuCgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
