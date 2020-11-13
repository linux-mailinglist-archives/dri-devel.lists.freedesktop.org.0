Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E42B1C38
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FA56E526;
	Fri, 13 Nov 2020 13:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9D6E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so9993872wrt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzoA0/p90w69kCv3e5Q2d2JhA6KtEucuiNdT/rFnC4I=;
 b=ox7jf1lZwfwZsOGGRxrgIuDFmMt/t3EA9CY44da6nxv97y3o6P6e3V3SK8STEuDHTx
 uieKR6jD3bQvVud1bFo69dW/kuNx60kde6emW4UAetcflcKaRTsuDtMcDWUlmxyaJwT9
 wOuJ42ZmsGwUk5Cd9hwHMfR2knehgRRvTAfmqo2DDU33pgXSrhJGPEx40GUvbRPorBxG
 jAt3PWNRMXwOxUkY6KekxOtr8lyHSCT3eTVnL+MlKsbvcZDU4Zmn9ZRUCW01FI1S8fNc
 pFScRBfMNP9nq7H3qm4Zz/b7hlbWIg336mGnECdKl9XfzjDeWdTBlXyjqjYCZftHhCP/
 ReoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzoA0/p90w69kCv3e5Q2d2JhA6KtEucuiNdT/rFnC4I=;
 b=AoCzKWanfILwVzGl93KY1RyAk6JbgxAp0wYJ/PxlU/ceXv0UrpFCjgcIbNCAx0L8vL
 HKqkcxHInMbCLAoAnCKzjYkPU5E6uIdvwWv+fJNDzgx3k45QwdErpRICMRJHfLpzR1bb
 lT6TJKYWpt+cIi4/iB3KztTSzbJbLR2/e3HYf8eT6+WVOwi5o6p5u7FE27X9Le7zNJpy
 tTOisOxEIy0yjX0dLwfdvDUY4SNAaek/GGyVWKEWM2OI39ToDIqeI177xox26/pvPdVA
 5UYRIY93NzQHfgufquOMaoDqji1uQ7ZVMFVW9TDXznQ6ajPwOKTBj4Uo7bXZgPstZfBN
 nWPg==
X-Gm-Message-State: AOAM531J3FnYzUj02wJcTnzqZ8mN4u2Kahv2cgnGqGsXlKgIYBeT+tOW
 ZDRcT0yxJFpt8L2VbJECK3FcPg==
X-Google-Smtp-Source: ABdhPJyM0RmlKSiadoyRmHxlgxkTDo9JK/uvB3fY0ok0WHJM9+gvf3MjB4rxoAncUj/U16DHjVwYaQ==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr3531340wrw.176.1605275413797; 
 Fri, 13 Nov 2020 05:50:13 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/40] drm/amd/amdgpu/amdgpu_gmc: Demote one and fix another
 function header
Date: Fri, 13 Nov 2020 13:49:24 +0000
Message-Id: <20201113134938.4004947-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jOjY5OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdibycgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2dtY19wZF9h
ZGRyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jOjEyMTogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYm8nIG5vdCBkZXNjcmliZWQgaW4gJ2Ft
ZGdwdV9nbWNfYWdwX2FkZHInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21j
LmM6MTIxOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICd0Ym8nIGRlc2NyaXB0
aW9uIGluICdhbWRncHVfZ21jX2FncF9hZGRyJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ21jLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nbWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMu
YwppbmRleCAwNTZjYjg3ZDA5ZWEzLi5mZWRlODQ1MDlkYmNhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dtYy5jCkBAIC02MSw5ICs2MSw4IEBAIHZvaWQgYW1kZ3B1X2dtY19n
ZXRfcGRlX2Zvcl9ibyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgaW50IGxldmVsLAogCWFtZGdwdV9n
bWNfZ2V0X3ZtX3BkZShhZGV2LCBsZXZlbCwgYWRkciwgZmxhZ3MpOwogfQogCi0vKioKKy8qCiAg
KiBhbWRncHVfZ21jX3BkX2FkZHIgLSByZXR1cm4gdGhlIGFkZHJlc3Mgb2YgdGhlIHJvb3QgZGly
ZWN0b3J5Ci0gKgogICovCiB1aW50NjRfdCBhbWRncHVfZ21jX3BkX2FkZHIoc3RydWN0IGFtZGdw
dV9ibyAqYm8pCiB7CkBAIC0xMTIsNyArMTExLDcgQEAgaW50IGFtZGdwdV9nbWNfc2V0X3B0ZV9w
ZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHZvaWQgKmNwdV9wdF9hZGRyLAogLyoqCiAg
KiBhbWRncHVfZ21jX2FncF9hZGRyIC0gcmV0dXJuIHRoZSBhZGRyZXNzIGluIHRoZSBBR1AgYWRk
cmVzcyBzcGFjZQogICoKLSAqIEB0Ym86IFRUTSBCTyB3aGljaCBuZWVkcyB0aGUgYWRkcmVzcywg
bXVzdCBiZSBpbiBHVFQgZG9tYWluCisgKiBAYm86IFRUTSBCTyB3aGljaCBuZWVkcyB0aGUgYWRk
cmVzcywgbXVzdCBiZSBpbiBHVFQgZG9tYWluCiAgKgogICogVHJpZXMgdG8gZmlndXJlIG91dCBo
b3cgdG8gYWNjZXNzIHRoZSBCTyB0aHJvdWdoIHRoZSBBR1AgYXBlcnR1cmUuIFJldHVybnMKICAq
IEFNREdQVV9CT19JTlZBTElEX09GRlNFVCBpZiB0aGF0IGlzIG5vdCBwb3NzaWJsZS4KLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
