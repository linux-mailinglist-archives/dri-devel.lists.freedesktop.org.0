Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA042EF8A7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754E6E8D7;
	Fri,  8 Jan 2021 20:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0AB6E8CE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r3so10171933wrt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pCWTLh6pUKUhVwO0TotxP6oyBluQlcMqNIDaPfcM14=;
 b=j4HTaC5teLJEWSrAqsMlehCTa/mrh1JvnNZigcfcW2Jv35J5T8GWVT4ZgZsX6LEscY
 QED6g9o4ceQ8RoCri7MtZd0Ew+XQLnuspak171c5bLYoG0e2UFlddvWCwiINRxdVHeTo
 g+WZSYoI1lYoJ78oS08z1p/OCBxFDiEEofnAbNtlpzywGkIQfnTJXobArUqLtU6QlqNT
 /ykGtHidoKH0olRRP7iKOrT3KMqLGcxYjSqj8zLn5rUIULqqVX/slgvoSl1uBFxtzGV1
 ejamhodQxeGIsV7CwOI6ke/S1yoHU9jdtTdkKxg0z51QnvH1Qwz8mqH9gn4dityIug9q
 qfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pCWTLh6pUKUhVwO0TotxP6oyBluQlcMqNIDaPfcM14=;
 b=XLScoEXK0ss7KIlpIs7laa5jq1jDpOj5Uhuc6bi10g2oDddoMcmgsCilkPF4DIzfC0
 MPvzEEs+CUOYKkBWqNwKLh60TUqjjW/DV5kCaVWyVLqnIpYTMw/YHP+DsBUa/Xw3WKpa
 mV41RsFNsE/se3H4QA04myyzlypDZu6MyqmubMRdRSppzGpj/Tbl9UhHlywWYLy6KLPU
 /49ksw6Q04mOUwFtZlPvoH4QGTh1/yq0/Mv4fU+C85dgD59bp3hToZnS15Q1z6yIWp/Z
 hArDtnZAa3y41BKOxOn7Mobd3yEcOqb8W09OKwmuzsxBhvXOMq39fBy9vlHgxkL3/oJK
 bHKg==
X-Gm-Message-State: AOAM531j3tAozsQYKf9p5pPpc9yDkZbXKtPQhCpVYp68+su9Vt7jYl5E
 d2O4zWWGFc/HYuLjYRf2sTAhQA==
X-Google-Smtp-Source: ABdhPJyfhVs/DnlMxcILfmD8bIoFox48Y/pMO+pIEVfz2Kl9AB2bShxi7CR/gVg+KkktUNdpTXcftw==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr5265127wru.332.1610136927993; 
 Fri, 08 Jan 2021 12:15:27 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/amd/display/dc/bios/command_table_helper2: Fix
 legacy formatting problems
Date: Fri,  8 Jan 2021 20:14:33 +0000
Message-Id: <20210108201457.3078600-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVs
cGVyMi5jOjE0NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndCcgbm90
IGRlc2NyaWJlZCBpbiAnZGFsX2NtZF90YWJsZV9oZWxwZXJfdHJhbnNtaXR0ZXJfYnBfdG9fYXRv
bTInCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiAuLi4vZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRf
dGFibGVfaGVscGVyMi5jICAgfCAyMCArKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlcjIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyMi5j
CmluZGV4IDc3MzZjOTJkNTVjNDAuLjQ1NWVlMmJlMTVhMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyMi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVy
Mi5jCkBAIC0xMjgsMTggKzEyOCwxNCBAQCBib29sIGRhbF9jbWRfdGFibGVfaGVscGVyX2NvbnRy
b2xsZXJfaWRfdG9fYXRvbTIoCiB9CiAKIC8qKgotKiB0cmFuc2xhdGVfdHJhbnNtaXR0ZXJfYnBf
dG9fYXRvbQotKgotKiBAYnJpZWYKLSogIFRyYW5zbGF0ZSB0aGUgVHJhbnNtaXR0ZXIgdG8gdGhl
IGNvcnJlc3BvbmRpbmcgQVRPTSBCSU9TIHZhbHVlCi0qCi0qIEBwYXJhbQotKiAgIGlucHV0IHRy
YW5zbWl0dGVyCi0qICAgb3V0cHV0IGRpZ2l0YWxUcmFuc21pdHRlcgotKiAgICAvLyA9MDA6IERp
Z2l0YWwgVHJhbnNtaXR0ZXIxICggVU5JUEhZIGxpbmtBQiApCi0qICAgIC8vID0wMTogRGlnaXRh
bCBUcmFuc21pdHRlcjIgKCBVTklQSFkgbGlua0NEICkKLSogICAgLy8gPTAyOiBEaWdpdGFsIFRy
YW5zbWl0dGVyMyAoIFVOSVBIWSBsaW5rRUYgKQotKi8KKyAqIHRyYW5zbGF0ZV90cmFuc21pdHRl
cl9icF90b19hdG9tMiAtIFRyYW5zbGF0ZSB0aGUgVHJhbnNtaXR0ZXIgdG8gdGhlCisgKiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3JyZXNwb25kaW5nIEFUT00gQklPUyB2
YWx1ZQorICogIEB0OiB0cmFuc21pdHRlcgorICogIHJldHVybnM6IGRpZ2l0YWxUcmFuc21pdHRl
cgorICogICAgLy8gPTAwOiBEaWdpdGFsIFRyYW5zbWl0dGVyMSAoIFVOSVBIWSBsaW5rQUIgKQor
ICogICAgLy8gPTAxOiBEaWdpdGFsIFRyYW5zbWl0dGVyMiAoIFVOSVBIWSBsaW5rQ0QgKQorICog
ICAgLy8gPTAyOiBEaWdpdGFsIFRyYW5zbWl0dGVyMyAoIFVOSVBIWSBsaW5rRUYgKQorICovCiB1
aW50OF90IGRhbF9jbWRfdGFibGVfaGVscGVyX3RyYW5zbWl0dGVyX2JwX3RvX2F0b20yKAogCWVu
dW0gdHJhbnNtaXR0ZXIgdCkKIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
