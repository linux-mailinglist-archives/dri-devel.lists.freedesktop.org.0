Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6775226936
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 19:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D2F89C6A;
	Wed, 22 May 2019 17:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D7C89C89
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 17:37:17 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z128so2016442qkb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gk8hCemPy32k7hUtY7KZ+8tj1MeHqRPPVcMcbE5vdqY=;
 b=s1SSyVOoXLdEvpSDwWJuqweqD5gTQFn2C5QSuCRIp9ZvwxrxqWAbLJiboCJ2J+oChR
 vE/dzJX+Qv8k+MbK9PI0L7jUL9qSHInhJ+6Km2kN97pAC2xgEnoy+4ygPVhiPwb0asFz
 jKLmhO/7o5oW8MLzgfm8Gc5G0iVHzx2Yhz34lwGt84CFfOoNNhowIzBMB5Fo1Q1SLmlz
 MUM8cE83pbdXx23y8ZLxG71SCjbC63Eb9b2ME26ZN5mxoSW1w2K33bytCpqEH3OKCbaW
 1ibZGfPiS150xrlwq1AAp4GFt/f/70HEcORzyCDDlHE3HC7m99UkP+qo9uj2lQ3hqknS
 GhfQ==
X-Gm-Message-State: APjAAAWwRGKnACtOcF/MkyArqTLONLaUMh/mUbn9x+gYUXfdMB/PFwZz
 LxWJJbb8EGJp5mNc2WIsnO4OIl4H1Aw=
X-Google-Smtp-Source: APXvYqyk3xYM0+FisGd+ENFvSX310SVFXTFYPEO8kL4f1+5+ec7XKzynwdsLr2Ork05bpL8KYQuAQw==
X-Received: by 2002:a05:620a:1479:: with SMTP id
 j25mr69337992qkl.218.1558546636332; 
 Wed, 22 May 2019 10:37:16 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 10:37:15 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/a6xx: Remove devm calls from gmu driver
Date: Wed, 22 May 2019 13:36:43 -0400
Message-Id: <20190522173656.162006-4-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gk8hCemPy32k7hUtY7KZ+8tj1MeHqRPPVcMcbE5vdqY=;
 b=PoikOXUPL4Vn/ay3Aqg4ARP3Khyv1uCrxHmKF3RRaGGj9yQ8/XxJJNGO0/B9E0ceSm
 20FqcBiRkDFxfeAYdLNX4ogwjQL7pzp6sP5yI7IQJms5faqfH3Y69MogbMEUheNciuYZ
 zbhsIM8oqLERNLol3ODglJ5p/jVydBOeMaKZOO2u5xgjIGe3xTr8jFiEhiJJk8KAo773
 TgRoYvRtNbRRO1fAh9mXoLbAMASd7sMS8e+5MgzVviEoMVpuVCifFUtf7Uf0eEfnHrk9
 weTXG1uVr+To8+xmm4Bd+YafzFKyMKolTWe/PnklRRQp1FKHtQQ7P1clfW7Mmo/Uk0qE
 Y1og==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGUgZ211IGRyaXZlciBp
cyBpbml0YWxpemVkIGFuZCBjbGVhbmVkIHVwIHdpdGggY2FsbHMgZnJvbSB0aGUgZ3B1IGRyaXZl
ci4gQXMKc3VjaCwgdGhlIHBsYXRmb3JtIGRldmljZSBzdGF5cyB2YWxpZCBhZnRlciBhNnh4X2dt
dV9yZW1vdmUgaXMgY2FsbGVkIGFuZCB0aGUKZGV2aWNlIG1hbmFnZWQgcmVzb3VyY2VzIGFyZSBu
b3QgZnJlZWQuIEluIHRoZSBjYXNlIG9mIGdwdSBwcm9iZSBmYWlsdXJlcyBvcgp1bmJpbmQsIHRo
ZXNlIHJlc291cmNlcyB3aWxsIHJlbWFpbiBtYW5hZ2VkLgoKSWYgdGhlIGdwdSBiaW5kIGlzIHJ1
biBhZ2FpbiAoZWc6IGlmIHRoZXJlJ3MgYSBwcm9iZSBkZWZlciBzb21ld2hlcmUgaW4gbXNtKSwK
dGhlc2UgcmVzb3VyY2VzIHdpbGwgYmUgaW5pdGlhbGl6ZWQgYWdhaW4gZm9yIHRoZSBzYW1lIGRl
dmljZSwgY3JlYXRpbmcgbXVsdGlwbGUKcmVmZXJlbmNlcy4gSW4gdGhlIGNhc2Ugb2YgaXJxcywg
dGhpcyBjYXVzZXMgZmFpbHVyZXMgc2luY2UgdGhlIGlycXMgYXJlCm5vdCBzaGFyZWQgKG5vciBz
aG91bGQgdGhleSBiZSkuCgpUaGlzIHBhdGNoIHJlbW92ZXMgYWxsIGRldm1fKiBjYWxscyBhbmQg
bWFudWFsbHkgY2xlYW5zIHRoaW5ncyB1cCBpbgpnbXVfcmVtb3ZlLgoKU2lnbmVkLW9mZi1ieTog
U2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9nbXUuYyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E2eHhfZ211LmMKaW5kZXggNzQ2NTQyM2U5YjcxLi43MDFiODEzZmEzOGEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwpAQCAtNTA1LDkgKzUwNSw5IEBAIHN0YXRpYyB2
b2lkIGE2eHhfZ211X3JwbWhfaW5pdChzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSkKIAogZXJyOgogCWlm
ICghSVNfRVJSX09SX05VTEwocGRjcHRyKSkKLQkJZGV2bV9pb3VubWFwKGdtdS0+ZGV2LCBwZGNw
dHIpOworCQlpb3VubWFwKHBkY3B0cik7CiAJaWYgKCFJU19FUlJfT1JfTlVMTChzZXFwdHIpKQot
CQlkZXZtX2lvdW5tYXAoZ211LT5kZXYsIHNlcXB0cik7CisJCWlvdW5tYXAoc2VxcHRyKTsKIH0K
IAogLyoKQEAgLTExOTcsNyArMTE5Nyw3IEBAIHN0YXRpYyB2b2lkIF9faW9tZW0gKmE2eHhfZ211
X2dldF9tbWlvKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCXJldHVybiBFUlJfUFRS
KC1FSU5WQUwpOwogCX0KIAotCXJldCA9IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCByZXMtPnN0
YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOworCXJldCA9IGlvcmVtYXAocmVzLT5zdGFydCwgcmVz
b3VyY2Vfc2l6ZShyZXMpKTsKIAlpZiAoIXJldCkgewogCQlEUk1fREVWX0VSUk9SKCZwZGV2LT5k
ZXYsICJVbmFibGUgdG8gbWFwIHRoZSAlcyByZWdpc3RlcnNcbiIsIG5hbWUpOwogCQlyZXR1cm4g
RVJSX1BUUigtRUlOVkFMKTsKQEAgLTEyMTMsMTAgKzEyMTMsMTAgQEAgc3RhdGljIGludCBhNnh4
X2dtdV9nZXRfaXJxKHN0cnVjdCBhNnh4X2dtdSAqZ211LCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2LAogCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgbmFtZSk7CiAK
LQlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycSwgaGFuZGxlciwgSVJRRl9U
UklHR0VSX0hJR0gsCi0JCW5hbWUsIGdtdSk7CisJcmV0ID0gcmVxdWVzdF9pcnEoaXJxLCBoYW5k
bGVyLCBJUlFGX1RSSUdHRVJfSElHSCwgbmFtZSwgZ211KTsKIAlpZiAocmV0KSB7Ci0JCURSTV9E
RVZfRVJST1IoJnBkZXYtPmRldiwgIlVuYWJsZSB0byBnZXQgaW50ZXJydXB0ICVzXG4iLCBuYW1l
KTsKKwkJRFJNX0RFVl9FUlJPUigmcGRldi0+ZGV2LCAiVW5hYmxlIHRvIGdldCBpbnRlcnJ1cHQg
JXMgJWRcbiIsCisJCQkgICAgICBuYW1lLCByZXQpOwogCQlyZXR1cm4gcmV0OwogCX0KIApAQCAt
MTI0MSwxMiArMTI0MSwxOCBAQCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1Y3QgYTZ4eF9ncHUg
KmE2eHhfZ3B1KQogCQlkZXZfcG1fZG9tYWluX2RldGFjaChnbXUtPmd4cGQsIGZhbHNlKTsKIAl9
CiAKKwlpb3VubWFwKGdtdS0+bW1pbyk7CisJZ211LT5tbWlvID0gTlVMTDsKKwogCWE2eHhfZ211
X21lbW9yeV9mcmVlKGdtdSwgZ211LT5oZmkpOwogCiAJaW9tbXVfZGV0YWNoX2RldmljZShnbXUt
PmRvbWFpbiwgZ211LT5kZXYpOwogCiAJaW9tbXVfZG9tYWluX2ZyZWUoZ211LT5kb21haW4pOwog
CisJZnJlZV9pcnEoZ211LT5nbXVfaXJxLCBnbXUpOworCWZyZWVfaXJxKGdtdS0+aGZpX2lycSwg
Z211KTsKKwogCWdtdS0+aW5pdGlhbGl6ZWQgPSBmYWxzZTsKIH0KIAotLSAKU2VhbiBQYXVsLCBT
b2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
