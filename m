Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A675217BA3C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B67C6ECCA;
	Fri,  6 Mar 2020 10:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110556ECC8;
 Fri,  6 Mar 2020 10:30:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 02:30:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; d="scan'208";a="234763250"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 02:30:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v4 1/2] drm/edid: Name the detailed monitor
 range flags
In-Reply-To: <20200306014220.20029-1-manasi.d.navare@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200306014220.20029-1-manasi.d.navare@intel.com>
Date: Fri, 06 Mar 2020 12:30:46 +0200
Message-ID: <87mu8tojvt.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBNYXIgMjAyMCwgTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVs
LmNvbT4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIGRlZmluZXMgZm9yIHRoZSBkZXRhaWxlZCBt
b25pdG9yCj4gcmFuZ2UgZmxhZ3MgYXMgcGVyIHRoZSBFRElEIHNwZWNpZmljYXRpb24uCj4KPiBT
dWdnZXN0ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Cj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBDbGlu
dG9uIEEgVGF5bG9yIDxjbGludG9uLmEudGF5bG9yQGludGVsLmNvbT4KPiBDYzogS2F6bGF1c2th
cyBOaWNob2xhcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvZHJtL2RybV9lZGlkLmggfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oIGIvaW5jbHVkZS9k
cm0vZHJtX2VkaWQuaAo+IGluZGV4IGYwYjAzZDQwMWMyNy4uZjg5Yzk3NjIzODQ1IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZWRp
ZC5oCj4gQEAgLTkxLDYgKzkxLDExIEBAIHN0cnVjdCBkZXRhaWxlZF9kYXRhX3N0cmluZyB7Cj4g
IAl1OCBzdHJbMTNdOwo+ICB9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpOwo+ICAKPiArI2RlZmlu
ZSBFRElEX0RFRkFVTFRfR1RGX1NVUFBPUlRfRkxBRyAgIDB4MDAKPiArI2RlZmluZSBFRElEX1JB
TkdFX0xJTUlUU19PTkxZX0ZMQUcgICAgIDB4MDEKPiArI2RlZmluZSBFRElEX1NFQ09OREFSWV9H
VEZfU1VQUE9SVF9GTEFHIDB4MDIKPiArI2RlZmluZSBFRElEX0NWVF9TVVBQT1JUX0ZMQUcgICAg
ICAgICAgIDB4MDQKCkJpa2VzaGVkIGZvciBjb25zaWRlcmF0aW9uOgoKZHJtX2VkaWQuaCBoYXMg
c29tZSBtYWNyb3Mgd2l0aCBEUk1fRURJRF8gcHJlZml4LCBzb21lIHdpdGggRURJRF8KcHJlZml4
LCBhbmQgdGhlbiBzb21lIHdpdGggbm8gcHJlZml4IGF0IGFsbCByZWFsbHkuIFNob3VsZCB3ZSBz
dGFydApjb25zb2xpZGF0aW5nIG9uIHNvbWV0aGluZyB3aGVuIHdlIGFkZCBtb3JlPwoKQlIsCkph
bmkuCgoKPiArCj4gIHN0cnVjdCBkZXRhaWxlZF9kYXRhX21vbml0b3JfcmFuZ2Ugewo+ICAJdTgg
bWluX3ZmcmVxOwo+ICAJdTggbWF4X3ZmcmVxOwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVu
IFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
