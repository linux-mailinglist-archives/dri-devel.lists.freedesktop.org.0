Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF2D211E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4376EA95;
	Thu, 10 Oct 2019 06:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976A46EA32
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:31:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j11so4245949wrp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 11:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oWkC+BZoP7VUQ2ztR/WpAMsp2lmAnOuXDnBIIvOWkGA=;
 b=o7xnNAdR7a+D+o/KHYnGQIruhHHN7TNcv+XIeia5Rf+t42tmgnbpBFEM0YOyDbh4hX
 RvvBoqJBWeFJ4GBFmi/2Dd8Xdot9IALU3vyBlR3z+QF0r/UCzgtytGzpWse4Yo9kCj4L
 UHeTg7aiCTN+K/ykdy4AUs7qLfSMLHUezg2ALaz2v1vyqjl3BEsZQ9hAq5ykY2YLK19D
 jv7ARSG3bvk0oN6pIakFMJi52JRHG5I+l7zhPdaluZjGUKZKgypUN8H8pthmyoC5LVHB
 7Rx1A0zRXU9UXJPe32u2Huwiqb2DaPTEto7XSMRIUM++Xs5gRvxPjwaiGWFzRzKhTRR1
 tRSQ==
X-Gm-Message-State: APjAAAWKa50fYtsN7M7ueS708OwZzYlMxtOEthidPn3dT4k7nxznYnC9
 9p/hOpxy5h3R0sCsDgZ2Rbc=
X-Google-Smtp-Source: APXvYqyM2etDyWUPu7v7d+CD4W0SPXOldpjlksplBTMaO9G/jxiazmJNGIb74AbxqheyQL0cI2KRgw==
X-Received: by 2002:a5d:5270:: with SMTP id l16mr4118079wrc.201.1570645903148; 
 Wed, 09 Oct 2019 11:31:43 -0700 (PDT)
Received: from [192.168.1.19] (cjk130.neoplus.adsl.tpnet.pl. [83.31.60.130])
 by smtp.gmail.com with ESMTPSA id y14sm4359437wrd.84.2019.10.09.11.31.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 11:31:42 -0700 (PDT)
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Rob Herring <robh+dt@kernel.org>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
 <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
 <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
 <edadb121-cebd-b8ea-e07d-f5495a581dfd@gmail.com>
 <CAL_JsqJLp65f6g2OG5uJPrcZ2uuc5cgREaiQ-AXeBp6reqvbkw@mail.gmail.com>
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
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAlgEEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEACgkQvWpQHLeLfCarMQ/9FN/WqJdN2tf6xkP0RFyS4ft0sT04zkOCFfOMxs8mZ+KZoMU+
 X3a+fEppDL7xgRFpHyGaEel7lSi1eqtzsqZ5JiHbDS1Ht1G8TtATb8q8id68qeSeW2mfzaLQ
 98NPELGfUXFoUqUQkG5z2p92UrGF4Muj1vOIW93pwvE4uDpNsl+jriwHomLtjIUoZtIRjGfZ
 RCyUQI0vi5LYzXCebuzAjGD7Jh2YAp7fDGrv3qTq8sX+DUJ4H/+I8PiL+jXKkEeppqIhlBJJ
 l4WcgggMu3c2uljYDuqRYghte33BXyCPAocfO2/sN+yJRUTVuRFlOxUk4srz/W8SQDwOAwtK
 V7TzdyF1/jOGBxWwS13EjMb4u3XwPMzcPlEQNdIqz76NFmJ99xYEvgkAmFmRioxuBTRv8Fs1
 c1jQ00WWJ5vezqY6lccdDroPalXWeFzfPjIhKbV3LAYTlqv0It75GW9+0TBhPqdTM15DrCVX
 B7Ues7UnD5FBtWwewTnwr+cu8te449VDMzN2I+a9YKJ1s6uZmzh5HnuKn6tAfGyQh8MujSOM
 lZrNHrRsIsLXOjeGVa84Qk/watEcOoyQ7d+YaVosU0OCZl0GldvbGp1z2u8cd2N/HJ7dAgFh
 Q7dtGXmdXpt2WKQvTvQXhIrCWVQErNYbDZDD2V0TZtlPBaZP4fkUDkvH+Sy5Ag0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAGJAiUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k+JAq0EGAEIACAW
 IQS/HfwKVo8F95V1cJC9alAct4t8JgUCWwqKhgIbAgCBCRC9alAct4t8JnYgBBkWCAAdFiEE
 FMMcSshOZf56bfAEYhBsURv0pdsFAlsKioYACgkQYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY
 0LLxM/rFY9Vz1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8G
 7joP/jx+oGOmdRogs7mG//H+w9DTnBfPpnfkeiiokGYo/+huWO5V0Ac9tTqZeFc//t/YuYJn
 wWvS0Rx+KL0fT3eh9BQo47uF4yDiZIiWLNh4Agpup1MUSVsz4MjD0lW6ghtnLcGlIgoVHW0v
 tPW1m9jATYyJSOG/MC1iDrcYcp9uVYn5tKfkEeQNspuG6iSfS0q3tajPKnT1nJxMTxVOD2RW
 EIGfaV9Scrou92VD/eC+/8INRsiWS93j3hOKIAV5XRNINFqtzkagPYAP8r6wksjSjh01fSTB
 p5zxjfsIwWDDzDrqgzwv83CvrLXRV3OlG1DNUDYA52qJr47paH5QMWmHW5TNuoBX8qb6RW/H
 M3DzPgT+l+r1pPjMPfvL1t7civZUoPuNzoyFpQRj6TvWi2bGGMQKryeYksXG2zi2+avMFnLe
 lOxGdUZ7jn1SJ6Abba5WL3VrXCP+TUE6bZLgfw8kYa8QSXP3ysyeMI0topHFntBZ8a0KXBNs
 qqFCBWmTHXfwsfW0VgBmRtPO7eXVBybjJ1VXKR2RZxwSq/GoNXh/yrRXQxbcpZ+QP3/Tttsb
 FdKciZ4u3ts+5UwYra0BRuvb51RiZR2wRNnUeBnXWagJVTlG7RHBO/2jJOE6wrcdCMjs0Iiw
 PNWmiVoZA930TvHA5UeGENxdGqo2MvMdRJ54YaIR
Message-ID: <a0b161a3-afc7-a00f-2a22-79ebe360f2ad@gmail.com>
Date: Wed, 9 Oct 2019 20:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJLp65f6g2OG5uJPrcZ2uuc5cgREaiQ-AXeBp6reqvbkw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oWkC+BZoP7VUQ2ztR/WpAMsp2lmAnOuXDnBIIvOWkGA=;
 b=fBXibqojDDDkc/wCUNSb61Yv2drYaMkqP3mLDqbt3jY14GYujTmNyVtSeArNy3SKY5
 O6Cnf3Kc/T8PlTbMRdFdYqn9xJIa/9P21Z+DdyXFEyos8HYToaXTY9MU5rH7lFi4zuUb
 WDG4cGlaTup0y2JDh40tvzq63bOy5SfoqiHPuR7W4/2m4rMREjvXl+Ug+oLNKoo/3rU2
 cKt+zez5VJTiapdvMxSsRjFgS/z21dZGiaQcL9j8Y5Ly1oJU2goc547ZpAJXsQwFi2E1
 P9HMaFUGt0kOXL+jc1Ugo9cKSYi6DKKVEFMSNqpJ4ZA72+LNnuSTvFRWtWWLSoqQaQq8
 0pnA==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvOC8xOSAxMDowMCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBPY3QgOCwg
MjAxOSBhdCAxMjoxNyBQTSBKYWNlayBBbmFzemV3c2tpCj4gPGphY2VrLmFuYXN6ZXdza2lAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4gT24gMTAvOC8xOSA1OjAwIFBNLCBSb2IgSGVycmluZyB3cm90
ZToKPj4+IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgODozMCBBTSBKZWFuLUphY3F1ZXMgSGlibG90
IDxqamhpYmxvdEB0aS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gUm9iLAo+Pj4+Cj4+Pj4gT24gMDgv
MTAvMjAxOSAxNDo1MSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4+Pj4gSGkgUm9iLAo+
Pj4+Pgo+Pj4+PiBPbiAwNy8xMC8yMDE5IDE4OjE1LCBSb2IgSGVycmluZyB3cm90ZToKPj4+Pj4+
IFBsZWFzZSBzZW5kIERUIGJpbmRpbmdzIHRvIERUIGxpc3Qgb3IgaXQncyBuZXZlciBpbiBteSBx
dWV1ZS4gSU9XLAo+Pj4+Pj4gc2VuZCBwYXRjaGVzIHRvIHRoZSBsaXN0cyB0aGF0IGdldF9tYWlu
dGFpbmVycy5wbCB0ZWxscyB5b3UgdG8uCj4+Pj4+Pgo+Pj4+Pj4gT24gTW9uLCBPY3QgNywgMjAx
OSBhdCA3OjQ1IEFNIEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KPj4+Pj4+
IHdyb3RlOgo+Pj4+Pj4+IEFkZCBEVCBiaW5kaW5nIGZvciBsZWQtYmFja2xpZ2h0Lgo+Pj4+Pj4+
Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGku
Y29tPgo+Pj4+Pj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNv
bkBsaW5hcm8ub3JnPgo+Pj4+Pj4+IFJldmlld2VkLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2Vi
YXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgIC4uLi9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCB8IDI4Cj4+Pj4+Pj4gKysr
KysrKysrKysrKysrKysrKwo+Pj4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KykKPj4+Pj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NAo+Pj4+Pj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+Pj4+Pj4g
UGxlYXNlIG1ha2UgdGhpcyBhIERUIHNjaGVtYS4KPj4+Pj4KPj4+Pj4gT0suCj4+Pj4+Cj4+Pj4+
IEJUVyBJIHVzZWQgIm1ha2UgZHRfYmluZGluZ19jaGVjayIgYnV0IGhhZCB0byBmaXggYSBjb3Vw
bGUgb2YgWUFNTHMKPj4+Pj4gZmlsZSB0byBnZXQgaXQgdG8gd29yay4gRG8geW91IGhhdmUgYSBr
ZXJuZWwgdHJlZSB3aXRoIGFscmVhZHkgYWxsIHRoZQo+Pj4+PiBZQU1MIGZpbGVzIGluIGdvb2Qg
c2hhcGUgPyBPciBkbyB5b3Ugd2FudCBtZSB0byBwb3N0IHRoZSBjaGFuZ2VzIHRvCj4+Pj4+IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnID8KPj4+Pj4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4gZGlm
ZiAtLWdpdAo+Pj4+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
YmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cj4+Pj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKPj4+Pj4+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGM3ZGZiZTdm
NjdhCj4+Pj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4+ICsrKwo+Pj4+Pj4+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0
Cj4+Pj4+Pj4gQEAgLTAsMCArMSwyOCBAQAo+Pj4+Pj4+ICtsZWQtYmFja2xpZ2h0IGJpbmRpbmdz
Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICtUaGlzIGJpbmRpbmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJh
c2ljIGJhY2tsaWdodCBkZXZpY2UgbWFkZSBvZgo+Pj4+Pj4+IExFRHMuCj4+Pj4+Pj4gK0l0IGNh
biBhbHNvIGJlIHVzZWQgdG8gZGVzY3JpYmUgYSBiYWNrbGlnaHQgZGV2aWNlIGNvbnRyb2xsZWQg
YnkKPj4+Pj4+PiB0aGUgb3V0cHV0IG9mCj4+Pj4+Pj4gK2EgTEVEIGRyaXZlci4KPj4+Pj4+PiAr
Cj4+Pj4+Pj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+Pj4+Pj4gKyAgLSBjb21wYXRpYmxlOiAi
bGVkLWJhY2tsaWdodCIKPj4+Pj4+PiArICAtIGxlZHM6IGEgbGlzdCBvZiBMRURzCj4+Pj4+PiAn
bGVkcycgaXMgYWxyZWFkeSB1c2VkIGFzIGEgbm9kZSBuYW1lIGFuZCBtaXhpbmcgaXMgbm90IGlk
ZWFsLgo+Pgo+PiBmb3IgdGhlIHJlY29yZDogY2hpbGQgbm9kZSBuYW1lcyAoaWYgdGhhdCB3YXMg
d2hhdCB5b3UgaGFkIG9uIG1pbmQpCj4+IGhhdmUgc2luZ3VsYXIgZm9ybSAnbGVkJy4KPiAKPiBJ
IGRpZCBhY3R1YWxseSBncmVwIHRoaXMgYW5kIG5vdCByZWx5IG9uIG15IHNvbWV3aGF0IGZhdWx0
eSBtZW1vcnk6Cj4gCj4gJCBnaXQgZ3JlcCAnXHNsZWRzIHsnIHwgd2MgLWwKPiA0NjMKPiAKPiBU
aGVzZSBhcmUgbW9zdGx5IGdwaW8tbGVkcyBJIHRoaW5rLgoKSW5kZWVkLiBTbyB0aGlzIGlzIGxl
Z2FjeSwgYnV0IGNvbW1vbiBMRUQgYmluZGluZ3MgaGF2ZSBuZXZlciBzdGF0ZWQKdGhhdC4gSWYg
c2hvdWxkIGJlIE9LIHRvIGFkZCBsZWRzIHByb3BlcnR5IHRvIGNvbW1vbiBiaW5kaW5ncyB3aXRo
CnByb3BlciBkZXNjcmlwdGlvbi4KCi0tIApCZXN0IHJlZ2FyZHMsCkphY2VrIEFuYXN6ZXdza2kK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
