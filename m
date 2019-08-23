Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E99A4ED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 03:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0346E030;
	Fri, 23 Aug 2019 01:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768906E030;
 Fri, 23 Aug 2019 01:34:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 18:34:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="203614189"
Received: from helsinki.fi.intel.com ([10.237.66.174])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 18:34:57 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915/dp: Support for DP HDR outputs
Date: Fri, 23 Aug 2019 04:34:55 +0300
Message-Id: <20190823013501.14256-1-gwan-gyeong.mun@intel.com>
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
b21wb3NpdGUKCkd3YW4tZ3llb25nIE11biAoNik6CiAgZHJtL2k5MTUvZHA6IEV4dGVuZCBwcm9n
cmFtIG9mIFZTQyBIZWFkZXIgYW5kIERCIGZvciBDb2xvcmltZXRyeQogICAgRm9ybWF0CiAgZHJt
L2k5MTUvZHA6IEFkZCBzdXBwb3J0IG9mIEJULjIwMjAgQ29sb3JpbWV0cnkgdG8gRFAgTVNBCiAg
ZHJtOiBBZGQgRGlzcGxheVBvcnQgY29sb3JzcGFjZSBwcm9wZXJ0eQogIGRybS9pOTE1L2RwOiBB
dHRhY2ggY29sb3JzcGFjZSBwcm9wZXJ0eQogIGRybS9pOTE1L2RwOiBQcm9ncmFtIGFuIEluZm9m
cmFtZSBTRFAgSGVhZGVyIGFuZCBEQiBmb3IgSERSIFN0YXRpYwogICAgTWV0YWRhdGEKICBkcm0v
aTkxNS9kcDogQXR0YWNoIEhEUiBtZXRhZGF0YSBwcm9wZXJ0eSB0byBEUCBjb25uZWN0b3IKCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgICAgICB8ICAxMSArLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmggIHwgICAyIC0KIC4uLi9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAxODkgKysrKysrKysrKysr
KysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICAgfCAg
IDcgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgIHwgICAx
ICsKIDcgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
