Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2A64A48
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024F36E0ED;
	Wed, 10 Jul 2019 15:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CFD6E0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:59:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 08:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,475,1557212400"; d="scan'208";a="159801507"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 10 Jul 2019 08:59:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 18:59:04 +0300
Date: Wed, 10 Jul 2019 18:59:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/60] drm/edid: Add flag to drm_display_info to identify
 HDMI sinks
Message-ID: <20190710155904.GH5942@intel.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707180852.5512-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190707180852.5512-2-laurent.pinchart@ideasonboard.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMDcsIDIwMTkgYXQgMDk6MDc6NTNQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBUaGUgZHJtX2Rpc3BsYXlfaW5mbyBzdHJ1Y3R1cmUgY29udGFpbnMgbWFueSBm
aWVsZHMgcmVsYXRlZCB0byBIRE1JCj4gc2lua3MsIGJ1dCBub25lIHRoYXQgaWRlbnRpZmllcyBp
ZiBhIHNpbmsgY29tcGxpYW50IHdpdGggQ0VBLTg2MSAoRURJRCkKPiBzaGFsbCBiZSB0cmVhdGVk
IGFzIGFuIEhETUkgc2luayBvciBhIERWSSBzaW5rLiBBZGQgc3VjaCBhIGZsYWcsIGFuZAo+IHBv
cHVsYXRlIGl0IGFjY29yZGluZyB0byBzZWN0aW9uIDguMy4zICgiRFZJL0hETUkgRGV2aWNlCj4g
RGlzY3JpbWluYXRpb24iKSBvZiB0aGUgSERNSSB2MS4zIHNwZWNpZmljYXRpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyAgfCAzICsrKwo+ICBp
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA1ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCA4MmE0Y2VlZDNmY2YuLmQy
ZTdhNTMzNGMzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTQ1NTksNiArNDU1OSw4IEBAIGRy
bV9wYXJzZV9oZG1pX3ZzZGJfdmlkZW8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwg
Y29uc3QgdTggKmRiKQo+ICAJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8gPSAmY29ubmVj
dG9yLT5kaXNwbGF5X2luZm87Cj4gIAl1OCBsZW4gPSBjZWFfZGJfcGF5bG9hZF9sZW4oZGIpOwo+
ICAKPiArCWluZm8tPmlzX2hkbWkgPSB0cnVlOwo+ICsKCkFsbW9zdCBtaXNzZWQgdGhpcyBvbmUg
c2luY2UgaXQgd2FzIGhpZGRlbiBpbnNpZGUgYSByYXRoZXIgYmlnIHNlcmllcy4KCkkgd2FzIHBv
bmRlcmluZyBpZiB3ZSBzaG91bGQgc2V0IHRoaXMgaW4gZHJtX3BhcnNlX2hkbWlfZm9ydW1fdnNk
YigpCnRvbywgYnV0IGxvb2tzIGxpa2UgdGhlIHNwZWMgc2F5cyB3ZSBkb24ndCBoYXZlIHRvOgoi
QW4gSDE0YiBWU0RCIHNoYWxsIGFsd2F5cyBiZSBpbmNsdWRlZCwgcmVnYXJkbGVzcyBvZiB0aGUg
aW5jbHVzaW9uIG9mCiBhbiBIRi1WU0RCLCB0byBlbnN1cmUgY29ycmVjdCBmdW5jdGlvbmluZyBv
ZiBEVkkvSERNSSBkaXNjcmltaW5hdGlvbi4uLiIKCkFsc28gd2UgZG9uJ3QgY2hlY2sgZm9yIHRo
ZSBIRi1WU0RCIGluIGRybV9kZXRlY3RfaGRtaV9tb25pdG9yKCkgZWl0aGVyLgpVbmZvcnR1bmF0
ZWx5IHdlIGNhbid0IHNpbXBseSByZXBsYWNlIGRybV9kZXRlY3RfaGRtaV9tb25pdG9yKCkgaW4K
aTkxNSB3aXRoIGEgY2hlY2sgZm9yIHRoaXMgZmxhZyBiZWNhdXNlIHdlIHBvcHVsYXRlIGRpc3Bs
YXlfaW5mbyB3YXkKdG9vIGxhdGUuCgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gIAlpZiAobGVuID49IDYpCj4gIAkJaW5mby0+
ZHZpX2R1YWwgPSBkYls2XSAmIDE7Cj4gIAlpZiAobGVuID49IDcpCj4gQEAgLTQ2MjcsNiArNDYy
OSw3IEBAIGRybV9yZXNldF9kaXNwbGF5X2luZm8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKPiAgCWluZm8tPmNlYV9yZXYgPSAwOwo+ICAJaW5mby0+bWF4X3RtZHNfY2xvY2sgPSAw
Owo+ICAJaW5mby0+ZHZpX2R1YWwgPSBmYWxzZTsKPiArCWluZm8tPmlzX2hkbWkgPSBmYWxzZTsK
PiAgCWluZm8tPmhhc19oZG1pX2luZm9mcmFtZSA9IGZhbHNlOwo+ICAJaW5mby0+cmdiX3F1YW50
X3JhbmdlX3NlbGVjdGFibGUgPSBmYWxzZTsKPiAgCW1lbXNldCgmaW5mby0+aGRtaSwgMCwgc2l6
ZW9mKGluZm8tPmhkbWkpKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rv
ci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gaW5kZXggY2E3NDVkOWZlYWY1Li5l
ODBjYTBkMTQ5ZTUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gQEAgLTQyNiw2ICs0MjYsMTEgQEAg
c3RydWN0IGRybV9kaXNwbGF5X2luZm8gewo+ICAJICovCj4gIAlib29sIGR2aV9kdWFsOwo+ICAK
PiArCS8qKgo+ICsJICogQGlzX2hkbWk6IFRydWUgaWYgdGhlIHNpbmsgaXMgYW4gSERNSSBkZXZp
Y2UuCj4gKwkgKi8KPiArCWJvb2wgaXNfaGRtaTsKPiArCj4gIAkvKioKPiAgCSAqIEBoYXNfaGRt
aV9pbmZvZnJhbWU6IERvZXMgdGhlIHNpbmsgc3VwcG9ydCB0aGUgSERNSSBpbmZvZnJhbWU/Cj4g
IAkgKi8KPiAtLSAKPiBSZWdhcmRzLAo+IAo+IExhdXJlbnQgUGluY2hhcnQKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
