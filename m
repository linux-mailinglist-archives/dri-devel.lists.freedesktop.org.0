Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263B103605
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 09:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722896E0C9;
	Wed, 20 Nov 2019 08:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532426E056
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:31:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s5so27055870wrw.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 00:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=38z6RyjMyXCUIeOwwLykSbeDE8sPTFCwnDO3EjCpWOA=;
 b=ZUf5P7/RM7kp/aD5f3ukC3gt5vNCvh3NdQ1RhocWCyLHTB2HGdkBZ+gEActPkPzYnk
 zwFmz2ECq7KiyxMdjfkQFsuf8k8+6lbN/K6YQRZTZb6dOcvCy/5EWMRoB1AoqGxx0hBL
 NNYQJwhI0IWyBHsLlJ27fKz+uXdIn+tozRh5qmzZYKNi2GtAN4ReUd7RL20qXa5Zds2W
 CKkoEntsQKvjRYLU1IeJm3iwoTtYzwuj/XrjOCSZhHPg6LcQG55Mg29Wuc+8dpUoFdIF
 TqqN6NLwz54tY92i7cHNdbSXNacVwNJtUebEoQ590wJb60znkOoAxpgQYqhSANb+Nr5U
 vmSg==
X-Gm-Message-State: APjAAAXgHW4Peb0kfLOW95ALOxvJw/uPJ7/6YRlITOiQPBLInUD0hGof
 Q+XWL51uu5S5ijlJEa72uXM9bg==
X-Google-Smtp-Source: APXvYqzkhtlhPBQtXB7GC0rslGbZ3YyeTfH9T+nKnWCBFlSSTNa8sH6AHhqdy9PppQPxS0gPUPoVJA==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr1682422wrv.384.1574238710636; 
 Wed, 20 Nov 2019 00:31:50 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x205sm6414418wmb.5.2019.11.20.00.31.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Nov 2019 00:31:49 -0800 (PST)
Subject: Re: [PATCH v3 4/4] dt-bindings: display: add IMX MIPI DSI host
 controller doc
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-5-adrian.ratiu@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e19aca1f-842d-a5b4-6fc1-02f7f6dd136d@baylibre.com>
Date: Wed, 20 Nov 2019 09:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118152518.3374263-5-adrian.ratiu@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=38z6RyjMyXCUIeOwwLykSbeDE8sPTFCwnDO3EjCpWOA=;
 b=mhOwiYOke8BRLMgtIyxZPbnidW28nPO4gCUBE0cIZL3O+K4vUilbkglAPxuXKXEBEL
 YG/Un3TWx3XrCCO0Rd39GaDIn34GfSfMW9ETB41HKfLLkoYxx3nfGrRUsgvz5wzAkHNb
 2nkMJWCw4H5LJ/AVLzUqynWYJg89ZbZiRXpcgiuV6nwCguK1oSdL7UVAoL5MV8Ay6GfZ
 aB3AFGVdZa6L/0pgsnrWUQ/AJohW6fvbkDoFeQVSSqt7y/Jo5BEkIY8qtnrtZbbROg/Y
 ieH0XYJmbJYGDCtZM+ah9eXHI4Ch1VNkhkX8fxf9biO77ryRMaclLxiPj779CcdH5dWd
 7Lpw==
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
Cc: Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxOC8xMS8yMDE5IDE2OjI1LCBBZHJpYW4gUmF0aXUgd3JvdGU6CgpBIHNtYWxsIGNv
bW1pdCBsb2cgd291bGQgYmUgd2VsY29tZSBoZXJlLgoKPiBTaWduZWQtb2ZmLWJ5OiBTam9lcmQg
U2ltb25zIDxzam9lcmQuc2ltb25zQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFy
dHluIFdlbGNoIDxtYXJ0eW4ud2VsY2hAY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBB
ZHJpYW4gUmF0aXUgPGFkcmlhbi5yYXRpdUBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0ICAgICAgICAgfCA1NiArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbWlw
aS1kc2kudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjNmMDVjMzJlZjk2Mwo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2ku
dHh0CgpOZXcgYmluZGluZ3Mgc2hvdWxkIHVzZSB0aGUgeWFtbCBkdC1zY2hlbWEgZm9ybWF0LCBj
b3VsZCB5b3UgY29udmVydCBpdCA/CgpOZWlsCgo+IEBAIC0wLDAgKzEsNTYgQEAKPiArRnJlZXNj
YWxlIGkuTVg2IERXIE1JUEkgRFNJIEhvc3QgQ29udHJvbGxlcgo+ICs9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICtUaGUgRFNJIGhvc3QgY29udHJvbGxl
ciBpcyBhIFN5bm9wc3lzIERlc2lnbldhcmUgTUlQSSBEU0kgdjEuMDEgSVAKPiArd2l0aCBhIGNv
bXBhbmlvbiBQSFkgSVAuCj4gKwo+ICtUaGVzZSBEVCBiaW5kaW5ncyBmb2xsb3cgdGhlIFN5bm9w
c3lzIERXIE1JUEkgRFNJIGJpbmRpbmdzIGRlZmluZWQgaW4KPiArRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R3X21pcGlfZHNpLnR4dCB3aXRoCj4gK3Ro
ZSBmb2xsb3dpbmcgZGV2aWNlLXNwZWNpZmljIHByb3BlcnRpZXMuCj4gKwo+ICtSZXF1aXJlZCBw
cm9wZXJ0aWVzOgo+ICsKPiArLSAjYWRkcmVzcy1jZWxsczogU2hvdWxkIGJlIDwxPi4KPiArLSAj
c2l6ZS1jZWxsczogU2hvdWxkIGJlIDwwPi4KPiArLSBjb21wYXRpYmxlOiAiZnNsLGlteDZxLW1p
cGktZHNpIiwgInNucHMsZHctbWlwaS1kc2kiLgo+ICstIHJlZzogU2VlIGR3X21pcGlfZHNpLnR4
dC4KPiArLSBpbnRlcnJ1cHRzOiBUaGUgY29udHJvbGxlcidzIENQVSBpbnRlcnJ1cHQuCj4gKy0g
Y2xvY2tzLCBjbG9jay1uYW1lczogUGhhbmRsZXMgdG8gdGhlIGNvbnRyb2xsZXIncyBwbGwgcmVm
ZXJlbmNlCj4gKyAgY2xvY2socmVmKSBhbmQgQVBCIGNsb2NrKHBjbGspLCBhcyBkZXNjcmliZWQg
aW4gWzFdLgo+ICstIHBvcnRzOiBhIHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb25z
IGFzIGRlZmluZWQgaW4gWzJdLgo+ICstIGdwcjogU2hvdWxkIGJlIDwmZ3ByPi4KPiArICAgICAg
IFBoYW5kbGUgdG8gdGhlIGlvbXV4Yy1ncHIgcmVnaW9uIGNvbnRhaW5pbmcgdGhlIG11bHRpcGxl
eGVyCj4gKyAgICAgICBjb250cm9sIHJlZ2lzdGVyLgo+ICsKPiArWzFdIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5kaW5ncy50eHQKPiArWzJdIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+
ICsKPiArRXhhbXBsZToKPiArCj4gKwltaXBpX2RzaTogbWlwaUAyMWUwMDAwIHsKPiArCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiArCQljb21wYXRpYmxl
ID0gImZzbCxpbXg2cS1taXBpLWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIjsKPiArCQlyZWcgPSA8
MHgwMjFlMDAwMCAweDQwMDA+Owo+ICsJCWludGVycnVwdHMgPSA8MCAxMDIgSVJRX1RZUEVfTEVW
RUxfSElHSD47Cj4gKwkJZ3ByID0gPCZncHI+Owo+ICsJCWNsb2NrcyA9IDwmY2xrcyBJTVg2UURM
X0NMS19NSVBJX0NPUkVfQ0ZHPiwKPiArCQkJIDwmY2xrcyBJTVg2UURMX0NMS19NSVBJX0lQRz47
Cj4gKwkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsiOwo+ICsJCXN0YXR1cyA9ICJva2F5IjsK
PiArCj4gKwkJcG9ydHMgewo+ICsJCQlwb3J0QDAgewo+ICsJCQkJcmVnID0gPDA+Owo+ICsJCQkJ
bWlwaV9tdXhfMDogZW5kcG9pbnQgewo+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaXB1MV9k
aTBfbWlwaT47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICsJCQlwb3J0QDEgewo+ICsJCQkJcmVnID0g
PDE+Owo+ICsJCQkJbWlwaV9tdXhfMTogZW5kcG9pbnQgewo+ICsJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmaXB1MV9kaTFfbWlwaT47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICsJCX07Cj4gKyAgICAg
ICAgfTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
