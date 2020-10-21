Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA9295923
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183FD6F3F0;
	Thu, 22 Oct 2020 07:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194706E135
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 18:56:44 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z5so4332370iob.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cc/K/PIuG41/PR7b04TzfA68X44vY0DhA0nNvxK+odE=;
 b=GrBOpz3B04eglI4Ou/H+aoMQQg7CO3n/sx11CnC2KFyl751f5YKbxaSJfAieTMWw+3
 kUWQ215pQELE9Py74xWRSY0RUbNNU8vjRkpRQdw7F2GGU/dlVP7gC2Eu6WVVw+Hv6gmq
 fT3Ik/FKSDcRA8IdinKj2EfiCJZ8PsY1Wpev4G37iKVKPC3gKiVcL75dRi5pCmlhLOnb
 xw6VL88vbHWo41Wgo35mqxEQH5kQUEKl7XojseMCtNHeMNA9jtXbEr72jh9Sdcuc9GaW
 bW/GP+M9fsP2tI1TpMf5ZvWbfEtZl4I+lpZjbzIxPbFgx9c8joumjuG2a2iPHZxVfnnB
 pD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cc/K/PIuG41/PR7b04TzfA68X44vY0DhA0nNvxK+odE=;
 b=Cb9nliYu4fm3shItmi0j+ZS9Xx6EfmJV1Da9JQpMYA2fe094r0457vjBsKElgfD/p2
 68D2y5DobGyd52c94Y8OvfDyOf5p2LeMWhIJXIhZOR37Ju+PS8ZPi9iyDzAT9Bv2i4Z7
 dal+e1qoPi+AWEZ5JxSLL0cuukw5Nw130qE5uSw5iHCqhkeKyRA+LOOcpuvDMU5WGyb9
 +MQINzU0BcBFEUJUihwJDdaQObxYr6PKPXO1Fc4Gvz//Apk7z11M4pEYmVYuaLAB0e7S
 tuHLpsOC6QbTK8K5r0Idv7S0cLST0BjJsU2sUbxZ10K0Ugy8b8dR5zQ5Qv7jYN/aHHlJ
 +Twg==
X-Gm-Message-State: AOAM530tDRnVs3tnHPgnDROgQdtOtiA+8CIzlgPC0rMPSy21V2avD8Pn
 iXIaozMlCZR/uW9eRIFvVXftRfzTuwRDlmL7RoLPwA==
X-Google-Smtp-Source: ABdhPJyLG0RAlvFN8Zp7U5m+RnWUUNGK8TOymUgePPUKY/An2N5DmxSuoTuNWfKoZwAH4W8THjAuI9EyHl7jMFAlVZ4=
X-Received: by 2002:a05:6638:1243:: with SMTP id
 o3mr3993558jas.82.1603306603222; 
 Wed, 21 Oct 2020 11:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-3-fparent@baylibre.com>
 <CAAOTY_9m-nqCe1HanPv5xa3mVLpyG6mC1pF1FRAFJdU1jqza_A@mail.gmail.com>
In-Reply-To: <CAAOTY_9m-nqCe1HanPv5xa3mVLpyG6mC1pF1FRAFJdU1jqza_A@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 21 Oct 2020 20:56:32 +0200
Message-ID: <CAOwMV_wvf6v1acXjtuB3Sm83YNyf=A7ULJkEDz7RY7T7mijqHg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mediatek: dsi: add
 documentation for MT8167 SoC
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDIxLCAyMDIwIGF0IDc6MDEgUE0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZhYmllbjoKPgo+
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjHm
l6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPiA+Cj4gPiBBZGQgYmluZGluZyBkb2N1bWVu
dGF0aW9uIGZvciB0aGUgTVQ4MTY3IFNvQy4gVGhlIFNvQyBuZWVkcwo+ID4gYW4gYWRkaXRpb25h
bCBjbG9jayBjb21wYXJlZCB0byB0aGUgYWxyZWFkeSBzdXBwb3J0ZWQgU29DOiBtaXBpMjZtLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29t
Pgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkc2kudHh0ICB8IDcgKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkc2kudHh0Cj4gPiBpbmRleCBmMDZmMjRkNDA1YTUuLjEwYWU2YmU3MjI1ZSAxMDA2NDQK
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzaS50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiA+IEBAIC03LDEyICs3
LDEzIEBAIGNoYW5uZWwgb3V0cHV0Lgo+ID4KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4g
IC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kc2kiCj4gPiAtLSB0aGUgc3VwcG9ydGVk
IGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQ4MTczIGFuZCBtdDgxODMuCj4gPiArLSB0aGUg
c3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5kIG10
ODE4My4KPiA+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhl
IGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiA+ICAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1cHQg
c2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrLgo+ID4gIC0gY2xvY2tzOiBkZXZpY2UgY2xv
Y2tzCj4gPiAgICBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Ns
b2NrLWJpbmRpbmdzLnR4dCBmb3IgZGV0YWlscy4KPiA+IC0tIGNsb2NrLW5hbWVzOiBtdXN0IGNv
bnRhaW4gImVuZ2luZSIsICJkaWdpdGFsIiwgYW5kICJocyIKPiA+ICstIGNsb2NrLW5hbWVzOiBt
dXN0IGNvbnRhaW4gImVuZ2luZSIsICJkaWdpdGFsIiwgImhzIgo+ID4gKyAgQ2FuIG9wdGlvbm5h
bGx5IGFsc28gY29udGFpbiAibWlwaTI2bSIKPgo+IEl0IHNlZW1zIHRoYXQgbWlwaTI2bSBpcyB0
aGUgY2xvY2sgb2YgbWlwaS10eC4gSW4gbXQ4MTczLmR0c2kgWzFdLAo+IG1pcGktdHgncyBjbG9j
ayBpcyAyNm0uCj4KPiBtaXBpX3R4MDogbWlwaS1kcGh5QDEwMjE1MDAwIHsKPiBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE3My1taXBpLXR4IjsKPiByZWcgPSA8MCAweDEwMjE1MDAwIDAgMHgx
MDAwPjsKPiBjbG9ja3MgPSA8JmNsazI2bT47Cj4gY2xvY2stb3V0cHV0LW5hbWVzID0gIm1pcGlf
dHgwX3BsbCI7Cj4gI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICNwaHktY2VsbHMgPSA8MD47Cj4gc3Rh
dHVzID0gImRpc2FibGVkIjsKPiB9Owo+Cj4gSWYgdGhpcyBpcyB0aGUgY2xvY2sgb2YgbWlwaS10
eCwgaXQgc2hvdWxkIGJlIGNvbnRyb2xsZWQgYnkgbWlwaS10eCBkcml2ZXIuCgpUaGFua3MsIEkg
d2lsbCBmaXggdGhhdCBpbiB2Mi4KCj4KPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaT9oPXY1LjkKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1L
dWFuZy4KPgo+ID4gIC0gcGh5czogcGhhbmRsZSBsaW5rIHRvIHRoZSBNSVBJIEQtUEhZIGNvbnRy
b2xsZXIuCj4gPiAgLSBwaHktbmFtZXM6IG11c3QgY29udGFpbiAiZHBoeSIKPiA+ICAtIHBvcnQ6
IE91dHB1dCBwb3J0IG5vZGUgd2l0aCBlbmRwb2ludCBkZWZpbml0aW9ucyBhcyBkZXNjcmliZWQg
aW4KPiA+IEBAIC0yNiw3ICsyNyw3IEBAIFRoZSBNSVBJIFRYIGNvbmZpZ3VyYXRpb24gbW9kdWxl
IGNvbnRyb2xzIHRoZSBNSVBJIEQtUEhZLgo+ID4KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+
ID4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1taXBpLXR4Igo+ID4gLS0gdGhlIHN1
cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCA3NjIzLCBtdDgxNzMgYW5kIG10ODE4My4KPiA+ICst
IHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5k
IG10ODE4My4KPiA+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2Yg
dGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiA+ICAtIGNsb2NrczogUExMIHJlZmVyZW5jZSBj
bG9jawo+ID4gIC0gY2xvY2stb3V0cHV0LW5hbWVzOiBuYW1lIG9mIHRoZSBvdXRwdXQgY2xvY2sg
bGluZSB0byB0aGUgRFNJIGVuY29kZXIKPiA+IC0tCj4gPiAyLjI4LjAKPiA+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
