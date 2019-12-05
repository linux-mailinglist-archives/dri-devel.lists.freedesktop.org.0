Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942C114D73
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38616F991;
	Fri,  6 Dec 2019 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC226E988
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:06:25 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id bb5so1430937plb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A6T5rNKNclcrc8zSiYoO2y70nKx7U2mYLpgDu385uMU=;
 b=Wrh3p2C0cGrE+lTCT79hocndXqXhqnkv0typJeZmCa5DIh/NJi32v5XFvSBmD6zA06
 mtbdHfHumXX69faA2CXxH4PMSdqdRP0O5P+gICBhJSFX5nGNQP/3F10dPyDWWbGuDaqG
 IW2IbqEFF/KXxKvcFK2pa5R88V+w8LjUVIkqlXQSHzJb0aXFwSkmad+SxbBz7m8uQa7g
 8UjuhaY91hGb4aj1nJBMbTPF2th27sRHj2RnjibaNOKu+vw38Qp21EJ6htvUQuT0HSXk
 hk/iUbhRTrKDwZ2qJN4OYFvL2vvUzFOUmfru0ysg5p30zga0tCduAKAw6ixNGD4Tr761
 Epwg==
X-Gm-Message-State: APjAAAXhdFla0EoURNstclsEaEULXsrm/h4ykny47Gsj7lN/CmHs1HvJ
 EN/gCCM00Ce1yNFs32EhWC3Oar6cIDk=
X-Google-Smtp-Source: APXvYqz1TvZSptnZMQa6vC1oLdSukjuo/E1BH74lUOre/7W/SL+wHr7pmaLET0W6OUGj2U7BLAkn4A==
X-Received: by 2002:a17:902:8494:: with SMTP id
 c20mr9822487plo.123.1575561985483; 
 Thu, 05 Dec 2019 08:06:25 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id f8sm171321pjg.28.2019.12.05.08.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 08:06:24 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] pxa168fb: fix release function mismatch in probe failure
Date: Fri,  6 Dec 2019 00:06:13 +0800
Message-Id: <20191205160613.32075-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A6T5rNKNclcrc8zSiYoO2y70nKx7U2mYLpgDu385uMU=;
 b=EEP91ussc+X9HzK01xBWThOjZtw6K6ZrLXNzwbhx0dgAQ2+XYaUBeVBxWnz48RsOmQ
 wzF0BcUi17TxzODM5z06N5ysOw8YpjclnJfPSqF1G4L58tbBMLo71c4altUl4MJ9mlR1
 6n6+6jKu6+dm10mC0loRoI8MTLMUhIt8wQUjfPvna6FxQZdJyVeHO0ppSNLY+Erl/o+k
 1/R3gfasyxfoUDUOm890FZMyOYUK/rZ5u8gRvpg+IosslbZE7seueHOZVSvoQ8nZ4QXI
 pRAsRYQQzjY904SOKIjYQnrmj0ZzVe06KeuB45tFS5xZiuH5wBoHnwbFMsB1yvsmZjah
 PtwA==
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
Cc: linux-fbdev@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciB1c2VzIGtmcmVlKCkgdG8gcmVsZWFzZSB0aGUgcmVzb3VyY2UgYWxsb2NhdGVk
IGJ5CmZyYW1lYnVmZmVyX2FsbG9jKCksIHdoaWNoIGRvZXMgbm90IG1hdGNoLgpVc2UgZnJhbWVi
dWZmZXJfcmVsZWFzZSgpIGluc3RlYWQgdG8gZml4IGl0LgoKRml4ZXM6IDYzODc3MmM3NTUzZiAo
ImZiOiBhZGQgc3VwcG9ydCBvZiBMQ0QgZGlzcGxheSBjb250cm9sbGVyIG9uIHB4YTE2OC85MTAg
KGJhc2UgbGF5ZXIpIikKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2OGZiLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2OGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2
OGZiLmMKaW5kZXggMTQxMGY0NzZlMTM1Li5iOTQzNTEzM2I2ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvcHhhMTY4ZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2
OGZiLmMKQEAgLTc2OSw3ICs3NjksNyBAQCBzdGF0aWMgaW50IHB4YTE2OGZiX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZG1hX2ZyZWVfY29oZXJlbnQoZmJpLT5kZXYsIGlu
Zm8tPmZpeC5zbWVtX2xlbiwKIAkJCWluZm8tPnNjcmVlbl9iYXNlLCBmYmktPmZiX3N0YXJ0X2Rt
YSk7CiBmYWlsZWRfZnJlZV9pbmZvOgotCWtmcmVlKGluZm8pOworCWZyYW1lYnVmZmVyX3JlbGVh
c2UoaW5mbyk7CiAKIAlkZXZfZXJyKCZwZGV2LT5kZXYsICJmcmFtZSBidWZmZXIgZGV2aWNlIGlu
aXQgZmFpbGVkIHdpdGggJWRcbiIsIHJldCk7CiAJcmV0dXJuIHJldDsKLS0gCjIuMjQuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
