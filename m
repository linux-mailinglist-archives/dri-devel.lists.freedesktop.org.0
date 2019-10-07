Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B31CE76F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE0F6E125;
	Mon,  7 Oct 2019 15:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DF56E125
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:28:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 7so13170248wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 08:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DCOkxVIM+JoLp/YA+axrp58OiH/imrwWD+NmGvd4Ocg=;
 b=PoshHAS/C7KmfVWMb74bf4vBRReSGdS5UWULVUbvEPt8aioICaw0NPsulVJjPCnI6c
 Tz/Epcz5z75wcdL/S5QR8wZGB0BxLrDzQgpT/cw3SGfUjv4rtytAjU5UnmeeMomHYfMV
 ZYs/XBQOpk2ZRnRUs1Onl9Njnm8BjCaS7Tunvu0CeZO2ilY7X+D9Iq75OMTpT/MAFYaL
 R8NJLX48zsiyPbuX+KHhfLUxuxUkkevCE01cxL4TK0PWfpT+ABH4p84pup41cYHmOgqQ
 ZzGR54gjsbsOQhr2If2efobgVa9pZER41jbXeJPYgVxlk+sZvop2+a3G/on/JHN60VDK
 bZGg==
X-Gm-Message-State: APjAAAUKI4aF8TA0xIQ6L5/aSq3GLL4uSl4AG/Oxq+/rA8m9lazpKUSN
 uB6Et5kHtiXWWKGOVxU2vjF8TA==
X-Google-Smtp-Source: APXvYqzLtwmET3hiE2eWvE24sEsSRwb8ljYitXMiLtwoOUl9Ert6W2PeYvJ4zI6wnb+Z9sUY6yV87w==
X-Received: by 2002:a1c:a8cb:: with SMTP id
 r194mr20184823wme.156.1570462082643; 
 Mon, 07 Oct 2019 08:28:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n14sm13722808wro.83.2019.10.07.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:28:02 -0700 (PDT)
Date: Mon, 7 Oct 2019 16:28:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191007152800.3nhbf7h7knumriz4@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919140620.32407-3-linux@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DCOkxVIM+JoLp/YA+axrp58OiH/imrwWD+NmGvd4Ocg=;
 b=PYxYfGB6zPqtbG5xjS2Q9qk6xu1t5yFe2l7zfOc1z1MO7Cjx3Ihljkj8az2zpIEJTe
 92TxrZQdhkL8Jr5XjUmbVouX5Ez39Rud2TRflwB8e9bqonoq2235fow3dFw80PEn2MwT
 yK1c3LlElksS2/p36HWmCRfUvBNpQ6oGvFLp8G5Y9Eje4M7lOL5hQYn4bO9ZdGpyHJxz
 i3Zq9KKFEmW1uPM+l3JpophHsU8IskdX8Xg0Vz/kJ40SZqz9vjnh3XeRRheiD8zKjy+u
 Nt6YLTFk8HUvTJ5oY4wQl+zFdjqMNkJUrQ8m1p7UPr3xqSwfuaHbJksPhAWG9jyjJQCo
 XI/Q==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6MDY6MThQTSArMDIwMCwgUmFzbXVzIFZpbGxlbW9l
cyB3cm90ZToKPiBUaGUgc2NoZWR1bGVyIHVzZXMgYSAoY3VycmVudGx5IHByaXZhdGUpIGZpeGVk
X3Bvd2VyX2ludCgpIGluIGl0cyBsb2FkCj4gYXZlcmFnZSBjb21wdXRhdGlvbiBmb3IgY29tcHV0
aW5nIHBvd2VycyBvZiBudW1iZXJzIDAgPCB4IDwgMQo+IGV4cHJlc3NlZCBhcyBmaXhlZC1wb2lu
dCBudW1iZXJzLCB3aGljaCBpcyBhbHNvIHdoYXQgd2Ugd2FudCBoZXJlLiBCdXQKPiB0aGF0IHJl
cXVpcmVzIHRoZSBzY2FsZSB0byBiZSBhIHBvd2VyLW9mLTIuCgpJdCBmZWVscyBsaWtlIHRoZXJl
IGlzIHNvbWUgcmF0aW9uYWxlIG1pc3NpbmcgaW4gdGhlIGRlc2NyaXB0aW9uIGhlcmUuCgpXaGF0
IGlzIHRoZSBiZW5lZml0IG9mIHJlcGxhY2luZyB0aGUgZXhwbGljaXQgaW50X3BvdygpIHdpdGgg
dGhlCmltcGxpY2l0IG11bHRpcGxpY2F0aW9ucz8KCgpEYW5pZWwuCgoKPiAKPiBXZSBjb3VsZCAo
YW5kIGEgZm9sbG93aW5nIHBhdGNoIHdpbGwpIGNoYW5nZSB0byB1c2UgYSBwb3dlci1vZi0yIHNj
YWxlLAo+IGJ1dCBmb3IgYSBmaXhlZCBzbWFsbCBleHBvbmVudCBvZiAzLCB0aGVyZSdzIG5vIGFk
dmFudGFnZSBpbiB1c2luZwo+IHJlcGVhdGVkIHNxdWFyaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9lcy5kaz4KPiAtLS0KPiAgZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2Js
LmMKPiBpbmRleCA5MjUyZDUxZjMxYjkuLmFlZTY4MzllMDI0YSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3B3bV9ibC5jCj4gQEAgLTE3OSw3ICsxNzksOCBAQCBzdGF0aWMgdTY0IGNpZTE5MzEodW5z
aWduZWQgaW50IGxpZ2h0bmVzcywgdW5zaWduZWQgaW50IHNjYWxlKQo+ICAJaWYgKGxpZ2h0bmVz
cyA8PSAoOCAqIHNjYWxlKSkgewo+ICAJCXJldHZhbCA9IERJVl9ST1VORF9DTE9TRVNUKGxpZ2h0
bmVzcyAqIDEwLCA5MDMzKTsKPiAgCX0gZWxzZSB7Cj4gLQkJcmV0dmFsID0gaW50X3BvdygobGln
aHRuZXNzICsgKDE2ICogc2NhbGUpKSAvIDExNiwgMyk7Cj4gKwkJcmV0dmFsID0gKGxpZ2h0bmVz
cyArICgxNiAqIHNjYWxlKSkgLyAxMTY7Cj4gKwkJcmV0dmFsICo9IHJldHZhbCAqIHJldHZhbDsK
PiAgCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwocmV0dmFsLCAoc2NhbGUgKiBzY2Fs
ZSkpOwo+ICAJfQo+ICAKPiAtLSAKPiAyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
