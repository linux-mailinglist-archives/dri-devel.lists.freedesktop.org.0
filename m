Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B828ED6F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CCA6EC27;
	Thu, 15 Oct 2020 07:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135916EAAF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 16:25:45 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id p9so5986738ilr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OpuOO6D91mmbQ9GlyYetQ2VYN7QKr3fAvLutvyHptN8=;
 b=UUDfcWPeTFYlJ87g3Xdwe6UiHA7mT7G/O8FYr4Mc9M6lMK/a5ajiX/ceXjuaRFaeWW
 oKAZbcoRnTj9E967DtOFDjRHFKqXvj9PN2Gya73tJmCVpsH2115gYwyVMjGTstL4I7ge
 N863IIblMkRjkOmw+nhxXc04O7CIYjb6qc0JbAz09chwqE8RPXkfGplwwVpX5FPSHfw6
 FBn7MxrJynSIGa/qflQt/wO3fC8eJ0Fi2BuRiwbfj6JCu+5cPGFzgU7BjhwDx6A5XAMH
 5rjhbv8bVFp/leQXrVxjvTVrUC2FeEfmoKSvrXr+XevHWb9amteIaJ7Tydi9fv9v2q1D
 75tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OpuOO6D91mmbQ9GlyYetQ2VYN7QKr3fAvLutvyHptN8=;
 b=FzUvlwl+W1281IbJv8XhQrSB0tZulvZDdwL/btL2StdBZ1L2UhKepeuD58pkHDu+5W
 bntzbpKUMJ/OOij/HkcxfpjJSflY/9SMjJIfMBtMklzau/5vdRVOf2I3UZHTDnPBlY/9
 RBeDCHuWm8Oaks5dQOGwtYiPxoh9yrcQGWWkXsZrWetef8LaxWwCT8imDMR1ztEUyFyE
 I91RhtUuTCFiBuwkNrrJ+0tiaGJY8U8sj4xzLAAlo/AZtmOfe1bSZ3uW54XjNs1hvw7N
 JsbsK58wFncRDzFFO0Ew7/vmXfu/wf2yD5e2fCxvlHsrOt1F7elkwDjeb1qbqwJTFMCi
 A+ug==
X-Gm-Message-State: AOAM533i4sdh7adaaxvwRreckcltNBI6e3JdFMtQZDsOClPkoiXdU8Os
 vlKrqtTmwso7RDCnnDP7tq5JKFS5DtrlBVA2itz3Pg==
X-Google-Smtp-Source: ABdhPJy6XKdNrS2/9EHHkdStb2c3MKpSkize9amrN9N/B/qwi8cb5F2DQO0H/tJN+2k3hZ85+ZkqCjit7PQ7KBcZ4qE=
X-Received: by 2002:a92:8404:: with SMTP id l4mr4828056ild.134.1602692744338; 
 Wed, 14 Oct 2020 09:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
 <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
In-Reply-To: <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 14 Oct 2020 18:25:33 +0200
Message-ID: <CAOwMV_wskn9RiWsX44xL8CFTX-3coS9+bXaJxK8y4eBBOr0z_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDM6MDAgUE0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZhYmllbjoKPgo+
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMTTm
l6Ug6YCx5LiJIOS4iuWNiDI6MTnlr6vpgZPvvJoKPiA+Cj4gPiBBZGQgc3VwcG9ydCBmb3IgSERN
SSBvbiBNVDgxNjcuIEhETUkgb24gTVQ4MTY3IGlzIHNpbWlsYXIgdG8KPiA+IE1UODE3My9NVDI3
MDEgZXhlY3B0IGZvciB0aGUgdHdvIHJlZ2lzdGVyczogU1lTX0NGRzFDIGFuZCBTWVNfQ0ZHMjAK
Pgo+IEkgdGhpbmsgeW91IHNob3VsZCBkcm9wIHRoaXMgc2VyaWVzLiBBY2NvcmRpbmcgdG8gTWVk
aWF0ZWsgSERNSQo+IGJpbmRpbmcgZG9jdW1lbnQgWzFdLCB0aGUgc2Vjb25kIHBhcmFtZXRlciBv
ZiBtZWRpYXRlayxzeXNjb24taGRtaSBpcwo+IHRoZSByZWdpc3RlciBvZmZzZXQuIEkgdGhpbmsg
eW91IGNvdWxkIHNldCByZWdpc3RlciBvZmZzZXQgdG8gMHg4MDAKPiBmb3IgbXQ4MTY3LgpPaywg
dGhhbmsgeW91LiBJIHdpbGwgdHJ5IGl0LgoKPgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxoZG1p
LnR4dD9oPXY1LjkKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+ID4gLS0tCj4gPgo+
ID4gQ2hhbmdlbG9nOgo+ID4gdjI6IGZpeCBuYW1lIG9mIHBkYXRhIHN0cnVjdHVyZQo+ID4KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgIHwgNyArKysrKysrCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaCB8IDIgKysKPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaS5jCj4gPiBpbmRleCA1NzM3MGMwMzY0OTcuLjQ4NGVhOWNkNjU0YSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gQEAgLTE4MzUsOSArMTgzNSwx
NiBAQCBzdGF0aWMgc3RydWN0IG10a19oZG1pX2RhdGEgbXQ4MTczX2hkbWlfZHJpdmVyX2RhdGEg
PSB7Cj4gPiAgICAgICAgIC5zeXNfY2ZnMjAgPSBIRE1JX1NZU19DRkcyMCwKPiA+ICB9Owo+ID4K
PiA+ICtzdGF0aWMgc3RydWN0IG10a19oZG1pX2RhdGEgbXQ4MTY3X2hkbWlfZHJpdmVyX2RhdGEg
PSB7Cj4gPiArICAgICAgIC5zeXNfY2ZnMWMgPSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMsCj4gPiAr
ICAgICAgIC5zeXNfY2ZnMjAgPSBNVDgxNjdfSERNSV9TWVNfQ0ZHMjAsCj4gPiArfTsKPiA+ICsK
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX2hkbWlfb2ZfaWRz
W10gPSB7Cj4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWhkbWki
LAo+ID4gICAgICAgICAgIC5kYXRhID0gJm10ODE3M19oZG1pX2RyaXZlcl9kYXRhIH0sCj4gPiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWhkbWkiLAo+ID4gKyAgICAg
ICAgIC5kYXRhID0gJm10ODE2N19oZG1pX2RyaXZlcl9kYXRhIH0sCj4gPiAgICAgICAgIHt9Cj4g
PiAgfTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgKPiA+
IGluZGV4IDIwNTBiYTQ1YjIzYS4uYTBmOWMzNjdkN2FhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaAo+ID4gQEAgLTE5NSw2ICsxOTUsNyBAQAo+ID4g
ICNkZWZpbmUgR0VOX1JHQiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDAgPDwgNykK
PiA+Cj4gPiAgI2RlZmluZSBIRE1JX1NZU19DRkcxQyAgICAgICAgIDB4MDAwCj4gPiArI2RlZmlu
ZSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMgIDB4ODAwCj4gPiAgI2RlZmluZSBIRE1JX09OICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiA+ICAjZGVmaW5lIEhETUlfUlNUICAg
ICAgICAgICAgICAgICAgICAgICBCSVQoMSkKPiA+ICAjZGVmaW5lIEFOTEdfT04gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+ID4gQEAgLTIxMSw2ICsyMTIsNyBAQAo+ID4g
ICNkZWZpbmUgSFRQTEdfUElOX1NFTF9PRkYgICAgICAgICAgICAgIEJJVCgzMCkKPiA+ICAjZGVm
aW5lIEFFU19FRlVTRV9FTkFCTEUgICAgICAgICAgICAgICBCSVQoMzEpCj4gPiAgI2RlZmluZSBI
RE1JX1NZU19DRkcyMCAgICAgICAgIDB4MDA0Cj4gPiArI2RlZmluZSBNVDgxNjdfSERNSV9TWVNf
Q0ZHMjAgIDB4ODA0Cj4gPiAgI2RlZmluZSBERUVQX0NPTE9SX01PREVfTUFTSyAgICAgICAgICAg
KDMgPDwgMSkKPiA+ICAjZGVmaW5lIENPTE9SXzhCSVRfTU9ERSAgICAgICAgICAgICAgICAgICAg
ICAgICgwIDw8IDEpCj4gPiAgI2RlZmluZSBDT0xPUl8xMEJJVF9NT0RFICAgICAgICAgICAgICAg
KDEgPDwgMSkKPiA+IC0tCj4gPiAyLjI4LjAKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
