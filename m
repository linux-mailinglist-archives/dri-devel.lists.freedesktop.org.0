Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA184DF5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1196E6F3;
	Wed,  7 Aug 2019 13:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D9D6E6EE;
 Wed,  7 Aug 2019 13:54:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so142967wms.2;
 Wed, 07 Aug 2019 06:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHavv916lCJg3UwiviOVhG8s4PuTXTB/08YllDykGXs=;
 b=naz4YF2la/xAuf9XTxz+QL9K9kd59GCgogX2OE1WZXSHdVFmXalsjXoWdkFOsr/ILY
 XmzWowBxuHS0mEXOfkPVlscE7tIfj84hJFz9OWiD0gTgXQ+JNp4bOXA0vE3AiR0VNFOn
 ptqWo8KcAJr3pu1Hlo1sHpxie1hhHLftqCER+TmXQv7RLHxMWgfsGMJ78aDwgUqISltj
 cMb+ux2HYzKpJB6/J5VBVsOZ+fae1xEXmqX8ZDQVavuVT7/TgQ6JWnloarWYDfjI4AEM
 dkLnvYjKKcETbRyIh/tpwNWVnUejdXETgX0Hc77/d4OSa68PwljOtRrgJY3x2JnbIOfu
 CnWA==
X-Gm-Message-State: APjAAAWs1n/OFWAvpNLGvdot+sng+SYMenENybaWVnDKLvaU2RH/9yTF
 DWHWHc0jVlhqhUUfpWfRHqOO9Peo
X-Google-Smtp-Source: APXvYqyAw9zyxdJYItG/T6o5sZ3K8SxDYuw0C50draZ0SR54F9UscnMG3+RU369WMIN/JiJtm/zzFg==
X-Received: by 2002:a1c:4087:: with SMTP id n129mr98012wma.3.1565186046894;
 Wed, 07 Aug 2019 06:54:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:645a:5b76:280d:27be])
 by smtp.gmail.com with ESMTPSA id a6sm86308wmj.15.2019.08.07.06.54.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 06:54:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH] dma-buf: make dma_fence structure a bit smaller
Date: Wed,  7 Aug 2019 15:54:05 +0200
Message-Id: <20190807135405.2036-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHavv916lCJg3UwiviOVhG8s4PuTXTB/08YllDykGXs=;
 b=NcNSeHKjIR6371EuEQsaOxJV5lSqhb+TBw5RI0cPEVlqqQnKsOek2rVlqRBgRghbVc
 R1K5sjNNHyca+TxWjE4yKnBA0HwzxAvoHgmJ/XOlLbI3KKHFHzMigWJODchg1OudRFHm
 P5LjQVRBYLNO1J1EELhNAnZ8M703JqCih55lgHkE9Omfg+3x6xbZ9M0HHOxQ35DTzyJr
 Qc78GNetj4yA3NvsDE13P9wnc4G6ghuI0r3E86NgtS/sO/Z/GMO9An+OEkGIej2yf2Bu
 XEEltWDqhkRKvC8S7M76veFm9ncpTP8HfFGcT4Ce7sw74OVDmjYFWSxfNZCR3Rk9LMYn
 MflQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJ1YyBhbmQgY2JfbGlzdCBhcmUgbmV2ZXIgdXNlZCBhdCB0aGUgc2FtZSB0aW1lLgpUaGlz
IHNtYWwgY2hhbmdlIGlzIGFjdHVhbGx5IG1ha2luZyB0aGUgc3RydWN0dXJlIDE2JSBzbWFsbGVy
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgotLS0KIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLmggfCA2ICsrKystLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2RtYS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAppbmRleCAw
NWQyOWRiYzdlNjIuLjM5ODVjNzJjZDBjMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9kbWEt
ZmVuY2UuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCkBAIC02NSw4ICs2NSwxMCBA
QCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiOwogc3RydWN0IGRtYV9mZW5jZSB7CiAJc3RydWN0IGtyZWYg
cmVmY291bnQ7CiAJY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgKm9wczsKLQlzdHJ1Y3QgcmN1
X2hlYWQgcmN1OwotCXN0cnVjdCBsaXN0X2hlYWQgY2JfbGlzdDsKKwl1bmlvbiB7CisJCXN0cnVj
dCByY3VfaGVhZCByY3U7CisJCXN0cnVjdCBsaXN0X2hlYWQgY2JfbGlzdDsKKwl9OwogCXNwaW5s
b2NrX3QgKmxvY2s7CiAJdTY0IGNvbnRleHQ7CiAJdTY0IHNlcW5vOwotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
