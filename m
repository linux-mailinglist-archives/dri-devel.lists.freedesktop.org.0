Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC92C30D8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832656E536;
	Tue, 24 Nov 2020 19:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD116E532
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x13so80464wmj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HQG7VvhLuLqLIiCO1wDsJUncEyILipv0iifGGhYNwBw=;
 b=ROnAYiAd5qDaRM6zlXai5MEWDhk655E2E+vwaBBQzU3vLw++RLC4/Jub4Bt3Hvy0HW
 pwVKhquuQdg0kk3tR1802CxvCaIcCwMmVQyiRfLJBffRMydYoXbNWu6QKx04FekT+/qp
 qoL59FYT3twrWeZa+Kd9U45wg7C8HeQReGIsbPxd3eF+kBkgnRVKLMICmYUZVZZcSKcB
 i3krnvNltBSKPhTsEx91aoglWLCC8evPXFNZ5CcQoBWLe40kKZ/NpidKAmX1NZFJSC5e
 3429CPqWQ2HYM51EEndQBWcN+40LTgM9aL9qXD4DJTS4i3u5d6Y7QaI4+o6IYnURuma3
 QtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HQG7VvhLuLqLIiCO1wDsJUncEyILipv0iifGGhYNwBw=;
 b=pC143sHCy9MQDDvVyiAMMkMpw4guAkHqS74v8AvszKVNzVFexAaNlR8i9Dw9v42KjM
 ijqbeIgQE8y14AlZankQAhD1SXK85wIbYmcPcqE5/Fbj/ktioIo2dUd320nrDm2zhXfb
 bzLwHSoDUZrAa8WN3QBv6I4ABxc1zYJ18/OsFbPipEX7+CpXgEI1V9WPyLr0MUmiVY8N
 t3J8wMTHptPtFEKvVYUkxYF1LL1HqpaDl1UImIyYzBac3Kkx0wqoLwvOL1Rbf5GdApWI
 bln9gJ0doKwZAOAqan9O/E4WaR7IOHwnHiixK87WSuBpkhQlcWtmZ3sJSOWrI3gRFNZq
 F+/Q==
X-Gm-Message-State: AOAM530vWx5v91FedZqvyiLbH2BVUUFbtPp67oeubeWtTiL/y2OQuYae
 ubirhdchwP4zuuYG99SfMsO9NA==
X-Google-Smtp-Source: ABdhPJxABCqmQpKoOyO33AaWgS8+y0qIF8skdrZlNoUJ266NV2fmZqe3GarA3FNS1UObzNFWwWwgCA==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr22750wma.10.1606247041886;
 Tue, 24 Nov 2020 11:44:01 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/amd/amdgpu/gmc_v10_0: Suppy some missing function
 doc descriptions
Date: Tue, 24 Nov 2020 19:37:46 +0000
Message-Id: <20201124193824.1118741-3-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmM6Mjc4OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICd2bWh1Yicgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3YxMF8wX2Zs
dXNoX2dwdV90bGInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYzoyNzg6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsdXNoX3R5cGUnIG5vdCBk
ZXNjcmliZWQgaW4gJ2dtY192MTBfMF9mbHVzaF9ncHVfdGxiJwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3YxMF8wLmM6MzcxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdmbHVzaF90eXBlJyBub3QgZGVzY3JpYmVkIGluICdnbWNfdjEwXzBfZmx1c2hfZ3B1
X3RsYl9wYXNpZCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jOjM3MTog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWxsX2h1Yicgbm90IGRlc2Ny
aWJlZCBpbiAnZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGJfcGFzaWQnCgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEw
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4IGQ5Mzk5
MzI0YmU0NzQuLjQ4ODdiMGU2NmU5NzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
MTBfMC5jCkBAIC0yNzAsNiArMjcwLDggQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX3Zt
X2h1YihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKICAqCiAgKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCiAgKiBAdm1pZDogdm0gaW5zdGFuY2UgdG8gZmx1
c2gKKyAqIEB2bWh1Yjogdm1odWIgdHlwZQorICogQGZsdXNoX3R5cGU6IHRoZSBmbHVzaCB0eXBl
CiAgKgogICogRmx1c2ggdGhlIFRMQiBmb3IgdGhlIHJlcXVlc3RlZCBwYWdlIHRhYmxlLgogICov
CkBAIC0zNjIsNiArMzY0LDggQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCiAgKgogICogQGFkZXY6
IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQHBhc2lkOiBwYXNpZCB0byBiZSBmbHVzaAorICog
QGZsdXNoX3R5cGU6IHRoZSBmbHVzaCB0eXBlCisgKiBAYWxsX2h1YjogVXNlZCB3aXRoIFBBQ0tF
VDNfSU5WQUxJREFURV9UTEJTX0FMTF9IVUIoKQogICoKICAqIEZsdXNoIHRoZSBUTEIgZm9yIHRo
ZSByZXF1ZXN0ZWQgcGFzaWQuCiAgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
