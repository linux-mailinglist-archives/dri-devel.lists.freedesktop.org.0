Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4BEC37B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 14:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C426E223;
	Fri,  1 Nov 2019 13:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4620B6F7CE;
 Fri,  1 Nov 2019 13:05:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q70so9280305wme.1;
 Fri, 01 Nov 2019 06:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zi3i9mgv8VFMbmyTgvnufacfN7CC/6vf66SThdAH3gg=;
 b=EzIrxF4SCODaI4wN89djGHS9fa6fUKAAzxNFYNvK4Lo3SUVeuSjABgxdDTpTzEnOmO
 8T+48A2Ov1fDrygdPT6QiwQ2A4N+ngZq6bsJ1qr0TklZVexc+F5TzBOzYCnTE0oNTQyi
 /u16GMMqnWoyaqsAfvR2MU4XQGYNJtkNAuLcFU6kRBp6BPQ339vuR7UDowRPw29N3JwY
 SgS1Qv7n4E/8XTbcUEdZtbI+JMXuXP9aC1PfB1OuHephfNwGrgeMVEJwuKuec6PhLdkF
 moOeQAI9FuvBoTOTE4ho59QSbu17ijVQ0+YzGHPEYwGGVgkGn8R4FgFHJHfU8kgmYxmd
 P0XA==
X-Gm-Message-State: APjAAAWj2P99KcNcsUYbJWfp6JFgHs35tQR47Ko7X8sVAjeLyBRcJKvv
 on6kBJ7fBI23REeisDwNxkT5xeUG
X-Google-Smtp-Source: APXvYqxHh81AXEhkaU+ZJuif3t2u4n9b1mo4TV8GaOshHhflyXrrzKLGROCOWKFwqCyXZQ+4/LWXdQ==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr10501386wmq.142.1572613512233; 
 Fri, 01 Nov 2019 06:05:12 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id a15sm2450562wmm.12.2019.11.01.06.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 06:05:11 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Date: Fri,  1 Nov 2019 13:03:13 +0000
Message-Id: <20191101130313.8862-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101130313.8862-1-emil.l.velikov@gmail.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zi3i9mgv8VFMbmyTgvnufacfN7CC/6vf66SThdAH3gg=;
 b=gBBYmLhzaS3mgtcaUH+0inAH/OyO7/wNqobjUminYwAKDZfdlkihuKU2YM8RR25VMg
 U2/7BJXFGnLl5TrCJ0Cb9q0k6YnbhGdGT773Pw4lrhUtHoRt3dQfbi0k7IoobxxfHBuh
 CWUJz4doYZtTdqC1l+Pqqkk0sx6EqQa7PTYLC63liJ+Ik4ynQ/ZhPSwMNuYEjRYc6w1Z
 vLqkso1GnWlLmatO3q5/R5snDiJN+hMKhW1CuVjPbNjYlZxfwGmDYiTDcGnSuvnCVEdb
 u998azT2jzTEJA3u77fc3Zq1UYRdVGaaLI8Np4VnAxb3M2BHA66Hq6aBl1i8MKN7hP7z
 pVcQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 emil.l.velikov@gmail.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFzIG1lbnRp
b25lZCBieSBDaHJpc3RpYW4sIGZvciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQgb25seSBwcmltYXJ5
IG5vZGVzCnRoaXMgY2hhbmdlcyB0aGUgcmV0dXJuZWQgZXJyb3IgZnJvbSAtRUFDQ0VTIGludG8g
LUVPUE5PVFNVUFAvLUVOT1NZUy4KCkZvciBvdGhlcnMsIHRoaXMgY2hlY2sgaW4gcGFydGljdWxh
ciB3aWxsIGJlIGEgbm9vcC4gU28gbGV0J3MgcmVtb3ZlIGl0CmFzIHN1Z2dlc3RlZCBieSBDaHJp
c3RpYW4uCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpBY2tlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1faW9jdGwuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMKaW5kZXggZmNkNzI4ZDdjZjcyLi41YWZiMzk2
ODhiNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMKQEAgLTY1Miw4ICs2NTIsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9pb2N0bF9kZXNjIGRybV9pb2N0bHNbXSA9IHsKIAogCURSTV9JT0NUTF9ERUYo
RFJNX0lPQ1RMX01PREVfR0VUUkVTT1VSQ0VTLCBkcm1fbW9kZV9nZXRyZXNvdXJjZXMsIDApLAog
Ci0JRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfUFJJTUVfSEFORExFX1RPX0ZELCBkcm1fcHJpbWVf
aGFuZGxlX3RvX2ZkX2lvY3RsLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9D
VExfREVGKERSTV9JT0NUTF9QUklNRV9GRF9UT19IQU5ETEUsIGRybV9wcmltZV9mZF90b19oYW5k
bGVfaW9jdGwsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9ERUYoRFJN
X0lPQ1RMX1BSSU1FX0hBTkRMRV9UT19GRCwgZHJtX3ByaW1lX2hhbmRsZV90b19mZF9pb2N0bCwg
RFJNX1JFTkRFUl9BTExPVyksCisJRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfUFJJTUVfRkRfVE9f
SEFORExFLCBkcm1fcHJpbWVfZmRfdG9faGFuZGxlX2lvY3RsLCBEUk1fUkVOREVSX0FMTE9XKSwK
IAogCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX01PREVfR0VUUExBTkVSRVNPVVJDRVMsIGRybV9t
b2RlX2dldHBsYW5lX3JlcywgMCksCiAJRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfTU9ERV9HRVRD
UlRDLCBkcm1fbW9kZV9nZXRjcnRjLCAwKSwKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
