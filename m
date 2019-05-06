Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED01451C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9DE89227;
	Mon,  6 May 2019 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2D089227
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:26:03 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j6so13639978qtq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 00:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WNzn2D4LRFx0zq3ZMJPIJy2EHlJS0W/qRQO2E0djUbU=;
 b=OPGevWzAvX/walk4IvWsEhUF4XwufYnWmSmL+DJDA5iDrJqm9cGhiq/djXskQjzJ/J
 7ukpbMwlEoQFHpdUHVmfsSza3F2jjUPwReN1Jltz2GLNnrQScMTzhnXgk5ByQ61lpYfz
 D/rjUdQuP7bCekYYu3ne6+KtQMuk+KMfRZZimWUL8xFMKmhIo3DxHhJ0xH+XOS6VNsaJ
 Th9IwYFJJMPgy/2AHMou6oBzmmbSEcpdqcJl9M63bwpjktHD8wX06z8PpToyYNFeK9gz
 i2UB6fIgBWVgoLpYdSQF+gxNaWY5zL8K6JBkdy+xtdCNQnySCkzH3jL5EgNZPI3r4KfI
 p4qQ==
X-Gm-Message-State: APjAAAW4134rJmzCB6pPZx6x0GJyLbmMtOUZlZix+XrsCCe8+pLzFgbn
 R+4pEwwiRioocp4PG/gm9KKZc1MJTTNnT9I+zaH2pw==
X-Google-Smtp-Source: APXvYqw4GFj4q4UVpUiDKBHF6OghiHzU5JrTfWPLaCo7KAV2UX+jBKeVBbLTsVkPr/PjAhKVuoZEyF0uUBi9eKD6m8o=
X-Received: by 2002:aed:3fad:: with SMTP id s42mr20026506qth.335.1557127562156; 
 Mon, 06 May 2019 00:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <1556114601-30936-1-git-send-email-fabien.dessenne@st.com>
 <1556114601-30936-3-git-send-email-fabien.dessenne@st.com>
 <03f53dcc-816f-c017-f420-5eacc1fa486d@st.com>
In-Reply-To: <03f53dcc-816f-c017-f420-5eacc1fa486d@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 6 May 2019 09:25:51 +0200
Message-ID: <CA+M3ks6bGqux=D+8PgEn9ovGBEbUzkWSshB81Zy1OTG+U4Ww-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/stm: ltdc: return appropriate error code during
 probe
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WNzn2D4LRFx0zq3ZMJPIJy2EHlJS0W/qRQO2E0djUbU=;
 b=BNjPq9C+fBd/dv+/34M6FL3Z2Pm8FqkPX6Z0HermdNoQMhO2azmmLW0MQfnj03p0b7
 G6hf2mwmU8G01N1ZkBrVVnNTG3r/otxtMeOTBFZyxhj9vjvZCeYarFlh3Z+YyBY0s7Q/
 n5Ij8Ly4cHNdL1GIhiFJUJEIk2EyVcRbn5+YyKfmsJgOjDdssNnRASzFPFZlWcaJ1nZL
 6qsOPoYcGCuqWRDZU55zWXSw6lOexvFw8+spMo1mmr7iFZQvKXYQdHz2IovIeSjmrZGM
 B4ttVnpCIIV/hKVyr9iZSiQvZCjroyPAYOk7dvqikc9cLkahrr/tOydJFEwW4Kjn48A2
 qiAQ==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAyNiBhdnIuIDIwMTkgw6AgMTQ6MzAsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEhpIEZhYmllbiwKPiBhbmQgdGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDQvMjQvMTkgNDowMyBQTSwgRmFiaWVu
IERlc3Nlbm5lIHdyb3RlOgo+ID4gRHVyaW5nIHByb2JlLCByZXR1cm4gdGhlICJjbGtfZ2V0IiBl
cnJvciB2YWx1ZSBpbnN0ZWFkIG9mIC1FTk9ERVYuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
aWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAc3QuY29tPgoKQXBwbGllZCBvbiBkcm0tbWlz
Yy1uZXh0LgpUaGFua3MsCkJlbmphbWluCgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jIHwgNSArKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBpbmRleCA1MjFiYTgzLi45
NzkxMmUyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBAQCAtMTE0NSw4ICsxMTQ1LDkgQEAg
aW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiA+Cj4gPiAgICAgICBsZGV2
LT5waXhlbF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibGNkIik7Cj4gPiAgICAgICBpZiAoSVNf
RVJSKGxkZXYtPnBpeGVsX2NsaykpIHsKPiA+IC0gICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFi
bGUgdG8gZ2V0IGxjZCBjbG9ja1xuIik7Cj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU5PREVW
Owo+ID4gKyAgICAgICAgICAgICBpZiAoUFRSX0VSUihsZGV2LT5waXhlbF9jbGspICE9IC1FUFJP
QkVfREVGRVIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUgdG8g
Z2V0IGxjZCBjbG9ja1xuIik7Cj4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGxkZXYt
PnBpeGVsX2Nsayk7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgaWYgKGNsa19wcmVwYXJlX2Vu
YWJsZShsZGV2LT5waXhlbF9jbGspKSB7Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
