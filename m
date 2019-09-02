Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D994A50EB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2104889B4D;
	Mon,  2 Sep 2019 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35189B4D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:10:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y19so12994074wrd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 01:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UxImXA5gENUS3YkpBEe6n6FaMSjLQiNqZC4NJBHrA04=;
 b=rxU4Q2EJaTxEt6993zp/53AMIZofEGugdq4GJhpaHAW5yTy2KUYMq9sMQWov6tInQG
 Ojl36CIDKpwEJYN9di2FJ5ZzgIuKlzkr21E7S5wmeIXgQSZM/WcFJ2e+6kGAp+QCuQTN
 u9xtO9Llm5ZdHyVc5qXqCA5Kss6MMzmnnXguKmPYXGB7xbQudQT4cYHPt6GfsJfrJ2Zl
 vSsyeBBSsprTkEnMdBiGLxRltX3coBIPa+a/BacazlOUziEqmcDe8LtU2lBqQTSedFR1
 aW8fEJprGjav/aLPwqAk36dK5lJZGE5iVZ+ks1ZL+XK2EvoiBeorZ5W3b/KPXWIwGZnp
 hA5Q==
X-Gm-Message-State: APjAAAWRCjPtfLH0nHnZ8Nn6po225NKwkMzNtewL9KyAneoQ7miQKTq4
 NOrG2Q0AVVqy2YtBc/On18JqLQ==
X-Google-Smtp-Source: APXvYqwwixoTfwh901r3rlmgU2OmfZWfl4Hu6KZzHSC3qCsRTewonW/mdFtkD2LC8xuKJLK0eIyPvA==
X-Received: by 2002:adf:db01:: with SMTP id s1mr25180884wri.164.1567411818471; 
 Mon, 02 Sep 2019 01:10:18 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v186sm32578140wmb.5.2019.09.02.01.10.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 01:10:17 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm: dw-hdmi: update CEC phys addr and EDID on HPD
 event
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
 <AM0PR06MB4004285BAA935D14F1A68787ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d0d7a5b8-4301-9a08-64af-8474a0c4f5de@baylibre.com>
Date: Mon, 2 Sep 2019 10:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR06MB4004285BAA935D14F1A68787ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UxImXA5gENUS3YkpBEe6n6FaMSjLQiNqZC4NJBHrA04=;
 b=k6IMwS2zj+3LX9bNHSZegcJBfJ1BeX11b6RkKJ2K2ny6C1StLGE1bUhsPbapyLUBs0
 0CvqeCmowvJD0DFhUrA50Ley/UFum6itfiAUOllvtH8wQJoymSsPFQ58IC+WdGygBM1N
 HLWXVvIhXwbgmcT4gVe1k+IHtlyUQbdmTlNvrhesaHs7ttOnLRxvs5jVj7p6m6u1MDfg
 WuZFNpGtsqwKFrrBdwHnhpUFuoABSMsrA277ARcpeoRRYacW3eTI/5FrVa0jfkx/Znqx
 +ygJLtUaMCsdpC4j36DN6yQHp1W+F0JCEJMRao2heXuGSyZCx2C/xYfOSHHPuHUYmYxy
 HH9g==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMDkvMjAxOSAxODoxNCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBVcGRhdGUgQ0VDIHBo
eXMgYWRkciBhbmQgRURJRCBvbiBIUEQgZXZlbnQsIGZpeGVzIGxvc3QgQ0VDIHBoeXMgYWRkciBh
bmQKPiBzdGFsZSBFRElEIHdoZW4gSERNSSBjYWJsZSBpcyB1bnBsdWdnZWQvcmVwbHVnZ2VkIG9y
IEFWUiBpcyBwb3dlcmVkIG9uL29mZi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFu
IDxqb25hc0Brd2lib28uc2U+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jIHwgMTYgKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4gaW5kZXggOTFkODZkZGQ2NjI0Li4wZjA3YmUxYjU5MTQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0yMTg5
LDYgKzIxODksNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfY29ubmVjdG9yX3VwZGF0ZV9lZGlkKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0
b3Jfc3RhdHVzCj4gIGR3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+ICB7Cj4gKwllbnVtIGRybV9jb25uZWN0b3Jfc3Rh
dHVzIHN0YXR1czsKPiAgCXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFpbmVyX29mKGNvbm5l
Y3Rvciwgc3RydWN0IGR3X2hkbWksCj4gIAkJCQkJICAgICBjb25uZWN0b3IpOwo+ICAKPiBAQCAt
MjE5OCw3ICsyMTk5LDE0IEBAIGR3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+ICAJZHdfaGRtaV91cGRhdGVfcGh5X21h
c2soaGRtaSk7Cj4gIAltdXRleF91bmxvY2soJmhkbWktPm11dGV4KTsKPiAgCj4gLQlyZXR1cm4g
aGRtaS0+cGh5Lm9wcy0+cmVhZF9ocGQoaGRtaSwgaGRtaS0+cGh5LmRhdGEpOwo+ICsJc3RhdHVz
ID0gaGRtaS0+cGh5Lm9wcy0+cmVhZF9ocGQoaGRtaSwgaGRtaS0+cGh5LmRhdGEpOwo+ICsKPiAr
CWlmIChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpCj4gKwkJZHdfaGRtaV9j
b25uZWN0b3JfdXBkYXRlX2VkaWQoY29ubmVjdG9yLCBmYWxzZSk7Cj4gKwllbHNlCj4gKwkJY2Vj
X25vdGlmaWVyX3BoeXNfYWRkcl9pbnZhbGlkYXRlKGhkbWktPmNlY19ub3RpZmllcik7Cj4gKwo+
ICsJcmV0dXJuIHN0YXR1czsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiBAQCAtMjQzOCwx
MiArMjQ0Niw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd19oZG1pX2lycShpbnQgaXJxLCB2b2lk
ICpkZXZfaWQpCj4gIAkJZHdfaGRtaV9zZXR1cF9yeF9zZW5zZShoZG1pLAo+ICAJCQkJICAgICAg
IHBoeV9zdGF0ICYgSERNSV9QSFlfSFBELAo+ICAJCQkJICAgICAgIHBoeV9zdGF0ICYgSERNSV9Q
SFlfUlhfU0VOU0UpOwo+IC0KPiAtCQlpZiAoKHBoeV9zdGF0ICYgKEhETUlfUEhZX1JYX1NFTlNF
IHwgSERNSV9QSFlfSFBEKSkgPT0gMCkgewo+IC0JCQltdXRleF9sb2NrKCZoZG1pLT5jZWNfbm90
aWZpZXJfbXV0ZXgpOwo+IC0JCQljZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUoaGRt
aS0+Y2VjX25vdGlmaWVyKTsKPiAtCQkJbXV0ZXhfdW5sb2NrKCZoZG1pLT5jZWNfbm90aWZpZXJf
bXV0ZXgpOwo+IC0JCX0KPiAgCX0KPiAgCj4gIAlpZiAoaW50cl9zdGF0ICYgSERNSV9JSF9QSFlf
U1RBVDBfSFBEKSB7Cj4gCgpXb24ndCBpdCBwb3NzaWJseSB0cmlnZ2VyIHR3aWNlIGVkaWQgcmVh
ZG91dHMgb24gZWFjaCBIUEQgZXZlbnQsCm9uZSBmb3IgQ0VDIGFuZCBvbmUgZm9yIG1vZGVzID8g
SXQgc2VlbXMgc2FuZSBidXQgbm90IHZlcnkgZWZmaWNpZW50IHRvIG1lLi4uCgpBbnl3YXk6ClJl
dmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
