Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86904E8A3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDA06E1D6;
	Fri, 21 Jun 2019 13:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4966E1D6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:11:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so6593460wru.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fxdvG1YqTbyR6vcDjpGhx6WnfGe1yLJRyYtOlZLiDs=;
 b=SlrWeBWPsfZx0UNtpiq6rM3RPPZ68Iy5K5x3cpd4qXGdV+w+JJsNCdSl2grNGaH5lA
 yET4dQVnRgv4WbAar7pGI511MsJmYyoKLM7kHuhZavYv64yDGin5ak/m3Ew/SxsVuuIl
 il/RzLE5h03MHpD822PKvO38xUk7rfOlUe1sHJvjqmBa4P7L5Bnek8qUSw0L5b4BGW33
 htMDzFLaEVlPoB1f0iy0Z51r7cCAgUp3D4iJW9zr2x8gzjQw1JqDWIyAiWjYD2QXNf87
 pyCWpALpC7F9bjZLHN4+gPnbCUedUfKGhjjPFbQ+dOpoKL6WSyuk/Id+gZCURmLVE1ix
 7PsQ==
X-Gm-Message-State: APjAAAXhkoGVdnxHM0jy6IsAmNbOKCHHd0cjeLORMnhBGgzsziujMPAL
 WuFxcLufDepAga0w5IcSZ1kAsaGRSq4ByA==
X-Google-Smtp-Source: APXvYqyzWEFupivPrVGavsYJhAIUvkZ/P2nQGpVne3EkeXkX4Ig0R+ggxkv0fqoAH9JOVfUn34MIYw==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr20747571wrw.65.1561122689748; 
 Fri, 21 Jun 2019 06:11:29 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id t63sm2843698wmt.6.2019.06.21.06.11.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 06:11:29 -0700 (PDT)
Subject: Re: [PATCH 56/59] drm/todo: Update backlight todo
To: dri-devel@lists.freedesktop.org
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-57-daniel.vetter@ffwll.ch>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <df8d4b25-4f00-b099-60ec-8cc82a4c5816@linaro.org>
Date: Fri, 21 Jun 2019 14:11:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614203615.12639-57-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8fxdvG1YqTbyR6vcDjpGhx6WnfGe1yLJRyYtOlZLiDs=;
 b=fsX+Nm6fhqoBaujGNWYUNMCa/V3junVr9nDQn3T6IkKYAAY8+l4CkU7ZHX+T3jQet8
 Rg6YKBabXJj0pTWCfil3ItfoEH1FF8+2+fFdxm3OqnhZD1YUC0wDkXCNy3Ged1yluqjX
 YjUYFtXlGqRzMOBNrCpH45SIzgypNz+lFBGzbHWeoCsVIh+MStFwMjulBzR0xpHELFrk
 9xc9oLnvn8leLQAa3LSXFYuOsmBU5o6WioTCl2iYRvMpR8qMeD/ygUYKnONhcUdpaKff
 AY2sUF9xkT/scdA6T5JzPXPDadjlmOhopFpMoT4MOVmpMCxV4NBMkPlm2+FlPtRtty1c
 RhSQ==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDYvMjAxOSAyMTozNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBCYXNpYyBoZWxwZXJz
IGhhdmUgYmVlbiBleHRyYWN0ZWQsIG5vdyB0aGVyZSdzIGEgcGlsZSBtb3JlIHRvZG8gc3RpbGwK
PiBhY3Jvc3MgdGhlIGVudGlyZSB0cmVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgoKTm8gZGlzYWdyZWVtZW50IGhlcmUuLi4gc28g
RldJVzoKClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5h
cm8ub3JnPgoKCkRhbmllbC4KCj4gLS0tCj4gICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8
IDI3ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gaW5kZXggMjFh
N2I3ODAwZDNlLi5jNGU3YzA2NzJhMTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUv
dG9kby5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IEBAIC00MjIsNiAr
NDIyLDE5IEBAIGZpdCB0aGUgYXZhaWxhYmxlIHRpbWUuCj4gICAKPiAgIENvbnRhY3Q6IERhbmll
bCBWZXR0ZXIKPiAgIAo+ICtCYWNrbGlnaHQgUmVmYWN0b3JpbmcKPiArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gKwo+ICtCYWNrbGlnaHQgZHJpdmVycyBoYXZlIGEgdHJpcGxlIGVuYWJsZS9kaXNh
YmxlIHN0YXRlLCB3aGljaCBpcyBhIGJpdCBvdmVya2lsbC4KPiArUGxhbiB0byBmaXggdGhpczoK
PiArCj4gKzEuIFJvbGwgb3V0IGJhY2tsaWdodF9lbmFibGUoKSBhbmQgYmFja2xpZ2h0X2Rpc2Fi
bGUoKSBoZWxwZXJzIGV2ZXJ5d2hlcmUuIFRoaXMKPiArICAgaGFzIHN0YXJ0ZWQgYWxyZWFkeS4K
PiArMi4gSW4gYWxsLCBvbmx5IGxvb2sgYXQgb25lIG9mIHRoZSB0aHJlZSBzdGF0dXMgYml0cyBz
ZXQgYnkgdGhlIGFib3ZlIGhlbHBlcnMuCj4gKzMuIFJlbW92ZSB0aGUgb3RoZXIgdHdvIHN0YXR1
cyBiaXRzLgo+ICsKPiArQ29udGFjdDogRGFuaWVsIFZldHRlcgo+ICsKPiAgIERyaXZlciBTcGVj
aWZpYwo+ICAgPT09PT09PT09PT09PT09Cj4gICAKPiBAQCAtNDMxLDIwICs0NDQsNiBAQCB0aW55
ZHJtCj4gICBUaW55ZHJtIGlzIHRoZSBoZWxwZXIgZHJpdmVyIGZvciByZWFsbHkgc2ltcGxlIGZi
IGRyaXZlcnMuIFRoZSBnb2FsIGlzIHRvIG1ha2UKPiAgIHRob3NlIGRyaXZlcnMgYXMgc2ltcGxl
IGFzIHBvc3NpYmxlLCBzbyBsb3RzIG9mIHJvb20gZm9yIHJlZmFjdG9yaW5nOgo+ICAgCj4gLS0g
YmFja2xpZ2h0IGhlbHBlcnMsIHByb2JhYmx5IGJlc3QgdG8gcHV0IHRoZW0gaW50byBhIG5ldyBk
cm1fYmFja2xpZ2h0LmMuCj4gLSAgVGhpcyBpcyBiZWNhdXNlIGRyaXZlcnMvdmlkZW8gaXMgZGUt
ZmFjdG8gdW5tYWludGFpbmVkLiBXZSBjb3VsZCBhbHNvCj4gLSAgbW92ZSBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodCB0byBkcml2ZXJzL2dwdS9iYWNrbGlnaHQgYW5kIHRha2UgaXQgYWxsCj4gLSAg
b3ZlciB3aXRoaW4gZHJtLW1pc2MsIGJ1dCB0aGF0J3MgbW9yZSB3b3JrLiBCYWNrbGlnaHQgaGVs
cGVycyByZXF1aXJlIGEgZmFpcgo+IC0gIGJpdCBvZiByZXdvcmtpbmcgYW5kIHJlZmFjdG9yaW5n
LiBBIHNpbXBsZSBleGFtcGxlIGlzIHRoZSBlbmFibGluZyBvZiBhIGJhY2tsaWdodC4KPiAtICBU
aW55ZHJtIGhhcyBoZWxwZXJzIGZvciB0aGlzLiBJdCB3b3VsZCBiZSBnb29kIGlmIG90aGVyIGRy
aXZlcnMgY2FuIGFsc28gdXNlIHRoZQo+IC0gIGhlbHBlci4gSG93ZXZlciwgdGhlcmUgYXJlIHZh
cmlvdXMgY2FzZXMgd2UgbmVlZCB0byBjb25zaWRlciBpLmUgZGlmZmVyZW50Cj4gLSAgZHJpdmVy
cyBzZWVtIHRvIGhhdmUgZGlmZmVyZW50IHdheXMgb2YgZW5hYmxpbmcvZGlzYWJsaW5nIGEgYmFj
a2xpZ2h0Lgo+IC0gIFdlIGFsc28gbmVlZCB0byBjb25zaWRlciB0aGUgYmFja2xpZ2h0IGRyaXZl
cnMgKGxpa2UgZ3Bpb19iYWNrbGlnaHQpLiBUaGUgc2l0dWF0aW9uCj4gLSAgaXMgZnVydGhlciBj
b21wbGljYXRlZCBieSB0aGUgZmFjdCB0aGF0IHRoZSBiYWNrbGlnaHQgaXMgdGllZCB0byBmYmRl
dgo+IC0gIHZpYSBmYl9ub3RpZmllcl9jYWxsYmFjaygpIHdoaWNoIGhhcyBjb21wbGljYXRlZCBs
b2dpYy4gRm9yIGZ1cnRoZXIgZGV0YWlscywgcmVmZXIKPiAtICB0byB0aGUgZm9sbG93aW5nIGRp
c2N1c3Npb24gdGhyZWFkOgo+IC0gIGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZm9ydW0vIyF0
b3BpYy9vdXRyZWFjaHkta2VybmVsLzhyQmUzMGx3dGRBCj4gLQo+ICAgLSBzcGkgaGVscGVycywg
cHJvYmFibHkgYmVzdCBwdXQgaW50byBzcGkgY29yZS9oZWxwZXIgY29kZS4gVGhpZXJyeSBzYWlk
Cj4gICAgIHRoZSBzcGkgbWFpbnRhaW5lciBpcyBmYXN0JnJlYWN0aXZlLCBzbyBzaG91bGRuJ3Qg
YmUgYSBiaWcgaXNzdWUuCj4gICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
