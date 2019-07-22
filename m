Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0F7128A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2586E02E;
	Tue, 23 Jul 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7589E8C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:25:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s3so36413449wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Z+P3bLyNMOpFfuF+fOvhJa1C6yyOoO7aLy4gyZM9N48=;
 b=Tw3U9SO6IS1Q6Els7jYvXSm8ldQmgLyWBDSdx4TlplwVqUQaawbnWZWPoZvwC0QQKH
 bN8e7krrkyB5TzziRX9j9t3o6l8VTiCJRbLtmhfxbUWsrfB3/tUeCXscdiWHzKnvoAsQ
 pN1m6fvPjAYwp3shWqB7Oc2MYHdp1PncKnCWSRI59V5P4KSH2BH14mcJSclr+69uwGtu
 ixXgNpSXkT6VcE+P9Sct3aUswRM22WY2xmgIYViRiU38VUlwcxGmfg9XS1mOfJk1p1Yh
 uYXMtrP25QeWHUGjqAXcfVzFTeDROm+RFp7DLcSdCojouJ/W5lOqvcQubdei7cmzsR7z
 WjTw==
X-Gm-Message-State: APjAAAWpy/rx8GWB7pio9WBwMy4l1vtIO0kluEWHzwwghwPcXz+F/b7U
 EWcuGGgLe+zQUt7jVmjRTEw=
X-Google-Smtp-Source: APXvYqzVRREtwH3BjCYLSlSau+Ic7SVVeUJcLdSvNu7gz2h4WKdmefXiLiVvtbc30tTw+jnWl7+2Cw==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr65702133wmc.169.1563827108359; 
 Mon, 22 Jul 2019 13:25:08 -0700 (PDT)
Received: from [192.168.1.19] (chg44.neoplus.adsl.tpnet.pl. [83.31.4.44])
 by smtp.gmail.com with ESMTPSA id a84sm47936454wmf.29.2019.07.22.13.25.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 13:25:07 -0700 (PDT)
Subject: Re: [PATCH] Enable backlight when trigger is activated
To: Pavel Machek <pavel@ucw.cz>, Ezequiel Garcia <ezequiel@collabora.com>
References: <20190718190849.GA11409@amd>
 <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
 <20190722075032.GA27524@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <6fc6af89-1455-7665-47e7-0568ecd87c9c@gmail.com>
Date: Mon, 22 Jul 2019 22:25:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722075032.GA27524@amd>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+P3bLyNMOpFfuF+fOvhJa1C6yyOoO7aLy4gyZM9N48=;
 b=pzNqBeERdklviCkYj/AJ4yxcFyT/QfyrHKJKpA0z8GnYTGb+IU/rWDxctJsfPU5pOa
 YKQ1lcjfqIZikP1fL+j7DsUSF2tdtfU4qsIyOyxJvj8LmFeedsoqjYVBQqnfWlws4KfI
 i7POaVt7vVXpKiHGFBEIazKkyOBVBouLkk5iadzDrpHdY2358rmvg2XKdiGV6EYHgUAP
 KqPPcHRg81yYGA6XMDwcP+A7ljQzaWySCuOsybOtIlPTsi2lPtp2HpNz1Uyzccns4J6A
 uaDccxcj5WSpEEkq6jfEna4dap7smgL1+z+gP15T1SzvxweTo9EHOpXpo96mF6nG5gZ4
 34xw==
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
Cc: linux-fbdev@vger.kernel.org, mpartap@gmx.net, b.zolnierkie@samsung.com,
 tony@atomide.com, merlijn@wizzup.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, linux-leds@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF2ZWwsCgpPbiA3LzIyLzE5IDk6NTAgQU0sIFBhdmVsIE1hY2hlayB3cm90ZToKPiBIaSEK
PiAKPj4+IENvbmZpZ3VyaW5nIGJhY2tsaWdodCB0cmlnZ2VyIGZyb20gZHRzIHJlc3VsdHMgaW4g
YmFja2xpZ2h0IG9mZiBkdXJpbmcKPj4+IGJvb3QuIE1hY2hpbmUgbG9va3MgZGVhZCB1cG9uIGJv
b3QsIHdoaWNoIGlzIG5vdCBnb29kLgo+Pj4KPj4+IEZpeCB0aGF0IGJ5IGVuYWJsaW5nIExFRCBv
biB0cmlnZ2VyIGFjdGl2YXRpb24uCj4gCj4+PiArKysgYi9kcml2ZXJzL2xlZHMvdHJpZ2dlci9s
ZWR0cmlnLWJhY2tsaWdodC5jCj4+PiBAQCAtMTE0LDYgKzExNCw4IEBAIHN0YXRpYyBpbnQgYmxf
dHJpZ19hY3RpdmF0ZShzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWQpCj4+PiAgCW4tPm9sZF9zdGF0
dXMgPSBVTkJMQU5LOwo+Pj4gIAluLT5ub3RpZmllci5ub3RpZmllcl9jYWxsID0gZmJfbm90aWZp
ZXJfY2FsbGJhY2s7Cj4+PiAgCj4+PiArCWxlZF9zZXRfYnJpZ2h0bmVzcyhsZWQsIExFRF9PTik7
Cj4+PiArCj4+Cj4+IFRoaXMgbG9va3MgZmlzaHkuCj4+Cj4+IE1heWJlIHlvdSBzaG91bGQgdXNl
IGEgZGVmYXVsdC1zdGF0ZSA9ICJrZWVwIiBpbnN0ZWFkPyAoYW5kIHlvdSdsbCBoYXZlCj4+IHRv
IHN1cHBvcnQgaXQgaW4gdGhlIExFRCBkcml2ZXIpLgo+Pgo+PiBUaGF0J2xsIGdpdmUgeW91IHBy
b3BlciAiZG9uJ3QgdG91Y2ggdGhlIExFRCBpZiBpdCB3YXMgdHVybmVkIG9uIiBiZWhhdmlvciwK
Pj4gd2hpY2ggaXMgd2hhdCB5b3Ugc2VlbSB0byB3YW50Lgo+IAo+IEFjdHVhbGx5IG5vLCB0aGF0
J3Mgbm90IHdoYXQgSSB3YW50LiBMRUQgc2hvdWxkIGdvIG9uIGlmIHRoZSBkaXNwbGF5Cj4gaXMg
YWN0aXZlLCBhcyBzb29uIGFzIHRyaWdnZXIgaXMgYWN0aXZhdGVkLgo+IAo+IFVuZm9ydHVuYXRl
bHksIEkgaGF2ZSBzZWUgbm8gZ29vZCB3YXkgdG8gdGVsbCBpZiB0aGUgZGlzcGxheSBpcwo+IGFj
dGl2ZSAoYW5kIGRpc3BsYXkgaXMgdXN1YWxseSBhY3RpdmUgd2hlbiB0cmlnZ2VyIGlzIGFjdGl2
YXRlZCkuCgpkZWZhdWx0LXN0YXRlIERUIHByb3BlcnR5IGNhbiBiZSBhbHNvIHNldCB0byAib24i
CihzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dCku
CgpZb3UgY291bGQgbWFrZSB1c2Ugb2YgTEVEX0lOSVRfREVGQVVMVF9UUklHR0VSIGZsYWcgYW5k
CnBhcnNlIERUIHByb3BlcnR5IGluIHRoZSBhY3RpdmF0ZSBvcC4gU2ltaWxhciBhcHByb2FjaCBo
YXMgYmVlbgphcHBsaWVkIGUuZy4gaW4gbGVkdHJpZy1wYXR0ZXJuLmMuCgotLSAKQmVzdCByZWdh
cmRzLApKYWNlayBBbmFzemV3c2tpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
