Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70EE9ABE3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290D16EC4D;
	Fri, 23 Aug 2019 09:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2246EC4D;
 Fri, 23 Aug 2019 09:52:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 02:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; d="scan'208";a="330673433"
Received: from helsinki.fi.intel.com ([10.237.66.174])
 by orsmga004.jf.intel.com with ESMTP; 23 Aug 2019 02:52:29 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/i915/dp: Support for DP HDR outputs
Date: Fri, 23 Aug 2019 12:52:26 +0300
Message-Id: <20190823095232.28908-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.22.0
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
Cc: uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3VwcG9ydCBmb3IgSERSMTAgdmlkZW8gd2FzIGludHJvZHVjZWQgaW4gRGlzcGxheVBvcnQgMS40
LgpPbiBHTEsrIHBsYXRmb3JtLCBpbiBvcmRlciB0byB1c2UgRGlzcGxheVBvcnQgSERSMTAsIHdl
IG5lZWQgdG8gc3VwcG9ydApCVC4yMDIwIGNvbG9yaW1ldHJ5IGFuZCBIRFIgU3RhdGljIG1ldGFk
YXRhLgpJdCBpbXBsZW1lbnRzIHRoZSBDVEEtODYxLUcgc3RhbmRhcmQgZm9yIHRyYW5zcG9ydCBv
ZiBzdGF0aWMgSERSIG1ldGFkYXRhLgpJdCBlbmFibGVzIHdyaXRpbmcgb2YgSERSIG1ldGFkYXRh
IGluZm9mcmFtZSBTRFAgdG8gdGhlIHBhbmVsLgpUaGUgSERSIE1ldGFkYXRhIHdpbGwgYmUgcHJv
dmlkZWQgYnkgdXNlcnNwYWNlIGNvbXBvc2l0b3JzLCBiYXNlZCBvbgpibGVuZGluZyBwb2xpY2ll
cyBhbmQgcGFzc2VkIHRvIHRoZSBkcml2ZXIgdGhyb3VnaCBhIGJsb2IgcHJvcGVydHkuCkFuZCBJ
dCByZWZhY3RvcnMsIHJlbmFtZXMgYW5kIGV4dGVuZHMgYSBmdW5jdGlvbiB3aGljaCBoYW5kbGVk
IHZzYyBzZHAKaGVhZGVyIGFuZCBkYXRhIGJsb2NrIHNldHVwIGZvciBzdXBwb3J0aW5nIGNvbG9y
aW1ldHJ5IGZvcm1hdC4KQW5kIEl0IGF0dGFjaGVzIHRoZSBjb2xvcnNwYWNlIGNvbm5lY3RvciBw
cm9wZXJ0eSBhbmQgSERSIG1ldGFkYXRhIHByb3BlcnR5CnRvIGEgRGlzcGxheVBvcnQgY29ubmVj
dG9yLgoKVGhlc2UgcGF0Y2hlcyB0ZXN0ZWQgb24gYmVsb3cgdGVzdCBlbnZpcm9ubWVudC4KVGVz
dCBFbnZpcm9ubWVudDoKIC0gVGVzdGVkIFN5c3RlbTogR0xLIGFuZCBHZW4xMSBwbGF0Zm9ybS4K
IC0gTW9uaXRvcjogRGVsbCBVUDI3MThRIDRLIEhEUiBNb25pdG9yLgogLSBJbiBvcmRlciB0byB0
ZXN0IERQIEhEUjEwLCB0ZXN0IGVudmlyb25tZW50IHVzZXMgcGF0Y2hlZCBLb2RpLWdibSwKICAg
cGF0Y2hlZCBNZWRpYSBkcml2ZXIgYW5kIEhEUjEwIHZpZGVvLgoKICAgWW91IGNhbiBmaW5kIHRo
ZXNlIG9uIGJlbG93LgogICBbcGF0Y2hlZCBLb2RpLWdibV0KICAgIC0gcmVwbzogaHR0cHM6Ly9n
aXRodWIuY29tL0t3aWJvby94Ym1jL3RyZWUvZHJtcHJpbWUtaGRyIAogICBbZG93bmxvYWQgNEsg
SERSIHZpZGVvIGZpbGVdCiAgICAtIGxpbms6IGh0dHBzOi8vNGttZWRpYS5vcmcvbGctbmV3LXlv
cmstaGRyLXVoZC00ay1kZW1vLwogICBbTWVkaWEgRHJpdmVyIGZvciBHTEtdCiAgICAtIHJlcG8g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9uL2ludGVsLXZhYXBpLWRyaXZl
cgogIAkgIG1hc3RlciBicmFuY2gKICAgW01lZGlhIERyaXZlciBmb3IgSUNMXQogICAgLSByZXBv
OiBodHRwczovL2dpdGh1Yi5jb20vaGFyaXNoa3J1cG8vbWVkaWEtZHJpdmVyL3RyZWUvcDAxMF9j
b21wb3NpdGUKCnYyOgogLSBBZGQgYSBtaXNzZWQgYmxhbmsgbGluZSBhZnRlciBmdW5jdGlvbiBk
ZWNsYXJhdGlvbi4KIC0gUmVtb3ZlIHVzZWxlc3MgcGFyZW50aGVzZXMuCiAtIE1pbm9yIHN0eWxl
IGZpeC4KCkd3YW4tZ3llb25nIE11biAoNik6CiAgZHJtL2k5MTUvZHA6IEV4dGVuZCBwcm9ncmFt
IG9mIFZTQyBIZWFkZXIgYW5kIERCIGZvciBDb2xvcmltZXRyeQogICAgRm9ybWF0CiAgZHJtL2k5
MTUvZHA6IEFkZCBzdXBwb3J0IG9mIEJULjIwMjAgQ29sb3JpbWV0cnkgdG8gRFAgTVNBCiAgZHJt
OiBBZGQgRGlzcGxheVBvcnQgY29sb3JzcGFjZSBwcm9wZXJ0eQogIGRybS9pOTE1L2RwOiBBdHRh
Y2ggY29sb3JzcGFjZSBwcm9wZXJ0eQogIGRybS9pOTE1L2RwOiBQcm9ncmFtIGFuIEluZm9mcmFt
ZSBTRFAgSGVhZGVyIGFuZCBEQiBmb3IgSERSIFN0YXRpYwogICAgTWV0YWRhdGEKICBkcm0vaTkx
NS9kcDogQXR0YWNoIEhEUiBtZXRhZGF0YSBwcm9wZXJ0eSB0byBEUCBjb25uZWN0b3IKCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgICAgICB8ICAxMSArLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmggIHwgICAyIC0KIC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgMyArCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAxOTEgKysrKysrKysrKysrKysr
Ky0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICAgfCAgIDcg
KwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgIHwgICAxICsK
IDcgZmlsZXMgY2hhbmdlZCwgMTk5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
