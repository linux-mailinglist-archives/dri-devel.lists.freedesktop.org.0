Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AE2873CF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 14:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C430F6E113;
	Thu,  8 Oct 2020 12:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DDB6E113
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 12:06:38 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id u21so7759351eja.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 05:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gXjtIH7dAAJciFaXwreITvtgTALD51vwZB1L5IfZhnE=;
 b=Wq2WSf3zZJQ4BBWUyL5VGwtoZDmet7UNRDliIwTtTITSFkUFE2pgG2EMtfEmspaGl6
 +m2CoVlv02bMP1hxzUoyUNhgZjl8NrvIIqXcia7ZmK4CA9GryMFrLSG2lUWywThFUIq6
 tNfjA3+nOv3TtLpTW9TZPEmf15u89ALe5wbq4diXDRilHBVlSh+r/21c6hsb0CgqExO4
 xtaT3keqIu6jGCcMXo3qUHpkmv4Hr+ZL2htSqgViDoz+PCYz0iQLvBdzxfon/1ze4E30
 pvZP7kv3HFJ0vTwpgzc8DWMf7WcD5KxYm7hBIC2JML8nVpte6otZd4CW11o/EpcGz0ub
 iqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gXjtIH7dAAJciFaXwreITvtgTALD51vwZB1L5IfZhnE=;
 b=P2yirGDq2AaoxaIYkD491EVj1zSksi63w/+Xanli2SPwrx+zBQYL8xCX92eJtngw1W
 9aQ/GEaMOPyUGvyzOk69TKcT5/KaO4mU0xE5L5Zg1WS6AKsJtyrCj/4ZZ3T1aix3Dgn+
 9DzKR8Y84BqZlWjkb2IMo+7nwUn9XCZykBG93F/AAGo+557h6fiBOeEi8EPg+vtwagJr
 OWt55nRQt1aCs7EJdyTFu7IZmdry8AILSeXI76039s//PRL8aH3zx6ITNSCjUFMk69/1
 C3OdQHdV++zK3p/DLfO5yYvHWotuBnpfUeVDreXZcfImtKB3sSEr+p/VJb9Hp76yJlK4
 nIBA==
X-Gm-Message-State: AOAM533FPOkV5ewgPNYgJkanir8r71aRXLF9iKmUqE1fV4oqvLcI9Ceg
 v6PQDNmGCn06x+5tAN80kw0=
X-Google-Smtp-Source: ABdhPJx6xc2xxF8cIvrcp9+s773JObUPxs9e5wJpF3CyCr5TW/ZXQKvGUYmaCfo2bUuLtvDCAuZ3ig==
X-Received: by 2002:a17:906:b004:: with SMTP id
 v4mr8779129ejy.156.1602158796801; 
 Thu, 08 Oct 2020 05:06:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id bu23sm3843061edb.69.2020.10.08.05.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 05:06:36 -0700 (PDT)
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To: Matthew Wilcox <willy@infradead.org>
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008113937.GB20115@casper.infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <41323971-7869-ed09-6181-99a567dc6d7b@gmail.com>
Date: Thu, 8 Oct 2020 14:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008113937.GB20115@casper.infradead.org>
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
Reply-To: christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTAuMjAgdW0gMTM6Mzkgc2NocmllYiBNYXR0aGV3IFdpbGNveDoKPiBPbiBUaHUsIE9j
dCAwOCwgMjAyMCBhdCAwMToyMzozOVBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
PiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgICAgICAgICAgICAgICAgICB8IDE2ICsrKysr
LS0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jICAg
ICAgfCAgNCArLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1
Zi5jIHwgIDMgKy0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4u
YyAgIHwgIDQgKystLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jICAgICAgICAg
ICAgICB8ICA0ICstLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jICAg
ICAgICAgfCAgMyArLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jICAgICAg
ICAgICAgfCAgMyArLS0KPj4gICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9hc2htZW0uYyAgICAg
ICAgICAgfCAgNSArKy0tLQo+IC4uLgo+PiArKysgYi9tbS9tbWFwLmMKPj4gQEAgLTEzNiw2ICsx
MzYsMjIgQEAgdm9pZCB2bWFfc2V0X3BhZ2VfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSkKPj4gICAJV1JJVEVfT05DRSh2bWEtPnZtX3BhZ2VfcHJvdCwgdm1fcGFnZV9wcm90KTsKPj4g
ICB9Cj4+ICAgCj4+ICsvKgo+PiArICogQ2hhbmdlIGJhY2tpbmcgZmlsZSwgb25seSB2YWxpZCB0
byB1c2UgZHVyaW5nIGluaXRpYWwgVk1BIHNldHVwLgo+PiArICovCj4+ICtzdHJ1Y3QgZmlsZSAq
dm1hX3NldF9maWxlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgZmlsZSAqZmls
ZSkKPj4gK3sKPj4gKwlpZiAoZmlsZSkKPj4gKwkgICAgICAgIGdldF9maWxlKGZpbGUpOwo+PiAr
Cj4+ICsJc3dhcCh2bWEtPnZtX2ZpbGUsIGZpbGUpOwo+PiArCj4+ICsJaWYgKGZpbGUpCj4+ICsJ
CWZwdXQoZmlsZSk7Cj4+ICsKPj4gKwlyZXR1cm4gZmlsZTsKPj4gK30KPj4gKwo+IFRoZXNlIHVz
ZXJzIGFyZSBhbGwgcG90ZW50aWFsbHkgbW9kdWxlcy4gIFlvdSBuZWVkIGFuIEVYUE9SVF9TWU1C
T0woKT8KCk9oLCBnb29kIHBvaW50LiBZZWFoIEkgdG90YWxseSBtaXNzZWQgdGhhdC4gVGhlIGlu
aXRpYWwgRE1BLWJ1ZiB1c2UgY2FzZSAKd2FzIG5vdCBpbnNpZGUgYSBtb2R1bGUuCgpUaGFua3Ms
CkNocmlzdGlhbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
