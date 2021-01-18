Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840DB2FA442
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 16:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9B16E2ED;
	Mon, 18 Jan 2021 15:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68746E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 15:14:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d13so16766398wrc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Mhcih1eYh0LxVesbDYCLtoXGjUIlRRqj4fd7NliM9JA=;
 b=hpeONygIXphRjelAD1MQktI0PXSaE17ad0PUs8bwulKzVzsUsJ7JDMp1mPyDtR1CgR
 EpWadZ0NxsMqt4D00YAevnRerXxPXnk1aKrIhavsOYrrF4OUf7dptHL9kd0Dq0+dkHte
 CsL90L5L0Mbax0IOWMJwNC8pbik6l2RwdiuXBG2F5vm8Gm5mZ8tm0Rzh8R+R9zHvxhdN
 ugIAAq8ur43kgqARhYPd1qjEM7YlBNTKUsAwdNbn+JJezx7IjDi4Vg6RcXP98Fx3Lusx
 HHvJEhVuN/9oWc0+CfdyeD4Hmltey6xeIZcbLym2oAcBfrAuSq73dKdL62ZXbrnBcrOR
 6jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Mhcih1eYh0LxVesbDYCLtoXGjUIlRRqj4fd7NliM9JA=;
 b=NPt95hgkhtj5we3fAtR45Nen3CfihRQ9WFnN1maFd3/KEMydy1PueqHpBR5NH1xXYy
 W0KoLdoQXqIvnNIvzmDyUMNKQVMiue4avdeZOAO3vuTe2hMamK5YbvCdEYqX6JD3gz49
 X9ufxka3ixzcvnPQRLyIO1WDet2IYGnY7zSMgCSLJK0sAj2rNd/ZX+0Et4R8ppnK4erK
 KlFmACZQrWtsZltvbsZWwpn2lMeYvjw5MjUVFM/YyLaWTyjgud5qYRxfpQevwW7jeK5A
 l63dtkrtXz6/DPex357nuG4siYPM2ILZyR0w4trIo8Xpdbio2qCgmChS6m4xjKUD0tIm
 60TQ==
X-Gm-Message-State: AOAM531LMq1uw/yAerv7hkUVkNYYySs10MVnR3cF6dPY/PrmyHTYEPZI
 /Gt8ZwY0oy94QQ7Sf+ybMb5KAQ==
X-Google-Smtp-Source: ABdhPJzSbDcchoOxWnBuY+J13MlJTPjfu+wsJpGH3PMetNE7K4jjc1FwqpuTQqqtiniVnZJYO3B2aQ==
X-Received: by 2002:adf:e8c5:: with SMTP id k5mr21612541wrn.242.1610982860525; 
 Mon, 18 Jan 2021 07:14:20 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id y11sm26765551wmi.0.2021.01.18.07.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 07:14:19 -0800 (PST)
Date: Mon, 18 Jan 2021 15:14:18 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v9] backlight: lms283gf05: Convert to GPIO descriptors
Message-ID: <20210118151418.GG4903@dell>
References: <20210118132322.7282-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118132322.7282-1-linus.walleij@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOCBKYW4gMjAyMSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBjb252ZXJ0
cyB0aGUgbG1zMjgzZ2YwNSBiYWNrbGlnaHQgZHJpdmVyIHRvIHVzZSBHUElPCj4gZGVzY3JpcHRv
cnMgYW5kIHN3aXRjaGVzIHRoZSBzaW5nbGUgUFhBIFBhbG0gWjIgZGV2aWNlCj4gb3ZlciB0byBk
ZWZpbmluZyB0aGVzZS4KPiAKPiBTaW5jZSB0aGUgcGxhdGZvcm0gZGF0YSB3YXMgb25seSB1c2Vk
IHRvIGNvbnZleSBHUElPCj4gaW5mb3JtYXRpb24gd2UgY2FuIGRlbGV0ZSB0aGUgcGxhdGZvcm0g
ZGF0YSBoZWFkZXIuCj4gCj4gTm90aWNlIHRoYXQgd2UgZGVmaW5lIHRoZSBwcm9wZXIgYWN0aXZl
IGxvdyBzZW1hbnRpY3MgaW4KPiB0aGUgYm9hcmQgZmlsZSBHUElPIGRlc2NyaXB0b3IgdGFibGUg
KGFjdGl2ZSBsb3cpIGFuZAo+IGFzc2VydCB0aGUgcmVzZXQgbGluZSBieSBicmluZ2luZyBpdCB0
byAiMSIgKGFzc2VydGVkKS4KPiAKPiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4g
Q2M6IEhhb2ppYW4gWmh1YW5nIDxoYW9qaWFuLnpodWFuZ0BnbWFpbC5jb20+Cj4gQ2M6IFJvYmVy
dCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwg
TWFjayA8ZGFuaWVsQHpvbnF1ZS5vcmc+Cj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CgpPa2F5LCBpcyB0aGF0IGV2ZXJ5b25lPwoKPiAtLS0KPiBDaGFuZ2VM
b2cgdjgtPnY5Ogo+IC0gQ29sbGVjdCBBQ0tzIQo+IC0gQmFja2xpZ2h0IG1haW50YWluZXJzOiBw
bGVhc2UgbWVyZ2UgdGhpcyBpbnRvIHRoZSBiYWNrbGlnaHQKPiAgIHRyZWUuCj4gQ2hhbmdlTG9n
IHY3LT52ODoKPiAtIFJlYmFzZSBvbnRvIHY1LjExLXJjMQo+IC0gSSB3b25kZXIgd2h5IHRoaXMg
bmV2ZXIgc2VlbXMgdG8gZ2V0IG1lcmdlZC4uLj8KPiBDaGFuZ2VMb2cgdjYtPnY3Ogo+IC0gUmVi
YXNlIG9udG8gdjUuMTAtcmMxCj4gQ2hhbmdlTG9nIHY1LT52NjoKPiAtIFJlYmFzZSBvbnRvIHY1
LjktcmMxCj4gQ2hhbmdlTG9nIHY0LT52NToKPiAtIFJlYmFzZSBvbiB2NS44LXJjMQo+IC0gQ29s
bGVjdGVkIERhbmllbCdzIFJldmlld2VkLWJ5IHRhZy4KPiBDaGFuZ2VMb2cgdjMtPnY0Ogo+IC0g
Q2hlY2sgSVNfRVJSKCkgb24gdGhlIHJldHVybmVkIEdQSU8gZGVzY3JpcHRvci4KPiAtIFVuY29u
ZGl0aW9uYWxseSBzZXQgY29uc3VtZXIgbmFtZSBzaW5jZSB0aGUgQVBJIHRvbGVyYXRlcyBOVUxM
Lgo+IENoYW5nZUxvZyB2Mi0+djM6Cj4gLSBGaXggYSB1c2UtYmVmb3JlLWFsbG9jYXRlZCBidWcg
ZGlzY292ZXJlZCBieSBjb21waWxlIHRlc3RzLgo+IC0gUmVtb3ZlIHVudXNlZCByZXQgdmFyaWFi
bGUgYXMgYXV0b2J1aWxkZXJzIGNvbXBsYWluZWQuCj4gQ2hhbmdlTG9nIHYxLT52MjoKPiAtIEJy
aW5nIHVwIHRoZSBHUElPIGRlLWFzc2VydGVkIGluIHByb2JlKCkKPiAKPiBNYXJlazogSSBzYXcg
dGhpcyB3YXMgd3JpdHRlbiBieSB5b3UsIGFyZSB5b3UgcmVndWxhcmx5Cj4gdGVzdGluZyB0aGUg
WjIgZGV2aWNlPwo+IC0tLQo+ICBhcmNoL2FybS9tYWNoLXB4YS96Mi5jICAgICAgICAgICAgICAg
fCAxMiArKysrKy0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXMyODNnZjA1LmMgfCA0
MyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvc3BpL2xtczI4
M2dmMDUuaCAgICAgICB8IDE2IC0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2xpbnV4L3NwaS9sbXMyODNnZjA1LmgKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
