Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C592E6593D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 16:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D186E25C;
	Thu, 11 Jul 2019 14:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0911F6E25C;
 Thu, 11 Jul 2019 14:44:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 07:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,478,1557212400"; d="scan'208";a="160089193"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 11 Jul 2019 07:42:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Jul 2019 17:42:24 +0300
Date: Thu, 11 Jul 2019 17:42:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/5] drm/edid: Make sure the CEA mode arrays have the
 correct amount of modes
Message-ID: <20190711144224.GZ5942@intel.com>
References: <20190711103234.6294-1-ville.syrjala@linux.intel.com>
 <20190711103234.6294-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711103234.6294-6-ville.syrjala@linux.intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Hans Verkuil <hansverk@cisco.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDE6MzI6MzRQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFdlIGRlcGVuZCBvbiBhIHNwZWNpZmljIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRo
ZSBWSUMgbnVtYmVyIGFuZCB0aGUKPiBpbmRleCBpbiB0aGUgQ0VBIG1vZGUgYXJyYXlzLiBBc3Nl
cnQgdGhhdCB0aGUgYXJyYXlzIGhhdmUgdGhlIGV4Y3BlY3RlZAo+IHNpemUgdG8gbWFrZSBzdXJl
IHdlJ3ZlIG5vdCBhY2NpZGVudGFsbHkgbGVmdCBob2xlcyBpbiB0aGVtLgo+IAo+IENjOiBIYW5z
IFZlcmt1aWwgPGhhbnN2ZXJrQGNpc2NvLmNvbT4KPiBDYzogU2hhc2hhbmsgU2hhcm1hIDxzaGFz
aGFuay5zaGFybWFAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCj4gaW5kZXggZTZiMWU3ODVkMTU4Li5mMGI0NDkyMjU3MjcgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYwo+IEBAIC0zMjA5LDYgKzMyMDksOSBAQCBzdGF0aWMgdTggKmRybV9maW5kX2Nl
YV9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpCj4gIAo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmNlYV9tb2RlX2Zvcl92aWModTggdmljKQo+ICB7Cj4g
KwlCVUlMRF9CVUdfT04oQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xKSAhPSAxMjcpOwo+ICsJ
QlVJTERfQlVHX09OKEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMTkzKSAhPSAyNyk7CgpNYXli
ZSBiZXR0ZXIgdG8gd3JpdGUgdGhlc2UgYXMgc29tZXRoaW5nIGxpa2UKCkJVSUxEX0JVR19PTigx
ICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xKSAtIDEgIT0gMTI3KTsKQlVJTERfQlVHX09O
KDE5MyArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMTkzKSAtIDEgIT0gMjE5KTsKCnRvIG1h
a2UgaXQgc3VwZXIgdHJpdmlhbCB0byBjcm9zcyBjaGVjayBhZ2FpbnN0IHRoZSBWSUNzIG9mIHRo
ZQpmaXJzdCBhbmQgbGFzdCBlbnRyeSBpbiB0aGUgYXJyYXlzLgoKPiArCj4gIAlpZiAodmljID49
IDEgJiYgdmljIDwgMSArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkpCj4gIAkJcmV0dXJu
ICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAtIDFdOwo+ICAJaWYgKHZpYyA+PSAxOTMgJiYgdmljIDwg
MTkzICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xOTMpKQo+IC0tIAo+IDIuMjEuMAoKLS0g
ClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
