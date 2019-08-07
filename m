Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF3984E9B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6506E714;
	Wed,  7 Aug 2019 14:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1766E712
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:21:28 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id b143so32407733ywb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/676HaJdU+r4xHFqJxKddDqEourGEuCobhxkaMnJuCU=;
 b=WpQSZxYJISp0ihynqIljDi7YjlnaHEKSp+YUbe7clA/DMR5oqVBVlBuuTDUj8Fg40i
 yK0v+8jNiLiqIGj8W0MbpEfo8/aCGHRLWOgDME8bpc0d5c/bdQKHejPKOk15C/rzT9Ud
 tBclJ41dZN38pqikxM8GkNM9HouCVn0qKz1qUz+vsgcsy3GOq9rHkSsXP83DizOPpF/i
 DyZ42qiLHv0HS0Z2kmL7IMnTUDRM+DxNZFpS47cifGgMnKHwfkH7Y+QVZU25rISfNDlU
 hkFuJ8gBqmSx8JlAMHZe9/CcWgts6VBN4Zqr/ZCyyXevClGPfMmkOm24pK4Cms1llAaY
 ceBw==
X-Gm-Message-State: APjAAAUNW9XVGCVqy/OTZRY9YPwuN1S+qiOzGiHCFcJq8JIc74awCsD0
 xTHQx/Xs7RxYg7QCxTPVWXj8KydY+zg=
X-Google-Smtp-Source: APXvYqwjXBtKfCWlpCobL5Wb/vV5kiL5q4okELKCe5aPKkFihTEzN2zaRarnGt9UlEuIVOWvJm7JeQ==
X-Received: by 2002:a81:f00d:: with SMTP id p13mr6410579ywm.255.1565187686908; 
 Wed, 07 Aug 2019 07:21:26 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d204sm20419451ywe.33.2019.08.07.07.21.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:21:26 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 5/5] Revert "drm/nouveau: remove open-coded drm_invalid_op()"
Date: Wed,  7 Aug 2019 10:20:58 -0400
Message-Id: <20190807142101.251400-6-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
References: <20190807142101.251400-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/676HaJdU+r4xHFqJxKddDqEourGEuCobhxkaMnJuCU=;
 b=HfTnlhl23TduooI8YHDcq0Qc46xWCrMev8N1r9PT3tLMUOszNJZlti56C1iVzrcud1
 YYFqcp9//Dt2QB7ljBbHgalIhFHOlorSmpgp/ftxSGZGh6bvglZUXRnx1LbKGjiYrnQ0
 x2R67JKhsmH2pfQcNMGo0oopDjPvbSczFxjZWdx4yNiCN+M3tGIau5yyrtzavf3PV1y6
 lsutRGaIVkuiQ1g4iC7pZxi/26m3R0h6CTm6ImAAXZmeRkkxAaYvLOwZOJ2v58i2Tj2v
 gTQ+OERuCz/kXgCuyYDPjhi2KJWXB55cZoWbGlxNcnmHhl5uUK4YGexECrk8xaBbPmPi
 Yx3g==
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
bWl0IGNjZGFlNDI1NzU2OTVhYjQ0Mjk0MTMxMGJkNjdjN2VkMTcxNGUyNzMuCgpNYW5kYXRvcnkg
cmV2aWV3IHdhcyBtaXNzaW5nIGZyb20gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYWJpMTYuYyB8IDYgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2FiaTE2LmggfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMg
ICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5jCmluZGV4IGUyYmFlMTQyNDUw
Mi4uOTQzODdlNjJiMzM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2FiaTE2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5j
CkBAIC0yNDQsNiArMjQ0LDEyIEBAIG5vdXZlYXVfYWJpMTZfaW9jdGxfZ2V0cGFyYW0oQUJJMTZf
SU9DVExfQVJHUykKIAlyZXR1cm4gMDsKIH0KIAoraW50Citub3V2ZWF1X2FiaTE2X2lvY3RsX3Nl
dHBhcmFtKEFCSTE2X0lPQ1RMX0FSR1MpCit7CisJcmV0dXJuIC1FSU5WQUw7Cit9CisKIGludAog
bm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2FsbG9jKEFCSTE2X0lPQ1RMX0FSR1MpCiB7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmggYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmgKaW5kZXggNzBmNmFhNWM5ZGQxLi4x
OTU1NDY3MTliZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
YWJpMTYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmgKQEAg
LTYsNiArNiw3IEBACiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0
IGRybV9maWxlICpmaWxlX3ByaXYKIAogaW50IG5vdXZlYXVfYWJpMTZfaW9jdGxfZ2V0cGFyYW0o
QUJJMTZfSU9DVExfQVJHUyk7CitpbnQgbm91dmVhdV9hYmkxNl9pb2N0bF9zZXRwYXJhbShBQkkx
Nl9JT0NUTF9BUkdTKTsKIGludCBub3V2ZWF1X2FiaTE2X2lvY3RsX2NoYW5uZWxfYWxsb2MoQUJJ
MTZfSU9DVExfQVJHUyk7CiBpbnQgbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2ZyZWUoQUJJ
MTZfSU9DVExfQVJHUyk7CiBpbnQgbm91dmVhdV9hYmkxNl9pb2N0bF9ncm9ial9hbGxvYyhBQkkx
Nl9JT0NUTF9BUkdTKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCmluZGV4IDdl
MDQ1NTgwYTNhNC4uNTUxYzRlZTJjZWVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZHJtLmMKQEAgLTEwNDcsNyArMTA0Nyw3IEBAIG5vdXZlYXVfZHJtX3Bvc3RjbG9zZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZwcml2KQogc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1faW9jdGxfZGVzYwogbm91dmVhdV9pb2N0bHNbXSA9IHsKIAlEUk1fSU9DVExfREVG
X0RSVihOT1VWRUFVX0dFVFBBUkFNLCBub3V2ZWF1X2FiaTE2X2lvY3RsX2dldHBhcmFtLCBEUk1f
UkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihOT1VWRUFVX1NFVFBBUkFNLCBkcm1f
aW52YWxpZF9vcCwgRFJNX0FVVEh8RFJNX01BU1RFUnxEUk1fUk9PVF9PTkxZKSwKKwlEUk1fSU9D
VExfREVGX0RSVihOT1VWRUFVX1NFVFBBUkFNLCBub3V2ZWF1X2FiaTE2X2lvY3RsX3NldHBhcmFt
LCBEUk1fQVVUSHxEUk1fTUFTVEVSfERSTV9ST09UX09OTFkpLAogCURSTV9JT0NUTF9ERUZfRFJW
KE5PVVZFQVVfQ0hBTk5FTF9BTExPQywgbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2FsbG9j
LCBEUk1fUkVOREVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihOT1VWRUFVX0NIQU5ORUxf
RlJFRSwgbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2ZyZWUsIERSTV9SRU5ERVJfQUxMT1cp
LAogCURSTV9JT0NUTF9ERUZfRFJWKE5PVVZFQVVfR1JPQkpfQUxMT0MsIG5vdXZlYXVfYWJpMTZf
aW9jdGxfZ3JvYmpfYWxsb2MsIERSTV9SRU5ERVJfQUxMT1cpLAotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
