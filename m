Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7044A19DF96
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22366EC8E;
	Fri,  3 Apr 2020 20:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C584C6EC82;
 Fri,  3 Apr 2020 20:40:37 +0000 (UTC)
IronPort-SDR: n02A1wSGFy4Ue1vMENPmwNQ1XKIHMUCsIh2rvvHouga+9D136oHfFx95+6eDIOdFcwVxo1lCLl
 dhzeHbbdGQjQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:40:37 -0700
IronPort-SDR: L+NAegkGZtgQXODjBRneGq0TsZwsyW6TwdX15ragod/3dvwzqzlWePcCSuJtkaxSaqHhGC6Ud7
 JGWVMsVEZvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="360635808"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 03 Apr 2020 13:40:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:34 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/17] drm: Shrink mode->type to u8
Date: Fri,  3 Apr 2020 23:39:57 +0300
Message-Id: <20200403204008.14864-7-ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IG9ubHkgaGF2ZSA3IGJpdHMgZGVmaW5lZCBmb3IgbW9kZS0+dHlwZS4gU2hyaW5rIHRoZSBzdG9y
YWdlIHRvIHU4LgoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX21vZGVzLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAppbmRleCAzNjI1ZTM2
ODE0ODguLmY0NTA3Yjk4NzAzOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKQEAgLTI3MCw3ICsyNzAsNyBAQCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSB7CiAJICogICAgd2hpY2ggYXJlIHN0dWNrIGFyb3VuZCBmb3IgaHlz
dGVyaWNhbCByYWlzaW5zIG9ubHkuIE5vIG9uZSBoYXMgYW4KIAkgKiAgICBpZGVhIHdoYXQgdGhl
eSB3ZXJlIG1lYW50IGZvci4gRG9uJ3QgdXNlLgogCSAqLwotCXVuc2lnbmVkIGludCB0eXBlOwor
CXU4IHR5cGU7CiAKIAkvKioKIAkgKiBAY2xvY2s6Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
