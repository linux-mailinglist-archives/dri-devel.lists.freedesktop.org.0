Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4F866A4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 18:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94B56E894;
	Thu,  8 Aug 2019 16:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1B76E895
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 16:07:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5E4ECC;
 Thu,  8 Aug 2019 18:07:28 +0200 (CEST)
Date: Thu, 8 Aug 2019 19:07:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: drm_panel_get_modes() should take the connector as an argument
 [Was: drm/bridge: panel: Implement bridge ...]
Message-ID: <20190808160726.GU6055@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-9-laurent.pinchart@ideasonboard.com>
 <20190716110827.GA27797@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716110827.GA27797@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565280449;
 bh=FCQ8IHNguaw+CWFFcHdQBIMd9h7ZDOX/3n7SVUTbQvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=anV4oSbDlj3hXhI/7EnMu6ZFrWK1S5MyOtwdh2SG5Hn+LNVXJhuaMXatVZWd7FpvI
 DdJO9n6HrRwqF3lKaonDWj5C1NwSgnggEfyvgcJwHlPTxVu7a4d4aDeRdN1TPmfmzw
 +YDacQRjDFH1XgAfOl1yHtriLxHV8svEWdSRGWY0=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDE6MDg6MjdQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQgZXQgYWxsLgo+IAo+ID4gK3N0YXRpYyBpbnQgcGFu
ZWxfYnJpZGdlX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gKwkJCQkg
IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gPiArewo+ID4gKwlzdHJ1Y3QgcGFu
ZWxfYnJpZGdlICpwYW5lbF9icmlkZ2UgPSBkcm1fYnJpZGdlX3RvX3BhbmVsX2JyaWRnZShicmlk
Z2UpOwo+ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiBGSVhNRTogZHJtX3BhbmVsX2dldF9tb2Rlcygp
IHNob3VsZCB0YWtlIHRoZSBjb25uZWN0b3IgYXMgYW4KPiA+ICsJICogYXJndW1lbnQuCj4gPiAr
CSAqLwo+ID4gKwlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2RlcyhwYW5lbF9icmlkZ2UtPnBhbmVs
KTsKPiA+ICt9Cj4gCj4gSSB0b29rIGEgbG9vayBhdCB0aGlzIC0gaXQgc2VlbXMgc2ltcGxlOgo+
IC0gVXBkYXRlIGRybV9wYW5lbC5nZXRfbW9kZXMoKSB0byB0YWtlIGNvbnRyb2xsZXIgYXMgYXJn
dW1lbnQsIGFuZCBmaXgKCkkgYXNzdW1lIHlvdSBtZWFudCBjb25uZWN0b3IsIG5vdCBjb250cm9s
bGVyLgoKPiAgIGFsbCBjYWxsZXJzLiBBbGwgY2FsbGVycyBhbHJlYWR5IGhhdmUgY29ubmVjdG9y
IGF2YWlsYWJsZS4KPiAtIERyb3AgZHJtX3BhbmVsX2F0dGFjaCgpLCBkcm1fcGFuZWxfZGV0YWNo
KCkgYW5kIHVwZGF0ZSBhbGwgY2FsbGVycy4KPiAgIEluIHJlYWxpdHkganVzdCBkcm9wIGFsbCBj
b2RlIGFyb3VuZCBhdHRhY2goKSwgZGV0YWNoKCkuCj4gICBkcm1fcGFuZWxfYXR0YWNoKCksIGRy
bV9wYW5lbF9kZXRhY2goKSB3aWxsIGJlIG5vb3BzIHdoZW4gdGhlCj4gICBjb25uZWN0b3Igc3Rv
cmVkIGluIGRybV9wYW5lbCBpcyBubyBsb25nZXIgdXNlZC4KPiAKPiBUaGUgc2VtYW50aWMgZGlm
ZmVyZW5jZSBpcyB0aGF0IHdlIHN1cHBseSB0aGUgY29ubmVjdG9yIHdoZW4gd2UgY2FsbAo+IGRy
bV9wYW5lbF9nZXRfbW9kZXMoKSBhbmQgbm90IGF0IHBhbmVsIGNyZWF0aW9uIHRpbWUgd2l0aCBh
biBkcm1fcGFuZWxfYXR0YWNoKCkuCj4gCj4gU28gaXQgc2hvdWxkIGJlIGRvYWJsZSB3aXRob3V0
IGFueSBtaWdyYXRpb24gZnJvbSBvbmUgd29ybGQgdG8gdGhlIG90aGVyLgo+IAo+IElmIHNvbWVv
bmUgY2FuIHNheSAieWVzIGl0IHNob3VsZCBiZSB0aGF0IHNpbXBsZSIsIHRoZW4gSSB3aWxsCj4g
Z2l2ZSBpdCBhIHNwaW4uCgpMb29raW5nIGZvcndhcmQgdG8gdGhhdCA6LSkKCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
