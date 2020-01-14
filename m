Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BB13B515
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 23:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4745A6E59D;
	Tue, 14 Jan 2020 22:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FD8895A8;
 Tue, 14 Jan 2020 22:07:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 14:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="217896770"
Received: from unknown (HELO localhost.jf.intel.com) ([10.166.29.74])
 by orsmga008.jf.intel.com with ESMTP; 14 Jan 2020 14:07:36 -0800
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, omer.aran@intel.com,
 pragyansri.pathi@intel.com, d.scott.phillips@intel.com,
 david.c.stewart@intel.com, tony.luck@intel.com, jon.bloomfield@intel.com,
 sudeep.dutt@intel.com, daniel.vetter@intel.com, joonas.lahtinen@intel.com,
 jani.nikula@intel.com, chris.p.wilson@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@intel.com,
 francesco.balestrieri@intel.com
Subject: [RFC PATCH 0/2] Security mitigation for Intel Gen7 and Gen7.5
Date: Tue, 14 Jan 2020 06:51:34 -0800
Message-Id: <20200114145136.65373-1-akeem.g.abodunrin@intel.com>
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
YXIgZG93biByZXNpZHVhbCBFVSBhbmQgVVJCCnJlc291cmNlcy4KClRoaXMgaXMgY3VycmVudGx5
IGFuIFJGQyB3aGlsZSBtb3JlIGFuYWx5c2lzIGlzIHBlcmZvcm1lZCBvbiB0aGUKcGVyZm9ybWFu
Y2UgaW1wbGljYXRpb25zLgoKTm90ZSBvbiBBZGRyZXNzIFNwYWNlIElzb2xhdGlvbiAoRnVsbCBQ
UEdUVCkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCklzb2xh
dGlvbiBvZiBFVSBrZXJuZWwgYXNzZXRzIHNob3VsZCBiZSBjb25zaWRlcmVkIGNvbXBsZW1lbnRh
cnkgdG8gdGhlCmV4aXN0aW5nIHN1cHBvcnQgZm9yIGFkZHJlc3Mgc3BhY2UgaXNvbGF0aW9uIChh
a2EgRnVsbCBQUEdUVCksIHNpbmNlCndpdGhvdXQgYWRkcmVzcyBzcGFjZSBpc29sYXRpb24gdGhl
cmUgaXMgbWluaW1hbCB2YWx1ZSBpbiBwcmV2ZW50aW5nCmxlYWthZ2UgYmV0d2VlbiBFVSBjb250
ZXh0cy4gRnVsbCBQUEdUVCBoYXMgbG9uZyBiZWVuIHN1cHBvcnRlZCBvbiBHZW4KR2Z4IGRldmlj
ZXMgc2luY2UgR2VuOCwgYW5kIHByb3RlY3Rpb24gYWdhaW5zdCBFVSByZXNpZHVhbCBsZWFrYWdl
IGlzIGEKd2VsY29tZSBhZGRpdGlvbiBmb3IgdGhlc2UgbmV3ZXIgcGxhdGZvcm1zLgoKQnkgY29u
dHJhc3QsIEdlbjcgYW5kIEdlbjcuNSBkZXZpY2UgaW50cm9kdWNlZCBGdWxsIFBQR1RUIHN1cHBv
cnQgb25seQphcyBhIGhhcmR3YXJlIGRldmVsb3BtZW50IGZlYXR1cmUgZm9yIGFudGljaXBhdGVk
IEdlbjggcHJvZHVjdGl6YXRpb24uClN1cHBvcnQgd2FzIG5ldmVyIGludGVuZGVkIGZvciwgb3Ig
cHJvdmlkZWQgdG8gdGhlIExpbnV4IGtlcm5lbHMgZm9yCnRoZXNlIHBsYXRmb3Jtcy4gUmVjZW50
IHdvcmsgKHN0aWxsIG9uZ29pbmcpIHRvIHRoZSBtYWlubGluZSBrZXJuZWwgaXMKcmV0cm9hY3Rp
dmVseSBwcm92aWRpbmcgdGhpcyBzdXBwb3J0LCBidXQgZHVlIHRvIHRoZSBsZXZlbCBvZiBjb21w
bGV4aXR5Cml0IGlzIG5vdCBwcmFjdGljYWwgdG8gYXR0ZW1wdCB0byBiYWNrcG9ydCB0aGlzIHRv
IGVhcmxpZXIgc3RhYmxlCmtlcm5lbHMuIFNpbmNlIHdpdGhvdXQgRnVsbCBQUEdUVCwgRVUgcmVz
aWR1YWxzIHByb3RlY3Rpb24gaGFzCnF1ZXN0aW9uYWJsZSBiZW5lZml0LCAqdGhlcmUgYXJlIG5v
IHBsYW5zIHRvIHByb3ZpZGUgc3RhYmxlIGtlcm5lbApiYWNrcG9ydHMgZm9yIHRoaXMgcGF0Y2gg
c2VyaWVzLioKCk1pa2EgS3VvcHBhbGEgKDEpOgogIGRybS9pOTE1OiBBZGQgbWVjaGFuaXNtIHRv
IHN1Ym1pdCBhIGNvbnRleHQgV0Egb24gcmluZyBzdWJtaXNzaW9uCgpQcmF0aGFwIEt1bWFyIFZh
bHNhbiAoMSk6CiAgZHJtL2k5MTUvZ2VuNzogQ2xlYXIgYWxsIEVVL0wzIHJlc2lkdWFsIGNvbnRl
eHRzCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xlYXIuYyAgICB8IDUxNCAr
KysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xl
YXIuaCAgICB8ICAxNSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVfY29tbWFu
ZHMuaCAgfCAgMTcgKy0KIC4uLi9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZ19zdWJtaXNzaW9u
LmMgICB8IDEwMyArKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmggICAgICAg
ICAgICAgfCAgIDUgKwogNiBmaWxlcyBjaGFuZ2VkLCA2NDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW43
X3JlbmRlcmNsZWFyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9nZW43X3JlbmRlcmNsZWFyLmgKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
