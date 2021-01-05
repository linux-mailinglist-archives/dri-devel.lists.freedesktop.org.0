Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F194D2EB3FB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 21:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316B6E07B;
	Tue,  5 Jan 2021 20:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC346E077;
 Tue,  5 Jan 2021 20:15:59 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 186so597557qkj.3;
 Tue, 05 Jan 2021 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvF9Wq6ccEWSbvuq81FhNBV+5LmhtjMmMPrkKRz+BSM=;
 b=IaeRzBUMTmj58fdJA+IXuXSCdVQnK+JW7bTaGk9F1UZ/sFepwXwefvSQ7HKnbEF5Ft
 sf+/3W6E6vaXoTDD+gaFecet2MZnKT7+kg1R5tIujAak6spCv+Lb0Y7ndxvnhEDzHr1j
 2EzOqAIfuqbmE1/4ec5OgRd1mRFx7DGsFtwt/6XP7Ook29LpVhxZKrIsgpobexEaVcIf
 zjduxTzzdRhGLtBYjpAx1TerP7pYs1jObaD/Rv+2UGrcccsBM97yLYQcXo56+OIAjB8I
 TAbIILvOphqDSy/a67VYzp1IftNKEDQE/iuAajAW8e2YSGhhS54kBYX34ptL6QSeZ9oz
 jrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvF9Wq6ccEWSbvuq81FhNBV+5LmhtjMmMPrkKRz+BSM=;
 b=NppBCADEkec5tAWTLBiBix2wEfJgO3YXpAfcdiYaKa7HcoX8PRHMI6ijDj5u2cdXcZ
 sKKELv9ISjRYcwSdOIxjD5g8gUQR/yZGi2AnIknmjw8nDm6AMvCjSoz2nfTggRERLiPG
 ZTmLFeLc5M5pHhjfM1jfTSkTaE8TKy2SKwMcvCJuZqnMKO9ecWNQr9jctkJxAege07QT
 vk5uvK/4prW5rux2Qd3itAvl2M6JlVmCDExS9S5Eyt3a92SgFSn5+WxHCmEN4QYxo14+
 cg02Ma/dekNLrSWMYlhg/MlviMnYly68cHP6S83THCQo7v2/zq2wP5bqnq/gKdsK4pt3
 giwQ==
X-Gm-Message-State: AOAM530piX195qVNUw+7wyx1g2P6AhcRhI661ykNh1q8lU9cnH5AbnxP
 ++Gpx0g8t7LP2WbhSP8RTAZEvNZveDY=
X-Google-Smtp-Source: ABdhPJyjQzUU7CZ8NH1lvK8SuwGrywJY/vVeG+8vu+8IshdJz11SR/0mjk8D4NxtF9qC6or9cbqfKg==
X-Received: by 2002:a37:9d14:: with SMTP id g20mr1287023qke.260.1609877758033; 
 Tue, 05 Jan 2021 12:15:58 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.241])
 by smtp.gmail.com with ESMTPSA id o30sm105757qtd.24.2021.01.05.12.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 12:15:57 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git trees
Date: Tue,  5 Jan 2021 15:15:48 -0500
Message-Id: <20210105201548.1374211-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RkRPIGlzIG91dCBvZiBzcGFjZSwgc28gbW92ZSB0byBnaXRsYWIuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogTUFJTlRBSU5FUlMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBlYjE4NDU5YzFk
MTYuLmUyODc3YmU2YjEwZCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5F
UlMKQEAgLTkwNyw3ICs5MDcsNyBAQCBBTUQgS0ZECiBNOglGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4KIEw6CWFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiBTOglT
dXBwb3J0ZWQKLVQ6CWdpdCBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51
eAorVDoJZ2l0IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9hZ2Q1Zi9saW51eC5naXQK
IEY6CWRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQqLltjaF0KIEY6CWRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkLwogRjoJZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2Npa19zdHJ1Y3RzLmgKQEAgLTE0NTk2LDcgKzE0NTk2LDcgQEAgTToJQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgogTToJQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgogTDoJYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKIFM6CVN1
cHBvcnRlZAotVDoJZ2l0IGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4
CitUOglnaXQgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4LmdpdAog
RjoJZHJpdmVycy9ncHUvZHJtL2FtZC8KIEY6CWRyaXZlcnMvZ3B1L2RybS9yYWRlb24vCiBGOglp
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
