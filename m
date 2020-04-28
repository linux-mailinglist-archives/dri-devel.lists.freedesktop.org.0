Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E11BC664
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04006E87A;
	Tue, 28 Apr 2020 17:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381C96E876;
 Tue, 28 Apr 2020 17:20:13 +0000 (UTC)
IronPort-SDR: pPHusBaB4Q/iBURa6idPhCo6oQ1cPoe8vc87Pg+ZbBghW9ZrSr7tQ0diNGaqRI2odDaxPKLwH1
 9pIibjBmrdcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 10:20:12 -0700
IronPort-SDR: xoRL9G2Gvus0EpN5bJaLVMa2xVgrX5EWqc7wuNCNnkCJQZhoOmsLNRfqYq3wAa2VDN1od7qmQ2
 NNXbfHZ6tyKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="293925933"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 28 Apr 2020 10:20:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Apr 2020 20:20:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/16] drm: Shrink mode->type to u8
Date: Tue, 28 Apr 2020 20:19:30 +0300
Message-Id: <20200428171940.19552-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
References: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IG9ubHkgaGF2ZSA3IGJpdHMgZGVmaW5lZCBmb3IgbW9kZS0+dHlwZS4gU2hyaW5rIHRoZSBzdG9y
YWdlIHRvIHU4LgoKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
UmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+ClJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGluY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21v
ZGVzLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAppbmRleCAzNjI1ZTM2ODE0ODguLmY0NTA3
Yjk4NzAzOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX21vZGVzLmgKQEAgLTI3MCw3ICsyNzAsNyBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSB7CiAJICogICAgd2hpY2ggYXJlIHN0dWNrIGFyb3VuZCBmb3IgaHlzdGVyaWNhbCByYWlz
aW5zIG9ubHkuIE5vIG9uZSBoYXMgYW4KIAkgKiAgICBpZGVhIHdoYXQgdGhleSB3ZXJlIG1lYW50
IGZvci4gRG9uJ3QgdXNlLgogCSAqLwotCXVuc2lnbmVkIGludCB0eXBlOworCXU4IHR5cGU7CiAK
IAkvKioKIAkgKiBAY2xvY2s6Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
