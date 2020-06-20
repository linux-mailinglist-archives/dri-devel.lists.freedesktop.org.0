Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CFF203054
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4E6E588;
	Mon, 22 Jun 2020 07:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8586E2EC
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 16:18:14 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id o4so7272948lfi.7
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y/B8+Wt8t65HyAHFIvqCHVw/CPSbL5JP5E6zK3iaABQ=;
 b=sdlRvIKhkaKKZTjU3Hr85BxtzEcUie+Z3KoUUKlgApYqjtNyyX/51yd9pc/UOLjIcK
 hej1uV1emdGGYFG5l21iPSkSiVOPTRGWnOCsMsjWYYVuDacDmqkzr35Bb4Lfuird1PCp
 USG1+oG64s8bR6UOHuxYwiJaJQBvUODlSJi+cmIkfpAygnHxhYeEfsBb2COzHCVH/O3h
 /aEu0wTZKiFFlBIqOWZS98UF4baUwPhWI38g6BtUUh1+uH/5GUkR6CL+c1McgBNtZj9E
 Z5FhHfP8Gs+bFwBFNlzziN1F78+Is/EHr8bS35gWFn46NzSyFXfp+c7p83RD45r/FJnf
 oGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y/B8+Wt8t65HyAHFIvqCHVw/CPSbL5JP5E6zK3iaABQ=;
 b=LcnAIpKPEMm5Z+RCAty3+iuTWKjrLs0ZbsVyCkH3F/tBs6YbrGM+YU2oh84kVyMgGn
 Sd6tl7sAm+XpwMzlSz7RmCfek/2qFKBtxK2IssHzdpddLOciocaTiOuZ6W4S8PwYXHst
 alIejRceGrp7a9qVQYO1GYU6KPMP5nz8dxPRmHkWlGjwxnj93NNWiFXpi9WOrGV6BDEJ
 xNy5UCL5v+aTAITxjf1TW3zpKDp3V1hVPMETD+LfCzouOd6bijMOFGHI8Cp2EHoTzQ9i
 Ncy3R15S5tkz4WRM/QuNDseQ9zDgOMB9KTG96F8nE4jEUZZcrSdCFsWzkvPlL4PIzm4D
 4jWw==
X-Gm-Message-State: AOAM533aerigEEDZhkZLvUrlGLYBL8fLs6r3+Nsa3AR+ZPR4JVPRytJm
 bm76OOs5nBtpKpq3m6PlAVQYmG/h
X-Google-Smtp-Source: ABdhPJxC4Ue/7La+Ph2+EqjG4x2knGuQ7LL1+gFoJ+jfuTZGL3POZpxRQSk77anQqyHqi4QWMaYbmw==
X-Received: by 2002:a19:e93:: with SMTP id 141mr4959112lfo.107.1592669892976; 
 Sat, 20 Jun 2020 09:18:12 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id u8sm2158588lff.38.2020.06.20.09.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 09:18:11 -0700 (PDT)
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
 <20200620114934.GB5829@pendragon.ideasonboard.com>
 <ea421084-a91c-bc03-5997-1723075b7cae@gmail.com>
 <20200620143114.GA22329@ravnborg.org>
 <e77a34c1-3e0b-7f30-25d0-a955ec8d8c86@gmail.com>
 <20200620153012.GA22743@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ce053d7d-7458-20a0-4e9e-77f7f99d364b@gmail.com>
Date: Sat, 20 Jun 2020 19:18:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200620153012.GA22743@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAuMDYuMjAyMCAxODozMCwgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5Cj4g
T24gU2F0LCBKdW4gMjAsIDIwMjAgYXQgMDY6MDU6MzdQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+PiAyMC4wNi4yMDIwIDE3OjMxLCBTYW0gUmF2bmJvcmcg0L/QuNGI0LXRgjoKPj4+
IEhpIERtaXRyeQo+Pj4KPj4+Pgo+Pj4+IE9vcHMhIEdvb2QgY2F0Y2ghCj4+PiBZZXAsIHRoYW5r
cyBMYXVyZW50LiBTaG91bGQgaGF2ZSB0YWtlbiBhIGJldHRlciBsb29rIGJlZm9yZSBhcHBseWlu
Zy4KPj4+Cj4+Pj4gSW5kZWVkLCBJIGJsaW5kbHkgc2V0IHRoZSBMVkRTIHR5cGUgdG8gYWxsIHRo
ZXNlCj4+Pj4gcGFuZWxzLiBQbGVhc2UgcmV2ZXJ0IHRoaXMgcGF0Y2gsIEknbGwgZG91YmxlIGNo
ZWNrIGVhY2ggcGFuZWwgYW5kCj4+Pj4gcHJlcGFyZSBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhp
cyBwYXRjaC4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlCj4+Pj4gcmV2aWV3IQo+Pj4KPj4+
IElmIHlvdSBjYW4gcHJlcGFyZSBhIGZpeCB3aXRoaW4gYSBmZXcgZGF5cyB0aGVuIGxldHMgd2Fp
dCBmb3IgdGhhdC4KPj4+IEkgd2lsbCBkbyBhIGJldHRlciByZXZpZXcgbmV4dCB0aW1lLgo+Pgo+
PiBIZWxsbyBTYW0sCj4+Cj4+IEkgc2hvdWxkIGJlIGFibGUgdG8gbWFrZSBpdCBsYXRlciB0b2Rh
eSBvciB0b21vcnJvdy4gQ291bGQgeW91IHBsZWFzZQo+PiBjbGFyaWZ5IHdoYXQgZG8geW91IG1l
YW4gYnkgdGhlIGZpeCwgZG8geW91IHdoYXQgaXQgdG8gYmUgYXMgYW4KPj4gYWRkaXRpb25hbCBw
YXRjaCBvbiB0b3Agb2YgdGhlIGFwcGxpZWQgb25lIG9yIGEgbmV3IHZlcnNpb24gb2YgdGhlIHBh
dGNoPwo+IEFuIGFkZGl0aW9uYWwgcGF0Y2ggb24gdG9wIG9mIHRoZSBvbmUgYXBwbGllZC4KPiBJ
dCBzaGFsbCBjYXJyeSBhIHByb3BlciBmaXhlczogdGFnIGxpa2UgdGhpczoKPiAKPiBGaXhlczog
OTRmMDc5MTdlYmU4ICgiZHJtL3BhbmVsLXNpbXBsZTogQWRkIG1pc3NpbmcgY29ubmVjdG9yIHR5
cGUgZm9yIHNvbWUgcGFuZWxzIikKPiBDYzogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkg
UmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKCk9rYXkhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
