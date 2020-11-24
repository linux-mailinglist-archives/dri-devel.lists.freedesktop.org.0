Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FD2C30F3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB016E59D;
	Tue, 24 Nov 2020 19:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFF76E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r3so5249170wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mq7PbL6cgpxSOWqLpcSVIbGFAt/shGYJ2nDJJPb1ufM=;
 b=QAjDd7pmP9wSTKQGaUOswEXbxCamu68E+cgIDCWwIrdnY0TW1G88r+c9TTWlZxqPLu
 7zv57v0Szlbn1mpzLQt4tsC/2toJ6vwn/sSzjRXrD1qEbZT4/Wly/JbfeTn2S8Onw8mm
 wafWqtAt1WOMYWSwYeYnbnER09/6WLcU+HY/BruiZW5oXEq2u3SnvrTMAnvvloBCMAsO
 F1ZeEw24FGMFgL6LV8uNQyeg0Wj7lCIE9w3Il2U5NuAW84yje7bLFC8vlLIyg7NF63gh
 OnBw2tMVefWwP6rI4Cgnvl15GE79M3rLSQtm3G41mlKKofO+MUlFxyrET/gENNtjmohn
 7adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mq7PbL6cgpxSOWqLpcSVIbGFAt/shGYJ2nDJJPb1ufM=;
 b=Gmu8z3xsSvwI4HRrIr01abCW9HGbZMKc9+gtQ/YTGgGEjL2zWh/g8aFxOuzvty/az8
 nzJDSpPw4s4MwIkncYMhXAv2Hcj2orpKoVECyPffjikQLtgzz1giM3dzAAOLOIOXKAil
 wld2fikX/oqlAZr+ug3VBmrZT4fvvyvaYD1Fe3bVoJ8IOi6vXw7VR6QPaWezrWYZ4BbQ
 AT/r+Ozy7xklGYsV28YGH2wyb/+H/RQN5owrKirSNu29AcEwe6H5fyXcwZQzPSBcCksD
 kaQ+hIw9GyT6Mk+JDKuekurxXATzbW7m1sYouKEG4TGdEdSM8P4+REzG2964xMbbtpGN
 ncgw==
X-Gm-Message-State: AOAM530acqktVYXNHFiWehR/hlCVwrqwI3RdM9rLxRC+pNXB62qbxvb1
 AZXIB5R6T6RjyvU+JFB+LvGEwA==
X-Google-Smtp-Source: ABdhPJw+kv1MDrGjFiOkLD0UZAOdz/00Mi3zE68PVR52zrFv9heQrl/sQOeaGCT/uADkZl+if9+Srw==
X-Received: by 2002:a5d:6783:: with SMTP id v3mr77440wru.45.1606247062896;
 Tue, 24 Nov 2020 11:44:22 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/40] drm/amd/amdgpu/sdma_v3_0: Fix incorrect param doc-rot
 issue
Date: Tue, 24 Nov 2020 19:38:03 +0000
Message-Id: <20201124193824.1118741-20-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92M18wLmM6MTY1MTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnaWInIG5vdCBkZXNjcmliZWQgaW4gJ3NkbWFfdjNfMF9lbWl0
X2NvcHlfYnVmZmVyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92M18wLmM6MTY1
MTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAncmluZycgZGVzY3JpcHRpb24g
aW4gJ3NkbWFfdjNfMF9lbWl0X2NvcHlfYnVmZmVyJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjNfMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92M18wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAuYwppbmRleCA0
MzQxMGE3YmNjYzI1Li44Y2E3ZmJhOWMwMzVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zZG1hX3YzXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
ZG1hX3YzXzAuYwpAQCAtMTYzMyw3ICsxNjMzLDcgQEAgc3RhdGljIHZvaWQgc2RtYV92M18wX3Nl
dF9pcnFfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAvKioKICAqIHNkbWFfdjNf
MF9lbWl0X2NvcHlfYnVmZmVyIC0gY29weSBidWZmZXIgdXNpbmcgdGhlIHNETUEgZW5naW5lCiAg
KgotICogQHJpbmc6IGFtZGdwdV9yaW5nIHN0cnVjdHVyZSBob2xkaW5nIHJpbmcgaW5mb3JtYXRp
b24KKyAqIEBpYjogaW5kaXJlY3QgYnVmZmVyIHRvIGNvcHkgdG8KICAqIEBzcmNfb2Zmc2V0OiBz
cmMgR1BVIGFkZHJlc3MKICAqIEBkc3Rfb2Zmc2V0OiBkc3QgR1BVIGFkZHJlc3MKICAqIEBieXRl
X2NvdW50OiBudW1iZXIgb2YgYnl0ZXMgdG8geGZlcgotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
