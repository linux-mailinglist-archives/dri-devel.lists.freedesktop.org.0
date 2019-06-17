Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF23A49107
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834D36E091;
	Mon, 17 Jun 2019 20:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBEE6E090
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:23 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so12400741qtl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04YV4222yTbQVoaNkjtoFrmBfJ73jHzJG/awNg4EaWI=;
 b=bWkq2fNqhYP0QJGbm96L6g1FU6DYGa0nBKC2wYtnHF77Nso8Sy9yasEc+pDpkiONpf
 Mv058Whfv9S8WspChssvf6ZKw6C1LTs9uDiKxuZ8SeH5G66H3Hdg6Qpnq/hNvSh4Fh7A
 bYt/0r4CEBYC9QHmQoBvQ97QQ7prQ9rE+MOmVqV+TB2SCK+wvb0bgV7qwvzoaYhwo8tW
 i1itRcSYL7JFcpl3MY3YLBbQGgxt5kn1UWLG1al2NFKlg7/AQbkZ3a2w/h5uFC8SWhvQ
 D1fsqBfYl8VJEAtSg8sEpWf5XFysozlKKiJY+g8hCcayWB39KV3B2ehSOXJMktXjdJgZ
 lCrQ==
X-Gm-Message-State: APjAAAXMgK7q0KEIbvEgkb031GODeyVvGuwsKih/EHNdfn+f8uB5X11T
 cCqEIKhFZo7rR0LK6XV6JGIuj2i6Ojw=
X-Google-Smtp-Source: APXvYqzjE27Gg02/YlB9NekL0Cxe6H7ZZEq8eqq8VORWjDi9njYAJ+CGvuJso74VxB3+WTAYE1fXVQ==
X-Received: by 2002:aed:3ed5:: with SMTP id o21mr94179519qtf.369.1560802402527; 
 Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 05/13] drm/msm/dsi_pll_10nm: Remove impossible check
Date: Mon, 17 Jun 2019 16:12:50 -0400
Message-Id: <20190617201301.133275-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04YV4222yTbQVoaNkjtoFrmBfJ73jHzJG/awNg4EaWI=;
 b=DXsH9rEQvO/T3DNNhX4I4Wrag8DtZOeR9pSCQJAE8tKznywa6tSYOjTPPh/4eOvwXh
 eDG92ifV/tMg6EKFPvyb5fVYFzhjrhsqpprXjmjnHKA0D7qkqRhYt/R978yc8XXe31n3
 kBxzTa4a9Q8O6XXRxKEw0HA3GIRL7nbGI5Pqh843Z/003qKq04ga+n6a8AARLQd6vtar
 nnU0or1+YVP6FgVocha9d6BYSYwJaA1sqbTp33KEhNezefxaG5zhIQAvmquL/df7/XPJ
 TNRos8HV7GhFCL1sI6WZMaWGmRo+q5ODdQSk2rkVZpd58wIol5qmkf8V6vQ+Euquf7Ib
 J28w==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXaGlsZSBJJ20gaW4gaGVy
ZSwgY3V0IHRoaXMgb3V0LCBwZGV2IGNhbid0IGJlIE5VTEwKClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BsbC9kc2lfcGxsXzEwbm0uYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5t
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMKaW5kZXggNjE4
YjQ5ODM4MjkzLi44ZjYxMDBkYjkwZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL3BsbC9kc2lfcGxsXzEwbm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwv
ZHNpX3BsbF8xMG5tLmMKQEAgLTgxOCw5ICs4MTgsNiBAQCBzdHJ1Y3QgbXNtX2RzaV9wbGwgKm1z
bV9kc2lfcGxsXzEwbm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBpbnQgaWQp
CiAJc3RydWN0IG1zbV9kc2lfcGxsICpwbGw7CiAJaW50IHJldDsKIAotCWlmICghcGRldikKLQkJ
cmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Ci0KIAlwbGxfMTBubSA9IGRldm1fa3phbGxvYygmcGRl
di0+ZGV2LCBzaXplb2YoKnBsbF8xMG5tKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwbGxfMTBubSkK
IAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2lu
ZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
