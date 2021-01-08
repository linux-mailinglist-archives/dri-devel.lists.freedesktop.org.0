Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DA12EF8B7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857646E8C5;
	Fri,  8 Jan 2021 20:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844A66E8E2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 3so9431613wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zW3ufI7pY7JKZ5jgf9PFOiorHzk8Ikn536vctwi0D0o=;
 b=o3+1v//IuiO8OWf1LsRbjZv/Xs6WgdkPiA0liTKkThpPTBjfWe46BeDVSY32inCCQr
 ipNhPObHC4cpO9eg3wFEcYD4IkaSKkd0DwOj2e1mllIpDfTF4f7hUlU29AANQ9RJDYe/
 hxT5H7cx6tbtdM72Oq51SIdiuL8P4vQ6OEU300+iwQEHxGWipdoNLvPXoVAK4XGdJDnS
 pUikoZhdHW1KTDHclPBwb2FLIinrwM07ZMcGAQtC5eDawXjDNoNrXLXOhRntsxiIwhe+
 jMbiszhFMrXF/EBDYGL9bFTO1UnUxx+55azoVqpmoyaoxaemhPWP9X4DG/JkoQoDwO43
 BZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zW3ufI7pY7JKZ5jgf9PFOiorHzk8Ikn536vctwi0D0o=;
 b=YAnrrgq5OWDkbwm8NIu4vzJl8ytARQj5RyTEmYtvThrO3+8P0rO9dLYflDH9QOHKAL
 onYWdljwWwzl9wujNb4YMRdFfImVh8eAi1YMMIJ5TudXj1oeztUmFaGNbrpiquCagXd9
 j9GENKku3PSd+J18o+qRCR/t+wgherfF79qiWaPBPQcgxTSSQYfZB3VTVQtZflvR48C3
 7RRLjzW4qYvzb4wffGjl76S9HPJUWKYxExX9DE66DV7IJGlekIq0lyHDdiPwIGb4IqaZ
 ma+14ssUg1oOtqj4KKinGfXzmoY3YN/ZQ7ozXf8QN3rmulLuhaKNsIREysP0pc+Kdjjv
 VMiw==
X-Gm-Message-State: AOAM5320FKtKuzgpwmqidPrxtCKKuqTD8y4+ho8RnNFvNjIFX4ROrBoL
 gVk/ueisGy45OwGhqhYtxNgfLw==
X-Google-Smtp-Source: ABdhPJyhre7nNzYMjQTmOKcnjVaXR3GH/Z4Xtw8jRqqFDeJ+IzSHh3cydfpLMioIBHahxZ66ZAOewQ==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr4580747wmc.39.1610136949189;
 Fri, 08 Jan 2021 12:15:49 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/amd/display/dc/dce/dce_opp: Make local functions
 and ones invoked by reference static
Date: Fri,  8 Jan 2021 20:14:48 +0000
Message-Id: <20210108201457.3078600-32-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX29wcC5jOjQyNzo2OiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTYwX29wcF9zZXRfY2xhbXBp
bmfigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY2UvZGNlX29wcC5jOjU0ODo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmGRjZTYwX29wcF9wcm9ncmFtX2JpdF9kZXB0aF9yZWR1Y3Rpb27igJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY2UvZGNlX29wcC5jOjU3MTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmGRjZTYwX29wcF9wcm9ncmFtX2NsYW1waW5nX2FuZF9waXhlbF9lbmNvZGluZ+KA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2RjZS9kY2Vfb3BwLmM6NjgxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYZGNlNjBfb3BwX3Byb2dyYW1fZm104oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29t
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYyB8
IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
b3BwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYwppbmRl
eCBlNDU5YWU2NWFhZjc2Li4yYmY4ZjVhMmUwYzIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYwpAQCAtNDI0LDcgKzQyNCw3IEBAIHZvaWQgZGNlMTEw
X29wcF9zZXRfY2xhbXBpbmcoCiAgKgkJNyBmb3IgcHJvZ3JhbWFibGUKICAqCTIpIEVuYWJsZSBj
bGFtcCBpZiBMaW1pdGVkIHJhbmdlIHJlcXVlc3RlZAogICovCi12b2lkIGRjZTYwX29wcF9zZXRf
Y2xhbXBpbmcoCitzdGF0aWMgdm9pZCBkY2U2MF9vcHBfc2V0X2NsYW1waW5nKAogCXN0cnVjdCBk
Y2UxMTBfb3BwICpvcHAxMTAsCiAJY29uc3Qgc3RydWN0IGNsYW1waW5nX2FuZF9waXhlbF9lbmNv
ZGluZ19wYXJhbXMgKnBhcmFtcykKIHsKQEAgLTU0NSw3ICs1NDUsNyBAQCB2b2lkIGRjZTExMF9v
cHBfcHJvZ3JhbV9iaXRfZGVwdGhfcmVkdWN0aW9uKAogfQogCiAjaWYgZGVmaW5lZChDT05GSUdf
RFJNX0FNRF9EQ19TSSkKLXZvaWQgZGNlNjBfb3BwX3Byb2dyYW1fYml0X2RlcHRoX3JlZHVjdGlv
bigKK3N0YXRpYyB2b2lkIGRjZTYwX29wcF9wcm9ncmFtX2JpdF9kZXB0aF9yZWR1Y3Rpb24oCiAJ
c3RydWN0IG91dHB1dF9waXhlbF9wcm9jZXNzb3IgKm9wcCwKIAljb25zdCBzdHJ1Y3QgYml0X2Rl
cHRoX3JlZHVjdGlvbl9wYXJhbXMgKnBhcmFtcykKIHsKQEAgLTU2OCw3ICs1NjgsNyBAQCB2b2lk
IGRjZTExMF9vcHBfcHJvZ3JhbV9jbGFtcGluZ19hbmRfcGl4ZWxfZW5jb2RpbmcoCiB9CiAKICNp
ZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX1NJKQotdm9pZCBkY2U2MF9vcHBfcHJvZ3JhbV9j
bGFtcGluZ19hbmRfcGl4ZWxfZW5jb2RpbmcoCitzdGF0aWMgdm9pZCBkY2U2MF9vcHBfcHJvZ3Jh
bV9jbGFtcGluZ19hbmRfcGl4ZWxfZW5jb2RpbmcoCiAJc3RydWN0IG91dHB1dF9waXhlbF9wcm9j
ZXNzb3IgKm9wcCwKIAljb25zdCBzdHJ1Y3QgY2xhbXBpbmdfYW5kX3BpeGVsX2VuY29kaW5nX3Bh
cmFtcyAqcGFyYW1zKQogewpAQCAtNjc4LDcgKzY3OCw3IEBAIHZvaWQgZGNlMTEwX29wcF9wcm9n
cmFtX2ZtdCgKIH0KIAogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfU0kpCi12b2lkIGRj
ZTYwX29wcF9wcm9ncmFtX2ZtdCgKK3N0YXRpYyB2b2lkIGRjZTYwX29wcF9wcm9ncmFtX2ZtdCgK
IAlzdHJ1Y3Qgb3V0cHV0X3BpeGVsX3Byb2Nlc3NvciAqb3BwLAogCXN0cnVjdCBiaXRfZGVwdGhf
cmVkdWN0aW9uX3BhcmFtcyAqZm10X2JpdF9kZXB0aCwKIAlzdHJ1Y3QgY2xhbXBpbmdfYW5kX3Bp
eGVsX2VuY29kaW5nX3BhcmFtcyAqY2xhbXBpbmcpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
