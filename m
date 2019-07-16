Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5A66A25F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ACF6E0B7;
	Tue, 16 Jul 2019 06:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C8A6E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:44:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t28so18739260lje.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WNLQVTD3mImDZdCkfwlhWGlMIu/IFLYFCY63glIoGJk=;
 b=LV5qdXSo1QIOkslVvUUhi+JBhUEajNm1tSZmzLPHN6avWbG/lqPzQXNFDm3kgruBuv
 fzhVApa/x+2kCXGgXurUflYScr2CX8xxo/3GGHtsN1V2nD5VjFk8CbcYaFTpAI8sv9ui
 Bvn1rLm757ixZfZl24q9l92ZgQ82fyvOgbcUEcolr7+zTBDhQGYLZVDDb+dvj6RQsxEm
 t4RrVIzdouKBrbb5But8Vl+Gn/cQpjlNi1hCOQgeyQ9EsQ5M3JiVyJxSI2qr868mgg7L
 sd8TLW6QXxSlRIYx9vSd/Ud+2UMIQxC0B2A34V5nKIXTajBV3g+O68ynFlwy29INlrtV
 ia3g==
X-Gm-Message-State: APjAAAXaNS0BUf0ecqhchDwUSaqMCJhBZC7Tcz7HqJpxCxoqctBxnwvg
 AwQDm/YZRxGtFR/yQndSsVzeGHxN2CNeUA==
X-Google-Smtp-Source: APXvYqwWk4Qi73ftRKoBmg7Yqv1RacZNWxAnP+12Sqo7LkFNKA+dr8bRN0j/QSpIYrHvsqg4rS67rg==
X-Received: by 2002:a2e:898b:: with SMTP id c11mr17076994lji.241.1563259497403; 
 Mon, 15 Jul 2019 23:44:57 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.44.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:44:56 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/19] drm/vgem: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:13 +0200
Message-Id: <20190716064220.18157-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WNLQVTD3mImDZdCkfwlhWGlMIu/IFLYFCY63glIoGJk=;
 b=TkL75CruMrpEbRPGW8QCWhsnwZiKMYvhKE01R5GuHpkEvoJ5ftGLi6YHY5jSWRkc3R
 /z6ggMAUewlxMzGWcP2PymcXgckKZj1uhxfzbP12WJzNJt6mtPkpgGJFnyohpo7hFzId
 GdMBU06TNE/h7i8YVsS02fbmzuQQg4TgFm3HiGxKYgGk4GNQEgLtnvM8AZG55A67AD0s
 6rxd4JtetbkDMOODBRDs3xaygfwtkxnqbRPDTEygY9TQBJCAr+GWrfR5BH3dXLI9zh0W
 WIhrDJKXYg6tLCbaWN6g6H7/VwSPdzbaUdiABrVN+YYdeTuVVsCzMgvAK4sNLXA2nOMh
 rJ7g==
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
Cc: Deepak Sharma <deepak.sharma@amd.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGRybVAuaC4KUmVwbGFjZSB3aXRoIG5l
Y2Vzc2FyeSBpbmNsdWRlcyBpbiB0aGUgaW5kaXZpZHVhbCAuYyBmaWxlcy4KClNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IEVtaWwgVmVsaWtv
diA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBEZWVwYWsg
U2hhcm1hIDxkZWVwYWsuc2hhcm1hQGFtZC5jb20+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jICAg
fCAxMSArKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuaCAgIHwgIDEg
LQogZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5jIHwgIDIgKysKIDMgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9k
cnYuYwppbmRleCA3NmQ5NWI1ZTI4OWMuLjViZDYwZGVkM2Q4MSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2Vt
X2Rydi5jCkBAIC0zMCwxMCArMzAsMTcgQEAKICAqIHNvZnR3YXJlIHJlbmRlcmVyIGFuZCB0aGUg
WCBzZXJ2ZXIgZm9yIGVmZmljaWVudCBidWZmZXIgc2hhcmluZy4KICAqLwogCisjaW5jbHVkZSA8
bGludXgvZG1hLWJ1Zi5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgotI2luY2x1ZGUgPGxp
bnV4L3JhbWZzLmg+CisjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvc2htZW1fZnMuaD4KLSNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+CisjaW5jbHVk
ZSA8bGludXgvdm1hbGxvYy5oPgorCisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KKyNpbmNsdWRl
IDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CisjaW5jbHVkZSA8
ZHJtL2RybV9wcmltZS5oPgorCiAjaW5jbHVkZSAidmdlbV9kcnYuaCIKIAogI2RlZmluZSBEUklW
RVJfTkFNRQkidmdlbSIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2
LmggYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5oCmluZGV4IDVjOGY2ZDYxOWZmMy4u
MGVkMzAwMzE3Zjg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmgKQEAgLTI5LDcgKzI5LDYgQEAK
ICNpZm5kZWYgX1ZHRU1fRFJWX0hfCiAjZGVmaW5lIF9WR0VNX0RSVl9IXwogCi0jaW5jbHVkZSA8
ZHJtL2RybVAuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgogI2luY2x1ZGUgPGRybS9kcm1f
Y2FjaGUuaD4KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5jCmluZGV4IDA4OTk3ZmRkM2NjYi4u
ZDg2MzA0Njc1NDljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2ZlbmNl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5jCkBAIC0yMyw2ICsyMyw4
IEBACiAjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2VydmF0
aW9uLmg+CiAKKyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KKwogI2luY2x1ZGUgInZnZW1fZHJ2
LmgiCiAKICNkZWZpbmUgVkdFTV9GRU5DRV9USU1FT1VUICgxMCpIWikKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
