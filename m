Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCF199867
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 17:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7446E508;
	Thu, 22 Aug 2019 15:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170886E508
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 15:45:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE32528BBBB;
 Thu, 22 Aug 2019 16:45:53 +0100 (BST)
Date: Thu, 22 Aug 2019 17:45:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 10/50] drm/bridge: simple-bridge: Add support for the
 TI OP362
Message-ID: <20190822174551.30a57243@collabora.com>
In-Reply-To: <20190820011721.30136-11-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-11-laurent.pinchart@ideasonboard.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0MSArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBUaGUgVEkgT1AzNjIgaXMg
YW4gYW5hbG9nIHZpZGVvIGFtcGxpZmllciBjb250cm9sbGVkIHRocm91Z2ggYSBHUElPLiBBZGQK
PiBzdXBwb3J0IGZvciBpdCB0byB0aGUgc2ltcGxlLWJyaWRnZSBkcml2ZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoK
UmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYyB8IDUg
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCj4gaW5kZXggM2U1MDMxODMzMzY4Li41MjYyNmUyZGU5
MGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYwo+IEBAIC0zMDIs
NiArMzAyLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNpbXBsZV9icmlk
Z2VfbWF0Y2hbXSA9IHsKPiAgCQkJLnRpbWluZ3MgPSAmZGVmYXVsdF9icmlkZ2VfdGltaW5ncywK
PiAgCQkJLmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX1ZHQSwKPiAgCQl9LAo+
ICsJfSwgewo+ICsJCS5jb21wYXRpYmxlID0gInRpLG9wYTM2MiIsCj4gKwkJLmRhdGEgPSAmKGNv
bnN0IHN0cnVjdCBzaW1wbGVfYnJpZGdlX2luZm8pIHsKPiArCQkJLmNvbm5lY3Rvcl90eXBlID0g
RFJNX01PREVfQ09OTkVDVE9SX0NvbXBvc2l0ZSwKPiArCQl9LAo+ICAJfSwgewo+ICAJCS5jb21w
YXRpYmxlID0gInRpLHRoczgxMzUiLAo+ICAJCS5kYXRhID0gJihjb25zdCBzdHJ1Y3Qgc2ltcGxl
X2JyaWRnZV9pbmZvKSB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
