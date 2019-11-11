Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81930F7088
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8256E86A;
	Mon, 11 Nov 2019 09:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0CA6E86B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s5so2673238wrw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wdf4vDYPrWUkIFw2I/tLGdO131jSnYkYMuWnygUSqLk=;
 b=ahhYrlWu4uH1a2tdMFE/lVf2qI0mfNjavTijrNCeDoir3jbH1DOwAHsiBQyDF0bgtj
 zyZeU580dFzb/wglHAjHUh6jyFRgwiEkgPg4lsw8RXPOVHmKO+6dP4NnCPnyA5dJoAiz
 5VYcX7YzHm/VXIddEWk9NvmtqmjP1vBeB8UcOBTtwtqClj3JHLHH9MhpH8gnuoPc/BPO
 tmRAMHilyWfPtyrViy49/JscceveM7loY6uBdvGPkc18FSUufq20xPno3PnQsKLG2fZ3
 ubaS09b3oq8RdVFNJPUFYuDJ/Z0+nTbiJIsYNN26Qtjp8VywZJ86Eu0Yf+0DEYXluVgY
 npYw==
X-Gm-Message-State: APjAAAWWAX4nDRsRvAQOnOAczzV8Gpq5iaB5zyi34E9afI+M875qMbqr
 uttxxZ6immDe5J8uvpRza2fsOA==
X-Google-Smtp-Source: APXvYqwqrFBkB4DNwsCnkk+NnHy2fa3C1N/2ZofRGerNFLj9+QnWiuNncAs3CNYES0zU4rIEPpmpbQ==
X-Received: by 2002:a5d:42d1:: with SMTP id t17mr7864805wrr.56.1573464320281; 
 Mon, 11 Nov 2019 01:25:20 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id v128sm25894991wmb.14.2019.11.11.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:19 -0800 (PST)
Date: Mon, 11 Nov 2019 09:25:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 4/8] backlight: qcom-wled: Rename PM8941* to WLED3
Message-ID: <20191111092511.GR18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-5-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-5-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=wdf4vDYPrWUkIFw2I/tLGdO131jSnYkYMuWnygUSqLk=;
 b=QVjHDp3d+469LsP2NblXGvyg7PmbjNJAA/Lj8/YUSMVqsYksNAe3Pk26vNoh86CaIW
 Zs10nrrYxvXwqD3E1LIAWDrVEwn3zTuwrRvzYMAWSUhTqo88AO3X1KjkytzHetpoHW9K
 UQr8ifsnScI5cEo+wBnLoG7JmoRrxAU0YM1EM4w7hfEi6zKmqCZbF0PeYWKnljsGNGZ0
 k1M76IWhNU8FWi9JJNgOk06CotySwJoWYkOTjQBhyc5JsXUbecxnXUZ1JDeSBC56TWMq
 3Sf6dhzdePDLzCE/i70ky3motAWkcan/qqAHfSLJwvAqS7dTUQh043flEES3TdcmO5tC
 uLSA==
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
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFJlbmFtZSB0aGUgUE04
OTQxKiByZWZlcmVuY2VzIGFzIFdMRUQzIHRvIG1ha2UgdGhlIGRyaXZlcgo+IGdlbmVyaWMgYW5k
IGhhdmUgV0xFRCBzdXBwb3J0IGZvciBvdGhlciBQTUlDcy4gQWxzbyByZW5hbWUKPiAiaV9ib29z
dF9saW1pdCIgYW5kICJpX2xpbWl0IiB2YXJpYWJsZXMgdG8gImJvb3N0X2lfbGltaXQiCj4gYW5k
ICJzdHJpbmdfaV9saW1pdCIgcmVzcGVjdGl2ZWx5IHRvIHJlc2VtYmxlIHRoZSBjb3JyZXNwb25k
aW5nCj4gcmVnaXN0ZXIgbmFtZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2lyYW4gR3VuZGEgPGtn
dW5kYUBjb2RlYXVyb3JhLm9yZz4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5p
ZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogQmpvcm4gQW5kZXJzc29uIDxi
am9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZl
bEB1Y3cuY3o+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIHwg
MjQ4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTI1IGluc2VydGlvbnMoKyksIDEyMyBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFk
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
