Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461D61B0A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2899289A88;
	Mon,  8 Jul 2019 07:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEE46E375
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 13:30:34 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c73so796537pfb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2019 06:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ut6IeCO94UUbJJFbHPkNN9BlqXZJ9Hk6d+0wH2eLEVU=;
 b=KGUD6mKhF7LbMHLuvNuEhBhRAQ5o7KuKzzSLHy3L4fG4IX+3I9stFYWTwh8gzDQJdh
 /xvcvFCBaBos4GncOlup4uCdQhihGtgQxw0GjIrd5mjq0T9XMLzlC+pAjK7p+ldx1zks
 +Fnd8sojgPC/1VJpMCfOfyKDMqcg6kPGjsQXaLg2kP9zIMApV8lKpDSQFClcoVE1pyF4
 u2aA2hpuzxRY9pAvJQAa898kLgkeZl9p9oJWqfIyjRTLhlSLVYY/DNlj7uS0onkMt6ra
 muQu+JNAxWA1plcBGEdXmnF6El82U4k+kaD6/IvunP8vIpg5sFGV6oVXUenC6q56tz7z
 /rlA==
X-Gm-Message-State: APjAAAXaxgV1tkE3mzOsQ9YwJ15XmJ/AVcxJp+DI7+qK5tEslca+CF07
 kV64+vzJkW8SI4803asU16E=
X-Google-Smtp-Source: APXvYqz5aMcqwlQglCOlf2ZKj5MRm4E9DEfSPhzDEheTgbBtCem0FQPO8JmcdQU6AEUnJor5Wa4YPg==
X-Received: by 2002:a63:358a:: with SMTP id c132mr2390181pga.375.1562419834089; 
 Sat, 06 Jul 2019 06:30:34 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
 by smtp.gmail.com with ESMTPSA id 2sm11494343pff.174.2019.07.06.06.30.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 06:30:33 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 airlie@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] gpu: drm: mediatek: mtk_drm_drv.c: Add of_node_put() before
 goto
Date: Sat,  6 Jul 2019 19:00:21 +0530
Message-Id: <20190706133021.3308-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ut6IeCO94UUbJJFbHPkNN9BlqXZJ9Hk6d+0wH2eLEVU=;
 b=MAt2GM7NCEcrkO3H0T05ygT6Nn6q6eQ8iEBeY7KUf4FyV7cXqevSW41QpUSbOjLmij
 MUQVjQp+Jj0tdismhDEBdVFXrcv0Aao1Eryu5mJ4nylkHtaZMsPDHiA/QQwDkcUIVfoI
 tmscRnDD2vHqSCnmaCahVEYkZcfMb35fZ2tdJWP90CIxpA8/x5Dld9f5dG38EcGXykVu
 vlykA7k2ZcsZHcp1TlaQ7OoX9c0CxIuEm0Ad4bu8mkUtRRBrrwJr4k1toOWk3dtzMrFj
 ruroSybQRd23RDoTtATAiFusLOXeVxdOvsFPWhLAofuD8xgr6LFkdb50BbkDbNqV+F1r
 8RKQ==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RWFjaCBpdGVyYXRpb24gb2YgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSBwdXRzIHRoZSBwcmV2aW91
cwpub2RlLCBidXQgaW4gdGhlIGNhc2Ugb2YgYSBnb3RvIGZyb20gdGhlIG1pZGRsZSBvZiB0aGUg
bG9vcCwgdGhlcmUgaXMKbm8gcHV0LCB0aHVzIGNhdXNpbmcgYSBtZW1vcnkgbGVhay4gSGVuY2Ug
YWRkIGFuIG9mX25vZGVfcHV0IGJlZm9yZSB0aGUKZ290byBpbiB0d28gcGxhY2VzLgpJc3N1ZSBm
b3VuZCB3aXRoIENvY2NpbmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5p
c2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCmluZGV4IDk1
ZmRiZDBmYmNhYy4uMmRmZmJjOGM2ZDczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYwpAQCAtNTI0LDEyICs1MjQsMTUgQEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQljb21wID0gZGV2bV9remFsbG9jKGRldiwg
c2l6ZW9mKCpjb21wKSwgR0ZQX0tFUk5FTCk7CiAJCQlpZiAoIWNvbXApIHsKIAkJCQlyZXQgPSAt
RU5PTUVNOworCQkJCW9mX25vZGVfcHV0KG5vZGUpOwogCQkJCWdvdG8gZXJyX25vZGU7CiAJCQl9
CiAKIAkJCXJldCA9IG10a19kZHBfY29tcF9pbml0KGRldiwgbm9kZSwgY29tcCwgY29tcF9pZCwg
TlVMTCk7Ci0JCQlpZiAocmV0KQorCQkJaWYgKHJldCkgeworCQkJCW9mX25vZGVfcHV0KG5vZGUp
OwogCQkJCWdvdG8gZXJyX25vZGU7CisJCQl9CiAKIAkJCXByaXZhdGUtPmRkcF9jb21wW2NvbXBf
aWRdID0gY29tcDsKIAkJfQotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
