Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041CD2C01
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1238A6EB4A;
	Thu, 10 Oct 2019 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E724A6E03F;
 Thu, 10 Oct 2019 14:02:41 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e1so3743247pgj.6;
 Thu, 10 Oct 2019 07:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZdqsRckbmP+w55fhj4Yf9x9dxfCAADpA9mJF5bN0cwg=;
 b=Bbpo66b9O45oOjJ3oZ69j7VEq5KxW5sWyij0albcg3boF6HiZXk+Rh7VT4fSghTy/X
 aQ6/iPviFRU1usNxJhOUqHrQsCgBKSSO+vaM6CLHy/kHlDpuuMEG0NmfbJQkjXTRgP9l
 rMXGpKyaYicdbMK+mJ2+Pq6yRcuhmjkeuggb//kEJ4kIn8z5y/7Wt7K4iC30Q5DRnamw
 v5NvWcqCQBHwUkSLp9ox2CmnX5AXuh9T7Yyb8izzq0CaizAJsdUIz8kyNqvuplndWijS
 XsdjALQdw/fr1y0d0VeaTRvOikMmY9W9LAJsBM0jfSFbjDQFHJFvr++epxLJVKpkKvjn
 rQXw==
X-Gm-Message-State: APjAAAXQrdjcfHChhOceoVMtiDBO+blQhxUfDBmeD/j+WoRxlnP0JOIz
 tKFuhLEhoLwgb9COHgcL3U/h1wEzsSk=
X-Google-Smtp-Source: APXvYqzYOj6QQy6fITv8k0P0E3JLyiO/nCMsQHjt4Hmm6p8ywgmQQn1Gu13UNTKbuENCvZpCmgiZVA==
X-Received: by 2002:a65:498c:: with SMTP id r12mr11544628pgs.280.1570716161212; 
 Thu, 10 Oct 2019 07:02:41 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 h14sm5523371pfo.15.2019.10.10.07.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 07:02:40 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/lima: simplify driver by using more drm helpers
Date: Thu, 10 Oct 2019 22:01:49 +0800
Message-Id: <20191010140152.17747-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZdqsRckbmP+w55fhj4Yf9x9dxfCAADpA9mJF5bN0cwg=;
 b=jT2reppve76uiM39jlK8T5Dxh3dcYC61QxgZFYzpvRNfbmSC3uEgR6Gqn4OZflLz8X
 bjN98GMzqdXfl/dgmufJlILd76r3mKuXyF7JG8AIAeCkQxHVZUBhZIC70CEuZi0iIAik
 Bj7kOZ7no9/jFElXLLTIC4TKg6V+Aw2djVzz3QbuQJnQhSj47p1GzUXqSQ9Va34vYHBM
 lgpXQ6rOkGOvKiJxysJIbic9pAUx6D+DkXvFFV4G5GjPeCjp2TK6Pc8pv0qiMUy4Zov2
 2iIJfIChtRiC+41T8XZDyuq9kvh7wLUvauHC9cYxp1EUBMyE2KaCeBP6EDG2xQFhXlNh
 2WRw==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Qiang Yu <yuq825@gmail.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnkgdXNpbmcgc2hhcmVkIGRybSBoZWxwZXJzOgoxLiBkcm1fZ2VtXyh1bilsb2NrX3Jlc2VydmF0
aW9ucwoyLiBkcm1fZ2VtX3NobWVtX2hlbHBlcnMKd2UgY2FuIHNpbXBsaWZ5IGxpbWEgZHJpdmVy
IGEgbG90IGFuZCBiZW5pZml0IGZyb20gdXBkYXRlcyB0bwp0aGVzZSBmdW5jdGlvbnMuCgpQYXRj
aCBzZXJpZXMgaXMgYmFzZWQgb24gZHJtLW1pc2MtbmV4dCBicmFuY2gKCnYyOgpBZGQgZHJtX2dl
bV9vYmplY3RzX2xvb2t1cF91c2VyIGFuZCB1c2UgaXQgZm9yIGRyaXZlciB3aGljaApwYXNzIHVz
ZXIgR0VNIGhhbmRsZXMgaW4gY29udGlvdXMgYXJyYXkuCgp2MzoKaW1wcm92ZSBjb21taXQgY29t
bWVudC4KCnY0OgpEcm9wIGRybV9nZW1fb2JqZWN0c19sb29rdXAgcmVmaW5lIHBhdGNoZXMuCgpR
aWFuZyBZdSAoMyk6CiAgZHJtL2xpbWE6IHVzZSBkcm1fZ2VtX3NobWVtX2hlbHBlcnMKICBkcm0v
bGltYTogdXNlIGRybV9nZW1fKHVuKWxvY2tfcmVzZXJ2YXRpb25zCiAgZHJtL2xpbWE6IGFkZCBf
X0dGUF9OT1dBUk4gZmxhZyB0byBhbGwgZG1hX2FsbG9jX3djCgogZHJpdmVycy9ncHUvZHJtL2xp
bWEvS2NvbmZpZyAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9NYWtlZmls
ZSAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jICAg
IHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2Rydi5jICAgICAgIHwgIDIyICst
LQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyAgICAgICB8IDE5NSArKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uaCAgICAgICB8
ICAzMiArKysrLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuYyB8ICA0NiAt
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtX3ByaW1lLmggfCAgMTMgLS0KIGRy
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfbW11LmMgICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUv
ZHJtL2xpbWEvbGltYV9vYmplY3QuYyAgICB8IDExOSAtLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbGltYS9saW1hX29iamVjdC5oICAgIHwgIDM1IC0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbGltYS9saW1hX3NjaGVkLmMgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9s
aW1hX3ZtLmMgICAgICAgIHwgIDg3ICsrKysrKy0tLS0tLQogMTMgZmlsZXMgY2hhbmdlZCwgMTQ4
IGluc2VydGlvbnMoKyksIDQxNSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbV9wcmltZS5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuaAogZGVsZXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX29iamVjdC5oCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
