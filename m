Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE707C791
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA1C89DF7;
	Wed, 31 Jul 2019 15:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959189DF7;
 Wed, 31 Jul 2019 15:52:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 201so49579834qkm.9;
 Wed, 31 Jul 2019 08:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RgZ5DHzJSyKB7ekOyjgS1cC2bC/5MtEMJe0naQB8c5g=;
 b=DZQ/5qR+vbYASw7A/6iPQHWaA5guuRy5eofJskCsfjUB16KMovTuZkyGDTpqamCf1g
 P3FDLOBxWBmLkU5ANkh2GnEakYyKff29Dnp7SP9WbR2R8Yokb9XBGuug46IATWjxtVMd
 QUpXTsLzU3dRRyLtzyvpdz/TaOSF9ukV8MkQZb4biIuDVQR0mmgxqEOo4AANzH9Amawp
 RnWgvu2TVdbra2HKwFBiRiEy47Lif6Y5yyrrjnlIic1+BnqorkzXM6156+xn3EHkTQJL
 oL/YkpyO+h3uAxZD9SLGEFBHSLwAYsIWESL+/WDU8TaCZg/95ITXWgOfWPsstU81gRPL
 3vJw==
X-Gm-Message-State: APjAAAUGSLWBpYamA4+gjdOb0p/wQ/m92yvjDud9UX/5cjcM69ROvnso
 0kHFfy+hlm4eXp6I76iWwRxq7w8W
X-Google-Smtp-Source: APXvYqyvsStBQaKfsLCYii3jrt4y9vxzxc6W8xIWBzh6WbhSTEf3U9wuhJr41M5On2z31N3MDmx8lQ==
X-Received: by 2002:ae9:c10c:: with SMTP id z12mr81515742qki.110.1564588373542; 
 Wed, 31 Jul 2019 08:52:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/amdgpu: drop drmP.h in amdgpu_amdkfd_arcturus.c
Date: Wed, 31 Jul 2019 10:52:39 -0500
Message-Id: <20190731155246.20603-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RgZ5DHzJSyKB7ekOyjgS1cC2bC/5MtEMJe0naQB8c5g=;
 b=SCNbMznevIniW1RGqg+ZeRP+hXh3co/z1YNMlq9IwWdeH99uNqgo8aoPBwftNjMAfM
 uiX5x6uIvFzcw/dzGT4WNxjDZoOzURmQYhV5ixkhKIwLQXW6FkHaCDBqezOL+X7ZrmB4
 Lqkqe/i6HFlhGUhfhdcXKx/QGgyV9jffB4ZyG68lE/L5Jt8MDRxmj0eOsSQUJHWZC9Cs
 +09eqSuOd0ISeYNYA0LUpyAt4Ja7itGpH0c81+o3qg9tTu5U/ZR/L0dQkMOXIMrvClWj
 k3K/0UniFjoHucula9OQ2iMvKbAsbt3TtoOJzQg10eE4vxW4yFvZkPS+sCzwmG7iq7RM
 5Veg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW51c2VkLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfYXJj
dHVydXMuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMKaW5kZXgg
NGQ5MTAxODM0YmE3Li5jNzlhYWViZWVhZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfYXJjdHVydXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMKQEAgLTI4LDcgKzI4LDYgQEAKICNp
bmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAjaW5jbHVkZSA8bGludXgvbW11X2NvbnRleHQuaD4K
ICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgotI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5j
bHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2FtZGtmZC5oIgogI2luY2x1ZGUgInNk
bWEwL3NkbWEwXzRfMl8yX29mZnNldC5oIgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
