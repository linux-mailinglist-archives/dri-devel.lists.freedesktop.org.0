Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86ABDFC2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD77891C7;
	Wed, 25 Sep 2019 14:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD56F891B1;
 Wed, 25 Sep 2019 14:14:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 07:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193778312"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 25 Sep 2019 07:14:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Sep 2019 17:14:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/dp/mst: Reduce nested ifs
Date: Wed, 25 Sep 2019 17:14:40 +0300
Message-Id: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIG5lc3RlZCBpZnMgd2l0aCBhIHNpbmdsZSBpZiBhbmQgYSBsb2dpY2FsIEFORC4K
CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCmluZGV4IDk3MjE2MDk5YTcxOC4uZTI1NTk3ZWIzY2ExIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTExMjMsMTEgKzExMjMsMTEgQEAgc3RhdGlj
IHZvaWQgZHJtX2RwX21zdF9wdXRfcGF5bG9hZF9pZChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1nciwKIAljbGVhcl9iaXQodmNwaSAtIDEsICZtZ3ItPnZjcGlfbWFzayk7CiAKIAlm
b3IgKGkgPSAwOyBpIDwgbWdyLT5tYXhfcGF5bG9hZHM7IGkrKykgewotCQlpZiAobWdyLT5wcm9w
b3NlZF92Y3Bpc1tpXSkKLQkJCWlmIChtZ3ItPnByb3Bvc2VkX3ZjcGlzW2ldLT52Y3BpID09IHZj
cGkpIHsKLQkJCQltZ3ItPnByb3Bvc2VkX3ZjcGlzW2ldID0gTlVMTDsKLQkJCQljbGVhcl9iaXQo
aSArIDEsICZtZ3ItPnBheWxvYWRfbWFzayk7Ci0JCQl9CisJCWlmIChtZ3ItPnByb3Bvc2VkX3Zj
cGlzW2ldICYmCisJCSAgICBtZ3ItPnByb3Bvc2VkX3ZjcGlzW2ldLT52Y3BpID09IHZjcGkpIHsK
KwkJCW1nci0+cHJvcG9zZWRfdmNwaXNbaV0gPSBOVUxMOworCQkJY2xlYXJfYml0KGkgKyAxLCAm
bWdyLT5wYXlsb2FkX21hc2spOworCQl9CiAJfQogCW11dGV4X3VubG9jaygmbWdyLT5wYXlsb2Fk
X2xvY2spOwogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
