Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB272B0D36
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA376E3D2;
	Thu, 12 Nov 2020 19:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC686E3B7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so7145704wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5obwl2HLa2hJZGgN7+byxbis29C9PE5dIA5hYQvye+A=;
 b=Ou/EHKHaEikqtJE8cSM3UeFbvQcGsPiJBRWhjq0TuVV/p+7lAQB2pg8b4Kd4VZd3N1
 /ZIKy/fqiwlHuzVcGicWjs831K9oFyeMNkx15nOMF0ribAwncR+UlsMsN53nJxHpf8N9
 HXUn3sdCI7FBbNOTOcZj2kanCeY73XcDbJJE9vCsZpZOtsDcws/JJn8heE5TwbNydQyK
 Z3uZJT4YcJlwukgQusZuPZoA6EJC5YxUtc1/Wr1tCOJBTIn9eMzncQXP0eUye5RR6Z85
 LuqSc1Olu8pR4ucIVUaWvTlZPOaVBKThOibDWHfCJzrYn2QLuLp6Tgta/aAwympaqPdZ
 59Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5obwl2HLa2hJZGgN7+byxbis29C9PE5dIA5hYQvye+A=;
 b=rx1n6aM3Jebijuni9TmbIufEePh6GVkkb34roRf861aMLPOaLH8MnY81H8wcNdem+z
 nOWYVP8FAG8oFPWe9ATuLPKtgfi2jrwe5nhePzRG9LUJ9BKGk9rWVpnwepJ4h5ugtm0y
 2A3CZR/COXRlE6Nwcz+rxIUX6+IMbf+lBt+ELWJFtFeVemqOgoQk9h0fJTeirNitbc+J
 rggjvFdFf1FGxqpv5pTKcI6X7HfLXi6ZoVlIUHpnb25rrJUCWxqn+zdlbWPamnnK3YhQ
 eiGePH8rUYxp5L1zOzZsNMMad2k2AbIXSwE8bWpFFpBFeMofNkCMFhVQxvDJjfRpCEIO
 B1Bw==
X-Gm-Message-State: AOAM530aO/3AmU7haBjE8MmKFRiMmMp9glajLgYZ7e04Qu41XSRcAhVN
 qpjj/BSZDrw0fs59zGYjcXkAuw==
X-Google-Smtp-Source: ABdhPJx07SOqt9KWRMUyfJ1+GAfuKqqM57OQvbqX7ApkBIo/nwqUkubWztVTEBpNnZxx73TJJKtv3w==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr1116351wra.247.1605207677934; 
 Thu, 12 Nov 2020 11:01:17 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/30] drm/amd/amdgpu/amdgpu_display: Remove pointless header
Date: Thu, 12 Nov 2020 19:00:24 +0000
Message-Id: <20201112190039.2785914-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>,
 report to <xorg-driver-ati@lists.x.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgc2VlbXMgb25seSB0byByZXBlYXQgdGhlIGZ1bmN0aW9uIG5hbWUuCgpGaXhlcyB0aGUgZm9s
bG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGlzcGxheS5jOjQ1MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnYW1kZ3B1X2Nvbm5lY3Rvcicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2Rp
c3BsYXlfZGRjX3Byb2JlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3Bs
YXkuYzo0NTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3VzZV9hdXgn
IG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kaXNwbGF5X2RkY19wcm9iZScKCkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiByZXBvcnQgdG8gPHhvcmctZHJpdmVyLWF0
aUBsaXN0cy54Lm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNwbGF5LmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNw
bGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCmluZGV4
IDBiMTM0NTk4YjNhNjUuLmY0ZGU0YjQxYWRjZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwpAQCAtNDQxLDEwICs0NDEsNiBAQCB2b2lkIGFtZGdwdV9k
aXNwbGF5X3ByaW50X2Rpc3BsYXlfc2V0dXAoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlkcm1f
Y29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJml0ZXIpOwogfQogCi0vKioKLSAqIGFtZGdwdV9kaXNw
bGF5X2RkY19wcm9iZQotICoKLSAqLwogYm9vbCBhbWRncHVfZGlzcGxheV9kZGNfcHJvYmUoc3Ry
dWN0IGFtZGdwdV9jb25uZWN0b3IgKmFtZGdwdV9jb25uZWN0b3IsCiAJCQkgICAgICBib29sIHVz
ZV9hdXgpCiB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
