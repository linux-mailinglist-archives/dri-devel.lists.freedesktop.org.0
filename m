Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A24E0AB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 08:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324F36E808;
	Fri, 21 Jun 2019 06:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0816E808
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:54:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a15so5250604wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 23:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L2mujdQT9PKV+acIyVoSxxafCYhhix5Brk1LJ8IVbWY=;
 b=S5bfljB0Hk+R+kbMyhm3QFREvLdqn+K8+bM2ouohh5K6DZWxofaGCBRqYIRwlrzeuI
 wnCMh3ADe//r1yOrfJDxhTriEvSfdal/+vD/rdhOrTyPZSlkf4LNC2P9sCNb5hMdcvP4
 qy6xyCHMeO7/zPwV6u5ujtWCCVMG/9Ihdk96aGG06xvD747h36fFU2x6mNRHLkmyh0JT
 oH0nicVhbuCDMCOdha4JTWRLsR094NG37pCv343U5G6CqiVT6vCu3kj1Ub2YLMcGNhvl
 Go2P4XmsarPF4FWSBJkmTO/BSzlT1SGKczSf8VgNNM0bbaYNcaxQRKE5LZz5xjt0SVmE
 biDg==
X-Gm-Message-State: APjAAAWjd0EjZQjF9jzLao3tz9Wb3o2i8NbdsUOvH7OCbUphtqvBJvFR
 gU+RdqMaDpohmnMbt3kXcU6f8SBI
X-Google-Smtp-Source: APXvYqxJU3WDSeu5Qj/rniH8cIubss0GN2kAprAkN9Bran1PEzwviULCqfArd/USF6wjWlYAI9w+BA==
X-Received: by 2002:a1c:cb43:: with SMTP id b64mr2569967wmg.135.1561100074672; 
 Thu, 20 Jun 2019 23:54:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r2sm2321575wma.26.2019.06.20.23.54.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 23:54:33 -0700 (PDT)
Subject: Re: [PATCH 0/6] drm/ttm: make ttm bo a gem bo subclass
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190620074424.1677-1-kraxel@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9db9f38d-b912-2415-b613-fd6d7cfd6278@gmail.com>
Date: Fri, 21 Jun 2019 08:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620074424.1677-1-kraxel@redhat.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=L2mujdQT9PKV+acIyVoSxxafCYhhix5Brk1LJ8IVbWY=;
 b=cm4mclmGYAOVoNTG+vg1+FhOKNhN3OHhfr8ZL+rgxaL2wCWvDhxuv8Re2LWWFIE8L7
 84iEzB9Zis6JTuC0zRgAq8qclE1Rdz7WRiK5O2TNkit3+YRkaLvFKE/q+evtr+YXnXeX
 i0D5TGKi/Jq4mGBUrLG1gBkcBdTC/68jAsQlWHQzgflb2LXr+3oDk8eAZlduWd6BcyU8
 uLpt5VgfauHe1CahypiriYXKpelgSpXLIvAS+z/IvE95j7vjJnLPPYiWnqM785PLnoG/
 Uv8jd0DeF/B6AWrcFGUYFcvdai1Hh88UOjsZ2BkoVU5PakA65TKVR7GEFmT6jiWY7mUj
 YO4w==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCBvbiBmaXJzdCBnbGFuY2UuCgpCdXQgcGxlYXNlIGFsc28gZml4IHVwIGFsbCBv
dGhlciBkcml2ZXJzIHdoaWNoIHVzZSBUVE0gYW5kR0VNIHdpdGggYXQgCmxlYXN0IGEgdHJpdmlh
bCBzZWFyY2gsIHJlcGxhY2UgYW5kIGNvbXBpbGUgdGVzdC4gSWYgd2UgYXJlIGdvaW5nIHRvIApt
ZXJnZSB0aG9zZSBvciBub3QgZGlyZWN0bHkgaXMgYSBkaWZmZXJlbnQgc3RvcnkuCgpBZGRpdGlv
bmFsIHRvIHRoYXQgeW91IGNhbiBwcm9iYWJseSBnZXQgcmlkIG9mIGJvLT5yZXN2IGFzIHdlbGwg
YWZ0ZXIgCnBhdGNoICM0LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKQW0gMjAuMDYuMTkgdW0gMDk6
NDQgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+Cj4gR2VyZCBIb2ZmbWFubiAoNik6Cj4gICAgZHJt
L3R0bTogYWRkIGdlbSBiYXNlIG9iamVjdAo+ICAgIGRybS92cmFtOiB1c2UgZW1iZWRkZWQgZ2Vt
IG9iamVjdAo+ICAgIGRybS9xeGw6IHVzZSBlbWJlZGRlZCBnZW0gb2JqZWN0Cj4gICAgZHJtL3R0
bTogdXNlIGdlbSByZXNlcnZhdGlvbiBvYmplY3QKPiAgICBkcm0vdHRtOiB1c2UgZ2VtIHZtYV9u
b2RlCj4gICAgZHJtL3ZyYW06IGRyb3AgZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfbW1h
cAo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAgMiAr
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggICAgICAgICAgICAgIHwgIDYgKy0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuaCAgICAgICAgICAgfCAgNiArLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5oICAgICB8ICAyICstCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICAgICAgfCAgMiArLQo+ICAg
aW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAgICAgIHwgIDcgKy0tLQo+ICAg
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgICAgICAgIHwgMjQgKysrKysrKyst
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgICB8IDM2ICsr
KystLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2NtZC5jICAgICAgICAg
ICAgICB8ICA0ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kZWJ1Z2ZzLmMgICAgICAg
ICAgfCAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZGlzcGxheS5jICAgICAgICAg
IHwgIDggKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZ2VtLmMgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jICAgICAgICAgICB8
IDIwICsrKystLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jICAgICAg
ICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jICAgICAgICAgICAg
ICB8ICA0ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgICAgICAg
fCA0OCArKysrKysrKysrKysrLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b191dGlsLmMgICAgICAgICAgfCAgNCArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYyAgICAgICAgICAgIHwgIDkgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X3ByaW1lLmMgICAgIHwgIDMgLS0KPiAgIDE5IGZpbGVzIGNoYW5nZWQsIDk0IGluc2VydGlv
bnMoKyksIDk3IGRlbGV0aW9ucygtKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
