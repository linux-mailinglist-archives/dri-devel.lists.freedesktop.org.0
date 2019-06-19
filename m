Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6934B63F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DD56E340;
	Wed, 19 Jun 2019 10:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BA56E340
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:34:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c6so1271716wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 03:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=urGhGMBj9Gj+93Uz4bCVBFsm8sW6q9N7nifD7I3Dmm0=;
 b=YakVLjDcd5egoSPNQwpDRlB0YqlAPkQiv/aOX0vgRE1Vj0vNhSsbekwa+VeqfK73Xe
 XAPcLLN/UrchH73Kujf8jpXtYw/D8vWO9Vi2SB9sUjuzwzSllwIwChI6HLuCzHhoZeu+
 slbHBkzvk90bb9Ku+H5rV8gdI50mm2VpysyBwnIFfptVK7GQG/UdBXBPndNumFSmHeRJ
 04h6XjZSaVaI8N9WPCn5bbM9pZiUmV2WIm6cWHOcovsczjLjhXG/cU12/kZ9DtO1L6og
 fZ+dq2QAEG0wVbsJKLCBrG1GcLW8CiRk6nOBr69pRYN4cKdW6j8L33uVhHuOxxweZMyO
 o+rA==
X-Gm-Message-State: APjAAAUju5RYvNhG2W//nmLgqjWmtrwGOrIlL7/QmByk6DUGjomGB8Fr
 brJxtwjwlNO5X8rFJOm5eBk=
X-Google-Smtp-Source: APXvYqxlJa5H3ubJWUsDp+ynl4+d24K8AumjDor4n6joXgVyOU36lrWHz8h2zbzlmxQFjprEYnnp3w==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr7944693wme.125.1560940457198; 
 Wed, 19 Jun 2019 03:34:17 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id w67sm1417860wma.24.2019.06.19.03.34.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:34:16 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:32:12 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 01/12] drm: add gem array helpers
Message-ID: <20190619103212.GA1896@arch-x1c3>
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-2-kraxel@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=urGhGMBj9Gj+93Uz4bCVBFsm8sW6q9N7nifD7I3Dmm0=;
 b=Me285EftGAvkCIm9KR5xzgD/NL8izuvygR9J344xkydeliRaRPW5ey628RjJ9Mou79
 LRJXCQjIuWJqhr/4KPcqV+ZZpgVZ0/ELnk0cchhFVf6V9uOdGdr16KW0EhYSuSLVZ3jL
 ZRPYdouYLdWf+/VQReZpSzJJ3dWE/W1hyzpsxY5j/M9i1NqzGEvDjICgsyhCkPul+QV3
 hM1Y7gnHrBQV7S3v5ibr7kqQm8YsXvPnOwodmB0P7yUzHmOkHBnQOsst4iWGPu1/H2J7
 deHamS/6KyEiSgtA+ZaorzjLg+TeKkoJ3v9NZHOZ8szBo6X1aZyMt7+xBk55Oufo7lI3
 Hkiw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwKCk9uIDIwMTkvMDYvMTksIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cgo+ICsvKioKPiAr
ICogZHJtX2dlbV9hcnJheV9mcm9tX2hhbmRsZXMgLS0gbG9va3VwIGFuIGFycmF5IG9mIGdlbSBo
YW5kbGVzLgo+ICsgKgo+ICsgKiBAZHJtX2ZpbGU6IGRybSBmaWxlLXByaXZhdGUgc3RydWN0dXJl
IHRvIHVzZSBmb3IgdGhlIGhhbmRsZSBsb29rIHVwCj4gKyAqIEBoYW5kbGVzOiB0aGUgYXJyYXkg
b2YgaGFuZGxlcyB0byBsb29rdXAuCj4gKyAqIEBuZW50czogdGhlIG51bWVyIG9mIGhhbmRsZXMu
Cj4gKyAqCj4gKyAqIFJldHVybnM6IEFuIGFycmF5IG9mIGdlbSBvYmplY3RzIG9uIHN1Y2Nlc3Ms
IE5VTEwgb24gZmFpbHVyZS4KPiArICovCj4gK3N0cnVjdCBkcm1fZ2VtX29iamVjdF9hcnJheSoK
PiArZHJtX2dlbV9hcnJheV9mcm9tX2hhbmRsZXMoc3RydWN0IGRybV9maWxlICpkcm1fZmlsZSwg
dTMyICpoYW5kbGVzLCB1MzIgbmVudHMpCj4gK3sKPiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdF9h
cnJheSAqb2JqczsKPiArCXUzMiBpOwo+ICsKPiArCW9ianMgPSBkcm1fZ2VtX2FycmF5X2FsbG9j
KG5lbnRzKTsKPiArCWlmICghb2JqcykKPiArCQlyZXR1cm4gTlVMTDsKPiArCj4gKwlmb3IgKGkg
PSAwOyBpIDwgbmVudHM7IGkrKykgewo+ICsJCW9ianMtPm9ianNbaV0gPSBkcm1fZ2VtX29iamVj
dF9sb29rdXAoZHJtX2ZpbGUsIGhhbmRsZXNbaV0pOwo+ICsJCWlmICghb2Jqcy0+b2Jqc1tpXSkg
ewpNaXNzaW5nIG9iamVjdCBwdXQgZm9yIHRoZSAwLi5pLTEgaGFuZGxlcy4gUGVyc29uYWxseSBJ
IHdvdWxkOgogICAgb2Jqcy0+bmVudHMgPSBpOwogICAgZHJtX2dlbV9hcnJheV9wdXRfZnJlZShv
YmpzKTsKICAgIHJldHVybiBOVUxMOwoKPiArCQkJZHJtX2dlbV9hcnJheV9wdXRfZnJlZShvYmpz
KTsKPiArCQkJcmV0dXJuIE5VTEw7Cj4gKwkJfQo+ICsJfQo+ICsJcmV0dXJuIG9ianM7Cj4gK30K
TWlzc2luZyBFWFBPUlRfU1lNQk9MPwoKPiArCj4gKy8qKgo+ICsgKiBkcm1fZ2VtX2FycmF5X3B1
dF9mcmVlIC0tIHB1dCBnZW0gb2JqZWN0cyBhbmQgZnJlZSBhcnJheS4KPiArICoKPiArICogQG9i
anM6IHRoZSBnZW0gb2JqZWN0IGFycmF5Lgo+ICsgKi8KPiArdm9pZCBkcm1fZ2VtX2FycmF5X3B1
dF9mcmVlKHN0cnVjdCBkcm1fZ2VtX29iamVjdF9hcnJheSAqb2JqcykKPiArewo+ICsJdTMyIGk7
Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG9ianMtPm5lbnRzOyBpKyspIHsKPiArCQlpZiAoIW9i
anMtPm9ianNbaV0pCj4gKwkJCWNvbnRpbnVlOwo+ICsJCWRybV9nZW1fb2JqZWN0X3B1dF91bmxv
Y2tlZChvYmpzLT5vYmpzW2ldKTsKPiArCX0KPiArCWRybV9nZW1fYXJyYXlfZnJlZShvYmpzKTsK
PiArfQpEaXR0bz8KCkhUSApFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
