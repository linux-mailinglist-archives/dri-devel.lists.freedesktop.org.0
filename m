Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D090A9E55C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 12:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8A8996F;
	Tue, 27 Aug 2019 10:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406FD8996F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 10:08:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so2389062wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 03:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rtjwDU5qcv28MMp78xkTBLMUS41bKQ40q7Db+jhHAzE=;
 b=nKOp1Dd2jhzQfL2Mw1TD+TOjWzEhOvQz7JJAw4EWMKSEvR3uxHMxdd02faiCYrMy65
 hi73oabMVURdO4P5Er9Q4KmXcv+FDSjtioL15Q16YR0aFD3YNMOAPaAtmLEL4+DgHaRK
 uiKW3u1p5d4ocHV6BTFL9FxmGETNbtT38Ps57o1wOayCveBjzIUL14FD+E7inDq6MOQ5
 xMQymMw8cmgeRPw9KG592Uk70D2c8xrMe8ZlqI9K5l0/1C6WwsTvYvL6ys8Zv/j8Y9WQ
 Wvk4YhfoZ+ocjsTVxDJGKpg5egnml7bUegew+KCn9T1mWOa30ArEY6PzFMS5dIGTMoVm
 SjJg==
X-Gm-Message-State: APjAAAVolAlZjtQNTrsekkZH7AC65iGIKR3y06b/Pv9/C6Tx42v5MSNq
 LdJ6/EmOqfdlgDw/CbLKsAI05A==
X-Google-Smtp-Source: APXvYqxPbJE239TGw9j2Hv1Rcc2YynYi24ykLKO7u5gl1ISSXBj22e8eEKFojGjaEee4xoPJQyxqYQ==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr26754788wmf.47.1566900478640; 
 Tue, 27 Aug 2019 03:07:58 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n8sm12068644wrw.28.2019.08.27.03.07.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 03:07:58 -0700 (PDT)
Subject: Re: [PATCH RFC v2 3/8] drm/bridge: synopsys: dw-hdmi: add bus format
 negociation
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
 <20190827081425.15011-4-narmstrong@baylibre.com>
 <20190827110356.3bec488b@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c200ac12-6fe7-6d20-8fdf-6629950a71bf@baylibre.com>
Date: Tue, 27 Aug 2019 12:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827110356.3bec488b@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rtjwDU5qcv28MMp78xkTBLMUS41bKQ40q7Db+jhHAzE=;
 b=EItYCrNmPdU7CRo/xIQ8vt8XQmyJcPLaHg+luHT4hOpz0g7nXTtqMulGa/qMLDc/Zj
 cB1vxIIvhv55s2EDDiPX0TScLIz23KBA/w/x08Mm3H/+HiSkFpEaI/d54LnuAHevAJEH
 1SSfsKJJlb+EQX0A3Muk29Lgo+JgCGcCGs3Flg0atL2Ff6cYw8Nh2bO43/CURAWnPFmL
 qiNSS/5Bw8VfR9HrkAgBdA5DCTup7RWdXuDM1FPmmXo1ucpi8iabjjbJW/N9hxsihvQ0
 xD/Kmw9nM/iVIiHaddq2Rd/Qk/7Q25J+BZAZ23Yiz9JOLNPbBrSZZIRL0pgLAoIhG+xv
 WZqA==
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDgvMjAxOSAxMTowMywgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIFR1ZSwgMjcg
QXVnIDIwMTkgMTA6MTQ6MjAgKzAyMDAKPiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+IHdyb3RlOgo+IAo+PiBBZGQgdGhlIGF0b21pY19nZXRfb3V0cHV0X2J1c19mbXRz
LCBhdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzIHRvIG5lZ29jaWF0ZQo+IAo+IAkJCQkJCQkJICAg
Xm5lZ290aWF0ZQo+IAo+PiB0aGUgcG9zc2libGUgb3V0cHV0IGFuZCBpbnB1dCBmb3JtYXRzIGZv
ciB0aGUgY3VycmVudCBtb2RlIGFuZCBtb25pdG9yLAo+PiBhbmQgdXNlIHRoZSBuZWdvY2lhdGVk
IGZvcm1hdHMgaW4gYSBiYXNpYyBhdG9taWNfY2hlY2sgY2FsbGJhY2suCj4gCj4gCSAgICAgIF5u
ZWdvdGlhdGVkCgpJbmRlZWQsIHRoeAoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1z
dHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiAtLS0KPiAKPiAKPj4gIAo+PiArc3Rh
dGljIHZvaWQgZHdfaGRtaV9icmlkZ2VfYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwKPj4gKwkJCQkJc3RydWN0IGRybV9icmlkZ2Vfc3RhdGUgKmJy
aWRnZV9zdGF0ZSwKPj4gKwkJCQkJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAo+
PiArCQkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSwKPj4gKwkJCQkJ
dW5zaWduZWQgaW50ICpudW1fb3V0cHV0X2ZtdHMsCj4+ICsJCQkJCXUzMiAqb3V0cHV0X2ZtdHMp
Cj4+ICt7Cj4+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4gPSBjb25uX3N0YXRlLT5jb25u
ZWN0b3I7Cj4+ICsJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8gPSAmY29ubi0+ZGlzcGxh
eV9pbmZvOwo+PiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlID0gJmNydGNfc3RhdGUt
Pm1vZGU7Cj4+ICsJYm9vbCBpc19oZG1pMl9zaW5rID0gaW5mby0+aGRtaS5zY2RjLnN1cHBvcnRl
ZDsJCj4+ICsJaW50IGkgPSAwOwo+PiArCj4+ICsJLyoKPj4gKwkgKiBJZiB0aGUgY3VycmVudCBt
b2RlIGVuZm9yY2VzIDQ6MjowLCBmb3JjZSB0aGUgb3V0cHV0IGJ1dCBmb3JtYXQKPj4gKwkgKiB0
byA0OjI6MCBhbmQgZG8gbm90IGFkZCB0aGUgWVVWNDIyLzQ0NC9SR0IgZm9ybWF0cwo+PiArCSAq
Lwo+PiArCWlmIChkcm1fbW9kZV9pc180MjBfb25seShpbmZvLCBtb2RlKSB8fAo+PiArCSAgICAo
IWlzX2hkbWkyX3NpbmsgJiYgZHJtX21vZGVfaXNfNDIwX2Fsc28oaW5mbywgbW9kZSkpKSB7Cj4+
ICsKPj4gKwkJLyogT3JkZXIgYnVzIGZvcm1hdHMgZnJvbSAxNmJpdCB0byA4Yml0IGlmIHN1cHBv
cnRlZCAqLwo+PiArCQlpZiAoaW5mby0+YnBjID09IDE2ICYmCj4+ICsJCSAgICAoaW5mby0+aGRt
aS55NDIwX2RjX21vZGVzICYgRFJNX0VESURfWUNCQ1I0MjBfRENfNDgpKSB7Cj4+ICsJCQlpZiAo
b3V0cHV0X2ZtdHMpCj4+ICsJCQkJb3V0cHV0X2ZtdHNbaV0gPSBNRURJQV9CVVNfRk1UX1VZWVZZ
WTE2XzBfNVg0ODsKPj4gKwkJCSsraTsKPj4gKwkJfQo+IAo+IFlvdSBjb3VsZCBwcm9iYWJseSBh
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXI6Cj4gCj4gc3RhdGljIHZvaWQgZHdfaGRtaV9icmlkZ2Vf
YWRkX2ZtdCh1bnNpZ25lZCBpbnQgKm51bV9mbXRzLCB1MzIgKmZtdHMsCj4gCQkJCSAgIHUzMiBu
ZXdfZm10KQo+IHsKPiAJaWYgKGZtdHMpCj4gCQlmbXRzWypudW1fZm10c10gPSBuZXdfZm10Owo+
IAo+IAkoKm51bV9mbXRzKSsrOwo+IH0KPiAKPiB0byBhdm9pZCBkdXBsaWNhdGluZyB0aGUKPiAK
PiAJaWYgKGZtdHMpCj4gCQkuLi4KPiAKPiAJaSsrOwkJCQo+IAo+IGxvZ2ljLgo+IAoKWWVzLCBJ
IHdhcyBwbGFubmluZyB0aGlzLAoKVGhhbmtzLApOZWlsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
