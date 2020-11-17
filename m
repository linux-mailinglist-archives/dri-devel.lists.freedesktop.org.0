Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C062B6EDA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0F89CAA;
	Tue, 17 Nov 2020 19:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C38889CAA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:40:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so4413432wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=FHkNUdrffEEewUqKRC5MHcmvzKN343SbiYWMLq5hSig=;
 b=Y8xRFV1uXbhUD/hNWnOZWHHvJxo2AOqJa9wV9al4z4mwA5aKWhD7ICIZCL6HKE+NYB
 DEaSlhXR89JiPboWtnAOmsSDbEjXlP3cR9qF6WfYLHu08xvKeeUDOCMFvhlZDWqUL8VZ
 8uQWLxQI4mffDvRkb2gb4vCipF63m3ayPXMXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FHkNUdrffEEewUqKRC5MHcmvzKN343SbiYWMLq5hSig=;
 b=FHD+giEvOTHpo3nBrY39FBrpaZ9lG4EUdYQxT6QsHTaGFU6RNJtHt1H9YpvqPXGPIq
 ZWwl9oj9WsadmSYg+Vq2TZNZaGdiQQMZvwtY43O36IpMpSALPA744L17GLDomH4BxUYH
 gQyvhKu1m0winmSnRuzWoJROU5LPGfjXOOVhb9TvM+PNqkJti2xtOuFVLU37b1XPCYw7
 zxcx3N6kLTy6/jh3OgctEBURnXaSok6kXJlNFa6fWCCw2gsSLIEoZQbvp8lkf0Un+0L6
 gvqwBrRdrYkW9oVMUcAb+15DlJQAIahJEyunAdCxTN3Z+d7y+RMswmQx78w2gljDrEE7
 zhJA==
X-Gm-Message-State: AOAM53108LdXHRirO4Qrz/w8hcJuMoKBnV+iuSJ4s/pXzHpxaHZjLUiy
 dTTW8lsxww4QefrxgWoXB7rVtw==
X-Google-Smtp-Source: ABdhPJz9AJRrUB8LSQple4httgcCRK/0wqg7MvcLR0c4AXS2Zx0msIgNNlqu4m1/MW9PZsPuViapkQ==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr729506wma.86.1605642009912;
 Tue, 17 Nov 2020 11:40:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a144sm5493322wmd.47.2020.11.17.11.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:40:08 -0800 (PST)
Date: Tue, 17 Nov 2020 20:40:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 38/42] drm/vc4/vc4_hdmi: Remove set but unused variable
 'ret'
Message-ID: <20201117194006.GU401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-39-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116174112.1833368-39-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMDU6NDE6MDhQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+
ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmM6IEluIGZ1bmN0aW9uIOKAmHZjNF9oZG1p
X3NldF9hdWRpb19pbmZvZnJhbWXigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWku
YzozMzQ6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9s
dC5uZXQ+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4g
Q2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CgpIbSB0aGlzIGlzIGFub3RoZXIgd2hlcmUgSSB0aGluayB0aGUgcmlnaHQgdGhp
bmcgdG8gZG8gaXMgc3dpdGNoIHRoZQpyZXR1cm4gdmFsdWUgZnJvbSBpbnQgdG8gdm9pZC4gQWxs
IHVzZXJzIGFyZSBtYWludGFpbmVkIGluIGRybSBleGNlcHQKc291bmQvc29jLCBzbyBwcm9iYWJs
eSBnb29kIGVub3VnaCBhcyBhIHNpbmdsZSBwYXRjaC4gSWYgeW91IGZlZWwgbGlrZSwKb3RoZXJ3
aXNlIEkgY2FuIHR5cGUgaXQgdXAgdG9vLgoKQW55d2F5IGFwcGxpZWQgdGhpcyBvbmUgaGVyZS4K
LURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgMyArLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMKPiBpbmRleCA5NTc3OWQ1MGNjYTBiLi5iODBlYjlkM2Q5ZDVhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwo+IEBAIC0zMzEsOSArMzMxLDggQEAgc3RhdGljIHZv
aWQgdmM0X2hkbWlfc2V0X2F1ZGlvX2luZm9mcmFtZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIpCj4gIHsKPiAgCXN0cnVjdCB2YzRfaGRtaSAqdmM0X2hkbWkgPSBlbmNvZGVyX3RvX3ZjNF9o
ZG1pKGVuY29kZXIpOwo+ICAJdW5pb24gaGRtaV9pbmZvZnJhbWUgZnJhbWU7Cj4gLQlpbnQgcmV0
Owo+ICAKPiAtCXJldCA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZyYW1lLmF1ZGlvKTsK
PiArCWhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZyYW1lLmF1ZGlvKTsKPiAgCj4gIAlmcmFt
ZS5hdWRpby5jb2RpbmdfdHlwZSA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfU1RSRUFNOwo+ICAJ
ZnJhbWUuYXVkaW8uc2FtcGxlX2ZyZXF1ZW5jeSA9IEhETUlfQVVESU9fU0FNUExFX0ZSRVFVRU5D
WV9TVFJFQU07Cj4gLS0gCj4gMi4yNS4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
