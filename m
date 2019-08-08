Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCC86402
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BBA6E4AD;
	Thu,  8 Aug 2019 14:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4466E4AD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:10:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so2578366wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 07:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6m6gxn9LKSOYIOC2UD+jJL1y8rpnk5zVAEhh5s4nAFQ=;
 b=X/iJ+C1XyaWzKqulace7AfTvJP//qTsC9MhZ1qQ1vJSinxlKdeTCuheAWs6S0moJkF
 D0xD2iD8/nQb5l3S3R9U/xiEjFUuhbJFFno5KIItmciiFFDJTRp29OhRitKDZnRcL7SN
 LD+IpEyVuBFH+6G6QsmYJ8EO4+RJJADQGSgegnM8leCDHAPdPa8vxSQlzS2W1Whx5lgU
 z2EbIiQ/KAGYYSBVupOsIKkY5N0q3DqoC9fhxLqvFDa86j1B8Br9oa1WdatM4C+wkuj5
 SPHfRylQhS3trkEChDa9ATLR93cRzMJrs2teiXsCOei6ecGL5EMhv3bHKNOEt1Flot4i
 F49A==
X-Gm-Message-State: APjAAAWeTUyhJuraa3ASm0JDwfC0Wx7MPUfw44WidS55RoLwIu2uvuWR
 GID5fFBX4bkaRnYS7CIl87Eu9g==
X-Google-Smtp-Source: APXvYqxLmc+sO7xMowb+RJSTyP1ooEMxclBETMdjl+uhSXebVMMNRcyl52c80GhEl3LNchoUK+Iomg==
X-Received: by 2002:a1c:407:: with SMTP id 7mr4952733wme.113.1565273450023;
 Thu, 08 Aug 2019 07:10:50 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a19sm9860294wra.2.2019.08.08.07.10.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:10:49 -0700 (PDT)
Subject: Re: [PATCH 8/9] drm: meson: add macro used to enable HDMI PLL
To: Kevin Hilman <khilman@baylibre.com>, 86zhm782g5.fsf@baylibre.com
References: <86zhm782g5.fsf@baylibre.com> <86o92n82e1.fsf@baylibre.com>
 <7hwohawoxu.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <33b9572f-59cc-a72b-c517-e85df70e3f96@baylibre.com>
Date: Thu, 8 Aug 2019 16:10:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7hwohawoxu.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6m6gxn9LKSOYIOC2UD+jJL1y8rpnk5zVAEhh5s4nAFQ=;
 b=bbMMDKltdkMddpB7ydaPuad3hSghabEIOlx/v1qAcXV70ngjxy16ZQkEkvLXiT39n7
 wKYWuU+t8/gj0JNpUlZdoAtk6fOvur0TPrgmRY0zwB8WjzZ5q8E3T/f87z0B6DZJwj2N
 Z7WGCb48mP352I8GvNi2cphG0BHWtVhpCDXOsXkRNzWTFj8iwITbfhp4LvhNjmfHfL3R
 GLRRaZQbtBFB0OfkI6nScUoLJxBpWE1wia99gm1IgGRCN4ZXMB8nuEyf0CCvLU2pEXAa
 gp2i2hYq/2t8Q0vKgAjSM8UABP3TtajVVifwRDFZDicJke1ipHVEPiWcibzH5QZTwcKh
 8+Yw==
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDYvMjAxOSAwMToyMCwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IEp1bGllbiBNYXNzb24g
PGptYXNzb25AYmF5bGlicmUuY29tPiB3cml0ZXM6Cj4gCj4+IFRoaXMgcGF0Y2ggYWRkIG5ldyBt
YWNybyBISElfSERNSV9QTExfQ05UTF9FTiB3aGljaCBpcyB1c2VkIHRvIGVuYWJsZQo+PiBIRE1J
IFBMTC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE1hc3NvbiA8am1hc3NvbkBiYXlsaWJy
ZS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyB8IDMg
KystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jIGIvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwo+PiBpbmRleCBlN2MyYjQzOWQwZjcuLmJl
NmUxNTJmYzc1YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3Zj
bGsuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCj4+IEBAIC05
Niw2ICs5Niw3IEBACj4+ICAjZGVmaW5lIEhISV9WREFDX0NOVEwxCQkweDJGOCAvKiAweGJlIG9m
ZnNldCBpbiBkYXRhIHNoZWV0ICovCj4+ICAKPj4gICNkZWZpbmUgSEhJX0hETUlfUExMX0NOVEwJ
MHgzMjAgLyogMHhjOCBvZmZzZXQgaW4gZGF0YSBzaGVldCAqLwo+PiArI2RlZmluZSBISElfSERN
SV9QTExfQ05UTF9FTglCSVQoMzApCj4+ICAjZGVmaW5lIEhISV9IRE1JX1BMTF9DTlRMMgkweDMy
NCAvKiAweGM5IG9mZnNldCBpbiBkYXRhIHNoZWV0ICovCj4+ICAjZGVmaW5lIEhISV9IRE1JX1BM
TF9DTlRMMwkweDMyOCAvKiAweGNhIG9mZnNldCBpbiBkYXRhIHNoZWV0ICovCj4+ICAjZGVmaW5l
IEhISV9IRE1JX1BMTF9DTlRMNAkweDMyQyAvKiAweGNiIG9mZnNldCBpbiBkYXRhIHNoZWV0ICov
Cj4+IEBAIC00NjgsNyArNDY5LDcgQEAgdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0
cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAo+PiAgCj4+ICAJCS8qIEVuYWJs
ZSBhbmQgdW5yZXNldCAqLwo+PiAgCQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+aGhpLCBISElf
SERNSV9QTExfQ05UTCwKPj4gLQkJCQkgICAweDcgPDwgMjgsIDB4NCA8PCAyOCk7Cj4+ICsJCQkJ
ICAgMHg3IDw8IDI4LCBISElfSERNSV9QTExfQ05UTF9FTik7CgpJJ2xsIGRvIGEgcGFzcyBvbiB0
aGUgUExMIHBhcnQgc2luY2UgaXQgbmVlZHMgbXVjaCBtb3JlIHdvcmsgdGhhbiBhIGNsZWFudXAs
Cml0J3Mgb2sgZm9yIG1lLgoKTmVpbAoKPiAKPiBzdGlsbCB1c2luZyBhIG1hZ2ljIGNvbnN0IGZv
ciB0aGUgbWFzay4gIENhbiB1c2UgR0VOTUFTSygpIGZvciB0aGlzPwo+IAo+IEtldmluCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
