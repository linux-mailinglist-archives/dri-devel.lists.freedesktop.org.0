Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E682B198F05
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9746E0D7;
	Tue, 31 Mar 2020 08:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F486E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:59:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r16so1556300wmg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/sNnpztKmpFB+H2wTpWQnYNlOagVVdzFiwaaMgtHM1E=;
 b=A/O3kjhJwCmdkJgv3zUg2gQNLs84UflpfHpbh/ZtRSWqYyd7lKcXmVk5KgeL+gvM2P
 uKmPA/GQKQSbJBYaVZGrEE2Q+B35DfaLq76ICFLHmUJoUXL8K7upNjRDO7hQNUAdUe68
 7YBCGBWEZz8SKYkY/9s68dntSlC1IxythRWWxBf3V2YkhvIpdPtTAE1a8/A7aNdRueN0
 frrqB+8BV7E4zkMIkbIqGRCGBCUki883ekhA7KbH0kxmacifb3qzZ5NijKe+g/D3VAPq
 HQIxVODxQhFRr7aqzE0NrHpmJ4BqFrJ7H2qSn/QSS3Av0Q56IR4AD3cbVJVeKzGt6Zhw
 4cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/sNnpztKmpFB+H2wTpWQnYNlOagVVdzFiwaaMgtHM1E=;
 b=JT56/Umxb0KyBUU15O5GwgEhGHkyoge82z6YWX1k0CHXnNPz0ZcVpDYDS388njVqQ2
 pLIoysDV182+hf8fBak2gTXST7w1P4qexWz4Z29cZg8c5HSjFzgRavjPOV92yuZvbNSu
 R9Fh+CKlI5rkFSs2NWGOQHencyi+vtYFM8qtRGRMUncG5Iw4YVitxk0COCg2a5gIdBH3
 VIPd6VmJA9CvQAcgJCts+3QBD9hqXcspTLvMOigHmoPoOhpzeQYOqha3VnobZVzEpkrS
 YpMWQKUhNZByYIkgq26kYhji0h20fd2aaT0YgNDAvwJo9Qa7ICnJ/aGWZN2cA1k0Q0GC
 b/Rg==
X-Gm-Message-State: ANhLgQ0qGdlYQ3JjBuaqAxlwlsoc3ZVwCmepym6qG01C0yeihWTIR1ew
 WMajxII36JXYOnleNU9RGo4=
X-Google-Smtp-Source: ADFU+vtDpeCFL79tvGCOnwtP2YuNeHNmzZveBmUiigAEHqWrOu6yRZQf0EsqTzj5/VD1KNurqeqEOA==
X-Received: by 2002:a1c:3d83:: with SMTP id k125mr2486470wma.177.1585645186794; 
 Tue, 31 Mar 2020 01:59:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x206sm3004892wmg.17.2020.03.31.01.59.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 01:59:46 -0700 (PDT)
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: chris@chris-wilson.co.uk, zbigniew.kempczynski@intel.com,
 andi.shyti@intel.com, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org
References: <20200330123425.3944-1-christian.koenig@amd.com>
Message-ID: <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
Date: Tue, 31 Mar 2020 10:59:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200330123425.3944-1-christian.koenig@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBub3Qgc28gZ2VudGxlIHBpbmcsIHNpbmNlIHRoaXMgcHJldHR5IG11Y2ggYnJva2UgYWxsIFRU
TSBiYXNlZCBkcml2ZXJzLgoKQ291bGQgd2UgcmV2ZXJ0IHRoaXMgZm9yIG5vdz8KClRoYW5rcywK
Q2hyaXN0aWFuLgoKQW0gMzAuMDMuMjAgdW0gMTQ6MzQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmln
Ogo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgN2JlMWI5YjhlOWQxZTllZjAzNDJkMmUwMDFmNDRlZWM0
MDMwYWE0ZC4KPgo+IFRoZSBkcm1fbW0gaXMgc3VwcG9zZWQgdG8gd29yayBpbiBhdG9taWMgY29u
dGV4dCwgc28gY2FsbGluZyBzY2hlZHVsZSgpCj4gb3IgaW4gdGhpcyBjYXNlIGNvbmRfcmVzY2hl
ZCgpIGlzIGlsbGVnYWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMg
fCA4ICstLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tbS5jCj4gaW5kZXggYmM2ZTIwODk0OWU4Li44OTgxYWJlOGI3YzkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tbS5jCj4gQEAgLTQ1LDcgKzQ1LDYgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9leHBv
cnQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9pbnRlcnZhbF90cmVlX2dlbmVyaWMuaD4KPiAgICNp
bmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvc2NoZWQvc2lnbmFs
Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3N0YWNr
dHJhY2UuaD4KPiAgIAo+IEBAIC0zNjcsMTEgKzM2Niw2IEBAIG5leHRfaG9sZShzdHJ1Y3QgZHJt
X21tICptbSwKPiAgIAkgIHN0cnVjdCBkcm1fbW1fbm9kZSAqbm9kZSwKPiAgIAkgIGVudW0gZHJt
X21tX2luc2VydF9tb2RlIG1vZGUpCj4gICB7Cj4gLQkvKiBTZWFyY2hpbmcgaXMgc2xvdzsgY2hl
Y2sgaWYgd2UgcmFuIG91dCBvZiB0aW1lL3BhdGllbmNlICovCj4gLQljb25kX3Jlc2NoZWQoKTsK
PiAtCWlmIChmYXRhbF9zaWduYWxfcGVuZGluZyhjdXJyZW50KSkKPiAtCQlyZXR1cm4gTlVMTDsK
PiAtCj4gICAJc3dpdGNoIChtb2RlKSB7Cj4gICAJZGVmYXVsdDoKPiAgIAljYXNlIERSTV9NTV9J
TlNFUlRfQkVTVDoKPiBAQCAtNTYzLDcgKzU1Nyw3IEBAIGludCBkcm1fbW1faW5zZXJ0X25vZGVf
aW5fcmFuZ2Uoc3RydWN0IGRybV9tbSAqIGNvbnN0IG1tLAo+ICAgCQlyZXR1cm4gMDsKPiAgIAl9
Cj4gICAKPiAtCXJldHVybiBzaWduYWxfcGVuZGluZyhjdXJyZW50KSA/IC1FUkVTVEFSVFNZUyA6
IC1FTk9TUEM7Cj4gKwlyZXR1cm4gLUVOT1NQQzsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0woZHJt
X21tX2luc2VydF9ub2RlX2luX3JhbmdlKTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
