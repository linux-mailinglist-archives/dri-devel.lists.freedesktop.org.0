Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8682AC6D4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C9389336;
	Mon,  9 Nov 2020 21:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456328913D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so10372074wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1FKv2blGXbscAB7wKDEc1cac5g15gUeFIAgqfSJF6w=;
 b=FioJyxPLeJAUtobkLDaKIkmME9xBKEy47Q9FG/W/6yyZv2S0N5LgGTxjipqJH0Ic7z
 7O7aoSIH0b6KWnTCeiLyOlX4PzanvzFhWVpR5qoa0amSEfrtzUxepB6fY5WLRJ5Jfnzm
 c2dNShFGlyjTrh/hS4rsX1zH+8qYiS6WOQ67brpZ7qzIgUOHVvSwuWENmC9jIFj645MA
 Xb33uxmCmy6o2SGrzeyUwHROne1dbDp9fNKNXUfk9+yFZ1dsf8gX3f4tLB/9FuW590/1
 VLciwVZw8Kh8nvtdTJ2ejXFLbWRrQ68+EyhhQ4bPpezIErzIqIbGGJ9GOki4QtKA/G8m
 tiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1FKv2blGXbscAB7wKDEc1cac5g15gUeFIAgqfSJF6w=;
 b=a3PMiRV8WD+VJiUHf0247Sicp6/KF/3adSeehVUp0UjzhtfgjSPjTsgWl4XyYMsIy2
 gk8GwW4c4E0W5jJiFBPzSaQgsXcQQVnwgSwd3IbQeMjTTBBBeuwvhLdLWZ6TtePiJq4B
 3diytB8pUtxRPOSwWgUvZj3A/LJ9y8JZ2CuqSEhEDf6P+FCGieCEPhfjgK4ewXGARu+M
 JGJVOXh7Ju5ZFe95si47pP77VWU2C0ACihjq7MCTYrrYLh5mJGjSWvndWXtq0AIo9jWY
 E7qsO9KdSHivq9PkxtH1PWf+ylyTP2Ih0NCPCxxGLIwSGy9AOh55DULwtXPQtzTszJm+
 depg==
X-Gm-Message-State: AOAM530+B6ssqAF0gQHI3A14E3WpAf+Nfo/4Pu3Gx3pqCFjAMKn2lDYB
 kstGY8c4nk+DhvRdQZm5puUqVfdzkRG/s0yV
X-Google-Smtp-Source: ABdhPJzNnYeInLP+RtXqqmtawFUWK07GI7u6mpPZ0kizGCkgqhol2+QTYdIKxwXXMGpk9hHbdCma7w==
X-Received: by 2002:adf:f546:: with SMTP id j6mr6858247wrp.219.1604956763980; 
 Mon, 09 Nov 2020 13:19:23 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/20] drm/radeon/radeon_i2c: Remove pointless function header
Date: Mon,  9 Nov 2020 21:18:43 +0000
Message-Id: <20201109211855.3340030-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmM6NDY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3JhZGVvbl9jb25uZWN0b3InIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVv
bl9kZGNfcHJvYmUnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pMmMuYzo0Njogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndXNlX2F1eCcgbm90IGRlc2NyaWJl
ZCBpbiAncmFkZW9uX2RkY19wcm9iZScKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25faTJjLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2kyYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKaW5kZXggNTQ1ZTMxZTZjYzNhOS4uYWE2MWIzY2I0MDQ5
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKQEAgLTM4LDEwICszOCw2IEBAIGV4
dGVybiBpbnQgcmFkZW9uX2F0b21faHdfaTJjX3hmZXIoc3RydWN0IGkyY19hZGFwdGVyICppMmNf
YWRhcCwKIAkJCQkgICBzdHJ1Y3QgaTJjX21zZyAqbXNncywgaW50IG51bSk7CiBleHRlcm4gdTMy
IHJhZGVvbl9hdG9tX2h3X2kyY19mdW5jKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCk7CiAKLS8q
KgotICogcmFkZW9uX2RkY19wcm9iZQotICoKLSAqLwogYm9vbCByYWRlb25fZGRjX3Byb2JlKHN0
cnVjdCByYWRlb25fY29ubmVjdG9yICpyYWRlb25fY29ubmVjdG9yLCBib29sIHVzZV9hdXgpCiB7
CiAJdTggb3V0ID0gMHgwOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
