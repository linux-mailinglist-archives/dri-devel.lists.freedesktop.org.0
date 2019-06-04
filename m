Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC5357DC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3BD8967A;
	Wed,  5 Jun 2019 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8749689191
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 18:35:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y198so6715928lfa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 11:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMJzSs7Yqve4iTATuXAR2qrhZwmQvSvCLABWckgDtq4=;
 b=jkx+zRdgEQSzR6zgSjBlqLAfD14U+pN1TABLgaHoyraUr7/ztwQUR/FHSlQcAqA8l3
 E+5CfDnvg9hF9Oq5355nfSixiwopH4YFI/uvOvHAujAKyd+sw/s8qAxbUVeQvO/o3Emd
 mWX/oOphW+DPDIiGifbMy3HStb80BxYXEsblF9X11bYIIqK1InkgbOEYSmkFqfIfR+In
 LXg9YRj37xuF2aNs+shJfKF5TqXPdlooEM3o3jEBJK3sltZp/ZbpszjW6TeeZpQmJXtw
 iYxxP/XGJ6khT5pQNQpxhCHMQYlErbelFKKu28FAFVWe1GDye8hRLJWps6SUNsv4fDe2
 npGA==
X-Gm-Message-State: APjAAAX5Cm+WvtOETzrFiY/IVL8X5t+LWCpVk9jzj71PwxB1Z3/gyAmf
 G+/NWWDPdstnGkFKY7EoCSxCuZJx
X-Google-Smtp-Source: APXvYqwpghucZ89udqWXy2FzZ4WdQIq3J6IMGaQULw5YrOnf5jrqzn5o/uFfgW5tlKHzLcy1PD3CZg==
X-Received: by 2002:a19:4a49:: with SMTP id x70mr4901270lfa.151.1559673355500; 
 Tue, 04 Jun 2019 11:35:55 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
 by smtp.googlemail.com with ESMTPSA id d10sm3824313lfn.91.2019.06.04.11.35.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 11:35:54 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a96b1738-9f7f-69c6-ec44-bc9a355a620a@gmail.com>
Date: Tue, 4 Jun 2019 21:35:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604153150.22265-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dMJzSs7Yqve4iTATuXAR2qrhZwmQvSvCLABWckgDtq4=;
 b=r+sFj0dAXWKVr4O925lG3dJa+5R7gcBrn604Bl2my/fR1d3/vU8djnB3cNFpnPlPWw
 h7qb/HuGYoxFopunuEMdQ5z/jRHLkWKJsGvOkc6BbqsELF08Z4JEAmLUGXnmavlVhwNc
 oEPXg0WeAllXe8J8Y2kkwxxYXAlEe0Fiay+DkB2T2YpVCdsyU6EO0uDbNXt35Pky+6GB
 Est4s8mB4TSIUKjLEStVmDZ+zin5zyDz2GWLVAFu+FuDXK0YCsc0+uuXAnnuGVT/zwWW
 a4sjUnS5IT0jemU4eoRnuXudhKRL7myfZg0pY1SwyqmEjGSeH8e4mKRJvaCGv6YWoLb6
 kx1g==
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

MDQuMDYuMjAxOSAxODozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFdoZW4gZGVmZXJyaW5nIHByb2Jl
LCBhdm9pZCBsb2dnaW5nIGEgY29uZnVzaW5nIGVycm9yIG1lc3NhZ2UuIFdoaWxlIGF0Cj4gaXQs
IG1ha2UgdGhlIGVycm9yIG1lc3NhZ2UgbW9yZSBpbmZvcm1hdGlvbmFsLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2hvc3QxeC9kZXYuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0
MXgvZGV2LmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKPiBpbmRleCBjNTVlMmQ2MzQ4ODcu
LjVhM2Y3OTcyNDBkNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKPiBAQCAtMjQ3LDggKzI0NywxMSBAQCBzdGF0
aWMgaW50IGhvc3QxeF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAg
CWhvc3QtPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCBOVUxMKTsKPiAgCWlmIChJU19F
UlIoaG9zdC0+Y2xrKSkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQg
Y2xvY2tcbiIpOwo+ICAJCWVyciA9IFBUUl9FUlIoaG9zdC0+Y2xrKTsKPiArCj4gKwkJaWYgKGVy
ciAhPSAtRVBST0JFX0RFRkVSKQo+ICsJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8g
Z2V0IGNsb2NrOiAlZFxuIiwgZXJyKTsKPiArCj4gIAkJcmV0dXJuIGVycjsKPiAgCX0KClRoZSBj
bG9jayBkcml2ZXIgc2hvdWxkIGJlIGF2YWlsYWJsZSBhdCB0aGUgdGltZSBvZiBob3N0MXgncyBw
cm9iaW5nIG9uCmFsbCBUZWdyYSdzIGJlY2F1c2UgaXQgaXMgb25lIG9mIGVzc2VudGlhbCBjb3Jl
IGRyaXZlcnMgdGhhdCBiZWNvbWUKYXZhaWxhYmxlIGVhcmx5IGR1cmluZyBib290LgoKSSBndWVz
cyB5b3UncmUgbWFraW5nIHRoaXMgY2hhbmdlIGZvciBUMTg2LCBpcyBpdCBiZWNhdXNlIHRoZSBC
UE1QCmRyaXZlcidzIHByb2JlIGdldHRpbmcgZGVmZXJyZWQ/IElmIHllcywgd29uJ3QgaXQgYmUg
cG9zc2libGUgdG8gZml4IHRoZQpkZWZlciBvZiB0aGUgY2xvY2sgZHJpdmVyIGluc3RlYWQgb2Yg
bWFraW5nIHN1Y2ggY2hhbmdlcyBpbiBhbGwgb2YgdGhlCmFmZmVjdGVkIGRyaXZlcnM/CgpbaXQg
YXBwZWFyZWQgdG8gbWUgdGhhdCBmaXJzdCBlbWFpbCBnb3QgZHJvcHBlZCBieSBnbWFpbCwgc28g
SSdtCnJlLXNlbmRpbmcgaXQgc2Vjb25kIHRpbWUganVzdCBpbiBhIGNhc2VdCgotLSAKRG1pdHJ5
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
