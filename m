Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677382C5610
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF116E95E;
	Thu, 26 Nov 2020 13:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FD96E954
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so2189117wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldsB1ybseYMp8ZBJ12vzzY4XQciSVJ5HSbnDxd3OzfI=;
 b=nReHHg4y2GwBg+ELtmf6FKwwwAdv6FVyF8TSlch4nRCGTQIlzqgbmoe8jOy65PUNtC
 QZA85Hl+za8IH3wCN1maDRJBzWHgekSGAWVe1ujb9l0mJ381TiuS7MAOxETiefpPaXal
 9KUA/uc82NsiO5ek53XTMgL87wJZNqP4j9zolH/e0trnLg8vMZAdBBQ60k5vrk2DVMTi
 pIHLlgDKi+Tirc5Ix9rsVwi/D+KCuXckmZQ8l9Lmqw8WRADwOMXChgsKEm8RyaVVTuzl
 /LpSYMLRqRuuddUIUGJ1zrrqYv5ymqV1+9f3PEdlgwfMFp0IvAjV7Vw32h1noxdmD2v/
 rVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldsB1ybseYMp8ZBJ12vzzY4XQciSVJ5HSbnDxd3OzfI=;
 b=DCqQvlH4u7w7TnnhP/AXJmI0AD5EHaI+9RGFeu/QZFVz2AwG1RZRf1LgrxQhvDdCwW
 YDPthlpBrfNdNXTWw5mR4J0k7DSzYecqd5x8EG6v6/q+NUo8qeeW8X0TnYaoxphV4M8n
 pFNWH2AEb/0onxTrG0OXdFze6FCG7fLh+Mgj7husjjZVRBSgUoC1+6wFPmSa/bbtK4Qv
 fw7eYbWmzyRJvGjcYAT3VQSFYB5PzZyEKVxdg8lnE0o3ZYluN1kkdj6HuE5izeCogEjx
 ycD7r1a0rtymu+oFOZa7V4Yva3vDbp3opTgDHIrWS9XENq4HBusHOf7VN1y73kek3hqo
 2jQg==
X-Gm-Message-State: AOAM533R3k67KfrgI9yK14/nOG2w92WaDky4MtMAFjivUheoA5HBIimW
 VbfNq47lhDEBu+wzKDrbYAjSww==
X-Google-Smtp-Source: ABdhPJzJRjrTBh1mNZ3EweuonfhsRNL0SPGQIQZVyDeSp+pKVMCn3IhQ4KBalcGJsP6s5OHfo901MQ==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr4114461wrq.308.1606398171231; 
 Thu, 26 Nov 2020 05:42:51 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/pm/powerplay/smumgr/vegam_smumgr: Make function
 called by reference static
Date: Thu, 26 Nov 2020 13:42:05 +0000
Message-Id: <20201126134240.3214176-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3Iu
YzoyMjQ5OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYdmVnYW1fdGhl
cm1hbF9hdmZzX2VuYWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogRXZhbiBRdWFu
IDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKaW5kZXggMzhhNWNkY2Y1ODk2Ny4uN2Qw
MjRkM2ZhY2VmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
c211bWdyL3ZlZ2FtX3NtdW1nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYwpAQCAtMjI0Niw3ICsyMjQ2LDcgQEAgc3RhdGljIGlu
dCB2ZWdhbV91cGRhdGVfc2Nsa190aHJlc2hvbGQoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAly
ZXR1cm4gcmVzdWx0OwogfQogCi1pbnQgdmVnYW1fdGhlcm1hbF9hdmZzX2VuYWJsZShzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKQorc3RhdGljIGludCB2ZWdhbV90aGVybWFsX2F2ZnNfZW5hYmxlKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpCiB7CiAJc3RydWN0IHNtdTdfaHdtZ3IgKmRhdGEgPSAoc3Ry
dWN0IHNtdTdfaHdtZ3IgKikoaHdtZ3ItPmJhY2tlbmQpOwogCWludCByZXQ7Ci0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
