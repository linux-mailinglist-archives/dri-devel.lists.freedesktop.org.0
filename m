Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E07A888
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 14:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4052C6E4BB;
	Tue, 30 Jul 2019 12:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847BB6E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:32:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a15so56988040wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 05:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Cxr3BOLw0MZU9prwawF+FOZ3AUeqcSoMe4R7R6+ZdS4=;
 b=naaSFhA2hefpSx94kJpntyz/sNW8Uqig3cwU8jffHpNkv+WnKN6q40KFWQ7Nf5X2tt
 x3+A0biIIvtQrmbtmAWK4FkdRoFVGxzYcS2DuK36Ee2dk/ErOCo9LTvyHYcn+OeE3sG3
 BMLQZWX8cJXjpyMTH6B9Zl34DciSs5k53A3E+/fgOKRvAAzW7Sso1ZfME20R8AQHaqHx
 Kg0qYV5KWpMMgdowrY19fHGVgrVeyj41pLqqu5U5J05W4R34oQGT8CvXfaJrObpbpEbC
 7D4CpH0YnEDbOYxEECqM9XlGJHYB61mHj0FhUxYEWFwEE6enN2FPoiPx44ZkTcNuD7Be
 plnw==
X-Gm-Message-State: APjAAAVLuZNeYB1dmN7cOuNcbYPSV+ZZwYuVqCeJflAqDL5rCSZbY9mZ
 EHWuomB/QUxC/sH1EL4ps4TYNYqJeP4=
X-Google-Smtp-Source: APXvYqyvIlqTspzpPIfkmJLUVbSZWe44oJFYUdCno3CZkQyq4aV+TzwGFw4e6YLfSYZZ1bYfdo9wrw==
X-Received: by 2002:a1c:f115:: with SMTP id p21mr39564676wmh.134.1564489940759; 
 Tue, 30 Jul 2019 05:32:20 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm67704190wrj.68.2019.07.30.05.32.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:32:20 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: tc358764: Fix build error
To: YueHaibing <yuehaibing@huawei.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch
References: <20190729090520.25968-1-yuehaibing@huawei.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <a7fb2600-2add-8769-f8dc-6679680974c1@baylibre.com>
Date: Tue, 30 Jul 2019 14:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729090520.25968-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Cxr3BOLw0MZU9prwawF+FOZ3AUeqcSoMe4R7R6+ZdS4=;
 b=dWH9n4h0Y5/7NNu6PaUImgBuXXOy6kbXmOeVpO+riYAc6HqAT4Bo9WFHzonTmrRH3g
 QtB7Vaa1SqIBjZmXMsONQk/vuBNAaDqlUlftFnGEtnI/80UMrcGqlnw2nZfAijhU9KdC
 lNV07Zogi8QTseRApLhDMf1BHKVYR9Mu5SFJcNdi4Vmr89QlG/qAP6QcwL9ptwYjY4ub
 sAFjGAb2WilocTtJ8N/iytkQNZXhaziMvnyygFPOFEWNZOoKylZeZ2wCQjeS/JUuZ5gz
 qq+lmNO+yogsh3FqZXxmJDwYgFpPnIHGCXfbCgREqTEHmC+oWRyrs+h7a9A00hWP/h3A
 WSjg==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMDcvMjAxOSAxMTowNSwgWXVlSGFpYmluZyB3cm90ZToKPiBJZiBDT05GSUdfRFJNX1RP
U0hJQkFfVEMzNTg3NjQ9eSBidXQgQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0sCj4gYnVpbGRpbmcg
ZmFpbHM6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigucm9kYXRhKzB4
MjI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3Jlc2V0Jwo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0YSsweDI0
MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5l
Y3Rvcl9tb2RlcycKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0Lm86KC5yb2RhdGEr
MHgyNjgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0
b3JfZHVwbGljYXRlX3N0YXRlJwo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzoo
LnJvZGF0YSsweDI3MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVy
X2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlJwo+IAo+IExpa2UgVEMzNTg3NjcsIHNlbGVjdCBEUk1f
S01TX0hFTFBFUiB0byBmaXggdGhpcywgYW5kCj4gY2hhbmdlIHRvIHNlbGVjdCBEUk1fUEFORUwg
dG8gYXZvaWQgcmVjdXJzaXZlIGRlcGVuZGVuY3kuCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9i
b3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IEZpeGVzOiBmMzhiN2NjYTZkMGUgKCJkcm0vYnJpZGdl
OiB0YzM1ODc2NDogQWRkIERTSSB0byBMVkRTIGJyaWRnZSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiBpbmRleCBh
NmVlYzkwLi4zMjNmNzJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2Nv
bmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+IEBAIC0xMTYsOSAr
MTE2LDEwIEBAIGNvbmZpZyBEUk1fVEhJTkVfVEhDNjNMVkQxMDI0Cj4gIAo+ICBjb25maWcgRFJN
X1RPU0hJQkFfVEMzNTg3NjQKPiAgCXRyaXN0YXRlICJUQzM1ODc2NCBEU0kvTFZEUyBicmlkZ2Ui
Cj4gLQlkZXBlbmRzIG9uIERSTSAmJiBEUk1fUEFORUwKPiAgCWRlcGVuZHMgb24gT0YKPiAgCXNl
bGVjdCBEUk1fTUlQSV9EU0kKPiArCXNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICsJc2VsZWN0IERS
TV9QQU5FTAo+ICAJaGVscAo+ICAJICBUb3NoaWJhIFRDMzU4NzY0IERTSS9MVkRTIGJyaWRnZSBk
cml2ZXIuCj4gIAo+IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
