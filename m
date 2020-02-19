Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923716501D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A26ECAC;
	Wed, 19 Feb 2020 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0D06ECB6;
 Wed, 19 Feb 2020 20:36:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 12:36:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="229914824"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 19 Feb 2020 12:36:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2020 22:36:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] drm: Shrink mode->private_flags
Date: Wed, 19 Feb 2020 22:35:43 +0200
Message-Id: <20200219203544.31013-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmdt
YTUwMCBuZWVkcyA0IGJpdHMgKHRvIHN0b3JlIGEgcGl4ZWwgbXVsdGlwbGllcikgaW4gdGhlCm1v
ZGUtPnByaXZhdGVfZmxhZ3MsIGk5MTUgY3VycmVudGx5IGhhcyB0aHJlZSBiaXRzIGRlZmluZWQu
Ck5vIG9uZSBlbHNlIHVzZXMgdGhpcy4gUmVkdWNlIHRoZSBzaXplIHRvIHU4LgoKU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBpbmNsdWRlL2RybS9kcm1fbW9kZXMuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rl
cy5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKaW5kZXggYjU4NTA3NDk0NWI1Li5kYWRiMGYz
ZTViMGIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9tb2Rlcy5oCkBAIC0zNzgsNyArMzc4LDcgQEAgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgewogCSAqIGJ5IGF0b21pYyBkcml2ZXJzIHNpbmNlIHRoZXkgY2FuIHN0b3JlIGFueSBhZGRp
dGlvbmFsIGRhdGEgYnkKIAkgKiBzdWJjbGFzc2luZyBzdGF0ZSBzdHJ1Y3R1cmVzLgogCSAqLwot
CWludCBwcml2YXRlX2ZsYWdzOworCXU4IHByaXZhdGVfZmxhZ3M7CiAKIAkvKioKIAkgKiBAcGlj
dHVyZV9hc3BlY3RfcmF0aW86Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
