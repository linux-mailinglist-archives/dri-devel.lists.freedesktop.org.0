Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1642C5601
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1E26E951;
	Thu, 26 Nov 2020 13:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76996E951
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r3so2213394wrt.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmY41ceyc6chYcpESZmZP3QGDnanFIcluGLqchr029A=;
 b=e1rVMTz6bLbCWASJmqUfDpitRKv9ISCBYaTNCD0SsSAd2EevlEBxrDdSKB+rQAYuFU
 8rr0oxy3WkZj1teuHpAo7OhQRMfaVPWERVifkADPWDCscLCwxlhpbpAl2LORsJ9Ui0rg
 OObbVbb/IohqBdFI9IFOxkjXusCH1fFfn4hLae9Cnj+rpHn0caLy1qwtkD2LImtKrn8v
 6tA0xY4l+ViFaqf7bT6YmrhuJQiz/rwJyTU8lb6/112ic37dwpE9bXfBwZeB9WBS9kIl
 hZIA2MDWZJQC0Hp2Lh0GAUnYFNRGY2M6211dL4sn+pPH9Jk9PvbofcF7LWhBFxx9C5BD
 /UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmY41ceyc6chYcpESZmZP3QGDnanFIcluGLqchr029A=;
 b=W/GSdSI5eux5i0My62PyIkhFWy3cNFMiYdDRr/G3Ur27FdIHBI7B4kSUPa+InBrooY
 ZpTg7GanKkbc0J6flNeMRxYGos/4uCR8GohRY2l2JaYzrKlNMkIDTfnYlgUMMxOihzSl
 wq1H69hNyWVS7VThxGWW4Tuflre/P0Q67fh7K9cGv1ElqkKMsnHLmas5y+Sn7XUCyQEQ
 xVvxoXPkCVfAN9vEGUSJhNE3MCPVKrk7mbGz4EhJHPOj+ZZdzHhpvWX1Oue+eiwn+iXp
 BqEB54OKL5bLgZcKisl8EwV7Vk8/Fzte4kCfwKW+x6qEwCM+/teWpUA+sRJPs2ufDmlL
 f2uw==
X-Gm-Message-State: AOAM530FRTE3kvSqVnEZJLobQWBwWQ0Uh5rpmXk9DQEew8u4dk4j6N7L
 gvdC60wr2d+zU9NMMMF6q+TCCw==
X-Google-Smtp-Source: ABdhPJwQFSXC5wh+xxoo2UvAuPfEbz5ABc/LCULY9XBt+X2t0p9Y7pi4DpLwBb/4gHK4J8jJ1Nl8MQ==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr3870152wrp.142.1606398166640; 
 Thu, 26 Nov 2020 05:42:46 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/amd/pm/powerplay/smumgr/polaris10_smumgr: Make
 function called by reference static
Date: Thu, 26 Nov 2020 13:42:02 +0000
Message-Id: <20201126134240.3214176-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBfc211
bWdyLmM6MjE0NTo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBvbGFy
aXMxMF90aGVybWFsX2F2ZnNfZW5hYmxl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBF
dmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
cG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBfc211bWdyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMxMF9zbXVtZ3IuYwppbmRl
eCAwNTJiYzg4Y2YzM2M5Li40NTIxNGEzNjRiYWE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBfc211bWdyLmMKQEAg
LTIxNDIsNyArMjE0Miw3IEBAIHN0YXRpYyBpbnQgcG9sYXJpczEwX3Byb2dyYW1fbWVtX3RpbWlu
Z19wYXJhbWV0ZXJzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJcmV0dXJuIDA7CiB9CiAKLWlu
dCBwb2xhcmlzMTBfdGhlcm1hbF9hdmZzX2VuYWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQor
c3RhdGljIGludCBwb2xhcmlzMTBfdGhlcm1hbF9hdmZzX2VuYWJsZShzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyKQogewogCXN0cnVjdCBzbXU3X2h3bWdyICpkYXRhID0gKHN0cnVjdCBzbXU3X2h3bWdy
ICopKGh3bWdyLT5iYWNrZW5kKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
