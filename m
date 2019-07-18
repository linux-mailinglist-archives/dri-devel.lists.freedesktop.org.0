Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247A6D434
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 20:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A816E445;
	Thu, 18 Jul 2019 18:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50466E445
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 18:51:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so31566480edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 11:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=URiLqv3fqj5L9yZBYo/hYzJLLFJ5n1+De76gKP8TH6E=;
 b=brBFWADDT9xgdhwztsGaIKHfak0gmY0FeqOREjwINSQG4R39qo6HER1gewk2snR7uX
 TiXvzHcuCMtt7wNuo4J1MbmcBbLCKpcWqxO5bSIHE7ZupAglvh/6BP15xMFULzA46KNQ
 vw/cKSaUYFvTCtTc5Xbg6NQWH8qc0Pq6+AR5IJqbrGzBFgN+UVgilsgDujVGFu0wQL2T
 FyxZW6Eo8ownsJzOFbWN2dIvhbOJ1WQEZHsDtTgHHs8hTm2j9328V7I/rNW2iIvTxEWP
 5Pr//Yj3miotJKmXMulfV/n2IQf+7IRCYQJCDFGpr4PPav7Y30CSSzmHkxGvMsJU0ZV1
 7Y4A==
X-Gm-Message-State: APjAAAU3SqRL5zd+8NR5mtIH07g3P9tCLPzz2wwTaBIR86v2/+jRAfnf
 YuZYlH3Nrp/yS14lvL3hAk8=
X-Google-Smtp-Source: APXvYqzbB3jXKHw3Uwosyum0yf2AS5zz+W8fa+KDKL9/umSNpOtvTRqydz0lqflAV0hyXA5c19HLTQ==
X-Received: by 2002:a50:fa96:: with SMTP id w22mr42911286edr.45.1563475914324; 
 Thu, 18 Jul 2019 11:51:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m31sm8028027edd.42.2019.07.18.11.51.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 11:51:53 -0700 (PDT)
Date: Thu, 18 Jul 2019 20:51:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/komeda: remove set but not used variable 'old'
Message-ID: <20190718185150.GC15868@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 james.qian.wang@arm.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20190709135808.56388-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709135808.56388-1-yuehaibing@huawei.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=URiLqv3fqj5L9yZBYo/hYzJLLFJ5n1+De76gKP8TH6E=;
 b=Bg0elYlpdWxC/T3gzK23vslgUN6925fC/aCeuZLDoKgqRzGdnLK8tUlH/9YrTBYdg1
 /Z2Flq8qtRoksfGeVT1J1DXm3VWNE37nTCVnfMIeqXJ7cwaDgeKAMbWoy7ygwAvvDgCi
 E4C0NY08/o9mLY2KtndFo8aH0b5ZdKvIqjbXI=
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, james.qian.wang@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDk6NTg6MDhQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzoKPiAgSW4g
ZnVuY3Rpb24ga29tZWRhX3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGU6Cj4gZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzoxNjE6MzU6Cj4gIHdhcm5p
bmc6IHZhcmlhYmxlIG9sZCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlCj4gCj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDk5MGRlZTNhYTQ1NiAoImRybS9r
b21lZGE6Cj4gQ29tcHV0aW5nIGltYWdlIGVuaGFuY2VyIGludGVybmFsbHkiKQo+IAo+IFJlcG9y
dGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZ
dWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpRdWV1ZWQgZm9yIDUuMywgdGhhbmtz
IGZvciB5b3VyIHBhdGNoLgotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcGxhbmUuYwo+IGluZGV4IGMwOTVhZjEuLmMxMzgxYWMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBA
QCAtMTU4LDggKzE1OCw2IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9wbGFuZV9yZXNldChzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSkKPiAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgo+ICBr
b21lZGFfcGxhbmVfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSkKPiAgewo+IC0Jc3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0ZSAqbmV3LCAqb2xkOwo+IC0KPiAg
CWlmIChXQVJOX09OKCFwbGFuZS0+c3RhdGUpKQo+ICAJCXJldHVybiBOVUxMOwo+ICAKPiBAQCAt
MTY5LDggKzE2Nyw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lKQo+ICAKPiAgCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZHVw
bGljYXRlX3N0YXRlKHBsYW5lLCAmbmV3LT5iYXNlKTsKPiAgCj4gLQlvbGQgPSB0b19rcGxhbmVf
c3QocGxhbmUtPnN0YXRlKTsKPiAtCj4gIAlyZXR1cm4gJm5ldy0+YmFzZTsKPiAgfQo+ICAKPiAt
LSAKPiAyLjcuNAo+IAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
