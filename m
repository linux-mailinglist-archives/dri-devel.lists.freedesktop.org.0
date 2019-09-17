Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3584AB56A0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 22:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B2C6ED3A;
	Tue, 17 Sep 2019 20:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AC66ED3D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 20:04:46 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id j128so491416ywf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 13:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nMdir+4wc0r+lv8t9XS3cLWHW5eedtfrqJFQKbO33F8=;
 b=de9k18AbLuiWe19d7mkXl64x+Y0QLaI0Pk6VVUVyEFeGfs6E11TCUbfYbNHb0UjTNr
 vH4CcsuBg4tgRSJIKDpXgigjz8pwUhNnq4d4FOyCoHxaeEtYDs+UyxmAY5UsILLRqBIX
 oNGheSwNgu+pgkMAfOKpUK7RX1H+R+sQH8nhqpbx/M1arQiIoIPWCUNIBq1hb4ZiRAWh
 COFDVZAcl6WXrjFH7aAqaVzYUuB4WPhvCZGm5gmkmsw+GGTuyACOXioQPPVcwqbacVdr
 4/+4dr0yVoWElKHEiPGf6+EAV1a5NbuQmmxI+3YPJJR28X+jdPY1W7L5mF3fd40GQKoP
 nz5g==
X-Gm-Message-State: APjAAAXRRkNQ2hFAFLKuQkk23esItZKTu/OA1n0sKB6Dq7debhifTFCI
 OhnD+wcqN9x7GbDL0pOABjzsVXcQaleObg==
X-Google-Smtp-Source: APXvYqxPOeMzFJczyFHgHUBy3VTe53hzPlOGVNwJPG9FGUssWOnhzhB0XXHWQ+qT/jvsrOLzdE6DgA==
X-Received: by 2002:a0d:ddc9:: with SMTP id g192mr281875ywe.281.1568750685290; 
 Tue, 17 Sep 2019 13:04:45 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g128sm662175ywb.13.2019.09.17.13.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 13:04:44 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Fix kerneldoc and remove unused struct member in
 self_refresh helper
Date: Tue, 17 Sep 2019 16:04:32 -0400
Message-Id: <20190917200443.64481-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nMdir+4wc0r+lv8t9XS3cLWHW5eedtfrqJFQKbO33F8=;
 b=VFe5Z44hvTxwbrNhnPhV2ixBVjN+UtR9D0m58rIwDX564c4T5GtL3mUh4YSzkaSlMN
 Fm4kw/3fadrT838vC7ruNb0reoftZNtQgm6W1kFLWUP7sFB2Yp/OeOnNbIuv9lUihlYp
 R2gHbSV0jj8zAVk5YSJufi0yikraC9CKBOHudMKLsmnQ06xJyK43491xXVLmFZZy9H/Z
 S9xaP3q44AUG3CNytERm7R+TtjP7zYQcAAwOdxhMQ4DRTA81tGV4zTM/EcryTMCoNDmF
 gv4t/wqHhffA8f02gz5MWPwjX15+Jz6fYG8Vosr2Eo/MtgU6kxkVdZX/FbmeBg4P02Rt
 1mag==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, jekarl@iki.fi, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpBcnRpZmFjdHMgb2YgcHJl
dmlvdXMgcmV2aXNpb25zLgoKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMg
fCAxIC0KIGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgICAgICAgICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCmluZGV4IDRiOTQyNGE4ZjFmMS4uOTA5
NWNlYmYyMTQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9o
ZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYwpA
QCAtNTMsNyArNTMsNiBAQAogc3RydWN0IGRybV9zZWxmX3JlZnJlc2hfZGF0YSB7CiAJc3RydWN0
IGRybV9jcnRjICpjcnRjOwogCXN0cnVjdCBkZWxheWVkX3dvcmsgZW50cnlfd29yazsKLQlzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqc2F2ZV9zdGF0ZTsKIAl1bnNpZ25lZCBpbnQgZW50cnlfZGVs
YXlfbXM7CiB9OwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2NydGMuaAppbmRleCA3ZTI5NjNjYWQ1NDMuLjc0MmIzMTA0Mzg5OCAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5o
CkBAIC0xMTA3LDcgKzExMDcsNyBAQCBzdHJ1Y3QgZHJtX2NydGMgewogCS8qKgogCSAqIEBzZWxm
X3JlZnJlc2hfZGF0YTogSG9sZHMgdGhlIHN0YXRlIGZvciB0aGUgc2VsZiByZWZyZXNoIGhlbHBl
cnMKIAkgKgotCSAqIEluaXRpYWxpemVkIHZpYSBkcm1fc2VsZl9yZWZyZXNoX2hlbHBlcl9yZWdp
c3RlcigpLgorCSAqIEluaXRpYWxpemVkIHZpYSBkcm1fc2VsZl9yZWZyZXNoX2hlbHBlcl9pbml0
KCkuCiAJICovCiAJc3RydWN0IGRybV9zZWxmX3JlZnJlc2hfZGF0YSAqc2VsZl9yZWZyZXNoX2Rh
dGE7CiB9OwotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
