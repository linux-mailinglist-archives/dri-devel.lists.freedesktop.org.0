Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F61255195
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 01:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1D76E0DD;
	Thu, 27 Aug 2020 23:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9CC6E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:32:58 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A37C20848
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598571178;
 bh=CxkE/q++Eo2vJZXF0frHIrwwj8Su9GHTDl44/EylMxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0INqP1XWALFFZC20VHK8xYB2tSGPjASUk4GIkFKOcvuFubYdz5GfetLVTTTBWPFBU
 PdqSaWjRJGPExZnMjjlZ3Q8OwLC8eMfWLP0qCGJOz8LSo4eWkthsMxP8ZGCF3ZoFsJ
 dZ9gjHsPJ6BSUjnhwXkmUIajxFUVWdeop8pHEDPw=
Received: by mail-ed1-f41.google.com with SMTP id c10so6450249edk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:32:58 -0700 (PDT)
X-Gm-Message-State: AOAM531aLrCkXkOrdliCyjORqiiuiJbEe6zy0/TnVDtQP8e2hqybynGs
 1SRF4m9VKlBajdnNjPL91RCxXSAtxTRVYvOSsw==
X-Google-Smtp-Source: ABdhPJwTJAXoXtZdq1zZz3alAlq9lDJ0l2Ct9XsjXhjUW3fXtj711OBC1IZNyN5F5962joWUZrBnuIu2GzAzLaEVIWs=
X-Received: by 2002:a05:6402:17d8:: with SMTP id
 s24mr21170877edy.61.1598571176689; 
 Thu, 27 Aug 2020 16:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-3-linux@fw-web.de>
In-Reply-To: <20200819081752.4805-3-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Aug 2020 07:32:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__SVKF=9CDeyHyKoAZ1fhRK+R0y0S5wMYz+ovqRN8Xtjw@mail.gmail.com>
Message-ID: <CAAOTY__SVKF=9CDeyHyKoAZ1fhRK+R0y0S5wMYz+ovqRN8Xtjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/mediatek: add ddp routing for mt7623
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
tDjmnIgxOeaXpSDpgLHkuIkg5LiL5Y2INDoxOOWvq+mBk++8mgo+Cj4gRnJvbTogRnJhbmsgV3Vu
ZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4KPiBvbiBCUGktUjIvbXQ3NjIzIG1h
aW4tcGF0aCBoYXZlIHRvIGJlIHJvdXRlZCB0byBEUEkwIChoZG1pKSBpbnN0ZWFkIG9mIERTSTAK
PiB1c2luZyBjb21wYXRpYmxlICJtdDc2MjMtbW1zeXMiIGFscmVhZHkgZGVmaW5lZCBpbiBkdHMK
PgoKRm9yIHRoaXMgcGF0Y2gsIGFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdA
cHVibGljLWZpbGVzLmRlPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBp
bmRleCAwNDBhOGYzOTNmZTIuLjIzNTBlMzIwMGI1OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTc0LDYgKzc0LDE5IEBAIHN0YXRpYyBjb25zdCBlbnVt
IG10a19kZHBfY29tcF9pZCBtdDI3MDFfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAgIEREUF9D
T01QT05FTlRfRFBJMCwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBf
aWQgbXQ3NjIzX210a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkww
LAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRf
Q09MT1IwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gKyAgICAgICBERFBfQ09NUE9O
RU5UX0RQSTAsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQg
bXQ3NjIzX210a19kZHBfZXh0W10gPSB7Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JETUExLAo+
ICsgICAgICAgRERQX0NPTVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IGVu
dW0gbXRrX2RkcF9jb21wX2lkIG10MjcxMl9tdGtfZGRwX21haW5bXSA9IHsKPiAgICAgICAgIERE
UF9DT01QT05FTlRfT1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+IEBAIC0x
MjcsNiArMTQwLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRh
IG10MjcwMV9tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5zaGFkb3dfcmVnaXN0ZXIg
PSB0cnVlLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9k
YXRhIG10NzYyM19tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5tYWluX3BhdGggPSBt
dDc2MjNfbXRrX2RkcF9tYWluLAo+ICsgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDc2
MjNfbXRrX2RkcF9tYWluKSwKPiArICAgICAgIC5leHRfcGF0aCA9IG10NzYyM19tdGtfZGRwX2V4
dCwKPiArICAgICAgIC5leHRfbGVuID0gQVJSQVlfU0laRShtdDc2MjNfbXRrX2RkcF9leHQpLAo+
ICsgICAgICAgLnNoYWRvd19yZWdpc3RlciA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGEg
PSB7Cj4gICAgICAgICAubWFpbl9wYXRoID0gbXQyNzEyX210a19kZHBfbWFpbiwKPiAgICAgICAg
IC5tYWluX2xlbiA9IEFSUkFZX1NJWkUobXQyNzEyX210a19kZHBfbWFpbiksCj4gQEAgLTQyMiw2
ICs0NDMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGRwX2NvbXBf
ZHRfaWRzW10gPSB7Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1f
b2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1t
bXN5cyIsCj4gICAgICAgICAgIC5kYXRhID0gJm10MjcwMV9tbXN5c19kcml2ZXJfZGF0YX0sCj4g
KyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMy1tbXN5cyIsCj4gKyAgICAg
ICAgIC5kYXRhID0gJm10NzYyM19tbXN5c19kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1tbXN5cyIsCj4gICAgICAgICAgIC5kYXRhID0gJm10
MjcxMl9tbXN5c19kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE3My1tbXN5cyIsCj4gLS0KPiAyLjI1LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
