Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 011EC2AF820
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5336A6E0BC;
	Wed, 11 Nov 2020 18:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624326E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a3so3235256wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXZJEO8V1+GfDNFYh0xMC5OCmgkAkp7ogIzPc700bj4=;
 b=P1O53+g6xCjn0HVbg+2LcTzi/TxNj9Kba5GMdJ54vcSns9ORtCgzS6wEcq8rV+SHzZ
 OQ1b7VoYUb67TSeIhw45K8NzFZYOxVXUj/3/XAwpmpXZzZgun6sh53tHnV0m3MwhEVi7
 a8XsVZN+PctNbvLAE3nukCVgBfi8sC7HP+uDeqJM7QJ3DRUQjaLK1IZ3wj+wtoOryBfm
 zscGpu1poXcuw9zuyJATHdJTAr6LIveeSn7QUjgghiHeKeHImZqEkMvSpim4SIsglgT1
 IY1JEaNFiwaMbrDH/ed1/K+ood3SkdVDbDrUnDY//QjQCZfqIshJSbIBdDUxXdDV8xCu
 zr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXZJEO8V1+GfDNFYh0xMC5OCmgkAkp7ogIzPc700bj4=;
 b=lMnHnMNkiOcws9xOw3xFRNVBbwJYqFILyY5/1aBloj5qKGhIum1bTazOtP6NKQHqZ4
 4Up/whqCKQh56OugNCaiGblSvmd0iThUUIaGwlutikQorqYPTkcwbecniSt+O3OMvqCx
 UbwUcWYkPnZaYAktZz3qPiVMiWGILlMarYjHP454xSKKx+2S++/b58Sy2AWny9j0uoaO
 D+JnkDtay7KVmV6ydlr5LmY5rwRpjIFuUyNKgE3HcTcFnPy+/EWdm+eJISDlqHOFKlht
 boXUYjEeID63tIzzuxbhZP5SeqK++iK0iVmcDWCMdpaxHZbqKuxAuvTUUvwH3uyXVuXq
 vwTQ==
X-Gm-Message-State: AOAM532tEEeOC469Cpk1qHi5/pY9sIkyRhXoTWB6jR/nlv/SELrARPp/
 BH2vQz2gPoi0tuvdfJYKhPzjGw==
X-Google-Smtp-Source: ABdhPJzfsayKXlu3vNEjxdNAa52H0jflpazf6xD3rLA1ezErQxUB0fVmYwEirbaixq6+caFEAJ67Xw==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr4489776wme.9.1605119768967;
 Wed, 11 Nov 2020 10:36:08 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/19] drm/radeon/evergreen: Move 'cik_*()'s prototypes to
 shared header
Date: Wed, 11 Nov 2020 18:35:40 +0000
Message-Id: <20201111183545.1756994-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo2NDEzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYY2lrX2luaXRfY3BfcGdfdGFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQogNjQxMyB8IHZvaWQgY2lrX2luaXRfY3BfcGdfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
ay5jOjY2NzA6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtfZ2V0
X2NzYl9zaXpl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDY2NzAgfCB1MzIgY2lrX2dldF9j
c2Jfc2l6ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIHwgXn5+fn5+fn5+fn5+fn5+fgog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo2NzAyOjY6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYY2lrX2dldF9jc2JfYnVmZmVy4oCZIFstV21pc3NpbmctcHJvdG90
eXBlc10KIDY3MDIgfCB2b2lkIGNpa19nZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldiwgdm9sYXRpbGUgdTMyICpidWZmZXIpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oICAgICAgIHwgMyArKysKIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vZXZlcmdyZWVuLmMgfCA1ICstLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2Npay5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaAppbmRleCA2NjMwYjlk
YTllN2FhLi40MjAyMDdkMTlkZTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmgKQEAgLTMwLDUgKzMwLDgg
QEAgdm9pZCBjaWtfZXhpdF9ybGNfc2FmZV9tb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KTsKIGludCBjaV9tY19sb2FkX21pY3JvY29kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiB2b2lkIGNpa191cGRhdGVfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBibG9j
aywgYm9vbCBlbmFibGUpOwogdTMyIGNpa19ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7Cit2b2lkIGNpa19pbml0X2NwX3BnX3RhYmxlKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2KTsKK3UzMiBjaWtfZ2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKK3ZvaWQgY2lrX2dldF9jc2JfYnVmZmVyKHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2LCB2b2xhdGlsZSB1MzIgKmJ1ZmZlcik7CiAKICNlbmRpZiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBfX0NJS19IX18gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vZXZlcmdyZWVuLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCmluZGV4
IGQ4ZWU4MGFkNGVhNDQuLmY5NWI1ODgzNTQyNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vZXZlcmdyZWVuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3Jl
ZW4uYwpAQCAtMzEsNiArMzEsNyBAQAogCiAjaW5jbHVkZSAiYXRvbS5oIgogI2luY2x1ZGUgImF2
aXZvZC5oIgorI2luY2x1ZGUgImNpay5oIgogI2luY2x1ZGUgIm5pLmgiCiAjaW5jbHVkZSAicnY3
NzAuaCIKICNpbmNsdWRlICJldmVyZ3JlZW4uaCIKQEAgLTIxNywxMCArMjE4LDYgQEAgc3RhdGlj
IHZvaWQgZXZlcmdyZWVuX2dwdV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZv
aWQgZXZlcmdyZWVuX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogdm9pZCBldmVy
Z3JlZW5fcGNpZV9nZW4yX2VuYWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2b2lk
IGV2ZXJncmVlbl9wcm9ncmFtX2FzcG0oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotdm9p
ZCBjaWtfaW5pdF9jcF9wZ190YWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Ci0KLWV4
dGVybiB1MzIgY2lrX2dldF9jc2Jfc2l6ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Ci1l
eHRlcm4gdm9pZCBjaWtfZ2V0X2NzYl9idWZmZXIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYs
IHZvbGF0aWxlIHUzMiAqYnVmZmVyKTsKIAogc3RhdGljIGNvbnN0IHUzMiBldmVyZ3JlZW5fZ29s
ZGVuX3JlZ2lzdGVyc1tdID0KIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
