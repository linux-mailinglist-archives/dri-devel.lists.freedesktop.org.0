Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8445658E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 11:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD56E342;
	Wed, 26 Jun 2019 09:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1E06E334
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 09:16:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so1784313wre.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 02:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0lexb+9ELj8cXRsSAP5xJ5XziclRZjFkNRGtPNltonQ=;
 b=fgBwdlhtgITD6UW4fkYvwZfNQAo/aSPLGNmAHlGpMrJ9pneJsU7w924G0VO2vja3AD
 S8v45bIpre3/SOWIbrYYWz7gfEta0Eu0WRRH9poxIXCON86SHEQLEsTdtGopxruWL9Dw
 l0CUglmYi5pp+TJnVNV9/uvz/OpyCPdjkWAD7SXCzI9ulVfxtIzQ/oCHa1D1dED8t0HL
 /RuDkE6vavVu74nQh739bBArHEy0JrB6dsa5n8TxSw9bzmF/bkdR2pI5ZBVUJdwu1djp
 pnKDfjhCuuzoy3GVDJE8pbT/N6vySPIis0W7yg1r0lvMB4sPIZ6yLcVANBSnem/96TD3
 Aj6g==
X-Gm-Message-State: APjAAAWTNFZ64/qGqiVHDSqGErzZq2yZ1HCu3RQmERmcijSU+Yw41YQ3
 8DFIO6fn7W646Q/8sh9F/kPLWQ==
X-Google-Smtp-Source: APXvYqwDRdft9Y5lQZvIG49DbvknV0O6Gwx+IjCJkF9bawSOCK3wELB7PDXKCzH9aAfhNRPnfUVmig==
X-Received: by 2002:adf:ec49:: with SMTP id w9mr2548979wrn.303.1561540597500; 
 Wed, 26 Jun 2019 02:16:37 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j189sm1726715wmb.48.2019.06.26.02.16.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 02:16:36 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/meson: Enable DRM InfoFrame support on GXL, GXM
 and G12A
To: Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <CGME20190526212026epcas3p3ef1bafa97e5da9dac02b26fa0a375c80@epcas3p3.samsung.com>
 <VI1PR03MB4206A326130A81DCBAA62CE8AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <bdc1746a-5829-9991-6f1c-d66f03c95d77@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <43cc7bec-e624-f690-8869-a00d26abd7c4@baylibre.com>
Date: Wed, 26 Jun 2019 11:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bdc1746a-5829-9991-6f1c-d66f03c95d77@samsung.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0lexb+9ELj8cXRsSAP5xJ5XziclRZjFkNRGtPNltonQ=;
 b=szJWlS724CXUSSyr2+6CkRRey8twYt7DwTW+OQ98PFf41ZTJHJN0FmWnrSZK+d2wmc
 FYfaOA9QnFpb9us7YNMOW1rXqkIwQ//zM3mbP9GKwjO6bHMvv7uoVI665w0EjWWt+sh2
 pe+iwacmiHmu6j4y+hlB7i2ewUDTDRtcoinvy2twRiPDLVbHfl55eAfoPxZZl+iepbj/
 4BFiBhtRSBv/SJKIlLIGk6xflbkrWD9+dpV3EgFsQuDpVLP4phJHVwpTVptEMFxV/K/N
 2OCDwg4m5qepbHnnOtFsZO7j0/s2iFiGM/6LozIVMWQ72PIMZ6PSUSGuEaRIBEOcD8OL
 IruA==
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQvMDYvMjAxOSAxNjo1OSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAyNi4wNS4yMDE5
IDIzOjIwLCBKb25hcyBLYXJsbWFuIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGVuYWJsZXMgRHluYW1p
YyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBvbiBHWEwsIEdYTSBhbmQgRzEyQS4KPj4K
Pj4gQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+PiAtLS0KPj4gIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgfCA1ICsrKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hk
bWkuYwo+PiBpbmRleCBkZjNmOWRkZDIyMzQuLmY3NzYxZTY5OGMwMyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4+IEBAIC05NjYsNiArOTY2LDExIEBAIHN0YXRp
YyBpbnQgbWVzb25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLAo+PiAgCWR3X3BsYXRfZGF0YS0+aW5wdXRfYnVzX2Zvcm1hdCA9IE1FRElBX0JV
U19GTVRfWVVWOF8xWDI0Owo+PiAgCWR3X3BsYXRfZGF0YS0+aW5wdXRfYnVzX2VuY29kaW5nID0g
VjRMMl9ZQ0JDUl9FTkNfNzA5Owo+PiAgCj4+ICsJaWYgKGR3X2hkbWlfaXNfY29tcGF0aWJsZSht
ZXNvbl9kd19oZG1pLCAiYW1sb2dpYyxtZXNvbi1neGwtZHctaGRtaSIpIHx8Cj4+ICsJICAgIGR3
X2hkbWlfaXNfY29tcGF0aWJsZShtZXNvbl9kd19oZG1pLCAiYW1sb2dpYyxtZXNvbi1neG0tZHct
aGRtaSIpIHx8Cj4+ICsJICAgIGR3X2hkbWlfaXNfY29tcGF0aWJsZShtZXNvbl9kd19oZG1pLCAi
YW1sb2dpYyxtZXNvbi1nMTJhLWR3LWhkbWkiKSkKPj4gKwkJZHdfcGxhdF9kYXRhLT5kcm1faW5m
b2ZyYW1lID0gdHJ1ZTsKPj4gKwo+IAo+IAo+IEkgc2VlIGl0IGZvbGxvd3MgbWVzb25fZHdfaGRt
aS5jIHByYWN0aWNlcywgYnV0IG1heWJlIGl0IGlzIHRpbWUgdG8gZHJvcAo+IGl0IGFuZCBqdXN0
IGFkZCBmbGFnIHRvIG1lc29uX2R3X2hkbWlfZGF0YSwgSU1PIHRoZSB3aG9sZQo+IGR3X2hkbWlf
aXNfY29tcGF0aWJsZSBmdW5jdGlvbiBzaG91bGQgYmUgcmVtb3ZlZAo+IAo+IGFuZCByZXBsYWNl
ZCB3aXRoIGZpZWxkcy9mbGFncyBpbiBtZXNvbl9kd19oZG1pX2RhdGEgLSB0aGlzIGlzIHdoYXQK
PiBvZl9kZXZpY2VfaWQuZGF0YSBmaWVsZCB3YXMgY3JlYXRlZCBmb3IuCgpJdCdzIGluIG91ciBj
bGVhbnVwIHByb2Nlc3MsIHRoaXMgd2lsbCBwdXNoZWQgc2hvcnRseSwgYnV0IGluIHRoZSBtZWFu
dGltZSBpdApjYW4gYmUgbGVmdCBhcy1pcyB1bnRpbCBjbGVhbnVwIGlzIHB1c2hlZCwgSSdsbCBz
b3J0IGl0IG1hbnVhbGx5IGlmIGJvdGgKaGFwcGVucyBpbiB0aGUgc2FtZSB0aW1lLgoKTmVpbAoK
PiAKPiAKPiBSZWdhcmRzCj4gCj4gQW5kcnplago+IAo+IAo+PiAgCXBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIG1lc29uX2R3X2hkbWkpOwo+PiAgCj4+ICAJbWVzb25fZHdfaGRtaS0+aGRtaSA9
IGR3X2hkbWlfYmluZChwZGV2LCBlbmNvZGVyLAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
