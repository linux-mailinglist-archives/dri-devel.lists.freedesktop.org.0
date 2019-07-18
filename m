Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8C6E189
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF96D6E5A0;
	Fri, 19 Jul 2019 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300AC6E3B4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:30:05 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f17so25486345wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 05:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LwpK72EqscYErdzMyBaDvvmD1dD0n7PQxg+3QoVuhP8=;
 b=PV26BtThpBMZxUeEeRxK0YkGP/VL7VqnxZ8nwGNF62nXMQrD1ODEYS84087Ez+QVK1
 o8ZtSchr1ejsPVwTkA5r8XEJSvFJnC3AqzIk6Ym9IC4YHF/SdtUuCGuNNoDg3wSg7JEz
 YMNTnya1cBJdEQR7Tg0XOAutb2DH7xYshuXAWbBMdkvDqSE0BD33qY28heqsAE940EqC
 RLUteXSZaanAl6W4bpKK4l79dRAJnMUEddi7cobMPeZ3yRypGjTdEqQXIHiYkDo7kiBq
 4RGzYgO3RfzS/Bg3LkC2hCtI2AMtD+/FHJJWvVY2TFsz8CS/pLQlogi6n8T0xPFDsu4/
 bfFQ==
X-Gm-Message-State: APjAAAVvbw7Bi9bTUDfwtW0xvPR7MpRhNmUCi35AVpha1V3Dcb2UR4/w
 O98KfNGjfUw+Peg1gEZI0o8=
X-Google-Smtp-Source: APXvYqyCvlE7syNPeLWbPWH1ax51YnxjP01iwlIFMVhyi3S55aqj6XgWd6Lavenr59cynTzeHLc5dA==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr41054490wmc.126.1563453003911; 
 Thu, 18 Jul 2019 05:30:03 -0700 (PDT)
Received: from [192.168.1.19] (bkt159.neoplus.adsl.tpnet.pl. [83.28.187.159])
 by smtp.gmail.com with ESMTPSA id
 i66sm45466749wmi.11.2019.07.18.05.30.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 05:30:03 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] dt-bindings: backlight: Add led-backlight binding
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-4-jjhiblot@ti.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <16865fe5-cc9c-e6f5-6950-54cc70153243@gmail.com>
Date: Thu, 18 Jul 2019 14:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717141514.21171-4-jjhiblot@ti.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LwpK72EqscYErdzMyBaDvvmD1dD0n7PQxg+3QoVuhP8=;
 b=rtIMiYfpXN8AnEhAkW3UyyG4JPa7sHO2Ro2xSoe0ccWjJC7D3dex1Aw689fhS5WCIo
 10KkC6DpqJEqE+Msmq3qbRzSegIGMUUHAwQ11Q3ZjLX6Omsqvocdj8QX1rntUG1XoMCc
 nDjzy3PdcBwCq2MEhsuiM/vYCk6zS5M9s4gbnUxtPUDTMivhHamZM/XVGnjSC5LGGgPn
 pY2Iidr3yRae0cO0JE/4NXianAIrSq1AeQgRl65sMvm0MLTvmW6CglD6dpPl8WS8Up3N
 omdHA4DlCCyq4vmvIn/KdRe7Z1k4sstTIkHn4WcQYB8VwR1q4nEQ0gF8tMcVAkqoCn9x
 DrWg==
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2MgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcgbGlzdCAtIFJvYiBvbmNlIGluZm9ybWVkIHVz
IHRoaXMgZ2V0cwpoaWdoZXIgcHJpb3JpdHkgaW4gaGlzIHF1ZXVlIHRoaXMgd2F5LgoKT24gNy8x
Ny8xOSA0OjE1IFBNLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+IEFkZCBEVCBiaW5kaW5n
IGZvciBsZWQtYmFja2xpZ2h0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJs
b3QgPGpqaGlibG90QHRpLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xlZC1iYWNrbGlnaHQudHh0IHwgMjggKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2Jh
Y2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40YzdkZmJlN2Y2N2EKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xl
ZC1iYWNrbGlnaHQudHh0Cj4gQEAgLTAsMCArMSwyOCBAQAo+ICtsZWQtYmFja2xpZ2h0IGJpbmRp
bmdzCj4gKwo+ICtUaGlzIGJpbmRpbmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJhc2ljIGJhY2ts
aWdodCBkZXZpY2UgbWFkZSBvZiBMRURzLgo+ICtJdCBjYW4gYWxzbyBiZSB1c2VkIHRvIGRlc2Ny
aWJlIGEgYmFja2xpZ2h0IGRldmljZSBjb250cm9sbGVkIGJ5IHRoZSBvdXRwdXQgb2YKPiArYSBM
RUQgZHJpdmVyLgo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArICAtIGNvbXBhdGlibGU6
ICJsZWQtYmFja2xpZ2h0Igo+ICsgIC0gbGVkczogYSBsaXN0IG9mIExFRHMKPiArCj4gK09wdGlv
bmFsIHByb3BlcnRpZXM6Cj4gKyAgLSBicmlnaHRuZXNzLWxldmVsczogQXJyYXkgb2YgZGlzdGlu
Y3QgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZSBsZXZlbHMgbXVzdCBiZQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGluIHRoZSByYW5nZSBhY2NlcHRlZCBieSB0aGUgdW5kZXJseWluZyBMRUQgZGV2
aWNlcy4KPiArICAgICAgICAgICAgICAgICAgICAgICBUaGlzIGlzIHVzZWQgdG8gdHJhbnNsYXRl
IGEgYmFja2xpZ2h0IGJyaWdodG5lc3MgbGV2ZWwKPiArICAgICAgICAgICAgICAgICAgICAgICBp
bnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIElmIGl0IGlzIG5vdCBwcm92aWRlZCwgdGhlCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgaWRlbnRpdHkgbWFwcGluZyBpcyB1c2VkLgo+ICsKPiAr
ICAtIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbDogVGhlIGRlZmF1bHQgYnJpZ2h0bmVzcyBsZXZl
bC4KPiArCj4gK0V4YW1wbGU6Cj4gKwo+ICsJYmFja2xpZ2h0IHsKPiArCQljb21wYXRpYmxlID0g
ImxlZC1iYWNrbGlnaHQiOwo+ICsKPiArCQlsZWRzID0gPCZsZWQxPiwgPCZsZWQyPjsKPiArCQli
cmlnaHRuZXNzLWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAxMjggMjU1PjsKPiArCQlkZWZhdWx0
LWJyaWdodG5lc3MtbGV2ZWwgPSA8Nj47Cj4gKwl9Owo+IAoKLS0gCkJlc3QgcmVnYXJkcywKSmFj
ZWsgQW5hc3pld3NraQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
