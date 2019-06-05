Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C3358EF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6776C896A3;
	Wed,  5 Jun 2019 08:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F56896A3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:48:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d18so18560321wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 01:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wLk/6EHVseWKSD89x+s3EZxLh+XcrFPOfmLMorC8Hwk=;
 b=OqQEOCc6DgyMVX+kBXVG4E+6DNRwUsZdUoiG5fiUjfKOfC/jk60yMefLMp2QAqDVm2
 qDYmCbUE1ylekNSYfjcK4iPGgv/iQhMvKRWCskrPz30bbg/xY1IvMcYI7Suda5Gqx2yh
 BXWGTmTlc8rQieUD8R4kY5vdgwBvRRPgwGfKIT6xDwsZcnCf8P8/3gvk1B9sLx2bVFc/
 EM6FKzrnjbakFAzNv+odH+rH6WbdMVnFWU5XlxTS4Hs6BHB2/hmNRYWO+QF6sdnaJmeM
 FSBzgUBpdk8+0ilOUWj/H88jfcLijxSVv9dZCgAOLlAyyJJ9wmdrEcTL7mzjOStl9Vpi
 36xA==
X-Gm-Message-State: APjAAAWFOWZjOuHXGz4vSngPaoBLkPuvbgxOlt5gfCu7P8lc8gXzV6hJ
 qN6XyQhf68WIlApXnFORMfZ9VKh3
X-Google-Smtp-Source: APXvYqzAs2MZwFX2wGsjtZBX8fbegNZm4Mv+J28FDMAKcVtKSTFypko4EDuavoOdhkcFAuRg+T3eqg==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr9618483wri.213.1559724483290; 
 Wed, 05 Jun 2019 01:48:03 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id k66sm9919966wmb.34.2019.06.05.01.48.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 01:48:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: dpaux: Make VDD supply optional
Date: Wed,  5 Jun 2019 10:48:01 +0200
Message-Id: <20190605084801.12599-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wLk/6EHVseWKSD89x+s3EZxLh+XcrFPOfmLMorC8Hwk=;
 b=PrKEISpyPxOcX/IyMTXMTKCqxj1eULOxK8PgVX26HS5ur47qHvfJyDSTMHnh8b+uEG
 ueCrq0N4yGcZxXJnAqWvcc0fMDYatwNvLNTeOqK2B1yVFlg01n0HcUoIlD05Nl0UBnYv
 CHkZSHVZP5cXeEfVIyolGl8TUVCFnTTpX9TUmgbGtBtXumgbWDIgpLT4piIKPXDIr7A3
 5a+nL5/p5KVy6KfGBTIKfmsrEm8mzwj4PRr4AzSASSY6Om2Cfsz7bgAsKMtU97k1q2Xi
 wmiC2mM/7d4ctgjnPOkqa0auso2olbXp9VZOgf7izorADpjMRUEkF5+XBCCggCvEfy2L
 vj+w==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBWREQgc3VwcGx5
IGlzIG9ubHkgbmVlZGVkIHRvIHN1cHBseSBwb3dlciB0byBlRFAgcGFuZWxzIGNvbm5lY3RlZCB0
bwpEUEFVWC4gVGVjaG5pY2FsbHkgdGhhdCBzdXBwbHkgc2hvdWxkIGJlIGRlYWx0IHdpdGggaW4g
dGhlIHBhbmVsIGRyaXZlciwKYnV0IGZvciBiYWNrd2FyZHMtY29tcGF0aWJpbGl0eSB3ZSBuZWVk
IHRvIGtlZXAgdGhpcyBhcm91bmQgYW55d2F5LgoKQWxzbyBhcyBhIGJpdCBvZiBiYWNrZ3JvdW5k
OiB0aGUgcmVhc29uIGZvciB3aHkgdGhpcyBzdXBwbHkgaXMgYXR0YWNoZWQKdG8gRFBBVVggaXMg
dG8gbWFrZSBzdXJlIHRoZSBwYW5lbCBpcyBwcm9wZXJseSBwb3dlcmVkIGVhcmx5IG9uIHNvIHRo
YXQKaXQgY2FuIGdlbmVyYXRlIGEgaG90cGx1ZyBwdWxzZSBhdCB0aGUgYXBwcm9wcmlhdGUgdGlt
ZS4gVGhpcyBtYXkgbm8KbG9uZ2VyIGJlIHJlcXVpcmVkIGdpdmVuIHRoZSBzdXBwb3J0IGZvciBk
ZWZlcnJlZCBmYmRldiBzZXR1cCB0aGF0IHdhcwoicmVjZW50bHkiIGludHJvZHVjZWQgaW4gRFJN
L0tNUy4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMgfCAxMyArKysrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RwYXV4LmMKaW5kZXggZWU0MTgwZDhkYjE0Li42NWMzODlkOWM4NWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
cGF1eC5jCkBAIC00ODUsMTEgKzQ4NSwxNiBAQCBzdGF0aWMgaW50IHRlZ3JhX2RwYXV4X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiBlcnI7CiAJfQogCi0JZHBh
dXgtPnZkZCA9IGRldm1fcmVndWxhdG9yX2dldCgmcGRldi0+ZGV2LCAidmRkIik7CisJZHBhdXgt
PnZkZCA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2LCAidmRkIik7CiAJ
aWYgKElTX0VSUihkcGF1eC0+dmRkKSkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQg
dG8gZ2V0IFZERCBzdXBwbHk6ICVsZFxuIiwKLQkJCVBUUl9FUlIoZHBhdXgtPnZkZCkpOwotCQly
ZXR1cm4gUFRSX0VSUihkcGF1eC0+dmRkKTsKKwkJaWYgKFBUUl9FUlIoZHBhdXgtPnZkZCkgIT0g
LUVOT0RFVikgeworCQkJaWYgKFBUUl9FUlIoZHBhdXgtPnZkZCkgIT0gLUVQUk9CRV9ERUZFUikK
KwkJCQlkZXZfZXJyKCZwZGV2LT5kZXYsCisJCQkJCSJmYWlsZWQgdG8gZ2V0IFZERCBzdXBwbHk6
ICVsZFxuIiwKKwkJCQkJUFRSX0VSUihkcGF1eC0+dmRkKSk7CisKKwkJCXJldHVybiBQVFJfRVJS
KGRwYXV4LT52ZGQpOworCQl9CiAJfQogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZHBh
dXgpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
