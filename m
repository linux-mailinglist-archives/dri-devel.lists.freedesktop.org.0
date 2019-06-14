Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D212463DE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DD689B01;
	Fri, 14 Jun 2019 16:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCDB89AFF;
 Fri, 14 Jun 2019 16:19:35 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 09:19:34 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 14 Jun 2019 09:19:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Jun 2019 19:19:30 +0300
Date: Fri, 14 Jun 2019 19:19:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/dp: Add DP_DPCD_QUIRK_NO_SINK_COUNT
Message-ID: <20190614161930.GB5942@intel.com>
References: <20190528140650.19230-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528140650.19230-1-ville.syrjala@linux.intel.com>
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
Cc: "David S ." <david@majinbuu.com>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDU6MDY6NDlQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IENINzUxMSBlRFAtPkxWRFMgYnJpZGdlIGRvZXNuJ3Qgc2VlbSB0byBzZXQgU0lO
S19DT1VOVCBwcm9wZXJseQo+IGNhdXNpbmcgaTkxNSB0byBkZXRlY3QgaXQgYXMgZGlzY29ubmVj
dGVkLiBBZGQgYSBxdWlyayB0byBpZ25vcmUKPiBTSU5LX0NPVU5UIG9uIHRoZXNlIGRldmljZXMu
Cj4gCj4gQ2M6IERhdmlkIFMuIDxkYXZpZEBtYWppbmJ1dS5jb20+Cj4gQ2M6IFBldGVyaXMgUnVk
enVzaWtzIDxwZXRlcmlzLnJ1ZHp1c2lrc0BnbWFpbC5jb20+Cj4gVGVzdGVkLWJ5OiBQZXRlcmlz
IFJ1ZHp1c2lrcyA8cGV0ZXJpcy5ydWR6dXNpa3NAZ21haWwuY29tPgo+IEJ1Z3ppbGxhOiBodHRw
czovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDU0MDYKPiBTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoK
UHVzaGVkIHBhdGNoIDEgdG8gZHJtLW1pc2MtbmV4dCB3aXRoIEphbmkncyBpcmMgYWNrLgoKSSB0
aG91Z2h0IG9mIHB1c2hpbmcgdGhlIGk5MTUgcGF0Y2ggZHJtLW1pc2MtbmV4dCB0b28sIGJ1dCB0
aGVuCnRob3VnaHQgYmV0dGVyIG9mIGl0IGR1ZSB0byB0aGUgY3VycmVudCBpOTE1IGNvZGUgY2h1
cm4uIEknbGwKanVzdCB3YWl0IGZvciBhIGJhY2ttZXJnZSBpbnN0ZWFkLgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDQgKysrLQo+ICBpbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmggICAgIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IGluZGV4
IGU2YWY3NThhN2QyMi4uMGI5OTRkMDgzYTg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
Cj4gQEAgLTEyODAsNyArMTI4MCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHBjZF9xdWlyayBk
cGNkX3F1aXJrX2xpc3RbXSA9IHsKPiAgCS8qIExHIExQMTQwV0Y2LVNQTTEgZURQIHBhbmVsICov
Cj4gIAl7IE9VSSgweDAwLCAweDIyLCAweGI5KSwgREVWSUNFX0lEKCdzJywgJ2knLCAndicsICdh
JywgJ3InLCAnVCcpLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfQ09OU1RBTlRfTikgfSwKPiAg
CS8qIEFwcGxlIHBhbmVscyBuZWVkIHNvbWUgYWRkaXRpb25hbCBoYW5kbGluZyB0byBzdXBwb3J0
IFBTUiAqLwo+IC0JeyBPVUkoMHgwMCwgMHgxMCwgMHhmYSksIERFVklDRV9JRF9BTlksIGZhbHNl
LCBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0KPiArCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEp
LCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LAo+ICsJ
LyogQ0g3NTExIHNlZW1zIHRvIGxlYXZlIFNJTktfQ09VTlQgemVyb2VkICovCj4gKwl7IE9VSSgw
eDAwLCAweDAwLCAweDAwKSwgREVWSUNFX0lEKCdDJywgJ0gnLCAnNycsICc1JywgJzEnLCAnMScp
LCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fU0lOS19DT1VOVCkgfSwKPiAgfTsKPiAgCj4g
ICN1bmRlZiBPVUkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggM2ZjNTM0ZWU4MTc0Li43ZTUyZWI4
MTI4NGEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gQEAgLTE0MTQsNiArMTQxNCwxMyBAQCBlbnVt
IGRybV9kcF9xdWlyayB7Cj4gIAkgKiBkcml2ZXIgc3RpbGwgbmVlZCB0byBpbXBsZW1lbnQgcHJv
cGVyIGhhbmRsaW5nIGZvciBzdWNoIGRldmljZS4KPiAgCSAqLwo+ICAJRFBfRFBDRF9RVUlSS19O
T19QU1IsCj4gKwkvKioKPiArCSAqIEBEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQ6Cj4gKwkg
Kgo+ICsJICogVGhlIGRldmljZSBkb2VzIG5vdCBzZXQgU0lOS19DT1VOVCB0byBhIG5vbi16ZXJv
IHZhbHVlLgo+ICsJICogVGhlIGRyaXZlciBzaG91bGQgaWdub3JlIFNJTktfQ09VTlQgZHVyaW5n
IGRldGVjdGlvbi4KPiArCSAqLwo+ICsJRFBfRFBDRF9RVUlSS19OT19TSU5LX0NPVU5ULAo+ICB9
Owo+ICAKPiAgLyoqCj4gLS0gCj4gMi4yMS4wCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
