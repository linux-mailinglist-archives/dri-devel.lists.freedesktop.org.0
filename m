Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1E362281
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E2D6EC07;
	Fri, 16 Apr 2021 14:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE086EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j12so7532368edy.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDb62l+8C+YekUvtP2oUdE/QSSZdTHGqGLcmgtoRZ6A=;
 b=OEAZ6pguOUQ94jMlXQzmtQ7QFPzW5+1bIvMTPHQc6HJS+PcftJ6AF9Jo3cQY1raYir
 GcbbzBVqcto6mrFzlum7j3SE/HIpRj5EGQdlmzu0Fj2vW+g/XCoRlkp2nxMM9p80xnjN
 vridHysscUhssHNwEDny1VZ+bPTMhH94/K9wuMQzKCovSqSc+zCdtztyo8NQdCHamczB
 cVL2Cl8+3ZMMjVYMOfaQyG1MwZg9FpTT9u6WJ1lQ7gR40O4/xmJh4Irk55PnetEtInV0
 6+Hnu82JjUPCmQZWm4nEwmkdACQTiH3m3m6A+KHdCRz//PskTjJtDFX0d62j26DVAaDr
 B5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDb62l+8C+YekUvtP2oUdE/QSSZdTHGqGLcmgtoRZ6A=;
 b=inI1sMunk+afOAVwacEhd5L8AxiT3pS4QyP+Y53ArVmUz0sPQLrQNDsGdsgSbyq0kY
 ryGAbVp04hM8Zd2jfhOfqZLzpgrqHnQ/5WsG2QlmuJ/5fKC4YlNYuwnx9a12DD+YvFX/
 ZuyZd1Ejp706smOm+Us+wlgUJUSdQU5APPacPy2KBO+0yD6nuksczu5TAh24gP2bUtwU
 372KYXnXesJXCKMtAU3KcxSUj4K2jxMv4JIZaj+KJC4HKP2wDSub+CBMv9aviNmS0k9x
 HsgUVjRQ0pFRniODXkbZo0lQE/bv4L7gZ+GSoDpFcFqnZHV4Dp6Ygp8/OMXZrtDhjSbf
 tHAQ==
X-Gm-Message-State: AOAM531AB48wuFvdnDMRBaqAuLoIuCnAoRo6db8fm688+6eHrOtE15Qf
 /RIQbWufctELrqSTBJXtsfr4MQ==
X-Google-Smtp-Source: ABdhPJxeW5Nq4C2iQB/wfPS4zsFgvxhhdWRVuw6s5n3b8DbFsnkP2EkcK4Air1ZTyXmKgbiYULFGiw==
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr10546460edu.124.1618583859364; 
 Fri, 16 Apr 2021 07:37:39 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:38 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/40] drm/nouveau/nouveau_display: Remove set but unused
 variable 'width'
Date: Fri, 16 Apr 2021 15:36:53 +0100
Message-Id: <20210416143725.2769053-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmM6IEluIGZ1bmN0aW9uIOKAmG5vdXZl
YXVfZnJhbWVidWZmZXJfbmV34oCZOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmM6MzA5OjE1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJh3aWR0aOKAmSBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kaXNwbGF5LmMKaW5kZXggZGFjMDJjN2JlNTRkYy4uYmUyMzI3Y2U3Mzk0YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKQEAgLTMwNiw3ICszMDYsNyBA
QCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVj
dCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KGdlbSk7CiAJc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmI7CiAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbzsK
LQl1bnNpZ25lZCBpbnQgd2lkdGgsIGhlaWdodCwgaTsKKwl1bnNpZ25lZCBpbnQgaGVpZ2h0LCBp
OwogCXVpbnQzMl90IHRpbGVfbW9kZTsKIAl1aW50OF90IGtpbmQ7CiAJaW50IHJldDsKQEAgLTM0
Myw5ICszNDMsOSBAQCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAogCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOwogCiAJZm9y
IChpID0gMDsgaSA8IGluZm8tPm51bV9wbGFuZXM7IGkrKykgewotCQl3aWR0aCA9IGRybV9mb3Jt
YXRfaW5mb19wbGFuZV93aWR0aChpbmZvLAotCQkJCQkJICAgIG1vZGVfY21kLT53aWR0aCwKLQkJ
CQkJCSAgICBpKTsKKwkJZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX3dpZHRoKGluZm8sCisJCQkJCSAg
ICBtb2RlX2NtZC0+d2lkdGgsCisJCQkJCSAgICBpKTsKIAkJaGVpZ2h0ID0gZHJtX2Zvcm1hdF9p
bmZvX3BsYW5lX2hlaWdodChpbmZvLAogCQkJCQkJICAgICAgbW9kZV9jbWQtPmhlaWdodCwKIAkJ
CQkJCSAgICAgIGkpOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
