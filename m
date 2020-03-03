Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA4177685
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 14:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5F6E873;
	Tue,  3 Mar 2020 13:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4E36E873
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 13:00:24 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id a6so2669336ilc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 05:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fvv36JtV0N+z4/Iq9D+rJSdRicCHvzzKK/vPdAcKdqA=;
 b=koM3o2+p7S+IlhpuyIM1fRgSXD6k7orDYIauBWFrUU5DRb2ucLiPvqpp0asbTHx40z
 N1s9JYvVWqlJJa63wVfajKbwjAOCDSs5gb9CsYRGAIsxaEglK9c7TaqcwEHw5ZQAM5Wa
 LEdULlpYjKUh9JqDSHM7p/Os/pcZeWM7IdjelvuUzZ1G0k3GZpK9f9XC7JQZvG2s6mOX
 0KNPvkn3REJ4tWx7KeT0jshcIzD0mV0CuRb2nIqafz5c8R+HTFSCheaByq/1/qJdnw9S
 UX3g3NOPc7RzLnmLYLYy/m9bPnGtk/zJ8glxJxU7eHvg3vilQiqRIrq9fi9nuJbCVcnM
 OeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fvv36JtV0N+z4/Iq9D+rJSdRicCHvzzKK/vPdAcKdqA=;
 b=beX52l5nQyaFOwXc8nIUwbwQOlOW47UiQaI5imFFCYuUHoy8FXCgHzu1fKnNhkxVhC
 5QRDCSpMU3YutrjiRTXdFbiWJ8Y9PZU8ouda5yGmQMfFrESgHcL0W98AC9UUVcDXwT73
 vTYo2yyFdO2Z5oW/GXlZJFNTTWZWwSut7EMKZovazpnL8b2Wt93mwiz9SrXK1VUQiQET
 iSTIgm6UK8H7wp4B0S4w4xi2qp24Mzv67UtHX/6ffV1XzfjnFA/a9OuamnTLWwpRvU7h
 eoQ+R8o01Hzjdy6agD7Tjzd0Y+FGedwM+HfkSukdtwEqZO7y+P1UcZgrf5mVyVIi6xkM
 QnVA==
X-Gm-Message-State: ANhLgQ37VVZY3026g3taSgr5Snt0dsQMcBCYpr/+dCSkX7frJxN3PO7x
 xFQ4UmgBfX35jTMyIJfDB+v/obusqbzc3LJzN6tNbA==
X-Google-Smtp-Source: ADFU+vvxEdLKCuVTtsMd4tUHT+sFuYcrIGInO7yM+p0NboaaskS++vRfzNaZfSuHmeJDISm/QFghj9XYngjFTTulN3c=
X-Received: by 2002:a92:d090:: with SMTP id h16mr4893943ilh.78.1583240423680; 
 Tue, 03 Mar 2020 05:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-22-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-22-ville.syrjala@linux.intel.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 3 Mar 2020 07:00:12 -0600
Message-ID: <CAHCN7xKN1DgprgF_CFHquambpYEs8ZTTL+3sTzKoCiQ_02_Txw@mail.gmail.com>
Subject: Re: [PATCH 21/33] drm/panel-simple: Fix dotclock for Logic PD Type 28
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMiwgMjAyMCBhdCAyOjM2IFBNIFZpbGxlIFN5cmphbGEKPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBUaGUgY3VycmVudGx5IGxpc3RlZCBkb3Rj
bG9jayBkaXNhZ3JlZXMgd2l0aCB0aGUgY3VycmVudGx5Cj4gbGlzdGVkIHZyZWZyZXNoIHJhdGUu
IENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZyZWZyZXNoLgo+Cj4gU29tZW9uZSB0
ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9jayBvciB2cmVyZXNoIGlzCj4g
Y29ycmVjdD8KPgo+IENjOiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiBDYzogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jCj4gaW5kZXggMjI1YmU0NzU3YTg1Li4zYTQ2YjgyNzIyZjUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTIyNzcsNyArMjI3Nyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRzdWJpc2hpX2FhMDcwbWMwMV9tb2RlID0gewo+
ICB9Owo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBsb2dpY3BkX3R5
cGVfMjhfbW9kZSA9IHsKPiAtICAgICAgIC5jbG9jayA9IDkwMDAsCj4gKyAgICAgICAuY2xvY2sg
PSA5MTA3LAoKVGhpcyBzaG91bGQgYmUgT0suICBUaGUgbWF4IGRvdGNsayBmcmVxdWVuY3kgb2Yg
dGhpcyBwYW5lbCBpcyAxMk1IeiwKc28gOS4xMDdNSHogc2hvdWxkIGJlIGp1c3QgZmluZS4KClJl
dmlld2VkLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KCmFkYW0KPiAgICAgICAg
IC5oZGlzcGxheSA9IDQ4MCwKPiAgICAgICAgIC5oc3luY19zdGFydCA9IDQ4MCArIDMsCj4gICAg
ICAgICAuaHN5bmNfZW5kID0gNDgwICsgMyArIDQyLAo+IC0tCj4gMi4yNC4xCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
