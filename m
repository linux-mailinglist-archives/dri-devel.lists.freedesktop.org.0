Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2263BF4CA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B4A6ED5C;
	Thu, 26 Sep 2019 14:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8A06ED5C;
 Thu, 26 Sep 2019 14:12:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q7so1914905pfh.8;
 Thu, 26 Sep 2019 07:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LgNE1dnflbO76HHoSzXDBrhS2Qt9Qg9bvtNf3mYw86I=;
 b=JS5Oi9pS823Y4v6gzYW9WOZ0siUPu2JEqp1xN9rz/cGl0rgckiGoqdrdiZ2Fzmql+a
 r9toiXrEEzaPxDwWy10ngzbnJ61dOLmq9m3RSypio8shrkMxa2cgrJq4ScJYHopMTOxH
 vA4VrLZT1/vPAUHfxf+iSZRopB6+Ijrbk4tJKxyUJ9N9NY+vvIWy/O6Sswd21GCeEGcn
 e6PLjHkqdEH+PfHsInL+X4SZScE/kSDwgaNMIf5aywRg7OrTfsRdZezkhwfNo0z0UVAN
 kxUFBxgnrbzHzSEA7RLa4V0SKBi/IQiaPtfUaXXwPgBqCMf5Z4hrfkfW5WMn3YawjOb6
 mHTQ==
X-Gm-Message-State: APjAAAX7woYHInxdx413/HEQptQ7bpagKOnVV3SzBmon786YCNzC9JC7
 hzF6fDIvsB59VOi3n8L+qhRLZ8vuwqo=
X-Google-Smtp-Source: APXvYqxAaxElkCn4oXPZ0wMYkG1duxyAGiO3q0DLLuAugW5UiPYRPTECr461qV5PpezM6leqTb7duQ==
X-Received: by 2002:a17:90a:a6f:: with SMTP id
 o102mr3719182pjo.103.1569507179491; 
 Thu, 26 Sep 2019 07:12:59 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 w188sm2176740pgw.26.2019.09.26.07.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:12:59 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/lima: add __GFP_NOWARN flag to all dma_alloc_wc
Date: Thu, 26 Sep 2019 22:10:45 +0800
Message-Id: <20190926141046.30758-8-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926141046.30758-1-yuq825@gmail.com>
References: <20190926141046.30758-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LgNE1dnflbO76HHoSzXDBrhS2Qt9Qg9bvtNf3mYw86I=;
 b=g055cOp9PZ4Qk7VOgAYY4Hd2MZdCaD1mpASFUvRBJsRSBcntvlOTVwDkfeMcWsfkDv
 lK4AxUNpB4p3pbb9Ia76Qxn//Eh/zApdrToiBayYSHs6WYLarZ9WEHflsiEPg3UmAXaQ
 Xn3iRRvPP8kpZZK4jEv/h26TiJpRJPx4kDcyE6ygSAoGkOM+4FiXQXBJwzX4TYeMZFyw
 yeLQCqzM1MXYlbke2JPQ+t9whFHxugs+11T/QRtHbzcEb/WSov2S9c63J6HSZLzezYqG
 wFBX75eGxtLv36R3xhpJBmDNYuGuXruFVGMft+n1ZjUNSt3agN9qPCbfj8+kwtljruEH
 AQTA==
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
Cc: lima@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwcmV2ZW50IENNQSBwcmludGluZyBkdW15ICJQRk5zIGJ1c3kiIGluZm8gd2hpY2ggaXMK
Y2F1c2VkIGJ5IGFsbG9jIGZhaWwgcmUtdHJ5IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZ
dSA8eXVxODI1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2Rldmlj
ZS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5jICAgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfZGV2aWNlLmMKaW5kZXggZDg2YjhkODFhNDgzLi4zZDFhMmI0ZDEwMDUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYwpAQCAtMzEzLDcgKzMxMyw3IEBAIGludCBsaW1h
X2RldmljZV9pbml0KHN0cnVjdCBsaW1hX2RldmljZSAqbGRldikKIAkJbGRldi0+dmFfZW5kID0g
TElNQV9WQV9SRVNFUlZFX1NUQVJUOwogCQlsZGV2LT5kbGJ1X2NwdSA9IGRtYV9hbGxvY193YygK
IAkJCWxkZXYtPmRldiwgTElNQV9QQUdFX1NJWkUsCi0JCQkmbGRldi0+ZGxidV9kbWEsIEdGUF9L
RVJORUwpOworCQkJJmxkZXYtPmRsYnVfZG1hLCBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOKTsK
IAkJaWYgKCFsZGV2LT5kbGJ1X2NwdSkgewogCQkJZXJyID0gLUVOT01FTTsKIAkJCWdvdG8gZXJy
X291dDI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMKaW5kZXggOGU2OWM0NTQwZThiLi44NDBlMjM1MGQ4
NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMKQEAgLTU2LDcgKzU2LDcgQEAgc3RhdGljIGludCBs
aW1hX3ZtX21hcF9wYWdlKHN0cnVjdCBsaW1hX3ZtICp2bSwgZG1hX2FkZHJfdCBwYSwgdTMyIHZh
KQogCiAJCXZtLT5idHNbcGJlXS5jcHUgPSBkbWFfYWxsb2Nfd2MoCiAJCQl2bS0+ZGV2LT5kZXYs
IExJTUFfUEFHRV9TSVpFIDw8IExJTUFfVk1fTlVNX1BUX1BFUl9CVF9TSElGVCwKLQkJCSZ2bS0+
YnRzW3BiZV0uZG1hLCBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7CisJCQkmdm0tPmJ0c1twYmVd
LmRtYSwgR0ZQX0tFUk5FTCB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQX1pFUk8pOwogCQlpZiAoIXZt
LT5idHNbcGJlXS5jcHUpCiAJCQlyZXR1cm4gLUVOT01FTTsKIApAQCAtMjA4LDcgKzIwOCw3IEBA
IHN0cnVjdCBsaW1hX3ZtICpsaW1hX3ZtX2NyZWF0ZShzdHJ1Y3QgbGltYV9kZXZpY2UgKmRldikK
IAlrcmVmX2luaXQoJnZtLT5yZWZjb3VudCk7CiAKIAl2bS0+cGQuY3B1ID0gZG1hX2FsbG9jX3dj
KGRldi0+ZGV2LCBMSU1BX1BBR0VfU0laRSwgJnZtLT5wZC5kbWEsCi0JCQkJICBHRlBfS0VSTkVM
IHwgX19HRlBfWkVSTyk7CisJCQkJICBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOIHwgX19HRlBf
WkVSTyk7CiAJaWYgKCF2bS0+cGQuY3B1KQogCQlnb3RvIGVycl9vdXQwOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
