Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD5128B58
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 21:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195036E4A7;
	Sat, 21 Dec 2019 20:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC5C6E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 20:01:10 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8B5C206C3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576958470;
 bh=cAoG20mOdDaPDzKbP1yFgpmFG1wND9D7fIKzylMTt+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VfKHDs+UrA0zxIEDZ3/P6uaXOxZ2X+ypWsPWjAajHI0ahhdVjqi2hFHOCL6iNKHf2
 LdKldq/aPkuaE8bGlZqUqSuILfyq7f9TpU/64QWz3CN/81vc2/fVuoRmmBfhxluYq1
 nnHdDzE8BnOWyyR8v8kz/+O9liL1lZ12dD2p+los=
Received: by mail-lj1-f172.google.com with SMTP id o13so2183811ljg.4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 12:01:09 -0800 (PST)
X-Gm-Message-State: APjAAAXg5qvfpdScDKNzqRShGQwkeu9OCAURmgk3Dt1eqyYN/0fAP813
 AGVtwlLtq+nGAQDdCm2Tm2Okw7Dj0EDlzg/gZMk=
X-Google-Smtp-Source: APXvYqyoSWFit4YcQSqBr6vLJk2CTqXrA+sNgLRokSVcuTZ0gSZDSqHSBwKiDJtfNlZKwKctroRd0nQzOWJkw4mUiBo=
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr12176163ljk.30.1576958468047; 
 Sat, 21 Dec 2019 12:01:08 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-1-a.swigon@samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com>
In-Reply-To: <20191220115653.6487-5-a.swigon@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 22 Dec 2019 05:00:31 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0PBoBe5NUObMdK9ru_=+dV6N8nJk3JzM+FF3y9_y8n1w@mail.gmail.com>
Message-ID: <CAGTfZH0PBoBe5NUObMdK9ru_=+dV6N8nJk3JzM+FF3y9_y8n1w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjAyIFBNIEFydHVyIMWad2lnb8WEIDxhLnN3
aWdvbkBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgdGhlIGZvbGxvd2lu
ZyBwcm9wZXJ0aWVzIHRvIHRoZSBFeHlub3M0NDEyIERUOgo+ICAgLSBleHlub3MsaW50ZXJjb25u
ZWN0LXBhcmVudC1ub2RlOiB0byBkZWNsYXJlIGNvbm5lY3Rpb25zIGJldHdlZW4KPiAgICAgbm9k
ZXMgaW4gb3JkZXIgdG8gZ3VhcmFudGVlIFBNIFFvUyByZXF1aXJlbWVudHMgYmV0d2VlbiBub2Rl
czsKPiAgIC0gI2ludGVyY29ubmVjdC1jZWxsczogcmVxdWlyZWQgYnkgdGhlIGludGVyY29ubmVj
dCBmcmFtZXdvcmsuCj4KPiBOb3RlIHRoYXQgI2ludGVyY29ubmVjdC1jZWxscyBpcyBhbHdheXMg
emVybyBhbmQgbm9kZSBJRHMgYXJlIG5vdAo+IGhhcmRjb2RlZCBhbnl3aGVyZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgfCA1ICsrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpCj4gaW5kZXggNGNlM2Q3N2E2NzA0
Li5kOWQ3MGVhY2ZjYWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQx
Mi1vZHJvaWQtY29tbW9uLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEy
LW9kcm9pZC1jb21tb24uZHRzaQo+IEBAIC05MCw2ICs5MCw3IEBACj4gICZidXNfZG1jIHsKPiAg
ICAgICAgIGV4eW5vcyxwcG11LWRldmljZSA9IDwmcHBtdV9kbWMwXzM+LCA8JnBwbXVfZG1jMV8z
PjsKPiAgICAgICAgIHZkZC1zdXBwbHkgPSA8JmJ1Y2sxX3JlZz47Cj4gKyAgICAgICAjaW50ZXJj
b25uZWN0LWNlbGxzID0gPDA+Owo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+Cj4g
QEAgLTEwNiw2ICsxMDcsOCBAQAo+ICAmYnVzX2xlZnRidXMgewo+ICAgICAgICAgZXh5bm9zLHBw
bXUtZGV2aWNlID0gPCZwcG11X2xlZnRidXNfMz4sIDwmcHBtdV9yaWdodGJ1c18zPjsKPiAgICAg
ICAgIHZkZC1zdXBwbHkgPSA8JmJ1Y2szX3JlZz47Cj4gKyAgICAgICBleHlub3MsaW50ZXJjb25u
ZWN0LXBhcmVudC1ub2RlID0gPCZidXNfZG1jPjsKPiArICAgICAgICNpbnRlcmNvbm5lY3QtY2Vs
bHMgPSA8MD47Cj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gIH07Cj4KPiBAQCAtMTE2LDYg
KzExOSw4IEBACj4KPiAgJmJ1c19kaXNwbGF5IHsKPiAgICAgICAgIGV4eW5vcyxwYXJlbnQtYnVz
ID0gPCZidXNfbGVmdGJ1cz47Cj4gKyAgICAgICBleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1u
b2RlID0gPCZidXNfbGVmdGJ1cz47Cj4gKyAgICAgICAjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+
Owo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+Cj4gLS0KPiAyLjE3LjEKPgoKUmV2
aWV3ZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgoKSSBoYXMgbm90
IHlldCB0ZXN0ZWQgb24gdGFyZ2V0LiBJJ2xsIHRlc3QgaXQgb24gbmV4dCB3ZWVrCmFuZCB0aGVu
IHJlcGx5IHRoZSB0ZXN0IHJlc3VsdC4KCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
