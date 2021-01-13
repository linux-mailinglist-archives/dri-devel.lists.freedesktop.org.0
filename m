Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD92F45C5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0F26E03E;
	Wed, 13 Jan 2021 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC6989F89
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id k10so688294wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByKcZ/QO4rFJCc5FU+7eSJHbQTpm5hWIxSF+UVUytQ8=;
 b=NAq8a9+7iN3iO3+wGaICi9lECx6GuUsRdw34OqLPJd3ZnN4FlYdrKOqwub8Fk6eMfh
 5Bilb12AFMTIT63HXIBA5+LWSgS7rO3RyBoAY3n95Hlk3xVW0JgnsHHsVlj2mMd6PZFj
 LWY9sx4YPT9Qp+J9Yw6KW5C4y7Y/amKNrO0DbOBA8TI4JPuT8DOnjpeYTsqac0Kl1uln
 ATiwk9dlj8bfyv6wJayo/nqxgUtP6p5On60pWJQN4v5ZO/xC8g6ekPxEM5cSCyzE1IOe
 fUpAFplHTp2bmIC4n/oV9/ggXw96rpMlD57erX667d2A2c5jRo5GwBM1r1F9xccT2vUn
 BrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByKcZ/QO4rFJCc5FU+7eSJHbQTpm5hWIxSF+UVUytQ8=;
 b=trqHwPmWRfeMowLmEzk0tAXA0yzjF4pjK5DSxKnzv43ros2hhh24oo7mYg3FqflFn3
 UuNyvanekjmY5EPKf7l/Gzmiml3jUNwnj0clDr5KEDocVXRdQ0dBDl/3iD3l3bl0Wfy0
 ZpDGHiiTeP4IIq8zv1SBYuWvpHL33Xkn6pWnhULJnUF/XCE1CDxHKGm7tlmZAdYuj84u
 2y4NYOzpdu6a5ISPir+ukdkwmreGSBqa4/4+cMuAl3blWwo09dWtfYlYGtgdvwC7S3CJ
 bsq/vVrOC7x5t7Irfsl+/Jxo+hr+2HXHh4K8Bo6ba1KowApTTL9ztmAWj5j/VNugs/+G
 DY7A==
X-Gm-Message-State: AOAM533wHPE+mWvROmCZADUbM/Q2FqNSRbJFFp/y+4tw0jD2LIq39smv
 QhKoLOY1cZIK+a2RX5uu3zF3cg==
X-Google-Smtp-Source: ABdhPJyixOcRMntyyEbwvGMK96ScnWqBXZFNvIivHM7pJ6Fo8CExy2eDANXqae2dONdp61qCKvDjmQ==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr909483wmj.159.1610525291245;
 Wed, 13 Jan 2021 00:08:11 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/30] drm/amd/display/dc/dce100/dce100_resource: Include our
 own header containing prototypes
Date: Wed, 13 Jan 2021 08:07:34 +0000
Message-Id: <20210113080752.1003793-13-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jOjU0OgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6NTM3OjM6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhNSV9EQ0U4X01BU0tfU0hfTElTVOKAmQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6NTM3
OjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhNSV9EQ0U4X01BU0tfU0hfTElTVOKA
mQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAw
X3Jlc291cmNlLmM6NTQyOjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhNSV9EQ0U4
X01BU0tfU0hfTElTVOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6NTQyOjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhNSV9EQ0U4X01BU0tfU0hfTElTVOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6NTQ3OjI6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhEQ0UxMF9BVVhfTUFTS19TSF9MSVNU4oCZCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2Uu
Yzo1NDc6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERDRTEwX0FVWF9NQVNLX1NI
X0xJU1TigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTAw
L2RjZTEwMF9yZXNvdXJjZS5jOjU1MToyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
RENFMTBfQVVYX01BU0tfU0hfTElTVOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6NTUxOjI6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyDigJhEQ0UxMF9BVVhfTUFTS19TSF9MSVNU4oCZCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYzo4ODk6
MTY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlMTAwX2FkZF9zdHJl
YW1fdG9fY3R44oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jOjkxNjoxNjogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2UxMDBfdmFsaWRhdGVfcGxhbmXi
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6OTI1OjI0OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTEwMF9maW5kX2ZpcnN0X2ZyZWVfbWF0Y2hfc3Ry
ZWFtX2VuY19mb3JfbGlua+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYzoxMTU2
OjIzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTEwMF9jcmVhdGVf
cmVzb3VyY2VfcG9vbOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKaW5kZXggNjQ4MTY5MDg2
YmNmOC4uNjM1ZWYwZTdjNzgyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jCkBAIC01OCw2ICs1OCw4IEBACiAj
aW5jbHVkZSAiZGNlL2RjZV9hYm0uaCIKICNpbmNsdWRlICJkY2UvZGNlX2kyYy5oIgogCisjaW5j
bHVkZSAiZGNlMTAwX3Jlc291cmNlLmgiCisKICNpZm5kZWYgbW1NQ19IVUJfUkRSRVFfRE1JRl9M
SU1JVAogI2luY2x1ZGUgImdtYy9nbWNfOF8yX2QuaCIKICNpbmNsdWRlICJnbWMvZ21jXzhfMl9z
aF9tYXNrLmgiCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
