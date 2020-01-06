Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A175131472
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A016E47B;
	Mon,  6 Jan 2020 15:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7720F6E47B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 15:08:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q6so49884535wro.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 07:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+BBwbnfabT1uIIJs29bNXLndoEm/IJ8elKvwOxZ5AIY=;
 b=iEMhehbOrT0mbz8Il2etnWT8Ht1BXiVEVd8mFf0Nz1fafkdaQLYy8bpB6rvmeH7Nzn
 nu4LpYwyVIvJw3FZC/3rJm48MwvlupDLTmmKLMeoDsLQKzuxhsWgVmk4SwM3vBfoxHcE
 0+DR/bS3uIDsCetg7Y/wTKb7j08RyXMdG6lnUPZTqSmptW2M1balErznoQUCcATHdg/J
 eT7DavXwh//w2WqCOSScII2OKjNV7vvLxOKrZH01W18iVZk4ZeeCW+kI3R6OcWof3Hez
 YyANN19pulmC3OKNSXlrnAOGLtj6yrH7ycgCX43ASpKCWoq8+a5jiLO293GGrQxEuv1v
 EXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+BBwbnfabT1uIIJs29bNXLndoEm/IJ8elKvwOxZ5AIY=;
 b=ey8fBKPgptNtrYjaxCRPhhtU/uQDsH8cAMuztTunsMIBe80HrP7FaUs6gyshxglR+e
 OdSRnNsvIx5D4UUy3ym+mEjwqSzn2+71/BAhcT5ilqlqOk4lXMQKtw+2DcHCMfp5+U4y
 I4sJUuqkAaj2cJj6FGI2PoFzTl3yB/ll0smYrhodMQGt9MUHnkGSUcy1ElC/oJYo9btM
 FrzSv52c7gGxDoq4lyQ2J/gZ1VNVCInH9+Lhxdu9cl8c4ZgPisYorEuuxLRRP9Gts9T5
 aTkmnmG8iNwuL1pe3V1Oj8OwBG/0erkbVx62gfnK6w0KJf4VTf+cbcQ3el1jp9o6vfMh
 POSw==
X-Gm-Message-State: APjAAAWnSo/lCaOm7gJ8uWLx/0vsftMMdrKtrzy6IfLOu8d41Rx+bdoD
 PoAX11xirREHUi1Of14ZeWf1yQ==
X-Google-Smtp-Source: APXvYqwNK7BngL3YD1KlI2PqASuOJCVSrnycYxxfPpDrAoIJXoyMiQwZylj8ISmF6G0OVmV8xlr/ZA==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr102414298wrq.396.1578323283080; 
 Mon, 06 Jan 2020 07:08:03 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f207sm25052052wme.9.2020.01.06.07.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 07:08:02 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: cdns: remove set but not used variable
 'nlanes'
To: yu kuai <yukuai3@huawei.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch
References: <20191226121415.39483-1-yukuai3@huawei.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <c195df5c-38d4-1034-80cf-830528ecb257@baylibre.com>
Date: Mon, 6 Jan 2020 16:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191226121415.39483-1-yukuai3@huawei.com>
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
Cc: zhengbin13@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMTIvMjAxOSAxMzoxNCwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9j
ZG5zLWRzaS5jOiBJbiBmdW5jdGlvbiDigJhjZG5zX2RzaV9tb2RlMmNmZ+KAmToKPiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2NkbnMtZHNpLmM6NTE1OjExOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhu
bGFuZXPigJkKPiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+
IAo+IEl0IGlzIG5ldmVyIHVzZWQsIGFuZCBzbyBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvY2Rucy1kc2kuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9jZG5zLWRzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jCj4g
aW5kZXggM2E1YmQ0ZTdmZDFlLi5hNmFiMmQyODFhOWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9j
ZG5zLWRzaS5jCj4gQEAgLTUxMiw3ICs1MTIsNyBAQCBzdGF0aWMgaW50IGNkbnNfZHNpX21vZGUy
Y2ZnKHN0cnVjdCBjZG5zX2RzaSAqZHNpLAo+ICAJc3RydWN0IGNkbnNfZHNpX291dHB1dCAqb3V0
cHV0ID0gJmRzaS0+b3V0cHV0Owo+ICAJdW5zaWduZWQgaW50IHRtcDsKPiAgCWJvb2wgc3luY19w
dWxzZSA9IGZhbHNlOwo+IC0JaW50IGJwcCwgbmxhbmVzOwo+ICsJaW50IGJwcDsKPiAgCj4gIAlt
ZW1zZXQoZHNpX2NmZywgMCwgc2l6ZW9mKCpkc2lfY2ZnKSk7Cj4gIAo+IEBAIC01MjAsNyArNTIw
LDYgQEAgc3RhdGljIGludCBjZG5zX2RzaV9tb2RlMmNmZyhzdHJ1Y3QgY2Ruc19kc2kgKmRzaSwK
PiAgCQlzeW5jX3B1bHNlID0gdHJ1ZTsKPiAgCj4gIAlicHAgPSBtaXBpX2RzaV9waXhlbF9mb3Jt
YXRfdG9fYnBwKG91dHB1dC0+ZGV2LT5mb3JtYXQpOwo+IC0JbmxhbmVzID0gb3V0cHV0LT5kZXYt
PmxhbmVzOwo+ICAKPiAgCWlmIChtb2RlX3ZhbGlkX2NoZWNrKQo+ICAJCXRtcCA9IG1vZGUtPmh0
b3RhbCAtCj4gCgoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4KCmFuZCBhcHBseWluZyB0byBkcm0tbWlzYy1uZXh0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
