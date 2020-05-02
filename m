Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03781C2220
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 03:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A749C6ED7B;
	Sat,  2 May 2020 01:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73A56ED78
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 01:23:50 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D14C21924
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 01:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588382630;
 bh=fKedIT7NCjjtN+WZ+I/uAQkL+Kk76kfwMU8EfUxLit0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2AU2x8aC7YuhK/uBVFA1aIW4u4+DqhdT73DwkckBsRhs4FWqZbRugm2hrOLAMUdCJ
 kO/F4ugCLOvHIxCX40P2aYXsKiMLlJZYCbtwZQeOPbcq3Ovk3ukFe9Dz1AWr+vt/x1
 b/NNHg2IinE81Fc9sU4ud1VdAEY0uDluxBYy62bw=
Received: by mail-ed1-f52.google.com with SMTP id g16so8647631eds.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 18:23:50 -0700 (PDT)
X-Gm-Message-State: AGi0Puawa+Lx1CcMOG/CNhi4YI/7qOg1bTavgFoMDD4t7MZyJBJluYf7
 p2BZyf7AdI+IlVgiMacWnoR2j6287FUUWmL10g==
X-Google-Smtp-Source: APiQypKfu4S78pn6Hni94rL6h97guVNLRCNyuj3ph+4DeSmaCsksPyugFgEcYB5B3sAmS1GpdvZ7InYPlctsgiiekeE=
X-Received: by 2002:a05:6402:1f6:: with SMTP id
 i22mr6043564edy.271.1588382628798; 
 Fri, 01 May 2020 18:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200501152335.1805790-1-enric.balletbo@collabora.com>
 <20200501152335.1805790-4-enric.balletbo@collabora.com>
In-Reply-To: <20200501152335.1805790-4-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 2 May 2020 09:23:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY__grEXBPJjYveiEDFZ4-XjGr=sBpciK4zhFXfd=4OBZNA@mail.gmail.com>
Message-ID: <CAAOTY__grEXBPJjYveiEDFZ4-XjGr=sBpciK4zhFXfd=4OBZNA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/mediatek: mtk_dsi: Rename bridge to next_bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyIMeaXpSDpgLHkupQg5LiL5Y2IMTE6MjPlr6vpgZPvvJoK
Pgo+IFRoaXMgaXMgcmVhbGx5IGEgY29zbWV0aWMgY2hhbmdlIGp1c3QgdG8gbWFrZSBhIGJpdCBt
b3JlIHJlYWRhYmxlIHRoZQo+IGNvZGUgYWZ0ZXIgY29udmVydCB0aGUgZHJpdmVyIHRvIGRybV9i
cmlkZ2UuIFRoZSBicmlkZ2UgdmFyaWFibGUgbmFtZQo+IHdpbGwgYmUgdXNlZCBieSB0aGUgZW5j
b2RlciBkcm1fYnJpZGdlLCBhbmQgdGhlIGNoYWluZWQgYnJpZGdlIHdpbGwgYmUKPiBuYW1lZCBu
ZXh0X2JyaWRnZS4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJp
Yy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQWNrZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjQ6IE5vbmUKPiBD
aGFuZ2VzIGluIHYzOgo+IC0gUmVwbGFjZSBzL2JyaWRnZS9uZXh0IGJyaWRnZS8gZm9yIGNvbW1l
bnQuIChMYXVyZW50IFBpbmNoYXJ0KQo+Cj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMSArKysrKystLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggY2ZhNDVkNmFiZDc0Li4zN2I4ZDdmZmQ4MzUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtMTgyLDcgKzE4Miw3IEBAIHN0cnVj
dCBtdGtfZHNpIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOwo+ICAgICAg
ICAgc3RydWN0IGRybV9jb25uZWN0b3IgY29ubjsKPiAgICAgICAgIHN0cnVjdCBkcm1fcGFuZWwg
KnBhbmVsOwo+IC0gICAgICAgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKPiArICAgICAgIHN0
cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsKPiAgICAgICAgIHN0cnVjdCBwaHkgKnBoeTsK
Pgo+ICAgICAgICAgdm9pZCBfX2lvbWVtICpyZWdzOwo+IEBAIC05MDIsOSArOTAyLDEwIEBAIHN0
YXRpYyBpbnQgbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoc3RydWN0IGRybV9kZXZpY2UgKmRybSwg
c3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAqLwo+ICAgICAgICAgZHNpLT5lbmNvZGVy
LnBvc3NpYmxlX2NydGNzID0gMTsKPgo+IC0gICAgICAgLyogSWYgdGhlcmUncyBhIGJyaWRnZSwg
YXR0YWNoIHRvIGl0IGFuZCBsZXQgaXQgY3JlYXRlIHRoZSBjb25uZWN0b3IgKi8KPiAtICAgICAg
IGlmIChkc2ktPmJyaWRnZSkgewo+IC0gICAgICAgICAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0
dGFjaCgmZHNpLT5lbmNvZGVyLCBkc2ktPmJyaWRnZSwgTlVMTCwgMCk7Cj4gKyAgICAgICAvKiBJ
ZiB0aGVyZSdzIGEgbmV4dCBicmlkZ2UsIGF0dGFjaCB0byBpdCBhbmQgbGV0IGl0IGNyZWF0ZSB0
aGUgY29ubmVjdG9yICovCj4gKyAgICAgICBpZiAoZHNpLT5uZXh0X2JyaWRnZSkgewo+ICsgICAg
ICAgICAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHNpLT5lbmNvZGVyLCBkc2ktPm5l
eHRfYnJpZGdlLCBOVUxMLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAwKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIGF0dGFjaCBicmlkZ2UgdG8gZHJtXG4iKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9lbmNvZGVyX2NsZWFudXA7Cj4gQEAgLTExODUs
NyArMTE4Niw3IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBkcm1fb2ZfZmluZF9wYW5l
bF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAwLCAwLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZkc2ktPnBhbmVsLCAmZHNpLT5icmlkZ2UpOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkc2ktPnBhbmVsLCAmZHNpLT5uZXh0
X2JyaWRnZSk7Cj4gICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl91
bnJlZ2lzdGVyX2hvc3Q7Cj4KPiAtLQo+IDIuMjYuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
