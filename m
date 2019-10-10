Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAFED2A5E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7A06EA33;
	Thu, 10 Oct 2019 13:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69F6EA33
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:07:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 06:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="193203563"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 10 Oct 2019 06:07:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2019 16:07:26 +0300
Date: Thu, 10 Oct 2019 16:07:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/plane: Clarify our expectations for src/dst rectangles
Message-ID: <20191010130726.GF1208@intel.com>
References: <20191010112918.15724-1-maarten.lankhorst@linux.intel.com>
 <20191010123624.GD1208@intel.com>
 <8c14f6fc-d6d6-9bad-9fe7-cab119e2fec2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c14f6fc-d6d6-9bad-9fe7-cab119e2fec2@linux.intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDI6NDY6MjZQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMTAtMTAtMjAxOSBvbSAxNDozNiBzY2hyZWVmIFZpbGxlIFN5cmrDpGzD
pDoKPiA+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDAxOjI5OjE3UE0gKzAyMDAsIE1hYXJ0ZW4g
TGFua2hvcnN0IHdyb3RlOgo+ID4+IFRoZSByZWN0YW5nbGVzIGFyZSB1c3VhbGx5IGNsaXBwZWQs
IGJ1dCBpdCBjYW4gYmUgdXNlZnVsIHRvIGhhdmUKPiA+PiB0aGVtIHVuY2xpcHBlZCwgZm9yIGV4
YW1wbGUgZm9yIGN1cnNvciBwbGFuZXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4+IC0tLQo+
ID4+ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0K
PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggYi9pbmNsdWRlL2Ry
bS9kcm1fcGxhbmUuaAo+ID4+IGluZGV4IGNkNTkwM2FkMzNmNy4uOTRiYmJmMjE1MTAwIDEwMDY0
NAo+ID4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCj4gPj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX3BsYW5lLmgKPiA+PiBAQCAtMTgzLDggKzE4MywyNiBAQCBzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlIHsKPiA+PiAgCSAqLwo+ID4+ICAJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpmYl9k
YW1hZ2VfY2xpcHM7Cj4gPj4gIAo+ID4+IC0JLyoqIEBzcmM6IGNsaXBwZWQgc291cmNlIGNvb3Jk
aW5hdGVzIG9mIHRoZSBwbGFuZSAoaW4gMTYuMTYpICovCj4gPj4gLQkvKiogQGRzdDogY2xpcHBl
ZCBkZXN0aW5hdGlvbiBjb29yZGluYXRlcyBvZiB0aGUgcGxhbmUgKi8KPiA+PiArCS8qKgo+ID4+
ICsJICogQHNyYzoKPiA+PiArCSAqCj4gPj4gKwkgKiBzb3VyY2UgY29vcmRpbmF0ZXMgb2YgdGhl
IHBsYW5lIChpbiAxNi4xNikuCj4gPj4gKwkgKgo+ID4+ICsJICogV2hlbiB1c2luZyBkcm1fYXRv
bWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpLAo+ID4+ICsJICogdGhlIGNvb3JkaW5hdGVz
IGFyZSBjbGlwcGVkLCBidXQgdGhlIGRyaXZlciBtYXkgY2hvb3NlCj4gPj4gKwkgKiB0byB1c2Ug
dW5jbGlwcGVkIGNvb3JkaW5hdGVzIGluc3RlYWQuCj4gPj4gKwkgKgo+ID4+ICsJICogVGhpcyBj
YW4gYmUgdXNlZnVsIHdoZW4gdXNpbmcgYSBoYXJkY29kZWQgc2l6ZSBpbiBhIGN1cnNvciBwbGFu
ZS4KPiA+IEkgd291bGQgaW5zdGVhZCBzYXkgc29tZXRoaW5nIGxpa2UgIndoZW4gdGhlIGhhcmR3
YXJlIHBlcmZvcm1zCj4gPiB0aGUgY2xpcHBpbmcgYXV0b21hZ2ljYWxseSIuCj4gCj4gCj4gV2l0
aCB0aGF0IGZpeGVkLCByLWI/CgpBeWUKClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
