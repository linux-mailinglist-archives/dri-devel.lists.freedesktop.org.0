Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CA57DA7F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BEF6E51B;
	Thu,  1 Aug 2019 11:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814D16E513;
 Thu,  1 Aug 2019 11:41:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 04:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; d="scan'208";a="256622219"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga001.jf.intel.com with ESMTP; 01 Aug 2019 04:41:37 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v12 5/6] drm/i915: update the hdcp state with uevent
Date: Thu,  1 Aug 2019 17:11:18 +0530
Message-Id: <20190801114119.28830-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190801114119.28830-1-ramalingam.c@intel.com>
References: <20190801114119.28830-1-ramalingam.c@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtIGZ1bmN0aW9uIHRvIHVwZGF0ZSB0aGUgY29udGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IHN0
YXRlIGFuZCB0bwpnZW5lcmF0ZSBhIHVldmVudCBpcyBpbnZva2VkIGZyb20gdGhlIGludGVsIGhk
Y3AgcHJvcGVydHkgd29yay4KCkhlbmNlIHdoZW5ldmVyIGtlcm5lbCBjaGFuZ2VzIHRoZSBwcm9w
ZXJ0eSBzdGF0ZSwgdXNlcnNwYWNlIHdpbGwgYmUKdXBkYXRlZCB3aXRoIGEgdWV2ZW50LgoKdjI6
CiAgc3RhdGUgdXBkYXRlIGlzIG1vdmVkIGludG8gZHJtIGZ1bmN0aW9uIFtkYW5pZWxdCgpTaWdu
ZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpBY2tlZC1ieTogUGVr
a2EgUGFhbGFuZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgfCA4ICsrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMKaW5kZXggYTUyZjZlZjI5NTFlLi43MDRkZmJjY2Y3NzQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jCkBAIC04NzAsNyAr
ODcwLDYgQEAgc3RhdGljIHZvaWQgaW50ZWxfaGRjcF9wcm9wX3dvcmsoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQogCQkJCQkgICAgICAgcHJvcF93b3JrKTsKIAlzdHJ1Y3QgaW50ZWxfY29ubmVj
dG9yICpjb25uZWN0b3IgPSBpbnRlbF9oZGNwX3RvX2Nvbm5lY3RvcihoZGNwKTsKIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5iYXNlLmRldjsKLQlzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqc3RhdGU7CiAKIAlkcm1fbW9kZXNldF9sb2NrKCZkZXYtPm1vZGVfY29uZmln
LmNvbm5lY3Rpb25fbXV0ZXgsIE5VTEwpOwogCW11dGV4X2xvY2soJmhkY3AtPm11dGV4KTsKQEAg
LTg4MCwxMCArODc5LDkgQEAgc3RhdGljIHZvaWQgaW50ZWxfaGRjcF9wcm9wX3dvcmsoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQogCSAqIHRob3NlIHRvIFVOREVTSVJFRCBpcyBoYW5kbGVkIGJ5
IGNvcmUuIElmIHZhbHVlID09IFVOREVTSVJFRCwKIAkgKiB3ZSdyZSBydW5uaW5nIGp1c3QgYWZ0
ZXIgaGRjcCBoYXMgYmVlbiBkaXNhYmxlZCwgc28ganVzdCBleGl0CiAJICovCi0JaWYgKGhkY3At
PnZhbHVlICE9IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9VTkRFU0lSRUQpIHsKLQkJc3Rh
dGUgPSBjb25uZWN0b3ItPmJhc2Uuc3RhdGU7Ci0JCXN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24g
PSBoZGNwLT52YWx1ZTsKLQl9CisJaWYgKGhkY3AtPnZhbHVlICE9IERSTV9NT0RFX0NPTlRFTlRf
UFJPVEVDVElPTl9VTkRFU0lSRUQpCisJCWRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rp
b24oJmNvbm5lY3Rvci0+YmFzZSwKKwkJCQkJCSAgIGhkY3AtPnZhbHVlKTsKIAogCW11dGV4X3Vu
bG9jaygmaGRjcC0+bXV0ZXgpOwogCWRybV9tb2Rlc2V0X3VubG9jaygmZGV2LT5tb2RlX2NvbmZp
Zy5jb25uZWN0aW9uX211dGV4KTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
