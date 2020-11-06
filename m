Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B82A9F70
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F56EB2D;
	Fri,  6 Nov 2020 21:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576D96EB26
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so2772431wrp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vzXOfe3LQJ1tPjw4mGTlBd2Hha/B9WB2NE4h+LPHsM=;
 b=CTrg6Tx6WbaAEcip1oP69BTNYGApk3DcwyCdUIuDQ2NDdnRBvWJ1vAX/ZU360Uj2H3
 z2RJwZ1+S16zy979ZmaON1OE5ShHP9tn4UZpPgSmyA/uBIfj1vjmH+jWAjbfh3kcAI+N
 vT9asDh4Mu/wxBCF1XvL2esu1JYbTTLz+JNFFGMzs0UJu4zl3JLxby5TvA9gZghh1n8E
 xgYZIZKANmxc4y1D04xef/nQe3Mc/WsFTjsItHINOS2+gcjAGg4rCIRkTLtMqCjztxQv
 AImujyKOROsE+WUyTvErplm6dKHsfOgyEv5JJ1hSVPExxmbbHfSR6B+4fSicdViUancm
 iJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vzXOfe3LQJ1tPjw4mGTlBd2Hha/B9WB2NE4h+LPHsM=;
 b=NVe2ON7cE4I1wNofpJWilHm4AMmUF/m10vnnxbz9RFP5VsJM5HxCgNmaihB+Pr58HT
 6EQ1noYN0fmjEWkY7QKeJfDOo/k1k+/CdnYv/kl0u8T8HpopVE7tQCqdHZrkIUMHTr5/
 RT3gLyazzbpTMODB6F3HYk6Wdsv/akJjanspF/j6CDppX32ygofkisKM5fZp2r+j8Z1x
 kmxxYNBeLrbjo0S7nFxxePHGyewpQKaUnGsaX72VwXesjpZ32+LxLr5qGSOoyJZO34Jg
 fweTlPkaZhO8rOp8zLtLEWbO2+NVyBadBbD9i4Xo8+fASRt4WHkwYESZFXeMMpxaHpCr
 AHzg==
X-Gm-Message-State: AOAM530sYbA2SytnLd86o0v/e0dkXCpmsk0w55UP2qnPMMHG5CbAiCvm
 OuXc8tWqN1RPNDRrB4OLwKSkNA==
X-Google-Smtp-Source: ABdhPJxQroqDiuh4YZmo0CrJXSKpglFCwdy1Ztrmqj30qO0MXpAppEYJtzGiZ8+5YyyQWuEL8dUjvA==
X-Received: by 2002:adf:e551:: with SMTP id z17mr4904423wrm.374.1604699411021; 
 Fri, 06 Nov 2020 13:50:11 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/19] drm/amd/amdgpu/amdgpu_device: Provide documentation for
 'reg_addr' params
Date: Fri,  6 Nov 2020 21:49:44 +0000
Message-Id: <20201106214949.2042120-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjU5NDogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmVnX2FkZHInIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdw
dV9kZXZpY2VfaW5kaXJlY3RfcnJlZycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYzo2MjQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3Jl
Z19hZGRyJyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfZGV2aWNlX2luZGlyZWN0X3JyZWc2NCcK
CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFy
by5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCmluZGV4IDMwMGZjYWRlNGEyYjEuLjYzMzc0ZDEyZTAwZmUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTU4NSw2ICs1ODUs
NyBAQCB2b2lkIGFtZGdwdV9tbV93ZG9vcmJlbGw2NChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdTMyIGluZGV4LCB1NjQgdikKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKICAq
IEBwY2llX2luZGV4OiBtbWlvIHJlZ2lzdGVyIG9mZnNldAogICogQHBjaWVfZGF0YTogbW1pbyBy
ZWdpc3RlciBvZmZzZXQKKyAqIEByZWdfYWRkcjogaW5kaXJlY3QgcmVnaXN0ZXIgYWRkcmVzcyB0
byByZWFkIGZyb20KICAqCiAgKiBSZXR1cm5zIHRoZSB2YWx1ZSBvZiBpbmRpcmVjdCByZWdpc3Rl
ciBAcmVnX2FkZHIKICAqLwpAQCAtNjE1LDYgKzYxNiw3IEBAIHUzMiBhbWRncHVfZGV2aWNlX2lu
ZGlyZWN0X3JyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAgKiBAYWRldjogYW1kZ3B1
X2RldmljZSBwb2ludGVyCiAgKiBAcGNpZV9pbmRleDogbW1pbyByZWdpc3RlciBvZmZzZXQKICAq
IEBwY2llX2RhdGE6IG1taW8gcmVnaXN0ZXIgb2Zmc2V0CisgKiBAcmVnX2FkZHI6IGluZGlyZWN0
IHJlZ2lzdGVyIGFkZHJlc3MgdG8gcmVhZCBmcm9tCiAgKgogICogUmV0dXJucyB0aGUgdmFsdWUg
b2YgaW5kaXJlY3QgcmVnaXN0ZXIgQHJlZ19hZGRyCiAgKi8KLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
