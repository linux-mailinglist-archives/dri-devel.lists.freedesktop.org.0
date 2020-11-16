Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810AF2B4A92
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 17:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02AC89DE3;
	Mon, 16 Nov 2020 16:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB45689DE3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 16:18:34 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8474622314
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605543514;
 bh=FsCTuWY5dgbEYPYoLX82oXYdTcQy1FIVElAFfZct3k8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oe7/tt18Twv01APSGnqs8SWS1fDCBKIyWzn/U+44CK8947Civ2f4SrphT6VetEj5t
 kWjqEP48VMSNpsDrmPODrOa9csiO8j5dFT8YHh/rSsWAQZG/2hHORMS7O7uYD7I5X3
 gKq7a/V3Gs/4tndGlHB2qoY3O+C7aBH6vPHH2h1c=
Received: by mail-ed1-f51.google.com with SMTP id v22so19295537edt.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 08:18:34 -0800 (PST)
X-Gm-Message-State: AOAM530kJM6fLU2j6H0C73ijfce5bKbEcAEeN3A6WApJABUgGGanZ8Er
 /2+MSfoDHEkGX38bJVB2fuJB5uNdDQB16EASUA==
X-Google-Smtp-Source: ABdhPJy5UEMa514VORYkzr40o5c6+5CuGbj0ZX3gVbzHQCZd656Uw9TY6XR+KuAhCyCycCnwR0Dvv0cwt3EvXFa5jUM=
X-Received: by 2002:aa7:dbca:: with SMTP id v10mr16591877edt.219.1605543513111; 
 Mon, 16 Nov 2020 08:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
 <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
In-Reply-To: <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 00:18:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY__XjQZYnaO4_xioZnQZmUWrt5SDxJPkiLdXW1Q6DjBJnw@mail.gmail.com>
Message-ID: <CAAOTY__XjQZYnaO4_xioZnQZmUWrt5SDxJPkiLdXW1Q6DjBJnw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Decouple Mediatek DRM sub driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgx
NuaXpSDpgLHkuIAg5LiK5Y2INzozM+Wvq+mBk++8mgo+Cj4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgz5pelIOmAseS6jCDkuIrljYg4OjM0
5a+r6YGT77yaCj4gPgo+ID4gbXRrIGNjb3JyIGlzIGNvbnRyb2xsZWQgYnkgRFJNIGFuZCBNRFAg
WzFdLiBJbiBvcmRlciB0byBzaGFyZQo+ID4gbXRrX2Njb3JyIGRyaXZlciBmb3IgRFJNIGFuZCBN
RFAsIGRlY291cGxlIE1lZGlhdGVrIERSTSBzdWIgZHJpdmVyCj4gPiB3aGljaCBpbmNsdWRlIG10
a19jY29yciwgc28gTURQIGNvdWxkIHVzZSB0aGlzIGRlY291cGxlZCBtdGtfY2NvcnIuCj4KPiBB
cHBsaWVkIHRoZSB3aG9sZSBzZXJpZXMgaW50byBtZWRpYXRlay1kcm0tbmV4dCBbMV0uCj4KPiBb
MV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1
YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKPgoKU29ycnksIGJlY2F1
c2Ugb2YgaW9tbXUgbGFyYiBwcm9ibGVtLCBJIGRyb3AgdGhpcyBzZXJpZXMgZnJvbSBtZWRpYXRl
ay1kcm0tbmV4dC4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFu
Zy4KPgo+ID4KPiA+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTQw
NzUxLwo+ID4KPiA+IENLIEh1ICg5KToKPiA+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIGNsayBpbmZv
IGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIgZHJpdmVyCj4gPiAgICAgcHJpdmF0ZSBk
YXRhCj4gPiAgIGRybS9tZWRpYXRlazogTW92ZSByZWdzIGluZm8gZnJvbSBzdHJ1Y3QgbXRrX2Rk
cF9jb21wIHRvIHN1YiBkcml2ZXIKPiA+ICAgICBwcml2YXRlIGRhdGEKPiA+ICAgZHJtL21lZGlh
dGVrOiBSZW1vdmUgaXJxIGluIHN0cnVjdCBtdGtfZGRwX2NvbXAKPiA+ICAgZHJtL21lZGlhdGVr
OiBVc2Ugc3RydWN0IGNtZHFfY2xpZW50X3JlZyB0byBnYXRoZXIgY21kcSB2YXJpYWJsZQo+ID4g
ICBkcm0vbWVkaWF0ZWs6IE1vdmUgY21kcV9yZWcgaW5mbyBmcm9tIHN0cnVjdCBtdGtfZGRwX2Nv
bXAgdG8gc3ViCj4gPiAgICAgZHJpdmVyIHByaXZhdGUgZGF0YQo+ID4gICBkcm0vbWVkaWF0ZWs6
IENoYW5nZSBzdWIgZHJpdmVyIGludGVyZmFjZSBmcm9tIG10a19kZHBfY29tcCB0byBkZXZpY2UK
PiA+ICAgZHJtL21lZGlhdGVrOiBSZWdpc3RlciB2YmxhbmsgY2FsbGJhY2sgZnVuY3Rpb24KPiA+
ICAgZHJtL21lZGlhdGVrOiBEUk0gZHJpdmVyIGRpcmVjdGx5IHJlZmVyIHRvIHN1YiBkcml2ZXIn
cyBmdW5jdGlvbgo+ID4gICBkcm0vbWVkaWF0ZWs6IE1vdmUgbXRrX2RkcF9jb21wX2luaXQoKSBm
cm9tIHN1YiBkcml2ZXIgdG8gRFJNIGRyaXZlcgo+ID4KPiA+IENodW4tS3VhbmcgSHUgKDIpOgo+
ID4gICBkcm0vbWVkaWF0ZWs6IEdldCBDTURRIGNsaWVudCByZWdpc3RlciBmb3IgYWxsIGRkcCBj
b21wb25lbnQKPiA+ICAgZHJtL21lZGlhdGVrOiBVc2UgY29ycmVjdCBkZXZpY2UgcG9pbnRlciB0
byBnZXQgQ01EUSBjbGllbnQgcmVnaXN0ZXIKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2NvbG9yLmMgICB8ICA4NiArKy0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgNjkgKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAgfCAyMTUgKysrKysrLS0tLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jICAgIHwgMTY5ICsrKysrLS0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAgICAgICAgfCAgNDQgKy0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICB8ICA3NSAr
Ky0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAg
MSAtCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDM4
OSArKysrKysrKysrKystLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmggfCAxMDAgKystLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyAgICAgIHwgIDMwICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmggICAgICB8ICAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMgICAgICAgICAgfCAgNDcgKy0tCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgNjU4
IGluc2VydGlvbnMoKyksIDU2OSBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oCj4gPgo+ID4gLS0KPiA+IDIu
MTcuMQo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
