Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D16C2F45C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429BC89FF6;
	Wed, 13 Jan 2021 08:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15A489FDE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d13so1039335wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtOB/mkCBg/7k2V+Yul5Q3zrw4uvSu6D+ZDw375QQ1c=;
 b=RlPHM1p/vG4SiuUwAw1bbIS+KMHFtNuIJRaOGSj+2QN2Xv9MYmpXiHybJdI3JFPrx9
 rcHTpY4z2TUTAfTT1I4Oj+dYy1Hoq9VB4U7/nMWz8M3OeGbsigW+GAcdlv43iq+PGUqc
 N/cHJxQw7WOtopw0GWdLqfI59hhkzZnOcSo7/WDLBGdj/umo2fYaYvciEXE+O4JwVn7J
 7nL1q7H638KJMQx/i6LfIKD5pmJ7JhBscMqHmPRL/AUL5ZZQHYmHOg0fVC6TrZFE2wX5
 RiRcZAQbYaxDh/JmbM+g5OXeOQUIqAjF2kPGe8QidqmB+v8VvhcXal041dC+f32wFYfy
 OUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtOB/mkCBg/7k2V+Yul5Q3zrw4uvSu6D+ZDw375QQ1c=;
 b=Xj00Hol3sLLstvwrKVysvWLabkq3vupr3RvugpRTY9CGaAItxYq0Xoasa6ctJGdpTG
 24P+QFLQr6wRqGlwzJR26Bpl6djuSyC1wvULFWbUe94KtMoLxjrAuwZ//P2rPNzwwCRf
 D/z/NJ4O/4fDA/NanGTfbXIwal312wDxha2ixF5rNeceFUXU7Hjg0ym/KQl+YgUTXpuh
 OFSGCWyw8bONOfB/ze0Tazoco/81ognNdJ91P1/IUqw2ChtbFY8cO/iHk76uMR+8rvj7
 o+7I1iLJbQ3P8j5FQVJ5JOjjjOJIaa51FT0/4zi9s62erEbeh/ndEgCu2rarvzg6wLaN
 EP2A==
X-Gm-Message-State: AOAM530EhbdFqgTbslfUZrqAmaNVnkusOSQXY5o0YkBZ11dy1LDqKwN3
 ESPtDwpoIPJU0M+2jGv0WRyOmg==
X-Google-Smtp-Source: ABdhPJywG3pcXtpKgqZEPCytcOe3O9Nzdu7Pq9pYz665OvcE3oeucdt1OjBpXy9CDZfBHI6bFQh8Pw==
X-Received: by 2002:a5d:4112:: with SMTP id l18mr1191436wrp.116.1610525288602; 
 Wed, 13 Jan 2021 00:08:08 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/30] drm/amd/display/dc/core/dc: Staticise local function
 'apply_ctx_interdependent_lock'
Date: Wed, 13 Jan 2021 08:07:32 +0000
Message-Id: <20210113080752.1003793-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjLmM6ODA2OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYXBwbHlfY3R4X2ludGVyZGVwZW5kZW50
X2xvY2vigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggOGYxY2FkYjgyM2M3MS4uMGEwN2U2MDg0ODVm
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC04MDMsNyAr
ODAzLDggQEAgc3RhdGljIHZvaWQgZGlzYWJsZV9hbGxfd3JpdGViYWNrX3BpcGVzX2Zvcl9zdHJl
YW0oCiAJCXN0cmVhbS0+d3JpdGViYWNrX2luZm9baV0ud2JfZW5hYmxlZCA9IGZhbHNlOwogfQog
Ci12b2lkIGFwcGx5X2N0eF9pbnRlcmRlcGVuZGVudF9sb2NrKHN0cnVjdCBkYyAqZGMsIHN0cnVj
dCBkY19zdGF0ZSAqY29udGV4dCwgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLCBib29s
IGxvY2spCitzdGF0aWMgdm9pZCBhcHBseV9jdHhfaW50ZXJkZXBlbmRlbnRfbG9jayhzdHJ1Y3Qg
ZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCisJCQkJCSAgc3RydWN0IGRjX3N0cmVh
bV9zdGF0ZSAqc3RyZWFtLCBib29sIGxvY2spCiB7CiAJaW50IGkgPSAwOwogCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
