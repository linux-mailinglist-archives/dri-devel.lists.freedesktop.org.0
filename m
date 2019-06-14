Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45BD465CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 19:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DAC89A32;
	Fri, 14 Jun 2019 17:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AF689A32;
 Fri, 14 Jun 2019 17:35:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f17so594076wme.2;
 Fri, 14 Jun 2019 10:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNJfkEuMYhEwSthauk+Wp2OmCzQgIDnt7UR4PLu0tKg=;
 b=EmGkDwAJIyhkPdM9Cys66Fk0OglWH52i5eCnTxwC3meGUKAVLZV4znBBWmYJfHbxVR
 XdCbg2mzk/wBpUV71wn8jEvNVkiA8+j92Uq23XVy3bLT1M6HIrMtH3+e+09Ds8FAeBeV
 QMKvfoBSexHGKK3Q1LoANVi/S/gzM5l4A3g6XzN1yqRSAr+MRWny4EUyUCGzchfYE3wy
 0zg2+w2dfu7GCRkCl0oo+XnJ0BqESGuLIUbkwY0lZRzHLEPkHsic+aAefVP7HyfJ/56A
 WLgkrFVoGTUODBJ9XalSA9LlBbTFbNOC3qAAkTI02O3lpg0ooNYVVsScrLhHelZjioIR
 LZ5g==
X-Gm-Message-State: APjAAAWF8qFfAske7mXZse7cNCnRby94h+1BDztyBsL37vTTG2Sn9KwZ
 svWDrLkJS5FJros1nRQHzSOGu9YB
X-Google-Smtp-Source: APXvYqwsz8dS9aTyz7A34MT9FBSuU2gKT1Radv05A99uwRvphJLvWCIGepqvAzTEYDYMlGqpebZgSA==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr3584708wme.81.1560533743860; 
 Fri, 14 Jun 2019 10:35:43 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id a81sm5628960wmh.3.2019.06.14.10.35.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:35:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: extend AMDGPU_CTX_PRIORITY_NORMAL comment
Date: Fri, 14 Jun 2019 18:33:35 +0100
Message-Id: <20190614173335.30907-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNJfkEuMYhEwSthauk+Wp2OmCzQgIDnt7UR4PLu0tKg=;
 b=tj1hnAQN10SgBZ0riI3o8/amCboNepl/OAxZ9Ipz94c4/h9nRe87wfXhRiX+1Y50f7
 Rzas58aDmwFk/SRtXAGTlduIq6YWhIMysB9DsgOScntXRq4UAB8cNbRQ/yrSRucY8MG9
 dhxFTDPQ3oyn6Mv8Tcqr0vIRc6GGKazfvZf/hygnq2uA5iyY3rTlAusbnGal7/pVxtU1
 8N4RMPZ+ul8EFACKZUEdhRE3OY5TfkSMLkpIRvtUTxXz4wPD8CzuqUeJV7ysrCHOVPIb
 bY0DSRNiadqnql+j3kq+/rWDuBmjWA1h10n7BxB7klwLwKkVMEM79tp/AZt8/J4j5eqU
 WFpw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkN1cnJlbnRs
eSB0aGUgQU1ER1BVX0NUWF9QUklPUklUWV8qIGRlZmluZXMgYXJlIHVzZWQgaW4gYm90aApkcm1f
YW1kZ3B1X2N0eF9pbjo6cHJpb3JpdHkgYW5kIGRybV9hbWRncHVfc2NoZWRfaW46OnByaW9yaXR5
LgoKRXh0ZW5kIHRoZSBjb21tZW50IHRvIG1lbnRpb24gdGhlIENBUF9TWVNfTklDRSBvciBEUk1f
TUFTVEVSIHJlcXVpcmVtZW50CmlzIG9ubHkgYXBwbGljYWJsZSB3aXRoIHRoZSBmb3JtZXIuCgpD
YzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgpDYzogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgotLS0KTWlsZGx5IGN1cmlvdXM6IHdoeSBkaWRuJ3Qg
b25lIGV4dGVuZCBjdHhfYW1kZ3B1X2N0eCBpbnN0ZWFkIG9mIGFkZGluZwpkcm1fYW1kZ3B1X3Nj
aGVkPyBOZXcgZmxhZyArIF91MzIgZmQgYXQgdGhlIGVuZCAoZm9yIHRoZSBmb3JtZXIpIHdvdWxk
CmhhdmUgYmVlbiBlbm91Z2ggKGFuZCB0d2Vha2luZyB0aGUgaW9jdGwgcGVybWlzc2lvbiB0aGlu
Z3kpLgoKU3BlYWtpbmcgb2YgZmxhZ3MsIGRybV9hbWRncHVfc2NoZWRfaW4gbG9zdCBpdHMgc28g
ZXh0ZW5kaW5nIGl0IHdpbGwKYmUgImZ1biIKLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9k
cm0uaCB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIGIvaW5j
bHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKaW5kZXggNDc4ODczMGRiZTc4Li5kZmIxMGZiYTJm
ZTggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCisrKyBiL2luY2x1
ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCkBAIC0yMTksNyArMjE5LDEwIEBAIHVuaW9uIGRybV9h
bWRncHVfYm9fbGlzdCB7CiAjZGVmaW5lIEFNREdQVV9DVFhfUFJJT1JJVFlfVkVSWV9MT1cgICAg
LTEwMjMKICNkZWZpbmUgQU1ER1BVX0NUWF9QUklPUklUWV9MT1cgICAgICAgICAtNTEyCiAjZGVm
aW5lIEFNREdQVV9DVFhfUFJJT1JJVFlfTk9STUFMICAgICAgMAotLyogU2VsZWN0aW5nIGEgcHJp
b3JpdHkgYWJvdmUgTk9STUFMIHJlcXVpcmVzIENBUF9TWVNfTklDRSBvciBEUk1fTUFTVEVSICov
CisvKgorICogV2hlbiB1c2VkIGluIHN0cnVjdCBkcm1fYW1kZ3B1X2N0eF9pbiwgYSBwcmlvcml0
eSBhYm92ZSBOT1JNQUwgcmVxdWlyZXMKKyAqIENBUF9TWVNfTklDRSBvciBEUk1fTUFTVEVSCisq
LwogI2RlZmluZSBBTURHUFVfQ1RYX1BSSU9SSVRZX0hJR0ggICAgICAgIDUxMgogI2RlZmluZSBB
TURHUFVfQ1RYX1BSSU9SSVRZX1ZFUllfSElHSCAgIDEwMjMKIApAQCAtMjI5LDYgKzIzMiw3IEBA
IHN0cnVjdCBkcm1fYW1kZ3B1X2N0eF9pbiB7CiAJLyoqIEZvciBmdXR1cmUgdXNlLCBubyBmbGFn
cyBkZWZpbmVkIHNvIGZhciAqLwogCV9fdTMyCWZsYWdzOwogCV9fdTMyCWN0eF9pZDsKKwkvKiog
QU1ER1BVX0NUWF9QUklPUklUWV8qICovCiAJX19zMzIJcHJpb3JpdHk7CiB9OwogCkBAIC0yODEs
NiArMjg1LDcgQEAgc3RydWN0IGRybV9hbWRncHVfc2NoZWRfaW4gewogCS8qIEFNREdQVV9TQ0hF
RF9PUF8qICovCiAJX191MzIJb3A7CiAJX191MzIJZmQ7CisJLyoqIEFNREdQVV9DVFhfUFJJT1JJ
VFlfKiAqLwogCV9fczMyCXByaW9yaXR5OwogCV9fdTMyICAgY3R4X2lkOwogfTsKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
