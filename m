Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA82F1F05
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3A989FD7;
	Mon, 11 Jan 2021 19:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5BF6E064
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id i63so237763wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AejyAKESpWoI52tNZY+VpYKWtH7XjXdVdCW7Df3aTz4=;
 b=fL0A3FYKyTXR1evYTyVZcRhsAUYxUi2VIDBy/CKs5c5KAjiVP8mb4fcwcGvU+pmIOa
 85gscWuzM0iyOkj+belxv0VLkBefcLZSUTNYoFOM1NCwEsEl1eLgtA+lbMUvEl1j9FYG
 8l3Xlqq8GYvvazaKupRqFvEGlrR+MJ9Ftr5ATPw0C17fiBAw3a0RpQpmmkUcNuMEFi05
 dUwPFX3VYlBCMvwfuNQekEYCveNycqsFJQ2WMVIV+uWlsweflYJU6CVnKsWVtah8M4lb
 t703vrdVc9G9sY63wzC6c6+HrX6+hFdXpQVZgtU5RwsJnNjEcMCVOyLFl+tqzZJlR/E/
 hdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AejyAKESpWoI52tNZY+VpYKWtH7XjXdVdCW7Df3aTz4=;
 b=OI3Apr0ZBXe1rPYR381V5Mg6WC5IfbiIwp1UqYmjot4K1kmGFQhdaNAhDttakEd9aE
 wlnBTN46sFgLe8zMR1HBpEFZzfZ+inM07+qUdC1JKsxjLxNpVwKtZT0eFCFC+nkvCDqh
 sENzMwEJOqYPBZ64pWsmPy+Ja8mGxMjzFP9NPUHJ+9M9Nv0MtrB01rvb6Oopm7ACJ9hi
 sevq3kwXwUdPtHOEa1l3gC2ImWnuOCzP0LrY3hRLLc4vO5/dEGbMPA3rzsXNuxahxB7h
 3LdTnkFtpsTej0/i0TIvCyljUK7JgXuV8Ctdzacf7x20W+hE7yio+4BWC+M5gNZVeCCl
 8wsg==
X-Gm-Message-State: AOAM532si+GRSAG+MA/g8lkwFtZeacsrEHTAiB/zWtsDVp632ArPnAV5
 ypkDKz5BOgiCcL/WtbBVx6ucDA==
X-Google-Smtp-Source: ABdhPJwqLNKhpsvusFowjVq55d1AVbljG6jJxOvD/XIynEhDqhCVft9FdfgFL3xLk24pL+s98upOxg==
X-Received: by 2002:a1c:4489:: with SMTP id r131mr311092wma.24.1610392822455; 
 Mon, 11 Jan 2021 11:20:22 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/amd/display/dc/core/dc_stream: Demote
 non-conformant kernel-doc headers
Date: Mon, 11 Jan 2021 19:19:26 +0000
Message-Id: <20210111191926.3688443-41-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jOjI1Mzog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncFN0cmVhbScgbm90IGRlc2Ny
aWJlZCBpbiAnZGNfb3B0aW1pemVfdGltaW5nX2Zvcl9mc2Z0JwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jOjI1Mzogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbWF4X2lucHV0X3JhdGVfaW5fa2h6JyBub3QgZGVz
Y3JpYmVkIGluICdkY19vcHRpbWl6ZV90aW1pbmdfZm9yX2ZzZnQnCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmM6MjcwOiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzdHJlYW0nIG5vdCBkZXNjcmliZWQgaW4gJ2Rj
X3N0cmVhbV9zZXRfY3Vyc29yX2F0dHJpYnV0ZXMnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmM6MjcwOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdhdHRyaWJ1dGVzJyBub3QgZGVzY3JpYmVkIGluICdkY19zdHJl
YW1fc2V0X2N1cnNvcl9hdHRyaWJ1dGVzJwoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKaW5kZXggYzEwM2Y4NTgz
NzVkMC4uMjVmYTcxMmE3ODQ3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfc3RyZWFtLmMKQEAgLTI0NCw3ICsyNDQsNyBAQCBzdHJ1Y3QgZGNfc3RyZWFt
X3N0YXR1cyAqZGNfc3RyZWFtX2dldF9zdGF0dXMoCiB9CiAKICNpZm5kZWYgVFJJTV9GU0ZUCi0v
KioKKy8qCiAgKiBkY19vcHRpbWl6ZV90aW1pbmdfZm9yX2ZzZnQoKSAtIGRjIHRvIG9wdGltaXpl
IHRpbWluZwogICovCiBib29sIGRjX29wdGltaXplX3RpbWluZ19mb3JfZnNmdCgKQEAgLTI2MCw4
ICsyNjAsNyBAQCBib29sIGRjX29wdGltaXplX3RpbWluZ19mb3JfZnNmdCgKIH0KICNlbmRpZgog
Ci0KLS8qKgorLyoKICAqIGRjX3N0cmVhbV9zZXRfY3Vyc29yX2F0dHJpYnV0ZXMoKSAtIFVwZGF0
ZSBjdXJzb3IgYXR0cmlidXRlcyBhbmQgc2V0IGN1cnNvciBzdXJmYWNlIGFkZHJlc3MKICAqLwog
Ym9vbCBkY19zdHJlYW1fc2V0X2N1cnNvcl9hdHRyaWJ1dGVzKAotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
