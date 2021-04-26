Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F136B01D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD4C89FA0;
	Mon, 26 Apr 2021 09:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503D189FA0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:00:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so4740544wmy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wK4naeGRGIl4BeVrASMOqtpAgrHp/pNm7sHfLvwF54E=;
 b=PxPgVAAlZnvmzStiU1Z2deNohrwVw0X40mkVaV5Dq++W4KUpFPpjbJRe3083M7Ot+H
 lqshyPaVezPvFlcko9PPpEM044pqnQpU+E/CDNjsZgdrTXaQMxznBiJPMs11EU+ZRXHf
 OYogvGpLKSuQTfe9+y+cSxRXTHYk0kRxwDsWpUMTzInl31/ixU5KS6jBtCBHWyjPgVVC
 bgJg2foLb1QS1nkMelHIiHoeOJ2pAAXt6b6AjnVx7wnKyp2rg45F4dMnVo4K2SY69Zxk
 KErBSB7657iBNUe0wwQ8NrBl9Arwvg8BJV39MCQG6swugUV62CVtmSOppVmy8CTkYgVL
 ApOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wK4naeGRGIl4BeVrASMOqtpAgrHp/pNm7sHfLvwF54E=;
 b=nE7fjLMqP3C77HGAz3hBuIyXnMc7brDs+bOIdrQj14h5vJ22+kLKJiCQn12kZf355F
 zd9bG1SDrl0UZCYpFAsfQ0buTCeKzDzIjiMZBN1LXTM4oZgxAEz3na3wc69/olbXb1IC
 CGR62508rLu4STv5yuOeXTpQu5FlwVZwwmRewtm2YwM341ejsEovfz+sA82ki9Xe0lmy
 smJ4m3yy4ui9H5semmIbPm2SP54JAfQvSYYQJ94lOGqXYHkwI1X64p2WgKzDh5GZtRSQ
 v1y6Jx8mqYzB6d5lhFu/uu3i1m2uqLZMVWBV7vR1W8X6Rpp7+4QPGpjtc5Jnf/L7z1XW
 OumA==
X-Gm-Message-State: AOAM530obgotWJm8szKp3WTfYXfFamFFDf7R+A1LPmg8BLgxDt/7zwoW
 3ls5tSqESC6RNtkboyByJED8RA==
X-Google-Smtp-Source: ABdhPJxPh52ELMKYVm/zy7jHFJaZ7+FE2YzMfYoin2xOlvx6NK/M9aoy18apnORVu6H2+WHFd+k4UA==
X-Received: by 2002:a1c:1bd1:: with SMTP id b200mr7437687wmb.3.1619427598897; 
 Mon, 26 Apr 2021 01:59:58 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id h10sm19945297wrt.40.2021.04.26.01.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 01:59:58 -0700 (PDT)
Subject: Re: [PATCH] drm: bridge: add missing word in Analogix help text
To: Robert Foss <robert.foss@linaro.org>
References: <20210424061817.7339-1-rdunlap@infradead.org>
 <ecbe576f-1a96-a873-3716-6fa478a8269e@baylibre.com>
 <CAG3jFyv1kc3+B6SkVwdV7gNV+HUEWMAjmH8GSXaw8rDcHLadeQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <481c3f44-1686-2c58-29fa-c71fec520ba7@baylibre.com>
Date: Mon, 26 Apr 2021 10:59:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAG3jFyv1kc3+B6SkVwdV7gNV+HUEWMAjmH8GSXaw8rDcHLadeQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Torsten Duwe <duwe@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDQvMjAyMSAwOTo0MiwgUm9iZXJ0IEZvc3Mgd3JvdGU6Cj4gCj4gCj4gT24gTW9uLCBB
cHIgMjYsIDIwMjEsIDA5OjE1IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bSA8bWFpbHRvOm5hcm1zdHJvbmdAYmF5bGlicmUuY29tPj4gd3JvdGU6Cj4gCj4gCj4gCj4gICAg
IExlIDI0LzA0LzIwMjEgw6AgMDg6MTgsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOgo+ICAgICA+
IEluc2VydCBhIG1pc3Npbmcgd29yZCAicG93ZXIiIGluIEtjb25maWcgaGVscCB0ZXh0Lgo+ICAg
ICA+Cj4gICAgID4gRml4ZXM6IDZhYTE5MjY5ODA4OSAoImRybS9icmlkZ2U6IEFkZCBBbmFsb2dp
eCBhbng2MzQ1IHN1cHBvcnQiKQo+ICAgICA+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnIDxtYWlsdG86cmR1bmxhcEBpbmZyYWRlYWQub3JnPj4KPiAg
ICAgPiBDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbSA8bWFpbHRvOmEuaGFq
ZGFAc2Ftc3VuZy5jb20+Pgo+ICAgICA+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20gPG1haWx0bzpuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4+Cj4gICAgID4gQ2M6
IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnIDxtYWlsdG86cm9iZXJ0LmZvc3NA
bGluYXJvLm9yZz4+Cj4gICAgID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZSA8
bWFpbHRvOmFpcmxpZWRAbGludXguaWU+Pgo+ICAgICA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2ggPG1haWx0bzpkYW5pZWxAZmZ3bGwuY2g+Pgo+ICAgICA+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxtYWlsdG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4KPiAgICAgPiBDYzogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvIDxtYWls
dG86aWNlbm93eUBhb3NjLmlvPj4KPiAgICAgPiBDYzogVmFzaWx5IEtob3J1emhpY2sgPGFuYXJz
b3VsQGdtYWlsLmNvbSA8bWFpbHRvOmFuYXJzb3VsQGdtYWlsLmNvbT4+Cj4gICAgID4gQ2M6IFRv
cnN0ZW4gRHV3ZSA8ZHV3ZUBzdXNlLmRlIDxtYWlsdG86ZHV3ZUBzdXNlLmRlPj4KPiAgICAgPiBD
YzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4gICAgID4gLS0tCj4gICAgID7C
oCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgfMKgIMKgIDIgKy0KPiAg
ICAgPsKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICAg
ICA+Cj4gICAgID4gLS0tIGxpbnV4LW5leHQtMjAyMTA0MjMub3JpZy9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKPiAgICAgPiArKysgbGludXgtbmV4dC0yMDIxMDQyMy9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKPiAgICAgPiBAQCAtNiw3ICs2
LDcgQEAgY29uZmlnIERSTV9BTkFMT0dJWF9BTlg2MzQ1Cj4gICAgID7CoCDCoCDCoCDCoHNlbGVj
dCBEUk1fS01TX0hFTFBFUgo+ICAgICA+wqAgwqAgwqAgwqBzZWxlY3QgUkVHTUFQX0kyQwo+ICAg
ICA+wqAgwqAgwqAgwqBoZWxwCj4gICAgID4gLcKgIMKgIMKgIMKgQU5YNjM0NSBpcyBhbiB1bHRy
YS1sb3cgRnVsbC1IRCBEaXNwbGF5UG9ydC9lRFAKPiAgICAgPiArwqAgwqAgwqAgwqBBTlg2MzQ1
IGlzIGFuIHVsdHJhLWxvdyBwb3dlciBGdWxsLUhEIERpc3BsYXlQb3J0L2VEUAo+ICAgICA+wqAg
wqAgwqAgwqAgwqB0cmFuc21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlcy4gVGhl
Cj4gICAgID7CoCDCoCDCoCDCoCDCoEFOWDYzNDUgdHJhbnNmb3JtcyB0aGUgTFZUVEwgUkdCIG91
dHB1dCBvZiBhbgo+ICAgICA+wqAgwqAgwqAgwqAgwqBhcHBsaWNhdGlvbiBwcm9jZXNzb3IgdG8g
ZURQIG9yIERpc3BsYXlQb3J0Lgo+ICAgICA+Cj4gCj4gICAgIFJldmlld2VkLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ3RAYmF5bGlicmUuY29tIDxtYWlsdG86bmFybXN0cm9uZ3RAYmF5
bGlicmUuY29tPj4KPiAKPiAKPiBJIHRoaW5rIGEgdHlwbyBpbiB0aGUgZW1haWwgc251Y2sgaW4g
OykKPiAKCkFoIGFoIGluZGVlZCAhCgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1z
dHJvbmd0QGJheWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
