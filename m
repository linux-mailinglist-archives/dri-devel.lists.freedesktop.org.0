Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4052C848
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D1B89DDD;
	Tue, 28 May 2019 14:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083CE89DC7;
 Tue, 28 May 2019 14:07:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 07:06:55 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 28 May 2019 07:06:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 May 2019 17:06:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp: Add DP_DPCD_QUIRK_NO_SINK_COUNT
Date: Tue, 28 May 2019 17:06:49 +0300
Message-Id: <20190528140650.19230-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNI
NzUxMSBlRFAtPkxWRFMgYnJpZGdlIGRvZXNuJ3Qgc2VlbSB0byBzZXQgU0lOS19DT1VOVCBwcm9w
ZXJseQpjYXVzaW5nIGk5MTUgdG8gZGV0ZWN0IGl0IGFzIGRpc2Nvbm5lY3RlZC4gQWRkIGEgcXVp
cmsgdG8gaWdub3JlClNJTktfQ09VTlQgb24gdGhlc2UgZGV2aWNlcy4KCkNjOiBEYXZpZCBTLiA8
ZGF2aWRAbWFqaW5idXUuY29tPgpDYzogUGV0ZXJpcyBSdWR6dXNpa3MgPHBldGVyaXMucnVkenVz
aWtzQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBQZXRlcmlzIFJ1ZHp1c2lrcyA8cGV0ZXJpcy5ydWR6
dXNpa3NAZ21haWwuY29tPgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTA1NDA2ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYyB8IDQgKysrLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICB8IDcgKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggZTZhZjc1OGE3ZDIyLi4wYjk5NGQwODNhODkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMTI4MCw3ICsxMjgwLDkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtfbGlzdFtdID0gewogCS8qIExHIExQMTQwV0Y2
LVNQTTEgZURQIHBhbmVsICovCiAJeyBPVUkoMHgwMCwgMHgyMiwgMHhiOSksIERFVklDRV9JRCgn
cycsICdpJywgJ3YnLCAnYScsICdyJywgJ1QnKSwgZmFsc2UsIEJJVChEUF9EUENEX1FVSVJLX0NP
TlNUQU5UX04pIH0sCiAJLyogQXBwbGUgcGFuZWxzIG5lZWQgc29tZSBhZGRpdGlvbmFsIGhhbmRs
aW5nIHRvIHN1cHBvcnQgUFNSICovCi0JeyBPVUkoMHgwMCwgMHgxMCwgMHhmYSksIERFVklDRV9J
RF9BTlksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0KKwl7IE9VSSgweDAwLCAw
eDEwLCAweGZhKSwgREVWSUNFX0lEX0FOWSwgZmFsc2UsIEJJVChEUF9EUENEX1FVSVJLX05PX1BT
UikgfSwKKwkvKiBDSDc1MTEgc2VlbXMgdG8gbGVhdmUgU0lOS19DT1VOVCB6ZXJvZWQgKi8KKwl7
IE9VSSgweDAwLCAweDAwLCAweDAwKSwgREVWSUNFX0lEKCdDJywgJ0gnLCAnNycsICc1JywgJzEn
LCAnMScpLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fU0lOS19DT1VOVCkgfSwKIH07CiAK
ICN1bmRlZiBPVUkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCAzZmM1MzRlZTgxNzQuLjdlNTJlYjgxMjg0
YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTQxNCw2ICsxNDE0LDEzIEBAIGVudW0gZHJtX2RwX3F1
aXJrIHsKIAkgKiBkcml2ZXIgc3RpbGwgbmVlZCB0byBpbXBsZW1lbnQgcHJvcGVyIGhhbmRsaW5n
IGZvciBzdWNoIGRldmljZS4KIAkgKi8KIAlEUF9EUENEX1FVSVJLX05PX1BTUiwKKwkvKioKKwkg
KiBARFBfRFBDRF9RVUlSS19OT19TSU5LX0NPVU5UOgorCSAqCisJICogVGhlIGRldmljZSBkb2Vz
IG5vdCBzZXQgU0lOS19DT1VOVCB0byBhIG5vbi16ZXJvIHZhbHVlLgorCSAqIFRoZSBkcml2ZXIg
c2hvdWxkIGlnbm9yZSBTSU5LX0NPVU5UIGR1cmluZyBkZXRlY3Rpb24uCisJICovCisJRFBfRFBD
RF9RVUlSS19OT19TSU5LX0NPVU5ULAogfTsKIAogLyoqCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
