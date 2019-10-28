Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA5E7B21
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 22:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0CB6EA76;
	Mon, 28 Oct 2019 21:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132076E50C;
 Mon, 28 Oct 2019 09:20:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q130so8272015wme.2;
 Mon, 28 Oct 2019 02:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wIuGwn2jgbDtMcHHOszupBu+fQifNyNj/PTHe+Q5iEw=;
 b=hZzbvCOM8aDRz/3UwzrNiz4yfzR30lrsPfejnq6jzNMVAsv1YPKd+2O3LnUKkPmX+R
 8AqCxQpiQkGNKyAcX9LLX97NU6mfHDs9VpRNfN6CX1/eqL4nchkve2waPTH9jwLXv2hc
 Brp+1yz+cOajigXNVKR9VtX8rFVoFEDsU0ou9qJY6nL5OhaqZc6xqO0uS4mZDDw6CCiz
 AdadQjxLa294ly+HSju5psbZTaHpytwQZOojyPbMYkOAVVgxIUVp+bpZ82ojr5FqXBdJ
 oFVUyvEVfSqCbewwTCVMv2pkbU9VRQh9dRxpSwOawtQkLxV5XxX+l2w0qTrA1LYvwiCl
 hOtw==
X-Gm-Message-State: APjAAAX7WObblBTKhptZ0vN5BkEbETC2S18OXcTGjxZh/LO4KiGpQ/Ol
 O5uqpJVXGJfyPwgMh1eXYs9V+8Fp+lcRUg==
X-Google-Smtp-Source: APXvYqxBcssIkhamPko/fax5AmALlb8thgEIQaTOHQbgFgVvAlPSNmDGOtswJVwTfhME3llhdxSSmw==
X-Received: by 2002:a1c:1d10:: with SMTP id d16mr15486351wmd.14.1572254417401; 
 Mon, 28 Oct 2019 02:20:17 -0700 (PDT)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id z9sm11427513wrv.1.2019.10.28.02.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 02:20:16 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Outreachy][PATCH 1/2] drm/amd: declare amdgpu_exp_hw_support in
 amdgpu.h
Date: Mon, 28 Oct 2019 12:20:04 +0300
Message-Id: <20191028092005.31121-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028092005.31121-1-wambui.karugax@gmail.com>
References: <20191028092005.31121-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Mon, 28 Oct 2019 21:09:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wIuGwn2jgbDtMcHHOszupBu+fQifNyNj/PTHe+Q5iEw=;
 b=CMh/MkDfospgY1lS3Xa8YLvgA9gN95y9aLEw+FmGBfX8eZl2bSwff0ji6BoiaaTSLy
 MOJK+6FLYglo4N6XVNJmnHdND7sNqftfNoXJocRfHqY8UgcbKumVjpa7W7zjCIHbjphq
 Bpsq49P0mzhpqPzd1E2iLq2T1Yka06IFlCMvpJAl5jyGgJp0O0Pwz43p6dJmNQ4csW9l
 T5RLdsVBLcBayfL+eTTaDCLM7Pq+42LucGCwv9KfRrGvRvVt4stEiYwVyGh0LkMF4pBb
 LkrHy+VKanwipDT7oyQZU28VX1uF6YWijZbK+woXWBY/8RAsAdecnMhEVnz4uW68Issh
 qwsg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@linux.ie, outreachy-kernel@googlegroups.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVjbGFyZSBgYW1kZ3B1X2V4cF9od19zdXBwb3J0YCBhcyBleHRlcm4gaW4gYW1kZ3B1LmggdG8g
YWRkcmVzcyB0aGUKZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nOgpkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmM6MTE4OjU6IHdhcm5pbmc6IHN5bWJvbCAnYW1kZ3B1X2V4cF9o
d19zdXBwb3J0JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKU2lnbmVk
LW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21haWwuY29tPgpTdWdnZXN0
ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IGY0ZDkwNDFl
ZjQzMC4uMzYxMGRlZmRmYWUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAt
MTQwLDYgKzE0MCw3IEBAIGV4dGVybiBpbnQgYW1kZ3B1X3ZtX2ZyYWdtZW50X3NpemU7CiBleHRl
cm4gaW50IGFtZGdwdV92bV9mYXVsdF9zdG9wOwogZXh0ZXJuIGludCBhbWRncHVfdm1fZGVidWc7
CiBleHRlcm4gaW50IGFtZGdwdV92bV91cGRhdGVfbW9kZTsKK2V4dGVybiBpbnQgYW1kZ3B1X2V4
cF9od19zdXBwb3J0OwogZXh0ZXJuIGludCBhbWRncHVfZGM7CiBleHRlcm4gaW50IGFtZGdwdV9z
Y2hlZF9qb2JzOwogZXh0ZXJuIGludCBhbWRncHVfc2NoZWRfaHdfc3VibWlzc2lvbjsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
