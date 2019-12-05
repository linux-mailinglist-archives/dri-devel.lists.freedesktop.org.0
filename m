Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BC114097
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 13:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4996F890;
	Thu,  5 Dec 2019 12:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A166F890
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 12:10:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so3269445wrh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 04:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k5raftCwv2fssvfaU4GjqCmMNR1i/Q8dMKfkBO6rRNU=;
 b=knavXr6fntWLawBHZn/7yGxLqUVNKcyZ2Mn07PQj1OxSJ15Rs3lHmB0jFcCeYW0eUY
 JKwQvALo5a4epfCCuqM+KDB6zJwZ/vca6ZD4llqz5RXL39ZbKE8IDtT5+TgChiUg6OY9
 xyLf40SEQEMz6H3PZv4Rgk4UDeRe55I73XuW5Mzl8bX0pj2tBXVbaKjwNo1ROii4CFpY
 o5Ol191qgceVQ55jaK/RuPkInpEBD2lOE1wdMmljbaG0eaS2eoJruZkXZUIsZc7B0QG8
 pca5C4IOXxtVvTepjV2mmRh6KZfld9P4mt7vkxEXJgcjxhze4k1i9FjMSM2CnY+FIuDo
 VuvA==
X-Gm-Message-State: APjAAAWbvOWWv0aKglCdUJvqLCalaJer0vOQotuDDvAIsNeq9joaIZuQ
 u7kInneHNnrb83P9J3y7gM/+Xg==
X-Google-Smtp-Source: APXvYqw5pPhzdaofaGk+fAvjjdH7e+P9PhVaKIffsu0Hq9C12+mYlrY250dehqmCQJD3brWU2A7Syg==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr10054237wrr.312.1575547838587; 
 Thu, 05 Dec 2019 04:10:38 -0800 (PST)
Received: from [192.168.1.62] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id g25sm1982845wmh.3.2019.12.05.04.10.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2019 04:10:37 -0800 (PST)
Subject: Re: [PATCH v2 12/28] gpu: drm: bridge: sii9234: Use drm_bridge_init()
To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-13-mihail.atanassov@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <a0727a3d-ccc5-7d09-9567-cf7fb68b1240@baylibre.com>
Date: Thu, 5 Dec 2019 13:10:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204114732.28514-13-mihail.atanassov@arm.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k5raftCwv2fssvfaU4GjqCmMNR1i/Q8dMKfkBO6rRNU=;
 b=BJsFmyMqzXLY0TlQ/tfor7BL2zKtxBCeJz3JGx8VZ/ZdzgO4e/b2vNQNCHt1U4K89A
 UY0kp8sbtEECQTKzK7yCvqXEsZJli3oUSogrL25Uo+Cb9/vqrBu4H+v615m6PGsPopky
 nC5TNstMcQOLSD0h7s73JM1Y1EzwTw4TqsM4SoA2SjqhsEL3alZy/y1eHX7TVW45FNOz
 OPMff0pffGC7CyQkPMlUzYT0GRQCc9PQ6M3jHDuIC/Pf7W+wYgkeKFcsR3rBq1KrG7eU
 BILFy5EX42xemNJJhpbe705LXdlQ73gXJ4xVxA1h6QLX47umgftZ6gBYFLZO7vbjxqWK
 vcFQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwNC8xMi8yMDE5IDEyOjQ4LCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlLgo+IAoKV2h5IHRoaXMgcGFydGljdWxhciBvbmUgaGFzICJncHU6IGRy
bTogYnJpZGdlIiB1bmxpa2UgdGhlIG90aGVyIHBhdGNoZXMgb2YgdGhlIHNlcmllID8KCk5laWwK
Cj4gU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0u
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkyMzQuYyB8IDMgKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkyMzQuYwo+IGluZGV4IGY4MWY4MWI3MDUxZi4uYmZkMzgzMmJhYTFhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKPiBAQCAtOTI1LDggKzkyNSw3IEBAIHN0YXRp
YyBpbnQgc2lpOTIzNF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ICAKPiAgCWky
Y19zZXRfY2xpZW50ZGF0YShjbGllbnQsIGN0eCk7Cj4gIAo+IC0JY3R4LT5icmlkZ2UuZnVuY3Mg
PSAmc2lpOTIzNF9icmlkZ2VfZnVuY3M7Cj4gLQljdHgtPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5v
Zl9ub2RlOwo+ICsJZHJtX2JyaWRnZV9pbml0KCZjdHgtPmJyaWRnZSwgZGV2LCAmc2lpOTIzNF9i
cmlkZ2VfZnVuY3MsIE5VTEwsIE5VTEwpOwo+ICAJZHJtX2JyaWRnZV9hZGQoJmN0eC0+YnJpZGdl
KTsKPiAgCj4gIAlzaWk5MjM0X2NhYmxlX2luKGN0eCk7Cj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
