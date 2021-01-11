Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F192F1EED
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85189F19;
	Mon, 11 Jan 2021 19:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76CA89F31
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id r4so279209wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8tzA9ne5yyDo/B6XSuB5tuKBnRjxwc25nSNFsXm3RyU=;
 b=Ahk/N7WicvAg2xBmcya5Li0rhrLV39Zple9TDmD2+AkEaK8Sfi6y9w1RxaLEw29Hoc
 bPQ62/KVS7U2rMgiAQBD0vuBrdJbNeX3D7IyoSZdxQsfgdy7s5brQpLlxBKi/vu4zzhC
 L50pSaqfRrQ891NVBw/dUnCgk2DJtrLhx+yJn7RG34J0YH/IiiwnToahF89kcKHDb5K4
 v7KOMCktZ16hayl9fz55vyKjRpReSxfAmgM31je2nf9qCvRZiOpzx8MNDyel3UFFq/Bk
 jp3/pQq5ub9ag0PHbuovkitWojvt295oLOh9aJxS8LVJVPssdveidWb3KX+p/JfWGozv
 3cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8tzA9ne5yyDo/B6XSuB5tuKBnRjxwc25nSNFsXm3RyU=;
 b=XViOhRnuYWF5DqJArt9I2Qpw3NDH6k/j9lvzAbaG7GaDJxAwlPNwkTfEFzGG2CwzK5
 7fiMNw+X12wCyapF5tl6wM5ObNGCzHRlL/UHri255x1Wbqv7a/kL9DlVB5v54FwjPiNL
 Ku2RdmRmQa7EXwpJo+8+veUSGpvhMfiMq6yNbLMjHMf6mCSxxVL4RLmw4U1RTcRW6TyE
 d2WtcKLceI9ujwYuYiI9knUHWvFyCrCwvGdpUxqu0Onbvivy9WNOYimgVJ3rfCQAFog4
 4v/eh+ruvV160X3HMFxapieaOs+6kC7iP289baHLBnC0rpfCtQ0VtYYmLrl3uUBR4OGm
 sxzQ==
X-Gm-Message-State: AOAM532Zhm4qf4vlCLJkYAOB863sMbJ1QVtztxvmmgnqKNoZcq+5Vag1
 fBzyPUUOHobZQoMxOYllU55+mw==
X-Google-Smtp-Source: ABdhPJzrN9L41qmGyfA0DbPZwxDVobcpgwqW/z39Cl9OQZRKF44ip0vd0aenfh8tUWi2E5TeASxFPg==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr292412wmb.76.1610392809471; 
 Mon, 11 Jan 2021 11:20:09 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/40] drm/amd/display/dc/dce110/dce110_timing_generator_v:
 Demote kernel-doc abuse and line up comments
Date: Mon, 11 Jan 2021 19:19:16 +0000
Message-Id: <20210111191926.3688443-31-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19n
ZW5lcmF0b3Jfdi5jOjU0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd0
Zycgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdl9lbmFibGVfY3J0
YycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTEx
MF90aW1pbmdfZ2VuZXJhdG9yX3YuYzoyMTY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ3RnJyBub3QgZGVzY3JpYmVkIGluICdkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92
X3dhaXRfZm9yX3ZhY3RpdmUnCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiAuLi4vZGMvZGNlMTEw
L2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3YuYyAgICAgfCAxOSArKysrKysrKystLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1p
bmdfZ2VuZXJhdG9yX3YuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdi5jCmluZGV4IGExM2EyZjU4OTQ0ZTMuLmM1MDkzODRm
ZmY1NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdi5jCkBAIC00NiwxNyArNDYs
MTYgQEAKICAqCiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KIAotLyoqCi0qIEVuYWJsZSBD
UlRDVgotKi8KKy8qCisgKiBFbmFibGUgQ1JUQ1YKKyAqLwogCiBzdGF0aWMgYm9vbCBkY2UxMTBf
dGltaW5nX2dlbmVyYXRvcl92X2VuYWJsZV9jcnRjKHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0
ZykKIHsKIC8qCi0qIFNldCBNQVNURVJfVVBEQVRFX01PREUgdG8gMAotKiBUaGlzIGlzIG5lZWRl
ZCBmb3IgRFJSLCBhbmQgYWxzbyBzdWdnZXN0ZWQgdG8gYmUgZGVmYXVsdCB2YWx1ZSBieSBTeWVk
LgotKi8KLQorICogU2V0IE1BU1RFUl9VUERBVEVfTU9ERSB0byAwCisgKiBUaGlzIGlzIG5lZWRl
ZCBmb3IgRFJSLCBhbmQgYWxzbyBzdWdnZXN0ZWQgdG8gYmUgZGVmYXVsdCB2YWx1ZSBieSBTeWVk
LgorICovCiAJdWludDMyX3QgdmFsdWU7CiAKIAl2YWx1ZSA9IDA7CkBAIC0yMDksOSArMjA4LDkg
QEAgc3RhdGljIHZvaWQgZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdl93YWl0X2Zvcl92Ymxhbmso
c3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKnQKIAl9CiB9CiAKLS8qKgotKiBXYWl0IHRpbGwgd2Ug
YXJlIGluIFZBY3RpdmUgKGFueXdoZXJlIGluIFZBY3RpdmUpCi0qLworLyoKKyAqIFdhaXQgdGls
bCB3ZSBhcmUgaW4gVkFjdGl2ZSAoYW55d2hlcmUgaW4gVkFjdGl2ZSkKKyAqLwogc3RhdGljIHZv
aWQgZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdl93YWl0X2Zvcl92YWN0aXZlKHN0cnVjdCB0aW1p
bmdfZ2VuZXJhdG9yICp0ZykKIHsKIAl3aGlsZSAoZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdl9p
c19pbl92ZXJ0aWNhbF9ibGFuayh0ZykpIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
