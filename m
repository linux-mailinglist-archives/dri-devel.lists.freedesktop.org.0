Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB919DF8E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F005B6EC85;
	Fri,  3 Apr 2020 20:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21E46EC82;
 Fri,  3 Apr 2020 20:40:34 +0000 (UTC)
IronPort-SDR: 5kWI7dwZqA0Acg2XGukJ5lCShdhelFQRUBHsSP7uPSu8MkmlP89pl912b0C52PW+VhdO/KiZCU
 yb/a7nAClg4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:40:34 -0700
IronPort-SDR: FPKPGbqOuFzQbavUJ6QjYLgSFQ1CjJ6QvcMU32BuSgYfbLMlKc9SDWwmduQUt4IhMnvDGsEP5y
 PeywgExjNVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="243555071"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 03 Apr 2020 13:40:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/17] drm: Shrink {width,height}_mm to u16
Date: Fri,  3 Apr 2020 23:39:56 +0300
Message-Id: <20200403204008.14864-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklu
c3RlYWQgb2Ygc3VwcG9ydGluZyB+MjAwMGttIHdpZGUgZGlzcGxheWVzIGxldCdzIGxpbWl0IG91
cnNlbHZlcwp0byB+NjVtLiBUaGF0IHNlZW1zIHBsZW50eSBiaWcgZW5vdWdoIHRvIG1lLgoKRXZl
biB3aXRoIEVESURfUVVJUktfREVUQUlMRURfSU5fQ00gRURJRHMgc2VlbSB0byBiZSBsaW1pdGVk
IHRvCjEwKjB4ZmZmIHdoaWNoIGZpdHMgaW50byB0aGUgMTYgYml0cy4KClJldmlld2VkLWJ5OiBF
bWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGluY2x1
ZGUvZHJtL2RybV9tb2Rlcy5oIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5o
IGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKaW5kZXggOGIwNWYzNzA1ZDBlLi4zNjI1ZTM2ODE0
ODggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9tb2Rlcy5oCkBAIC0zMzAsNyArMzMwLDcgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
ewogCSAqIEFkZHJlc3NhYmxlIHNpemUgb2YgdGhlIG91dHB1dCBpbiBtbSwgcHJvamVjdG9ycyBz
aG91bGQgc2V0IHRoaXMgdG8KIAkgKiAwLgogCSAqLwotCWludCB3aWR0aF9tbTsKKwl1MTYgd2lk
dGhfbW07CiAKIAkvKioKIAkgKiBAaGVpZ2h0X21tOgpAQCAtMzM4LDcgKzMzOCw3IEBAIHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlIHsKIAkgKiBBZGRyZXNzYWJsZSBzaXplIG9mIHRoZSBvdXRwdXQg
aW4gbW0sIHByb2plY3RvcnMgc2hvdWxkIHNldCB0aGlzIHRvCiAJICogMC4KIAkgKi8KLQlpbnQg
aGVpZ2h0X21tOworCXUxNiBoZWlnaHRfbW07CiAKIAkvKioKIAkgKiBAY3J0Y19jbG9jazoKLS0g
CjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
