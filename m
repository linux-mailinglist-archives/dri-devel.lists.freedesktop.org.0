Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A903315191A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 11:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9536E7D0;
	Tue,  4 Feb 2020 10:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BB76E7D0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 10:58:41 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c5so13938213qtj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YL3TO9ZpKBY8+YOVx7GVmXHwa9ZG4OtIovpotqZSOvQ=;
 b=i0jtLvBBX8r5QFc0r7Hxo2IZOc6yvj9C31xPCO1shilPLnf2bgJo2m6Tz7Lgh3spwt
 tnKqB4gxkprzhxpFv6FFGHeXmydAtHjxmf0aefNbF9p+ihxiajkPn1gY17dmT1J4+vym
 SErflyV3b6IxZovmGu7nMrHcy8kBkMAgMvM5vZ8FZ+eZ8HDqAEEczfSp/WMNHoejJYfM
 lyLrVQTvEcYf2IES4Z3MPN+Vosc+DOGCjPIfkEGjJBPSMC+/zMLUNHbNahIE5qmE9J9a
 jZUN3yRHQOcgCFTynkHYZJp4g/5Q4fTQPU8VZy3I0/R/vlKdXcVL8w/muhJKDi58nv9Z
 vp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YL3TO9ZpKBY8+YOVx7GVmXHwa9ZG4OtIovpotqZSOvQ=;
 b=ANBt4m0fAV3mDq7aCsFBLgvrkfby6iOLO9Zq5ar9XNzmeVswAzjzTthrxKcoiPuWFt
 aYeHoKN5M8E6VFwDmSnI+UlBZMWHs7emeIeaR68GXn1SMz9aZi3VJPCdXFQXauOuuKsE
 q4vCcHxEWeT1O4eQis4gHaGd+wiL2io79m9y28/lS/jsXxQ66nJbxTPSGnOfFdl1yypo
 iK82ATSdmRqV8n5/3XZjlCtiHZXdbvsDYlBsUep8P/Xk9yE4KfTyG8x0xo5Tyey94+L8
 9mtMFOQZkKxeWlAI3Op3dms6nzA4SaOC29f+dEv7exaPMwGYZJxMOx+i50qDu8JmerCG
 3o4g==
X-Gm-Message-State: APjAAAXbAABZzCZW/piYanDSvbBMcXHeWciwdiibiQauatFIQHMcrj1e
 A7TGjw237nCPCRpzxwYvRltuE+6pnvcLJP7o/vRW3A==
X-Google-Smtp-Source: APXvYqyiwcSIqGmki9INgStVr+9p8LXvXFoIcE7YOnPCL2ZR5ORRWCr1pIBeEgRF46HUbHiAIYa9Vwxx/3iq0aPPtKQ=
X-Received: by 2002:aed:2bc2:: with SMTP id e60mr28271222qtd.115.1580813920706; 
 Tue, 04 Feb 2020 02:58:40 -0800 (PST)
MIME-Version: 1.0
References: <1579601650-7055-1-git-send-email-yannick.fertre@st.com>
 <f925ddf5-3265-638b-14b9-71b549b5a9ad@st.com>
In-Reply-To: <f925ddf5-3265-638b-14b9-71b549b5a9ad@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 4 Feb 2020 11:58:30 +0100
Message-ID: <CA+M3ks7jCHzOuHnOO=v5AgsqSRbMVxYhkMY332u5qec=jJtHsw@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: check crtc state before enabling LIE
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

TGUgamV1LiAyMyBqYW52LiAyMDIwIMOgIDEwOjUwLCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBEZWFyIFlhbm5pY2ssCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDEvMjEvMjAgMTE6MTQgQU0sIFlhbm5p
Y2sgRmVydHJlIHdyb3RlOgo+ID4gRm9sbG93aW5nIGludmVzdGlnYXRpb25zIG9mIGEgaGFyZHdh
cmUgYnVnLCB0aGUgTElFIGludGVycnVwdAo+ID4gY2FuIG9jY3VyIHdoaWxlIHRoZSBkaXNwbGF5
IGNvbnRyb2xsZXIgaXMgbm90IGFjdGl2YXRlZC4KPiA+IExJRSBpbnRlcnJ1cHQgKHZibGFuaykg
ZG9uJ3QgaGF2ZSB0byBiZSBzZXQgaWYgdGhlIENSVEMgaXMgbm90Cj4gPiBlbmFibGVkLgo+ID4K
CkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KClRoYW5rcwpCZW5qYW1pbgoKPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gPiAtLS0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCA3ICsrKysrKy0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
Cj4gPiBpbmRleCBjMjgxNWU4Li5lYTY1NGM3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBA
QCAtNjQ4LDkgKzY0OCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9m
dW5jcyBsdGRjX2NydGNfaGVscGVyX2Z1bmNzID0gewo+ID4gICBzdGF0aWMgaW50IGx0ZGNfY3J0
Y19lbmFibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiA+ICAgewo+ID4gICAgICAg
c3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOwo+ID4gKyAgICAg
c3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSA9IGNydGMtPnN0YXRlOwo+ID4KPiA+ICAgICAg
IERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4gPiAtICAgICByZWdfc2V0KGxkZXYtPnJlZ3MsIExU
RENfSUVSLCBJRVJfTElFKTsKPiA+ICsKPiA+ICsgICAgIGlmIChzdGF0ZS0+ZW5hYmxlKQo+ID4g
KyAgICAgICAgICAgICByZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfTElFKTsKPiA+
ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPiA+Cj4gPiAgICAg
ICByZXR1cm4gMDsKPiA+ICAgfQo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
