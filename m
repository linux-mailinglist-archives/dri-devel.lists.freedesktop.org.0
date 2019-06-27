Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF758FAD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF896E86B;
	Fri, 28 Jun 2019 01:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2C56E358;
 Thu, 27 Jun 2019 17:36:37 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 19so1584903pfa.4;
 Thu, 27 Jun 2019 10:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o3wPN5sKnMpYXJv1e+SqpjxmPG2dm66g471O72ekDMY=;
 b=BHp4aYU6GtgPGcm7nnLc5josJISa+6ElGXBKPfqiGdJQ1hT5N/oC4Me8am6ekf6ebe
 /b++bmJrlmF8QNKA+oy5228HLjKWCou2G838INZPD3qc5MrpAhesS7NwWjVtrebb5IfH
 deEV6cUcKQROVO/pAAtMsNjlaIgEb3Te36215vwW4UGH58TyGElCFklHFkeoYOuBQpFW
 +0b2ppK9Xqv2AjFV5GdtS29bLZAg/zyqbktDU1B+HTmSFaxQIOHLLu5ElNFEY1d7cEAr
 E0c/pTKly057yV79NGYzo69QDKfifcFpaCtdzRTcyWtfes2LT/iCGYXGyuG6uzZPpVMV
 Jeeg==
X-Gm-Message-State: APjAAAW43Fr3m3dE9NXADv2L6HsZacRxM+vkiKIzO0+Micz2D5qCKbMG
 Zn/TiRr3LCqgz5dO+ga6VkY=
X-Google-Smtp-Source: APXvYqxbawH6+ykIPzr3VcukKDoxoDv/LeONuahmbBGyegEnuwuBTBg3TC01Ex5wn9d68WyWDtn2oQ==
X-Received: by 2002:a17:90a:21ac:: with SMTP id
 q41mr7521985pjc.31.1561656997066; 
 Thu, 27 Jun 2019 10:36:37 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id 11sm6726852pfw.33.2019.06.27.10.36.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:36:36 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 17/87] gpu: drm: Remove call to memset after kzalloc in
 iceland_smumgr.c
Date: Fri, 28 Jun 2019 01:36:28 +0800
Message-Id: <20190627173629.2725-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=o3wPN5sKnMpYXJv1e+SqpjxmPG2dm66g471O72ekDMY=;
 b=pTEeyH2V2kS2aM+XNbEwNHsg0CMGxrz437n791WxO8i8JLoFtlUEcQUpaVmuWenggS
 CTJrZpE5IiGjtsELZcTYV+OaNUdpiA8aVvV3oPsQ6JktDFX8W/+jYTvZHxwisEOm9RGQ
 9gM/CvxdgqNXhBLfqDE5gaBoLjIa64TcQEvZH9zCpBA/hRfB5QfQJz7tVGM2i6htrnZX
 7YDUBqzBCAmeMR4SGu5/15a3b3LcSyeDE3QOgW1oibPemPFaHbKQ42wsQ5lwKUuoHjQv
 3OUnFQqWdMDZPvPt0B1lokccpTg8sHjjZiq4obMbc7bzK3oBR2um13aBp04/RNBWigI5
 iz1w==
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
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Fuqian Huang <huangfq.daxian@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a3phbGxvYyBoYXMgYWxyZWFkeSB6ZXJvZXMgdGhlIG1lbW9yeS4KU28gbWVtc2V0IGlzIHVubmVl
ZGVkLgoKU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2ljZWxhbmRfc211
bWdyLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9pY2VsYW5kX3NtdW1nci5jCmlu
ZGV4IDM3NWNjZjZmZjVmMi4uYzEyM2I0ZDljNjIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYwpAQCAtMjYzMSw4ICsy
NjMxLDYgQEAgc3RhdGljIGludCBpY2VsYW5kX2luaXRpYWxpemVfbWNfcmVnX3RhYmxlKHN0cnVj
dCBwcF9od21nciAqaHdtZ3IpCiAJY2dzX3dyaXRlX3JlZ2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1t
TUNfU0VRX1BNR19DTURfTVJTMl9MUCwgY2dzX3JlYWRfcmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwg
bW1NQ19QTUdfQ01EX01SUzIpKTsKIAljZ3Nfd3JpdGVfcmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwg
bW1NQ19TRVFfV1JfQ1RMXzJfTFAsIGNnc19yZWFkX3JlZ2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1t
TUNfU0VRX1dSX0NUTF8yKSk7CiAKLQltZW1zZXQodGFibGUsIDB4MDAsIHNpemVvZihwcF9hdG9t
Y3RybF9tY19yZWdfdGFibGUpKTsKLQogCXJlc3VsdCA9IGF0b21jdHJsX2luaXRpYWxpemVfbWNf
cmVnX3RhYmxlKGh3bWdyLCBtb2R1bGVfaW5kZXgsIHRhYmxlKTsKIAogCWlmICgwID09IHJlc3Vs
dCkKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
