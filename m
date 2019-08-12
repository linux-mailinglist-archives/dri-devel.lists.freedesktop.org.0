Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244A89868
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 10:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5E6E4AB;
	Mon, 12 Aug 2019 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EE56E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 08:05:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u25so10905260wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 01:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ufGKwBzHzNSFgdcOablNE0vz1Z8KtfQ2TuFP4lhH54s=;
 b=pFYgKFBMtPK91An8xNKEwNB5Smvosuf2HoHhsmULUrlyCmTBj1NE5SeoW1F//UJ4yJ
 b4IY0h63LXj1ELq/gO2c3rmSSJNyhA0bnyNQpMLp5Mr3kWZFK8GSH+jNfESAVG1/NfGz
 +1Acm7boVLyLzbbr9V5AJ3fVr5dUbTxxVS2adyAoqJ5pxHWweqG9g2lLQC2eQ2DhQ9jG
 k/OJ0eVts6WtrLXL8r05vHykXd8e3TWWq5/fCT/CWeWiYdssZ0e8iVTPKfBF1nRU2+2M
 QiMnAIHFKi5EL1heegDk0qBkg59KwD8HnqmM6mhJ2IdmWI9N4s5K/OS2SB6sFsvUqcVJ
 x5uw==
X-Gm-Message-State: APjAAAUU3u1wqGz1t4vm82qJH5j+7qGo5R1t8NX9eEH/LkAlH+7HJSAI
 5BkS/4nWUSAgvEDYJWvhFpQCkw==
X-Google-Smtp-Source: APXvYqz6EhFotsYU49z2I1UAbp0US62x0A/jBhKf/LnRcG4G8QeOE3aQJV2P+8AsQawnjG/Y2744Aw==
X-Received: by 2002:a05:600c:d9:: with SMTP id
 u25mr3152884wmm.26.1565597108741; 
 Mon, 12 Aug 2019 01:05:08 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id a142sm10918918wme.2.2019.08.12.01.05.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 01:05:08 -0700 (PDT)
Date: Mon, 12 Aug 2019 09:05:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] backlight: lms283gf05: Fix a typo in the description
 passed to 'devm_gpio_request_one()'
Message-ID: <20190812080506.GH4594@dell>
References: <20190724213828.16916-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724213828.16916-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ufGKwBzHzNSFgdcOablNE0vz1Z8KtfQ2TuFP4lhH54s=;
 b=OY9w3Qb2FPL1d33M1cJQ78ypsj3wJgGSSLa58LntOr6i8+Y/csGOZbC4Ker6pqyPs2
 mDavytQZlhhFhYAVgAjmMWni2VyzsDAx5zM+gi0AwjXuxGATwlfNCG4Ky9P0UNf8vpdJ
 KzQdyR7xciH9PyWU15yjV6Hk7icax2SIkpEvzxgQ3SNr78oaiNIPf8ywfJaBcMp/A9Ks
 Hba2yrD6v3GPn3Uxu+GHDXDrZ64Yp8ZwL4+CnvsWoXAYegzGZTJa872+hxrBlCaT4qrw
 8wI3Ln5V9zkazaJs5Fc/iZRNFAsiZ/oOh1PrtjstePthVp1CFTDR7x3a0WTj4WuOwcpu
 WbYA==
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
Cc: daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBKdWwgMjAxOSwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgoKPiBUaGUgZGVz
Y3JpcHRpb24gcGFzc2VkIHRvICdkZXZtX2dwaW9fcmVxdWVzdF9vbmUoKScgc2hvdWxkIGJlIHJl
bGF0ZWQgdG8KPiBMTVMyODNHRjA1LCBub3QgTE1TMjg1R0YwNS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+IC0t
LQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXMyODNnZjA1LmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKQXBwbGllZCwgdGhhbmtz
LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExl
YWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
