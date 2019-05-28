Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DA2C019
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 09:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63DB89BCD;
	Tue, 28 May 2019 07:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD9189BCD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 07:30:40 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i125so18900521qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 00:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=liX278HTgn3dzodp7H0O3yv5Xch4o5IxEkhO3Idcuvw=;
 b=cs+Xd62a1B+6ByTjj14Sru+bk4WHBbp/oiQ4TUkoOaLdj1G4n4X6atO6rBU0FHiOvi
 YSDqQSDw3NwgodT4YAqHdGGLF5ml83/CKU/O47eDJ3kMNHzrFPbhavFlrXTzlbQnSi99
 UT/F2BxblaC+iZQs6W35LmlWeK/q232BlqiredN1xBZsxNZ3JGE2myfrFpZ0B3ASOe9Z
 ziwzYGnjaz2CBXhBeaODAjV9kLPrApYxSpCbpFkYqPniYsI++ptWnyVgqoY1diK7B6d6
 6rQRxpzA30reiWV00zvyXwXJkCGHmedWwDDlad8DAIpCfcTywxAlsbiitH8kFgYOG9Df
 0lOw==
X-Gm-Message-State: APjAAAXptTT63zqLpIgsdin7zniwwCp9WzH5P/6kgelHktmNQ6klMI3M
 CNGWuB3a5VlCGO11K/za9UJmVD4zxzYw5agYTZ96ZW+r
X-Google-Smtp-Source: APXvYqw/o9g3j0+8QuWo1gdBVqYhqsgNj/cyEh5sq/3CNJ6H80Oh+b9UbNvS2HHUMZy5yppiywgVa8gezanxUHTOGjg=
X-Received: by 2002:a37:502:: with SMTP id 2mr3621845qkf.93.1559028639303;
 Tue, 28 May 2019 00:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190527115830.15836-1-benjamin.gaignard@st.com>
 <1e4c4cbf-869e-8b6a-a1d6-cc7dccb2515a@st.com>
In-Reply-To: <1e4c4cbf-869e-8b6a-a1d6-cc7dccb2515a@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 28 May 2019 09:30:28 +0200
Message-ID: <CA+M3ks5UxZ0iugtR_zJPshtC=HAjoAzTPmu6oxt7BQWTuj203Q@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: restore calls to clk_{enable/disable}
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=liX278HTgn3dzodp7H0O3yv5Xch4o5IxEkhO3Idcuvw=;
 b=Xof57xMef9rhMVvwdzWqgl8c8PWB/Qq5WaAyj1db7xil+fDCj2i2m2YnoW8pKwTFyW
 2fV5WVtAWhMVaj64Iuj3Xg8EqCSIHF9C1lbxhu3ktohEZLkh788n0+WGOtLwsRx5rSSB
 idqXNx8jf21nLRjVkPZziJlecnNAnwLPmW96STeBbUTLipuKTqsP7RhQL0Ob3lS65mkx
 UfHomb1WgXBlgs+mcjx1y7MMHVGLMi62Y+rgLWH1eZYzKN7d8r65fCXeTVeX7ZVuzXCK
 RD9+LjBiqfsMx6BBjE4DmFkIMgoU4pUkbXkfAC55Nl4lss1Qn+wXSgeO8/o6OXFjcjzP
 qjew==
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
Cc: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuLiAyNyBtYWkgMjAxOSDDoCAxNDoyOCwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkgQmVuamFtaW4sCj4KPiBNYW55IHRoYW5rcyBm
b3IgdGhpcyBmaXggKGFuZCBtb3JlIGdlbmVyYWxseSBmb3IgcHVzaGluZyBTVE0gcGF0Y2hlcyBv
bgo+IG1pc2MgOi0pCj4KPiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dCwKc29ycnkgZm9yIHRoZSBtaXN0YWtl
LgoKQmVuamFtaW4KPgo+IFBoaWxpcHBlIDotKQo+Cj4gT24gNS8yNy8xOSAxOjU4IFBNLCBCZW5q
YW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IEZyb206IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1p
bi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+ID4KPiA+IFJlc3RvcmUgY2FsbHMgdG8gY2xrX3tlbmFi
bGUvZGlzYWJsZX0gZGVsZXRlZCBhZnRlciBhcHBseWluZyB0aGUgd3JvbmcKPiA+IHZlcnNpb24g
b2YgdGhlIHBhdGNoCj4gPgo+ID4gRml4ZXM6IGZkNjkwNWZjYTRmMCAoImRybS9zdG06IGx0ZGM6
IHJlbW92ZSBjbGtfcm91bmRfcmF0ZSBjb21tZW50IikKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KPiA+IC0tLQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDIgKysKPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBpbmRleCBhZTJhYWYy
YTYyZWUuLmFjMjk4OTBlZGViNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gQEAgLTUwNywx
MCArNTA3LDEyIEBAIHN0YXRpYyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKPiA+ICAgICAgIHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9f
bHRkYyhjcnRjKTsKPiA+ICAgICAgIGludCByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ID4K
PiA+ICsgICAgIGNsa19kaXNhYmxlKGxkZXYtPnBpeGVsX2Nsayk7Cj4gPiAgICAgICBpZiAoY2xr
X3NldF9yYXRlKGxkZXYtPnBpeGVsX2NsaywgcmF0ZSkgPCAwKSB7Cj4gPiAgICAgICAgICAgICAg
IERSTV9FUlJPUigiQ2Fubm90IHNldCByYXRlICglZEh6KSBmb3IgcGl4ZWwgY2xrXG4iLCByYXRl
KTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gICAgICAgfQo+ID4gKyAgICAg
Y2xrX2VuYWJsZShsZGV2LT5waXhlbF9jbGspOwo+ID4KPiA+ICAgICAgIGFkanVzdGVkX21vZGUt
PmNsb2NrID0gY2xrX2dldF9yYXRlKGxkZXYtPnBpeGVsX2NsaykgLyAxMDAwOwo+ID4KPiA+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
