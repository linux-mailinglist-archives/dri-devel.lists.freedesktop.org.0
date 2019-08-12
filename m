Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0489DF7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 14:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6278984E;
	Mon, 12 Aug 2019 12:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0030890AD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:19:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u25so11557129wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QzvoEjhOABUcQi/WNvsqmRMdk9cT0mKET1cKTlCQ0dc=;
 b=kmTc+tInDdeoL37f1ijPuOjsdmrmRRk+VXKTes49GAQyoFO4e8wAqNfRwhfXCw0cIU
 Y1UgCUszgFZj0aY7dYEuSCSGwnVa9PNYPCOM82hv3Kd/6wtoKDZUUVFYleP3rWLyahgX
 UCOD9puZegvSctL7kFuGgBBO4OSEJXQbUFcxeeWIGwxGKeWNKdfC+hpLH/2mJ8Ua3/+v
 6CoMKn6Ol0ONiVA4IV1G6dLJ4NSCpUu/ckoxMPyGWWboZGTzzy9mUGs1cyhK/zFX88j3
 PjnvDceC02zh0BvIR6ZQTHpb0t3HlWr8aZAfzfn7Xq1TK7a+mHOmUf5SPmMUA1whcr8g
 sKJQ==
X-Gm-Message-State: APjAAAXTnPGgAcaqa0nFxF4GQmUicPrc9kQ9gNtFUcLCz8S6D9zkStqq
 LL7sO7B5+H8WPiGi9R/vLbLgjMvtqF+epA==
X-Google-Smtp-Source: APXvYqyVyd2gfXVwbNZaX+jetvnrTPK6nz7U8xSKrv5PXMKt7YJrrxgbiPSG6h1JpLnczJdSR7+Yyg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr27659881wmk.79.1565612366823; 
 Mon, 12 Aug 2019 05:19:26 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n14sm207296511wra.75.2019.08.12.05.19.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 05:19:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/8] drm/bridge: dw-hdmi: improve i2s support
To: Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <408dffda-fb9c-5f57-4f7b-404437359a69@baylibre.com>
Date: Mon, 12 Aug 2019 14:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QzvoEjhOABUcQi/WNvsqmRMdk9cT0mKET1cKTlCQ0dc=;
 b=JcxaLyGlhbrJy/GUCkgGPoXZpSYYRFffjqp/pR9XdLIqY2KUbDj2WsF661IScFHmQ+
 vKfhxZ6C+yYgT+jh5LnQxPfKZV9AkkNYUOf8KI5/tkWQXUf6pAsiBQW4bBXYDe0T7zUo
 sg5n/+gyhyzNWsjP8r21Ai5Pgdc12Wh5qPZ1h3hMibMWutxnn6sv3EgulHXsJH16lCTM
 OhhTb7T6+0CqIq5nAbwh0zNBASwRY1ZhIZr/YtFXEbsAI7ZAfVUSWE6V0clR3EtFp8KY
 HXIKbFizeGquSSwXV06NBjNZPebO1ZRO1GrO+5gvU3//SkTmoSrAz2BMapTrcoVJUlKD
 VPJA==
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMi8wOC8yMDE5IDE0OjA3LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFRoZSBwdXJw
b3NlIG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gaW1wcm92ZSB0aGUgc3VwcG9ydCBvZiB0aGUgaTJz
Cj4gaW50ZXJmYWNlIG9mIHRoZSBzeW5vcHN5cyBoZG1pIGNvbnRyb2xsZXIuCj4gCj4gT25jZSBh
cHBsaWVkLCB0aGUgaW50ZXJmYWNlIHNob3VsZCBzdXBwb3J0IGFsbCB0aGUgdXN1YWwgaTJzIGJ1
cyBmb3JtYXRzLAo+IDggY2hhbm5lbHMgcGxheWJhY2sgYW5kIHByb3Blcmx5IHNldHVwIHRoZSBj
aGFubmVsIG51bWJlciBhbmQgYWxsb2NhdGlvbgo+IGluIHRoZSBpbmZvZnJhbWVzLgo+IAo+IEFs
c28sIHRoZSBkdy1oZG1pIGkycyBpbnRlcmZhY2Ugd2lsbCBub3cgcHJvdmlkZSB0aGUgZWxkIHRv
IHRoZSBnZW5lcmljCj4gaGRtaS1jb2RlYyBzbyBpdCBjYW4gZXhwb3NlIHRoZSByZWxhdGVkIGNv
bnRyb2xzIHRvIHVzZXIgc3BhY2UuCj4gCj4gVGhpcyB3b3JrIHdhcyBpbnNwaXJlZCBieSBKb25h
cyBLYXJsbWFuJ3Mgd29yaywgYXZhaWxhYmxlIGhlcmUgWzBdLgo+IAo+IFRoaXMgd2FzIHRlc3Rl
ZCB0aGUgQW1sb2dpYyBtZXNvbi1nMTJhLXNlaTUxMCBwbGF0Zm9ybS4KPiBGb3IgdGhpcyBzcGVj
aWZpYyBwbGF0Zm9ybSwgd2hpY2ggdXNlcyBjb2RlYzJjb2RlYyBsaW5rcywgdGhlcmUgaXMgYQo+
IHJ1bnRpbWUgZGVwZW5kZW5jeSBmb3IgcGF0Y2ggOCBvbiB0aGlzIEFTb0Mgc2VyaWVzIFsxXS4K
PiAKPiBDaGFuZ2VzIHNpbmNlIHYxIFsyXToKPiAgKiBGaXggY29weSBzaXplIGluIC5nZXRfZWxk
KCkKPiAKPiBbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vbGludXgtcm9ja2NoaXAvY29t
bWl0cy9yb2NrY2hpcC01LjItZm9yLWxpYnJlZWxlYy12NS4yLjMKPiBbMV06IGh0dHBzOi8vbGtt
bC5rZXJuZWwub3JnL3IvMjAxOTA3MjUxNjU5NDkuMjk2OTktMS1qYnJ1bmV0QGJheWxpYnJlLmNv
bQo+IFsyXTogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDgwNTEzNDEwMi4yNDE3My0x
LWpicnVuZXRAYmF5bGlicmUuY29tCj4gCj4gSmVyb21lIEJydW5ldCAoOCk6Cj4gICBkcm0vYnJp
ZGdlOiBkdy1oZG1pLWkyczogc3VwcG9ydCBtb3JlIGkycyBmb3JtYXQKPiAgIGRybS9icmlkZ2U6
IGR3LWhkbWk6IG1vdmUgYXVkaW8gY2hhbm5lbCBzZXR1cCBvdXQgb2YgYWhiCj4gICBkcm0vYnJp
ZGdlOiBkdy1oZG1pOiBzZXQgY2hhbm5lbCBjb3VudCBpbiB0aGUgaW5mb2ZyYW1lcwo+ICAgZHJt
L2JyaWRnZTogZHctaGRtaS1pMnM6IGVuYWJsZSBscGNtIG11bHRpIGNoYW5uZWxzCj4gICBkcm0v
YnJpZGdlOiBkdy1oZG1pLWkyczogc2V0IHRoZSBjaGFubmVsIGFsbG9jYXRpb24KPiAgIGRybS9i
cmlkZ2U6IGR3LWhkbWktaTJzOiByZXNldCBhdWRpbyBmaWZvIGJlZm9yZSBhcHBseWluZyBuZXcg
cGFyYW1zCj4gICBkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogZW5hYmxlIG9ubHkgdGhlIHJlcXVp
cmVkIGkycyBsYW5lcwo+ICAgZHJtL2JyaWRnZTogZHctaGRtaS1pMnM6IGFkZCAuZ2V0X2VsZCBz
dXBwb3J0CgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgoKSm9uYXMsIGlzIHBhdGNoIDggb2sgZm9yIHlvdSBub3cgPyBJZiB5ZXMgSSdsbCBhcHBs
eSB0aGVtIHRvIGRybS1taXNjLW5leHQuCgpOZWlsCgo+IAo+ICAuLi4vZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWFoYi1hdWRpby5jICAgfCAyMCArKy0tLS0tCj4gIC4uLi9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLWF1ZGlvLmggICB8ICAxICsKPiAgLi4uL2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgNjAgKysrKysrKysrKysrKysrKystLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAzNyArKysr
KysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggICAg
IHwgMTMgKysrLQo+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICAg
ICAgfCAgMiArCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDI1IGRlbGV0
aW9ucygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
