Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0584E98
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429956E711;
	Wed,  7 Aug 2019 14:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8F76E710
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:21:23 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id c9so4887931ybq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6V1Lx0DBek9QfLDvX9mvikhi8Anr2icsXghXv2KTZM=;
 b=mTc/qtUw2Ljt1REfVL0/CKwfY5+1Vew+fOpxfjhSosysrnK2gt3/idZs4309P+0pR8
 CHaLvj1TTNRAcKT+UtsA78yatI0/ZrgYSMpJN2aqhkoX0qZ+Cb5sfGdsxlJSE+iS7kXl
 S5vsejCcBE+cRk8Z1QU2G/B8Ln8KxzXJ9hTa7l05XPfEmfjBJwsFZog4r0nAoSgng4Xb
 WdSpT7leOe2zMypLcXkfszBYOJ7aXuSE2nL/G1Ls3+qDm88w4avV9PMx1zw0EgHykdkb
 DfyFcabc5slys2DPGf7gb81VfQz1JclGnxh3M+gOaFWXKe+jg/SatCnkJpMq5qrbtDCv
 Dvgg==
X-Gm-Message-State: APjAAAXjOejoGsMJPzVMn3QnGan6PTJ78yHQ8CgGE9ZgADi5n/Jv3E9r
 xLoNzKsNOL1QR7XxxyyNA9+Tf+iV5vk=
X-Google-Smtp-Source: APXvYqxRGLmm+SRsxIOFbKtzQiC8jJ1709Mxb3bD8GXt1RKXZnnLH+s9cmOSyyIpMlQyKBrLh2zLGw==
X-Received: by 2002:a5b:90d:: with SMTP id a13mr6974442ybq.101.1565187682664; 
 Wed, 07 Aug 2019 07:21:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d204sm20419451ywe.33.2019.08.07.07.21.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:21:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 3/5] Revert "drm/vgem: drop DRM_AUTH usage from the driver"
Date: Wed,  7 Aug 2019 10:20:56 -0400
Message-Id: <20190807142101.251400-4-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
References: <20190807142101.251400-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6V1Lx0DBek9QfLDvX9mvikhi8Anr2icsXghXv2KTZM=;
 b=Y/oA5i9JVyhfrnrrCc+Jj3pUWgytHtTDr4Lqn8ygu0qS/xjE+Y+j99c/yaFUOql94/
 dV8cxKYZCJd8in62xmDxdbeNnHwWknTNFU8Zw9eC+/iYJDWL6F+PkU5J6oeg22kc281n
 /dA47Z2vgM4thiKN4opnNFXcr+kivixrn3lo8E3wji5y2Fk97dNGYS3G+CI+ihHhomWD
 fABNwo44KIjfSVS59e9U3PsX8rByKLwuRVxfZLAIdOwnCWQO+9XycBOseW/Nz39pe6x6
 I5ugzp/rtxya8pai3oRO9fgrzFQRIZfwocOiAF5+14HpMDOd8cBH0Ya1TvHV/mwtak6c
 1l/Q==
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
bWl0IGU0ZWVlOTNkMjU3NzZkYTk5OGVjMmRmYWFiZTdkMjIwNjU5OGQyNmQuCgpNYW5kYXRvcnkg
cmV2aWV3IHdhcyBtaXNzaW5nIGZyb20gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3Zn
ZW1fZHJ2LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKaW5kZXggNWJkNjBkZWQzZDgxLi4xZDBj
Y2ZjYmM0NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwpAQCAtMjUzLDggKzI1Myw4IEBAIHN0
YXRpYyBpbnQgdmdlbV9nZW1fZHVtYl9tYXAoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogfQogCiBzdGF0aWMgc3RydWN0IGRybV9pb2N0bF9kZXNjIHZnZW1f
aW9jdGxzW10gPSB7Ci0JRFJNX0lPQ1RMX0RFRl9EUlYoVkdFTV9GRU5DRV9BVFRBQ0gsIHZnZW1f
ZmVuY2VfYXR0YWNoX2lvY3RsLCBEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RS
VihWR0VNX0ZFTkNFX1NJR05BTCwgdmdlbV9mZW5jZV9zaWduYWxfaW9jdGwsIERSTV9SRU5ERVJf
QUxMT1cpLAorCURSTV9JT0NUTF9ERUZfRFJWKFZHRU1fRkVOQ0VfQVRUQUNILCB2Z2VtX2ZlbmNl
X2F0dGFjaF9pb2N0bCwgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCisJRFJNX0lPQ1RMX0RF
Rl9EUlYoVkdFTV9GRU5DRV9TSUdOQUwsIHZnZW1fZmVuY2Vfc2lnbmFsX2lvY3RsLCBEUk1fQVVU
SHxEUk1fUkVOREVSX0FMTE9XKSwKIH07CiAKIHN0YXRpYyBpbnQgdmdlbV9tbWFwKHN0cnVjdCBm
aWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
