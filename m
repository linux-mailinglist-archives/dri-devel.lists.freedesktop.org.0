Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1A62F1EDC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B0989E11;
	Mon, 11 Jan 2021 19:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905D89DED
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d13so879325wrc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qokjD6k+LHHF78mVRlZu4OQtVVLhVZTnUnkH0SWg7U4=;
 b=Y7hRLpaw1tA7qK1gE0XMTHNgfJoJa25sR2HTvgV5c7RjonfBp0XE2iRIsnCFMtGO39
 S+NEpJl2eaEmALDQRKx8ppkwsCoVWE3be6ZZJFzOuP67Xvztt95hteobDRDSxOb/95MM
 lKRVIyo4wj/LQnNfBuNrjra9ty8cH1ugArBlzNWr6EHFKCOUdEWycKG234cNehdzJ+wP
 0QDVGyYLbpKAFH1a21yyszuVT9kl0cgGtmbtDEQiL1HpMRc+hvrgqhNAQ37t/CyQBE/L
 UwaAKv90//Snerjrws6nYy8YrKhwdfpClNDZ0IvSLAcuPPQJeDDzpFV92/gqloYExeN0
 eYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qokjD6k+LHHF78mVRlZu4OQtVVLhVZTnUnkH0SWg7U4=;
 b=Hx6AGO/SlRj27FnPkbhyE7PLqlnvfFuTNvEa582cd6+sImP6gQIO1A2rWaAXzRzC9E
 J3IyLQ+wcSW1cFAVNf8FRnIhJlGR58z0PG7wU7pX6/2pLM9QuYKNVcxTV2w29FzJXFdB
 05X+h23Gv3zNVNa600dd5EJhgqSvdym1OiqxEbco9a9oThtBBhiFePfH2x6zsBvYHYEA
 eWZ4rg3GiUdsFJ51lPMqtjp4qnyDykIWHASiApbc+GDdw4X/Z/540dtjwbpAa5HDEcXm
 JYAbpYpxqpUuHyrGxgTc0nv9NfjZxG/wueG4hsX8L/ryYuHkmDlE3ZMeL/tcnwMdJFM4
 gNCw==
X-Gm-Message-State: AOAM530GWA3Bh5R1wIN385Sas0V/NsNtCGaYJGRfjTjQ/NK8DrRPo481
 1WPWucO5Sln64MuszC28KgijsQ==
X-Google-Smtp-Source: ABdhPJzjSnGz3m69nDkME1UYSAct3l1QQN+GkRACjqqKTZWxnotX0x9Ssham7MB2ZUEAb0ssDpTGyg==
X-Received: by 2002:adf:c449:: with SMTP id a9mr570620wrg.281.1610392780828;
 Mon, 11 Jan 2021 11:19:40 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/40] drm/amd/display/dc/gpio/diagnostics/hw_factory_diag:
 Fix struct declared inside parameter list error
Date: Mon, 11 Jan 2021 19:18:54 +0000
Message-Id: <20210111191926.3688443-9-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X2Zh
Y3RvcnlfZGlhZy5oOjMwOjQzOiB3YXJuaW5nOiDigJhzdHJ1Y3QgaHdfZmFjdG9yeeKAmSBkZWNs
YXJlZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3Qgd2lsbCBub3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9m
IHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X2ZhY3RvcnlfZGlhZy5oOjMwOjY6
IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmGRhbF9od19mYWN0b3J5X2RpYWdfZnBn
YV9pbml04oCZIHdhcyBoZXJlCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2dwaW8vZGlhZ25vc3RpY3MvaHdfZmFjdG9yeV9kaWFnLmg6MzA6NDM6IHdhcm5pbmc6IOKA
mHN0cnVjdCBod19mYWN0b3J54oCZIGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxs
IG5vdCBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhpcyBkZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9u
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3Rp
Y3MvaHdfZmFjdG9yeV9kaWFnLmg6MzA6Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg
4oCYZGFsX2h3X2ZhY3RvcnlfZGlhZ19mcGdhX2luaXTigJkgd2FzIGhlcmUKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od19mYWN0b3J5
X2RpYWcuaDozMDo0Mzogd2FybmluZzog4oCYc3RydWN0IGh3X2ZhY3RvcnnigJkgZGVjbGFyZWQg
aW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlz
IGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od19mYWN0b3J5X2RpYWcuaDozMDo2OiBub3Rl
OiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiDigJhkYWxfaHdfZmFjdG9yeV9kaWFnX2ZwZ2FfaW5p
dOKAmSB3YXMgaGVyZQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
PgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od19mYWN0b3J5X2RpYWcuaCAgIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X2ZhY3RvcnlfZGlhZy5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3RpY3MvaHdfZmFjdG9yeV9k
aWFnLmgKaW5kZXggOGE3NGY2YWRiOGVlZS4uYmY2OGViMWQ5YTFkMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3RpY3MvaHdfZmFjdG9yeV9k
aWFnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGlhZ25vc3Rp
Y3MvaHdfZmFjdG9yeV9kaWFnLmgKQEAgLTI2LDYgKzI2LDggQEAKICNpZm5kZWYgX19EQUxfSFdf
RkFDVE9SWV9ESUFHX0ZQR0FfSF9fCiAjZGVmaW5lIF9fREFMX0hXX0ZBQ1RPUllfRElBR19GUEdB
X0hfXwogCitzdHJ1Y3QgaHdfZmFjdG9yeTsKKwogLyogSW5pdGlhbGl6ZSBIVyBmYWN0b3J5IGZ1
bmN0aW9uIHBvaW50ZXJzIGFuZCBwaW4gaW5mbyAqLwogdm9pZCBkYWxfaHdfZmFjdG9yeV9kaWFn
X2ZwZ2FfaW5pdChzdHJ1Y3QgaHdfZmFjdG9yeSAqZmFjdG9yeSk7CiAKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
