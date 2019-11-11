Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC160F7078
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9D66E864;
	Mon, 11 Nov 2019 09:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2B6E864
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:24:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p4so13745002wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YWJNU/KRDci9JaBSSlvjD8ejfPkt5O8bTmBLBv7FEfI=;
 b=hAVDrAiPTJc0hrWfmaxVlFbZZvBalsM8HP9G5oDW4YpSQJW5EyOTblrMEXY5XzK6FI
 84EUU7gKPGfc8SqlPCmsh2fbxsUyYd4gxtn6mLQHJt9uWdmgfeSB+S7h+pXPpOmafn9J
 uEx5tabNff1JZ6vi1qaMW1W4htVJea2yWef3nzR7P/JF1mC9YNoO/8UtbXSTWUD8Kwty
 Jh13ZzXPn5N0x7c0m5DeFsWZvYpvz6aef7e40By2yRJkcKCbche67zAEkHvU15SA4Spw
 MA3M69QvxWuIPR1zrmjsQSjMr82j6Ed3+VOH8sTRfmzqVm3aLEebjMKHnwiSHxuQjF26
 +lDw==
X-Gm-Message-State: APjAAAUxGGVH81MGhtpz/C9Rv45uFdxR2A4B6TW1MXOdjE7deKQ8Q9aB
 /J+5rVsR1QX5YSOXy4J8r9azxQ==
X-Google-Smtp-Source: APXvYqxLWSqz1Db3ODg/rszTepYxIenSPrtyAq4nFKwOfdpSCLBq8+G1tD9JlSzHMInuJ7vRBsDVHg==
X-Received: by 2002:adf:e5c5:: with SMTP id a5mr20805012wrn.103.1573464294593; 
 Mon, 11 Nov 2019 01:24:54 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id w18sm14019087wrl.2.2019.11.11.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:24:54 -0800 (PST)
Date: Mon, 11 Nov 2019 09:24:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 1/8] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Message-ID: <20191111092446.GO18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=YWJNU/KRDci9JaBSSlvjD8ejfPkt5O8bTmBLBv7FEfI=;
 b=g45g1B9CgnICXh+L7YGsSwGItv1VEJKTbuwdGm/cgURZrltl6remdq17TWkf9IQj0t
 2cgaZlsss/2FQVPU4QV83/EZYMXeP4/JM/rzgGquBXWY6tsruKzcr0+SGbVegz+xLLcZ
 WRlkw6voDLEDe2B7TEZryWLFlOlqEbkxvcdq3fjD/vIom2LOugSVjFmrSTEjpHYiyTeg
 jy3QY5TM9aS6jBUdcaYKPjTc07TztHyuCW+skdOtl3zc2svXUOdhiAc53Q5Ohry9vPLQ
 X91mgOIDh2Hy+Xa/MpzmiIpup7RmwG/dso2672x4CVD4Z4HurT/bAG9/az5EB48HKFhA
 5CBg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IHBtODk0MS13bGVkLmMg
ZHJpdmVyIGlzIHN1cHBvcnRpbmcgdGhlIFdMRUQgcGVyaXBoZXJhbAo+IG9uIHBtODk0MS4gUmVu
YW1lIGl0IHRvIHFjb20td2xlZC5jIHNvIHRoYXQgaXQgY2FuIHN1cHBvcnQKPiBXTEVEIG9uIG11
bHRpcGxlIFBNSUNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29k
ZWF1cm9yYS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJz
c29uQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+
Cj4gQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pgo+IC0tLQo+ICAuLi4vYmlu
ZGluZ3MvbGVkcy9iYWNrbGlnaHQve3BtODk0MS13bGVkLnR4dCA9PiBxY29tLXdsZWQudHh0fSAg
ICB8IDIgKy0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC97cG04OTQxLXdsZWQuYyA9PiBxY29tLXdsZWQuY30gICAg
ICAgICAgICB8IDAKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9i
YWNrbGlnaHQve3BtODk0MS13bGVkLnR4dCA9PiBxY29tLXdsZWQudHh0fSAoOTUlKQo+ICByZW5h
bWUgZHJpdmVycy92aWRlby9iYWNrbGlnaHQve3BtODk0MS13bGVkLmMgPT4gcWNvbS13bGVkLmN9
ICgxMDAlKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5h
cm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
