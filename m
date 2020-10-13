Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C928D736
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 01:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C45E89BA1;
	Tue, 13 Oct 2020 23:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28AE89BA1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 23:55:11 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 653D92222E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 23:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602633311;
 bh=LREKoBv+gheN6HVpWIeSemw6UsiAfvw9QHnU3ZJXZMs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r0aPqPmc7HzMYRpSbW12KeZyIdZ4eoA4hUiiWz7vcHokRlXuhzadfSPBBx1O3nu42
 mw8Ks67P9K/VuuaROaFkz3teX9eHajoeoamtyeUWQ/AEKG7IgNw/n4wz5Q4iYiSaib
 qVTChIS/LMQDs/ZJvISYm4rktzzWndYD+72H21qg=
Received: by mail-ej1-f46.google.com with SMTP id t25so2165999ejd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 16:55:11 -0700 (PDT)
X-Gm-Message-State: AOAM532dIaLZtwmbZxN/TrB6xou2m3YZzOXiWROOGUc7/tno4JHVbRzd
 eV2xIvgilrhn4XjJGQgSVbACdzdMb8RUd/kmjQ==
X-Google-Smtp-Source: ABdhPJxtoNb8WOKlqzAwPLMajMBUyciAnXbyX/2Wf03lku7cnGSBfpNcKLmz0BCKWdpF+PR4tklDu8iG02n+F4XiUKM=
X-Received: by 2002:a17:906:3716:: with SMTP id
 d22mr2396754ejc.267.1602633309879; 
 Tue, 13 Oct 2020 16:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
In-Reply-To: <20201013181924.4143303-2-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Oct 2020 07:54:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__UWaOz+uQRn9i0C8k=hQT=Nzv-CkbZZKiinFL=Op6j3Q@mail.gmail.com>
Message-ID: <CAAOTY__UWaOz+uQRn9i0C8k=hQT=Nzv-CkbZZKiinFL=Op6j3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMTTml6Ug6YCx5LiJIOS4iuWNiDI6MTnlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBIRE1JIG9uIE1UODE2Ny4gSERNSSBvbiBNVDgxNjcgaXMgc2ltaWxhciB0bwo+IE1UODE3
My9NVDI3MDEgZXhlY3B0IGZvciB0aGUgdHdvIHJlZ2lzdGVyczogU1lTX0NGRzFDIGFuZCBTWVNf
Q0ZHMjAKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUu
Y29tPgo+IC0tLQo+Cj4gQ2hhbmdlbG9nOgo+IHYyOiBmaXggbmFtZSBvZiBwZGF0YSBzdHJ1Y3R1
cmUKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgIHwgNyArKysr
KysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmggfCAyICsrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYwo+IGluZGV4IDU3MzcwYzAzNjQ5Ny4uNDg0ZWE5Y2Q2NTRhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBAQCAtMTgzNSw5ICsxODM1LDE2IEBAIHN0YXRp
YyBzdHJ1Y3QgbXRrX2hkbWlfZGF0YSBtdDgxNzNfaGRtaV9kcml2ZXJfZGF0YSA9IHsKPiAgICAg
ICAgIC5zeXNfY2ZnMjAgPSBIRE1JX1NZU19DRkcyMCwKPiAgfTsKPgo+ICtzdGF0aWMgc3RydWN0
IG10a19oZG1pX2RhdGEgbXQ4MTY3X2hkbWlfZHJpdmVyX2RhdGEgPSB7Cj4gKyAgICAgICAuc3lz
X2NmZzFjID0gTVQ4MTY3X0hETUlfU1lTX0NGRzFDLAo+ICsgICAgICAgLnN5c19jZmcyMCA9IE1U
ODE2N19IRE1JX1NZU19DRkcyMCwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG10a19kcm1faGRtaV9vZl9pZHNbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTczLWhkbWkiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxNzNf
aGRtaV9kcml2ZXJfZGF0YSB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxNjctaGRtaSIsCgpJIHRoaW5rIHdlIHNob3VsZCBhZGQgdGhpcyBjb21wYXRpYmxlIHN0cmlu
ZyBpbiBNZWRpYXRlayBIRE1JIGJpbmRpbmcKZG9jdW1lbnQgWzFdLgoKWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGhkbWkudHh0P2g9djUuOQoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAg
IC5kYXRhID0gJm10ODE2N19oZG1pX2RyaXZlcl9kYXRhIH0sCj4gICAgICAgICB7fQo+ICB9Owo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcmVncy5oCj4gaW5kZXggMjA1MGJh
NDViMjNhLi5hMGY5YzM2N2Q3YWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pX3JlZ3MuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV9yZWdzLmgKPiBAQCAtMTk1LDYgKzE5NSw3IEBACj4gICNkZWZpbmUgR0VOX1JHQiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKDAgPDwgNykKPgo+ICAjZGVmaW5lIEhETUlfU1lT
X0NGRzFDICAgICAgICAgMHgwMDAKPiArI2RlZmluZSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMgIDB4
ODAwCj4gICNkZWZpbmUgSERNSV9PTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KDApCj4gICNkZWZpbmUgSERNSV9SU1QgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+ICAj
ZGVmaW5lIEFOTEdfT04gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+IEBA
IC0yMTEsNiArMjEyLDcgQEAKPiAgI2RlZmluZSBIVFBMR19QSU5fU0VMX09GRiAgICAgICAgICAg
ICAgQklUKDMwKQo+ICAjZGVmaW5lIEFFU19FRlVTRV9FTkFCTEUgICAgICAgICAgICAgICBCSVQo
MzEpCj4gICNkZWZpbmUgSERNSV9TWVNfQ0ZHMjAgICAgICAgICAweDAwNAo+ICsjZGVmaW5lIE1U
ODE2N19IRE1JX1NZU19DRkcyMCAgMHg4MDQKPiAgI2RlZmluZSBERUVQX0NPTE9SX01PREVfTUFT
SyAgICAgICAgICAgKDMgPDwgMSkKPiAgI2RlZmluZSBDT0xPUl84QklUX01PREUgICAgICAgICAg
ICAgICAgICAgICAgICAoMCA8PCAxKQo+ICAjZGVmaW5lIENPTE9SXzEwQklUX01PREUgICAgICAg
ICAgICAgICAoMSA8PCAxKQo+IC0tCj4gMi4yOC4wCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
