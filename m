Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF922C0430
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB0A8945B;
	Mon, 23 Nov 2020 11:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2628689F8E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so18174057wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x7j4MAG3aMMAv+exH325swHGJEpjCRvoAo6+eP0jclY=;
 b=lNK83QJS2ndVONnSis4ixIX5b3SXdsncFYR912rIshpJ18Ac3nGF4AFjIcTh74QQTU
 WluvQPGONjU4NiFHaL4NTrNzC5IHdE3V0VQdNQ3pNKFyj11k+WjmlKX89yB5dimcFiov
 2f+MUMxY1HN5Z5LEbCTgklsEbN10IyQlYZBnA9RD3eqC9W6IzpjireyMxOiBAt9eA88J
 Zj84a3y/mcHqA778ECrH8x2HuPUV/EFDP3URDRVk9vBqYxtzvTbcm587B2X6oGYOp9FV
 L7vr57zATASuA1lLNskOEsiqrz50jCw1zFOMavSoUnLiKimFhQkVlXh0nOwOOG+ikK8b
 XalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x7j4MAG3aMMAv+exH325swHGJEpjCRvoAo6+eP0jclY=;
 b=preVOpjVm/BnVCvl/DZhiHgrz7UmvN8CzKwrU3iMOAT1ZS0o0mk/rThFQsRBrwYJ0O
 q+RfM1GKf8/gPOJ1N1iAUHuAqegIv7YLTAHM+enQY4pajeB5VT+8kdi947N9YpmX6SDy
 Nd6NRZ1rF4TH/xWsKQ5+P0LhmmcEPo1H5p5VwK8fgVMu6bgd6eYBLVfjM+a4Lvl1I8WJ
 2QVOqPE9God+J7KmuK9qcMeHSqBFxv0qtXnnRB00LuHBk1O/ZX0ZPJ3eGMSfDYsu7yai
 cCAXnAeWgcsM0XDMezZWe/UbLgfcsYHItu3ylViXwgUoYVBpriEl6H7DHR5AHIzNzcUG
 7zXw==
X-Gm-Message-State: AOAM531qC/0BwEvivYYYGlXp73WqHtwyZ9i4MQQVGjF38n3zgtnowBsq
 wDSfYZY7v83bmtKJzxiZcrUaTA==
X-Google-Smtp-Source: ABdhPJzPAspljYVUUQw5F7zFIQt0YEnWI6OkhToahK3/SXM47FmrLku1L0vKnxwWd6+xB4+RbhoiJw==
X-Received: by 2002:a5d:6892:: with SMTP id h18mr30002591wru.49.1606130408851; 
 Mon, 23 Nov 2020 03:20:08 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/amd/amdgpu/cik_sdma: Add one and remove another
 function param description
Date: Mon, 23 Nov 2020 11:19:12 +0000
Message-Id: <20201123111919.233376-34-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX3NkbWEuYzoyODI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICdjaWtfc2RtYV9yaW5n
X2VtaXRfZmVuY2UnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWtfc2RtYS5jOjI4Mjog
d2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0aW9uIGlu
ICdjaWtfc2RtYV9yaW5nX2VtaXRfZmVuY2UnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpD
YzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Y2lrX3NkbWEuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWtf
c2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX3NkbWEuYwppbmRleCBmMWU5
OTY2ZTcyNDRlLi4yOGE2NGRlOGFlMGU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9jaWtfc2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19z
ZG1hLmMKQEAgLTI3MSw3ICsyNzEsNyBAQCBzdGF0aWMgdm9pZCBjaWtfc2RtYV9yaW5nX2VtaXRf
aGRwX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKICAqIEByaW5nOiBhbWRncHUgcmlu
ZyBwb2ludGVyCiAgKiBAYWRkcjogYWRkcmVzcwogICogQHNlcTogc2VxdWVuY2UgbnVtYmVyCi0g
KiBAZmVuY2U6IGFtZGdwdSBmZW5jZSBvYmplY3QKKyAqIEBmbGFnczogZmVuY2UgcmVsYXRlZCBm
bGFncwogICoKICAqIEFkZCBhIERNQSBmZW5jZSBwYWNrZXQgdG8gdGhlIHJpbmcgdG8gd3JpdGUK
ICAqIHRoZSBmZW5jZSBzZXEgbnVtYmVyIGFuZCBETUEgdHJhcCBwYWNrZXQgdG8gZ2VuZXJhdGUK
QEAgLTI3OSw3ICsyNzksNyBAQCBzdGF0aWMgdm9pZCBjaWtfc2RtYV9yaW5nX2VtaXRfaGRwX2Zs
dXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKICAqLwogc3RhdGljIHZvaWQgY2lrX3NkbWFf
cmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdTY0IGFkZHIsIHU2NCBz
ZXEsCiAJCQkJICAgICB1bnNpZ25lZCBmbGFncykKLXsKKyAgewogCWJvb2wgd3JpdGU2NGJpdCA9
IGZsYWdzICYgQU1ER1BVX0ZFTkNFX0ZMQUdfNjRCSVQ7CiAJLyogd3JpdGUgdGhlIGZlbmNlICov
CiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU0RNQV9QQUNLRVQoU0RNQV9PUENPREVfRkVOQ0Us
IDAsIDApKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
