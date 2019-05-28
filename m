Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B92C680
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 14:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8372089C0A;
	Tue, 28 May 2019 12:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C5089C0A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 12:30:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0B87D85;
 Tue, 28 May 2019 14:30:46 +0200 (CEST)
Date: Tue, 28 May 2019 15:30:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 04/10] dt-bindings: display: renesas: lvds: Add
 renesas,companion property
Message-ID: <20190528123026.GB5916@pendragon.ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528092847.kxhhq7hevforddb6@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528092847.kxhhq7hevforddb6@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559046647;
 bh=caHy49s0LS560k5n2Npm3GA1sKEg331DmzayTd0pV+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5huZLjIufS0/nMuSSe2H7sPr6XtV5m+CfjGdWMNyK7pdfj3d5WrL8n1aOfD7b7pD
 ryXyVBot89QGedra0WtjBaZYsgG4jekc1Sw+QBkh9UAYLs3tUsJqewH3pNCZYktBDk
 FdibpCvuvDvOBHcClOc5YpOXk0FtisfbRKx8+hl4=
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTE6Mjg6NDdBTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIFN1biwgTWF5IDEyLCAyMDE5IGF0IDEyOjA2OjU2QU0gKzAz
MDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBBZGQgYSBuZXcgb3B0aW9uYWwgcmVuZXNh
cyxjb21wYW5pb24gcHJvcGVydHkgdG8gcG9pbnQgdG8gdGhlIGNvbXBhbmlvbgo+ID4gTFZEUyBl
bmNvZGVyLiBUaGlzIGlzIHVzZWQgdG8gc3VwcG9ydCBkdWFsLWxpbmsgb3BlcmF0aW9uIHdoZXJl
IHRoZSBtYWluCj4gPiBMVkRTIGVuY29kZXIgc3BsaXRzIGV2ZW4tbnVtYmVyZWQgYW5kIG9kZC1u
dW1iZXJlZCBwaXhlbHMgYmV0d2VlbiB0aGUKPiA+IHR3byBMVkRTIGVuY29kZXJzLgo+ID4KPiA+
IFRoZSBuZXcgcHJvcGVydHkgZG9lc24ndCBjb250cm9sIHRoZSBtb2RlIG9mIG9wZXJhdGlvbiwg
aXQgb25seQo+ID4gZGVzY3JpYmVzIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiB0aGUgbWFzdGVy
IGFuZCBjb21wYW5pb24gTFZEUwo+ID4gZW5jb2RlcnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5j
b20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPgo+ID4gLSBGaXhlZCB0eXBvCj4g
PiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2Fz
LGx2ZHMudHh0ICAgICB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0Cj4gPiBpbmRleCA5
MDBhODg0YWQ5ZjUuLmYyY2MwMWQ1NGNiZCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0Cj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVu
ZXNhcyxsdmRzLnR4dAo+ID4gQEAgLTQ1LDYgKzQ1LDEyIEBAIE9GIGdyYXBoIGJpbmRpbmdzIHNw
ZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0Lgo+
ID4KPiA+ICBFYWNoIHBvcnQgc2hhbGwgaGF2ZSBhIHNpbmdsZSBlbmRwb2ludC4KPiA+Cj4gPiAr
T3B0aW9uYWwgcHJvcGVydGllczoKPiA+ICsKPiA+ICstIHJlbmVzYXMsY29tcGFuaW9uIDogcGhh
bmRsZSB0byB0aGUgY29tcGFuaW9uIExWRFMgZW5jb2Rlci4gVGhpcyBwcm9wZXJ0eSBpcwo+ID4g
KyAgdmFsaWQgZm9yIHRoZSBmaXJzdCBMVkRTIGVuY29kZXIgb24gRDMgYW5kIEUzIFNvQ3Mgb25s
eSwgYW5kIHBvaW50cyB0byB0aGUKPiA+ICsgIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMg
YSBjb21wYW5pb24gaW4gZHVhbC1saW5rIG1vZGUuCj4gPiArCj4gCj4gSWYgSSBnb3QgdGhpcyBy
aWdodCwgdGhlIHByb3BlcnR5IGRvZXMgbm90IGVuYWJsZSBkdWFsLWxpbmsKPiBvcGVyYXRpb25z
IGJ5IGl0c2VsZiwgYnV0IGl0IG5lZWRzIHRoZSBuZXh0IGJyaWRnZSB0byBiZSBvcGVyYXRpbmcg
aW4KPiBkdWFsIGxpbmsgbW9kZSAoaWUuIGhhcyBib3RoIExWRFMwIGFuZCBMVkRTMSBvdXRwdXQg
Y29ubmVjdGVkIHRvIGl0cwo+IGlucHV0IHBvcnRzKS4KCkNvcnJlY3QuCgo+IElzIGl0IHdvcnRo
IGRlc2NyaWJpbmcgaXQgaGVyZSAob3IgYXQgbGVhc3QgY2xhcmlmeSB0aGUgdGhlIHByb3BlcnR5
Cj4gYWxvbmUgZG9lcyBub3QgZW5hYmxlIGR1YWwgbGluayBvcGVyYXRpb25zKS4KCkhvdyBhYm91
dCB0aGUgZm9sbG93aW5nID8KCi0gcmVuZXNhcyxjb21wYW5pb24gOiBwaGFuZGxlIHRvIHRoZSBj
b21wYW5pb24gTFZEUyBlbmNvZGVyLiBUaGlzIHByb3BlcnR5IGlzCiAgbWFuZGF0b3J5IGZvciB0
aGUgZmlyc3QgTFZEUyBlbmNvZGVyIG9uIEQzIGFuZCBFMyBTb0NzLCBhbmQgc2hhbGwgcG9pbnQg
dG8gCiAgdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMgYSBjb21wYW5pb24gaW4gZHVh
bC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdCAKICBiZSBzZXQgZm9yIGFueSBvdGhlciBMVkRTIGVu
Y29kZXIuCgo+IEFwYXJ0IGZyb20gdGhhdAo+IFJldmlld2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGph
Y29wbytyZW5lc2FzQGptb25kaS5vcmc+CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
