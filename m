Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143CD2F4DA3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BD36EA64;
	Wed, 13 Jan 2021 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED436EA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c5so2409744wrp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cx+Lvpr+opVztxwCrpEEue+3ZpAhdFGYil/Lm2hEOBU=;
 b=ClTWBKea4vm3y9ZVGUdkzqdOECtwhR9PudkWuiyjwsis41BqC493w/zvDp2ojr1Xuc
 ZKnKrxsByJZR0AsZRzPwnncxKrIpJo8q/JxnXgt5uVjgHffxSyJ/m/GiYYZFr0k/fKPF
 mAUTMzojahcDs+ltW3aBgJgY0pUiUSDu1uCQsHcM5514XCdauiHH8Frr9ruELCw0BD/E
 FTVVet0fiPEihuRkcU9+1jE680PoB0pOR4Fx8MdQ56p1l1lAxW4F53kcOf3dMgFbW0wD
 nLFBJyF35Zz+nr0o3nFYMPOFbn8EmarY0vsbpWCUmYqEvxpBpYIoiNLTuo7DHxfJGp22
 4RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cx+Lvpr+opVztxwCrpEEue+3ZpAhdFGYil/Lm2hEOBU=;
 b=m92Hj37/sgWizPZQza2PDa2Z4HtWBjf4UtZKUv846QO1D7VBh6pGp2SMFgcjJacswn
 bc3g9hs1/u/KnZy1uACFENNYlI6fmAlUjgCpAjM0wXRht73U6GXsL2EZ0myqqR+h6UwN
 hkH8oW+khulKQkvCa9Rr9OoGQu3w9f6C/OEJnMOEHnKJdNyJTkpyFOJT8SCkYnoJ5kOM
 rp+DwrZFCmqrohpkCtLA8XjTgHT1Il6Qu21AR3IXvPEoHlub9i9GRh7DG5MFSpfg9Yda
 44B8x0aLFAi0Qy//hsTcF6dx67TP8E48obxlhxYYjxatt0OLd5/QHl6KKdP2XTgOPXfo
 DM1w==
X-Gm-Message-State: AOAM533pnlkgN2AgV1N90GNGGs91dAHOqstyCf4OQMQFD32mkZJaME5S
 ZREm/hSYYer0faA1LZ4nr31xAQ==
X-Google-Smtp-Source: ABdhPJy85VePePA0CqsKm5siGrKpak6OmOYMGqGLRupA7S/S8zgvi5kBWxRpHIlYj831TLmAru4Taw==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr3094653wrw.247.1610549449265; 
 Wed, 13 Jan 2021 06:50:49 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/31] video: fbdev: mx3fb: Remove unused variable 'enabled'
Date: Wed, 13 Jan 2021 14:50:03 +0000
Message-Id: <20210113145009.1272040-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Software Engineering <lg@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9teDNmYi5jOiBJbiBmdW5jdGlvbiDigJhzZGNfZGlzYWJsZV9jaGFubmVs
4oCZOgogZHJpdmVycy92aWRlby9mYmRldi9teDNmYi5jOjQ0ODoxMTogd2FybmluZzogdmFyaWFi
bGUg4oCYZW5hYmxlZOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQoKQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+CkNjOiBTb2Z0d2FyZSBFbmdpbmVlcmluZyA8bGdAZGVueC5kZT4K
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvbXgzZmIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9teDNmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9teDNmYi5jCmluZGV4IDg5
NDYxN2RkYWJjYjYuLmQxYzhmN2E5NjlhYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvbXgzZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L214M2ZiLmMKQEAgLTQ0NSw3ICs0
NDUsNiBAQCBzdGF0aWMgdm9pZCBzZGNfZW5hYmxlX2NoYW5uZWwoc3RydWN0IG14M2ZiX2luZm8g
Km14M19mYmkpCiBzdGF0aWMgdm9pZCBzZGNfZGlzYWJsZV9jaGFubmVsKHN0cnVjdCBteDNmYl9p
bmZvICpteDNfZmJpKQogewogCXN0cnVjdCBteDNmYl9kYXRhICpteDNmYiA9IG14M19mYmktPm14
M2ZiOwotCXVpbnQzMl90IGVuYWJsZWQ7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAogCWlmICht
eDNfZmJpLT50eGQgPT0gTlVMTCkKQEAgLTQ1Myw3ICs0NTIsNyBAQCBzdGF0aWMgdm9pZCBzZGNf
ZGlzYWJsZV9jaGFubmVsKHN0cnVjdCBteDNmYl9pbmZvICpteDNfZmJpKQogCiAJc3Bpbl9sb2Nr
X2lycXNhdmUoJm14M2ZiLT5sb2NrLCBmbGFncyk7CiAKLQllbmFibGVkID0gc2RjX2ZiX3VuaW5p
dChteDNfZmJpKTsKKwlzZGNfZmJfdW5pbml0KG14M19mYmkpOwogCiAJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmbXgzZmItPmxvY2ssIGZsYWdzKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
