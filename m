Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75F84E99
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57288E33;
	Wed,  7 Aug 2019 14:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1336E710
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:21:25 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id s41so10203267ybe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+JE+XYSr4hrWGM0E5fzPKHjvNont2Ph+5BSjO+rqPo=;
 b=USWiLHxNs4qksbbj7LqtZH6MTInOSlgd/DDJpJ/YS8rIyqDGC4MQjq5Q0GKVczkcbi
 VzYwcSCejlJJ2eecM2abHN5EspF9z48kyGzeWjQwQQdTNee2qYt+fD1vb+IQG3CIdoru
 dJtnoXLNbGKunZyV0OANkCJQVsVecIAdopMVncFAUNa+tOgzH6lDsmxB4SkPMWr58sts
 scTIvMTfHpfAmqfMuyJnc+3ilcxJcQvf7nAF/6IZ/URNVussz6jZ3QPSczK46NSqxezA
 FokD11yLe/QRtAa3pw492NDCAc83l0kJ/v8A5KHjT4O8QZ62FMiT5vN0m+ALLa4TIstS
 uiSQ==
X-Gm-Message-State: APjAAAUjlt3kI6SnsaPQl915HB8mu5uQW4O5Kli8g2gTHy0mj0jzWO0S
 oTO159kxe+WR0BkAQzCzv5IUQ43PE64=
X-Google-Smtp-Source: APXvYqxaK//JKVcnPNwX7vyRuT0cMXrsViCFSQEO2vE09robUPPkzhwOixsUkwj906j8ArFAdC5rDA==
X-Received: by 2002:a25:cc55:: with SMTP id l82mr6901462ybf.218.1565187684525; 
 Wed, 07 Aug 2019 07:21:24 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d204sm20419451ywe.33.2019.08.07.07.21.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:21:24 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 4/5] Revert "drm/msm: drop DRM_AUTH usage from the driver"
Date: Wed,  7 Aug 2019 10:20:57 -0400
Message-Id: <20190807142101.251400-5-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
References: <20190807142101.251400-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+JE+XYSr4hrWGM0E5fzPKHjvNont2Ph+5BSjO+rqPo=;
 b=IAPkdTZE1e+AmuLU6yScuSsMbScIgzJnrOaOkRmR1SAVbqLhnQdf7yR8kASEeiOz39
 xFI4ZyGIy9ItmUsrQzHZXyjuOltwYzGOb7saY35074AZENEpc4AxlUK9lfVeV+Fpo+Gn
 nOleXOCkRONctM8MMqpmhvYfWqVEIBaxM5CAWmCJ6qGEYsK9kBGLka6kD5LhiQR6fr8+
 5dGCxLcwlYt6PKNDyXuoOMqq5IH/ro059sbYwnKflhzMqvIyYLBVAOxvgv3LSRSG/OpO
 gBIup91iwb2e203PuYm/XPoiTs+ZrcynWEuHf1PAe5I4++OuAcn+xVAlykRp0Y0tPRlU
 BfPw==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIHJldmVydHMgY29t
bWl0IDg4MjA5ZDJjNTAzNTczN2Y5NmJjZmMyZmQ3M2MwZmQ4ZDgwZTliZjEuCgpNYW5kYXRvcnkg
cmV2aWV3IHdhcyBtaXNzaW5nIGZyb20gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2Rydi5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKaW5kZXggZWEz
MzVjYTI1ZWNhLi5hYmY4ZjRlNGU1NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCkBAIC05ODQsMTcg
Kzk4NCwxNyBAQCBzdGF0aWMgaW50IG1zbV9pb2N0bF9zdWJtaXRxdWV1ZV9jbG9zZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9pb2N0bF9kZXNjIG1zbV9pb2N0bHNbXSA9IHsKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VU
X1BBUkFNLCAgICBtc21faW9jdGxfZ2V0X3BhcmFtLCAgICBEUk1fUkVOREVSX0FMTE9XKSwKLQlE
Uk1fSU9DVExfREVGX0RSVihNU01fR0VNX05FVywgICAgICBtc21faW9jdGxfZ2VtX25ldywgICAg
ICBEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX0lORk8sICAg
ICBtc21faW9jdGxfZ2VtX2luZm8sICAgICBEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExf
REVGX0RSVihNU01fR0VNX0NQVV9QUkVQLCBtc21faW9jdGxfZ2VtX2NwdV9wcmVwLCBEUk1fUkVO
REVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX0NQVV9GSU5JLCBtc21faW9j
dGxfZ2VtX2NwdV9maW5pLCBEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihN
U01fR0VNX1NVQk1JVCwgICBtc21faW9jdGxfZ2VtX3N1Ym1pdCwgICBEUk1fUkVOREVSX0FMTE9X
KSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fV0FJVF9GRU5DRSwgICBtc21faW9jdGxfd2FpdF9m
ZW5jZSwgICBEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX01B
RFZJU0UsICBtc21faW9jdGxfZ2VtX21hZHZpc2UsICBEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1f
SU9DVExfREVGX0RSVihNU01fU1VCTUlUUVVFVUVfTkVXLCAgIG1zbV9pb2N0bF9zdWJtaXRxdWV1
ZV9uZXcsICAgRFJNX1JFTkRFUl9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRl9EUlYoTVNNX1NVQk1J
VFFVRVVFX0NMT1NFLCBtc21faW9jdGxfc3VibWl0cXVldWVfY2xvc2UsIERSTV9SRU5ERVJfQUxM
T1cpLAotCURSTV9JT0NUTF9ERUZfRFJWKE1TTV9TVUJNSVRRVUVVRV9RVUVSWSwgbXNtX2lvY3Rs
X3N1Ym1pdHF1ZXVlX3F1ZXJ5LCBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RS
VihNU01fR0VUX1BBUkFNLCAgICBtc21faW9jdGxfZ2V0X3BhcmFtLCAgICBEUk1fQVVUSHxEUk1f
UkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX05FVywgICAgICBtc21f
aW9jdGxfZ2VtX25ldywgICAgICBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9D
VExfREVGX0RSVihNU01fR0VNX0lORk8sICAgICBtc21faW9jdGxfZ2VtX2luZm8sICAgICBEUk1f
QVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX0NQVV9Q
UkVQLCBtc21faW9jdGxfZ2VtX2NwdV9wcmVwLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwK
KwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX0NQVV9GSU5JLCBtc21faW9jdGxfZ2VtX2NwdV9m
aW5pLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01f
R0VNX1NVQk1JVCwgICBtc21faW9jdGxfZ2VtX3N1Ym1pdCwgICBEUk1fQVVUSHxEUk1fUkVOREVS
X0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fV0FJVF9GRU5DRSwgICBtc21faW9jdGxf
d2FpdF9mZW5jZSwgICBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVG
X0RSVihNU01fR0VNX01BRFZJU0UsICBtc21faW9jdGxfZ2VtX21hZHZpc2UsICBEUk1fQVVUSHxE
Uk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fU1VCTUlUUVVFVUVfTkVX
LCAgIG1zbV9pb2N0bF9zdWJtaXRxdWV1ZV9uZXcsICAgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExP
VyksCisJRFJNX0lPQ1RMX0RFRl9EUlYoTVNNX1NVQk1JVFFVRVVFX0NMT1NFLCBtc21faW9jdGxf
c3VibWl0cXVldWVfY2xvc2UsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NU
TF9ERUZfRFJWKE1TTV9TVUJNSVRRVUVVRV9RVUVSWSwgbXNtX2lvY3RsX3N1Ym1pdHF1ZXVlX3F1
ZXJ5LCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgdm1fb3BzID0gewotLSAKU2VhbiBQYXVsLCBTb2Z0d2Fy
ZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
