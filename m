Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891CFCB52E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A156EAB2;
	Fri,  4 Oct 2019 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0F86E169
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 19:21:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w12so4007114wro.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 12:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kgvlV2mcTljWAp7eZcNK1OhOjxWAq+NeHEujH2OXj0E=;
 b=VAL2u3x+gkj8NCiK+zW9eCut3J+Z6VKd9YaDfpVuIcwChPROg4rHow5eiXGpvqBPxz
 KG/ne9MBgkQrencykznibmGJEmRFvgIRGbFv7zJmGsgHpth7+2wKheOUMrP7LrIFzWRF
 Hf9/aiIOIXxA6l2xycTb7mpygu1Uh/O1WrIh5UgiEavZ2Ic0NvcDDXBxOmtjM21FS5EX
 NulUS66XcGTrP1X/1Gk2MvVe20SHHrrgDl+ouUp/q5Hm+iz/1jb7ar56+Is9qS6bH0s/
 NRHKTKoXGinclR2OYh64A/5EXzluVLcW7obPvcD/G68v/vuDtKEWSTX08o5BLCZCud3d
 oZSA==
X-Gm-Message-State: APjAAAXcPhtyocS7nIJr2HfUAAQf8Lemtc1MJwmspUhZnPIPmSCQyeRY
 Lrh/w4tnNuEcX0k/D4IdoYA=
X-Google-Smtp-Source: APXvYqxqtuS84uQp720YiKUzMs5xcqZUqhV++5X5eY+D2lhtrEu+g/ezi2rBJ3ov1WgonS7FNRuBkQ==
X-Received: by 2002:adf:fcc7:: with SMTP id f7mr8221596wrs.319.1570130470488; 
 Thu, 03 Oct 2019 12:21:10 -0700 (PDT)
Received: from [192.168.1.19] (civ244.neoplus.adsl.tpnet.pl. [83.31.45.244])
 by smtp.gmail.com with ESMTPSA id 94sm6406792wrk.92.2019.10.03.12.21.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 12:21:09 -0700 (PDT)
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
To: Mark Brown <broonie@kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
Date: Thu, 3 Oct 2019 21:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003183554.GA37096@sirena.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kgvlV2mcTljWAp7eZcNK1OhOjxWAq+NeHEujH2OXj0E=;
 b=XDzJkQ89M6Qzjw60aWTvWzA4dp8csNLPOmO9K10AsTyN6/8yKJ/mY3xFdh2YjDSWrZ
 GVrDIaEL2laR0ti8/r3w9pWRAd+rBHePckK8zfZH79iRayn2QjsVUg8pK97NuMXDMk81
 slSIPiEgC2iqd8QqVTNQZK8ekfExVsRiFr0LV6auoXgdJ9DJpLmsQ9qwQ6/mo6JeG7BV
 rO9pYg/gOIJDSMuArz+8y2xOfOUdwPbU9uk4wzirvCzh5thTkfU671B1LSK9klguNiLS
 xRYp6fNC26hA1eu0MpJeX5nbLPiOihkkztABV9VTL80IUI9gTNXCPpWlcIiNuOgNl9pO
 xRwg==
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyaywKCk9uIDEwLzMvMTkgODozNSBQTSwgTWFyayBCcm93biB3cm90ZToKPiBPbiBUaHUs
IE9jdCAwMywgMjAxOSBhdCAwNzo0MzoxN1BNICswMjAwLCBKYWNlayBBbmFzemV3c2tpIHdyb3Rl
Ogo+PiBPbiAxMC8zLzE5IDI6NDcgUE0sIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4+PiBP
biAwMy8xMC8yMDE5IDEyOjQyLCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToKPj4+PiBPbiBUaHUs
IE9jdCAwMywgMjAxOSBhdCAxMDoyODowOUFNICswMjAwLCBKZWFuLUphY3F1ZXMgSGlibG90IHdy
b3RlOgo+IAo+IFRoaXMgbWFpbCBoYXMgbm90aGluZyByZWxldmFudCBpbiB0aGUgc3ViamVjdCBs
aW5lIGFuZCBwYWdlcyBvZiBxdW90ZXMKPiBiZWZvcmUgdGhlIHF1ZXN0aW9uIGZvciBtZSwgaXQn
cyBraW5kIG9mIGx1Y2t5IEkgbm90aWNlZCBpdC4uLi4KCklzbid0IGl0IGFsbCBhYm91dCBjcmVh
dGluZyBwcm9wZXIgZmlsdGVycz8KCj4+IEkgd29uZGVyIGlmIGl0IHdvdWxkbid0IG1ha2Ugc2Vu
c2UgdG8gYWRkIHN1cHBvcnQgZm9yIGZ3bm9kZQo+PiBwYXJzaW5nIHRvIHJlZ3VsYXRvciBjb3Jl
LiBPciBtYXliZSBpdCBpcyBlaXRoZXIgc29tZWhvdyBzdXBwb3J0ZWQKPj4gb3Igbm90IHN1cHBv
cnRlZCBvbiBwdXJwb3NlPwo+IAo+IEFueXRoaW5nIGF0dGVtcHRpbmcgdG8gdXNlIHRoZSByZWd1
bGF0b3IgRFQgYmluZGluZ3MgaW4gQUNQSSBoYXMgdmVyeQo+IHNlcmlvdXMgcHJvYmxlbXMsIEFD
UEkgaGFzIGl0cyBvd24gcG93ZXIgbW9kZWwgd2hpY2ggaXNuJ3QgY29tcGF0aWJsZQo+IHdpdGgg
dGhhdCB1c2VkIGluIERULgoKV2UgaGF2ZSBhIG1lYW5zIGZvciBjaGVja2luZyBpZiBmd25vZGUg
cmVmZXJzIHRvIG9mX25vZGU6Cgppc19vZl9ub2RlKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxl
ICpmd25vZGUpCgpDb3VsZG4ndCBpdCBiZSBlbXBsb3llZCBmb3IgT0YgY2FzZT8KCi0tIApCZXN0
IHJlZ2FyZHMsCkphY2VrIEFuYXN6ZXdza2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
