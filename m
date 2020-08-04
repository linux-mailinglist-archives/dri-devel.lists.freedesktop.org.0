Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0323C205
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 01:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476A6E037;
	Tue,  4 Aug 2020 23:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B616E037
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 23:02:00 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9CCB22CAE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 23:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596582119;
 bh=G0QXhj8uvE6uFG6LEZRUpWEjC9R2zkgt7jzZ8pwDd9c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CAEtWlpJUCItzCh0R85X2nUmruZ3t3Ig3+reCj6xaQeikD1+DGcFEWHZb85MDCrIX
 7/xVZw/mxS+fQsvaHRl8suTRwNYGM85ckttn036gSG26IjnYeI/kBXaOW9BIzkcYH5
 EVFouvvLMRXFZF241KforHyr19RuJfcTkEsiQVhY=
Received: by mail-ed1-f42.google.com with SMTP id o18so16678147eds.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 16:01:58 -0700 (PDT)
X-Gm-Message-State: AOAM533mtNgQr65lHMX0zSBu0TzImH8XK1K64/8+I+924V/JOExZnm8l
 KZoH+Cvn/fVIk0Nf4W+4AMr7m2JA7N/3fvBvQA==
X-Google-Smtp-Source: ABdhPJyiqhWgjKSgZozGPp1jl9K0B7+yb2PKS2guwR3ob296qpnBATjzZoDka004lYrqOD1qk897url6EerXEvu419k=
X-Received: by 2002:a50:e109:: with SMTP id h9mr207114edl.47.1596582117170;
 Tue, 04 Aug 2020 16:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-4-linux@fw-web.de>
In-Reply-To: <20200804165555.75159-4-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 5 Aug 2020 07:01:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8VB6wkKLCAcJtwbhzOxN8R3=FzdJhab5NzmpOxyLEmeg@mail.gmail.com>
Message-ID: <CAAOTY_8VB6wkKLCAcJtwbhzOxN8R3=FzdJhab5NzmpOxyLEmeg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/mediatek: add ddp routing for mt7623
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg15pelIOmAseS4iSDkuIrljYgxMjo1NuWvq+mBk++8mgo+Cj4gRnJvbTogRnJhbmsgV3Vu
ZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4KPiBvbiBCUGktUjIvbXQ3NjIzIG1h
aW4tcGF0aCBoYXZlIHRvIGJlIHJvdXRlZCB0byBEUEkwIChoZG1pKSBpbnN0ZWFkIG9mIERTSTAK
PiB1c2luZyBjb21wYXRpYmxlICJtdDc2MjMtbW1zeXMiIGFscmVhZHkgZGVmaW5lZCBpbiBkdHMK
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyMyAr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCA2YmQzNjk0
MzRkOWQuLjExZTM3NTJjNjcwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jCj4gQEAgLTc0LDYgKzc0LDE5IEBAIHN0YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29t
cF9pZCBtdDI3MDFfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAgIEREUF9DT01QT05FTlRfRFBJ
MCwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQ3NjIzX210
a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkwwLAo+ICsgICAgICAg
RERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+ICsg
ICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0RQSTAsCj4g
K307Cj4gKwo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQ3NjIzX210a19k
ZHBfZXh0W10gPSB7Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JETUExLAo+ICsgICAgICAgRERQ
X0NPTVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IGVudW0gbXRrX2RkcF9j
b21wX2lkIG10MjcxMl9tdGtfZGRwX21haW5bXSA9IHsKPiAgICAgICAgIEREUF9DT01QT05FTlRf
T1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+IEBAIC0xMjcsNiArMTQwLDE0
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcwMV9tbXN5
c19kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5zaGFkb3dfcmVnaXN0ZXIgPSB0cnVlLAo+ICB9
Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10NzYyM19t
bXN5c19kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5tYWluX3BhdGggPSBtdDc2MjNfbXRrX2Rk
cF9tYWluLAo+ICsgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDc2MjNfbXRrX2RkcF9t
YWluKSwKPiArICAgICAgIC5leHRfcGF0aCA9IG10NzYyM19tdGtfZGRwX2V4dCwKPiArICAgICAg
IC5leHRfbGVuID0gQVJSQVlfU0laRShtdDc2MjNfbXRrX2RkcF9leHQpLAo+ICsgICAgICAgLnNo
YWRvd19yZWdpc3RlciA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19tbXN5c19kcml2ZXJfZGF0YSBtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAg
ICAubWFpbl9wYXRoID0gbXQyNzEyX210a19kZHBfbWFpbiwKPiAgICAgICAgIC5tYWluX2xlbiA9
IEFSUkFZX1NJWkUobXQyNzEyX210a19kZHBfbWFpbiksCj4gQEAgLTQyMiw2ICs0NDMsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1fb2ZfaWRzW10gPSB7
Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1tbXN5cyIsCj4gICAg
ICAgICAgIC5kYXRhID0gJm10MjcwMV9tbXN5c19kcml2ZXJfZGF0YX0sCj4gKyAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMy1tbXN5cyIsCj4gKyAgICAgICAgIC5kYXRhID0g
Jm10NzYyM19tbXN5c19kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10MjcxMi1tbXN5cyIsCj4gICAgICAgICAgIC5kYXRhID0gJm10MjcxMl9tbXN5c19k
cml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1t
bXN5cyIsCj4gLS0KPiAyLjI1LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
