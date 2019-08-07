Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695E8510F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE2B6E73B;
	Wed,  7 Aug 2019 16:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B786E73B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:28:11 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x188so10440163yba.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 09:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYvZGkHOaihaigm5rL3EImQRvyjpb6QJpC+K8+RHlbE=;
 b=Wfe4xF138fsBNQ1Z+TN7md8z8gYuBfhIPJzU3r3RaoH0Cs0addJxpu6n9ma/XoyyhK
 R+z9fDkJofE9/wTjJHR3blMcqXBYpIpucXKb9W3dIMCiblG3M4CyXX+s5Yiu+UqiVP5X
 ma3zZgK8dOerQ+l0I2Eb3xkN6HpwaYnUalV1CxC1Soh4TUQ6iIyheEn1PHsFbMawO/IU
 tG66cEaG1I7aaCpsMGVh+cLv2xT96v80YBTqBsMSjLvR3ew1bq8Nr7hL4kPx+RVPuOd2
 /HqbMK5AzegN6QM5cNuXfjDPkc8evWtRjgEM3RXW6/YzpymtEqkCKO/aMuTqo1YEC7ZH
 TP2A==
X-Gm-Message-State: APjAAAWPnhRTTM1aiQKlZBFUz2X7dRnUH1vDkMSSEpj9GA+xJkddQzVs
 STEALbki603AHDkvRLC2aX9LS7zpl3o=
X-Google-Smtp-Source: APXvYqy+2y9U1lCgZrzjw3RzFW75g/HyRatNEZlKjNjzoegcC2BB6kRsZBujeDod52eRLa+baqzZnQ==
X-Received: by 2002:a5b:10d:: with SMTP id 13mr6382921ybx.231.1565195290306;
 Wed, 07 Aug 2019 09:28:10 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v135sm20912022ywc.53.2019.08.07.09.28.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 09:28:09 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix kerneldoc warns in connector-related docs
Date: Wed,  7 Aug 2019 12:28:04 -0400
Message-Id: <20190807162808.119141-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYvZGkHOaihaigm5rL3EImQRvyjpb6QJpC+K8+RHlbE=;
 b=Rqx9YxQ451O8S1Nhr0PfsGcZCZ7Wl0rVtB62SWBAE+qgyyvcvDE/uOTUji0bFst0nS
 glQgtoN2/3q8yUgKu+6JBEnQg1Ekyp6OIbObYYfQg8QzxV8CGjli0pmz6aTiqNbil2b0
 n/FhI3KiM6cxi8vKmVE2QCJRRh/xk7HYDwF0sDmTMqfFZ1E2veFyWC/QJbrwxAJlobSE
 nqGdHRT/zLsWGHwsBkbtbqZsdAT78IXqLG6Me99QpuZOd6KoKzgsWdTAMIWUUbYLmdLl
 GX7o/xQDpJGabVGxjc/thxG0PmJnV4oomiMaOFZPLUHmvlaRvSYHh1c5bpoUhT2azU01
 UwhQ==
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
Cc: Sean Paul <sean@poorly.run>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgouLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jOjk4OTogV0FS
TklORzogVW5leHBlY3RlZCBpbmRlbnRhdGlvbi4KLi4vZHJpdmVycy9ncHUvZHJtL2RybV9jb25u
ZWN0b3IuYzo5OTM6IFdBUk5JTkc6IFVuZXhwZWN0ZWQgaW5kZW50YXRpb24uCi4uL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaDo1NDQ6IFdBUk5JTkc6IElubGluZSBpbnRlcnByZXRlZCB0ZXh0
IG9yIHBocmFzZSByZWZlcmVuY2Ugc3RhcnQtc3RyaW5nIHdpdGhvdXQgZW5kLXN0cmluZy4KLi4v
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oOjU0NDogV0FSTklORzogSW5saW5lIGludGVycHJl
dGVkIHRleHQgb3IgcGhyYXNlIHJlZmVyZW5jZSBzdGFydC1zdHJpbmcgd2l0aG91dCBlbmQtc3Ry
aW5nLgoKRml4ZXM6IDFiMjdmYmRkZTFkZiAoImRybTogQWRkIGRybV9hdG9taWNfZ2V0XyhvbGR8
bmV3KV9jb25uZWN0b3JfZm9yX2VuY29kZXIoKSBoZWxwZXJzIikKRml4ZXM6IGJiNWE0NWQ0MGQ1
MCAoImRybS9oZGNwOiB1cGRhdGUgY29udGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IHdpdGggdWV2
ZW50IikKQ2M6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFs
YW5lbkBjb2xsYWJvcmEuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpD
YzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDEwICsrKysrKy0tLS0KIGluY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaCAgICAgfCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCAzNTQ3
OThiYWQ1NzYuLjRjNzY2NjI0YjIwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC05ODYs
MTIgKzk4NiwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9wX2VudW1fbGlzdCBoZG1p
X2NvbG9yc3BhY2VzW10gPSB7CiAgKgktIEtlcm5lbCBzZW5kcyB1ZXZlbnQgd2l0aCB0aGUgY29u
bmVjdG9yIGlkIGFuZCBwcm9wZXJ0eSBpZCB0aHJvdWdoCiAgKgkgIEBkcm1faGRjcF91cGRhdGVf
Y29udGVudF9wcm90ZWN0aW9uLCB1cG9uIGJlbG93IGtlcm5lbCB0cmlnZ2VyZWQKICAqCSAgc2Nl
bmFyaW9zOgotICoJCURFU0lSRUQgLT4gRU5BQkxFRAkoYXV0aGVudGljYXRpb24gc3VjY2VzcykK
LSAqCQlFTkFCTEVEIC0+IERFU0lSRUQJKHRlcm1pbmF0aW9uIG9mIGF1dGhlbnRpY2F0aW9uKQor
ICoKKyAqCQktIERFU0lSRUQgLT4gRU5BQkxFRCAoYXV0aGVudGljYXRpb24gc3VjY2VzcykKKyAq
CQktIEVOQUJMRUQgLT4gREVTSVJFRCAodGVybWluYXRpb24gb2YgYXV0aGVudGljYXRpb24pCiAg
KgktIFBsZWFzZSBub3RlIG5vIHVldmVudHMgZm9yIHVzZXJzcGFjZSB0cmlnZ2VyZWQgcHJvcGVy
dHkgc3RhdGUgY2hhbmdlcywKICAqCSAgd2hpY2ggY2FuJ3QgZmFpbCBzdWNoIGFzCi0gKgkJREVT
SVJFRC9FTkFCTEVEIC0+IFVOREVTSVJFRAotICoJCVVOREVTSVJFRCAtPiBERVNJUkVECisgKgor
ICoJCS0gREVTSVJFRC9FTkFCTEVEIC0+IFVOREVTSVJFRAorICoJCS0gVU5ERVNJUkVEIC0+IERF
U0lSRUQKICAqCS0gVXNlcnNwYWNlIGlzIHJlc3BvbnNpYmxlIGZvciBwb2xsaW5nIHRoZSBwcm9w
ZXJ0eSBvciBsaXN0ZW4gdG8gdWV2ZW50cwogICoJICB0byBkZXRlcm1pbmUgd2hlbiB0aGUgdmFs
dWUgdHJhbnNpdGlvbnMgZnJvbSBFTkFCTEVEIHRvIERFU0lSRUQuCiAgKgkgIFRoaXMgc2lnbmlm
aWVzIHRoZSBsaW5rIGlzIG5vIGxvbmdlciBwcm90ZWN0ZWQgYW5kIHVzZXJzcGFjZSBzaG91bGQK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaAppbmRleCAwYjk5OTdlMjc2ODkuLmUzOTFmOWMwNWY5OCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaApAQCAtNTQzLDggKzU0Myw4IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlIHsK
IAkgKgogCSAqIFRoaXMgaXMgYWxzbyB1c2VkIGluIHRoZSBhdG9taWMgaGVscGVycyB0byBtYXAg
ZW5jb2RlcnMgdG8gdGhlaXIKIAkgKiBjdXJyZW50IGFuZCBwcmV2aW91cyBjb25uZWN0b3JzLCBz
ZWUKLQkgKiAmZHJtX2F0b21pY19nZXRfb2xkX2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcigpIGFuZAot
CSAqICZkcm1fYXRvbWljX2dldF9uZXdfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKCkuCisJICogJmRy
bV9hdG9taWNfZ2V0X29sZF9jb25uZWN0b3JfZm9yX2VuY29kZXIgYW5kCisJICogJmRybV9hdG9t
aWNfZ2V0X25ld19jb25uZWN0b3JfZm9yX2VuY29kZXIuCiAJICoKIAkgKiBOT1RFOiBBdG9taWMg
ZHJpdmVycyBtdXN0IGZpbGwgdGhpcyBvdXQgKGVpdGhlciB0aGVtc2VsdmVzIG9yIHRocm91Z2gK
IAkgKiBoZWxwZXJzKSwgZm9yIG90aGVyd2lzZSB0aGUgR0VUQ09OTkVDVE9SIGFuZCBHRVRFTkNP
REVSIElPQ1RMcyB3aWxsCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUg
LyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
