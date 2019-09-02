Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03477A59E5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4422989AAD;
	Mon,  2 Sep 2019 14:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B649989AAD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:56:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d16so14929144wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 07:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KqOOLL6JgdV+zGoLyYW+WKlQfFjaHR4hzG66VpfSv5I=;
 b=T2sTRAS86Cb5oJCbv6ugX0ZWieZLYUn3jR9evV4j/33LpW9LY6LB8c6bU7HcbYFmm8
 2eD1Gputq7pyvYHMeN3PzJUodJBCiIoZ2y60HMNeIl3oCtjHlneTGtGtml9m7+QRBana
 6No1eju8SWM4Od2cQK4nZOIRLnYiSHhbqIxqJFUiawgXEW+owqYV2m78+XpwtvRSdFJW
 hDta6dLhQyYr/A4iHiQFy/AV7I/QV6LMSp6+NeK6WY3UEHLIOtwjOD960VsxapzOdgHb
 +dfBsv/XF31UzmV/uI8jNdAfXIYBOz0yjwgyPWUJ1y73+OCPUWZ7fbzgogrP2vIwd4lb
 wy8w==
X-Gm-Message-State: APjAAAWZs0rIDoz1xsGrLPg3GeNAXV9KFW+mlzWHaDe/xm5jPiaqGdCT
 1CQFxn4T83ATK2gr32sehWDsrQ==
X-Google-Smtp-Source: APXvYqxnvtr0t4LzNPxoiL8/Jq+PyDXLQt3tRHkKfYpRE0qzV/Lq1dbHOzsVmyHWJTPAuk/hes9r/w==
X-Received: by 2002:a1c:2e8d:: with SMTP id
 u135mr36753302wmu.101.1567436163294; 
 Mon, 02 Sep 2019 07:56:03 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id s12sm4245869wra.82.2019.09.02.07.56.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 07:56:02 -0700 (PDT)
Date: Mon, 2 Sep 2019 15:56:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] backlight: lm3630a: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190902145601.GB26880@dell>
References: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
 <20190812080444.GG4594@dell>
 <20190902132212.GL2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902132212.GL2680@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=KqOOLL6JgdV+zGoLyYW+WKlQfFjaHR4hzG66VpfSv5I=;
 b=y/gxemQUXJWw/pJMlMEgJ3Ex6eONI5ophYo/0s2JxBzJf70a/x55X1Yk5R4Yay8aEX
 hkoslMwXQ/v12lldVXf8jsRDLA881ksxmPGQRKygwgIIgvsJi7QTdNsKfBigut3/eb+S
 57h5SbckYaj7m7mp495uv1DG6fPM9V1uYVqjhFC8NoYUI2pHN/yvl6aeNqqUMjatPrH4
 W+nP9dlil7tC3uL/+j6sqotKNek8V2vGQY9+utguz8+EQmh4FIcuT1dA55fDUWrCELIF
 jO6rYHTucAxhupLrWQCaelxy6QTIIVt4o0vUCxZSpO99dvk3V3Qk2N1InlL3dldsNKnp
 37gw==
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMiBTZXAgMjAxOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKPiBPbiBNb24sIEF1
ZyAxMiwgMjAxOSBhdCAwOTowNDo0NEFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBU
dWUsIDIzIEp1bCAyMDE5LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiAKPiA+ID4gVXNlIHVz
ZSBmd25vZGVfcHJvcGVydHlfY291bnRfdVhYKCkgZGlyZWN0bHksIHRoYXQgbWFrZXMgY29kZSBu
ZWF0ZXIuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgfCAzICstLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBBcHBsaWVkLCB0aGFua3Mu
Cj4gCj4gVGhhbmtzLgo+IEhvd2V2ZXIsIEkgaGF2ZW4ndCBzdGlsbCBub3RpY2VkIGEgdHJhY2Ug
b2YgaXQgaW4gTGludXggbmV4dC4KCkp1c3QgZGlkIGEgYmlnIHB1c2guICBJdCBzaG91bGQgYmUg
aW4gdGhlcmUgYnkgdG9tb3Jyb3cuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBT
ZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
