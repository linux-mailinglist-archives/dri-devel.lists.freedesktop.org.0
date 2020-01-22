Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA10146349
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69A66FB24;
	Thu, 23 Jan 2020 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D996F5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 16:54:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so8126152wrq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DM1d73/VoF6vIcU47F5e8EsG7Wr6ebQt+4pVusl9w1Y=;
 b=vMRe/fAEtTSfL2cR5LPkRGc+1SQszNAIpIQ4UnKHnDnqxHeGVelwMucGC4rrO7n4db
 R5c1YaczIfS0lC8A6/4Xox1jdfI0LDiLfWukgKL2yVP6qKJDnGmpgv2F91PCauFNjNI2
 t0T7ZWqStLxb6dAS2Ni37KgdYqkmhXO8wZ5KSy5bAqnE5/RKRHyeDhoO1lhEqm94wXws
 UtaHkVzggIlZoc+chhb5jinfYgICgzEir+dJ8I4PGh+Sk4ZhAE9sjX54aTS7u7JHbXK/
 vUvlqgIPwucpfrz5/99La2K2aJqLzYCMrDDxlFrLbzhsJ05cMvpDZoQFOGFJXIRrpAR6
 /1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DM1d73/VoF6vIcU47F5e8EsG7Wr6ebQt+4pVusl9w1Y=;
 b=tdg1f72u0EmJ0zH78wO1u95njeJ62TyDziN65c5k7qPJb11Lz2XOObMfl+Tn2qA6Lj
 4zdPhrp5ZKyR/VFWww/CR2dXLyrDUZZrZKklPYLKoeFt87F4kGhQO6BKvTQGOqhB2kBP
 YWpNXY3cDEVmzjHRgck4fLHRiI2RqV4bf+p2ttG/ykE0tTlEmq1evBIrq1cZ0kbOYEwI
 kxmdy1YvP3EG7AVedZqSG9Q9qLMUHERvb3Px9iCxXV4nPf9GuS4DfniVKKi8aiIT4u3J
 bIBR/aZergA31OT7yfniYmBn1kiKwTp8VNO81uG0FfQ+bGJPA8NFQnl3E73M80hpTfQy
 OtTQ==
X-Gm-Message-State: APjAAAVK06o9q4VF3eWPggfSyVqKbzl0sVe3LY/dWoUhjeUI9BUsGC4j
 kmazrNkAdjRL5qq/6t24uxsXCw==
X-Google-Smtp-Source: APXvYqx83qjv8lgIRz1T8W3VPyOCHXAj3czhH4MS6m3/mkUBnDcXqw3qig4Pczf6oz2NuqtJJW9X8A==
X-Received: by 2002:a5d:5234:: with SMTP id i20mr12869805wra.403.1579712097436; 
 Wed, 22 Jan 2020 08:54:57 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id w8sm5276922wmm.0.2020.01.22.08.54.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jan 2020 08:54:56 -0800 (PST)
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <747a1c94-8eee-f46a-fcc7-d111cd9df70d@linaro.org>
Date: Wed, 22 Jan 2020 18:54:54 +0200
MIME-Version: 1.0
In-Reply-To: <20191220115653.6487-5-a.swigon@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJ0dXIsCgpUaGFuayB5b3UgZm9yIHlvdXIgY29udGludW91cyB3b3JrIG9uIHRoaXMuCgpP
biAxMi8yMC8xOSAxMzo1NiwgQXJ0dXIgxZp3aWdvxYQgd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyB0byB0aGUgRXh5bm9zNDQxMiBEVDoKPiAgIC0gZXh5
bm9zLGludGVyY29ubmVjdC1wYXJlbnQtbm9kZTogdG8gZGVjbGFyZSBjb25uZWN0aW9ucyBiZXR3
ZWVuCj4gICAgIG5vZGVzIGluIG9yZGVyIHRvIGd1YXJhbnRlZSBQTSBRb1MgcmVxdWlyZW1lbnRz
IGJldHdlZW4gbm9kZXM7CgpJcyB0aGlzIERUIHByb3BlcnR5IGRvY3VtZW50ZWQgc29tZXdoZXJl
PyBJIGJlbGlldmUgdGhhdCB0aGVyZSBzaG91bGQgYmUgYSBwYXRjaAp0byBkb2N1bWVudCBpdCBz
b21ld2hlcmUgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLyBiZWZvcmUgdXNp
bmcgaXQuCgpUaGFua3MsCkdlb3JnaQoKPiAgIC0gI2ludGVyY29ubmVjdC1jZWxsczogcmVxdWly
ZWQgYnkgdGhlIGludGVyY29ubmVjdCBmcmFtZXdvcmsuCj4gCj4gTm90ZSB0aGF0ICNpbnRlcmNv
bm5lY3QtY2VsbHMgaXMgYWx3YXlzIHplcm8gYW5kIG5vZGUgSURzIGFyZSBub3QKPiBoYXJkY29k
ZWQgYW55d2hlcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29u
QHNhbXN1bmcuY29tPgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9p
ZC1jb21tb24uZHRzaSB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1j
b21tb24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5k
dHNpCj4gaW5kZXggNGNlM2Q3N2E2NzA0Li5kOWQ3MGVhY2ZjYWYgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiArKysgYi9hcmNo
L2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaQo+IEBAIC05MCw2ICs5
MCw3IEBACj4gICZidXNfZG1jIHsKPiAgCWV4eW5vcyxwcG11LWRldmljZSA9IDwmcHBtdV9kbWMw
XzM+LCA8JnBwbXVfZG1jMV8zPjsKPiAgCXZkZC1zdXBwbHkgPSA8JmJ1Y2sxX3JlZz47Cj4gKwkj
aW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+ICAK
PiBAQCAtMTA2LDYgKzEwNyw4IEBACj4gICZidXNfbGVmdGJ1cyB7Cj4gIAlleHlub3MscHBtdS1k
ZXZpY2UgPSA8JnBwbXVfbGVmdGJ1c18zPiwgPCZwcG11X3JpZ2h0YnVzXzM+Owo+ICAJdmRkLXN1
cHBseSA9IDwmYnVjazNfcmVnPjsKPiArCWV4eW5vcyxpbnRlcmNvbm5lY3QtcGFyZW50LW5vZGUg
PSA8JmJ1c19kbWM+Owo+ICsJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPiAgCXN0YXR1cyA9
ICJva2F5IjsKPiAgfTsKPiAgCj4gQEAgLTExNiw2ICsxMTksOCBAQAo+ICAKPiAgJmJ1c19kaXNw
bGF5IHsKPiAgCWV4eW5vcyxwYXJlbnQtYnVzID0gPCZidXNfbGVmdGJ1cz47Cj4gKwlleHlub3Ms
aW50ZXJjb25uZWN0LXBhcmVudC1ub2RlID0gPCZidXNfbGVmdGJ1cz47Cj4gKwkjaW50ZXJjb25u
ZWN0LWNlbGxzID0gPDA+Owo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+ICAKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
