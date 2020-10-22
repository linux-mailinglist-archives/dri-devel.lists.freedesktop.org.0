Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE935296A3C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9226E4B0;
	Fri, 23 Oct 2020 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B26A6F5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 16:49:06 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n6so2329902ioc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kojjrYIgLi9atE3HNeKW+cJYZwBv9lJxNp3JGQTWaRE=;
 b=K5mKBqv7cFoRmE22R/SIBPXgp7gvRB4sBDus74dJx6EmpRVudHOEVDoogQnspJqgXK
 H1+0glvjt/unvvGqucop/d2nz3n2nfx33WbtnVA4BnPNI3dcL6JkqJ0qQt6UpV8EKYPJ
 rWS6KSPUHGtGC3xjgm5Cw4sKACUyGO902TBx2Y/N6g9Y56VbPw0jbMXl344rCGF9OZig
 Hv/Dp4/6U4Cdajs5wMQNivLMVRiVubZij2UhC7tylU1qo6fpuSee2/6nhkK7heeaHm59
 7Xp9pYjYEPMby7cdkhG6LVymKnqxEu/fvw0AQke7RKF7pfK1vx8NMgnB0ynKi+oPPaE3
 wI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kojjrYIgLi9atE3HNeKW+cJYZwBv9lJxNp3JGQTWaRE=;
 b=thF9O4eOtF6yiAmpCR6+hJgvgAfJnfxU5WflbmW/uF5SUh/MBYzvALpj/F30NY60gm
 D10u8OjV/tFH/OdLJcxtlEYwX3GFcwK6ytfjXj0d4d5X36z+p/CCN96LYQ6Q9FwV/PiR
 qQl87DNMa03Um42Law7BdXlb/GH1bvXBecTHfHGI3OvTkcGwfPOQdjgv4f44vEze/S3C
 chri04m0JYjnagKPG7jSMRIsBZujcOMdYrWn7dm8GDDId5Yc13NTvIUK5QyYhzGBZLEJ
 ub1k6UJnxgRzBazM3irw1NlWaaP2XcfEYEJ2HmtWwa2pM9E3dkRK+4qNgQfrIpRE6aWJ
 IsEA==
X-Gm-Message-State: AOAM532PeQkdbn1sVMYYtq3lzeWbEEH7X3fnrGtV/ustaGizETc103lJ
 dB0glnyed7VTMTGOq/GREfo84ZIXl6xvW5E7uY7xjw==
X-Google-Smtp-Source: ABdhPJzzXab4wojjo0aZU7//8U9GW/iQAWpNHIt2AGa+iJXMyyAIuiUtYo/vxW5cBuLPfvukrTY8jeMKX0DFbYpGYeg=
X-Received: by 2002:a5e:c112:: with SMTP id v18mr2520610iol.195.1603385345691; 
 Thu, 22 Oct 2020 09:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-5-fparent@baylibre.com>
 <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
In-Reply-To: <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Thu, 22 Oct 2020 18:48:54 +0200
Message-ID: <CAOwMV_yybF9j6GZpHfz3WjAHSQhQo=Ot+2frSkN6dpODe3nwCQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/mediatek: dsi: add pdata variable to start clk in
 HS mode
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDIxLCAyMDIwIGF0IDc6MDcgUE0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZhYmllbjoKPgo+
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjHm
l6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPiA+Cj4gPiBPbiBNVDgxNjcsIERTSSBzZWVt
cyB0byB3b3JrIGZpbmUgb25seSBpZiB3ZSBzdGFydCB0aGUgY2xrIGluIEhTIG1vZGUuCj4gPiBJ
ZiB3ZSBkb24ndCBzdGFydCB0aGUgY2xrIGluIEhTIGJ1dCB0cnkgdG8gc3dpdGNoIGxhdGVyIHRv
IEhTLCB0aGUKPiA+IGRpc3BsYXkgZG9lcyBub3Qgd29yay4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBh
ZGRzIGEgcGxhdGZvcm0gZGF0YSB2YXJpYWJsZSB0byBiZSB1c2VkIHRvIHN0YXJ0IHRoZQo+ID4g
RFNJIGNsayBpbiBIUyBtb2RlIGF0IHBvd2VyIG9uLgo+Cj4gVGhpcyBwYXRjaCBsb29rcyBsaWtl
IGEgaGFjayBwYXRjaC4gSWYgeW91IGNvd29yayB3aXRoIE1lZGlhdGVrLAo+IHBsZWFzZSBmaW5k
IG91dCB0aGUgY29ycmVjdCBzb2x1dGlvbiBvciBnaXZlIGEgcmVhc29uYWJsZSBleHBsYW5hdGlv
bi4KPiBJZiB5b3UgY291bGQgbm90IGdldCBoZWxwIGZyb20gTWVkaWF0ZWssIEkgd291bGQgd2Fp
dCBmb3IgY29tbWVudCBvbgo+IHRoaXMgcGF0Y2guCgpJdCBzZWVtcyB0aGF0IHRoaXMgd29ya2Fy
b3VuZCBpcyBiZWNhdXNlIG9mIGEgc3BlY2lmaWMgZGlzcGxheSBhbmQgbm90CmJlY2F1c2Ugb2Yg
YSBzcGVjaWZpYyBpc3N1ZSBvZiB0aGUgTVQ4MTY3IERTSSBJUC4gSSB3aWxsIGRyb3AgdGhpcwpw
YXRjaCBpbiB2Mi4KCj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jCj4gPiBpbmRleCA0YTE4OGE5NDJjMzguLjQ2MTY0M2MwNTY4OSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+IEBAIC0xNzUsNiArMTc1LDcg
QEAgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewo+ID4gICAgICAgICBjb25zdCB1MzIgcmVn
X2NtZHFfb2ZmOwo+ID4gICAgICAgICBib29sIGhhc19zaGFkb3dfY3RsOwo+ID4gICAgICAgICBi
b29sIGhhc19zaXplX2N0bDsKPiA+ICsgICAgICAgYm9vbCB1c2VfaHNfb25fcG93ZXJfb247Cj4g
PiAgfTsKPiA+Cj4gPiAgc3RydWN0IG10a19kc2kgewo+ID4gQEAgLTY3MSw3ICs2NzIsNyBAQCBz
dGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ID4KPiA+ICAg
ICAgICAgbXRrX2RzaV9jbGtfdWxwX21vZGVfbGVhdmUoZHNpKTsKPiA+ICAgICAgICAgbXRrX2Rz
aV9sYW5lMF91bHBfbW9kZV9sZWF2ZShkc2kpOwo+ID4gLSAgICAgICBtdGtfZHNpX2Nsa19oc19t
b2RlKGRzaSwgMCk7Cj4gPiArICAgICAgIG10a19kc2lfY2xrX2hzX21vZGUoZHNpLCAhIWRzaS0+
ZHJpdmVyX2RhdGEtPnVzZV9oc19vbl9wb3dlcl9vbik7Cj4gPgo+ID4gICAgICAgICByZXR1cm4g
MDsKPiA+ICBlcnJfZGlzYWJsZV9lbmdpbmVfY2xrOgo+ID4gLS0KPiA+IDIuMjguMAo+ID4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
