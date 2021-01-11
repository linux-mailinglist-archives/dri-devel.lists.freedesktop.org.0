Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C52F1ED3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F302E89DC1;
	Mon, 11 Jan 2021 19:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE4E89DC7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c5so928677wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RuOitA3aMnrp8CglwtShTzzn7jDAI9y/ji+mu/BKLpU=;
 b=FHGS3Yz4+1uqLaYb51IUybjr25DwHxn1LcCJZAw4g9amf/enmcfg+DhtQu8GqokZvd
 bDFkCeC4jt80rWilLOaSekS/ChX6BJgQBMXV0oKw57dzcusfRhsmLBxSqlDnqxm+FW32
 pHB7qQWTfaCxgNNQIM25xK+ga20o2fgDYfu5ed5Mz0vmCd8ZxWEwo/tVRYMUgkx841kE
 RAqQLZd4dmSTHYAEVuJMgSnOCJI8bCU9jORkq7sogYyYD2+mw/h7s51KSuIWtIf31tVm
 BamR5VUzQNm9cTnCJkfVSUD3oGWvdBUFwKe3yWpLxI6pv9zC4enlxSoaogztlqTzEf8Z
 jcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RuOitA3aMnrp8CglwtShTzzn7jDAI9y/ji+mu/BKLpU=;
 b=XoW51gcgqXgOXIZ+WYgh8pLoL1t3P5Gsct4GFDP8jQpsvjsBtnLf/g1T8eRYiAEBFR
 Ho95xMvR6X8YbGfT3aR4Ob63yXQ7ST7sCdTrgHZGFx5t47/kQVoQrf7Tr5o3YYvGBN7d
 w92p8z27bTa5BsA3UyLSOtSEHTmmgydkzaEtLIWQlS0Om9hLi4LhiK/XywPvDOX0egmA
 /J6TFKKywh3Cor8Hzsf5IBDhZi3V3ZZ4umkxpT3pEdTTlaxnqp9wofiQVhTAUYHL3Ip5
 YLcyxTGcztRESrMJ8VM7b3b2g4mVpfYvn3ShSdhGHcUfC0RPWecaFFVKJD7CxPrTadt/
 XzhQ==
X-Gm-Message-State: AOAM5328L9JpGC+Q4REG3Hztr1nYlLO0LAI4doAl4KwW2mLvFqaZhPe/
 qF4CvMD/H/Zgy6HumIoF7NnBIg==
X-Google-Smtp-Source: ABdhPJy5k5eTrlHXOd41/BzzmGq1UKuzMUpQHvfEJQfMsk1I4ii8bHCBtOi5cka5gfRVT5eRzU1n2A==
X-Received: by 2002:adf:c454:: with SMTP id a20mr594473wrg.314.1610392771765; 
 Mon, 11 Jan 2021 11:19:31 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/40] drm/amd/display/dc/dce/dce_aux: Mark
 'dce_aux_transfer_raw' as __maybe_unused
Date: Mon, 11 Jan 2021 19:18:47 +0000
Message-Id: <20210111191926.3688443-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jOiBJbiBmdW5j
dGlvbiDigJhkY2VfYXV4X3RyYW5zZmVyX3Jhd+KAmToKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYzo1Nzk6Nzogd2FybmluZzogdmFyaWFibGUg
4oCYYnl0ZXNfcmVwbGllZOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzog
TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfYXV4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9hdXguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Uv
ZGNlX2F1eC5jCmluZGV4IDMyMDQyOTJhNWFlYWUuLmQ1MWI1ZmU5MTI4N2QgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCkBAIC01NzYsNyArNTc2LDcg
QEAgaW50IGRjZV9hdXhfdHJhbnNmZXJfcmF3KHN0cnVjdCBkZGNfc2VydmljZSAqZGRjLAogCSpv
cGVyYXRpb25fcmVzdWx0ID0gZ2V0X2NoYW5uZWxfc3RhdHVzKGF1eF9lbmdpbmUsICZyZXR1cm5l
ZF9ieXRlcyk7CiAKIAlpZiAoKm9wZXJhdGlvbl9yZXN1bHQgPT0gQVVYX0NIQU5ORUxfT1BFUkFU
SU9OX1NVQ0NFRURFRCkgewotCQlpbnQgYnl0ZXNfcmVwbGllZCA9IDA7CisJCWludCBfX21heWJl
X3VudXNlZCBieXRlc19yZXBsaWVkID0gMDsKIAkJYnl0ZXNfcmVwbGllZCA9IHJlYWRfY2hhbm5l
bF9yZXBseShhdXhfZW5naW5lLCBwYXlsb2FkLT5sZW5ndGgsCiAJCQkJCSBwYXlsb2FkLT5kYXRh
LCBwYXlsb2FkLT5yZXBseSwKIAkJCQkJICZzdGF0dXMpOwotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
