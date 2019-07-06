Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105361AFA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0D489A08;
	Mon,  8 Jul 2019 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03AC6E375
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 13:27:54 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t132so5457956pgb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2019 06:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AruGhoz4nIX+N2ZTYOZ13RL4ziWjcv4QtdzM5mPYin8=;
 b=SS0npDoe5d7I6hj5CC1d2+p6aKUc5maLveTiiBcC56DrQGqyBbKDEC3pS+fSWo65LT
 kMpnhyblK+oBVdR4mH8XoOFzenalC2oygL0WekIZiJJtGYEoFb8ISU6EtyHMD40T9zFR
 zXDq8Fg7uxi42m9i5zS2Q1A0VFCUAEwHUTuYM6uXbYFjzGQ5R+Q2Vj4NOIM7g+v6hhTd
 3L1IVDUKmeVckdIVij0kq60cHKPQ/fZjCdG68DQRBN23cABEtTkyGodmyeHzati00SoC
 MRmrY/vb4KlcxoQHoyBStx91oguHZhvDr5A93lOIx9OZgEnpSqw8+BmRQFwdCVJBrXTB
 LZFQ==
X-Gm-Message-State: APjAAAWOV9qy8B4fDm+5ji/njpamzFVizRRL6Y8udzMxp9ekepIluXt6
 1vX5GRLTdbo2wBIggL1K4+M=
X-Google-Smtp-Source: APXvYqz9pIQgBjZ7zTcIh952JaG9JY5zLgIne5ut9uabjvSEWvCouyStNyC6h6IkH/eEayYNwifHdQ==
X-Received: by 2002:a63:4d4a:: with SMTP id n10mr10839897pgl.396.1562419674555; 
 Sat, 06 Jul 2019 06:27:54 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
 by smtp.gmail.com with ESMTPSA id m10sm11012227pgq.67.2019.07.06.06.27.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 06:27:53 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: eric@anholt.net, airlie@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: drm: pl111: pl111_vexpress.c: Add of_node_put() before
 return
Date: Sat,  6 Jul 2019 18:57:42 +0530
Message-Id: <20190706132742.3250-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AruGhoz4nIX+N2ZTYOZ13RL4ziWjcv4QtdzM5mPYin8=;
 b=Q/IN7pWGTgFgv6zmuJZzs2b0tKYS3zMOmODMHifC7f2x+C16k9XH9tiZ3MXqJkKKg4
 0doLgrGWWOcKo0D2pqEWwsnFlhhLor5+kgskHgluvXArI3KqtxB31j3sUER2uBRVgr14
 u6E5mpm5m6w2vpp+Ah6TcHd1U6WaB7PS0hjy3449AA1rEdfszdzrvGJYD/oxU026rhCZ
 LGx/JZK4/yu4FJ8ewd1UK+lRnP6ygFfBluAggzXIeYjk34JF4069Fmfeg132pedYHRXy
 1kP7Gq5EHbrqxrWkTlbUHDlGLwVC11u0AY+kgeSnvCicvwtb2XH9btTDwbpM4aE9iHwE
 HUAQ==
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

RWFjaCBpdGVyYXRpb24gb2YgZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUgcHV0cyB0
aGUgcHJldmlvdXMKbm9kZSwgYnV0IGluIHRoZSBjYXNlIG9mIGEgYnJlYWsgZnJvbSB0aGUgbWlk
ZGxlIG9mIHRoZSBsb29wIHRoZXJlIGlzCm5vIHB1dCwgdGh1cyBjYXVzaW5nIGEgbWVtb3J5IGxl
YWsuIEhlbmNlIGFkZCBhbiBvZl9ub2RlX3B1dCBiZWZvcmUgdGhlCmJyZWFrLgpJc3N1ZSBmb3Vu
ZCB3aXRoIENvY2NpbmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hr
YWRnLmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfdmV4
cHJlc3MuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX3ZleHByZXNzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGwxMTEvcGwxMTFfdmV4cHJlc3MuYwppbmRleCAzOGM5MzhjOWFkZGEuLjM1MDU3MGZlMDZi
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX3ZleHByZXNzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX3ZleHByZXNzLmMKQEAgLTUxLDYgKzUxLDcg
QEAgaW50IHBsMTExX3ZleHByZXNzX2NsY2RfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCX0K
IAkJaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKGNoaWxkLCAiYXJtLGhkbGNkIikpIHsKIAkJ
CWhhc19jb3JldGlsZV9oZGxjZCA9IHRydWU7CisJCQlvZl9ub2RlX3B1dChjaGlsZCk7CiAJCQli
cmVhazsKIAkJfQogCX0KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
