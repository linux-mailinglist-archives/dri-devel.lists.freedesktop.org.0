Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6DA7C6C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFF88920F;
	Wed,  4 Sep 2019 07:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41004899E6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 04:13:50 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y22so6730713pfr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 21:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TKDcz9GEkq0+jTlX4XnG4MmP4DXsoB8ism0APIW6WXQ=;
 b=SgYPRtISt9cd5cb46AET0Alwith0tM9Elzl4Ad26IFnnqneMXF9Okoiz17cxgSdcel
 8gp3fc7Uu1Z4PWY64rsYWImOIe2NmWTGkhoeIGMFGSJCCyKQuMAUECjp52VXCQzeE4Kk
 qzLbHz8ZqhKfgKJOSx04Kf1853FQpd2S6WC6QLizv3heOYn9CBDjpgZpoA4qIX5eDIKZ
 z+u6zo02oModRh2hXIEoYZuXp17uEHLp27oignszsiMy4i1UWQJQob+ddqGWG4XN35V5
 5v8isdWl+gV1FZBmvSXCoTCJ3Xx+PSSrbn1ieexxdweeLRDe3Tga/KPN36JIMCa2mkoH
 tZ2w==
X-Gm-Message-State: APjAAAV1L8bS+rUKJvh1UCNKEaUcJypOuguqNawg9SFE4rCf2NhvFnTJ
 ExB+fOKo+XoY9Czj+8CvTp82sg==
X-Google-Smtp-Source: APXvYqxsqJ3hNQRFq3ixeUtG46LHLPaeaxAQsBMx89pzwZF3ApMq4oZQvbEinaPSdK7PfwqTN14bVQ==
X-Received: by 2002:a63:550e:: with SMTP id j14mr29867505pgb.302.1567570429722; 
 Tue, 03 Sep 2019 21:13:49 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id b126sm21458534pfb.110.2019.09.03.21.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 21:13:49 -0700 (PDT)
Date: Tue, 3 Sep 2019 21:13:46 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH v3 02/11] drm/msm: remove unlikely() from WARN_ON()
 conditions
Message-ID: <20190904041346.GB3081@tuxbook-pro>
References: <20190829165025.15750-1-efremov@linux.com>
 <20190829165025.15750-2-efremov@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829165025.15750-2-efremov@linux.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TKDcz9GEkq0+jTlX4XnG4MmP4DXsoB8ism0APIW6WXQ=;
 b=yWOqH74lTdL0xzn4KduFkFnfeuA6TxebZ/0lcsCSU6TfvfB33BHb5+UZKjrmx2xZfV
 z0mXE7FbdS+QTb/+X7UZTIi+dJTTpvNrStE+qGpoEIEUf/dEB3ISiDvaUraBduJnXLyN
 b09D5OMsvfI/eJIeAJE+aKgcVJnQMRsHiwQglRNZBi28wdsnRUzCmNPN7QaKe9KLl5cI
 fUTHUJIi9n/VgDgtEEk5ESV1R0hBDldBsD0vrE+C+7o5ET0/PLDGcVMfVC1qTcMtQE/+
 efYWZIJUuS+hD9bIcAdP1/FiLg0O635PzhAKlf8wDH/sgN7065DKKRjDMr1+1WBdv7XZ
 ORvw==
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDI5IEF1ZyAwOTo1MCBQRFQgMjAxOSwgRGVuaXMgRWZyZW1vdiB3cm90ZToKCj4gInVu
bGlrZWx5KFdBUk5fT04oeCkpIiBpcyBleGNlc3NpdmUuIFdBUk5fT04oKSBhbHJlYWR5IHVzZXMg
dW5saWtlbHkoKQo+IGludGVybmFsbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGVuaXMgRWZyZW1v
diA8ZWZyZW1vdkBsaW51eC5jb20+Cj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNv
bT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IEpvZSBQZXJjaGVzIDxq
b2VAcGVyY2hlcy5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKClJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJq
b3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9jdGwuYyB8IDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
bWRwX2Zvcm1hdC5jICAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
Y3RsLmMKPiBpbmRleCA0ODA0Y2Y0MGRlMTQuLjAzMDI3OWQ3YjY0YiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2N0bC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jdGwuYwo+IEBAIC0yNTMsNyArMjUzLDcgQEAgaW50
IG1kcDVfY3RsX3NldF9jdXJzb3Ioc3RydWN0IG1kcDVfY3RsICpjdGwsIHN0cnVjdCBtZHA1X3Bp
cGVsaW5lICpwaXBlbGluZSwKPiAgCXUzMiBibGVuZF9jZmc7Cj4gIAlzdHJ1Y3QgbWRwNV9od19t
aXhlciAqbWl4ZXIgPSBwaXBlbGluZS0+bWl4ZXI7Cj4gIAo+IC0JaWYgKHVubGlrZWx5KFdBUk5f
T04oIW1peGVyKSkpIHsKPiArCWlmIChXQVJOX09OKCFtaXhlcikpIHsKPiAgCQlEUk1fREVWX0VS
Uk9SKGN0bF9tZ3ItPmRldi0+ZGV2LCAiQ1RMICVkIGNhbm5vdCBmaW5kIExNIiwKPiAgCQkJY3Rs
LT5pZCk7Cj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTY5NSw3ICs2OTUsNyBAQCBzdHJ1Y3Qg
bWRwNV9jdGxfbWFuYWdlciAqbWRwNV9jdGxtX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiAgCQlnb3RvIGZhaWw7Cj4gIAl9Cj4gIAo+IC0JaWYgKHVubGlrZWx5KFdBUk5fT04oY3RsX2Nm
Zy0+Y291bnQgPiBNQVhfQ1RMKSkpIHsKPiArCWlmIChXQVJOX09OKGN0bF9jZmctPmNvdW50ID4g
TUFYX0NUTCkpIHsKPiAgCQlEUk1fREVWX0VSUk9SKGRldi0+ZGV2LCAiSW5jcmVhc2Ugc3RhdGlj
IHBvb2wgc2l6ZSB0byBhdCBsZWFzdCAlZFxuIiwKPiAgCQkJCWN0bF9jZmctPmNvdW50KTsKPiAg
CQlyZXQgPSAtRU5PU1BDOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
bWRwX2Zvcm1hdC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcF9mb3JtYXQuYwo+IGlu
ZGV4IDhhZmIwZjljMDRiYi4uNTQ5NWQ4YjNmNWI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHBfZm9ybWF0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwX2Zvcm1hdC5jCj4gQEAgLTE3NCw3ICsxNzQsNyBAQCBjb25zdCBzdHJ1Y3QgbXNtX2Zv
cm1hdCAqbWRwX2dldF9mb3JtYXQoc3RydWN0IG1zbV9rbXMgKmttcywgdWludDMyX3QgZm9ybWF0
LAo+ICAKPiAgc3RydWN0IGNzY19jZmcgKm1kcF9nZXRfZGVmYXVsdF9jc2NfY2ZnKGVudW0gY3Nj
X3R5cGUgdHlwZSkKPiAgewo+IC0JaWYgKHVubGlrZWx5KFdBUk5fT04odHlwZSA+PSBDU0NfTUFY
KSkpCj4gKwlpZiAoV0FSTl9PTih0eXBlID49IENTQ19NQVgpKQo+ICAJCXJldHVybiBOVUxMOwo+
ICAKPiAgCXJldHVybiAmY3NjX2NvbnZlcnRbdHlwZV07Cj4gLS0gCj4gMi4yMS4wCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
