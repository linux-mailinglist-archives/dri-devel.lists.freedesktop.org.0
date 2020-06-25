Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCC209C2E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7606EA03;
	Thu, 25 Jun 2020 09:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A576EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:45:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so4894669wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T96Cw/B2VdIT350ot7UQTHC8Op+bJn2wrxV9Mj1Tufs=;
 b=UgGBQ0407zaBUunWxSaTxaAU9RpsMyNFk0zmjnxT4oUPgOMS0mUttZchCHkE/Duc81
 3Euu/xzSY0D/RHY6H3f+8L7EBv9pJX6LJ1rgu8XHtFP5DLdQy2U6XBszjzYjLcoASf4o
 13aHCVwSn20u5Y3Rjp5ofbVSJfgcaQlozvioeTOq9qtTjkWRatE7Nw+DInt6u9IlcT8D
 WKiewW7DiiF1VAoAWFrcuQ7Gn9Z7Bx8CXeSjsrM0QoK+BF8FVXERG33Pivml1z/BFL3x
 Pu8dqCmf4p41S4/ENV7loy9Ht76Jl+v26ayWmEU+FNaUyCIDZiOvcHBccY3I3p5geuLQ
 ///Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T96Cw/B2VdIT350ot7UQTHC8Op+bJn2wrxV9Mj1Tufs=;
 b=l5MUI6AHHG/x7v6MWEpSxqBb0cqzwcacDAauJe2uka5nl/15V9mDNXBU6bPv4H9Gm3
 AuQ9lFk85pKZeAEYfJjWAjHDdpZuPO96sfCgj81xn5eLq9f7TnG/0PwkvwaAiqf7vvXV
 s1UYtqupMHgtahNOTrPyuLeHkMA2h+Eh/83wg9gDakw3IiVQhSXZEviWe+8wPr3oHXhY
 x3hwHIe0eZFirGRKGsUolVc1qCu6rNjtFL+1rireD7U51Zkx3KIbwivfaYXIOCr/BwHg
 UQfD6QgdXZOnALs7ZYZivchfFnRomL8u01VF6EJox+mB9EN4puEI2etGyWTI5EKsUumx
 keLg==
X-Gm-Message-State: AOAM531IMe6Rcw7x47fUj9RjrCXZ9YjJaHKtddZyhBvgg6j2kBRDgWRY
 a2jaoSYoG/WrVylR0cs1KlNYTKlIqfs=
X-Google-Smtp-Source: ABdhPJyegdI/9Kh//OZ9HHxhDnrbzMU1SVoSIeuFXdBPkQsQeAD5/SR9bTVDu2ieaapjhThMuucNDQ==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr2558934wmi.82.1593078309869;
 Thu, 25 Jun 2020 02:45:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t15sm11708554wmj.14.2020.06.25.02.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:45:09 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:45:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 7/8] backlight: lm3630a_bl: Remove invalid checks for
 unsigned int < 0
Message-ID: <20200625094507.5ozmizkynmlwvyoj@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-8-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-8-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Daniel Jeong <gshark.jeong@gmail.com>, LDD MLP <ldd-mlp@list.ti.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDM6NTc6MjBQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IHVuc2lnbmVkIGludHMgJ3NvdXJjZXMnIGFuZCAnYmFuaycgY2Fubm90IGJlIGxlc3MgdGhh
biBMTTM2MzBBX1NJTktfMCAoMCkKPiBhbmQgTE0zNjMwQV9CQU5LXzAgKDApIHJlc3BlY2l0aXZl
bHksIHNvIGNoYW5nZSB0aGUgbG9naWMgdG8gb25seSBjaGVjawo+IGZvciB0aGllciB0d28gcG9z
c2libGUgdmFsaWQgdmFsdWVzLgo+IAo+IEZpeGVzIFc9MSB3YXJuaW5nczoKPiAKPiAgZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jOiBJbiBmdW5jdGlvbiDigJhsbTM2MzBhX3Bh
cnNlX2xlZF9zb3VyY2Vz4oCZOgo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2Js
LmM6Mzk0OjE4OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gPCAw
IGlzIGFsd2F5cyBmYWxzZSBbLVd0eXBlLWxpbWl0c10KPiAgMzk0IHwgaWYgKHNvdXJjZXNbaV0g
PCBMTTM2MzBBX1NJTktfMCB8fCBzb3VyY2VzW2ldID4gTE0zNjMwQV9TSU5LXzEpCj4gIHwgXgo+
ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmM6IEluIGZ1bmN0aW9uIOKAmGxt
MzYzMGFfcGFyc2VfYmFua+KAmToKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9i
bC5jOjQxNToxMTogd2FybmluZzogY29tcGFyaXNvbiBvZiB1bnNpZ25lZCBleHByZXNzaW9uIDwg
MCBpcyBhbHdheXMgZmFsc2UgWy1XdHlwZS1saW1pdHNdCj4gIDQxNSB8IGlmIChiYW5rIDwgTE0z
NjMwQV9CQU5LXzAgfHwgYmFuayA+IExNMzYzMEFfQkFOS18xKQo+ICB8IF4KPiAKPiBDYzogPHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIu
em9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogRGFuaWVsIEplb25nIDxnc2hhcmsuamVvbmdA
Z21haWwuY29tPgo+IENjOiBMREQgTUxQIDxsZGQtbWxwQGxpc3QudGkuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogRGFu
aWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCgo+IC0tLQo+ICBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvbG0zNjMwYV9ibC5jCj4gaW5kZXggZWUzMjA4ODNiNzEwOC4uZTg4YTJiMGU1OTA0NiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiArKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiBAQCAtMzkxLDcgKzM5MSw3IEBA
IHN0YXRpYyBpbnQgbG0zNjMwYV9wYXJzZV9sZWRfc291cmNlcyhzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqbm9kZSwKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBudW1fc291
cmNlczsgaSsrKSB7Cj4gLQkJaWYgKHNvdXJjZXNbaV0gPCBMTTM2MzBBX1NJTktfMCB8fCBzb3Vy
Y2VzW2ldID4gTE0zNjMwQV9TSU5LXzEpCj4gKwkJaWYgKHNvdXJjZXNbaV0gIT0gTE0zNjMwQV9T
SU5LXzAgJiYgc291cmNlc1tpXSAhPSBMTTM2MzBBX1NJTktfMSkKPiAgCQkJcmV0dXJuIC1FSU5W
QUw7Cj4gIAo+ICAJCXJldCB8PSBCSVQoc291cmNlc1tpXSk7Cj4gQEAgLTQxMiw3ICs0MTIsNyBA
QCBzdGF0aWMgaW50IGxtMzYzMGFfcGFyc2VfYmFuayhzdHJ1Y3QgbG0zNjMwYV9wbGF0Zm9ybV9k
YXRhICpwZGF0YSwKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlpZiAoYmFu
ayA8IExNMzYzMEFfQkFOS18wIHx8IGJhbmsgPiBMTTM2MzBBX0JBTktfMSkKPiArCWlmIChiYW5r
ICE9IExNMzYzMEFfQkFOS18wICYmIGJhbmsgIT0gTE0zNjMwQV9CQU5LXzEpCj4gIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gIAo+ICAJbGVkX3NvdXJjZXMgPSBsbTM2MzBhX3BhcnNlX2xlZF9zb3VyY2Vz
KG5vZGUsIEJJVChiYW5rKSk7Cj4gLS0gCj4gMi4yNS4xCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
