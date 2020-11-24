Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A72C30FD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D4D6E59F;
	Tue, 24 Nov 2020 19:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474E6E529
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e7so6014015wrv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAMUF0M+5e5QxYGdyHTIO/CIT9L6gglBGUvPq+MzHBg=;
 b=jzIcHL0eMMZm6DtlZ9fd+0W/Qjf5OD3r//36xPdi8sot0v4hYcjWBJGo5JsdiMAylp
 59cVzB0oYdEJPt6mdkziyQpaCf9SGy3mSSb/GS6zD2UgphuNsEksk+mdbzN58DTfIKHq
 EAOM2xRHO5Peg/72jxA8+vV69v1RYabIKSnergZZ0ZMBcl+60CIl9Iq3i0vVOQ24h4iG
 GvSC+Xkk8n07CN7qKU+XEd44EJWCpmiRlNYWrlWHzqAYUhnJHcFSBkYV+/Ut8MP8+xxf
 pr0QrRWs6YAUEhSh5t8ghtWxnO/bqpAlEyi4IUA21Oj2pQc67sOd7YpbMJx2fSqqXAju
 XxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAMUF0M+5e5QxYGdyHTIO/CIT9L6gglBGUvPq+MzHBg=;
 b=R86RgnXLDL9D4v5fb0IbTjMOmuoEaT3S/8i75Qx1UCPdUyVnY4qc3HCJMVJKWkVN7Z
 Zy+UrWMkZihErjP6fNyeYpKzHgQ7vGsTVplbdxpxFvm0a3dYkC6KLcugkrX9Cw3WB3Oa
 8tV24L+m2gj9mwbKESs7tzwhPTuvorD9zZNpsogSQx6oE4QIsyX6G6VD3Iac3LqY3lnX
 Gx0h5uqX/Skjut+/XkK1uHxoJbd5yJIlKda+KQdGErQfrdGuARCZrJFZclAs0nibqy+2
 8d3pC0FftI1Kx6i7qyfyKhWj4G6s1T3Fy7dxi61T+fpvYtFpepC5oIDQ8As86dAy0aLQ
 /mHw==
X-Gm-Message-State: AOAM530ax5Yzk0yFw8gh9kK0goQIBslNp3uFO2sjH3w121/0RTclJ2Pq
 N+WqqhNdHKb37iCDj+3lS0++og==
X-Google-Smtp-Source: ABdhPJwGpjx8U/47ZgWVIMjepZQiRgQQJIP/hnzr40LeSboZi3EXQzjARjAY1rA2rTYNNnVeMWqbpA==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr44599wru.405.1606247088972;
 Tue, 24 Nov 2020 11:44:48 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/amd/amdgpu/amdgpu_uvd: Add description for
 amdgpu_uvd_cs_msg_decode()'s 'buf_sizes' param
Date: Tue, 24 Nov 2020 19:38:24 +0000
Message-Id: <20201124193824.1118741-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jOjU1NTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnYnVmX3NpemVzJyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVf
dXZkX2NzX21zZ19kZWNvZGUnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3Jn
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJv
LW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2
ZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdXZkLmMKaW5kZXggZjhmMDM4NGE4ZDlhZC4uN2M1YjYwZTUzNDgy
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYwpAQCAtNTQ3LDYgKzU0
Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3V2ZF9jc19wYXNzMShzdHJ1Y3QgYW1kZ3B1X3V2ZF9j
c19jdHggKmN0eCkKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCiAgKiBAbXNn
OiBwb2ludGVyIHRvIG1lc3NhZ2Ugc3RydWN0dXJlCisgKiBAYnVmX3NpemVzOiBwbGFjZWhvbGRl
ciB0byBwdXQgdGhlIGRpZmZlcmVudCBidWZmZXIgbGVuZ3RocwogICoKICAqIFBlZWsgaW50byB0
aGUgZGVjb2RlIG1lc3NhZ2UgYW5kIGNhbGN1bGF0ZSB0aGUgbmVjZXNzYXJ5IGJ1ZmZlciBzaXpl
cy4KICAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
