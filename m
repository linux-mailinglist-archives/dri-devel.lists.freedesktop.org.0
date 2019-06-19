Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFC4BC41
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 17:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6D6E42A;
	Wed, 19 Jun 2019 15:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E109B6E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 15:03:40 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so15301127qtj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 08:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aIIEMxX1FhMaJIgNIe0yPO26KaoH+R3kuzA5ZNJYtLw=;
 b=F/eZL/fCN/GFO9nPzmrdWq0/kCnslzZHrKZwAbRgQua8nD1uU5k+DVVIMWTazlg7Nv
 feXg2vTvGntYFEdNusvyo9lO/NE3t4DRYAkV2qu3qRpGMCNRoSqMD95Cd/SyCJZMXCoH
 eilLzqfJCynNxk5i9kWI+XhxIGod3qHwuT7yXC2f4ONuvptywTXa05S0JJUiiBPzRKJt
 ppAUqy89zl5OT86Z9xFsQZvayM3Uee+s23kTSM2OG8jUJzr3NHdyk++mz+UM50K+aPPu
 PuZZ8VsH6vnHUjFMoXHE4jPaIqemIHDxEfXu5kdVSdGCZA2IPBxYHPJQBwQkgsRKU+UH
 BNpQ==
X-Gm-Message-State: APjAAAWAwPuDMvOQwz4HLDL1DOU5kkdffFRUwwsHpzimPv0um+1cPUek
 UwXHTU5fU5Pt223sQCGPztCTXg==
X-Google-Smtp-Source: APXvYqzHcbV/44f9OZWLhrG3lWYAtmysCKUEDcOfy8nWb4FSdg3BA+TVk0XvkrDNhEHFUl4fGGvUeA==
X-Received: by 2002:ac8:7611:: with SMTP id t17mr37487129qtq.112.1560956619957; 
 Wed, 19 Jun 2019 08:03:39 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g10sm9393646qkk.91.2019.06.19.08.03.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 08:03:39 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:03:39 -0400
From: Sean Paul <sean@poorly.run>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: self_refresh: Fix a reversed condition in
 drm_self_refresh_helper_cleanup()
Message-ID: <20190619150339.GF25413@art_vandelay>
References: <20190619100141.GA28596@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619100141.GA28596@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aIIEMxX1FhMaJIgNIe0yPO26KaoH+R3kuzA5ZNJYtLw=;
 b=OMU2qxzW1ptmufAkQijFshFcDuhkZSmya5ShEIlgEaFLx0CWQlXVpFdsxbTlUWwM2V
 iIcB2K52RO5sK1LgMYGbraYEUcU0rZpYI0yyT+gKBmy3MuBj4rAggeFLRS0iMFbe1ZhS
 e2GBFJOSsb+wof/yq6QNct2nRB77TXUdOO2vtAzj88gxCX4O/hpwAoG963LHvSUMjABw
 sKJ5afgI1Z/3p2J3oyudj7P1ZXDghPqIOSjNPganpLJHLL4VTNK/1Kru8g1eENETbDlQ
 gJawkD15I5Ticj9lf5309BEzxzMuuU3j9D9SQR1a3e7OCaQPqOfcr2WCIBxedwFo3wHl
 NO1g==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6MDE6NDFQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBUaGlzIHRlc3QgaXMgZmxpcHBlZCBhcm91bmQgc28gaXQgZWl0aGVyIGxlYWRzIHRv
IGEgbWVtb3J5IGxlYWsgb3IgYQo+IE5VTEwgZGVyZWZlcmVuY2UuCj4gCj4gRml4ZXM6IDE0NTJj
MjViMGU2MCAoImRybTogQWRkIGhlbHBlcnMgdG8ga2ljayBvZmYgc2VsZiByZWZyZXNoIG1vZGUg
aW4gZHJpdmVycyIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBvcmFjbGUuY29tPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2ggYW5kIHlvdXIgYnVnIHJlcG9ydCEg
SSd2ZSBhcHBsaWVkIHRoaXMgdG8gLW1pc2MtbmV4dCBhbmQKd2lsbCBkaWcgaW50byB0aGUgYnVn
IHJlcG9ydCBzaG9ydGx5LgoKPiAtLS0KPiBJJ20gbm90IHRvdGFsbHkgc3VyZSB3aGF0IHRoZSBw
cmVmZXJlZCBwYXRjaCBwcmVmaXggZm9yIHRoaXMgY29kZS4gIE9uZQo+IHRoaW5nIHRoYXQgd291
bGQgaGVscCBpcyB3aGVuIHdlJ3JlIGFkZGluZyBuZXcgZmlsZXMgd2Ugc2hvdWxkIHNwZWNpZnkK
PiB0aGUgcHJlZml4IHRoYXQgdGhleSdyZSBnb2luZyB0byB1c2U6Cj4gCj4gLSBkcm06IEFkZCBo
ZWxwZXJzIHRvIGtpY2sgb2ZmIHNlbGYgcmVmcmVzaCBtb2RlIGluIGRyaXZlcnMKPiArIGRybTog
cmVmcmVzaCBtb2RlOiBBZGQgaGVscGVycyB0byBraWNrIG9mZiBzZWxmIHJlZnJlc2ggbW9kZSBp
biBkcml2ZXJzCj4gCj4gSXQncyBhIHNtYWxsIHRoaW5nIGFuZCBlbWFpbCBhbHdheXMgc291bmRz
IHdoaW55IGJ1dCBJJ20gc2VuZGluZyB0aGlzCj4gc3VnZ2VzdGlvbiB0byBldmVyeW9uZSB0b2Rh
eSBzby4uLgoKVGhlcmUncyBubyBoYXJkIHJ1bGUuIEZvciBkcml2ZXJzIHdlIHVzZSBkcm0vPGRy
aXZlcj4sIGFuZCBmb3IgY29yZSBwZW9wbGUKdXNlIGRybSBvciBkcm0vPGZpbGU+LgoKPiAKPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCj4gaW5kZXggMmIzZGFhZjc3ODQxLi5lMGQy
YWQxZjA3MGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hf
aGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIu
Ywo+IEBAIC0yMDUsNyArMjA1LDcgQEAgdm9pZCBkcm1fc2VsZl9yZWZyZXNoX2hlbHBlcl9jbGVh
bnVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgCXN0cnVjdCBkcm1fc2VsZl9yZWZyZXNoX2Rh
dGEgKnNyX2RhdGEgPSBjcnRjLT5zZWxmX3JlZnJlc2hfZGF0YTsKPiAgCj4gIAkvKiBIZWxwZXIg
aXMgYWxyZWFkeSB1bmluaXRpYWxpemVkICovCj4gLQlpZiAoc3JfZGF0YSkKPiArCWlmICghc3Jf
ZGF0YSkKPiAgCQlyZXR1cm47Cj4gIAo+ICAJY3J0Yy0+c2VsZl9yZWZyZXNoX2RhdGEgPSBOVUxM
Owo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2ds
ZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
