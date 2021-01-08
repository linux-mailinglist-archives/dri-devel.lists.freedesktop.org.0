Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067122EF8B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C186E8E6;
	Fri,  8 Jan 2021 20:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85946E8DC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 190so8768143wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ytR3fqWZwqVYBK3RsUcXcI3WQSuSAKiurJIlwb7LgU=;
 b=wbg5je7FZsTgpIt6O9urrAylcwuurXSWEq/h3em25fF38r83Wa9EOq3Db9eo7QsSk9
 xwCRNYNRj/HLDKQWdrdE8TtwKeaffhNaIpi6nqRIGPVhppSmMflAaIIQH3Fn0I+ceMkh
 4fYv2+yBgTyo1WcrjJkbhFjC/1l+GZEtkMHjeRldDTYSvdfqYUlJ+BZnw5geAXBmz9Kt
 Kw5FQ7yrlP4d6g5ycACgBF+bzlCUiu2T7klLeCQ/8q0Goa4cAXvZFBTeALZvDFP8+dTg
 K7nwLezl8va5JyslPwJjMB2o3u+zpgwll+AaOccnV+dIaNxAY/MUgouPKgWFlhRTYSbe
 GMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ytR3fqWZwqVYBK3RsUcXcI3WQSuSAKiurJIlwb7LgU=;
 b=YdEJekYmLDbO2jpNgVhV0g5jAOL+fFNdxFGtIinunZ8FNFky+Yy+91YJa36n2wV7tz
 6SDlFZRAA+F/asy7rhrlXQ2h70YMYxB+AUZWB1SShSvgkXuayOn58sc+M+pjIKoYhxAA
 4JywJiLqoA43GlatxRnGWywT16h9c/UJBjPvQUAdP6nB8VT3bPsbmQnJ9d1VT+JtCt4p
 3u6tJ1J9vxHYuP6yNOtsOPXMYyMqyBlzRsN5hX8j0/1+YL+1SWADprsWOSR44y9JqYe+
 5LMPJ/HfuUJCZZmvhjKb4GkKuZyWkjiJJ5xdUfTFvmJj3Mn4qsFd9P0iAJlEwMGxuB7m
 6jcA==
X-Gm-Message-State: AOAM531IvjNgwDllrOIFORFBMvkyVTO/Y3K0XeMwmF/CD45z4l75mWHF
 myuq614J0V4Zaen1+TNjF/zNIg==
X-Google-Smtp-Source: ABdhPJy2bJ02k9gA9sVBBnJKvFxv30bdA0FleqFKFljSQtDb9QUpDx7W0UF3TNjxdaj3Ft2RG6/30Q==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr4503783wmj.18.1610136945272; 
 Fri, 08 Jan 2021 12:15:45 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/amd/display/dc/dce/dce_transform: Remove 3
 unused/legacy variables
Date: Fri,  8 Jan 2021 20:14:45 +0000
Message-Id: <20210108201457.3078600-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX3RyYW5zZm9ybS5jOiBJ
biBmdW5jdGlvbiDigJhkY2U2MF90cmFuc2Zvcm1fc2V0X3NjYWxlcuKAmToKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFuc2Zvcm0uYzo0OTY6Nzog
d2FybmluZzogdmFyaWFibGUg4oCYZmlsdGVyX3VwZGF0ZWTigJkgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFuc2Zvcm0uYzogSW4gZnVuY3Rpb24g4oCYZGNlNjBfdHJh
bnNmb3JtX3NldF9waXhlbF9zdG9yYWdlX2RlcHRo4oCZOgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX3RyYW5zZm9ybS5jOjEwNDA6MTk6IHdhcm5pbmc6
IHZhcmlhYmxlIOKAmGV4cGFuX21vZGXigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlL2RjZV90cmFuc2Zvcm0uYzoxMDQwOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHBpeGVsX2Rl
cHRo4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzog
SGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBl
bmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpDYzogTWF1cm8gUm9zc2kgPGlzc29yLm9ydWFtQGdtYWlsLmNvbT4KQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMgfCAx
MyAtLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFuc2Zvcm0uYwppbmRl
eCAxMzBhMGEwYzgzMzI5Li42MTIxYmI3YjAwOWI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFuc2Zvcm0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFuc2Zvcm0uYwpAQCAtNDkzLDcgKzQ5Myw2IEBA
IHN0YXRpYyB2b2lkIGRjZTYwX3RyYW5zZm9ybV9zZXRfc2NhbGVyKAogewogCXN0cnVjdCBkY2Vf
dHJhbnNmb3JtICp4Zm1fZGNlID0gVE9fRENFX1RSQU5TRk9STSh4Zm0pOwogCWJvb2wgaXNfc2Nh
bGluZ19yZXF1aXJlZDsKLQlib29sIGZpbHRlcl91cGRhdGVkID0gZmFsc2U7CiAJY29uc3QgdWlu
dDE2X3QgKmNvZWZmc192LCAqY29lZmZzX2g7CiAKIAkvKlVzZSB3aG9sZSBsaW5lIGJ1ZmZlciBt
ZW1vcnkgYWx3YXlzKi8KQEAgLTU1OCw3ICs1NTcsNiBAQCBzdGF0aWMgdm9pZCBkY2U2MF90cmFu
c2Zvcm1fc2V0X3NjYWxlcigKIAogCQkJeGZtX2RjZS0+ZmlsdGVyX3YgPSBjb2VmZnNfdjsKIAkJ
CXhmbV9kY2UtPmZpbHRlcl9oID0gY29lZmZzX2g7Ci0JCQlmaWx0ZXJfdXBkYXRlZCA9IHRydWU7
CiAJCX0KIAl9CiAKQEAgLTEwMzcsMzQgKzEwMzUsMjMgQEAgc3RhdGljIHZvaWQgZGNlNjBfdHJh
bnNmb3JtX3NldF9waXhlbF9zdG9yYWdlX2RlcHRoKAogCWNvbnN0IHN0cnVjdCBiaXRfZGVwdGhf
cmVkdWN0aW9uX3BhcmFtcyAqYml0X2RlcHRoX3BhcmFtcykKIHsKIAlzdHJ1Y3QgZGNlX3RyYW5z
Zm9ybSAqeGZtX2RjZSA9IFRPX0RDRV9UUkFOU0ZPUk0oeGZtKTsKLQlpbnQgcGl4ZWxfZGVwdGgs
IGV4cGFuX21vZGU7CiAJZW51bSBkY19jb2xvcl9kZXB0aCBjb2xvcl9kZXB0aDsKIAogCXN3aXRj
aCAoZGVwdGgpIHsKIAljYXNlIExCX1BJWEVMX0RFUFRIXzE4QlBQOgogCQljb2xvcl9kZXB0aCA9
IENPTE9SX0RFUFRIXzY2NjsKLQkJcGl4ZWxfZGVwdGggPSAyOwotCQlleHBhbl9tb2RlICA9IDE7
CiAJCWJyZWFrOwogCWNhc2UgTEJfUElYRUxfREVQVEhfMjRCUFA6CiAJCWNvbG9yX2RlcHRoID0g
Q09MT1JfREVQVEhfODg4OwotCQlwaXhlbF9kZXB0aCA9IDE7Ci0JCWV4cGFuX21vZGUgID0gMTsK
IAkJYnJlYWs7CiAJY2FzZSBMQl9QSVhFTF9ERVBUSF8zMEJQUDoKIAkJY29sb3JfZGVwdGggPSBD
T0xPUl9ERVBUSF8xMDEwMTA7Ci0JCXBpeGVsX2RlcHRoID0gMDsKLQkJZXhwYW5fbW9kZSAgPSAx
OwogCQlicmVhazsKIAljYXNlIExCX1BJWEVMX0RFUFRIXzM2QlBQOgogCQljb2xvcl9kZXB0aCA9
IENPTE9SX0RFUFRIXzEyMTIxMjsKLQkJcGl4ZWxfZGVwdGggPSAzOwotCQlleHBhbl9tb2RlICA9
IDA7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWNvbG9yX2RlcHRoID0gQ09MT1JfREVQVEhfMTAx
MDEwOwotCQlwaXhlbF9kZXB0aCA9IDA7Ci0JCWV4cGFuX21vZGUgID0gMTsKIAkJQlJFQUtfVE9f
REVCVUdHRVIoKTsKIAkJYnJlYWs7CiAJfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
