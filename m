Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC632C30E3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746246E566;
	Tue, 24 Nov 2020 19:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A346E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w24so105423wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEjMnBpqRZf7QYQfeBkVq9GHSjZiAa3R2MyumxVQjCg=;
 b=nQxuyfZyrLc6yy0cC6OO28iMpbA3g68SZwmc8nH+2WzT/A9hGEJWsdoV9Pxc9FrTRn
 Y/c8zmaIhPXEZQx6TDah7htFUQdimDx1ELdmxZn9dXhpmz/7eQqwSp/Pq1Ko1uRQkR1I
 yDp8naTL2GOals/p1vqjO5M0LkD/TcxmH4B09TqjFSGDdsVF3OmDxjriT1ZKrG5vHmQp
 sq75q3UBrxZX/Rl8P0JlAK6gKBWxHWJydUI1Aeoch5D4p1ibAfZdq/6ELCIyixNc9TsQ
 dGGkQsep1Mjz9ZkRSD2tveFZWf8wiwjJQ7OfTNU5ntPPVO1jGDghkvZBLVyLEU8XXK6v
 1eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEjMnBpqRZf7QYQfeBkVq9GHSjZiAa3R2MyumxVQjCg=;
 b=t9mxCMeL7Z3izMgCrEK19Vi+5gk+Aq4WLvtV0DS7k4Iqw5fpvX2FYVRQ621jN8XtnX
 DDd+bJd6aCbc0Ethfb6JYZPNalkgdo1Rmt6H/jCYX2dVEXwShrMVB8Vb+pbXiznqcj/u
 xman45JW6kpzsetLcXDrUWk3y+8+W8MAFsBQc10UuCnpm+3UdZmY0F8Nx+jE3xrMFg2u
 3t82tMPXPoP6Ux3pYRm3chnkgBr3fzznF3rMHKVEEr/UZyn+TdxQBPdvlxLqKvJWY5EJ
 GYfT3oPJ55bzcgbxfYI4InuAxBWMoGp7Op+jnJ/9pQ85kiQv9L8jYTcgvUKZT8tMPipY
 z3GQ==
X-Gm-Message-State: AOAM533KEOioSmsq4c7u8kRDAMVwhY17Rjh3nNChwaqP246ckvvpnbdm
 Nn+KTx3wY1P9/TFBcq8dZ0EkbA==
X-Google-Smtp-Source: ABdhPJytaeH48vRIW7y5TgGrqNMtaoLUD+BjpD1p0QffcBspU2L6jVRH+drONjLcGY0K05OG+mFhYg==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr170464wmc.17.1606247050295;
 Tue, 24 Nov 2020 11:44:10 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/amd/amdgpu/vega10_ih: Add descriptions for 'ih' and
 'entry'
Date: Tue, 24 Nov 2020 19:37:53 +0000
Message-Id: <20201124193824.1118741-10-lee.jones@linaro.org>
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
Cc: Zhigang Luo <zhigang.luo@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmM6Mzc3OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndmVnYTEwX2loX2dldF93
cHRyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmM6NDQwOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndmVn
YTEwX2loX2RlY29kZV9pdicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5j
OjQ0MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZW50cnknIG5vdCBk
ZXNjcmliZWQgaW4gJ3ZlZ2ExMF9paF9kZWNvZGVfaXYnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92ZWdhMTBfaWguYzo0ODA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICd2ZWdhMTBfaWhfaXJxX3JlYXJtJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmM6NTEzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndmVnYTEwX2loX3NldF9ycHRy
JwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogWmhpZ2FuZyBMdW8gPHpoaWdhbmcubHVvQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zl
Z2ExMF9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKaW5kZXgg
NDA3YzYwOTNjMmVjMC4uNTc4ZmRlZTViOTc1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmVnYTEwX2loLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmVnYTEwX2loLmMKQEAgLTM2Niw2ICszNjYsNyBAQCBzdGF0aWMgdm9pZCB2ZWdhMTBfaWhfaXJx
X2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiB2ZWdhMTBfaWhfZ2V0X3dw
dHIgLSBnZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIKICAqCiAgKiBAYWRldjogYW1kZ3B1X2Rl
dmljZSBwb2ludGVyCisgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIGZldGNoIHdwdHIKICAqCiAg
KiBHZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIgZnJvbSBlaXRoZXIgdGhlIHJlZ2lzdGVyCiAg
KiBvciB0aGUgd3JpdGViYWNrIG1lbW9yeSBidWZmZXIgKFZFR0ExMCkuICBBbHNvIGNoZWNrIGZv
cgpAQCAtNDMwLDYgKzQzMSw4IEBAIHN0YXRpYyB1MzIgdmVnYTEwX2loX2dldF93cHRyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogICogdmVnYTEwX2loX2RlY29kZV9pdiAtIGRlY29kZSBh
biBpbnRlcnJ1cHQgdmVjdG9yCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgor
ICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBkZWNvZGUKKyAqIEBlbnRyeTogSVYgZW50cnkgdG8g
cGxhY2UgZGVjb2RlZCBpbmZvcm1hdGlvbiBpbnRvCiAgKgogICogRGVjb2RlcyB0aGUgaW50ZXJy
dXB0IHZlY3RvciBhdCB0aGUgY3VycmVudCBycHRyCiAgKiBwb3NpdGlvbiBhbmQgYWxzbyBhZHZh
bmNlIHRoZSBwb3NpdGlvbi4KQEAgLTQ3Myw2ICs0NzYsNyBAQCBzdGF0aWMgdm9pZCB2ZWdhMTBf
aWhfZGVjb2RlX2l2KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogICogdmVnYTEwX2loX2ly
cV9yZWFybSAtIHJlYXJtIElSUSBpZiBsb3N0CiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2Ug
cG9pbnRlcgorICogQGloOiBJSCByaW5nIHRvIG1hdGNoCiAgKgogICovCiBzdGF0aWMgdm9pZCB2
ZWdhMTBfaWhfaXJxX3JlYXJtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LApAQCAtNTA1LDYg
KzUwOSw3IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9paF9pcnFfcmVhcm0oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAgKiB2ZWdhMTBfaWhfc2V0X3JwdHIgLSBzZXQgdGhlIElIIHJpbmcgYnVm
ZmVyIHJwdHIKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAaWg6IElI
IHJpbmcgYnVmZmVyIHRvIHNldCBycHRyCiAgKgogICogU2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBy
cHRyLgogICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
