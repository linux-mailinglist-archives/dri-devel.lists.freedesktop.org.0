Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666593599C5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 11:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2D46EC05;
	Fri,  9 Apr 2021 09:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A026EC05
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 09:48:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j5so4015627wrn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R8wfAW6UkxdFjfeN++p5VJYSZ+v6zKHbn0ztH5VbYXU=;
 b=NPPQO6HQGA2zR/4mPvQI9GvVmKWQdkeQZY1/OeTeLcHGN9rzz9GkNATnNEJEfUfF9G
 EQhvV3mCkOCgy4S8hntOeFUm6DcY5phhJzT49V65QTB+UszS4blTUfFxmHyoJfHOd5oN
 RvXEQiQTrfGKj8wwV0L3e68QtjIsPEiGdK0rUVCwL5IZtFhHJwGJOE3xslH/PxELZdcV
 WCWyr2c2/ZsMvGOfFNVvy5pMFvic4dBl2OxKJK4f6hUZ67L2+v/Fhqqgdu1GteRgz9KD
 3Ufx8OOU4CgtRg0iO1vogJIcSS4JhCAzu747J824hGkjP57U6Eg6F9gPhnaHC7HsC18l
 fsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=R8wfAW6UkxdFjfeN++p5VJYSZ+v6zKHbn0ztH5VbYXU=;
 b=MUPf/6vTPMmXPznN/N5BmgJWGZh2BlcxaxsTREQGfrgNWRKy8oPMomg4yp5/SuHmrj
 rNl+bROp4clNWVHoskF6CSeYkYJHEsPxhTAsRy4XEH64pybBBscgTHizoIveV1pwZVjL
 OVDFMMR8oBv33Fp3xez0cxPA5q9uG2IqhYybirbc845g+6gvbtQ5Fxlp4ceqLSTyGP+6
 2125P0E39RaoLS/hWcB6X4F+ekQ2N5Y+tQmWae1Nf6uETqGImZBTBHECHGhyTWbBSIPz
 1JIOYLabF38wSUTAOB1A8Al1ocraxl4iKq/HOMN1MOoUeKv+alRWuuAHGQsl3otUyAyx
 4RPg==
X-Gm-Message-State: AOAM533Bh1SYoppLanx56ReXW614bwwojH3CO4RsFeXBVKCeuxZj0tjB
 chIX0JykxPOyWPwkl1Jp7urO2qFxxnlP0ESk
X-Google-Smtp-Source: ABdhPJwOK82fGXSForfnab8e/hfbWCVE18kmlzDlz0sCOVEOxp5E4xqtAif3ngQbcCr3FEH6DwcATg==
X-Received: by 2002:a5d:5311:: with SMTP id e17mr2250940wrv.11.1617961679887; 
 Fri, 09 Apr 2021 02:47:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:a137:adca:2163:7ea8?
 ([2a01:e0a:90c:e290:a137:adca:2163:7ea8])
 by smtp.gmail.com with ESMTPSA id i26sm3244793wmb.18.2021.04.09.02.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 02:47:59 -0700 (PDT)
Subject: Re: [PATCH 00/18] drm/vc4: hdmi: Add Support for the YUV output
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <4209616.oJxVDHRhuA@kista>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <f4c8fc4e-ed57-5759-777d-a9ebf0b48039@baylibre.com>
Date: Fri, 9 Apr 2021 11:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4209616.oJxVDHRhuA@kista>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDMvMjAyMSAxOToxNiwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IEhpIQo+IAo+IERu
ZSBzcmVkYSwgMTcuIG1hcmVjIDIwMjEgb2IgMTY6NDM6MzQgQ0VUIGplIE1heGltZSBSaXBhcmQg
bmFwaXNhbChhKToKPj4gSGksCj4+Cj4+IEhlcmUncyBhbiBhdHRlbXB0IGF0IHN1cHBvcnQgdGhl
IEhETUkgWVVWIG91dHB1dCBvbiB0aGUgQkNNMjcxMSBTb0MgZm91bmQgb24KPj4gdGhlIFJhc3Bi
ZXJyeVBpNC4KPj4KPj4gSSB0b29rIHRoZSBzYW1lIGFwcHJvYWNoIHRoYW4gd2hhdCBkdy1oZG1p
IGRpZCBhbHJlYWR5LCB0dXJuaW5nIGEgYnVuY2ggb2YKPj4gZnVuY3Rpb25zIGZvdW5kIGluIHRo
YXQgZHJpdmVyIGludG8gaGVscGVycyBzaW5jZSB0aGV5IHdlcmUgZmFpcmx5IGdlbmVyaWMuCj4+
Cj4+IEhvd2V2ZXIsIGl0IGZlZWxzIGEgYml0IGNsdW5reSBvdmVyYWxsIGFuZCB0aGVyZSdzIGEg
ZmV3IHJvdWdoIGVkZ2VzIHRoYXQKPj4gc2hvdWxkIGJlIGFkZHJlc3NlZCBpbiBhIGdlbmVyaWMg
bWFubmVyOgo+Pgo+PiAgIC0gd2hpbGUgdGhlIGZvcm1hdCBuZWdvY2lhdGlvbiBtYWtlcyBzZW5z
ZSBmb3IgYSBicmlkZ2UsIGl0IGZlZWxzIGEgYml0Cj4+ICAgICBvdmVyLWVuZ2luZWVyZWQgZm9y
IGEgc2ltcGxlIGVuY29kZXIgd2hlcmUgdGhhdCBzZXR0aW5nIGNvdWxkIGJlIGEgCj4gc2ltcGxl
Cj4+ICAgICBzd2l0Y2ggKGFuZCBwb3NzaWJseSBhIHByb3BlcnR5PykKPiAKPiBQcm9wZXJ0eSBj
b3VsZCB3b3JrLCBidXQgcG9zc2libGUgdmFsdWVzIHNob3VsZCBiZSB0aGVuIGxpbWl0ZWQgdG8g
Y3Jvc3MgCj4gc2VjdGlvbiBvZiBIVyBhbmQgY29ubmVjdGVkIGRpc3BsYXkgY2FwYWJpbGl0aWVz
Lgo+IAo+Pgo+PiAgIC0gbW9yZSBpbXBvcnRhbnRseSwgd2hldGhlciB3ZSdyZSBjaG9vc2luZyBh
biBZVVYgb3V0cHV0IG9yIG5vdCBpcyAKPiBjb21wbGV0ZWx5Cj4+ICAgICBoaWRkZW4gYXdheSBm
cm9tIHRoZSB1c2Vyc3BhY2UgZXZlbiB0aG91Z2ggaXQgbWlnaHQgaGF2ZSBzb21lIGVmZmVjdCBv
biAKPiB0aGUKPj4gICAgIHZpc3VhbCBxdWFsaXR5IG91dHB1dCAodGhpbmtpbmcgYWJvdXQgWVVW
NDIwIGFuZCBZVVY0MjIgaGVyZSBtb3N0bHkpLgo+IAo+IElNTyBkcml2ZXIgc2hvdWxkIHNlbGVj
dCBoaWdoZXN0IGFjaGlldmFibGUgcXVhbGl0eS4gU28gaW4gY2FzZSBvZiBZVVY0MjAgYW5kIAo+
IFlVVjQyMiwgbGF0ZXIgc2hvdWxkIGJlIHNlbGVjdGVkLiBUaGlzIHNob3VsZCBiZSB0aGUgY2Fz
ZSBldmVuIGlmIHRoZSBwcm9wZXJ0eSAKPiBpcyBpbXBsZW1lbnRlZC4KPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gSmVybmVqCj4gCj4+Cj4+ICAgLSBTaW1pbGFybHksIHRoZSBsaXN0IHdlIHJlcG9ydCBp
cyBzdGF0aWMgYW5kIHRoZSB1c2Vyc3BhY2UgY2Fubm90IGNoYW5nZSAKPiBvcgo+PiAgICAgZm9y
Y2Ugb25lIG1vZGUgb3ZlciB0aGUgb3RoZXIuIFdlIHdpbGwgYWx3YXlzIHBpY2sgWVVWNDQ0IG92
ZXIgUkdCNDQ0IGlmCj4+ICAgICBib3RoIGFyZSBhdmFpbGFibGUgZm9yIGV4YW1wbGUuCj4+Cj4+
IFdoaWxlIHRoZSBmaXJzdCBvbmUgbWlnaHQganVzdCBiZSBkdWUgdG8gYSBsYWNrIG9mIGhlbHBl
cnMsIHRoZSBzZWNvbmQgYW5kCj4+IHRoaXJkIG9uZXMgYXJlIGFsc28gZmVlbGluZyBhIGJpdCBp
bmNvbnNpc3RlbnQgd2l0aCBob3cgd2UncmUgaGFuZGxpbmcgdGhlCj4+IDEwLzEyIGJpdCBvdXRw
dXQgZm9yIGV4YW1wbGUKCkFub3RoZXIgcG9pbnRzIGZvciBZVVY0MjIgYW5kIFlVVjQyMCBhcmU6
Ci0gbWFuZGF0b3J5IFlVVjQyMCBmb3IgcHJlLUhETUkyIGRpc3BsYXlzIHRvIGFjaGlldmUgNGs2
MCB3aXRoIEhETUkxLjQgbWF4IFRETVMKLSBwb3NzaWJpbGl0eSB0byBhY2hpZXZlIGZhY3Rvcmlh
bCBmcmVxdWVuY2llcyBmb3IgMTAvMTJiaXRzLCBpdCdzIG5vdCB0aGUgY2FzZSBmb3IgWVVWNDIy
LCBpdCdzIHRoZSBzYW1lIFRNRFMgY2hhcmFjdGVyIHJhdGUgZm9yIDgsIDE5LCAxMiBhbmQgMTZi
aXRzCi0gc2VsZWN0aW5nIFlVVjQyMiBpbnN0ZWFkIG9mIFlVVjQ0NCBmb3IgMTAvMTIvMTYgZm9y
IDRrNjAgaW4gSERNSTIuMAoKVG9kYXkgd2UgZG8gbm90IHRha2UgaW4gYWNjb3VudCB0aGUgU0NE
QyBmZWVkYmFjayBmcm9tIHRoZSBkaXNwbGF5LCBidXQgYXQgc29tZSBwb2ludCB3ZSBzaG91bGQK
bW9uaXRvciB0aGUgU2NyYW1ibGluZ19TdGF0dXMgYW5kIENoYXJhY3RlciBFcnJvciBEZXRlY3Rp
b24gdG8gbG93ZXIgZG93biBmcm9tIFlVVjQ0NCB0byA0MjIgYW5kIDQyMApmb3IgZXhhbXBsZS4K
Ck5laWwKCj4+Cj4+IExldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLAo+PiBNYXhpbWUKPj4KPj4g
TWF4aW1lIFJpcGFyZCAoMTgpOgo+PiAgIGRybTogSW50cm9kdWNlIG5ldyBIRE1JIGhlbHBlcnMK
Pj4gICBkcm0vYnJpZGdlOiBBZGQgSERNSSBvdXRwdXQgZm10IGhlbHBlcgo+PiAgIGRybS9icmlk
Z2U6IGR3LWhkbWk6IFVzZSBoZWxwZXJzCj4+ICAgZHJtL3ZjNDogdHhwOiBQcm9wZXJseSBzZXQg
dGhlIHBvc3NpYmxlX2NydGNzIG1hc2sKPj4gICBkcm0vdmM0OiBjcnRjOiBTa2lwIHRoZSBUWFAK
Pj4gICBkcm0vdmM0OiBSZXdvcmsgdGhlIGVuY29kZXIgcmV0cmlldmFsIGNvZGUKPj4gICBkcm0v
dmM0OiBoZG1pOiBBZGQgZnVsbCByYW5nZSBSR0IgaGVscGVyCj4+ICAgZHJtL3ZjNDogaGRtaTog
VXNlIGZ1bGwgcmFuZ2UgaGVscGVyIGluIGNzYyBmdW5jdGlvbnMKPj4gICBkcm0vdmM0OiBoZG1p
OiBSZW1vdmUgbGltaXRlZF9yZ2JfcmFuZ2UKPj4gICBkcm0vdmM0OiBoZG1pOiBDb252ZXJ0IHRv
IGJyaWRnZQo+PiAgIGRybS92YzQ6IGhkbWk6IE1vdmUgWEJBUiBzZXR1cCB0byBjc2Nfc2V0dXAK
Pj4gICBkcm0vdmM0OiBoZG1pOiBSZXBsYWNlIENTQ19DVEwgaGFyZGNvZGVkIHZhbHVlIGJ5IGRl
ZmluZXMKPj4gICBkcm0vdmM0OiBoZG1pOiBEZWZpbmUgY29sb3JzcGFjZSBtYXRyaWNlcwo+PiAg
IGRybS92YzQ6IGhkbWk6IENoYW5nZSBDU0MgY2FsbGJhY2sgcHJvdG90eXBlCj4+ICAgZHJtL3Zj
NDogaGRtaTogUmV3b3JrIHRoZSBpbmZvZnJhbWUgcHJvdG90eXBlCj4+ICAgZHJtL3ZjNDogaGRt
aTogU3VwcG9ydCBIRE1JIFlVViBvdXRwdXQKPj4gICBkcm0vdmM0OiBoZG1pOiBNb3ZlIHRoZSBw
aXhlbCByYXRlIGNhbGN1bGF0aW9uIHRvIGEgaGVscGVyCj4+ICAgZHJtL3ZjNDogaGRtaTogRm9y
Y2UgWVVWNDIyIGlmIHRoZSByYXRlIGlzIHRvbyBoaWdoCj4+Cj4+ICBkcml2ZXJzL2dwdS9kcm0v
TWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+PiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAyNjggKystLS0tLS0tLS0tLS0tCj4+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2JyaWRnZS5jICAgICAgICAgICAgICB8IDExOCArKysrKysrCj4+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2hkbWkuYyAgICAgICAgICAgICAgICB8IDE3MCArKysrKysrKysKPj4g
IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2NydGMuYyAgICAgICAgICAgIHwgIDU5ICsrKy0KPj4g
IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jICAgICAgICAgICAgIHwgIDQxICsrKwo+PiAg
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmggICAgICAgICAgICAgfCAgMjYgKy0KPj4gIGRy
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyAgICAgICAgICAgIHwgMzk5ICsrKysrKysrKysr
KysrKy0tLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuaCAgICAgICAgICAg
IHwgIDEzICstCj4+ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pX3JlZ3MuaCAgICAgICB8
ICAgNiArCj4+ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9yZWdzLmggICAgICAgICAgICB8ICAx
OSArKwo+PiAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMgICAgICAgICAgICAgfCAgIDIg
Ky0KPj4gIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAgICAgICAgICAgICAgICAgIHwgICA2ICsK
Pj4gIGluY2x1ZGUvZHJtL2RybV9oZG1pLmggICAgICAgICAgICAgICAgICAgIHwgIDI0ICsrCj4+
ICAxNCBmaWxlcyBjaGFuZ2VkLCA3NzAgaW5zZXJ0aW9ucygrKSwgMzgzIGRlbGV0aW9ucygtKQo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1faGRtaS5jCj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZHJtX2hkbWkuaAo+Pgo+PiAtLSAKPj4gMi4zMC4y
Cj4+Cj4+Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
