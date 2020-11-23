Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDC2C0429
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A9D89F4F;
	Mon, 23 Nov 2020 11:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11BB89D8A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so17530570wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T4FjG6f9bymrh4PjmAcFpuoCus4SJcn+AyFqjEZrv1I=;
 b=vVtLw5uT6obzsw8cMoY4xbKNUucmADpVYib8Njfe0EEVJAIs0FfMXC1oaf4fr2ouBA
 uBpCJ+IgKilFI5lPWPI2Rtmasmj1eHvBiS02GeGassoW1xZq+fzzvhgvM2jOlBtIm8QD
 hNxNVPUBFiqe7UXOzN34Knlk7OeyVnKRxJqpMbKIUF79T0Gg9rEedupu/GGa8mPcVcUH
 LJ5jfGxGyY/jaoqgQ1F31B48lWeWBek6XwBzueCp4Meg/RjV8gmLcgO5ZD5GlG+Uw4sp
 d5PlZxY/WVYFRUk8ZT2RP8PfIwaO1mv/OxhEqG51oexe0MCWWB65fGWFWPRkVJP7aiNS
 VFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T4FjG6f9bymrh4PjmAcFpuoCus4SJcn+AyFqjEZrv1I=;
 b=TiXBtTyhZ+SVXsjWPARNz8m7wuFYiAY5Q8HFvwgimxqmLWubgIgz4wQoR7OC1PoAfq
 n996Lft69pzw8KqFk5BCm3iHixhPKm4v83WDnoLPO8kfNjaaea8oKVNG9W9ZBIqw8hNa
 gOXIElZMQSuv0xeDTE7yl/J9isp0ldqfFz77iSNwO0ZfpURQcAzJkPVb91gL4fMN/NWe
 bc9gphE5ZV9sMi7sXOJ2HXR40FZ7upYerwx1T1LRQ46mZkDnBn4S0kUgxjSiydMtHdYU
 QGKob0IXW5bOZ6S5jeCS/ZTca3sC11+phBn+D/xF0wlsMFNBLbu+hrOQuW+lKguMo8i+
 4igA==
X-Gm-Message-State: AOAM531x2eCqUu2K9gHH0J8BXfhvUqqk3NCQ40hHYn/kMMzldaQTRNMr
 OhatbOjTlHo78xgzowoId4AdM2U7iB8cIxbz
X-Google-Smtp-Source: ABdhPJyUOXqPshe2OXY/yWW4HWBycTHOYqj9YJnlDG9mNMgCMAKhHT1jzXAB7KFzPcBCMyeSQyPeYg==
X-Received: by 2002:a05:600c:22d5:: with SMTP id
 21mr22035408wmg.33.1606130390647; 
 Mon, 23 Nov 2020 03:19:50 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/amd/amdgpu/dce_v6_0: Fix formatting and missing
 parameter description issues
Date: Mon, 23 Nov 2020 11:19:01 +0000
Message-Id: <20201123111919.233376-23-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y2XzAuYzoxOTI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2FzeW5jJyBub3QgZGVzY3JpYmVkIGluICdkY2VfdjZfMF9wYWdl
X2ZsaXAnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jOjEwNTA6IHdhcm5p
bmc6IENhbm5vdCB1bmRlcnN0YW5kICAqCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQu
Y29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y2XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2RjZV92Nl8wLmMKaW5kZXggOTQzOTc2MzQ5MzQ2NC4uODNhODgzODVi
NzYyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y2XzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jCkBAIC0xODAsNiArMTgw
LDcgQEAgc3RhdGljIHZvaWQgZGNlX3Y2XzBfcGFnZWZsaXBfaW50ZXJydXB0X2Zpbmkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCiAg
KiBAY3J0Y19pZDogY3J0YyB0byBjbGVhbnVwIHBhZ2VmbGlwIG9uCiAgKiBAY3J0Y19iYXNlOiBu
ZXcgYWRkcmVzcyBvZiB0aGUgY3J0YyAoR1BVIE1DIGFkZHJlc3MpCisgKiBAYXN5bmM6IGFzeW5j
aHJvbm91cyBmbGlwCiAgKgogICogRG9lcyB0aGUgYWN0dWFsIHBhZ2VmbGlwIChldmVyZ3JlZW4r
KS4KICAqIER1cmluZyB2Ymxhbmsgd2UgdGFrZSB0aGUgY3J0YyBsb2NrIGFuZCB3YWl0IGZvciB0
aGUgdXBkYXRlX3BlbmRpbmcKQEAgLTEwNDcsNyArMTA0OCw2IEBAIHN0YXRpYyB1MzIgZGNlX3Y2
XzBfbGluZV9idWZmZXJfYWRqdXN0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCiAKIC8q
KgotICoKICAqIGRjZV92Nl8wX2JhbmR3aWR0aF91cGRhdGUgLSBwcm9ncmFtIGRpc3BsYXkgd2F0
ZXJtYXJrcwogICoKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
