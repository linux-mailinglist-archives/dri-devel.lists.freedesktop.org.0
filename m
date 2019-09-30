Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7251C1CFC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 10:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3E76E038;
	Mon, 30 Sep 2019 08:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78086E038
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:20:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r5so10095169wrm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 01:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wdxTBl8cU2cVPs/w2lTCBljy6drx0Eb06vJ1V1ISALk=;
 b=hqNfGbVProeq0fgHndN+vlGYQwj676nCVmxihxrE7xQG9CmsgcWUB0anIAP+wqTyBK
 rfG443UchYHXlzGDc6LFK21CeD/HDT1epDlgLfQ1IeY/HyJP01ejqGeU+SOsxb3F/fi3
 l3jag3QpZI/LIiIHLT7tnUPrWYSGOXeqWCDRNIM9j/5Byd0ya7L45udYf1SMv908O50a
 g1ecU7W41mE3uhbdqFFEa+XS251qC8JSGXPktIQ9JT8pv2cYd4zGxfemo+fGegCyduyW
 vDqA0aZJkNOgcvdnVWgLsXVEjIVB4/EdyOiK8f5UsmeWuy13oxYnxzbiKpT4Sn7827O0
 Ff2Q==
X-Gm-Message-State: APjAAAWOZrvDwHklNLl6DFbzZXRteHTU2Z1YHnlj134tieBRrOXyObeX
 WlvYbfLTIhLXURt47PoIjhjxoQ==
X-Google-Smtp-Source: APXvYqzVxfFKRFJiabLeJLa1njRxX1vJlWUqYSjjGipZgbi6615EZhxUuvoaf5D2oqW4nbz9sHxnoQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr13309640wri.232.1569831651429; 
 Mon, 30 Sep 2019 01:20:51 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w125sm39270770wmg.32.2019.09.30.01.20.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 01:20:50 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: enable runtime PM
To: Kevin Hilman <khilman@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190925193154.20732-1-khilman@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
Date: Mon, 30 Sep 2019 10:20:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925193154.20732-1-khilman@kernel.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wdxTBl8cU2cVPs/w2lTCBljy6drx0Eb06vJ1V1ISALk=;
 b=zSbOu0cuMgrqVrg2TA4dvy9qeU8bB0uoAmv3vIKTNdn+XwhbpAxcIzwvyGflTNpBye
 1XDJuEBrrfXTpWlxuW6MYyykKnEvU0m9T/DdksJeboCkQez5syGJuVPY92VlRvHjoi82
 kQrrktwvokdHYGosQlVI8hls+XZJ77Qyu3pwKERvtbKDNsy2JFqbtrxNfXImECcG8NOl
 Y91Y6zo7Ioi0nEArnKkM8kD9/GXnFywgNLL1gP1eJBaro3zVepkXp48AP4UPvqobp8ad
 0yIdKozJF5q8u0s67iufCB3Ighso054aD3fxCit8kmt166i/bc+qEuLEsRN+lxXTb6Qo
 6izg==
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2V2aW4sCgpPbiAyNS8wOS8yMDE5IDIxOjMxLCBLZXZpbiBIaWxtYW4gd3JvdGU6Cj4gRnJv
bTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPiAKPiBPbiBzb21lIFNvQ3Ms
IHRoZSBWUFUgaXMgaW4gYSBwb3dlci1kb21haW4gYW5kIG5lZWRzIHJ1bnRpbWUgUE0KPiBlbmFi
bGVkIGFuZCB1c2VkIGluIG9yZGVyIHRvIGtlZXAgdGhlIHBvd2VyIGRvbWFpbiBvbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiBp
bmRleCAyMzEwYzk2ZmZmNDYuLjI1NmI2YTBlOWM2YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHJ2LmMKPiBAQCAtMTQsNiArMTQsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L29mX2dyYXBoLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4gIAo+ICAj
aW5jbHVkZSA8ZHJtL2RybVAuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+Cj4gQEAg
LTI3NCw2ICsyNzUsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9iaW5kX21hc3RlcihzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4gIAo+ICAJLyogSGFyZHdhcmUgSW5p
dGlhbGl6YXRpb24gKi8KPiAgCj4gKwlwbV9ydW50aW1lX2dldF9zeW5jKGRldik7Cj4gIAltZXNv
bl92cHVfaW5pdChwcml2KTsKPiAgCW1lc29uX3ZlbmNfaW5pdChwcml2KTsKPiAgCW1lc29uX3Zw
cF9pbml0KHByaXYpOwo+IEBAIC00MTYsNiArNDE4LDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqZXAsICpyZW1vdGU7Cj4gIAlpbnQgY291bnQgPSAwOwo+ICAKPiArCXBtX3J1bnRpbWVfZW5h
YmxlKCZwZGV2LT5kZXYpOwo+ICAJZm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9kZShucCwgZXApIHsK
PiAgCQlyZW1vdGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVwKTsKPiAgCQlp
ZiAoIXJlbW90ZSB8fCAhb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7Cj4gQEAgLTQ0
MCw2ICs0NDMsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJfQo+ICAKPiAgCS8qIElmIG5vIG91dHB1dCBlbmRwb2ludHMgd2Vy
ZSBhdmFpbGFibGUsIHNpbXBseSBiYWlsIG91dCAqLwo+ICsJcG1fcnVudGltZV9kaXNhYmxlKCZw
ZGV2LT5kZXYpOwo+ICAJcmV0dXJuIDA7Cj4gIH07Cj4gIAo+IAoKSSdsbCByYXRoZXIgaW1wbGVt
ZW50IHRydWUgcnVudGltZSBQTSBpbnN0ZWFkLAoKTmVpbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
