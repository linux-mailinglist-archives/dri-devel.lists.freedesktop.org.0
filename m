Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA450CF3CF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195E6E207;
	Tue,  8 Oct 2019 07:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D336E14D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 18:43:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h33so13380029edh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 11:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZuQdDyWsqYD2ABpjzuaYMlyNtofNUDV9L/YfiTkcKyw=;
 b=Y6e7obXWGmqa9O3CJ6uHfjIWZCdZcBBJ6laROZmyGQZCSA+K0SxPTpHHAVUbWAXE/W
 5CAhlKT/pQBoUh2RI0tSBt1UIafdHKRf6Tcglrv5erROuPidzK4mOK6vH/VmuPbgdE/s
 e02TtoJ7OC7N3EZMVBsNKbiB2Nmborv92SFPxwsCJdUMzmzST+FksO9VCQYrSHmHKzbp
 5vrbe1Y13R+6PdJ25wdJBQzy/ibyLiN1H891WBXIJ+Z3dNwtVJ7w570WSCsfK3t2WhkW
 qQLiOFHzDDAbRkMtmZCXLHASkqoW6oH2bE5butjdf0u2aXztjk/eHOQ3oey81YA/RDVa
 y/aw==
X-Gm-Message-State: APjAAAWKPmZiAjP1TwOJ/Wnpl6PzgwpLc8A5YxTsCEEny3rovO+2a7n3
 id4rAlBP2PrdB54Ao8PDY1KMd/ICC3gLPbcJ
X-Google-Smtp-Source: APXvYqwuixYFB2yGu5CnXRGdHc4GNLnhNp+woe0QDiSmMSCQDnzOTxXR7Ds0ueVw0FX8Mmi3l2mPZw==
X-Received: by 2002:a50:9fe5:: with SMTP id c92mr30392512edf.280.1570473813954; 
 Mon, 07 Oct 2019 11:43:33 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-35.cgn.fibianet.dk.
 [5.186.115.35])
 by smtp.gmail.com with ESMTPSA id k10sm3487005edb.68.2019.10.07.11.43.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 11:43:33 -0700 (PDT)
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
 <20191007152800.3nhbf7h7knumriz4@holly.lan>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
Date: Mon, 7 Oct 2019 20:43:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007152800.3nhbf7h7knumriz4@holly.lan>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZuQdDyWsqYD2ABpjzuaYMlyNtofNUDV9L/YfiTkcKyw=;
 b=AtuT6ONerZTAjRxy0hah42Bky6hjxkP4woYIr+bGSczhAipeFOav21Z1EHHKAgOYcw
 OpYPAW/p8M/c/E152ZeiMojnVRl3VCuBWf9gipumax7CyDatkTSeIaHiukmskK10TS7e
 Wt1bS84GEhhkbBj2nZo1C7iLWFzHw7yB/IvOk=
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

T24gMDcvMTAvMjAxOSAxNy4yOCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIFRodSwgU2Vw
IDE5LCAyMDE5IGF0IDA0OjA2OjE4UE0gKzAyMDAsIFJhc211cyBWaWxsZW1vZXMgd3JvdGU6Cj4g
Cj4gSXQgZmVlbHMgbGlrZSB0aGVyZSBpcyBzb21lIHJhdGlvbmFsZSBtaXNzaW5nIGluIHRoZSBk
ZXNjcmlwdGlvbiBoZXJlLgo+IAo+IFdoYXQgaXMgdGhlIGJlbmVmaXQgb2YgcmVwbGFjaW5nIHRo
ZSBleHBsaWNpdCBpbnRfcG93KCkgd2l0aCB0aGUKPiBpbXBsaWNpdCBtdWx0aXBsaWNhdGlvbnM/
Cj4gCj4gCj4gRGFuaWVsLgo+IAo+IAo+Pgo+PiBXZSBjb3VsZCAoYW5kIGEgZm9sbG93aW5nIHBh
dGNoIHdpbGwpIGNoYW5nZSB0byB1c2UgYSBwb3dlci1vZi0yIHNjYWxlLAo+PiBidXQgZm9yIGEg
Zml4ZWQgc21hbGwgZXhwb25lbnQgb2YgMywgdGhlcmUncyBubyBhZHZhbnRhZ2UgaW4gdXNpbmcK
Pj4gcmVwZWF0ZWQgc3F1YXJpbmcuCgogICBeXl5eXl5eXl5eXl5eXl5eXl4gICAgICAgICAgICAg
ICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgoKQXBhcnQgZnJvbSB0aGUgZnVuY3Rp
b24gY2FsbCBvdmVyaGVhZCAoYW5kIHJlc3VsdGluZyByZWdpc3RlciBwcmVzc3VyZQpldGMuKSwg
dXNpbmcgaW50X3BvdyBpcyBsZXNzIGVmZmljaWVudCAoZm9yIGFuIGV4cG9uZW50IG9mIDMsIGl0
IGVuZHMgdXAKZG9pbmcgZm91ciA2NHg2NCBtdWx0aXBsaWNhdGlvbnMgaW5zdGVhZCBvZiBqdXN0
IHR3bykuIEJ1dCBmZWVsIGZyZWUgdG8KZHJvcCBpdCwgSSdtIG5vdCBnb2luZyB0byBwdXJzdWUg
aXQgZnVydGhlciAtIGl0IGp1c3Qgc2VlbWVkIGxpa2UgYQpzZW5zaWJsZSB0aGluZyB0byBkbyB3
aGlsZSBJIHdhcyBvcHRpbWl6aW5nIHRoZSBjb2RlIGFueXdheS4KCltBdCB0aGUgdGltZSBJIHdy
b3RlIHRoZSBwYXRjaCwgdGhpcyB3YXMgYWxzbyB0aGUgb25seSB1c2VyIG9mIGludF9wb3cKaW4g
dGhlIHRyZWUsIHNvIGl0IGFsc28gYWxsb3dlZCByZW1vdmluZyBpbnRfcG93IGFsdG9nZXRoZXIu
XQoKUmFzbXVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
