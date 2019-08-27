Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862319E39C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07999897E3;
	Tue, 27 Aug 2019 09:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801B5897E3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:05:09 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2BC7F28BB6F;
 Tue, 27 Aug 2019 10:05:08 +0100 (BST)
Date: Tue, 27 Aug 2019 11:05:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 4/8] drm/meson: dw-hdmi: stop enforcing
 input_bus_format
Message-ID: <20190827110505.0130697d@collabora.com>
In-Reply-To: <20190827081425.15011-5-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
 <20190827081425.15011-5-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNyBBdWcgMjAxOSAxMDoxNDoyMSArMDIwMApOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBUbyBhbGxvdyB1c2luZyBmb3JtYXRzIGZyb20g
bmVnb2NpYXRpb24sIHN0b3AgZW5mb3JjaW5nIGlucHV0X2J1c19mb3JtYXQKCgkJCSAgICAgIF4g
bmVnb3RpYXRpb24KCj4gaW4gdGhlIHByaXZhdGUgZHctcGxhdC1kYXRhIHN0cnVjdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpS
ZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kd19oZG1pLmMKPiBpbmRleCAzMzM1ODNlZjNhYjkuLjlhZTI0Y2M1ZmFhMiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+IEBAIC0xMDA3LDcgKzEwMDcsNiBA
QCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2UgKm1hc3RlciwKPiAgCWR3X3BsYXRfZGF0YS0+cGh5X29wcyA9ICZtZXNvbl9kd19o
ZG1pX3BoeV9vcHM7Cj4gIAlkd19wbGF0X2RhdGEtPnBoeV9uYW1lID0gIm1lc29uX2R3X2hkbWlf
cGh5IjsKPiAgCWR3X3BsYXRfZGF0YS0+cGh5X2RhdGEgPSBtZXNvbl9kd19oZG1pOwo+IC0JZHdf
cGxhdF9kYXRhLT5pbnB1dF9idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9ZVVY4XzFYMjQ7Cj4g
IAlkd19wbGF0X2RhdGEtPmlucHV0X2J1c19lbmNvZGluZyA9IFY0TDJfWUNCQ1JfRU5DXzcwOTsK
PiAgCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBtZXNvbl9kd19oZG1pKTsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
