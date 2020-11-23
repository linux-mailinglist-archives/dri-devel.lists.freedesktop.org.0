Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5232C0426
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB84489ECB;
	Mon, 23 Nov 2020 11:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A66789DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so18173160wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GNPMH7+BshXFtHvJRFR/Pz67utL4+c2zXgvOMeOYi1w=;
 b=x43XL5SjSI8fFhB+JucQYDS6mMeFgr//tbZ0jm1MCQ9P0QBt6aEmfPzxG6yD50eqQd
 NMHzrMMk4AgiHPrCgw9MpvOFhdCWMwZYGoD0lFKSesvOzp88G8aRRsbScKsdMbf9Q3p8
 QYi8NcCu1k5AzonhQ1VCH6zCT+3+AkNgrwjHiMtXMveewofVxbNK/makoLjx6W/mvQb5
 w2WODjf+b+8MZRkQF7lxK3wFyP4wZiynPH2YI42EtGDXT+d75ltrHmB4OZkczxlduGLQ
 MvIfrBqudWXGr7o2EHHoLMrgkL8mpc96BMWOhnOSnyiegEQ7PlOG2hlcT5EjOxDI35z4
 ZjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GNPMH7+BshXFtHvJRFR/Pz67utL4+c2zXgvOMeOYi1w=;
 b=KPb4N0TpO4yMnoDHYvW/lxvf/9ZcGw3b7lYbRgXzn9WEREB+4My7AVTmAPn8dFRbqL
 ojqPYiQVHC8eoEw51bHS9xrGjD2ekzCIuysMrFv7qzpB1IBXf59G2KeV6n+Ta58axMz7
 4koaa6yAao0pZsh8d676sMMRkdBAKmfuW4f3515yz8XUj5tzI+RA1hCZ7Cusr8VKKtzQ
 fI5rPcMzldxj/1ByqAoiowdW9u27pVImIkANjxmG1ELO5E8kmuH1lSxFpyZfF+7GARUn
 QcxKL/8om480bwem+BScHbrmoKsaDxW1x2wu121X3ucAgUhZm0N5wNmAaf+VdYQI55Or
 NcCQ==
X-Gm-Message-State: AOAM531RHEgbbM3S44J25XOmMRWWqrkoxcoeM8/wpbk76S/+GKOYWFKl
 npJeSSBEqSqzbnT6G4etnS0SKg==
X-Google-Smtp-Source: ABdhPJzrDah+u91N2/j3UWxTUP9JFlQRPTokZt/Vi5apdBbebjcxWKcx2wIFaChw2/Z19djyE7hbqg==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr931833wrn.263.1606130392924;
 Mon, 23 Nov 2020 03:19:52 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/40] drm/amd/include/navi10_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:03 +0000
Message-Id: <20201123111919.233376-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9yZWdfaW5p
dC5jOjI3OgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZpMTBfaXBf
b2Zmc2V0Lmg6MTI3OjI5OiB3YXJuaW5nOiDigJhVTUNfQkFTReKAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogMTI3IHwgc3RhdGljIGNvbnN0IHN0cnVj
dCBJUF9CQVNFIFVNQ19CQVNFID17IHsgeyB7IDB4MDAwMTQwMDAsIDAsIDAsIDAsIDAsIDAgfSB9
LAogfCBefn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZp
MTBfaXBfb2Zmc2V0Lmg6MTA5OjI5OiB3YXJuaW5nOiDigJhSU01VX0JBU0XigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDEwOSB8IHN0YXRpYyBjb25z
dCBzdHJ1Y3QgSVBfQkFTRSBSU01VX0JBU0UgPSB7IHsgeyB7IDB4MDAwMTIwMDAsIDAsIDAsIDAs
IDAsIDAgfSB9LAogfCBefn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2lu
Y2x1ZGUvbmF2aTEwX2lwX29mZnNldC5oOjYxOjI5OiB3YXJuaW5nOiDigJhGVVNFX0JBU0XigJkg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDYxIHwgc3Rh
dGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIEZVU0VfQkFTRSA9eyB7IHsgeyAweDAwMDE3NDAwLCAw
LCAwLCAwLCAwLCAwIH0gfSwKIHwgXn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9uYXZpMTBfaXBfb2Zmc2V0LmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvbmF2aTEwX2lwX29mZnNldC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L25hdmkxMF9pcF9vZmZzZXQuaAppbmRleCBkNGE5ZGRjNzc4MmZmLi5kNjgyNGJiNjEzOWRiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEwX2lwX29mZnNldC5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTBfaXBfb2Zmc2V0LmgKQEAg
LTMxLDcgKzMxLDcgQEAgc3RydWN0IElQX0JBU0VfSU5TVEFOQ0UgewogIAogc3RydWN0IElQX0JB
U0UgewogCXN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFIGluc3RhbmNlW01BWF9JTlNUQU5DRV07Ci19
OworfSBfX21heWJlX3VudXNlZDsKIAogCiBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgQVRI
VUJfQkFTRSAgICAgICAgICAgID17IHsgeyB7IDB4MDAwMDBDMDAsIDAsIDAsIDAsIDAsIDAgfSB9
LAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
