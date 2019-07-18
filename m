Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B96D13C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD4C6E40B;
	Thu, 18 Jul 2019 15:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1846E40B;
 Thu, 18 Jul 2019 15:37:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so27844856ljh.2;
 Thu, 18 Jul 2019 08:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w6yHqmxck4jbNZAyXHzblUU+tcGpDiDKg0tZ501j8fk=;
 b=AMkKPpVs9QiBgnMK+oQIVWfyOqQYDLTFtSuhi5Grx9maDZ1f67PGLNaFDQI7JwfZCq
 P344HUfCfBidBMX2Ks/I11boeeVIf87TNgk1MhUloWUfp9qJKj0vuSsWzBL2v12NZAP5
 WOAFgTJxPGTHVZv1nFw83MWv9Yv2x1e50rp7aLjTR3/JBQKZX/Rdjr3T7EhHwbrXtNc4
 yNhz1b3Ak1dfKyh1RiX0F+GwMfHYiR2NoiQxNdOV7TU+B80JatpLM9jC/zCptCuFnV5T
 VnBOmLztmAUt0OC6HdxXGZXXTMu/FhXLeNF1hs9ADtTVOuUSUdM4ox+qYsWf5/KLsRJM
 HLHQ==
X-Gm-Message-State: APjAAAXqqxuS/xC1SooWQJ0dlseLyUF/hcn/7gIfcBZcfC2Shgz1k8Eb
 ZD72BMuvMBYd+tx1F2RmglAUfQz2WOU=
X-Google-Smtp-Source: APXvYqw9QxIzUJtvGxY+df+B6xKMMcawOqcuSXsObNg7rQ3hiNLz+0DbweMOyAkqSggZgH/TMzjSCg==
X-Received: by 2002:a2e:7818:: with SMTP id t24mr6265468ljc.210.1563464272078; 
 Thu, 18 Jul 2019 08:37:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c30sm4062388lfp.70.2019.07.18.08.37.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 08:37:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v1 2/6] drm/via: make via_drv.h self-contained
Date: Thu, 18 Jul 2019 17:37:33 +0200
Message-Id: <20190718153737.28657-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718153737.28657-1-sam@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6yHqmxck4jbNZAyXHzblUU+tcGpDiDKg0tZ501j8fk=;
 b=oCZ/msCfkMapoYpybJdeaXXD90/mqq3oHISqkRNaJbHT0kyU6jY1DzyaNBVqbtLYjT
 m/09iT0GMkuVY3oNc9xjjuFCptkY5f4NUc9aev0u1kxFHbBecoWndCoNbgJKYgSlv8Xx
 o8/8FRYNQwJPZjc9+7G7KoYv9BgTZS0oinlPjA8lhCx0mUrjLJx+SH1xgaW3aPHhX3V4
 taRfrpWVpbQJJncjhYZj2c5bXGnTxQXwNuhU4jKAMuzUkaPaflcqzujFbmwgUfgo/GfV
 7+RMZJFLuQw60KeI83WjS+eOvrhTfn/54O1x7qI6p0xxR62kw6skxCEclD12esSxj8Vu
 LYpQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgdGhlIG5lY2Vzc2FyeSBoZWFkZXIgZmlsZXMgdG8gbWFrZSB0aGlzIGhlYWRlciBmaWxl
CnNlbGYtY29udGFpbmVkLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpDYzogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAZ214LmNvbT4KQ2M6IFRob21hcyBI
ZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KQ2M6ICJHdXN0YXZvIEEuIFIuIFNpbHZh
IiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KQ2M6IE1pa2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5p
Ym9uZC5jb20+CkNjOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLnZl
bGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaCB8
IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmggYi9kcml2ZXJzL2dw
dS9kcm0vdmlhL3ZpYV9kcnYuaAppbmRleCBkNWEyYjFmZmQ4YzEuLmYzNmFjMTEzNDQyNCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpYS92aWFfZHJ2LmgKQEAgLTI0LDggKzI0LDEyIEBACiAjaWZuZGVmIF9WSUFfRFJWX0hf
CiAjZGVmaW5lIF9WSUFfRFJWX0hfCiAKLSNpbmNsdWRlIDxkcm0vZHJtX21tLmg+CisjaW5jbHVk
ZSA8bGludXgvaXJxcmV0dXJuLmg+CisKKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5j
bHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX21tLmg+CisjaW5jbHVk
ZSA8ZHJtL3ZpYV9kcm0uaD4KIAogI2RlZmluZSBEUklWRVJfQVVUSE9SCSJWYXJpb3VzIgogCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
