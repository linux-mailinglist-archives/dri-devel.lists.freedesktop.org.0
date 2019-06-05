Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D197D35D63
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 14:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A437A8936C;
	Wed,  5 Jun 2019 12:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32A18936C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:59:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 22so2195265wmg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 05:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+hIy5lz3bZE6/4kzO9THbc36Q37XAualXeaWZ2EfADA=;
 b=aKiqeBc+pn8uuLKi9MUZPmybdq2HyG9uLRVhQ0NltOvZba8eTgrFX5wl2lGkrPdMU5
 s7y8f45jtuSd0R5Jr16WsHj2ipV0Ed0jBVPp5CA4LWeAkWaS1rALOAZjcWW+ARuUt/qu
 SUoj4jla9tJRUiTn+MiM06GHNqKhJ1n5s/w2GrMBQ5hzP+D8FbA3qJjnL2JRPDMlO1YO
 ydQ/BqWBlGxFE/fQlmMpTBxo9ebEHX8DP3lzFxjQigl0R16jfGvHbixVnil5Dj5Jo+Py
 YeHNaVkwIu7ZAgVKPQMStCiQaG99DB7tCDMU5CbZ2xsJRrq6sOGvfyt0qcXvQIs0xiCJ
 DqfQ==
X-Gm-Message-State: APjAAAUxkkyzOi2On7ARW3RZYYWvpSWctGOiY32SCiDr1dhKbCQnII3a
 WavBZGeyXpEppUyIXSYel6//lg==
X-Google-Smtp-Source: APXvYqwdZDOCXe1vp00morQ7HQ4vgg8AuSLfNqYZs+v50KZbkBiR5LoZf5WJovfE26zO7Cz702XaOA==
X-Received: by 2002:a05:600c:c4:: with SMTP id
 u4mr10619368wmm.96.1559739564243; 
 Wed, 05 Jun 2019 05:59:24 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e7sm3610569wmd.0.2019.06.05.05.59.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 05:59:23 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/bridge: dw-hdmi: allow ycbcr420 modes for >=
 0x200a
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <CGME20190520133802epcas3p3e8d19d3c79e027362ac1e4cc3c09c10f@epcas3p3.samsung.com>
 <20190520133753.23871-2-narmstrong@baylibre.com>
 <020c82bc-15fd-6e23-a093-62abfa9b466d@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <956ecdbd-2ea3-6dc9-d2fa-dbba797dddc0@baylibre.com>
Date: Wed, 5 Jun 2019 14:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <020c82bc-15fd-6e23-a093-62abfa9b466d@samsung.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+hIy5lz3bZE6/4kzO9THbc36Q37XAualXeaWZ2EfADA=;
 b=yaFsxj8cVltdMdMOm4VNDMwGqqVbV6ErdfwbnPTJBtqUaQbZD8Im/B8ofS6ylkFu7F
 BAIdnPGR73fkkg7hvy9dBA0QI3PsYzJim/+FaSnIfBnV7ImTnlwP/aa+D6ETrRebMYum
 p7N9/qJHNLmRQYu+uouQbI7SQy7VJ5WUFg6YuZDTPj2LBRoWtp9mGfKyXxoYn339p5B2
 MrYkChuKavCyNmLZiiPSbNWr7BG8/3f/6sAiRP6uvJRug3iW2uU4JOnz+wA1n9tjU1Py
 edH4RlRkFUUziKsl3PAiYw52XGeU3rCJCc4m3MRiCfkVcBbubQNZ+OFCcnQeoWfFWwNs
 2YQA==
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, maxime.ripard@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 hverkuil@xs4all.nl, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDUvMjAxOSAwODowNywgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAyMC4wNS4yMDE5
IDE1OjM3LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gTm93IHRoZSBEVy1IRE1JIENvbnRyb2xs
ZXIgc3VwcG9ydHMgdGhlIEhETUkyLjAgbW9kZXMsIGVuYWJsZSBzdXBwb3J0Cj4+IGZvciB0aGVz
ZSBtb2RlcyBpbiB0aGUgY29ubmVjdG9yIGlmIHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyB0aGVtLgo+
PiBXZSBsaW1pdCB0aGVzZSBtb2RlcyB0byBEVy1IRE1JIElQIHZlcnNpb24gPj0gMHgyMDBhIHdo
aWNoCj4+IGFyZSBkZXNpZ25lZCB0byBzdXBwb3J0IEhETUkyLjAgZGlzcGxheSBtb2Rlcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
Pgo+PiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4+IC0tLQo+
PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA2ICsrKysrKwo+
PiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgfCAxICsKPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCj4+IGluZGV4IGFiNzk2OGM4ZjZhMi4uYjUwYzQ5Y2FmN2Fl
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+PiBA
QCAtMjYyOSw2ICsyNjI5LDEyIEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LAo+PiAgCWlmIChoZG1pLT5waHkub3BzLT5zZXR1cF9ocGQpCj4+ICAJCWhkbWkt
PnBoeS5vcHMtPnNldHVwX2hwZChoZG1pLCBoZG1pLT5waHkuZGF0YSk7Cj4+ICAKPj4gKwlpZiAo
aGRtaS0+dmVyc2lvbiA+PSAweDIwMGEpCj4+ICsJCWhkbWktPmNvbm5lY3Rvci55Y2Jjcl80MjBf
YWxsb3dlZCA9Cj4+ICsJCQloZG1pLT5wbGF0X2RhdGEtPnljYmNyXzQyMF9hbGxvd2VkOwo+PiAr
CWVsc2UKPj4gKwkJaGRtaS0+Y29ubmVjdG9yLnljYmNyXzQyMF9hbGxvd2VkID0gZmFsc2U7Cj4+
ICsKPiAKPiAKPiBJIHN1c3BlY3QgZWxzZSBjbGF1c2UgY2FuIGJlIGRyb3BwZWQuCgpZb3UgYXJl
IHJpZ2h0LCB0aGFua3MgZm9yIHRoZSByZXZpZXcuCgpEbyB5b3UgaGF2ZSBjb21tZW50cyBvbiB0
aGUgcGF0Y2hlcyAyLCAzICYgNCBvZiBzZXJpZSA/CgpUaGFua3MsCk5laWwKCj4gCj4gQmVzaWRl
IHRoaXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+Cj4gCj4gwqAtLQo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4gCj4+ICAJbWVtc2V0KCZwZGV2
aW5mbywgMCwgc2l6ZW9mKHBkZXZpbmZvKSk7Cj4+ICAJcGRldmluZm8ucGFyZW50ID0gZGV2Owo+
PiAgCXBkZXZpbmZvLmlkID0gUExBVEZPUk1fREVWSURfQVVUTzsKPj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5o
Cj4+IGluZGV4IDY2ZTcwNzcwY2NlNS4uMGYwZTgyNjM4ZmJlIDEwMDY0NAo+PiAtLS0gYS9pbmNs
dWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19o
ZG1pLmgKPj4gQEAgLTEzMCw2ICsxMzAsNyBAQCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgewo+
PiAgCQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4+ICAJdW5z
aWduZWQgbG9uZyBpbnB1dF9idXNfZm9ybWF0Owo+PiAgCXVuc2lnbmVkIGxvbmcgaW5wdXRfYnVz
X2VuY29kaW5nOwo+PiArCWJvb2wgeWNiY3JfNDIwX2FsbG93ZWQ7Cj4+ICAKPj4gIAkvKiBWZW5k
b3IgUEhZIHN1cHBvcnQgKi8KPj4gIAljb25zdCBzdHJ1Y3QgZHdfaGRtaV9waHlfb3BzICpwaHlf
b3BzOwo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
