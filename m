Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD142745BC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C629D6E88D;
	Tue, 22 Sep 2020 15:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E660A6E88D;
 Tue, 22 Sep 2020 15:50:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g4so17628993wrs.5;
 Tue, 22 Sep 2020 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k1qiM4bUagO9PvzG1mYjhQ2oeaOlyE+NHa+RI/UKMuI=;
 b=OffjgK1VvQU3R4J2PDeHOOirKPulZND04R2KV4wX2yXgAdKlN82m3+qgP/YLrgHdoP
 XRGEQpgSy/EvjUge6T9J532EjQGUOMSKUUm2YjrwEEnfFJYXoItcvuYoojcMCiFOLfCl
 +a9sSbot03midkDhZaSzd4yF71ySdX6mfEYJ8UiYu3QOnw1082QuhAksGSZ6TEBI4DqE
 YXpTPsDBx4UiAtoiXHGouZPixegjYM59VecZEk+F8kHX62SO35UKc/naF7K0IgW1DkdP
 s9pm7Hru94v9+btXnyu2IXDVeNLGSWoDFO8I+lUf5O0ulzIoYYO61eFmy6f9gCBnvy+b
 +miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k1qiM4bUagO9PvzG1mYjhQ2oeaOlyE+NHa+RI/UKMuI=;
 b=hIJPHl/z+u2gsk47wITf5x87oB6CuQ6mqspXaYwulXhKyvgtG4JogjPlEHKge1bMyc
 hWoaUmMhI1/MxpoA1TO6nAW9HlEDArYIcR54f1G+ejG4hvjqsuBYqmXh4cMAoecSETZ/
 axE1qZj6IWM7vUKqr39xNeCRoG07v2lSAe+eXY04h9KkDBh8l7gtXEq2tO49ZSLcr5/T
 JZ5A/e7ywYcW2V1X9ea6j/soBKO7A1ISiQ64EX+XGlqTWrbjFnV8Rx6rSdS1UE5Uh7JX
 fLqpTHx0c5Y94VV1TuJNCuCuH4TZCszy8Gzh1usKj1zkeMNRc2RdA63hiWmi+k3fOqRH
 EoXg==
X-Gm-Message-State: AOAM530yY5cJwbHJEJoeq/vTGZovnA31WBt6EerlnjPvuEqAg3+I4yI8
 ZVTT6Jxn48qAOauZZF60ZO1POHTCwhXA0Vov86Q=
X-Google-Smtp-Source: ABdhPJzNUoLcCUJtNlHpGP5CHl4ouHNhSErzbaqeG9ZEfR+X8xgDw8Vu/pgn8/BMiFFtwMkSUKK2DOChEI2ZoswOEhw=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr6452043wrl.419.1600789804606; 
 Tue, 22 Sep 2020 08:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <1600773099-32693-1-git-send-email-wangqing@vivo.com>
 <CAD=4a=URYhNswOBfBj39b00HWR3vWeHF9ntP-n_SPa94YJZbTg@mail.gmail.com>
In-Reply-To: <CAD=4a=URYhNswOBfBj39b00HWR3vWeHF9ntP-n_SPa94YJZbTg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Sep 2020 11:49:53 -0400
Message-ID: <CADnq5_ObAjsxfKsJgk6mE7OKK6Jw=-bacva6_rxySKSD8nqAjg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/radeon: fix spellint typo in comments
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Wang Qing <wangqing@vivo.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB3aXRoIHN1YmplY3QgdHlwbyBmaXhlZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwg
U2VwIDIyLCAyMDIwIGF0IDEwOjA3IEFNIEVybnN0IFNqw7ZzdHJhbmQgPGVybnN0cEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYSB0eXBvIGluIHlvdXIgcGF0Y2ggc3ViamVjdC4gOy0p
Cj4KPiBSZWdhcmRzCj4gLy9Fcm5zdAo+Cj4gRGVuIHRpcyAyMiBzZXAuIDIwMjAga2wgMTU6MTEg
c2tyZXYgV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT46Cj4+Cj4+IE1vZGlmeSB0aGUgY29t
bWVudCB0eXBvOiAiZGVmaW5hdGVseSIgLT4gImRlZmluaXRlbHkiLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3ZtLmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92bS5j
Cj4+IGluZGV4IGY2MGZhZTAuLjNkNmUyY2QKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdm0uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92bS5j
Cj4+IEBAIC0xODgsNyArMTg4LDcgQEAgc3RydWN0IHJhZGVvbl9mZW5jZSAqcmFkZW9uX3ZtX2dy
YWJfaWQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4+ICAgICAgICAgICAgIHZtX2lkLT5s
YXN0X2lkX3VzZSA9PSByZGV2LT52bV9tYW5hZ2VyLmFjdGl2ZVt2bV9pZC0+aWRdKQo+PiAgICAg
ICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4+Cj4+IC0gICAgICAgLyogd2UgZGVmaW5hdGVseSBu
ZWVkIHRvIGZsdXNoICovCj4+ICsgICAgICAgLyogd2UgZGVmaW5pdGVseSBuZWVkIHRvIGZsdXNo
ICovCj4+ICAgICAgICAgdm1faWQtPnBkX2dwdV9hZGRyID0gfjBsbDsKPj4KPj4gICAgICAgICAv
KiBza2lwIG92ZXIgVk1JRCAwLCBzaW5jZSBpdCBpcyB0aGUgc3lzdGVtIFZNICovCj4+IC0tCj4+
IDIuNy40Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
