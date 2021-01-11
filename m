Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15172F1ED6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABCD89DCF;
	Mon, 11 Jan 2021 19:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661CF89DDD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id 91so922810wrj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtAOwEmizSXmIkh30HKF25wTD18EAWpeWdhE7dkllNs=;
 b=fCyZq859P/dQeCyH44t2M93b+LQoVV7yA3BytWDVSHDCdpZj6czSYW8EQ493I11nZp
 TZLM8h9nbvI2ZSsDZ0F8ayzF1C0O+gVE3/ADElNiHrZ2OpcbodJ1pri3ZkxpU+ZxMz2C
 c/wfj4zzfbwk83kz3MsPJvWnnwj9kV8ZZGu/BYNeUEBCIVx/+M9UCiZytPHwoyJzOv1O
 EN8cE7QnMbiH3S7GnGgttIwXekKJseeGIsAkX6lFUjsUGz0Pk/XMypkchaaWWYtw0Pyv
 +SnwI8P7rBZIyj8cG13pJICOXd55WIo9KBphj19oSbkeD+UE3HvYdMMi9p0g/EMl349v
 V5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtAOwEmizSXmIkh30HKF25wTD18EAWpeWdhE7dkllNs=;
 b=L6+ALrcIgmanQbkMk2pAdqCFnEl9i4DLQFcSo5fV4d3WpW1paKAzwAdYdKZQb8kw/w
 lWQ1jfBc0VPG+H0sVDlp4TeYdHuPDOSkClIhOCzd9OJ/GghHfcQZHTRKfSZMLgqpnpx2
 gOt5D0RQ9hJbx7V4MA1rYYLy+WTrbzecgvK4ixnyBEDYxY2ndw1T0ZW7xU/dCgpVhfTi
 O+3PPAH6k7ZLHzcbyPsGxe+j47Ce39j/IgXwVioyB7+bGgKLih+8K+vpL0LUkZAI+tNs
 ej+q3uPH+t5kLS6rAH41XZXOQJ98zrpz2P27k/0w9OB+tAiLn3cmoocUE5BldzXlpk/k
 xCag==
X-Gm-Message-State: AOAM530UH1j8WT0kzFmdKmmV0PaOOXdHl3YFlzKXgJVJUr2n0uigpWGr
 jjVEA0WrTVTkNMFPBDJdjbTEFWvGXLNqbIXL
X-Google-Smtp-Source: ABdhPJxZvh7UGiKoLb3bQAdGOE/yM4veJW9oQ2ZzPN/cB2f7BL75dwU9v6EuG8b27l35DZYuMy6gXQ==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr555705wrt.287.1610392777131;
 Mon, 11 Jan 2021 11:19:37 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/display/dc/dce/dce_transform: Demote kernel-doc
 abuse
Date: Mon, 11 Jan 2021 19:18:51 +0000
Message-Id: <20210111191926.3688443-6-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhlYWRlciBkb2Vzbid0IHByb3ZpZGUgYW55IGFkZGl0aW9uYWwgcGFyYW1ldGVyIGRlc2Ny
aXB0aW9ucy4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
OgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFu
c2Zvcm0uYzoxMTA0OiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioKCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwu
Y29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV90cmFu
c2Zvcm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNl
X3RyYW5zZm9ybS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfdHJh
bnNmb3JtLmMKaW5kZXggNjEyMWJiN2IwMDliOC4uYWJiYWE2YjBiMmRiOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMKQEAgLTEx
MDAsNyArMTEwMCw3IEBAIHN0YXRpYyB2b2lkIHByb2dyYW1fZ2FtdXRfcmVtYXAoCiAKIH0KIAot
LyoqCisvKgogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiAgRnVuY3Rpb246IGRhbF90cmFuc2Zv
cm1fd2lkZV9nYW11dF9zZXRfZ2FtdXRfcmVtYXAKICAqCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
