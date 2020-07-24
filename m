Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D849222CE5C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 21:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7061F6E85D;
	Fri, 24 Jul 2020 19:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2246E85D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 19:07:22 +0000 (UTC)
IronPort-SDR: PPbfZ4plr/L/uKqN0lnklqtag5iHEh7rBAWIWq/ATcpHliWgbkwYnF4S39k8u2hiYFtKfcNFNK
 OB+ydwLaXwgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="152049758"
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="152049758"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 12:07:21 -0700
IronPort-SDR: zSExrlcZD7vK6l03JkmYmJYW9Mm+L6SnxsSbyuCnKai3zpf2gPwN5YHer8lAsmxUsRy0Zynlh6
 4nyWWxh4uHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="363454792"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 24 Jul 2020 12:07:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jul 2020 22:07:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/omap: Use {} to zero initialize the mode
Date: Fri, 24 Jul 2020 22:07:18 +0300
Message-Id: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Dave Airlie <airlied@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBmaXJzdCBtZW1iZXIgb2YgZHJtX2Rpc3BsYXlfbW9kZSBpcyBubyBsb25nZXIgYSBzdHJ1Y3R1
cmUsIGJ1dAp0aGUgY29kZSBpcyBzdGlsbCB1c2luZyB7ezB9fSB0byB6ZXJvIGluaXRpYWxpemUg
aXQuIE1ha2UgdGhhdCBqdXN0Cnt9IHNvIGl0IHdvcmtzIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBsaWVz
IGluc2lkZS4KCkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+CkNj
OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpGaXhlczogNDJhY2IwNmIw
MWIxICgiZHJtOiBwYWhvbGUgc3RydWN0IGRybV9kaXNwbGF5X21vZGUiKQpTaWduZWQtb2ZmLWJ5
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9jb25uZWN0b3IuYwppbmRleCA1Mjg3NjQ1NjZiMTcuLmRlOTVkYzFiODYxYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jCkBAIC04OSw3ICs4OSw3IEBA
IHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBvbWFwX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uCiAJCQkJIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlKQogewogCXN0cnVjdCBvbWFwX2Nvbm5lY3RvciAqb21hcF9jb25uZWN0b3IgPSB0b19vbWFw
X2Nvbm5lY3Rvcihjb25uZWN0b3IpOwotCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG5ld19tb2Rl
ID0geyB7IDAgfSB9OworCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG5ld19tb2RlID0ge307CiAJ
ZW51bSBkcm1fbW9kZV9zdGF0dXMgc3RhdHVzOwogCiAJc3RhdHVzID0gb21hcF9jb25uZWN0b3Jf
bW9kZV9maXh1cChvbWFwX2Nvbm5lY3Rvci0+b3V0cHV0LCBtb2RlLAotLSAKMi4yNi4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
