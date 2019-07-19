Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B721E6EF69
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5986E8AC;
	Sat, 20 Jul 2019 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F306E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 10:32:43 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c14so15380770plo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8qhnRgEZihilSgw7kKeGvUMgkb5ifMf+Eyiz0heXJs=;
 b=oznt4XHSK1Rt77AuLDXVeb+YBHLNuMXk8WqWfO9yi8E5fHk75YAhsx7XinoHj2XOza
 +oYgpVx38yiunMuIs+IL8hWmZegB8vcC+ii3fOaUgkJJKdc1W3rXjFQtwVa+S9VO4tg7
 sjh8I5BvPdv5bD9DNi0pFG9xi/O+SWSHCCnogYfgIF2mpy3c9C8iyd/tzksU+grLoJMi
 FqDh/aDlKHl7kLTgbICyvun7ev9cJy/TF36qEIZkGs2zSyqTfe5sL4UHgbk5ygatluFW
 NiWuNAv8qtgrksAHvnqtMz2qAe3oD8NFdi49WWSllprHzauHS0JoWWrUilrD7RikmQwh
 6oRg==
X-Gm-Message-State: APjAAAVPRet1EcX5NSlZqwBUh3HqDdj4ENwarPZzxt+5QMzvj5KfvGJr
 Rj+7t9z0LblcER2fZEKlG3KLBooYI3Q=
X-Google-Smtp-Source: APXvYqwM5uX2Z3lxpUb1PgpPaYg4UrhdWy602Z/sInoOWoP2qM3MQBWuz62fdEs69wpXsM/tmvWoqQ==
X-Received: by 2002:a17:902:20c8:: with SMTP id
 v8mr56385548plg.284.1563532363495; 
 Fri, 19 Jul 2019 03:32:43 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id i15sm34029444pfd.160.2019.07.19.03.32.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 03:32:42 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/exynos: Use dev_get_drv_data
Date: Fri, 19 Jul 2019 18:31:09 +0800
Message-Id: <20190719103108.19998-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 20 Jul 2019 12:51:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8qhnRgEZihilSgw7kKeGvUMgkb5ifMf+Eyiz0heXJs=;
 b=EsYFYhi5YLM2CYVaQbmamBSUnTVMml8zoraowbCu2noJpLEblOs1149Bnhj/0mSj8y
 w09uJ6DNfzL0wFZSLSVFs0iSvBiWKDNu2eEXXkduSOl06NoD/3q1AdVYp4BkidNYjLq+
 wlD7597+u9ukQKpU5FNxD2x5ZjMjABkfcvza2gDWFf7k7jfvjfg0AZerDQttBrGw7oZp
 o9clkP9OtbBSx6igyic2vp3vDwqcF9uipciVX+pe6ORBE61JAgU4KuPkeLOVhsivLCsn
 l4HaF+Us1nVeL2l2kMMkox7OE965ZfqEpk2sSaSLH4iWMzFwKPRe11oU9eR+zrLywQLa
 OFzw==
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
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Chuhong Yuan <hslester96@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2X2dldF9kcnZkYXRhIGlzIGEgc2ltcGxlciBpbXBsZW1lbnRhdGlvbiBjb21wYXJpbmcKdG8g
dG9fcGxhdGZvcm1fZGV2aWNlICsgcGxhdGZvcm1fZ2V0X2RydmRhdGEuClRoaXMgbWFrZXMgdGhl
IGNvZGUgc2ltcGxlci4KCgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZA
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMg
fCAyICstCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMKaW5kZXggYTU5NGFiN2JlMmMwLi4xNjRk
OTE0Y2JlOWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9m
aW1jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYwpAQCAt
NDQsNyArNDQsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGZpbWNfbWFzayA9IDB4YzsKIG1vZHVs
ZV9wYXJhbV9uYW1lZChmaW1jX2RldnMsIGZpbWNfbWFzaywgdWludCwgMDY0NCk7CiBNT0RVTEVf
UEFSTV9ERVNDKGZpbWNfZGV2cywgIkFsaWFzIG1hc2sgZm9yIGFzc2lnbmluZyBGSU1DIGRldmlj
ZXMgdG8gRXh5bm9zIERSTSIpOwogCi0jZGVmaW5lIGdldF9maW1jX2NvbnRleHQoZGV2KQlwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YSh0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KSkKKyNkZWZpbmUgZ2V0X2Zp
bWNfY29udGV4dChkZXYpCWRldl9nZXRfZHJ2ZGF0YShkZXYpCiAKIGVudW0gewogCUZJTUNfQ0xL
X0xDTEssCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3Nj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMKaW5kZXggMWU0YjIx
YzQ5YTA2Li4xYzUyNGRiOTU3MGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9nc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z3NjLmMKQEAgLTU4LDcgKzU4LDcgQEAKICNkZWZpbmUgR1NDX0NPRUZfREVQVEgJMwogI2RlZmlu
ZSBHU0NfQVVUT1NVU1BFTkRfREVMQVkJCTIwMDAKIAotI2RlZmluZSBnZXRfZ3NjX2NvbnRleHQo
ZGV2KQlwbGF0Zm9ybV9nZXRfZHJ2ZGF0YSh0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KSkKKyNkZWZp
bmUgZ2V0X2dzY19jb250ZXh0KGRldikJZGV2X2dldF9kcnZkYXRhKGRldikKICNkZWZpbmUgZ3Nj
X3JlYWQob2Zmc2V0KQkJcmVhZGwoY3R4LT5yZWdzICsgKG9mZnNldCkpCiAjZGVmaW5lIGdzY193
cml0ZShjZmcsIG9mZnNldCkJd3JpdGVsKGNmZywgY3R4LT5yZWdzICsgKG9mZnNldCkpCiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
