Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B8CDBA4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 07:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AD46E452;
	Mon,  7 Oct 2019 05:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476126E452
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 05:52:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Oct 2019 22:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,265,1566889200"; d="scan'208";a="222808699"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.9])
 by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2019 22:52:34 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/edid: Select DMT timing if EDID's display feature not
 support GTF
Date: Mon,  7 Oct 2019 21:51:27 +0800
Message-Id: <20191007135127.9538-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806113021.6586-1-shawn.c.lee@intel.com>
References: <20190806113021.6586-1-shawn.c.lee@intel.com>
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
Cc: Cooper Chiou <cooper.chiou@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
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
NCAweDAgMHg2Cgp2MjogSnVzdCBjb25maXJtIEdURiBmbGFnIGFuZCBvbWl0IHRoZSByZXZpc2lv
biBjaGVjay4KCkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBBZGFtIEph
Y2tzb24gPGFqYXhAcmVkaGF0LmNvbT4KQ2M6IENvb3BlciBDaGlvdSA8Y29vcGVyLmNoaW91QGlu
dGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGVlIFNoYXduIEMgPHNoYXduLmMubGVlQGludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA1YWVl
MGViYzIwMGUuLjI2ZWIwNDgyMGI1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTIxOTMsNyArMjE5Myw4
IEBAIHN0YXRpYyBpbnQgc3RhbmRhcmRfdGltaW5nX2xldmVsKHN0cnVjdCBlZGlkICplZGlkKQog
CQkJcmV0dXJuIExFVkVMX0NWVDsKIAkJaWYgKGRybV9ndGYyX2hicmVhayhlZGlkKSkKIAkJCXJl
dHVybiBMRVZFTF9HVEYyOwotCQlyZXR1cm4gTEVWRUxfR1RGOworCQlpZiAoZWRpZC0+ZmVhdHVy
ZXMgJiBEUk1fRURJRF9GRUFUVVJFX0RFRkFVTFRfR1RGKQorCQkJcmV0dXJuIExFVkVMX0dURjsK
IAl9CiAJcmV0dXJuIExFVkVMX0RNVDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
