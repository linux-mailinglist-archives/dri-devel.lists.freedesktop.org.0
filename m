Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C872B1C49
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADFF6E511;
	Fri, 13 Nov 2020 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615166E513
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so10001991wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9ZMy9yV2j61eWz6SjAdF0UqQLfaNl51XLKZiRseNxA=;
 b=XgoN5UROCU74VPm0D6Gls7Y1ukWa5LQzEWehKotsuQV5kktrJh+HttfN1sHyw4l5/g
 07v8zOyhGYA21GAy3RlWbSHEisIPtE2LF/+VLLhtjSmvQb9dsNSMY8L2xN66Zlf1K7d8
 6RF4WZoD0y0TB3RoLJURUnsMHyS2azk2aYXQZxPAquIrGnFIviJ3lIttEqdiQpCFFgRM
 lWoNVox2yrau1SurBJYU+y2EscCGmhnVbuO15ymULXP0EtxutOTj1R90QiCX96UWYX1g
 32HpSCBEM3I6h15HD6MxmSj/7jJP+vEtL6UHjfQKpbWwHuzPJrvM59B9DjLlElzF+Wim
 CX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9ZMy9yV2j61eWz6SjAdF0UqQLfaNl51XLKZiRseNxA=;
 b=O31uU9MywwMUYlOh0QDy1aXXsenLXkhmhlOF7lTSSo+bkPlFrLKH7m6gNHdatZMT/L
 RLapw2nZyP0PSsrgubTB85NkldvK5cqYEHc81uz15kVCZuAA11TboTU/36zHyxibcDJ3
 a+UQVWfrNwMcoLNQSYK6Z7YOEJVKVDl4jToNFlaj0zSpGQd7cvF1SbAKXqHs+oUzzD5S
 lz0KTuUKZw+OLZfHMRDKNCRP0/+gF+2DzXBuzfTEIzE2/hwo3M2CvA9BKbPlEpDudd4n
 PjEcON3uVSUeMEBhLWqACZGa+PPubsKLz/qih9JMVZhTyp0Cc6nGe2zvPPFqwq4nQxK5
 CKqg==
X-Gm-Message-State: AOAM531nexGbaAglaffqbD6hDFff9XImtByflUm319d4RBtoDNJsUTqm
 ah7TSQsAOcJhmVbVsyCRfyAoOQ==
X-Google-Smtp-Source: ABdhPJyt3UaqN0DY3PXZIq/9W20F0CsxHUADWPQiQ1mTODJ4G8vQQUO48TILVZYfO5zUlhQ++MrN6Q==
X-Received: by 2002:adf:e945:: with SMTP id m5mr3445312wrn.98.1605275414993;
 Fri, 13 Nov 2020 05:50:14 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/40] drm/amd/amdgpu/amdgpu_ras: Remove unused function
 'amdgpu_ras_error_cure'
Date: Fri, 13 Nov 2020 13:49:25 +0000
Message-Id: <20201113134938.4004947-28-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jOjkwODo1OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGFtZGdwdV9yYXNfZXJyb3JfY3VyZeKAmSBbLVdtaXNzaW5n
LXByb3RvdHlwZXNdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YyB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGI5NjI2NzA2OGE3MmQuLmY4OWE5OTE5
OTk0MjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTkwNSwx
MyArOTA1LDYgQEAgaW50IGFtZGdwdV9yYXNfZXJyb3JfaW5qZWN0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAogCXJldHVybiByZXQ7CiB9CiAKLWludCBhbWRncHVfcmFzX2Vycm9yX2N1cmUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCXN0cnVjdCByYXNfY3VyZV9pZiAqaW5mbykK
LXsKLQkvKiBwc3AgZncgaGFzIG5vIGN1cmUgaW50ZXJmYWNlIGZvciBub3cuICovCi0JcmV0dXJu
IDA7Ci19Ci0KIC8qIGdldCB0aGUgdG90YWwgZXJyb3IgY291bnRzIG9uIGFsbCBJUHMgKi8KIHVu
c2lnbmVkIGxvbmcgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJYm9vbCBpc19jZSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
