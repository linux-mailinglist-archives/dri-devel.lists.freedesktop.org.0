Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDA83509
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7E1891F4;
	Tue,  6 Aug 2019 15:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EE9890FE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:20:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n1so2013578wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 08:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TYaSujJB8AjUE/mL3dFUGkFVQfhh4XyBtVxfATnPyb8=;
 b=oAxpJmRIgT6yD9qqrsHdwju3ZHBtP1lpga1XYnkZMYfrgAlNGb/5iXBN2v2TMWw6ev
 BVaWdtSOBi0YHCtOPEwvxrnOorBgPN7n9JTmOQbAGNxSjSZfx6Vg70djlocNYoV8HXum
 nJBhb/uQcgUXrXBvZrjfQYQO6uexQkyGWFfLTTouqQFA6sKDvxC0jrdPppPw1nMnP6XV
 vlURfWgOxqhRgJHAaMzgmhudXUVwwSnk434mOp+y/qio5CdECn6BUupmkidTVqGkXEqG
 kh7juZH7+ssVeo8QaEl2tdQkDfDeZ9/SLD2Q3UNrcSu7Yo2ic0hBnxi4RJ+dJDirLXra
 LmlQ==
X-Gm-Message-State: APjAAAWTYwRGtWEImQq97De1RoO5AlqU8ots67yB7IYEcZDs7BNh9mHe
 z40AYuusK2QZISJMwkdoVVKEJA==
X-Google-Smtp-Source: APXvYqyESJpUwM+2vlQpQpC2fNiMFk6tYD0yityn1JVxyS1RsbIz1Wgs325rjrWROHYxrfWW/Z0nYg==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr801849wrq.6.1565104822560;
 Tue, 06 Aug 2019 08:20:22 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i12sm101885942wrx.61.2019.08.06.08.20.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:20:22 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] dt-bindings: display: amlogic,meson-vpu: convert
 to yaml
To: Rob Herring <robh+dt@kernel.org>
References: <20190806124416.15561-1-narmstrong@baylibre.com>
 <20190806124416.15561-3-narmstrong@baylibre.com>
 <CAL_JsqKS7KeUBhEn1kxT0HZddOZ6oDaZDStUppSdL2vXfAuccg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2c83379c-0857-86da-6f4d-ade728fd5b10@baylibre.com>
Date: Tue, 6 Aug 2019 17:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKS7KeUBhEn1kxT0HZddOZ6oDaZDStUppSdL2vXfAuccg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TYaSujJB8AjUE/mL3dFUGkFVQfhh4XyBtVxfATnPyb8=;
 b=yHCLfXut4OvNYRY6wyJLqdk+LSiDM7gkl1Vg6s3TnqGLupy43mOFw4+QfSCd7318Kr
 l7C5SjScjQQVrKiPhxF593pXO47t87ydTOL0KE+1N/ZfQToUeIez12ew7O8rSCd9XOy2
 AdSTQMw7WoKhAG83ff8kt/RNbFdc4FvvMUtgkkAhXv4PYb7SEG/4vIZQQiiP5UK7+6kS
 uYO8oYetE/5uCKVotWwH2vxMdvM0bICg9/CZww0z0uWvlxrnnpFFhCYUr1agvlo5tgf6
 hbY9Lhl7TGNxMvcFq0FB7oGxsW23TSUz8gbI2S4mn6dEVFJWIuyeCaC4dDuQN8FObb+y
 2/4w==
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gMDYvMDgvMjAxOSAxNzowOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVl
LCBBdWcgNiwgMjAxOSBhdCA2OjQ0IEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IE5vdyB0aGF0IHdlIGhhdmUgdGhlIERUIHZhbGlkYXRpb24g
aW4gcGxhY2UsIGxldCdzIGNvbnZlcnQgdGhlIGRldmljZSB0cmVlCj4+IGJpbmRpbmdzIGZvciB0
aGUgQW1sb2dpYyBEaXNwbGF5IENvbnRyb2xsZXIgb3ZlciB0byBZQU1MIHNjaGVtYXMuCj4+Cj4+
IFRoZSBvcmlnaW5hbCBleGFtcGxlIGhhcyBhIGxlZnRvdmVyICJkbWMiIG1lbW9yeSBjZWxsLCB0
aGF0IGhhcyBiZWVuCj4+IHJlbW92ZWQgaW4gdGhlIHlhbWwgcmV3cml0ZS4KPj4KPj4gVGhlIHBv
cnQgY29ubmVjdGlvbiB0YWJsZSBoYXMgYmVlbiBkcm9wcGVkIGluIGZhdm9yIG9mIGEgZGVzY3Jp
cHRpb24KPj4gb2YgZWFjaCBwb3J0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvYW1sb2dpYyxtZXNvbi12cHUudHh0ICAgIHwgMTIxIC0tLS0tLS0tLS0tLS0tLQo+PiAgLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi12cHUueWFtbCAgIHwgMTM4ICsrKysrKysr
KysrKysrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygrKSwgMTIxIGRl
bGV0aW9ucygtKQo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnR4dAo+PiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMs
bWVzb24tdnB1LnlhbWwKPiAKPj4gKyAgcG93ZXItZG9tYWluczoKPj4gKyAgICBkZXNjcmlwdGlv
bjogcGhhbmRsZSB0byB0aGUgYXNzb2NpYXRlZCBwb3dlciBkb21haW4KPj4gKyAgICBhbGxPZjoK
Pj4gKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRs
ZQo+IAo+IFlvdSBtaXNzZWQgdGhpcyBvbmUuCj4gCgpJbmRlZWQsIHRoYW5rcyBmb3Igc3BvdHRp
bmcsIEknbGwgcmVzZW5kIHdpdGhvdXQgaXQuCgpOZWlsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
