Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C628B2BA9FD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 13:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9C36E8BB;
	Fri, 20 Nov 2020 12:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3BF6E8BB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 12:18:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so9620981wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 04:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kLpBJn1dhuchvltixhmWPHQw7xkYxRK/FRveUh5W9mQ=;
 b=2EUm/7MOuW0jCMsYxt/j+GuxCYw4h86NluEbXtbLOlqcIk5nnL5PYLT/wBMyr5fb0T
 /WZDTrgaZyrYVj+aXLnqEzzdSxwM0He6W6xKbCJ7cZ9n7596zJ/Kn58Qjza2Z63D6p2F
 xDYmtl2yBwD1e9Ju+PnLGPNCzy+v7YQwFknW2llfUaiWp0HXl2KrMyhkbtabPri015q0
 xUsRhEnrG4uWzfqF8Tmq+SNp94W8EZyMSLKMdDLEmwaUujjiCDF4kHOs9zONXkX3QHmX
 bSqJO9d4GZDG8ZHtgIHMpf0c35+lpF57IjgQ363zXl6iiRwTbmhwQI6+o/biSOuQXFpN
 hZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kLpBJn1dhuchvltixhmWPHQw7xkYxRK/FRveUh5W9mQ=;
 b=UdiAVvwWiHQLyLb7K4caxvK5NucTikcF4tLdYlAb32m5mFPmKfRcUI53zwHJdPwQje
 dfuWvJpL/xJ6MS7fk3eY/QxrzxGKd0ZDy4GNuxYkxZa0tUpUM7ssFIUNYxWFEvqMvwhm
 I4cXrV3D8Y6qAR4ZPkz8wN+vfqEBIDmef5/uuHzDqBl5L8LxPdAyXNjKcE1OnABECmG2
 8uluv/VK440uQWw2bGLD7EsNfZ/gznQAa0QZGXK3iCcVyg49ZXuBMyJ22EsZF5CWCKlB
 bVfEwH/JiTBol0xZibA2JKLyBqfIxyC+XIAuImL8/Ix1rBzethF+uSbqeYNM3Dq6e9+3
 2cZQ==
X-Gm-Message-State: AOAM533nGlxlPUM111jrRJQh1as2r4oYBQsTz+rvV2IpMOZ/iWinCu52
 Dh1K6H/ijjU10Mub532XlkYQwg==
X-Google-Smtp-Source: ABdhPJz/LEenHvG0UTtdnz2/9CZ4EybLK6BHgmG22+PWRnYdeLNzpsqCF+kNiVsFC7j2zzd6+ZFTuA==
X-Received: by 2002:a1c:7e4f:: with SMTP id z76mr9637087wmc.149.1605874716838; 
 Fri, 20 Nov 2020 04:18:36 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d?
 ([2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d])
 by smtp.gmail.com with ESMTPSA id o10sm4352281wma.47.2020.11.20.04.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 04:18:35 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: Enable the iahb clock early enough
To: Marc Zyngier <maz@kernel.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-3-maz@kernel.org>
 <966e90ba-5b38-9ba5-65b3-1a17dbd51871@collabora.com>
 <7e7ff26fdbc8540749522c23997549f6@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <43acb24a-a526-1455-d058-76629c2dacb8@baylibre.com>
Date: Fri, 20 Nov 2020 13:18:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7e7ff26fdbc8540749522c23997549f6@kernel.org>
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMTEvMjAyMCAxMjoxMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+IE9uIDIwMjAtMTEtMjAg
MTA6NTQsIEd1aWxsYXVtZSBUdWNrZXIgd3JvdGU6Cj4+IE9uIDIwLzExLzIwMjAgMDk6NDIsIE1h
cmMgWnluZ2llciB3cm90ZToKPj4+IEluc3RlYWQgb2YgbW92aW5nIG1lc29uX2R3X2hkbWlfaW5p
dCgpIGFyb3VuZCB3aGljaCBicmVha3MgZXhpc3RpbmcKPj4+IHBsYXRmb3JtLCBsZXQncyBlbmFi
bGUgdGhlIGNsb2NrIG1lc29uX2R3X2hkbWlfaW5pdCgpIGRlcGVuZHMgb24uCj4+PiBUaGlzIG1l
YW5zIHdlIGRvbid0IGhhdmUgdG8gd29ycnkgYWJvdXQgdGhpcyBjbG9jayBiZWluZyBlbmFibGVk
IG9yCj4+PiBub3QsIGRlcGVuZGluZyBvbiB0aGUgYm9vdC1sb2FkZXIgZmVhdHVyZXMuCj4+Pgo+
Pj4gRml4ZXM6IGIzMzM0MGUzM2FjZCAoImRybS9tZXNvbjogZHctaGRtaTogRW5zdXJlIHRoYXQg
Y2xvY2tzIGFyZSBlbmFibGVkIGJlZm9yZSB0b3VjaGluZyB0aGUgVE9QIHJlZ2lzdGVycyIpCj4+
PiBSZXBvcnRlZC1ieTogR3VpbGxhdW1lIFR1Y2tlciA8Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJv
cmEuY29tPgo+Pgo+PiBBbHRob3VnaCBJIGFtIHRyaWFnaW5nIGtlcm5lbGNpIGJpc2VjdGlvbnMs
IGl0IHdhcyBpbml0aWFsbHkKPj4gZm91bmQgdGhhbmtzIHRvIG91ciBmcmllbmRseSBib3QuwqAg
U28gaWYgeW91J3JlIE9LIHdpdGggdGhpcywgaXQKPj4gd291bGQgbW9zdCBkZWZpbml0ZWx5IGFw
cHJlY2lhdGUgYSBtZW50aW9uOgo+Pgo+PiDCoCBSZXBvcnRlZC1ieTogImtlcm5lbGNpLm9yZyBi
b3QiIDxib3RAa2VybmVsY2kub3JnPgo+IAo+IFN1cmUuIE5laWwgY2FuIGFkZCB0aGlzIHdoZW4g
KGFuZCBpZikgaGUgYXBwbGllcyB0aGVzZSBwYXRjaGVzLgoKWWVwIGFwcGx5aW5nIHRvIGRybS1t
aXNjLW5leHQgYW5kIHN3aXRjaGluZyB0byBgUmVwb3J0ZWQtYnk6ICJrZXJuZWxjaS5vcmcgYm90
IiA8Ym90QGtlcm5lbGNpLm9yZz5gCgpUaGFua3MKTmVpbAoKPiAKPiBUaGFua3MsCj4gCj4gwqDC
oMKgwqDCoMKgwqAgTS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
