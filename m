Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6B58FA8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E47B6E863;
	Fri, 28 Jun 2019 01:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBEF6E358;
 Thu, 27 Jun 2019 17:40:21 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id v9so1322732pgr.13;
 Thu, 27 Jun 2019 10:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L6opFpOThEdquXvnOb5s3Hkh5g3O4IQcltwmgth5DiA=;
 b=sfmVS/a8wsbC4aXaO8kO6zyrOL+W70dyIJIrxOR/UGePALv+YYfLHDJIbCS2kh+LzP
 x+uVTNxy8SgrmZa+qWy2cF7MWENIQ3eMQkfY2wKNXlob20ZoYYn/u9+kv9LXwYBfLBxO
 nt8Iew+Sgzf9t7TDeJvsk3lKZWFuEh7BBCpilFOnlXSrnEmVAXxx8oIxGLBQ5VB4V+tL
 vk3G/U+3J/6pLNN9rUn77lqvzf8+fxpm41liOo+8UW4P5l3wP2huTdWhXFq5oGV2KWD7
 +7LH7KBKC1UPXEe2bR2X4lE4I/bYhN+4QFQqv6eJ3xueL6rzHfHQEs6SdEdl4Tw2w8U7
 5Z1Q==
X-Gm-Message-State: APjAAAWBssPKx6wzi2bKGoGS+hcwmrtbp/lxz38UbptgqNPsIURFRfCL
 TpbOSe9RPkGF8Ed1narksPk=
X-Google-Smtp-Source: APXvYqxrzUs8DeUHPssnnwWLTuDDk6JJL7Yrqlo13ODapk3BAIjulA+x5zBhBOQ7DfHZad+5QbPjlw==
X-Received: by 2002:a63:5002:: with SMTP id e2mr2522564pgb.216.1561657220675; 
 Thu, 27 Jun 2019 10:40:20 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id h62sm5865256pgc.54.2019.06.27.10.40.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:40:20 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 15/87] gpu: drm: Remove call to memset after kzalloc in
 process_pptable_v1_0.c
Date: Fri, 28 Jun 2019 01:40:10 +0800
Message-Id: <20190627174012.4062-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=L6opFpOThEdquXvnOb5s3Hkh5g3O4IQcltwmgth5DiA=;
 b=CZA3oppJRGpRVbOhcz/P3IO6tE1VhnhxzuflMacV8+o/y/T9vbqL25HKnIukmZc1Y2
 Jl7ngPoG98WaMJmN8ZPliPHljkGZjbjznSIxw+c9bp29CamtqAL4eFbgybvTb6iGVlY4
 aupFWu1YDInGmCyB4iownB507+ppAwz7EnBD1Q3OX7cxhSJmKAQt6fFpF8NBxBt8ukCC
 3tN0dSVf6P0kbTXuA4pYOaBRGJN2D8Sc1a11ZLmM4uG+dZ8tH9RWQnCvtxuSsVNR6crM
 RyEzYCNdblj33qwjsHXfPxCWDGK9k7mByIscSOnmvylDNKq5fiCNMmvP5K9ksBYzTfYg
 6d6w==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, Fuqian Huang <huangfq.daxian@gmail.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a3phbGxvYyBoYXMgYWxyZWFkeSB6ZXJvZXMgdGhlIG1lbW9yeS4KU28gbWVtc2V0IGlzIG5vdCBu
ZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFuQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3Bw
dGFibGVzX3YxXzAuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0
YWJsZXNfdjFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vz
c19wcHRhYmxlc192MV8wLmMKaW5kZXggYWU2NGZmNzE1M2Q2Li5lYjc3NTc0NDNiZGQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJs
ZXNfdjFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Byb2Nl
c3NfcHB0YWJsZXNfdjFfMC5jCkBAIC0xMDY1LDggKzEwNjUsNiBAQCBzdGF0aWMgaW50IHBwX3Rh
Ymxlc192MV8wX2luaXRpYWxpemUoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAlQUF9BU1NFUlRf
V0lUSF9DT0RFKChOVUxMICE9IGh3bWdyLT5wcHRhYmxlKSwKIAkJCSAgICAiRmFpbGVkIHRvIGFs
bG9jYXRlIGh3bWdyLT5wcHRhYmxlISIsIHJldHVybiAtRU5PTUVNKTsKIAotCW1lbXNldChod21n
ci0+cHB0YWJsZSwgMHgwMCwgc2l6ZW9mKHN0cnVjdCBwaG1fcHB0X3YxX2luZm9ybWF0aW9uKSk7
Ci0KIAlwb3dlcnBsYXlfdGFibGUgPSBnZXRfcG93ZXJwbGF5X3RhYmxlKGh3bWdyKTsKIAogCVBQ
X0FTU0VSVF9XSVRIX0NPREUoKE5VTEwgIT0gcG93ZXJwbGF5X3RhYmxlKSwKLS0gCjIuMTEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
