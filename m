Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37772AC6D7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B8E89598;
	Mon,  9 Nov 2020 21:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6DB895B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so951862wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T1sUvjuz6GhGo/eyfmlP/SOHCvkRA45s8OKsudAKYNE=;
 b=ONMp+BLP0pr8GPw4qGQ5ZafDFD+hKfVrwwI3l0QNlbUCStl/4v20Q2yKrVeUVieJ/1
 /EHEG++w11JWCuRkI6pVfbliwTpAMswOOxzKqHVOuq4dDrk74KHAaF458LgMN+/XKWAo
 SIcyz5tZ4bXs7cGR7YqPOFdKiJ0skIJ5jsFNhl7Ea5Q9szqmPq2TCH/UZxpjE3K9EV9h
 vp4QUfIDYNirEHinBWvHkQ7ZVv9RrznVs1023gtMY17oJIpvTUzdQtaJaPCJiVyVnn9g
 AX3v/5GkiAAnNlntob34lzgthtPjni35Do2nVDGWEYGZz7zDBJruQkiw8wHElCLheDdp
 LP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T1sUvjuz6GhGo/eyfmlP/SOHCvkRA45s8OKsudAKYNE=;
 b=QpVOrfQc72CrUVS8E3lsK9tEKnOb0+sUv97UXCoZCY+C/ES1nAPgJI1HQLmYiIudmW
 yzVAwjNrcUfYRdzMBTzp4WnyvO3vq/+gJQ4vYp32u8XgtlB7A/N5czZNqdNOytTgZ4z+
 ZgGyYGMyQRwiYA5h1sRYy5TknZd9YfhL44m9/PDs8FXtTBbw2OHVx5mFO/ues86DeO4t
 4LVqhQkKtxxaNj+kSNYopjsL7WeRt6yfsJZhzUhiMrM/tdYHa/J8U8UmbonUOf4ewi6O
 RyqgFZgQupsRxsQU3fcsFhJrdDoZd493jQwhiORIYeqKKb6Lnqx7s+bHfJXXRKXYWs9M
 s22g==
X-Gm-Message-State: AOAM53056nGWPkKTmMP+ZDPaRcQlaf+HGamUZOs/iNFHirT1yNyIiHcm
 +Anowsod47JEwTt5n1AgVtonYQ==
X-Google-Smtp-Source: ABdhPJzHnjRnvLRbbyNs0pdXowVajS1XQ2JnHaXuKTaF/Vt1oT1OPIgR3k9xHsvdt2BWOG6GPb38iw==
X-Received: by 2002:a05:600c:2110:: with SMTP id
 u16mr1168189wml.4.1604956770543; 
 Mon, 09 Nov 2020 13:19:30 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/20] drm/radeon/r600: Strip out set but unused 'tmp'
 variables
Date: Mon,  9 Nov 2020 21:18:46 +0000
Message-Id: <20201109211855.3340030-12-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6IEluIGZ1bmN0aW9uIOKAmHI2MDBfcGNpZV9nYXJ0X3Rs
Yl9mbHVzaOKAmToKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jOjEwODM6Nzogd2Fybmlu
ZzogdmFyaWFibGUg4oCYdG1w4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYzogQXQgdG9wIGxldmVsOgog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6IEluIGZ1bmN0aW9uIOKAmHI2MDBfbW1pb19o
ZHBfZmx1c2jigJk6CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYzo0MzkzOjc6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmHRtcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jIHwgNiArKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3I2MDAuYwppbmRleCBkOWEzM2NhNzY4ZjM0Li42ZTc4MGIwMTA5OTk1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3I2MDAuYwpAQCAtMTA4MCw3ICsxMDgwLDYgQEAgdm9pZCByNjAwX3BjaWVfZ2FydF90bGJfZmx1
c2goc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJaWYgKChyZGV2LT5mYW1pbHkgPj0gQ0hJ
UF9SVjc3MCkgJiYgKHJkZXYtPmZhbWlseSA8PSBDSElQX1JWNzQwKSAmJgogCSAgICAhKHJkZXYt
PmZsYWdzICYgUkFERU9OX0lTX0FHUCkpIHsKIAkJdm9pZCBfX2lvbWVtICpwdHIgPSAodm9pZCAq
KXJkZXYtPmdhcnQucHRyOwotCQl1MzIgdG1wOwogCiAJCS8qIHI3eHggaHcgYnVnLiAgd3JpdGUg
dG8gSERQX0RFQlVHMSBmb2xsb3dlZCBieSBmYiByZWFkCiAJCSAqIHJhdGhlciB0aGFuIHdyaXRl
IHRvIEhEUF9SRUdfQ09IRVJFTkNZX0ZMVVNIX0NOVEwKQEAgLTEwODgsNyArMTA4Nyw3IEBAIHZv
aWQgcjYwMF9wY2llX2dhcnRfdGxiX2ZsdXNoKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQog
CQkgKiBtZXRob2QgZm9yIHRoZW0uCiAJCSAqLwogCQlXUkVHMzIoSERQX0RFQlVHMSwgMCk7Ci0J
CXRtcCA9IHJlYWRsKCh2b2lkIF9faW9tZW0gKilwdHIpOworCQlyZWFkbCgodm9pZCBfX2lvbWVt
ICopcHRyKTsKIAl9IGVsc2UKIAkJV1JFRzMyKFJfMDA1NDgwX0hEUF9NRU1fQ09IRVJFTkNZX0ZM
VVNIX0NOVEwsIDB4MSk7CiAKQEAgLTQzOTAsMTAgKzQzODksOSBAQCB2b2lkIHI2MDBfbW1pb19o
ZHBfZmx1c2goc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJaWYgKChyZGV2LT5mYW1pbHkg
Pj0gQ0hJUF9SVjc3MCkgJiYgKHJkZXYtPmZhbWlseSA8PSBDSElQX1JWNzQwKSAmJgogCSAgICBy
ZGV2LT52cmFtX3NjcmF0Y2gucHRyICYmICEocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfQUdQKSkg
ewogCQl2b2lkIF9faW9tZW0gKnB0ciA9ICh2b2lkICopcmRldi0+dnJhbV9zY3JhdGNoLnB0cjsK
LQkJdTMyIHRtcDsKIAogCQlXUkVHMzIoSERQX0RFQlVHMSwgMCk7Ci0JCXRtcCA9IHJlYWRsKCh2
b2lkIF9faW9tZW0gKilwdHIpOworCQlyZWFkbCgodm9pZCBfX2lvbWVtICopcHRyKTsKIAl9IGVs
c2UKIAkJV1JFRzMyKFJfMDA1NDgwX0hEUF9NRU1fQ09IRVJFTkNZX0ZMVVNIX0NOVEwsIDB4MSk7
CiB9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
