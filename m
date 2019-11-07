Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FEF32AD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23896E4A7;
	Thu,  7 Nov 2019 15:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338B26E101;
 Thu,  7 Nov 2019 15:17:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 07:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="230537095"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 07 Nov 2019 07:17:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 17:17:25 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/12] drm/i915: Gamma cleanups
Date: Thu,  7 Nov 2019 17:17:13 +0200
Message-Id: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Swati Sharma <swati2.sharma@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNv
bWUgcG9saXNoaW5ncyBhbmQgYXQgbGVhc3Qgb25lIG1pbm9yIGZpeCBmb3IgdGhlIGdhbW1hIHN0
dWZmLgoKVmlsbGUgU3lyasOkbMOkICgxMik6CiAgZHJtOiBJbmxpbmUgZHJtX2NvbG9yX2x1dF9l
eHRyYWN0KCkKICBkcm0vaTkxNTogUG9saXNoIENIViAubG9hZF9sdXRzKCkgYSBiaXQKICBkcm0v
aTkxNTogUG9saXNoIENIViBDR00gQ1NDIGxvYWRpbmcKICBkcm0vaTkxNTogQWRkIGk5eHhfbHV0
XzgoKQogIGRybS9pOTE1OiBDbGVhbiB1cCBpOXh4X2xvYWRfbHV0c19pbnRlcm5hbCgpCiAgZHJt
L2k5MTU6IFNwbGl0IGk5eHhfcmVhZF9sdXRfOCgpIHRvIGdtY2ggdnMuIGlsayB2YXJpYW50cwog
IGRybS9pOTE1OiBzL2Jsb2JfZGF0YS9sdXQvCiAgZHJtL2k5MTU6IHMvY2h2X3JlYWRfY2dtX2x1
dC9jaHZfcmVhZF9jZ21fZ2FtbWEvCiAgZHJtL2k5MTU6IENsZWFuIHVwIGludGVnZXIgdHlwZXMg
aW4gY29sb3IgY29kZQogIGRybS9pOTE1OiBSZWZhY3RvciBMVVQgcmVhZCBmdW5jdGlvbnMKICBk
cm0vaTkxNTogRml4IHJlYWRvdXQgb2YgUElQRUdDTUFYCiAgZHJtL2k5MTU6IFBhc3MgdGhlIGNy
dGMgdG8gdGhlIGxvdyBsZXZlbCByZWFkX2x1dCgpIGZ1bmNzCgogZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMgICAgICAgICAgIHwgIDI0IC0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2NvbG9yLmMgfCA0MzUgKysrKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgICAgfCAgIDEgLQogaW5jbHVkZS9kcm0v
ZHJtX2NvbG9yX21nbXQuaCAgICAgICAgICAgICAgIHwgIDIzICstCiA0IGZpbGVzIGNoYW5nZWQs
IDI1OCBpbnNlcnRpb25zKCspLCAyMjUgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
