Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC6B4278A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7139D8955D;
	Wed, 12 Jun 2019 13:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B4B89580;
 Wed, 12 Jun 2019 13:29:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 207so6607143wma.1;
 Wed, 12 Jun 2019 06:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=zoHFx+f18U5hvEclvDweTF9Xepkr2D2aOEyH6Nta5oQ=;
 b=kqpfrTl6J65ers3vxQSD01qpQ88baQcr/giD+iVUf+5Hqv68MZKw9eBOdBxN04854d
 +SGA6BUY8viLP6747ll2cvEXyI6IevwJ9ziPk6z/vkM+3tp53uGxniMFr7MAosbevdnN
 6WGUO6RV+tU6Ceo+qS62x9sSslqhf+h2BQvFVmlXKbCR6spmzedDBz+73hq4BYUjq5DW
 VahPe0GZBpQbA3oLD5qppNpZnZjOIuOJiepq9VE11SOMz45UGJ602kHr70H+hTelc8lM
 E0VIYMqk9IS4p3ZBF+sDONRJGhtC/wC4im1iD3XjRgTVIio+LbuaphDUlpCcOwxjcrNw
 6LtQ==
X-Gm-Message-State: APjAAAW67rZUczcb1cDmJhDb2PrTt616qz+iCoPwjkhaLroQzVA8fSHb
 X2AeqQSdmeO1L+H+j6+XOJ4RPau3
X-Google-Smtp-Source: APXvYqwTl2Vr6WMrd1BAn2H5Ah88A2DlZ4ypKyvWmL/M6t/CETs3l27G0VCBH+IBs03zLOWG9A3v5g==
X-Received: by 2002:a1c:bbc1:: with SMTP id
 l184mr21767657wmf.111.1560346197458; 
 Wed, 12 Jun 2019 06:29:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y2sm18170299wrl.4.2019.06.12.06.29.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 06:29:57 -0700 (PDT)
Subject: Re: [PATCH] dma-fence/reservation: Markup rcu protected access for
 DEBUG_MUTEXES
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20190612132830.31221-1-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <34c9b7c3-30c9-f7f4-0b23-8cc7c2d2715e@gmail.com>
Date: Wed, 12 Jun 2019 15:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612132830.31221-1-chris@chris-wilson.co.uk>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zoHFx+f18U5hvEclvDweTF9Xepkr2D2aOEyH6Nta5oQ=;
 b=P/WtvVi/V0H0UpSNy6nOKMynoZnHWGF9l8MTg1JQ8fEhP1st9wPlL62YZEMaa4Q3yJ
 am6pEej1WIjr03aH/OxeR8IPRHb0ISTHVgC2nf6yjlIxZM6MEBkE2WVp5KyLyd7Cbl13
 zQbCs/OmreHDx1xsRnfWs6pXE6wM9so+PVaugBJePQVJyvaJ8pXbjcYZGrmeWLmzH/pT
 3NeN+FRZnXLxmvQd+NRqgh/RBPitH7jM7NVQBe12lNKe1ZCsa6+NvRmPPfWUgSAQUG/D
 Ho8u2QeAplbLFjUNgkUuaHTC+5UKQPMCr+oG5MXvUt4KAS/MN5G3h55p7tS/drufNJcv
 UnOg==
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDYuMTkgdW0gMTU6Mjggc2NocmllYiBDaHJpcyBXaWxzb246Cj4gTWFyayB0aGUgYWNj
ZXNzIHRvIHJlc2VydmF0aW9uX29iamVjdC5mZW5jZSBhcyBiZWluZyBwcm90ZWN0ZWQgdG8KPiBz
aWxlbmNlIHNwYXJzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L3Jlc2VydmF0aW9uLmgg
fCA4ICsrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcmVzZXJ2YXRpb24uaCBiL2lu
Y2x1ZGUvbGludXgvcmVzZXJ2YXRpb24uaAo+IGluZGV4IGVlNzUwNzY1Y2M5NC4uNjQ0YTIyZGJl
NTNiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcmVzZXJ2YXRpb24uaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvcmVzZXJ2YXRpb24uaAo+IEBAIC0yMTYsOCArMjE2LDEyIEBAIHJlc2VydmF0
aW9uX29iamVjdF91bmxvY2soc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqKQo+ICAgewo+
ICAgI2lmZGVmIENPTkZJR19ERUJVR19NVVRFWEVTCj4gICAJLyogVGVzdCBzaGFyZWQgZmVuY2Ug
c2xvdCByZXNlcnZhdGlvbiAqLwo+IC0JaWYgKG9iai0+ZmVuY2UpCj4gLQkJb2JqLT5mZW5jZS0+
c2hhcmVkX21heCA9IG9iai0+ZmVuY2UtPnNoYXJlZF9jb3VudDsKPiArCWlmIChyY3VfYWNjZXNz
X3BvaW50ZXIob2JqLT5mZW5jZSkpIHsKPiArCQlzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0X2xp
c3QgKmZlbmNlID0KPiArCQkJcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9saXN0KG9iaik7Cj4gKwo+
ICsJCWZlbmNlLT5zaGFyZWRfbWF4ID0gZmVuY2UtPnNoYXJlZF9jb3VudDsKPiArCX0KPiAgICNl
bmRpZgo+ICAgCXd3X211dGV4X3VubG9jaygmb2JqLT5sb2NrKTsKPiAgIH0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
