Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E7CB5E9A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 10:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAB26EE3A;
	Wed, 18 Sep 2019 08:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905E86EE3A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:05:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l3so5802765wru.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mkevZOJdirTQP4xQqxJPu+cG5U0Qi6JXJ58oWHiS7jY=;
 b=CtFJu0Qkr8cbbUXBN2rgtBJzahyuMkvFimhd0y4UYUNHbfGYmxFsJXzM6206Bk7soU
 kwfvk06ZM1uIitmrYPc3mNyNmrFIHhl2B9I3Xkovp0fEjD1d/DZfmSlInrz16l/jbM2y
 0CCtPufFa9g+u7NIyA8YnLuwhEYUgNO2mujl2ysmUJxWhivMC1Vun5Fmnj77sGGB1JmD
 InoMhvDcLPQHcYeRZE+xCFkgLOtZ4eomSDUGtOdzsbwFIK044ZHy+KQnx1o8T+j9U9V0
 JkhiJXwiyYDxrjXhUgxqpF/llR1TyvwC/BiteQzjHPu61N+JLrTV5O6oFXjC7WxYSBWE
 h38A==
X-Gm-Message-State: APjAAAWwPEbu1vxsVFXUbZ/cmsJwPL8hrJDJ5L9z16jzVam5qIw52hHm
 7XEB7cjMlrVlZKngJZ3XxvtGiw==
X-Google-Smtp-Source: APXvYqzf+jbiZIZY04a4tatGEYB10DwI4zcoZXZbfMN4ghff6iEVlZJZSSKlnXoFJ1ga6yb2zAh6Dw==
X-Received: by 2002:adf:e603:: with SMTP id p3mr1876527wrm.102.1568793957886; 
 Wed, 18 Sep 2019 01:05:57 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e20sm7998269wrc.34.2019.09.18.01.05.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Sep 2019 01:05:57 -0700 (PDT)
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
To: Jonas Karlman <jonas@kwiboo.se>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <4bfa909e-eff1-1514-48f0-c5cd9bb612b9@baylibre.com>
Date: Wed, 18 Sep 2019 10:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mkevZOJdirTQP4xQqxJPu+cG5U0Qi6JXJ58oWHiS7jY=;
 b=0oGM72JHBtj4SsrDd+/66QL5WNll1jKgjfuLpSku4r/zFsJb0VR6RPCtmSS7Hzlred
 CLBL75OrUE1z/phSaz4xYbd9r2r19ej6q17CJ6ihZHLHhBMQHLlytDh4DgmtdCjcuBbn
 ifMMud+XjN2goxdpJ2IBvu0y0E8Ig2eZF+GtDMXonGfHO2MljBcFHDSRabBByFC6ebSO
 orfPFczsp4a9d9AUH4uapBEpJ0RyaK1bCzs/Vc6DZkN9uqapU8H4gFRGrln0n9BxruZM
 uG2QC7Oeug6eLsQQze9RFNTD3GdGkljgdDQNmNlECAIVsa+VJJ//lezYdBLhGp4CeP9N
 gJ2Q==
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

SGkgSm9uYXMsCgpPbiAyNi8wNS8yMDE5IDIzOjE4LCBKb25hcyBLYXJsbWFuIHdyb3RlOgo+IEFk
ZCBzdXBwb3J0IGZvciBIRFIgbWV0YWRhdGEgdXNpbmcgdGhlIGhkcl9vdXRwdXRfbWV0YWRhdGEg
Y29ubmVjdG9yIHByb3BlcnR5LAo+IGNvbmZpZ3VyZSBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJp
bmcgSW5mb0ZyYW1lIGFjY29yZGluZ2x5Lgo+IAo+IEEgZHJtX2luZm9mcmFtZSBmbGFnIGlzIGFk
ZGVkIHRvIGR3X2hkbWlfcGxhdF9kYXRhIHRoYXQgcGxhdGZvcm0gZHJpdmVycwo+IGNhbiB1c2Ug
dG8gc2lnbmFsIHdoZW4gRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIGluZm9mcmFtZXMgaXMg
c3VwcG9ydGVkLgo+IFRoaXMgZmxhZyBpcyBuZWVkZWQgYmVjYXVzZSBBbWxvZ2ljIEdYQkIgYW5k
IEdYTCByZXBvcnQgc2FtZSBEVy1IRE1JIHZlcnNpb24sCj4gYW5kIG9ubHkgR1hMIHN1cHBvcnQg
RFJNIEluZm9GcmFtZS4KPiAKPiBUaGUgZmlyc3QgcGF0Y2ggYWRkIGZ1bmN0aW9uYWxpdHkgdG8g
Y29uZmlndXJlIERSTSBJbmZvRnJhbWUgYmFzZWQgb24gdGhlCj4gaGRyX291dHB1dF9tZXRhZGF0
YSBjb25uZWN0b3IgcHJvcGVydHkuCj4gCj4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIHNldHMgdGhl
IGRybV9pbmZvZnJhbWUgZmxhZyBvbiBzb21lIFNvQ3Mgc3VwcG9ydGluZwo+IER5bmFtaWMgUmFu
Z2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUuCj4gCj4gTm90ZSB0aGF0IHRoaXMgd2FzIGJhc2Vk
IG9uIHRvcCBvZiBkcm0tbWlzYy1uZXh0IGFuZCBOZWlsIEFybXN0cm9uZydzCj4gImRybS9tZXNv
bjogQWRkIHN1cHBvcnQgZm9yIEhETUkyLjAgWVVWNDIwIDRrNjAiIHNlcmllcyBhdCBbMV0KCkRv
IHlvdSBwbGFuIHRvIHJlc2VuZCB0aGlzIHNlcmllID8KClRoZSAiZHJtL21lc29uOiBBZGQgc3Vw
cG9ydCBmb3IgSERNSTIuMCBZVVY0MjAgNGs2MCIgc2VyaWUgaXMgbm8gbW9yZQp2YWxpZCB3aXRo
IHRoZSBmb3JtYXQgbmVnb2NpYXRpb24gd29yayBmcm9tIGJvcmlzLCBzbyB5b3Ugc2hvdWxkIHJl
YmFzZQpvbiBkcm0tbWlzYy1uZXh0ICEKClRoYW5rcywKCk5laWwKCj4gCj4gWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTg3MjUvI3JldjIKPiAKPiBKb25hcyBL
YXJsbWFuICg0KToKPiAgIGRybS9icmlkZ2U6IGR3LWhkbWk6IEFkZCBEeW5hbWljIFJhbmdlIGFu
ZCBNYXN0ZXJpbmcgSW5mb0ZyYW1lIHN1cHBvcnQKPiAgIGRybS9yb2NrY2hpcDogRW5hYmxlIERS
TSBJbmZvRnJhbWUgc3VwcG9ydCBvbiBSSzMzMjggYW5kIFJLMzM5OQo+ICAgZHJtL21lc29uOiBF
bmFibGUgRFJNIEluZm9GcmFtZSBzdXBwb3J0IG9uIEdYTCwgR1hNIGFuZCBHMTJBCj4gICBkcm0v
c3VuNGk6IEVuYWJsZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gSDYKPiAKPiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICB8IDEwOSArKysrKysrKysrKysrKysr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCAgIHwgIDM3
ICsrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyAgICAgICB8
ICAgNSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAg
IDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jICAgICAgIHwgICAy
ICsKPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCAgICAgICB8ICAgMSAr
Cj4gIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAgICAgfCAgIDEgKwo+
ICA3IGZpbGVzIGNoYW5nZWQsIDE1NyBpbnNlcnRpb25zKCspCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
