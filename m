Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F92C0414
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19E089DA2;
	Mon, 23 Nov 2020 11:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02816E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 64so4789033wra.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZm3HjDLtuJtZU/XUCLzOUL6uLBwe5Uw6r19LFGVc9A=;
 b=bmCfHxZJ1vAkBYRpM/TJqbpjN3yQIiw6Ll3iX6wkxuI8OSLnT++wMOyhXAGOSa207/
 9dmUzZzcImyF/HxDtNRp2NJrhQErZx/29kkI/jQGOz4eqGgCj5IxH78nRIxI8GLLRvA7
 Xqgljx5855/GXYD9i/gx+o6tTuHJARHSzgqwjIF6Mfru8W2jm8mGAS2XywvDyVEvDIdN
 HuLEtfpKLBl5gXhF/mTVbf/GDxRZB0aWa1LmYe0k+Dw2hcQkRexBQ5viKK6mcu32KzCh
 XDqYcnQowCiNtR9Xm1JT/hOf6PDs4eU3SmxURpKV2V/CY2HYB4beM2egWgC8qFK2SHAl
 k8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZm3HjDLtuJtZU/XUCLzOUL6uLBwe5Uw6r19LFGVc9A=;
 b=ROGGKaBdit6mzxqJF6ONQjcEP2a8/AcIwFHQ/XE8vB3CODj5PUaQwPuHmnCpNCJO2w
 nxD253l2BGC3xCnrfrOnzU+AkYYk7I/ntazIgeWP1U5wbP60HzkrMfzusDXLgPaLHTk+
 pnr7v0OA1FRB+pALOiwW8qoxembg94YA2XuHfRM7w1dW6QaSMG3ieBxAuQMz6wAEEZ/b
 LQWq3JJKpQrBIqNDiOxigMKU6VvEutRp5hLhQz+RZ9DAyxbDNPwUfB2kWvKNEcCFAtky
 LJxCLxZX72QI2q1Wt6Yk9r82Vg2ByHShiFFr2PdYF1dCZmVCVycgRWEsC+nX5BVBDwFX
 x4wg==
X-Gm-Message-State: AOAM530Y52gJW7ZCPl+3n1iCxs/Ay/F+GHTiNNv7NgH7o99n2UeyaHVY
 ScMg8B4RhVb1tj7iPelPFtOrug==
X-Google-Smtp-Source: ABdhPJxPBCZyllGUhZ7EDFlbon05niAgISM1TfU092j3FBydqizzyNzorBFzF6SxdKtD3NZF4RiAJg==
X-Received: by 2002:adf:fa10:: with SMTP id m16mr29521329wrr.194.1606130364573; 
 Mon, 23 Nov 2020 03:19:24 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/40] drm/radeon/radeon_device: Consume our own header where
 the prototypes are located
Date: Mon, 23 Nov 2020 11:18:40 +0000
Message-Id: <20201123111919.233376-2-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmM6NjM3OjY6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2RldmljZV9pc192aXJ0dWFs4oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNl
LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZGV2aWNlLmMKaW5kZXggN2YzODRmZmU4NDhhNy4uYWQ1NzJmOTY1MTkwYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMKQEAgLTQyLDYgKzQyLDcgQEAK
ICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9yYWRlb25f
ZHJtLmg+CiAKKyNpbmNsdWRlICJyYWRlb25fZGV2aWNlLmgiCiAjaW5jbHVkZSAicmFkZW9uX3Jl
Zy5oIgogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgImF0b20uaCIKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
