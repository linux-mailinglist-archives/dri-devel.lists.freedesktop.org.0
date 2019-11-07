Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A9F36E7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 19:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7799B6F782;
	Thu,  7 Nov 2019 18:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D411F6F780
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 18:19:18 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id h15so2817606qka.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 10:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4GBcHuA6lfQX+8wO0BTc6Q9PUW2yOvDfpyD0TvRUUbo=;
 b=cy2EXch8ywIPzyEVjlHXU1ADF41Ed+8oln875DGNZh2jBAyfCZCqbDPNMHLHjfpEtX
 hMfMp0dMDAOTB8fNOEv4l3ChmfBEFVTewdmEya+k1A/B8stqFJnYIoAD2gEZp3K2JRQg
 jkiYg4sES3O/qCxvyRqJcbeg4oKl7hBNIkUh1vdjtSDAHgsdUZ9WvrbdfOkzsb9mmFpV
 HyPSwj66qPXeET2PSNEcvPHaSB4NNeK49Ueyu0Sr1G+kXzH0ZZUrXab6L+V1SOkKcw4M
 9OpB5pnlCNPoJFTE0Sv+l+MoumGzci/t0QRnQL8lkdfUhLZdPwM5wqPNNRSMgANIWMa1
 69Sw==
X-Gm-Message-State: APjAAAUbgANtPp1odJP6dDPUIoyqL73Zo0ZjvGIrA9xFmeU9oKXu3VG+
 4WNX2wLDiqKRifraoHVmOQ0=
X-Google-Smtp-Source: APXvYqzkbyiVbwOdUbnfBzWcJzXiDYFmvM11Ec7t6xerL9rt3E7uTYnejiR59//y6trk1qQGLDYhHQ==
X-Received: by 2002:ae9:e851:: with SMTP id a78mr4204514qkg.312.1573150757904; 
 Thu, 07 Nov 2019 10:19:17 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id o76sm1424543qke.135.2019.11.07.10.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 10:19:16 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: stefan@agner.ch
Subject: [PATCH v2] drm/mxsfb: Remove brackets for single line if block
Date: Thu,  7 Nov 2019 15:19:11 -0300
Message-Id: <20191107181911.22095-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4GBcHuA6lfQX+8wO0BTc6Q9PUW2yOvDfpyD0TvRUUbo=;
 b=IdhlqQ1TOVhNn82NbTpUI3I3ygDEb5ysOUFb6rGstE4tb4YE8A5u/fGRURav2Ki0Ew
 Nd7cXCJ56rE1yA5iK7OQJTkgczuC20TPUG/CfaLHKqA8AiS7cT5cpClaIF0KHnRMAbjb
 tYoUro7plp87xvagUCUcndSyDost3GUzWry4gP75Wouc50MI5esaxCvObaQPg3Iyxnmq
 ZfyC9S27mg8mIYcO42m6xV/kEwE4SAdic81mduj2Dh12TsUKsXxfpMWmqvWf4TsrzRL9
 yRccQ5YIoi4XRMrBabvOM60OPUw/Zmj9b4K86aAka8OveUdzPb9pXUJ2lnYjMmngCwFr
 389g==
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gbmVlZCBmb3IgYnJhY2tldHMgZm9yIGEgc2luZ2xlIGxpbmUgaW5zaWRlIHRo
ZSAnaWYnIGJsb2NrLApzbyByZW1vdmUgdGhlIHVubmVlZGVkIGJyYWNrZXRzLiAKClNpZ25lZC1v
ZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgc2lu
Y2UgdjE6Ci0gRml4IHR5cG8gaW4gY29tbWl0IGxvZwoKIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9jcnRjLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9j
cnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCmluZGV4IGI2OWFjZThi
ZjUyNi4uYmFjZDFmMmIyZmIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhz
ZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKQEAgLTMy
NiwxMSArMzI2LDEwIEBAIHZvaWQgbXhzZmJfcGxhbmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgbXhz
ZmJfZHJtX3ByaXZhdGUgKm14c2ZiLAogCWlmIChldmVudCkgewogCQljcnRjLT5zdGF0ZS0+ZXZl
bnQgPSBOVUxMOwogCi0JCWlmIChkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpID09IDApIHsKKwkJ
aWYgKGRybV9jcnRjX3ZibGFua19nZXQoY3J0YykgPT0gMCkKIAkJCWRybV9jcnRjX2FybV92Ymxh
bmtfZXZlbnQoY3J0YywgZXZlbnQpOwotCQl9IGVsc2UgeworCQllbHNlCiAJCQlkcm1fY3J0Y19z
ZW5kX3ZibGFua19ldmVudChjcnRjLCBldmVudCk7Ci0JCX0KIAl9CiAJc3Bpbl91bmxvY2tfaXJx
KCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
