Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A27A8F2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 14:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05289864;
	Tue, 30 Jul 2019 12:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7B38984C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:47:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p13so65611812wru.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 05:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bSZz5mC3NL+jHfLKKOC1rysQgaaHT/7HL4y8TM1Gf0Y=;
 b=a6dAdLVxiRXBedf55cEXcUTJAQKaM878n7cV0MPQ51GI7SeC0XfVmYpvxvHFKIPJ2N
 VfVQYRMgnkSIPN3fJ5ennnrfTzyEPjxgS/SkoMjN4tM+O96SdD6Eydnp8zruNRUkNbLK
 SwXhbD89eXqkNGOrV+S4DJgyLA0ZCcUyl2du+EtQrTTpy7KfDMY+YVkdsZs6bHziQvdE
 nnC4R8X7Cqxt1PABiB3W5wMSwWI74gdgcUEJQB9pyK3wfpsZ1k0HBHonQp8tHJxkgPe3
 RQW2RKsr0ompVnlMLsgGZed0TojBLtjwSuptxjrmTxK2gvvtH/tB4M+X69381tiwdxxV
 yYzg==
X-Gm-Message-State: APjAAAU2vYnCzgEPn7E3ATp/5H2+eLXCToJ4GIl9Pbi64dXYWPDjBlCH
 j9NE+6K/CYyDB8QvVp38m0hjbZp2Mug=
X-Google-Smtp-Source: APXvYqztp0DW4bHGPitSybEzR6Ftpra1waSwNBm/c6gr00vdvWh5rRHHJpg2/3fYgqiBCZH1F7rc2Q==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr98320238wrv.39.1564490842732; 
 Tue, 30 Jul 2019 05:47:22 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s2sm52300196wmj.33.2019.07.30.05.47.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:47:22 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: tc358764: Fix build error
From: Neil Armstrong <narmstrong@baylibre.com>
To: YueHaibing <yuehaibing@huawei.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch
References: <20190729090520.25968-1-yuehaibing@huawei.com>
 <a7fb2600-2add-8769-f8dc-6679680974c1@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <bc3fab4a-8fb2-f800-1ec7-5a98700b52d9@baylibre.com>
Date: Tue, 30 Jul 2019 14:47:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a7fb2600-2add-8769-f8dc-6679680974c1@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bSZz5mC3NL+jHfLKKOC1rysQgaaHT/7HL4y8TM1Gf0Y=;
 b=UJrbJpseCW7M3SiKvNHufHErf5cAuofn9rXHSh3Na43P2tFFgOQtrE0fFT+3OqFT4R
 a2yhrnU3b+xjMs28/X6sMwTNJqFZ653L5ovAE5573zXtySJNNKmA071uWTc8NX/vTmIz
 S9JRYy0MSl6SZhHp/lgsQykwM0yggpSi2Cbtic4p7W5U0K93IbJXJUhZnB3XEp7NInz8
 j6/4Qb9/3fpL/djrCvGyfaThrDPoeqGMqPkFjzETMBqRy5HSO0gbA7WtBSLltGlaDJtk
 MWiIxDoJRc7AeAzdH1BgifRk3/i40iX6DdobuK6bkSitRDnzrV1JhXTKlkMtxW7bEcq0
 ahMg==
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

T24gMzAvMDcvMjAxOSAxNDozMiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMjkvMDcvMjAx
OSAxMTowNSwgWXVlSGFpYmluZyB3cm90ZToKPj4gSWYgQ09ORklHX0RSTV9UT1NISUJBX1RDMzU4
NzY0PXkgYnV0IENPTkZJR19EUk1fS01TX0hFTFBFUj1tLAo+PiBidWlsZGluZyBmYWlsczoKPj4K
Pj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigucm9kYXRhKzB4MjI4KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0Jwo+
PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0Lm86KC5yb2RhdGErMHgyNDApOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9k
ZXMnCj4+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0YSsweDI2OCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBs
aWNhdGVfc3RhdGUnCj4+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0
YSsweDI3MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5l
Y3Rvcl9kZXN0cm95X3N0YXRlJwo+Pgo+PiBMaWtlIFRDMzU4NzY3LCBzZWxlY3QgRFJNX0tNU19I
RUxQRVIgdG8gZml4IHRoaXMsIGFuZAo+PiBjaGFuZ2UgdG8gc2VsZWN0IERSTV9QQU5FTCB0byBh
dm9pZCByZWN1cnNpdmUgZGVwZW5kZW5jeS4KPj4KPj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3Qg
PGh1bGtjaUBodWF3ZWkuY29tPgo+PiBGaXhlczogZjM4YjdjY2E2ZDBlICgiZHJtL2JyaWRnZTog
dGMzNTg3NjQ6IEFkZCBEU0kgdG8gTFZEUyBicmlkZ2UgZHJpdmVyIikKPj4gU2lnbmVkLW9mZi1i
eTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDMgKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPj4gaW5k
ZXggYTZlZWM5MC4uMzIzZjcyZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+PiBAQCAt
MTE2LDkgKzExNiwxMCBAQCBjb25maWcgRFJNX1RISU5FX1RIQzYzTFZEMTAyNAo+PiAgCj4+ICBj
b25maWcgRFJNX1RPU0hJQkFfVEMzNTg3NjQKPj4gIAl0cmlzdGF0ZSAiVEMzNTg3NjQgRFNJL0xW
RFMgYnJpZGdlIgo+PiAtCWRlcGVuZHMgb24gRFJNICYmIERSTV9QQU5FTAo+PiAgCWRlcGVuZHMg
b24gT0YKPj4gIAlzZWxlY3QgRFJNX01JUElfRFNJCj4+ICsJc2VsZWN0IERSTV9LTVNfSEVMUEVS
Cj4+ICsJc2VsZWN0IERSTV9QQU5FTAo+PiAgCWhlbHAKPj4gIAkgIFRvc2hpYmEgVEMzNTg3NjQg
RFNJL0xWRFMgYnJpZGdlIGRyaXZlci4KPj4gIAo+Pgo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gCgpBcHBseWluZyB0byBkcm0tbWlz
Yy1maXhlcwoKVGhhbmtzLApOZWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
