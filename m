Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A62F45BD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319A789F2E;
	Wed, 13 Jan 2021 08:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B4D89F0A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q18so1084446wrn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gaeomoLKGJGFe9Jgp55uGAQ2Av3znwR4r6zsWFi8gnM=;
 b=a2yKsTYGdiUbLd2mWkidqDrvPlvZZ5FXmHZVOI/ZJt+qlTpDD0GPY4yO5CwlZ8HtQX
 0JP8bJnuDFhtIZX1D0dj9X0+M3/awU24gnWGEjvC+gnwrJdEgynvD5CPVCSHFPUtDrip
 gxbZ2yJ5xi/21obPp3WmjV+icfhym+bWGkbTX3nGf0YR/R1p/d4zP+hlk9ec8bHrgu/D
 IShsSLZkxsSIiirqu+vWB0t93ZDvQnGHPhgHHSUVLjbHqGz4HETSbmmvS9WX+nlcexj0
 WK/8uAY6iaR7JanaWIV2IJWncfRb0NRgC7UzcN6HSNHQ9IkLkQITeLeiOv658ORyBAbH
 nEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gaeomoLKGJGFe9Jgp55uGAQ2Av3znwR4r6zsWFi8gnM=;
 b=ItlZPirgRnCsxuiWe0RsItmIwQll/DczLvl+Pid/RTcwDLUL72LFcDzwH42Xf69FyM
 5DP7cBkmzs5bvbLzw0tHUWUTt1I4OYlPSHdd0Hl5dH/1xoFekwdG3jDzwsfqXrGKKw1o
 /RVjZlbpUUYl1ze/dYhuGFGIQvf6VXGwGkAhA/GxuxLzNlOSc6UuBKwinIDd5VPvRNzD
 qGPgW7uNwsaXMc8O5ysVthHRyncrInVpeADbuehJ1iV0MmOQAVAMYxyYDQ8u7tMXDjrR
 k+yi6e1rKHYvUAdv9kZL+as5Ph01Cz0dlpjIvKhXwJNNrGY8pg63lttTedzWIEb9Vyxd
 rQLQ==
X-Gm-Message-State: AOAM5322seH30POPg5O8xsT4JkrP08k9siK8sWceppZLQ5aHpDectwps
 FlvKbeFXuudCvxf0xGVuIw+PRw==
X-Google-Smtp-Source: ABdhPJxIZoMKbNb4w1ZkLvZdmGtnOn5BNOh8NDCqXHBOlvTSHKkCv5v+l8IjyN/hBBVS5ACPhV0amA==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr1203353wrq.19.1610525279883;
 Wed, 13 Jan 2021 00:07:59 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:07:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/30] drm/amd/display/dmub/src/dmub_dcn30: Include our own
 header containing prototypes
Date: Wed, 13 Jan 2021 08:07:25 +0000
Message-Id: <20210113080752.1003793-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kbXViL3NyYy9kbXViX2RjbjMwLmM6ODM6
Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkbXViX2RjbjMwX2JhY2tk
b29yX2xvYWTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kbXViL3NyYy9kbXViX2RjbjMwLmM6MTE4OjY6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZG11Yl9kY24zMF9zZXR1cF93aW5kb3dz4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRA
YW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBCaGF3YW5wcmVldCBMYWto
YSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RtdWIvc3JjL2RtdWJfZGNuMzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rt
dWIvc3JjL2RtdWJfZGNuMzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kbXViL3Ny
Yy9kbXViX2RjbjMwLmMKaW5kZXggZjAwZGYwMmRlZDgxYi4uN2U2ZjRkYmFiZTQ1YiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIvc3JjL2RtdWJfZGNuMzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZG11Yi9zcmMvZG11Yl9kY24zMC5jCkBA
IC0yNiw2ICsyNiw3IEBACiAjaW5jbHVkZSAiLi4vZG11Yl9zcnYuaCIKICNpbmNsdWRlICJkbXVi
X3JlZy5oIgogI2luY2x1ZGUgImRtdWJfZGNuMjAuaCIKKyNpbmNsdWRlICJkbXViX2RjbjMwLmgi
CiAKICNpbmNsdWRlICJzaWVubmFfY2ljaGxpZF9pcF9vZmZzZXQuaCIKICNpbmNsdWRlICJkY24v
ZGNuXzNfMF8wX29mZnNldC5oIgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
