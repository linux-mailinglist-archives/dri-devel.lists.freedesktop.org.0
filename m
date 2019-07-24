Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF747379B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800C66E635;
	Wed, 24 Jul 2019 19:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45D76E635
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:16:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so42798595wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LNAmuM+7si//N0400TDsq2MUrZ/1PI7eiz92D6aickY=;
 b=QiFriUqdaK4tQOEFS9SYdHeaOESjAX1t9QlPxTSoVBI3jmSX3zUVxnYo2wdYnfn/Wj
 nF6NXc5leAjMC1GNWuQ6sLIXYbIK5vULvBA8mo0vwB5Iq8fKdAe0b595nJuHoB8x0101
 4M/ldges5UGyopmKNy93PQbO6bRIf0GDv4R9JnNgD25pwhiT0Z5x2UyfktEgo0Y5RSh9
 Lg02CGl7zlzNY7JzDJFudkpFtXdojG3TGta5m6HPnRzqoY/iyp34S8LzbM+FUvMWfTvb
 mI4pz5+c5w1nLGBVXpjtGtwrkMmapjCobRU+R4f2JplcvNiI2kCAIo3Ge9zAa3sEIhn/
 uung==
X-Gm-Message-State: APjAAAWTH1cmvZKifRd3UIQlRicNudsrAM5uXjfSddMzUsCO9Yyggd/A
 feudp1+CaRXc/HB0QPqAe7P+pir/
X-Google-Smtp-Source: APXvYqznKz1ACVYFK8RxfQFmQ7H1Q2wBIzpGBssnn1iwZQnb6SjaP8h75HCTkprLc/WEfC65AVtrsg==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr73188753wmm.108.1563995778325; 
 Wed, 24 Jul 2019 12:16:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id f70sm56473772wme.22.2019.07.24.12.16.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:16:17 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:16:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 06/11] icc: Relax requirement in
 of_icc_get_from_provider()
Message-ID: <20190724191615.GI14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122026eucas1p2acf705de2a47ba54f383d916f5383144@eucas1p2.samsung.com>
 <20190723122016.30279-7-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-7-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MTFQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCByZWxheGVzIHRoZSBjb25kaXRpb24gaW4gb2ZfaWNjX2dldF9m
cm9tX3Byb3ZpZGVyKCkgc28gdGhhdCBpdAo+IGlzIG5vIGxvbmdlciByZXF1aXJlZCB0byBzZXQg
I2ludGVyY29ubmVjdC1jZWxscyA9IDwxPiBpbiB0aGUgRFQuIEluIGNhc2UKPiBvZiB0aGUgZGV2
ZnJlcSBkcml2ZXIgZm9yIGV4eW5vcy1idXMsICNpbnRlcmNvbm5lY3QtY2VsbHMgaXMgYWx3YXlz
IHplcm8uCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRu
ZXIuc2Ftc3VuZy5jb20+Cj4gLS0tCgpNYWtlcyBzZW5zZSB0byBtZToKQWNrZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
