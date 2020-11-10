Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF412AE456
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD5689D61;
	Tue, 10 Nov 2020 23:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB3D89D60
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:47:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o24so10135782ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1gRUn+R+klQwSA/hEFGmAtJ4OnicYEWs/eLK/JMuQY=;
 b=U9ihdXyD1urh+RHMp9iS7+yRg5oU1dA1y2MstjcSTXJ/aqTwr7ziS1Bfr9pmwaGQ4r
 88uJuihEMFiDn0RNYkbZp585ls0glQXr3FPPC4Cqo4uKvehn4d4/kxIX4+goPiPV860a
 SLu7/fEeVaJ7q1Gp/wzZhzjoesA7nKt0QYPBPV9Yz6bzQ7kk/xit3DFfDz0/nN4aNAxR
 8mXYseGVARTmwrSkzZgmu/7iqcN7jodaH3bVR8/Y01uL1EbpwNJBnHRp5clYuBkHaxf5
 9qSeHCPvYCFpIBmh3EZD0rrZuEpCVQcPqTo2bxRjV4M1o+JUK3XZ43dmA43n5WlUd8Q+
 bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1gRUn+R+klQwSA/hEFGmAtJ4OnicYEWs/eLK/JMuQY=;
 b=im9CRrSeABrtW+rTTEM5vnjF+HlsflvWWzG7h+akNjp2I4R8eYtpcaBsNVeXFXt0IX
 K47EQ5CqsyXTcPruNCZfc6ZxEAt/W8hKyVVue11UC0qLfJ1mHmjQ6jYsvIGZo0dPwpfc
 DePahqS7k8/EvslJkVuyEn5DS/4kbf+mQ688EhcVVPpjzRrhOTjnFlKjGSqmztI6FOYW
 W/zd3eNC/m9QCGV9+QehZnxpVscj8fxQTv9y7dLQNdwG8xVTE8xP7ICn+tM5n+todKOP
 SPFi5v8y7HthWOCu04g5iff4jvwd6MiacY6w766t8JiRa8uwcRBGw/cuwwt3gxyAKcXE
 HKxw==
X-Gm-Message-State: AOAM530OYxy5NkRYBWSoXmkovcOJv0auv7g1BtEcOhgAUrnXCQcDEY/i
 uAK4LG9bWz8N0S1escyNBQ1l2w==
X-Google-Smtp-Source: ABdhPJxIJrO5fByuVcFYiXbVUCNS8ERYFbme3PDojsduwGAs4jamuSEibsdODjf4WOe7N6BG8x8Yug==
X-Received: by 2002:a2e:b536:: with SMTP id z22mr9602614ljm.177.1605052023412; 
 Tue, 10 Nov 2020 15:47:03 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y65sm39883lff.73.2020.11.10.15.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:47:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 3/5] drm/panel: s6e63m0: Add some explanations
Date: Wed, 11 Nov 2020 00:46:51 +0100
Message-Id: <20201110234653.2248594-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110234653.2248594-1-linus.walleij@linaro.org>
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNQSSBEQ1MgY29kZSB3YXMgYSBiaXQgaGFyZCB0byB1bmRlcnN0YW5kIGFzIHRoZQpkZXZp
Y2UgYWNjZXB0cyA5LWJpdCB0cmFuc2ZlcnMgcGFja2VkIGludG8gMTYtYml0IHdvcmRzCndpdGgg
dGhlIG1vc3Qgc2lnbmlmaWNhbnQgYml0IGluIGJpdCA5IG9mIHRoZQoxNi1iaXQgd29yZC4gQWRk
IHNvbWUgY2xhcmlmeWluZyBjb21tZW50cy4KCkNjOiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5A
Z2VyaG9sZC5uZXQ+CkNjOiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFp
bC5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLXNw
aS5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAtc3BpLmMKaW5kZXgg
OWUxNTUyYTdjY2M3Li5lNDc2NDdmNDE4ZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAtc3BpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYwpAQCAtNDIsMTAgKzQyLDE3IEBAIHN0YXRp
YyBpbnQgczZlNjNtMF9zcGlfZGNzX3dyaXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgdTgg
KmRhdGEsIHNpemVfdCBsZW4pCiAJaW50IHJldCA9IDA7CiAKIAlkZXZfZGJnKGRldiwgIlNQSSB3
cml0aW5nIGRjcyBzZXE6ICUqcGhcbiIsIChpbnQpbGVuLCBkYXRhKTsKKworCS8qCisJICogVGhp
cyBzZW5kcyA5IGJpdHMgd2l0aCB0aGUgZmlyc3QgYml0IChiaXQgOCkgc2V0IHRvIDAKKwkgKiBU
aGlzIGluZGljYXRlcyB0aGF0IHRoaXMgaXMgYSBjb21tYW5kLiBBbnl0aGluZyBhZnRlciB0aGUK
KwkgKiBjb21tYW5kIGlzIGRhdGEuCisJICovCiAJcmV0ID0gczZlNjNtMF9zcGlfd3JpdGVfd29y
ZChkZXYsICpkYXRhKTsKIAogCXdoaWxlICghcmV0ICYmIC0tbGVuKSB7CiAJCSsrZGF0YTsKKwkJ
LyogVGhpcyBzZW5kcyA5IGJpdHMgd2l0aCB0aGUgZmlyc3QgYml0IChiaXQgOCkgc2V0IHRvIDEg
Ki8KIAkJcmV0ID0gczZlNjNtMF9zcGlfd3JpdGVfd29yZChkZXYsICpkYXRhIHwgREFUQV9NQVNL
KTsKIAl9CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
