Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4F22859
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 20:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318BB891B1;
	Sun, 19 May 2019 18:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02E891D5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 18:36:50 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 188so10390799ljf.9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 11:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iPEv3MWRBjIT/z6bKnMY4PWDy/PJB9/cY885lupLFXQ=;
 b=faDExcDVyu1B0kGccvooTCucZE/xo9MK/BHsisnqMHyDkp0fPjcv8zb6DrMiMw9uh4
 7lH21/tcrm38b3QCG7HNynQER3jl0ZNy+rKRJPh3xSkelSWqZ77TGERrCk0aIJ+16mXy
 OO/mH2l+jAUbof+XnUp46n4J+naB//Ys9GHGgcuq0AHaE93+aJRN/UxlUBg6V9sNFsk6
 RIw1nx2R44w9gHjntC34MVInIYTXO2HtROmficd6P78mDQNcMCi78/dPHruEcfpEC+xi
 UGHKX1SBBEfaaSd4UhXxo30w+jey1hGyC9jHz2vU0MJ9AA18rXhOwU5gk8Yi2r1dSOlM
 f2Lg==
X-Gm-Message-State: APjAAAWFt4CQbVLYLxJCNfzlrsM3aFu31hGQO3LK39eKY+aVDfba+23F
 mSCl5ZrvaMOuL7iPUu/LrHbt3842MuY=
X-Google-Smtp-Source: APXvYqw3BOqtwBDWatJMS79rHwEkI4s80VIwz9ytgVPb4ZsI7A3vyHZTaaIqmBSkR+HU4nuRw4kkwQ==
X-Received: by 2002:a2e:1b8a:: with SMTP id c10mr34801905ljf.139.1558291008952; 
 Sun, 19 May 2019 11:36:48 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q65sm2832544lje.42.2019.05.19.11.36.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 11:36:48 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/bridge: make dw_mipi_dsi.h self-contained
Date: Sun, 19 May 2019 20:36:35 +0200
Message-Id: <20190519183636.19588-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519183636.19588-1-sam@ravnborg.org>
References: <20190519183636.19588-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPEv3MWRBjIT/z6bKnMY4PWDy/PJB9/cY885lupLFXQ=;
 b=eZppetc/bCO+abG78nJabx3swMEPCe062/L8McqH8m6cgt0hShsqL7nipRbirkGeFK
 SkNU7+gz9f3Cuw+oM5EEWVlFOFH36KVy8M6LuXHtPddrQ2dElr8haJNVlxupEvJjee1A
 h6odPkqABLFVAOIskiY4eBvryqczS3qld8o+8UryjQ7oGvnGksnlp5A1Hm3ZIPZdM9fd
 0tJmIZqVa+1PTafZcCBzE86UxMIfozK/xLVbrtHksunVvO0p0oExW7dpbcsnNFAUOEXV
 zab57EP37DrLF1MPTt/tXL5UVg5tEc4m0EVt1e1c4M8XmbmoCk2TNoLQZjA43FI3L6fy
 /nrA==
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYWxsb3cgdXNlcnMgdG8gaW5jbHVkZSBkd19taXBpX2RzaS5oIHdpdGhvdXQgcHVsbGluZyBp
biBkZXBlbmRlbmNpZXMKbWFrZSBkd19taXBpX2RzaS5oIHNlbGYtY29udGFpbmVkLgpVc2UgZm9y
d2FyZCBkZWNsYXJhdGlvbnMgd2hlbiBwb3NzaWJsZS4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBQZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIuc2Vu
bmFAZ21haWwuY29tPgpDYzogTWFydGluIERvbm5lbGx5IDxtYXJ0aW4uZG9ubmVsbHlAZ2UuY29t
PgpDYzogTWFydHluIFdlbGNoIDxtYXJ0eW4ud2VsY2hAY29sbGFib3JhLmNvLnVrPgotLS0KIGlu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19t
aXBpX2RzaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmgKaW5kZXggN2QzZGQ2
OWE1Y2FhLi44MjVjMjIyYWZiZmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19t
aXBpX2RzaS5oCisrKyBiL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oCkBAIC05LDgg
KzksMTYgQEAKIAogI2lmbmRlZiBfX0RXX01JUElfRFNJX18KICNkZWZpbmUgX19EV19NSVBJX0RT
SV9fCisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAorc3RydWN0IGRybV9kaXNwbGF5X21vZGU7
CitzdHJ1Y3QgZHJtX2VuY29kZXI7CiBzdHJ1Y3QgZHdfbWlwaV9kc2k7CitzdHJ1Y3QgZHdfbWlw
aV9kc2lfaG9zdF9vcHM7CitzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5X29wczsKK3N0cnVjdCBkd19t
aXBpX2RzaV9wbGF0X2RhdGE7CitzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlOworc3RydWN0IHBsYXRm
b3JtX2RldmljZTsKIAogc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgewogCWludCAoKmluaXQp
KHZvaWQgKnByaXZfZGF0YSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
