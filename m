Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E6582A09
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 05:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6303489F38;
	Tue,  6 Aug 2019 03:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B1989F38
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 03:31:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 20:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="185517846"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.9])
 by orsmga002.jf.intel.com with ESMTP; 05 Aug 2019 20:31:12 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Select DMT timing if EDID's display feature not
 support GTF.
Date: Tue,  6 Aug 2019 19:30:21 +0800
Message-Id: <20190806113021.6586-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 Cooper Chiou <cooper.chiou@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVmZXIgdG8gRURJRCAxLjMgc3BlYywgZGlzcGxheSBGRUFUVVJFIChieXRlIDE4aCkgYml0ICMw
IHNhaWQKIklmIHRoaXMgYml0IGlzIHNldCB0byAxLCB0aGUgZGlzcGxheSBzdXBwb3J0cyB0aW1p
bmdzIGJhc2VkIG9uIHRoZQpHVEYgc3RhbmRhcmQgdXNpbmcgZGVmYXVsdCBHVEYgcGFyYW1ldGVy
IHZhbHVlcyIuCgpBbmQgRURJRCAxLjQgc3BlYyBzaG93cyAiSWYgYml0IDAgaXMgc2V0IHRvIDAs
IHRoZW4gdGhlIGRpc3BsYXkKaXMgbm9uY29udGludW91cyBmcmVxdWVuY3kgKG11bHRpLW1vZGUp
IGFuZCBpcyBvbmx5IHNwZWNpZmllZCB0byBhY2NlcHQKdGhlIHZpZGVvIHRpbWluZyBmb3JtYXRz
IHRoYXQgYXJlIGxpc3RlZCBpbiBCQVNFIEVESUQgYW5kIGNlcnRhaW4KRVhURU5TSU9OIEJsb2Nr
cy4KCldoZW4gZGlzcGxheSBmZWF0dXJlIGRpZCBub3Qgc3VwcG9ydCBDVlQgb3IgR0ZUMiBhbmQg
bW9uaXRvcidzIEVESUQgdmVyc2lvbgpncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gIjEuMiIuIERS
TSBkcml2ZXIgd291bGQgc2VsZWN0IEdURiBhcyBkZWZhdWx0CmZvciBzdGFuZGFyZCB0aW1pbmcg
Y2FsY3VsYXRpb24uIEl0IG1heSBnZW5lcmF0ZWQgc29tZSB2aWRlbyB0aW1pbmcKdGhhdCBjYW4n
dCBkaXNwbGF5IHByb3Blcmx5IGJ5IGV4dGVybmFsIG1vbml0b3IuCgpGb3IgZXhhbXBsZS4gV2hl
biBkcml2ZXIgcmV0cmlldmVkICIweEQxIDB4RkMiIChGSEQsIDEyMEh6KSBhbmQKIjB4RDEgMHhF
OCIgKEZIRCwgMTAwSHopIGZyb20gIlN0YW5kYXJkIFRpbWluZ3MiLiBHVEYgZm9ybXVsYQp3b3Vs
ZCBnZW5lcmF0ZSB2aWRlbyB0aW1pbmcgbGlrZSBiZWxvdy4gSXQgYWxyZWFkeSBvdmVyIG1vbml0
b3IncwpzcGVjIHRvIGNhdXNlIGJsYWNrIHNjcmVlbiBpc3N1ZS4KIjE5MjB4MTA4MCIgMTIwIDM2
ODg4MSAxOTIwIDIwNzIgMjI4OCAyNjU2IDEwODAgMTA4MSAxMDg0IDExNTcgMHgwIDB4NgoiMTky
MHgxMDgwIiAxMDAgMzAxOTkyIDE5MjAgMjA3MiAyMjgwIDI2NDAgMTA4MCAxMDgxIDEwODQgMTE0
NCAweDAgMHg2CgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBB
ZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4KQ2M6IENvb3BlciBDaGlvdSA8Y29vcGVyLmNo
aW91QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGVlIFNoYXduIEMgPHNoYXduLmMubGVlQGlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDQgKysrLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5k
ZXggODJhNGNlZWQzZmNmLi5mNmEzZDJkOTkzYzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0yMDg5LDcg
KzIwODksOSBAQCBzdGF0aWMgaW50IHN0YW5kYXJkX3RpbWluZ19sZXZlbChzdHJ1Y3QgZWRpZCAq
ZWRpZCkKIAkJCXJldHVybiBMRVZFTF9DVlQ7CiAJCWlmIChkcm1fZ3RmMl9oYnJlYWsoZWRpZCkp
CiAJCQlyZXR1cm4gTEVWRUxfR1RGMjsKLQkJcmV0dXJuIExFVkVMX0dURjsKKwkJaWYgKGVkaWQt
PnJldmlzaW9uID09IDMgJiYgKGVkaWQtPmZlYXR1cmVzICYgRFJNX0VESURfRkVBVFVSRV9ERUZB
VUxUX0dURikpCisJCQlyZXR1cm4gTEVWRUxfR1RGOworCiAJfQogCXJldHVybiBMRVZFTF9ETVQ7
CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
