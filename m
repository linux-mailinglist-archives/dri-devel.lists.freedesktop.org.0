Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2392E1B3B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09456E8EC;
	Wed, 23 Dec 2020 10:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82CB6E247
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:39:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b26so25147313lff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AXmwUpuWNJn38cCoFNVuvHMmW9DPfBIkbJHgySbTrrw=;
 b=qhbp83oxkp+XKHpp/ipG3+4cYLILpTA8B3LPXYULko36eEYzEuLQ6PIIkqkjjp8jca
 F8zkjPrGbcKZlopCxg9/W8ccSpILDTeoZDhOs8SqSe0WnuKj1Rg8MkCvV/Y+xPVr4/T2
 bySWKhGFfBl9ztrnVtCscB1PK+uxrauYIT98LJ+e3cnfQGmSp+uOGOrKcGkCDXu53Htd
 FWOlK/EGCABxVZIgoJzsN6DzFDiyMH7NjRPDpJKpl7ACruUSNzwurgEMRHJiOARXRjid
 n3DcfHOJotZPDU/dmSbiZD+2y999MlbTquJMsSHAf8Ia5pGCUqSphvVBwzsiLeVpUkR9
 wzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AXmwUpuWNJn38cCoFNVuvHMmW9DPfBIkbJHgySbTrrw=;
 b=TX3mUzvCc78/+BvcEVz5+nj404Ykej7MxUVBzAJY9KsRYvsxtVab9b0YBQU40Vsht4
 QDoOzbU2W6yYrFwE+bSIsTlKhMV8mS5+DNyTzKyrCHNqPTNaUNpNxo8DdS3GcKxmjAFw
 GYQvOJ53X9L+dhe6UJs2D/WwBAe9q86OJiqHAoAOwN0zR651DHVpzDjJV82J9bwjpYiQ
 ePHJrcr09zd+zpoqPBcGsvweYuH6kaT2les2+x6EaTJz4dnrFHxQSoWIhVLFY7cGH0py
 5Ql/9bql8PRdXO/j3sWOr/inN7Kyb8KybxGod/prrhOnk99Qw0fGJgIkY2xMltMe1UNl
 lT6w==
X-Gm-Message-State: AOAM532V5GtgTyKoqQwozIVH+F78McTqo8J7OPczI9glA3rnYJ5dI0f1
 /DXhwYf8+yXM/99oSsSw/jE=
X-Google-Smtp-Source: ABdhPJyfrGeIpedHRTkfPq2OVXdao1RLts2GM3W0hdHjDi2n640b5Lr3eO6uGqFDdIWm1uuJlaO1/g==
X-Received: by 2002:a19:5e5b:: with SMTP id z27mr9862776lfi.143.1608665965040; 
 Tue, 22 Dec 2020 11:39:25 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id f24sm2769025lfc.231.2020.12.22.11.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:39:24 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
Message-ID: <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
Date: Tue, 22 Dec 2020 22:39:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAyMjoyMSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+PiArCWlmIChJ
U19FUlIob3BwKSkgewo+Pj4gKwkJZGV2X2VycigmZ2VucGQtPmRldiwgImZhaWxlZCB0byBmaW5k
IE9QUCBmb3IgbGV2ZWwgJXU6ICVwZVxuIiwKPj4+ICsJCQlsZXZlbCwgb3BwKTsKPj4+ICsJCXJl
dHVybiBQVFJfRVJSKG9wcCk7Cj4+PiArCX0KPj4+ICsKPj4+ICsJZXJyID0gZGV2X3BtX29wcF9z
ZXRfdm9sdGFnZSgmZ2VucGQtPmRldiwgb3BwKTsKPj4gSUlVQywgeW91IGltcGxlbWVudGVkIHRo
aXMgY2FsbGJhY2sgYmVjYXVzZSB5b3Ugd2FudCB0byB1c2UgdGhlIHZvbHRhZ2UgdHJpcGxldAo+
PiBwcmVzZW50IGluIHRoZSBPUFAgdGFibGUgPwo+Pgo+PiBBbmQgc28geW91IGFyZSBzZXR0aW5n
IHRoZSByZWd1bGF0b3IgKCJwb3dlciIpIGxhdGVyIGluIHRoaXMgcGF0Y2ggPwo+IHllcwo+IAo+
PiBJIGFtIG5vdCBpbiBmYXZvciBvZiBpbXBsZW1lbnRpbmcgdGhpcyByb3V0aW5lLCBhcyBpdCBq
dXN0IGFkZHMgYSB3cmFwcGVyIGFib3ZlCj4+IHRoZSByZWd1bGF0b3IgQVBJLiBXaGF0IHlvdSBz
aG91bGQgYmUgZG9pbmcgcmF0aGVyIGlzIGdldCB0aGUgcmVndWxhdG9yIGJ5Cj4+IHlvdXJzZWxm
IGhlcmUgKGluc3RlYWQgb2YgZGVwZW5kaW5nIG9uIHRoZSBPUFAgY29yZSkuIEFuZCB0aGVuIHlv
dSBjYW4gZG8KPj4gZGV2X3BtX29wcF9nZXRfdm9sdGFnZSgpIGhlcmUgYW5kIHNldCB0aGUgdm9s
dGFnZSB5b3Vyc2VsZi4gWW91IG1heSB3YW50IHRvCj4+IGltcGxlbWVudCBhIHZlcnNpb24gc3Vw
cG9ydGluZyB0cmlwbGV0IGhlcmUgdGhvdWdoIGZvciB0aGUgc2FtZS4KPj4KPj4gQW5kIHlvdSB3
b24ndCByZXF1aXJlIHRoZSBzeW5jIHZlcnNpb24gb2YgdGhlIEFQSSBhcyB3ZWxsIHRoZW4uCj4+
Cj4gVGhhdCdzIHdoYXQgSSBpbml0aWFsbHkgZGlkIGZvciB0aGlzIGRyaXZlci4gSSBkb24ndCBt
aW5kIHRvIHJldmVydCBiYWNrCj4gdG8gdGhlIGluaXRpYWwgdmFyaWFudCBpbiB2MywgaXQgYXBw
ZWFyZWQgdG8gbWUgdGhhdCBpdCB3aWxsIGJlIG5pY2VyCj4gYW5kIGNsZWFuZXIgdG8gaGF2ZSBP
UFAgQVBJIG1hbmFnaW5nIGV2ZXJ5dGhpbmcgaGVyZS4KCkkgZm9yZ290IG9uZSBpbXBvcnRhbnQg
ZGV0YWlsICh3aHkgdGhlIGluaXRpYWwgdmFyaWFudCB3YXNuJ3QgZ29vZCkuLgpPUFAgZW50cmll
cyB0aGF0IGhhdmUgdW5zdXBwb3J0YWJsZSB2b2x0YWdlcyBzaG91bGQgYmUgZmlsdGVyZWQgb3V0
IGFuZApPUFAgY29yZSBwZXJmb3JtcyB0aGUgZmlsdGVyaW5nIG9ubHkgaWYgcmVndWxhdG9yIGlz
IGFzc2lnbmVkIHRvIHRoZSBPUFAKdGFibGUuCgpJZiByZWd1bGF0b3IgaXMgYXNzaWduZWQgdG8g
dGhlIE9QUCB0YWJsZSwgdGhlbiB3ZSBuZWVkIHRvIHVzZSBPUFAgQVBJCmZvciBkcml2aW5nIHRo
ZSByZWd1bGF0b3IsIGhlbmNlIHRoYXQncyB3aHkgSSBhZGRlZApkZXZfcG1fb3BwX3N5bmNfcmVn
dWxhdG9ycygpIGFuZCBkZXZfcG1fb3BwX3NldF92b2x0YWdlKCkuCgpQZXJoYXBzIGl0IHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBhZGQgZGV2X3BtX29wcF9nZXRfcmVndWxhdG9yKCkgdGhhdAp3aWxs
IHJldHVybiB0aGUgT1BQIHRhYmxlIHJlZ3VsYXRvciBpbiBvcmRlciB0byBhbGxvdyBkcml2ZXIg
dG8gdXNlIHRoZQpyZWd1bGF0b3IgZGlyZWN0bHkuIEJ1dCBJJ20gbm90IHN1cmUgd2hldGhlciB0
aGlzIGlzIGEgbXVjaCBiZXR0ZXIKb3B0aW9uIHRoYW4gdGhlIG9wcF9zeW5jX3JlZ3VsYXRvcnMo
KSBhbmQgb3BwX3NldF92b2x0YWdlKCkgQVBJcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
