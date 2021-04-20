Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E013655D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0076E10B;
	Tue, 20 Apr 2021 09:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8614289F53
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:39:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u20so42744135lja.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=;
 b=gvB2Kjtuq3c6hDrfV3q09iYFnvk6b3RYxllwzrHlnk+X8nahI/9ZgjrPXry5x6L08J
 ZqUJbyfgrU/17jihKD9RUFrWkKnPLnaOIz5SfrAgdH3V6GQqhJBsJvkRB5ags8nff6/g
 3cv4VDvDqV2sSqUfb8205g5G7kjLsdASVbSOa0/k/nLxNeajkm1KtVIIys66vWeGWX+c
 R9IfZtnbhr3czfjp/hluYCcP4dflvCu/ccDgljZf5znlxpNeSE4/7JXLhxawyn0f1SMK
 6r42KR2eqy29tw7Neimeshqmq4hBcMWCqRWk5EiKSmXItxwa+o1xYehRrMSSHpcpkKnQ
 slWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=;
 b=RNBUPBhsVgn4mH1K3ep92iY17H21ctWe/+KPK3vUs6aYvRi7tc62JGAQr6ifvqQBMG
 JWwgPgWgHcMs0lENwgppbWJ9n7s4cEsfwqRPdQ4GzvG9ts1JSqkqbTjr88im3I0sTO6i
 JBF/bPsV+2+mtlvEbcw8kOSUNtBQDE1bcF8e9SDkeXfrfc6O3OxsUx0Heu5jkgKa/r9L
 qwk+jAclFDaRBE0fo/69Y1ce00YGpdIh3+taHzvBgetzO23WULvZId5Hw6yxizl59JC+
 Se1EIaKxMAl7lwCR7Ooy+MhCzFXGrCM6aLCLvDyQ0UU1dQ/8yilENGW/QWu1a+l/htAD
 e2yg==
X-Gm-Message-State: AOAM5331+IEEQ0Df/NYWLFgbWfgR4H0Qjt3+EuWave2sfIDW9oD+Mmuf
 LP/E/IsiESfZYSX+WoMH3Oc=
X-Google-Smtp-Source: ABdhPJxU9OnhgUvmhfsaX0XQNxKFEPf1HsBVx73r0wgo9gbzwsyEGSVJJz6LhIbQa4C3GIRFxd4WnA==
X-Received: by 2002:a2e:9f49:: with SMTP id v9mr14102607ljk.44.1618911541931; 
 Tue, 20 Apr 2021 02:39:01 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id n22sm723197lfu.144.2021.04.20.02.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:39:01 -0700 (PDT)
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org, horia.geanta@nxp.com, aymen.sghaier@nxp.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, tony@atomide.com,
 geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 vkoul@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 robert.foss@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, tomba@kernel.org, jyri.sarha@iki.fi, joro@8bytes.org,
 will@kernel.org, mchehab@kernel.org, ulf.hansson@linaro.org,
 adrian.hunter@intel.com, kishon@ti.com, kuba@kernel.org,
 linus.walleij@linaro.org, Roy.Pledge@nxp.com, leoyang.li@nxp.com,
 ssantosh@kernel.org, matthias.bgg@gmail.com, edubezval@gmail.com,
 j-keerthy@ti.com, balbi@kernel.org, linux@prisktech.co.nz,
 stern@rowland.harvard.edu, wim@linux-watchdog.org, linux@roeck-us.net
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <2924b8af-d176-01b1-a221-5219c1128494@gmail.com>
Date: Tue, 20 Apr 2021 12:40:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419042722.27554-4-alice.guo@oss.nxp.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 20 Apr 2021 09:59:33 +0000
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
Cc: linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxpY2UsCgpPbiA0LzE5LzIxIDc6MjcgQU0sIEFsaWNlIEd1byAoT1NTKSB3cm90ZToKPiBG
cm9tOiBBbGljZSBHdW8gPGFsaWNlLmd1b0BueHAuY29tPgo+IAo+IFVwZGF0ZSBhbGwgdGhlIGNv
ZGUgdGhhdCB1c2Ugc29jX2RldmljZV9tYXRjaCBiZWNhdXNlIGFkZCBzdXBwb3J0IGZvcgo+IHNv
Y19kZXZpY2VfbWF0Y2ggcmV0dXJuaW5nIC1FUFJPQkVfREVGRVIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQWxpY2UgR3VvIDxhbGljZS5ndW9AbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9idXMvdGkt
c3lzYy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMgICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL2Nsay9y
ZW5lc2FzL3JjYXItZ2VuMi1jcGcuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2Nsay9y
ZW5lc2FzL3JjYXItZ2VuMy1jcGcuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2RtYS9m
c2wtZHBhYTItcWRtYS9kcGFhMi1xZG1hLmMgICAgICAgfCAgNyArKysrKystCj4gIGRyaXZlcnMv
ZG1hL3RpL2szLXBzaWwuYyAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwo+ICBkcml2ZXJz
L2RtYS90aS9rMy11ZG1hLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgICAgICAgICAgICAgfCAgNCArKystCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jICAgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kcGkuYyAgICAgICAgICAgICB8ICA0ICsrKy0KPiAgZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jICAgICAgICAgICAgIHwgIDMgKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3MuYyAgICAgICAgICAgICB8ICAzICsrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jICAgICAgfCAgMyArKysKPiAg
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3ZlbmMuYyAgICAgICAgICAgIHwgIDQgKysrLQo+
ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jICAgICAgICAgICAgfCAgMyArKysK
PiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgICAgICAgIHwgIDQgKysr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgfCAgMiAr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZGlzcGMuYyAgICAgICAgICAgfCAgNCAr
KystCj4gIGRyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jICAgICAgICAgICAgICAgICAgICB8ICA3
ICsrKysrLS0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZpbi9yY2FyLWNvcmUuYyAg
IHwgIDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZpbi9yY2FyLWNzaTIuYyAg
IHwgIDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfdWlmLmMgICAgICAg
IHwgIDQgKysrLQo+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMgICAgICAg
ICAgfCAgMiArLQo+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFj
LmMgfCAgMiArLQo+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWVzZGhjLmMgICAgICAgICAg
ICAgfCAyMSArKysrKysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb21h
cC5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2lfYW02
NTQuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVz
YXMvcmF2Yl9tYWluLmMgICAgICB8ICA0ICsrKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
YW02NS1jcHN3LW51c3MuYyAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
Y3Bzdy5jICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
Y3Bzd19uZXcuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9waHkvdGkvcGh5LW9tYXAt
dXNiMi5jICAgICAgICAgICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNh
cy9jb3JlLmMgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNh
cy9wZmMtcjhhNzc5MC5jICAgICAgICAgfCAgNSArKysrLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9wZmMtcjhhNzc5NC5jICAgICAgICAgfCAgNSArKysrLQo+ICBkcml2ZXJzL3NvYy9mc2wv
ZHBpby9kcGlvLWRyaXZlci5jICAgICAgICAgICAgfCAxMyArKysrKysrKy0tLS0KPiAgZHJpdmVy
cy9zb2MvcmVuZXNhcy9yOGE3NzRjMC1zeXNjLmMgICAgICAgICAgIHwgIDUgKysrKy0KPiAgZHJp
dmVycy9zb2MvcmVuZXNhcy9yOGE3Nzk1LXN5c2MuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9zb2MvcmVuZXNhcy9yOGE3Nzk5MC1zeXNjLmMgICAgICAgICAgIHwgIDUgKysrKy0KPiAg
ZHJpdmVycy9zb2MvdGkvazMtcmluZ2FjYy5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAg
ZHJpdmVycy9zdGFnaW5nL210NzYyMS1wY2kvcGNpLW10NzYyMS5jICAgICAgIHwgIDIgKy0KPiAg
ZHJpdmVycy90aGVybWFsL3JjYXJfZ2VuM190aGVybWFsLmMgICAgICAgICAgIHwgIDQgKysrLQo+
ICBkcml2ZXJzL3RoZXJtYWwvdGktc29jLXRoZXJtYWwvdGktYmFuZGdhcC5jICAgfCAxMCArKysr
KysrLS0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYyAgICAgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy91c2IvaG9zdC9laGNpLXBsYXRmb3JtLmMgICAgICAgICAgICAgIHwg
IDQgKysrLQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmNhci5jICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBkcml2ZXJzL3dhdGNoZG9nL3JlbmVzYXNfd2R0LmMgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICA0OCBmaWxlcyBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRp
b25zKC0pCj4gCgouLi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL3RpL2szLXVkbWEuYyBi
L2RyaXZlcnMvZG1hL3RpL2szLXVkbWEuYwo+IGluZGV4IDk2YWQyMTg2OWJhNy4uNTBhNGM4ZjA5
OTNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hL3RpL2szLXVkbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZG1hL3RpL2szLXVkbWEuYwo+IEBAIC01MTg4LDcgKzUxODgsNyBAQCBzdGF0aWMgaW50IHVk
bWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXVkLT5tYXRjaF9kYXRh
ID0gbWF0Y2gtPmRhdGE7Cj4gIAo+ICAJc29jID0gc29jX2RldmljZV9tYXRjaChrM19zb2NfZGV2
aWNlcyk7Cj4gLQlpZiAoIXNvYykgewo+ICsJaWYgKCFJU19FUlIoc29jKSAmJiAhc29jKSB7Cgp0
aGlzIGRvZXMgbm90IHNvdW5kIHJpZ2h0Li4uCgppZiAoIXNvYyB8fCBJU19FUlIoc29jKSkKb3IK
aWYgKElTX0VSUl9PUl9OVUxMKHNvYykpCmlzIGV2ZW4gYmV0dGVyLgoKPiAgCQlkZXZfZXJyKGRl
diwgIk5vIGNvbXBhdGlibGUgU29DIGZvdW5kXG4iKTsKPiAgCQlyZXR1cm4gLUVOT0RFVjsKClRo
ZXJlIG1pZ2h0IGJlIGEgY2xldmVyIG1hY3JvIGZvciBpdCwgYnV0OgoKcmV0dXJuIHNvYyA/IFBU
Ul9FUlIoc29jKSA6IC1FTk9ERVY7Cgo+ICAJfQoKLS0gClDDqXRlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
