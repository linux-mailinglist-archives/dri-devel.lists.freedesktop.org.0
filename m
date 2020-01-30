Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE814E667
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 01:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAF56E937;
	Fri, 31 Jan 2020 00:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005136E0E6;
 Fri, 31 Jan 2020 00:13:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 16:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,383,1574150400"; d="scan'208";a="218453688"
Received: from unknown (HELO localhost.jf.intel.com) ([10.166.29.74])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2020 16:13:17 -0800
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, omer.aran@intel.com,
 pragyansri.pathi@intel.com, d.scott.phillips@intel.com,
 david.c.stewart@intel.com, tony.luck@intel.com, jon.bloomfield@intel.com,
 sudeep.dutt@intel.com, daniel.vetter@intel.com,
 joonas.lahtinen@linux.intel.com, jani.nikula@intel.com,
 chris.p.wilson@intel.com, prathap.kumar.valsan@intel.com,
 mika.kuoppala@intel.com, francesco.balestrieri@intel.com
Subject: [PATCH 0/2] Security mitigation for Intel Gen7/7.5 HWs
Date: Thu, 30 Jan 2020 08:57:19 -0800
Message-Id: <20200130165721.20342-1-akeem.g.abodunrin@intel.com>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW50ZWwgSUQ6IFBTSVJULVRBLTIwMTkxMC0wMDEKQ1ZFSUQ6IENWRS0yMDE5LTE0NjE1CgpTdW1t
YXJ5IG9mIFZ1bG5lcmFiaWxpdHkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkluc3VmZmljaWVu
dCBjb250cm9sIGZsb3cgaW4gY2VydGFpbiBkYXRhIHN0cnVjdHVyZXMgZm9yIHNvbWUgSW50ZWwo
UikKUHJvY2Vzc29ycyB3aXRoIEludGVsIFByb2Nlc3NvciBHcmFwaGljcyBtYXkgYWxsb3cgYW4g
dW5hdXRoZW50aWNhdGVkCnVzZXIgdG8gcG90ZW50aWFsbHkgZW5hYmxlIGluZm9ybWF0aW9uIGRp
c2Nsb3N1cmUgdmlhIGxvY2FsIGFjY2VzcwoKUHJvZHVjdHMgYWZmZWN0ZWQ6Ci0tLS0tLS0tLS0t
LS0tLS0tLQpJbnRlbCBDUFXigJlzIHdpdGggR2VuNywgR2VuNy41IGFuZCBHZW45IEdyYXBoaWNz
LgoKTWl0aWdhdGlvbiBTdW1tYXJ5Ci0tLS0tLS0tLS0tLS0tLS0tLQpUaGlzIHBhdGNoIHByb3Zp
ZGVzIG1pdGlnYXRpb24gZm9yIEdlbjcgYW5kIEdlbjcuNSBoYXJkd2FyZSBvbmx5LgpQYXRjaCBm
b3IgR2VuOSBkZXZpY2VzIGhhdmUgYmVlbiBwcm92aWRlZCBhbmQgbWVyZ2VkIHRvIExpbnV4IG1h
aW5saW5lLAphbmQgYmFja3BvcnRlZCB0byBzdGFibGUga2VybmVscy4KTm90ZSB0aGF0IEdlbjgg
aXMgbm90IGltcGFjdGVkIGR1ZSB0byBhIHByZXZpb3VzbHkgaW1wbGVtZW50ZWQKd29ya2Fyb3Vu
ZC4KClRoZSBtaXRpZ2F0aW9uIGludm9sdmVzIHN1Ym1pdHRpbmcgYSBjdXN0b20gRVUga2VybmVs
IHByaW9yIHRvIGV2ZXJ5CmNvbnRleHQgcmVzdG9yZSwgaW4gb3JkZXIgdG8gZm9yY2libHkgY2xl
YXIgZG93biByZXNpZHVhbCBFVSBhbmQgVVJCCnJlc291cmNlcy4KClRoaXMgc2VjdXJpdHkgbWl0
aWdhdGlvbiBjaGFuZ2UgZG9lcyBub3QgdHJpZ2dlciBhbnkga25vd24gcGVyZm9ybWFuY2UKcmVn
cmVzc2lvbi4gUGVyZm9ybWFuY2UgaXMgb24gcGFyIHdpdGggY3VycmVudCBtYWlubGluZS9kcm0t
dGlwLgoKTm90ZSBvbiBBZGRyZXNzIFNwYWNlIElzb2xhdGlvbiAoRnVsbCBQUEdUVCkKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCklzb2xhdGlvbiBvZiBFVSBr
ZXJuZWwgYXNzZXRzIHNob3VsZCBiZSBjb25zaWRlcmVkIGNvbXBsZW1lbnRhcnkgdG8gdGhlCmV4
aXN0aW5nIHN1cHBvcnQgZm9yIGFkZHJlc3Mgc3BhY2UgaXNvbGF0aW9uIChha2EgRnVsbCBQUEdU
VCksIHNpbmNlCndpdGhvdXQgYWRkcmVzcyBzcGFjZSBpc29sYXRpb24gdGhlcmUgaXMgbWluaW1h
bCB2YWx1ZSBpbiBwcmV2ZW50aW5nCmxlYWthZ2UgYmV0d2VlbiBFVSBjb250ZXh0cy4gRnVsbCBQ
UEdUVCBoYXMgbG9uZyBiZWVuIHN1cHBvcnRlZCBvbiBHZW4KR2Z4IGRldmljZXMgc2luY2UgR2Vu
OCwgYW5kIHByb3RlY3Rpb24gYWdhaW5zdCBFVSByZXNpZHVhbCBsZWFrYWdlIGlzIGEKd2VsY29t
ZSBhZGRpdGlvbiBmb3IgdGhlc2UgbmV3ZXIgcGxhdGZvcm1zLgoKQnkgY29udHJhc3QsIEdlbjcg
YW5kIEdlbjcuNSBkZXZpY2UgaW50cm9kdWNlZCBGdWxsIFBQR1RUIHN1cHBvcnQgb25seQphcyBh
IGhhcmR3YXJlIGRldmVsb3BtZW50IGZlYXR1cmUgZm9yIGFudGljaXBhdGVkIEdlbjggcHJvZHVj
dGl6YXRpb24uClN1cHBvcnQgd2FzIG5ldmVyIGludGVuZGVkIGZvciwgb3IgcHJvdmlkZWQgdG8g
dGhlIExpbnV4IGtlcm5lbHMgZm9yCnRoZXNlIHBsYXRmb3Jtcy4gUmVjZW50IHdvcmsgKHN0aWxs
IG9uZ29pbmcpIHRvIHRoZSBtYWlubGluZSBrZXJuZWwgaXMKcmV0cm9hY3RpdmVseSBwcm92aWRp
bmcgdGhpcyBzdXBwb3J0LCBidXQgZHVlIHRvIHRoZSBsZXZlbCBvZiBjb21wbGV4aXR5Cml0IGlz
IG5vdCBwcmFjdGljYWwgdG8gYXR0ZW1wdCB0byBiYWNrcG9ydCB0aGlzIHRvIGVhcmxpZXIgc3Rh
YmxlCmtlcm5lbHMuIFNpbmNlIHdpdGhvdXQgRnVsbCBQUEdUVCwgRVUgcmVzaWR1YWxzIHByb3Rl
Y3Rpb24gaGFzCnF1ZXN0aW9uYWJsZSBiZW5lZml0LCAqdGhlcmUgYXJlIG5vIHBsYW5zIHRvIHBy
b3ZpZGUgc3RhYmxlIGtlcm5lbApiYWNrcG9ydHMgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzLioKCk1p
a2EgS3VvcHBhbGEgKDEpOgogIGRybS9pOTE1OiBBZGQgbWVjaGFuaXNtIHRvIHN1Ym1pdCBhIGNv
bnRleHQgV0Egb24gcmluZyBzdWJtaXNzaW9uCgpQcmF0aGFwIEt1bWFyIFZhbHNhbiAoMSk6CiAg
ZHJtL2k5MTUvZ2VuNzogQ2xlYXIgYWxsIEVVL0wzIHJlc2lkdWFsIGNvbnRleHRzCgogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xlYXIuYyAgICB8IDUzNSArKysrKysrKysrKysr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xlYXIuaCAgICB8ICAx
NSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVfY29tbWFuZHMuaCAgfCAgMTcg
Ky0KIC4uLi9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZ19zdWJtaXNzaW9uLmMgICB8IDEzMyAr
KysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5oICAgICAgICAgICAgIHwgICA1
ICsKIDYgZmlsZXMgY2hhbmdlZCwgNzAwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZ2VuN19yZW5kZXJjbGVh
ci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZ2VuN19yZW5k
ZXJjbGVhci5oCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
