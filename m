Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C421842F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 11:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D4A6E192;
	Wed,  8 Jul 2020 09:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2E26E192
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:50:11 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id ed14so9658543qvb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iieBKdbIkdmEuMGEGprBPwP4csgir63UCa7hLiCZa6M=;
 b=V0OXdErRBTLupYqEipOINuiPtJHpcBsQM7/vHKaEFnLr1pkYpzxqJ1o5kwevmUf51v
 ymvzDBTQSIilevzrrRUM4+4ipAZ9ih4hVe6ZrAzFnVeVEgMQ/k2aThSZ2/nQya1S7EDH
 Qd2TD6ya6A/5iK9oYR34gwpj0ux70WO/xXd5/m1+qP2Qi8PJapFMg38N6nIeKQA6F44a
 GguvxOE49pmpAi27JrlclXO/t4Bsy9Bg8cXEh7oBOU+iCPn7jMB2DEooEv/rQcEXDzPs
 oAO68G4VpK+E6o+siOv3ErW+s7llta1udcMF/FyfjlLVvSsUxmrp9eFPuQcV5fdzmHkU
 olmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iieBKdbIkdmEuMGEGprBPwP4csgir63UCa7hLiCZa6M=;
 b=orVjCRt3z9iITh2K+XX9tGrk3sTyT/Y0ZlEyfQByyMb0/suXG+0IF3xOJOUo37X2LR
 FKZSlykQCM00GhVn2cDP4laBnEoDcUuJ9vFT0Ykq41cMpDT+F7Z4MmfgKijpIBbIh2al
 oPv3IPTm0GfKJQQAvCC7cCdw3C7WExWEX+acfHHUHC/7LPP9Ffdj17e9IOggYqbrVP98
 bThURQ6OwkT3DQdt7MDMTh7zRj09xYuK76D7nOg4YsAeUv4ckO29ognvXU1DElG9k6Hf
 fPZDoeyS12Divk+LuEjQIY0QSrkYfqNnOZoGuuppUhs5UnPPwM2Qyfv96gLF1/uYMJl+
 a9iA==
X-Gm-Message-State: AOAM531T7QUVsklmyGHXPID3aDXvLtfzzdKIPlegMcEHHF6PY3JvNvH7
 Q0ELCNTQnINSF0o7PkHhRgNl+Gmb6YG33LMcom3Ctg==
X-Google-Smtp-Source: ABdhPJynDfM3uILfAaTGVj9hpsAurHgU0H8GJVeZIADk8ItE2celzPpaFYs9GExbIpvouqqha+/tw2oz4EiSUlwgghg=
X-Received: by 2002:a0c:ec04:: with SMTP id y4mr52177980qvo.148.1594201810456; 
 Wed, 08 Jul 2020 02:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200701120402.6444-1-yannick.fertre@st.com>
 <3b6e02b8-0f54-4eb0-9728-b304a1aa85d5@st.com>
In-Reply-To: <3b6e02b8-0f54-4eb0-9728-b304a1aa85d5@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 8 Jul 2020 11:49:59 +0200
Message-ID: <CA+M3ks4Bb8ZHzYSZ0v86PvE3x=C30Gmi+mDVJ=PQ7uzPZ8x-+w@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: remove call of pm-runtime functions
To: Philippe CORNU <philippe.cornu@st.com>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAyIGp1aWwuIDIwMjAgw6AgMTQ6MTgsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiA3LzEvMjAgMjowNCBQTSwgWWFubmlj
ayBGZXJ0cmUgd3JvdGU6Cj4gPiBJdCBpcyBub3QgbmVjZXNzYXJ5IHRvIHN1c3BlbmQgb3Igc3Rv
cCB0aGUgbHRkYyBjbG9ja3MKPiA+IHRvIG1vZGlmeSB0aGUgcGl4ZWwgY2xvY2suCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KPiA+
IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDE2IC0tLS0tLS0tLS0tLS0t
LS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jCj4gPiBpbmRleCAzZjU5MGQ5MTZlOTEuLjZlMjhmNzA3MDkyZiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYwo+ID4gQEAgLTUwNiwxNSArNTA2LDcgQEAgc3RhdGljIGJvb2wgbHRkY19jcnRjX21v
ZGVfZml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlKQo+ID4gICB7
Cj4gPiAgICAgICBzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7
Cj4gPiAtICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRldjsKPiA+ICAgICAg
IGludCByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ID4gLSAgICAgYm9vbCBydW50aW1lX2Fj
dGl2ZTsKPiA+IC0gICAgIGludCByZXQ7Cj4gPiAtCj4gPiAtICAgICBydW50aW1lX2FjdGl2ZSA9
IHBtX3J1bnRpbWVfYWN0aXZlKGRkZXYtPmRldik7Cj4gPiAtCj4gPiAtICAgICBpZiAocnVudGlt
ZV9hY3RpdmUpCj4gPiAtICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X3N5bmMoZGRldi0+ZGV2
KTsKPiA+Cj4gPiAgICAgICBpZiAoY2xrX3NldF9yYXRlKGxkZXYtPnBpeGVsX2NsaywgcmF0ZSkg
PCAwKSB7Cj4gPiAgICAgICAgICAgICAgIERSTV9FUlJPUigiQ2Fubm90IHNldCByYXRlICglZEh6
KSBmb3IgcGl4ZWwgY2xrXG4iLCByYXRlKTsKPiA+IEBAIC01MjMsMTQgKzUxNSw2IEBAIHN0YXRp
YyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+Cj4g
PiAgICAgICBhZGp1c3RlZF9tb2RlLT5jbG9jayA9IGNsa19nZXRfcmF0ZShsZGV2LT5waXhlbF9j
bGspIC8gMTAwMDsKPiA+Cj4gPiAtICAgICBpZiAocnVudGltZV9hY3RpdmUpIHsKPiA+IC0gICAg
ICAgICAgICAgcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhkZGV2LT5kZXYpOwo+ID4gLSAgICAg
ICAgICAgICBpZiAocmV0KSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJG
YWlsZWQgdG8gZml4dXAgbW9kZSwgY2Fubm90IGdldCBzeW5jXG4iKTsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+IC0gICAgIH0K
PiA+IC0KPiA+ICAgICAgIERSTV9ERUJVR19EUklWRVIoInJlcXVlc3RlZCBjbG9jayAlZGtIeiwg
YWRqdXN0ZWQgY2xvY2sgJWRrSHpcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIG1vZGUt
PmNsb2NrLCBhZGp1c3RlZF9tb2RlLT5jbG9jayk7Cj4gPgo+ID4KPiBIaSBZYW5uaWNrLAo+IE1h
bnkgdGhhbmtzIGZvciB5b3VyIHBhdGNoLAo+IEFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhp
bGlwcGUuY29ybnVAc3QuY29tPgo+IFBoaWxpcHBlIDotKQoKQXBwbGllZCBvbiBkcm0tbWlzYy1u
ZXh0LgoKVGhhbmtzLApCZW5qYW1pbgoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
