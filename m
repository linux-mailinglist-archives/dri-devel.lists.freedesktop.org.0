Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FD2F62F7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 15:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF86E3F9;
	Thu, 14 Jan 2021 14:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D72D6E3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 14:22:51 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 15so3887554pgx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 06:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=XCkrYWoe/EDhhrXT2w0od5wYE+gjn97ezYkPBm+ukcM=;
 b=ebIHMxRoG6Lw6Qnnz194cWulVJ7CtdgwPORoBI0MUI/Bjh+CaA1EvTwcTrUKR7l/Or
 P7c62cN+XXpUhrhIXm4LEPH3P/XDJBZ6e81d8hu2wO4OZwZ4vVYX7oEzolC/JDbLAonB
 hOPPTb0LlRcxoBcHH8BvvasxXRbE5lpaINX76S1OXvU1xaYlB7jRg5a2CXx4lVNKj+in
 ugWjcWODpZq+a5zEwnq7aBDTJPFb5iIWYLdf7881E3DJ0JWU/MkGXdBLW7j/Y/S/Qi20
 QTJmFajIUJPeL0UY7Wx1xO6L6kQAeh/mam9h/SgyENbFVHzP2bzWylU6/8UTYFgQiOLO
 1TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=XCkrYWoe/EDhhrXT2w0od5wYE+gjn97ezYkPBm+ukcM=;
 b=sIfzJ0WGPyQe/sI7TiOvEHny/v29wlmZboeErL3+xpp5s1qBBSNQRjOHgJMq/ni+CL
 Ki9mFqclNysZxP8gyeaDeifMDbhbaOA5fHlieQBtTJ+W503fDsO5gnZSdQN8VuU1lIUH
 Bhk6R7pf+Bh5bIA9lmh2odY/oMKMb2TEAyK1Sf6PNckoROdObvVFgm5nV8v+DaN8qAfT
 c3LRvNLVw7Boj3NGUcickJGwUfq90HIeaXSqUMLFMWXrex9EtnIgklU5MTCXyp2XZhof
 Fu+c42reNkC8Vqs5qVzVATq3C5rBbFeNzZaz2Nr1pTR4tGcLG3qUkCGMobgExoOIHeSi
 5EPg==
X-Gm-Message-State: AOAM532EvyaEmkzrh5tMjkgujfSzX8ciedEYmoi00BXbQMzyCMiLusZ6
 +HN5dygZ0CKodL6mWQwFIJZ4yWxzcXI=
X-Google-Smtp-Source: ABdhPJw4LchfsuTQIaiDfd10NoFHz9inHbHookIrfvLa/tt7v2jFq5AdBQtjlzwjbZPnKwz2ldkKCQ==
X-Received: by 2002:a63:d601:: with SMTP id q1mr7650939pgg.417.1610634171161; 
 Thu, 14 Jan 2021 06:22:51 -0800 (PST)
Received: from adolin ([49.207.193.3])
 by smtp.gmail.com with ESMTPSA id c11sm5924498pjv.3.2021.01.14.06.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:22:50 -0800 (PST)
Date: Thu, 14 Jan 2021 19:52:45 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/vblank: Fix typo in docs
Message-ID: <20210114142245.udr7v2aa43ho56xs@adolin>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHR5cG8gaW4gaW50cm8gY2hhcHRlciBpbiBkcm1fdmJsYW5rLmMuCkNoYW5nZSAnc2Fjbicg
dG8gJ3NjYW4nLgoKU2lnbmVkLW9mZi1ieTogU3VtZXJhIFByaXlhZGFyc2luaSA8c3lscGhyZW5h
ZGluQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJs
YW5rLmMKaW5kZXggZDMwZTJmMmI4ZjNjLi4zMDkxMmQ4ZjgyYTUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxhbmsu
YwpAQCAtNzQsNyArNzQsNyBAQAogICogICAgICAgICAgICAgICAgfOKGk+KGk+KGk+KGk+KGk+KG
k+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KG
k+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk+KGk3wgICB1cGRhdGVz
IHRoZQogICogICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgZnJhbWUgYXMgaXQKICAqICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIHRyYXZlbHMgZG93bgotICogICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgKCJzYWNu
IG91dCIpCisgKiAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAoInNjYW4gb3V0IikKICAqICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICBPbGQgZnJhbWUgICAgICAgICAgICAgICAgfAogICogICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgKiAgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
