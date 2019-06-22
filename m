Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F14F592
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 13:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9F6E96E;
	Sat, 22 Jun 2019 11:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F856E96E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 11:56:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id p24so6856531lfo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 04:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8wtMFK10IkHXvsvWvmodcYAoVZ3xXTUeCoQiHsiFLOc=;
 b=IjqnLbcgLF/IY4L9+h7TtXj3SRIttZBNJgSMNK+PaaZ1iZYG9cK6prJWwwSYnA6nw/
 lLiXLB2QmAsWJU6P8v1+P4yiBmT9ZaS5xhFTH9ehPv0saoj1RNU9hxpuIb6CdOpyB0fe
 O27q4YCGwkQx9MOKe0Z6HBJ2+b0S3WT+rBSHYPtAkKhYZnr2nHiSXKd4gCYlTzITntzw
 eKzK4C7/kYsoK556JlakaWFDMQBmv3+eG+8QDxsqPusafYqcVvlo8Jf6hYcK2hiVNiYW
 aQWPjxoK2WpNWtQjo5XoMGZzGSvdUTHYhK8ExgkcsR2pVo1GTVM7WsTMYPgNxXdWUnLr
 jaAw==
X-Gm-Message-State: APjAAAXiACfSemjcjUE4rWD9O36rnAxdH/rx0i4ylxzAeSjMpbLt/mzF
 1/DvJ/UXGhY8CAWJk1Aq3ENHtUfBlkqGHA==
X-Google-Smtp-Source: APXvYqxubGdSehuqlKWaOJK3MNKnVsioBprWZV3CZb86ugdJXbATOrXpNmKDo/wAzZFLmLWl8mk93g==
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr13527069lfp.59.1561204600455; 
 Sat, 22 Jun 2019 04:56:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d10sm810759ljc.15.2019.06.22.04.56.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 04:56:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 2/2] drm/exynos: trigger build of all modules
Date: Sat, 22 Jun 2019 13:56:23 +0200
Message-Id: <20190622115623.16314-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622115623.16314-1-sam@ravnborg.org>
References: <20190622115623.16314-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wtMFK10IkHXvsvWvmodcYAoVZ3xXTUeCoQiHsiFLOc=;
 b=XfNna+mGr5zstx/mh8MvfRoXAZKahP1usIlzDmthPc3kWglPm0UKP/iFKyMUEhMZLR
 vODTignP/b1pOn/paWpOWpta8OdQWMWfF/yPgIArqmqxOoUdVY6Nsj5b3/xEgQs7ZpHG
 n2jLAwSGmqA45bgUkqN7ttFuuaxWgDC5itDXLb2yRvfx5jkWBPo36EIKKHOfidJb+iKw
 HvO31vik5h9aBNDQJDAfc8Tn3QbSh1kRlJbU6ke0o4J7iwmv8eMdjDblZEUz14/RQ30N
 Q9EF0TMr5WlzJWQxfckYa5LjS62Vq6+DF8ognert3WhtNIoxdgZmFWLHFgmURrWGzA9/
 Gicg==
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBkZXBlbmRlbmN5IHRvIGZvcmNlIGV4eW5vcyBkcml2ZXIgdG8KYnVp
bHQgZm9yIG1vcmUgdGhhbiBhcm0gYW5kIHRvIGJ1aWx0IG1vZHVsZXMKdGhhdCBvdGhlcndpc2Ug
cmVxdWlyZWQgb3RoZXIgc3ltYm9scyB0byBiZSBkZS1zZWxlY3RlZC4KClRoaXMgd2lsbCBpbmNy
ZWFzZSBidWlsZCBjb3ZlcmFnZSBvZiB0aGUgZXh5bm9zIGRyaXZlcgp0aHVzIGFsbG93aW5nIG1v
c3QgdHJpdmlhbCBidWlsZCBlcnJvcnMgdG8gYmUgZGV0ZWN0ZWQvZml4ZWQgZWFybHkuCgpUaGlz
IGludHJvZHVjZXMgb25lIHdhcm5pbmcgd2hlbiBidWlsdCB1c2luZyBzaDoKZXh5bm9zN19kcm1f
ZGVjb24uYzogSW4gZnVuY3Rpb24g4oCYZGVjb25fcmVtb3Zl4oCZOgpleHlub3M3X2RybV9kZWNv
bi5jOjc2OToyNDogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGN0eOKAmQogIHN0cnVjdCBk
ZWNvbl9jb250ZXh0ICpjdHggPSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRldik7CgpUaGlzIGlz
IGR1ZSB0byB0aGUgZGVmaW5pdGlvbiBvZiBpb3VubWFwKCkgaW4gc2gsCmFuZCBub3RoaW5nIHRo
YXQgZXh5bm9zIGRyaXZlciBjYW4gZml4LgoKSW5jbHVkZSBmaXggb2YgZXh5bm9zIGJ1aWxkIGZv
ciBhbHBoYS4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
Q2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KQ2M6IEpvb255b3VuZyBTaGltIDxq
eTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ft
c3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4KQ2M6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hh
bjFAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZyAgICAgICAg
ICAgIHwgNiArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5j
IHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL0tjb25maWcKaW5kZXggY2JlNThkMzA3ZDFjLi42MGNlNGE4YWQ5ZTEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL0tjb25maWcKQEAgLTEsNyArMSw3IEBACiAjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKIGNvbmZpZyBEUk1fRVhZTk9TCiAJdHJpc3RhdGUgIkRSTSBT
dXBwb3J0IGZvciBTYW1zdW5nIFNvQyBFWFlOT1MgU2VyaWVzIgotCWRlcGVuZHMgb24gT0YgJiYg
RFJNICYmIChBUkNIX1MzQzY0WFggfHwgQVJDSF9TNVBWMjEwIHx8IEFSQ0hfRVhZTk9TIHx8IEFS
Q0hfTVVMVElQTEFURk9STSkKKwlkZXBlbmRzIG9uIE9GICYmIERSTSAmJiAoQVJDSF9TM0M2NFhY
IHx8IEFSQ0hfUzVQVjIxMCB8fCBBUkNIX0VYWU5PUyB8fCBBUkNIX01VTFRJUExBVEZPUk0gfHwg
Q09NUElMRV9URVNUKQogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBWSURFT01PREVf
SEVMUEVSUwogCXNlbGVjdCBTTkRfU09DX0hETUlfQ09ERUMgaWYgU05EX1NPQwpAQCAtODYsNyAr
ODYsNyBAQCBjb21tZW50ICJTdWItZHJpdmVycyIKIAogY29uZmlnIERSTV9FWFlOT1NfRzJECiAJ
Ym9vbCAiRzJEIgotCWRlcGVuZHMgb24gVklERU9fU0FNU1VOR19TNVBfRzJEPW4KKwlkZXBlbmRz
IG9uIFZJREVPX1NBTVNVTkdfUzVQX0cyRD1uIHx8IENPTVBJTEVfVEVTVAogCXNlbGVjdCBGUkFN
RV9WRUNUT1IKIAloZWxwCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IHdhbnQgdG8gdXNl
IEV4eW5vcyBHMkQgZm9yIERSTS4KQEAgLTExNCw3ICsxMTQsNyBAQCBjb25maWcgRFJNX0VYWU5P
U19TQ0FMRVIKIAogY29uZmlnIERSTV9FWFlOT1NfR1NDCiAJYm9vbCAiR1NjYWxlciIKLQlkZXBl
bmRzIG9uIFZJREVPX1NBTVNVTkdfRVhZTk9TX0dTQz1uCisJZGVwZW5kcyBvbiBWSURFT19TQU1T
VU5HX0VYWU5PU19HU0M9biB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgRFJNX0VYWU5PU19JUFAK
IAloZWxwCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IHdhbnQgdG8gdXNlIEV4eW5vcyBH
U0MgZm9yIERSTS4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMKaW5k
ZXggYWVmY2Q2MjRmZTMyLi5iMDg3N2I5NzI5MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9mYmRldi5jCkBAIC0xMCw2ICsxMCw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9j
b25zb2xlLmg+CiAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KKyNpbmNsdWRlIDxsaW51
eC92bWFsbG9jLmg+CiAKICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX2ZiX2hlbHBlci5oPgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
