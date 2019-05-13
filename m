Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9DF1BE21
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 21:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F91A891AA;
	Mon, 13 May 2019 19:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273F890BC;
 Mon, 13 May 2019 19:40:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 12:40:00 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 13 May 2019 12:39:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2019 22:39:56 +0300
Date: Mon, 13 May 2019 22:39:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v9 10/13] drm/i915: Set Infoframe for non modeset case for HDR
Message-ID: <20190513193956.GU24299@intel.com>
References: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
 <1557340733-9629-11-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557340733-9629-11-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, ville.syrjala@intel.com, maarten.lankhorst@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMTI6MDg6NTBBTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gSERSIG1ldGFkYXRhIHJlcXVpcmVzIGEgaW5mb2ZyYW1lIHRvIGJlIHNldC4gRHVlIHRv
IGZhc3RzZXQsCj4gZnVsbCBtb2Rlc2V0IGlzIG5vdCBwZXJmb3JtZWQgaGVuY2UgYWRkaW5nIGl0
IHRvIHVwZGF0ZV9waXBlCj4gdG8gaGFuZGxlIHRoYXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVW1h
IFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogU2hhc2hhbmsg
U2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9kZGkuYyAgfCAxMyArKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX2hkbWkuYyB8ICA3ICsrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5j
Cj4gaW5kZXggY2Q1Mjc3ZC4uZDM3NTI2YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9kZGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5j
Cj4gQEAgLTM1NTksNiArMzU1OSwxMCBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kZGlfdXBkYXRlX3Bp
cGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCj4gIAkJCQkgIGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAo+ICAJCQkJICBjb25zdCBzdHJ1Y3QgZHJtX2Nv
bm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkKPiAgewo+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmRldl9wcml2ID0gdG9faTkxNShlbmNvZGVyLT5iYXNlLmRldik7Cj4gKwlzdHJ1Y3QgaW50
ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCA9Cj4gKwkJCWVuY190b19kaWdfcG9ydCgm
ZW5jb2Rlci0+YmFzZSk7Cj4gKwo+ICAJaWYgKCFpbnRlbF9jcnRjX2hhc190eXBlKGNydGNfc3Rh
dGUsIElOVEVMX09VVFBVVF9IRE1JKSkKPiAgCQlpbnRlbF9kZGlfdXBkYXRlX3BpcGVfZHAoZW5j
b2RlciwgY3J0Y19zdGF0ZSwgY29ubl9zdGF0ZSk7Cj4gIAo+IEBAIC0zNTY4LDYgKzM1NzIsMTUg
QEAgc3RhdGljIHZvaWQgaW50ZWxfZGRpX3VwZGF0ZV9waXBlKHN0cnVjdCBpbnRlbF9lbmNvZGVy
ICplbmNvZGVyLAo+ICAJZWxzZSBpZiAoY29ubl9zdGF0ZS0+Y29udGVudF9wcm90ZWN0aW9uID09
Cj4gIAkJIERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9VTkRFU0lSRUQpCj4gIAkJaW50ZWxf
aGRjcF9kaXNhYmxlKHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uX3N0YXRlLT5jb25uZWN0b3IpKTsK
PiArCj4gKwkvKiBTZXQgdGhlIGluZm9mcmFtZSBmb3IgTk9OIG1vZGVzZXQgY2FzZXMgYXMgd2Vs
bCAqLwo+ICsJaWYgKGludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19zdGF0ZSwgSU5URUxfT1VUUFVU
X0hETUkpKSB7Cj4gKwkJaWYgKChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlO
SUxBS0UoZGV2X3ByaXYpKSAmJgo+ICsJCSAgICBjb25uX3N0YXRlLT5oZHJfbWV0YWRhdGFfY2hh
bmdlZCkKPiArCQkJaW50ZWxfZGlnX3BvcnQtPnNldF9pbmZvZnJhbWVzKGVuY29kZXIsCj4gKwkJ
CQkJCSAgICAgICBjcnRjX3N0YXRlLT5oYXNfaW5mb2ZyYW1lLAo+ICsJCQkJCQkgICAgICAgY3J0
Y19zdGF0ZSwgY29ubl9zdGF0ZSk7Cj4gKwl9CgpTdGlsbCBuYWsuCgo+ICB9Cj4gIAo+ICBzdGF0
aWMgdm9pZCBpbnRlbF9kZGlfc2V0X2ZpYV9sYW5lX2NvdW50KHN0cnVjdCBpbnRlbF9lbmNvZGVy
ICplbmNvZGVyLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMKPiBpbmRleCBkYjljODJiLi5l
NTU5YTk0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMKPiBAQCAtMTIwNCw4ICsx
MjA0LDExIEBAIHN0YXRpYyB2b2lkIGhzd19zZXRfaW5mb2ZyYW1lcyhzdHJ1Y3QgaW50ZWxfZW5j
b2RlciAqZW5jb2RlciwKPiAgCWk5MTVfcmVnX3QgcmVnID0gSFNXX1RWSURFT19ESVBfQ1RMKGNy
dGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyKTsKPiAgCXUzMiB2YWwgPSBJOTE1X1JFQUQocmVnKTsK
PiAgCj4gLQlhc3NlcnRfaGRtaV90cmFuc2NvZGVyX2Z1bmNfZGlzYWJsZWQoZGV2X3ByaXYsCj4g
LQkJCQkJICAgICBjcnRjX3N0YXRlLT5jcHVfdHJhbnNjb2Rlcik7Cj4gKwkvKiBEUk0gSW5mb2Zy
YW1lIGNhbiBiZSBzZW5kIHdpdGggdHJhbnNjb2RlciBlbmFibGVkICovCj4gKwlpZiAoISgoSU5U
RUxfR0VOKGRldl9wcml2KSA+PSAxMCB8fCBJU19HRU1JTklMQUtFKGRldl9wcml2KSkgJiYKPiAr
CSAgICAgIGNvbm5fc3RhdGUtPmhkcl9tZXRhZGF0YV9jaGFuZ2VkKSkKPiArCQlhc3NlcnRfaGRt
aV90cmFuc2NvZGVyX2Z1bmNfZGlzYWJsZWQoZGV2X3ByaXYsCj4gKwkJCQkJCSAgICAgY3J0Y19z
dGF0ZS0+Y3B1X3RyYW5zY29kZXIpOwo+ICAKPiAgCXZhbCAmPSB+KFZJREVPX0RJUF9FTkFCTEVf
VlNDX0hTVyB8IFZJREVPX0RJUF9FTkFCTEVfQVZJX0hTVyB8Cj4gIAkJIFZJREVPX0RJUF9FTkFC
TEVfR0NQX0hTVyB8IFZJREVPX0RJUF9FTkFCTEVfVlNfSFNXIHwKPiAtLSAKPiAxLjkuMQo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0g
ClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
