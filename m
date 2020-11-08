Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835932AA8DD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 02:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695326E114;
	Sun,  8 Nov 2020 01:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801C36E114
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 01:54:26 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B32C20878
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 01:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604800466;
 bh=5N/oNzrmeu3aOtDAHcU54Nt3NGOMRnUUf8OnNnCXcWA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YQRexxsWat85DKj1qNwAszWih5nB4XBXAT4Q8jHuBplQNSlCR7sedt8rn8EdmR2XX
 8JUBFzJnb6WTa+ChRgM1m7sXKKq4zcFtaRjASABA0klqF6iWY09q6gt45UeC0zIL2c
 IzKLPIHYiLedvAtL6T0f4tppdwTf9CqIz0Q5bPHI=
Received: by mail-ed1-f45.google.com with SMTP id t11so5064754edj.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 17:54:26 -0800 (PST)
X-Gm-Message-State: AOAM530vrONJ73RPw5r/PMrSSO/zk+ydEA11Am5n4m3m6v/9LAmsWAOB
 yv4uQ1RK3zTZkJVb34coM+Fn3pMNaVC240V4sg==
X-Google-Smtp-Source: ABdhPJz9PLvOVHmdu2y0FOkaVh+eRhblRF0PoRpr3EGHovwbntqZAc8CKlK37k+KXdox0EpoWbXJydOn5iVXuc0kGs0=
X-Received: by 2002:a50:8745:: with SMTP id 5mr8862319edv.49.1604800464719;
 Sat, 07 Nov 2020 17:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-4-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-4-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 09:54:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EhnZaLT8hXqQ-ndS_3A391kSDZWKgVEd5tziPfiNs-g@mail.gmail.com>
Message-ID: <CAAOTY__EhnZaLT8hXqQ-ndS_3A391kSDZWKgVEd5tziPfiNs-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/mediatek: add disp-color MT8167 support
To: Fabien Parent <fparent@baylibre.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBkaXNwLWNvbG9yIG9uIE1UODE2NyBTb0MuCgpGb3IgdGhpcyBwYXRjaCwgYXBwbGllZCB0
byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBSZXZpZXdlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4KPiBDaGFuZ2Vs
b2c6Cj4KPiBWMjogTm8gY2hhbmdlCj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2NvbG9yLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMKPiBpbmRleCAz
YWU5YzgxMDg0NWIuLmExMjI3Y2VmYmYzMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9jb2xvci5jCj4gQEAgLTE2LDYgKzE2LDcgQEAKPgo+ICAjZGVmaW5lIERJU1Bf
Q09MT1JfQ0ZHX01BSU4gICAgICAgICAgICAgICAgICAgIDB4MDQwMAo+ICAjZGVmaW5lIERJU1Bf
Q09MT1JfU1RBUlRfTVQyNzAxICAgICAgICAgICAgICAgICAgICAgICAgMHgwZjAwCj4gKyNkZWZp
bmUgRElTUF9DT0xPUl9TVEFSVF9NVDgxNjcgICAgICAgICAgICAgICAgICAgICAgICAweDA0MDAK
PiAgI2RlZmluZSBESVNQX0NPTE9SX1NUQVJUX01UODE3MyAgICAgICAgICAgICAgICAgICAgICAg
IDB4MGMwMAo+ICAjZGVmaW5lIERJU1BfQ09MT1JfU1RBUlQoY29tcCkgICAgICAgICAgICAgICAg
ICgoY29tcCktPmRhdGEtPmNvbG9yX29mZnNldCkKPiAgI2RlZmluZSBESVNQX0NPTE9SX1dJRFRI
KGNvbXApICAgICAgICAgICAgICAgICAoRElTUF9DT0xPUl9TVEFSVChjb21wKSArIDB4NTApCj4g
QEAgLTE0OCw2ICsxNDksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9k
YXRhIG10MjcwMV9jb2xvcl9kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5jb2xvcl9vZmZzZXQg
PSBESVNQX0NPTE9SX1NUQVJUX01UMjcwMSwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19kaXNwX2NvbG9yX2RhdGEgbXQ4MTY3X2NvbG9yX2RyaXZlcl9kYXRhID0gewo+ICsgICAg
ICAgLmNvbG9yX29mZnNldCA9IERJU1BfQ09MT1JfU1RBUlRfTVQ4MTY3LAo+ICt9Owo+ICsKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9kYXRhIG10ODE3M19jb2xvcl9kcml2
ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5jb2xvcl9vZmZzZXQgPSBESVNQX0NPTE9SX1NUQVJUX01U
ODE3MywKPiAgfTsKPiBAQCAtMTU1LDYgKzE2MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2Rpc3BfY29sb3JfZGF0YSBtdDgxNzNfY29sb3JfZHJpdmVyX2RhdGEgPSB7Cj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kaXNwX2NvbG9yX2RyaXZlcl9kdF9tYXRjaFtd
ID0gewo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1jb2xv
ciIsCj4gICAgICAgICAgIC5kYXRhID0gJm10MjcwMV9jb2xvcl9kcml2ZXJfZGF0YX0sCj4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLWNvbG9yIiwKPiArICAg
ICAgICAgLmRhdGEgPSAmbXQ4MTY3X2NvbG9yX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtY29sb3IiLAo+ICAgICAgICAgICAuZGF0
YSA9ICZtdDgxNzNfY29sb3JfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAge30sCj4gLS0KPiAyLjI4
LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
