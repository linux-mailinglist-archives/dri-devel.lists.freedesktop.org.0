Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FB2F1ED8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252689DF7;
	Mon, 11 Jan 2021 19:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922C889DEC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t16so948849wra.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VAJr/GrILhLZ43nh9MNYnDn6VtEAVAp1VLhyj8VjtZY=;
 b=ZKvYlOSzjGWKUDGJudDlR+nNT4HXGZeiYCmcLqgSbXIAWWaMK3TVGyu5ojYZStFVAk
 ucVfGCsMKfaal5fZbPscd/OGWdciwFyLxC9UiSU/y2BCZCdw1+y4SBDTXhDPKrHL36S6
 iBxBetqmGUNT5sVgq5B3rDMbiStK1hSZ/XcRTqC/G0/wurOtC9e+QSqZIxHackHdBx3u
 qg5ntYjG+SQu8YWCFi444oT7avvkhVrdmaV1RbjPqDIv9IxQHmekARKG2jax7yvLhTuW
 HJBjzy9NW7H5Fi2dWH+LIhE/mNsar4fIe37QvruE2KCfoEnKlOt4axe2jydNyMfaPcEG
 PLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VAJr/GrILhLZ43nh9MNYnDn6VtEAVAp1VLhyj8VjtZY=;
 b=t2baQhgmcGfgCxbnu7gX1AVhNtvP0ysusHm6MXAEKxNe60d1iAYR145+6/iFy0oR3N
 1Ku7tuGZgHql3XUm+jwx66yMCakNe/ktkpmk2UuZa/yGbY4q8i9b7y2vvXgWC7nHPOKi
 E2xYoAjhr8M8sNWZVEndQbIbKW9LIKCJgBDKfro3EsypNF8kNonOqhblMpekBpG1oLsh
 0ITk4YK1YPL6R9mkv2tBzoXjwwF6WVyXIG1rjUzNULxJqSbIpQHAt0HkLpyqXN+GhDfe
 LWjl5HQpO85BcxSBZNfIlaJj72tUCWxpCManC8X8hnE7viR4CRW2Oxoaar+7J5eraGwB
 X9Zw==
X-Gm-Message-State: AOAM530tuHIGwJHMxER8jRmEjpH8mrjIf9X2NFoSKZ+N/YQw2t16uK0m
 ADBkKxFHaAPH4LvCqP4Ul0PI8A==
X-Google-Smtp-Source: ABdhPJyLEv5ADsN6eDoo3NVId0gB3w6P/NI6vrkMSf6H7Uqh/VOpd2nc+kz2pDZ5kA3Irm/13zrPRQ==
X-Received: by 2002:adf:d201:: with SMTP id j1mr612338wrh.212.1610392778311;
 Mon, 11 Jan 2021 11:19:38 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/40] drm/amd/display/dc/gpio/diagnostics/hw_translate_diag:
 Include our own header containing prototypes
Date: Mon, 11 Jan 2021 19:18:52 +0000
Message-Id: <20210111191926.3688443-7-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X3Ry
YW5zbGF0ZV9kaWFnLmM6Mzc6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDi
gJhkYWxfaHdfdHJhbnNsYXRlX2RpYWdfZnBnYV9pbml04oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dw
aW8vZGlhZ25vc3RpY3MvaHdfdHJhbnNsYXRlX2RpYWcuYyAgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X3RyYW5zbGF0ZV9kaWFnLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od190cmFuc2xhdGVfZGlhZy5jCmlu
ZGV4IGJmOTA2ODg0NjkyNzEuLmU1MTM4YTVhOGViNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X3RyYW5zbGF0ZV9kaWFnLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3RpY3MvaHdf
dHJhbnNsYXRlX2RpYWcuYwpAQCAtMjQsNiArMjQsNyBAQAogICovCiAKICNpbmNsdWRlICJkbV9z
ZXJ2aWNlcy5oIgorI2luY2x1ZGUgImh3X3RyYW5zbGF0ZV9kaWFnLmgiCiAjaW5jbHVkZSAiaW5j
bHVkZS9ncGlvX3R5cGVzLmgiCiAKICNpbmNsdWRlICIuLi9od190cmFuc2xhdGUuaCIKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
