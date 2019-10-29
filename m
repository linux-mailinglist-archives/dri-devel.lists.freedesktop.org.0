Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0FE8DEB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 18:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEA06EC51;
	Tue, 29 Oct 2019 17:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B8F6E525;
 Tue, 29 Oct 2019 17:18:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o28so14539728wro.7;
 Tue, 29 Oct 2019 10:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MJL2/Tu7KSnYvbQrSErEfInHYxFM7K1JmrbA3OsEbkU=;
 b=ZYKKYCDOhHFYjnjhrm5LiNeX3kCkA7Jc/OL8dU7pSj8/pLBCqN3nYte1WTJMYMGIBj
 vShe0TcGgmOjW89JuLnBk7hwfDiauzlsg6Zdv7/SPqhHnUXd956v/w1IQyjonj26Kz+j
 hP/1FUDyP+TQJ/AFi6l6LHdG9oibYzgCEt+xIwoNw2On1n6f4SKXt2lkrQ0EADsirINf
 WQ4go3qpJrtqYPd7kjzR/xD6FvKn48A5Kw04UpCzXoJZ59aa0PXh7GwSCggYl2PYw0wk
 OhF2dZpZ0R+8kOjIcicrU7/Rgd4RkAR+UoYzwEAzqdAf4LBkaNW7yR7yCrBN9YYhg8Lm
 01ug==
X-Gm-Message-State: APjAAAXDeVrEuR04GNCO5CkfSHgmhCrxOBLzlkEPH3G9gRuel2Lk8zd1
 8+HukmcrerK+5l5QzzJ0aQoO4zc4
X-Google-Smtp-Source: APXvYqzHlrmv2Vrs9vrgyZBRkH0zZjWt0qJSSzbYk7iNmm2/ODuYdcSQEFwJ06YRCD6G+sMOhXQa8w==
X-Received: by 2002:a05:6000:11d2:: with SMTP id
 i18mr21900229wrx.109.1572369506449; 
 Tue, 29 Oct 2019 10:18:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b1sm15657675wru.83.2019.10.29.10.18.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 10:18:25 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: Fix passing zero to 'PTR_ERR' warning
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, dan.carpenter@oracle.com
References: <1572361484-9828-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a1623c63-5bf9-6f2d-f6d3-bce4ae0a7c6f@gmail.com>
Date: Tue, 29 Oct 2019 14:06:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572361484-9828-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MJL2/Tu7KSnYvbQrSErEfInHYxFM7K1JmrbA3OsEbkU=;
 b=o/5VPdC38i++lVg+AcoK8iqFj3FTsY1M9DpbWeycAGyNLOF4TEDqgya4riyKq8zs/o
 LxQC1biV2BEKOdeGByg/3B/Sn2+LYjPauZTZzZ9nJ2bZamTAE2VWproEa+X5Pk+tQz1k
 Tla32sCZi9AlkyooWSfF9v8hyN0JO5P43yQ6w+b1Dm3MJd2DMBfGy4iMhRcjJozzFDsI
 IqDzMog3L22oYy0alLRTfRNdMmwX6K0XF+8cuauf7iW8grxDtgfbgE2nxHlsYL7SrDjG
 mfw+7UXohgnj/SRj8+isN2Ofmy1YSaaRkBIYNx3ATbfExFvyMCpPnyf2SMj9fVgamQXm
 Qceg==
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMTAuMTkgdW0gMTY6MDQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBGaXggYSBz
dGF0aWMgY29kZSBjaGVja2VyIHdhcm5pbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KCldlbGwgdGhhdCBvbmUgd2FzIGV2
ZW4gbmV3IHRvIG1lLgoKUGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCj4gaW5kZXggZjM5Yjk3ZS4uODk4YjBjOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCj4gQEAgLTQ5Nyw3ICs0OTcsNyBAQCB2b2lkIGRybV9zY2hlZF9yZXN1
Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4gICAKPiAgIAkJaWYg
KElTX0VSUl9PUl9OVUxMKGZlbmNlKSkgewo+ICAgCQkJc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9
IE5VTEw7Cj4gLQkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJf
RVJSKGZlbmNlKSk7Cj4gKwkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVk
LCBQVFJfRVJSX09SX1pFUk8oZmVuY2UpKTsKPiAgIAkJfSBlbHNlIHsKPiAgIAkJCXNfam9iLT5z
X2ZlbmNlLT5wYXJlbnQgPSBmZW5jZTsKPiAgIAkJfQo+IEBAIC03NDIsNyArNzQyLDcgQEAgc3Rh
dGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKPiAgIAkJCWRtYV9mZW5jZV9wdXQo
ZmVuY2UpOwo+ICAgCQl9IGVsc2Ugewo+ICAgCj4gLQkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNf
ZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7Cj4gKwkJCWRtYV9mZW5jZV9zZXRfZXJy
b3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSX09SX1pFUk8oZmVuY2UpKTsKPiAgIAkJCWRy
bV9zY2hlZF9wcm9jZXNzX2pvYihOVUxMLCAmc2NoZWRfam9iLT5jYik7Cj4gICAJCX0KPiAgIAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
