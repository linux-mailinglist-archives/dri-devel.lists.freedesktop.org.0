Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F5E8BAA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 16:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2CE6E430;
	Tue, 29 Oct 2019 15:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130366E430;
 Tue, 29 Oct 2019 15:18:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 08:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="203593672"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 29 Oct 2019 08:18:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Oct 2019 17:18:07 +0200
Date: Tue, 29 Oct 2019 17:18:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp: Increase link status size
Message-ID: <20191029151807.GY1208@intel.com>
References: <20191029111006.358963-1-thierry.reding@gmail.com>
 <875zk7ad8m.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875zk7ad8m.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 coverity-bot <keescook+coverity-bot@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDM6MzI6NDFQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVHVlLCAyOSBPY3QgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Budmlk
aWEuY29tPgo+ID4KPiA+IFRoZSBjdXJyZW50IGxpbmsgc3RhdHVzIGNvbnRhaW5zIGJ5dGVzIDB4
MjAyIHRocm91Z2ggMHgyMDcsIGJ1dCB3ZSBhbHNvCj4gPiB3YW50IHRvIG1ha2Ugc3VyZSB0byBp
bmNsdWRlIHRoZSBEUF9BREpVU1RfUkVRVUVTVF9QT1NUX0NVUlNPUjIgKDB4MjBjKQo+ID4gc28g
dGhhdCB0aGUgcG9zdC1jdXJzb3IgYWRqdXN0bWVudCBjYW4gYmUgcXVlcmllZCBkdXJpbmcgbGlu
ayB0cmFpbmluZy4KPiAKPiBXZSBkb24ndCBjdXJyZW50bHkgdXNlIHRoaXMgaW4gaTkxNSAod2Ug
cHJvYmFibHkgc2hvdWxkKQoKSUlSQyBwb3N0IGN1cnNvcjIgaXMgYWxyZWFkeSBkZXByZWNhdGVk
LgoKPiAsIHNvIHRoZSBpbXBhY3QKPiBoZXJlIGlzIHRoYXQgd2UnbGwganVzdCByZWFkIG1vcmUg
RFBDRCB0aGFuIGJlZm9yZS4gSSBxdWlja2x5IHBlcnVzZWQKPiBpOTE1LCBhbmQgdGhpcyBkb2Vz
IG5vdCBhcHBlYXIgdG8gZGlyZWN0bHkgYnJlYWsgYW55dGhpbmcuIEkgdGhpbmsgdGhlCj4gY2hh
bmdlIGlzIHByb2JhYmx5IGZpbmUsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIGl0IGZyZWFrcyBtZSBv
dXQgYSBiaXQuLi4KPiAKPiBJZiB5b3UgZG9uJ3QgbWluZCwgcGxlYXNlIHJlc2VuZCB0aGlzIHdp
dGggQ2M6Cj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyB0byBoYXZlIG91ciBDSSBj
cnVuY2ggdGhyb3VnaCBpdCBhY3Jvc3MKPiBhIG51bWJlciBvZiBwbGF0Zm9ybXMuIFdvdWxkIGdp
dmUgbWUgYSB3YXJtIGZ1enp5IGZlZWxpbmcuIDopCj4gCj4gV2l0aCB0aGUgY2F2ZWF0IHRoYXQg
SSBkaWRuJ3QgbG9vayBhdCBhbnkgb3RoZXIgZHJpdmVycyBiZXNpZGVzIGk5MTUsCj4gCj4gUmV2
aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gCj4gCj4gPgo+
ID4gUmVwb3J0ZWQtYnk6IGNvdmVyaXR5LWJvdCA8a2Vlc2Nvb2srY292ZXJpdHktYm90QGNocm9t
aXVtLm9yZz4KPiA+IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ4NzM2NiAoIk1lbW9yeSAtIGNv
cnJ1cHRpb25zIikKPiA+IEZpeGVzOiA3OTQ2NWUwZmZlYjkgKCJkcm0vZHA6IEFkZCBoZWxwZXIg
dG8gZ2V0IHBvc3QtY3Vyc29yIGFkanVzdG1lbnRzIikKPiA+IFNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gPiAtLS0KPiA+IEkgdmFndWVseSByZWNh
bGwgb25jZSBjYXJyeWluZyBhIHBhdGNoIHRvIGRvIHRoaXMsIGJ1dCBJIGNhbid0IGZpbmQgYW55
Cj4gPiB0cmFjZSBvZiBpdC4KPiA+Cj4gPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwg
MiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKPiA+IGluZGV4IDUxZWNiNTExMmVmOC4uOTU4MWRlYzkwMGJh
IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiA+IEBAIC0xMTIxLDcgKzExMjEsNyBAQAo+ID4g
ICNkZWZpbmUgRFBfTVNUX1BIWVNJQ0FMX1BPUlRfMCAwCj4gPiAgI2RlZmluZSBEUF9NU1RfTE9H
SUNBTF9QT1JUXzAgOAo+ID4gIAo+ID4gLSNkZWZpbmUgRFBfTElOS19TVEFUVVNfU0laRQkgICA2
Cj4gPiArI2RlZmluZSBEUF9MSU5LX1NUQVRVU19TSVpFCSAgIDExCj4gPiAgYm9vbCBkcm1fZHBf
Y2hhbm5lbF9lcV9vayhjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwK
PiA+ICAJCQkgIGludCBsYW5lX2NvdW50KTsKPiA+ICBib29sIGRybV9kcF9jbG9ja19yZWNvdmVy
eV9vayhjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKPiAKPiAtLSAK
PiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFp
bGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4CgotLSAKVmlsbGUg
U3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
