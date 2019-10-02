Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1BC49AD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 10:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29AB6E907;
	Wed,  2 Oct 2019 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A1E6E907;
 Wed,  2 Oct 2019 08:38:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n14so18568073wrw.9;
 Wed, 02 Oct 2019 01:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Y+TtEQ81ZRCVOBCucKvv8rl5Oh/macLuKVFgTAF4uUs=;
 b=sMCU+UdRMiR4mwoFHaw8novN6UFNULuoC6FGT4tlPtDeydVAUuwr7ai7GaS0jgZ4ON
 kAVBgOfPKO/L7JUWsAdAzRXURebtDhbW2GEHQZdvCcuK6qbxQrtxzpzMUp8TP/VUd0eB
 cnKpMPqf9BABLoTrF71rgMxbfTqUGyJwZA1h1uL3has7wnRvoiNFu4nvIh2uYAriazeK
 vKQmJ3NAjj74OZ6F0jlFb71WpSBvr3az49QYMVZ/vTiTfkwgZY/G6qBv1DTdI/hBvHTP
 TacXqbT68btIpvZGZYXwtisqLOPKzy2h16J/Cz+K+ak9WYyXIskUYGyJLpIQthcWc7/S
 v+EA==
X-Gm-Message-State: APjAAAVRHmKQEdd8WuER8Lb8h3COAqy45yhkGKQA6h2W9sznSgMzCtkg
 /MvenfPXOEWMW/v0UiaXtjUgsTgu
X-Google-Smtp-Source: APXvYqzcOXvJOXuv+pWsbku+4NEF8hmATU4zmhn8OKvOfr4yIAbR5ql4ImX0cbUNEWD+mOwC5lTAAA==
X-Received: by 2002:adf:db83:: with SMTP id u3mr1648496wri.36.1570005505854;
 Wed, 02 Oct 2019 01:38:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q3sm18553123wru.33.2019.10.02.01.38.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 01:38:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: also export ttm_bo_vm_fault
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20190927123425.17513-1-christian.koenig@amd.com>
Message-ID: <8758219e-884d-1205-f2e0-7e304049707a@gmail.com>
Date: Wed, 2 Oct 2019 10:38:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927123425.17513-1-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Y+TtEQ81ZRCVOBCucKvv8rl5Oh/macLuKVFgTAF4uUs=;
 b=QzXmJrQk9qsGYVOYTAtuR5qoPcygHHD/gcMEnFw2Mx+giX74d3svXGVJTEYmR5EsDx
 pMbcwvImOSrOb2Mbf8PSVBzud++oRpbm4aLewZ9ulIdC2EvQz3OSTN6Gl04DNpc1whYf
 3czPFg1u46E5kGswkGNjySIooklEMSEgUA8Ef5iEaCFGC4zfDWMHCF458GR7cZlCbXWB
 68gc5tWLb6xCaKRJsCExWsgnyzlQr8HalG/8VgmM1FlBSAdLcPAVm60Ojgh9pAUJJcvn
 g00slHCqz0AoNmIncMAVMcXyVViVOD1e1rresayIhxUSlmpgOVWjFnM4WRFIl/1vEOc+
 1F6A==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIGdlbnRsZSBwaW5nIG9uIHRoaXMuIEV2ZXJ5Ym9keSBvbiBYREMsIG9yIGNhbiB3ZSBn
ZXQgdGhpcyBjb21pdHRlZD8KCkFtIDI3LjA5LjE5IHVtIDE0OjM0IHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoKPiBUaGF0IGlzIG5lZWRlZCBieSBhdCBsZWFzdCBhIGNsZWFudXAgaW4gcmFkZW9u
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDMgKyst
Cj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgIHwgMiArKwo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdm0uYwo+IGluZGV4IGNiMzEyMGNkNWFhMS4uNTI1MDQ2YmJjYjZiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib192bS5jCj4gQEAgLTMxNiw3ICszMTYsNyBAQCB2bV9mYXVsdF90IHR0bV9ib192
bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgIH0KPiAgIEVYUE9SVF9T
WU1CT0wodHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKTsKPiAgIAo+IC1zdGF0aWMgdm1fZmF1bHRf
dCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4gK3ZtX2ZhdWx0X3QgdHRt
X2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICAgewo+ICAgCXN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4gICAJcGdwcm90X3QgcHJvdDsKPiBAQCAtMzM2
LDYgKzMzNiw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1f
ZmF1bHQgKnZtZikKPiAgIAo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gK0VYUE9SVF9TWU1CT0wo
dHRtX2JvX3ZtX2ZhdWx0KTsKPiAgIAo+ICAgdm9pZCB0dG1fYm9fdm1fb3BlbihzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSkKPiAgIHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBpbmRleCA4NTEyNjBj
YmJiMmYuLmRhZDQxY2Y1Y2Q2NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2FwaS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+IEBAIC03OTYsNiAr
Nzk2LDggQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2Zh
dWx0ICp2bWYsCj4gICAJCQkJICAgIHBncHJvdF90IHByb3QsCj4gICAJCQkJICAgIHBnb2ZmX3Qg
bnVtX3ByZWZhdWx0KTsKPiAgIAo+ICt2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZik7Cj4gKwo+ICAgdm9pZCB0dG1fYm9fdm1fb3BlbihzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSk7Cj4gICAKPiAgIHZvaWQgdHRtX2JvX3ZtX2Nsb3NlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
