Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4936FD8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66922893C0;
	Thu,  6 Jun 2019 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D79893C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:30:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B7D1580522;
 Thu,  6 Jun 2019 11:30:00 +0200 (CEST)
Date: Thu, 6 Jun 2019 11:29:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190606092959.GB17442@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
 <20190528165052.GB17874@pendragon.ideasonboard.com>
 <20190528170242.GB10262@ravnborg.org>
 <20190606075750.GE4931@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606075750.GE4931@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=gi-eZXJGFL57LBb4nr0A:9 a=CjuIK1q_8ugA:10
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gPiA+IEdlbjMgaXMgdGhlIG5ld2VzdCBnZW5lcmF0aW9uIDotKSBXZSB0
aHVzIHVzZSA+PSB0aHJvdWdoIHRoZSBEVSBhbmQgTFZEUwo+ID4gPiBkcml2ZXJzIHRvIHByZXBh
cmUgZm9yIHN1cHBvcnQgb2YgR2VuNCwganVzdCBpbiBjYXNlLgo+ID4KPiA+IE9LLCBidXQgSSBn
dWVzcyB3ZSBhZ3JlZSB0aGF0IHRoZSBjb21tZW50IG5lZWRzIGEgc21hbGwgdXBkYXRlIHRoZW0u
Cj4gPiAKPiA+IEFjdHVhbGx5IEkgaW1wbGljaXRseSByZWFkcyB0aGF0IGl0IGlzIG9ubHkgZnJv
bSBHZW4zIG9ud2FyZHMgdGhhdCB0aGUKPiA+IExWRFMxIGVuY29kZXIgY2FuIGJlIHVzZWQgYXMg
YSBjb21wYW5pb24uCj4gPiBNeSBpbml0aWFsIHVuZGVyc3RhbmRpbmcgcmVhZGluZyB0aGUgY29t
bWVudCB3YXMgdGhhdCB0aGlzIGltcGxtZW50ZWQgYQo+ID4gd29ya2Fyb3VuZCBmb3IgR2VuMyAt
IGJ1dCBpdCBpcyBhIHdvcmthcm91bmYgZm9yIG1pc3NpbmcgZmVhdHVyZXMgaW4KPiA+IG9sZGVy
IHRoYW4gR2VuMy4KPiAKPiBJIHdvdWxkbid0IHNheSB3b3JrYXJvdW5kLCBpdCBqdXN0IG1ha2Vz
IHN1cmUgdGhhdCB3ZSBkb24ndCB0cnkgdG8KPiBzdXBwb3J0IExWRFMgZHVhbC1tb2RlIG9uIG9s
ZGVyIFNvQ3MgYXMgdGhlIGZlYXR1cmUgd2FzIGFkZGVkIGluIEdlbjMKPiBoYXJkd2FyZS4KPiAK
PiA+IFNvLCBhc3N1bWluZyB0aGlzIGlzIGNvcnJlY3QsIHdoZW4gdHJ5aW5nIHRvIHNwZWNpZnkg
YSBjb21wYW5pb24gb24KPiA+IG9sZGVyIHRoZW4gR2VuMyBzaG91bGQgcmVzdWx0IGluIHNvbWUg
a2luZCBvZiBlcnJvci93YXJuaW5nPwo+ID4gKE1heWJlIGl0IGRvZXMpLgo+IAo+IFRoZSBwcm9w
ZXJ0eSBpcyBpZ25vcmVkIGluIHRoYXQgY2FzZS4gSSBjb3VsZCBhZGQgYW4gZXJyb3IgbWVzc2Fn
ZSwgYnV0Cj4gSSdtIG5vdCBzdXJlIEkgc2hvdWxkLCBhcyB3ZSBkb24ndCB1c3VhbGx5IGNoZWNr
IHRoYXQgRFQgbm9kZXMgZG9uJ3QKPiBjb250YWluIGFueSBvdGhlciBwcm9wZXJ0eSB0aGFuIHRo
ZSBvbmVzIHNwZWNpZmllZCBpbiB0aGUgRFQgYmluZGluZ3MKPiAoYW4gYXV0b21hdGljIERUIHJ1
bnRpbWUgdmFsaWRhdG9yIGJhc2VkIG9uIHRoZSBZQU1MIGJpbmRpbmdzIGNvdWxkIGJlCj4gaW50
ZXJlc3RpbmcgOy0pKS4KQWdhaW4sIHRoYW5rcyBmb3IgdGFraW5nIHlvdXIgdGltZS4KVGhpcyBj
bGFyaWZpZXMgaXQgbmljZWx5LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
