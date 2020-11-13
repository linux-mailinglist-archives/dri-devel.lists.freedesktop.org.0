Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD352B1C4C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B942F6E532;
	Fri, 13 Nov 2020 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105866E544
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so10001296wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4fbIgQuSd7qx2Uw2PNoVR5q/2EBKr9ikJs14+3PNgZs=;
 b=n4DRu6udIoyajnEV5cYhZElN9i8TgkAMzWGe2XXO8ZJAtYQn5MO7IMOTwcJKM7snU9
 JqPnyBnWOlcnU/T21rzOcwxuyqy/YqZQIRnFwrNhrXPMSSPdiF3vagDOA9lzf7m8sCkS
 P6upsPYAj91zk7+AQIlxbK4GxzVVMlYDAmdq7JzKe742gAi6bOyd1aJpogxYwpxPjfam
 6fh/2Jnt7GS3QFBfKuPgxTxVRHEsqcST5Z/5kex7Nd3qOzjB5szFrz1oHxHH1vSwV6nm
 JdwijeFcrJb6v608c3XTw2RKXAfMl3ruV4hyrimERbrJ75RNT8ou4IwZ4nP+zsSXYXX9
 niRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4fbIgQuSd7qx2Uw2PNoVR5q/2EBKr9ikJs14+3PNgZs=;
 b=n2FqvuaMqnOa5hJTAnzeLrjGlkFAw+iHP0YRyXGlq+AShBaVN6fBSXquJJa6OJValI
 HpPEW+nBKBNCsYIZ4ibgnisAy9mj/iXdyCvj06Rdsm3XVEqw9K0mseQZeyT95ulsAooH
 x1/iw3FXBS2shYcUAYlluKIr+h8+BDj4Js1y0rv90XqgcTyaGrVgrS+Y2s8hNqS2eUmz
 vZZlVcsl8BcxcgJpCwIxL0qkMx2MDZXzh7Sx9wR/i+UxNaPJJVmMjUFfTIG1Ld8wr5FH
 mrgP70q4RyHwhTDWCWoVohDDFXwBPo7f7vKsXpF71uvt6ajzj5xBTarohpJ4vqpBwBc1
 2UZw==
X-Gm-Message-State: AOAM531SKu0S8QrL7XnUEjnDvnyEfxbLt0yyBr/NBh3o1zJalXsT4g5R
 SQ9VCg7tOKZARMndv+gdQrotWQ==
X-Google-Smtp-Source: ABdhPJwRAPuVH+2vvmutSjwOa8Cia0gPuinTJS19FPHN1ooaNyDBXHTCw7kmrU3q3Z5aPZKc7t1QmA==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr3518812wre.282.1605275416485; 
 Fri, 13 Nov 2020 05:50:16 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/amd/amdgpu/amdgpu_ras: Make local function
 'amdgpu_ras_error_status_query' static
Date: Fri, 13 Nov 2020 13:49:26 +0000
Message-Id: <20201113134938.4004947-29-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jOjE0ODI6Njogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhhbWRncHVfcmFzX2Vycm9yX3N0YXR1c19xdWVyeeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXgg
Zjg5YTk5MTk5OTQyOC4uOWQxMWI4NDdlNmVmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYwpAQCAtMTQ3Miw4ICsxNDcyLDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jh
c19sb2dfb25fZXJyX2NvdW50ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB9CiAKIC8q
IFBhcnNlIFJkUnNwU3RhdHVzIGFuZCBXclJzcFN0YXR1cyAqLwotdm9pZCBhbWRncHVfcmFzX2Vy
cm9yX3N0YXR1c19xdWVyeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKLQkJc3RydWN0IHJh
c19xdWVyeV9pZiAqaW5mbykKK3N0YXRpYyB2b2lkIGFtZGdwdV9yYXNfZXJyb3Jfc3RhdHVzX3F1
ZXJ5KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkgIHN0cnVjdCByYXNfcXVlcnlf
aWYgKmluZm8pCiB7CiAJLyoKIAkgKiBPbmx5IHR3byBibG9jayBuZWVkIHRvIHF1ZXJ5IHJlYWQv
d3JpdGUKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
