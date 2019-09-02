Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF799A56BB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B7F8907B;
	Mon,  2 Sep 2019 12:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC978907B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:54:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x82CseRS021109;
 Mon, 2 Sep 2019 07:54:41 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x82Csefc000693
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Sep 2019 07:54:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 2 Sep
 2019 07:54:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 2 Sep 2019 07:54:40 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x82CsYYK126767;
 Mon, 2 Sep 2019 07:54:38 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/7] drm/omap: tweak HDMI DDC timings
Date: Mon, 2 Sep 2019 15:53:54 +0300
Message-ID: <20190902125359.18001-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190902125359.18001-1-tomi.valkeinen@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567428881;
 bh=mYX3M9lARZ7RahIZ6yhHUt6HTWrhvGOs4KiLMgz+DEY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PhDzanepuBPuaApuXUUyKKrUSTvXqdWhPNOkFwIG7ghF0IsKLaOS9NZs5XZKrFmi5
 bdc00H1bmEf/BVOz8HwqgB2dyrkyQwo91SuHsZS4CChioYJa9pQDVRaaBEOZO+Dnp2
 388WD6tsWlK4EUgMR4mcM2B6xGeOo3SKM+VGhT6E=
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
Cc: Alejandro Hernandez <ajhernandez@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxlamFuZHJvIEhlcm5hbmRleiA8YWpoZXJuYW5kZXpAdGkuY29tPgoKQSAiSERNSSBJ
MkMgTWFzdGVyIEVycm9yIiBpcyBzb21ldGltZXMgcmVwb3J0ZWQgd2l0aCB0aGUgY3VycmVudCBE
REMgU0NMCnRpbWluZ3MuIFRoZSBjdXJyZW50IHNldHRpbmdzIGZvciBhIDEwdXMgU0NMIHBlcmlv
ZCAoMTAwIEtIeikgY2F1c2VzIHRoZQplcnJvciB3aXRoIHNvbWUgZGlzcGxheXMuICBUaGlzIHBh
dGNoIGluY3JlYXNlcyB0aGUgU0NMIHNpZ25hbCBwZXJpb2QKZnJvbSAxMHVzIHRvIDEwLjJ1cywg
d2l0aCB0aGUgbmV3IHNldHRpbmdzIHRoZSBlcnJvciBpcyBub3Qgb2JzZXJ2ZWQKClNpZ25lZC1v
ZmYtYnk6IEFsZWphbmRybyBIZXJuYW5kZXogPGFqaGVybmFuZGV6QHRpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvaGRtaTVfY29yZS5jCmluZGV4IDc0MDBmYjk5ZDQ1My4uNGM1ODhlYzc2MzRhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMKQEAgLTM5LDggKzM5LDggQEAg
c3RhdGljIHZvaWQgaGRtaV9jb3JlX2RkY19pbml0KHN0cnVjdCBoZG1pX2NvcmVfZGF0YSAqY29y
ZSkKIHsKIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBjb3JlLT5iYXNlOwogCWNvbnN0IHVuc2lnbmVk
IGxvbmcgbG9uZyBpY2xrID0gMjY2MDAwMDAwOwkvKiBEU1MgTDMgSUNMSyAqLwotCWNvbnN0IHVu
c2lnbmVkIGludCBzc19zY2xfaGlnaCA9IDQ2MDA7CQkvKiBucyAqLwotCWNvbnN0IHVuc2lnbmVk
IGludCBzc19zY2xfbG93ID0gNTQwMDsJCS8qIG5zICovCisJY29uc3QgdW5zaWduZWQgaW50IHNz
X3NjbF9oaWdoID0gNDcwMDsJCS8qIG5zICovCisJY29uc3QgdW5zaWduZWQgaW50IHNzX3NjbF9s
b3cgPSA1NTAwOwkJLyogbnMgKi8KIAljb25zdCB1bnNpZ25lZCBpbnQgZnNfc2NsX2hpZ2ggPSA2
MDA7CQkvKiBucyAqLwogCWNvbnN0IHVuc2lnbmVkIGludCBmc19zY2xfbG93ID0gMTMwMDsJCS8q
IG5zICovCiAJY29uc3QgdW5zaWduZWQgaW50IHNkYV9ob2xkID0gMTAwMDsJCS8qIG5zICovCi0t
IApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBI
ZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21p
Y2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
