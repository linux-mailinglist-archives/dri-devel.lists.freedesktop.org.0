Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F92B45A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9330C89E06;
	Mon, 27 May 2019 12:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4FE896E9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 04:51:25 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id s11so8827790pfm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 21:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+pghJ3QtYkbMJ3TCzTPXHLJ/5p1F8C3Os/Bvo/JdKfg=;
 b=c55IJhJBqMPjSc0M4LUXgxRAXpCv7xjmOakqB9epree1wWrCtP7qSwKzkuJCeETIus
 LkL71LaXa5IrMMsbveorliFeh8dKMM/qolWg2qGD8uXc5+NXKg4eqbY1zfhtTZVa40Od
 aR9Kxi6NsSG/tkObOVTNtGHg3CLDA3eAtd3KrAef9sRuUPMhKS88dtV2iN7amuw9ORcm
 MlnToPXUqhenhwHXUUIT4WIvi/Kymgq+ND+zQYdC6k59W/xobyoyUN0k+jfazR7mepXW
 mLzIy5Jjz92XL8BQwBvtRiDP6AgTWQCCa8+GCmbo7Kup1M+TF/ywpApIAFubQuRcQpMo
 bUyQ==
X-Gm-Message-State: APjAAAVLW1MO68klMZTYdC9lVGycugKNNEnE21xXbI7pu9dEP8C+5NpN
 wUT8Rxe3rf6cWO5X1Wb+iKGryQ==
X-Google-Smtp-Source: APXvYqwh/5/rhXpwbURGFIHVfZLO0fYXK7K8Mlv98GJtnZi4raWyoWkb3AtxYitbz76kcJUga2aqBw==
X-Received: by 2002:a17:90a:2e89:: with SMTP id
 r9mr28510768pjd.117.1558932685483; 
 Sun, 26 May 2019 21:51:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id t18sm8082745pgm.69.2019.05.26.21.51.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 26 May 2019 21:51:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] fix mediatek drm, dis, and disp-* unbind/bind
Date: Mon, 27 May 2019 12:50:51 +0800
Message-Id: <20190527045054.113259-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+pghJ3QtYkbMJ3TCzTPXHLJ/5p1F8C3Os/Bvo/JdKfg=;
 b=SEIZZEXrBAFGXzBgVAyoamK5sJIK5UZGppPItkKO+xGbuTud9szjLsxir/q5ZtHRrY
 A6F0w/RQHS5wiv/Nho1yKYDHxKHYaA5JpGEmYIpfAcbYpjfIzRVJNrpN6iaLC2IHuAsV
 aCbVQcAzDSmQyKMwyqZftwxAW5d/ld3/Cj9C4=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHNvbWUgZXJyb3JzIHdoZW4gdW5iaW5kaW5nIGFuZCByZWJpbmRpbmcgbWVkaWF0
ZWsgZHJtLCBkc2ksCmFuZCBkaXNwLSogZHJpdmVycy4gVGhpcyBzZXJpZXMgaXMgdG8gZml4IHRo
b3NlIGVycm9ycyBhbmQgd2FybmluZ3MuCgpIc2luLVlpIFdhbmcgKDMpOgogIGRybTogbWVkaWF0
ZWs6IGZpeCB1bmJpbmQgZnVuY3Rpb25zCiAgZHJtOiBtZWRpYXRlazogcmVtb3ZlIGNsa191bnBy
ZXBhcmUoKSBpbiBtdGtfZHJtX2NydGNfZGVzdHJveSgpCiAgZHJtOiBtZWRpYXRlazogdW5iaW5k
IGNvbXBvbmVudHMgaW4gbXRrX2RybV91bmJpbmQoKQoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2NydGMuYyB8IDQgLS0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMgIHwgOCArKystLS0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YyAgICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
