Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C9C973C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 06:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DE56E102;
	Thu,  3 Oct 2019 04:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997F96E102
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 04:24:07 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id c25so2350838iot.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 21:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXxgss0qRr38ViNhIsY4E48BXxGon0iuPdHcJHwqwhc=;
 b=BJn8HsVEQR0lGsWOb93scabVI6OP7CkSSp2655PV+2YsL2eEZ+zxlFje0/4P0fbMZH
 FenDSFC+MUegPtWgIL5EQfCPvLV7T33RtBiiGsevr0eGpHBp1GKK2lWM1M21Emspjql+
 eP5/oj6HCsjo1fR80MhSS+qH22ikgiep1HPUB4+qsRVWoR6qDxq6mppFi/5bscdfnCMl
 dsP5NB2/SxSqgH9/4yYOC4lcQdtY6DyGVMqFfz389fHy8MdqPyiwBWO20+SR+HKlkGBF
 E6lfIelni8GsKaUt8LoKMyLg5zFhoebRvvZiyFeKyQCFUgY7gJDgg3ktR1Rd6IfrliPJ
 go0w==
X-Gm-Message-State: APjAAAWKDwwA5mGP6a2AxzX4p2OSyo2bW7376jBp6tww5bt46siXRLxY
 YwsAwv7urALd6S1h5DdNudcwaWzpkTd7HF7N3S1llA==
X-Google-Smtp-Source: APXvYqz7lFdMeYaFOqQuDlV2bgB6TK9bjpGTgkqgd8HQd647X9V9/RgwVucyGUxqcrmBjl6fatT+jMGOcVJrQTxylyU=
X-Received: by 2002:a02:6284:: with SMTP id d126mr7511832jac.51.1570076645543; 
 Wed, 02 Oct 2019 21:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-4-icenowy@aosc.io>
In-Reply-To: <20191001080253.6135-4-icenowy@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 09:53:54 +0530
Message-ID: <CAMty3ZDW4XHyW+6XL_RSVHqTSk79-r749pa0n5e6VbUzowAsiw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 3/3] Revert "drm/sun4i: dsi: Rework a bit
 the hblk calculation"
To: Icenowy Zheng <icenowy@aosc.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xXxgss0qRr38ViNhIsY4E48BXxGon0iuPdHcJHwqwhc=;
 b=SjYfr4ci/wu2v5HJdhvG5VWQ0L+nAwZxsH1u0w5kKILfPjaBnSDE0XQZ0s4eJoryIW
 As8fGKd6gSiZcy6eQNhCL56xGXObLVRxQ0ZedLXEOMrpa3zxChhoO6OGH2dnWZOBl6u3
 mQx5xJ9LM+t6NZp1NyL2uHQ16yh56mtV4nZYw=
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgV2VucywKCk9uIFR1ZSwgT2N0IDEsIDIwMTkgYXQgMTozNCBQTSBJY2Vub3d5IFpoZW5nIDxp
Y2Vub3d5QGFvc2MuaW8+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2MmU3NTExYTRm
NGRjZjA3Zjc1Mzg5M2QzNDI0ZGVjZDk0NjZjOThiLgo+Cj4gVGhpcyBjb21taXQsIGFsdGhvdWdo
IGNsYWltZWQgYXMgYSByZWZhY3RvciwgaW4gZmFjdCBjaGFuZ2VkIHRoZQo+IGZvcm11bGEuCj4K
PiBCeSBleHBhbmRpbmcgdGhlIG9yaWdpbmFsIGZvcm11bGEsIHdlIGNhbiBmaW5kIHRoYXQgdGhl
IGNvbnN0IDEwIGlzIG5vdAo+IHN1YnN0cmFjdGVkLCBpbnN0ZWFkIGl0J3MgYWRkZWQgdG8gdGhl
IHZhbHVlIChiZWNhdXNlIDEwIGlzIG5lZ2F0aXZlCj4gd2hlbiBjYWxjdWxhdGluZyBoc2EsIGFu
ZCBoc2EgaXRzZWxmIGlzIG5lZ2F0aXZlIHdoZW4gY2FsY3VsYXRpbmcgaGJsaykuCj4gVGhpcyBi
cmVha3MgdGhlIHNpbWlsYXIgcGF0dGVybiB0byBvdGhlciBmb3JtdWxhcywgc28gcmVzdG9yaW5n
IHRoZQo+IG9yaWdpbmFsIGZvcm11bGEgaXMgbW9yZSBwcm9wZXIuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW42aV9taXBpX2RzaS5jIHwgOSArKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW42aV9taXBpX2RzaS5jCj4gaW5kZXggMmQzZTgyMmE3NzM5Li5jYjVmZDE5YzBkMGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+IEBAIC01NzcsMTQgKzU3Nyw5
IEBAIHN0YXRpYyB2b2lkIHN1bjZpX2RzaV9zZXR1cF90aW1pbmdzKHN0cnVjdCBzdW42aV9kc2kg
KmRzaSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIChtb2RlLT5oc3luY19zdGFydCAtIG1v
ZGUtPmhkaXNwbGF5KSAqIEJwcCAtIEhGUF9QQUNLRVRfT1ZFUkhFQUQpOwo+Cj4gICAgICAgICAg
ICAgICAgIC8qCj4gLSAgICAgICAgICAgICAgICAqIFRoZSBibGFua2luZyBpcyBzZXQgdXNpbmcg
YSBzeW5jIGV2ZW50ICg0IGJ5dGVzKQo+IC0gICAgICAgICAgICAgICAgKiBhbmQgYSBibGFua2lu
ZyBwYWNrZXQgKDQgYnl0ZXMgKyBwYXlsb2FkICsgMgo+IC0gICAgICAgICAgICAgICAgKiBieXRl
cykuIEl0cyBtaW5pbWFsIHNpemUgaXMgdGhlcmVmb3JlIDEwIGJ5dGVzLgo+ICsgICAgICAgICAg
ICAgICAgKiBoYmxrIHNlZW1zIHRvIGJlIHRoZSBsaW5lICsgcG9yY2hlcyBsZW5ndGguCj4gICAg
ICAgICAgICAgICAgICAqLwo+IC0jZGVmaW5lIEhCTEtfUEFDS0VUX09WRVJIRUFEICAgMTAKPiAt
ICAgICAgICAgICAgICAgaGJsayA9IG1heCgodW5zaWduZWQgaW50KUhCTEtfUEFDS0VUX09WRVJI
RUFELAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIChtb2RlLT5odG90YWwgLSAobW9kZS0+
aHN5bmNfZW5kIC0gbW9kZS0+aHN5bmNfc3RhcnQpKSAqIEJwcCAtCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgSEJMS19QQUNLRVRfT1ZFUkhFQUQpOwo+ICsgICAgICAgICAgICAgICBoYmxr
ID0gbW9kZS0+aHRvdGFsICogQnBwIC0gaHNhOwoKVGhlIG9yaWdpbmFsIGZvcm11bGEgaXMgY29y
cmVjdCBhY2NvcmRpbmcgdG8gQlNQIFsxXSBhbmQgd29yayB3aXRoIG15CnBhbmVscyB3aGljaCBJ
IGhhdmUgdGVzdGVkIGJlZm9yZS4gTWF5IGJlIHRoZSBob3Jpem9udGFsIHRpbWluZ3Mgb24KcGFu
ZWxzIHlvdSBoYXZlIGxlYWRzIHRvIG5lZ2F0aXZlIHZhbHVlLgoKWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9heXVmYW4tcGluZTY0L2xpbnV4LXBpbmU2NC9ibG9iL215LWhhY2tzLTEuMi13aXRoLWRy
bS9kcml2ZXJzL3ZpZGVvL3N1bnhpL2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxfc3VuNTBpdzEvZGVf
ZHNpLmMjTDkxOQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
