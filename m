Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092289D2B5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351B36E252;
	Mon, 26 Aug 2019 15:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA2D6E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4603528BC38;
 Mon, 26 Aug 2019 16:27:08 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Date: Mon, 26 Aug 2019 17:26:48 +0200
Message-Id: <20190826152649.13820-21-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826152649.13820-1-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IGVudHJ5IGZvciB0aGUgVG9zaGliYSBMVEEwODlBQzI5MDAwIHBhbmVsLgoKU2ln
bmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC90b3NoaWJhLGx0MDg5YWMyOTAwMC50eHQgICAgfCAg
NSArKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDM2
ICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3Rvc2hpYmEsbHQwODlhYzI5MDAwLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Rvc2hpYmEsbHQwODlhYzI5MDAw
LnR4dAppbmRleCA4OTgyNjExNjYyOGMuLjI2ZWJmYTA5ODk2NiAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG9zaGliYSxsdDA4OWFj
MjkwMDAudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3Rvc2hpYmEsbHQwODlhYzI5MDAwLnR4dApAQCAtMSw3ICsxLDEwIEBACiBUb3NoaWJh
IDguOSIgV1hHQSAoMTI4MHg3NjgpIFRGVCBMQ0QgcGFuZWwKIAogUmVxdWlyZWQgcHJvcGVydGll
czoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJ0b3NoaWJhLGx0MDg5YWMyOTAwMCIKKy0gY29t
cGF0aWJsZTogc2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nCisJICAgICAgInRvc2hpYmEs
bHQwODlhYzI5MDAwIgorCSAgICAgICJ0b3NoaWJhLGx0YTA4OWFjMjkwMDAiCisKIC0gcG93ZXIt
c3VwcGx5OiBhcyBzcGVjaWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZwogCiBUaGlzIGJpbmRpbmcg
aXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3Bl
Y2lmaWVkCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggMjhmYTZiYTdiNzY3
Li4wNjAxNTcwNDA0YjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
aW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTI5
MTUsNiArMjkxNSwzOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgdG9zaGliYV9s
dDA4OWFjMjkwMDAgPSB7CiAJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJN
X0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSB0b3NoaWJhX2x0YTA4OWFjMjkwMDBfbW9kZSA9IHsKKwkuY2xv
Y2sgPSA3OTUwMCwKKwkuaGRpc3BsYXkgPSAxMjgwLAorCS5oc3luY19zdGFydCA9IDEyODAgKyAx
OTIsCisJLmhzeW5jX2VuZCA9IDEyODAgKyAxOTIgKyAxMjgsCisJLmh0b3RhbCA9IDEyODAgKyAx
OTIgKyAxMjggKyA2NCwKKwkudmRpc3BsYXkgPSA3NjgsCisJLnZzeW5jX3N0YXJ0ID0gNzY4ICsg
MjAsCisJLnZzeW5jX2VuZCA9IDc2OCArIDIwICsgNywKKwkudnRvdGFsID0gNzY4ICsgMjAgKyA3
ICsgMywKKwkudnJlZnJlc2ggPSA2MCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxf
ZGVzYyB0b3NoaWJhX2x0YTA4OWFjMjkwMDAgPSB7CisJLm1vZGVzID0gJnRvc2hpYmFfbHRhMDg5
YWMyOTAwMF9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS5zaXplID0geworCQkud2lkdGggPSAx
OTQsCisJCS5oZWlnaHQgPSAxMTYsCisJfSwKKwkvKgorCSAqIEZJWE1FOgorCSAqIFRoZSBwYW5l
bCBzdXBwb3J0cyAyIGJ1cyBmb3JtYXRzOiBqZWlkYS0yNCBhbmQgamVpZGEtMTguIFRoZQorCSAq
IG1vZGUgaXMgc2VsZWN0ZWQgdGhyb3VnaCB0aGUgOGI2Yl9TRUwgcGluLiBJZiBhbnlvbmUgZXZl
ciBuZWVkcworCSAqIHN1cHBvcnQgZm9yIGplaWRhLTE4IHdlIHNob3VsZCBwcm9iYWJseSBwYXJz
ZSB0aGUgJ2RhdGEtbWFwcGluZycKKwkgKiBwcm9wZXJ0eS4KKwkgKiBJbiB0aGUgdW5saWtlbHkg
ZXZlbnQgd2hlcmUgOGI2Yl9TRUwgaXMgY29ubmVjdGVkIHRvIGEgR1BJTywgd2UnZAorCSAqIG5l
ZWQgYSBuZXcgaW5mcmEgdG8gYWxsb3cgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiBhdCB0aGUgcGFu
ZWwgbGV2ZWwuCisJICovCisJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdY
NF9KRUlEQSwKKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZM
QUdfUElYREFUQV9EUklWRV9QT1NFREdFLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIHRwa19mMDdhXzAxMDJfbW9kZSA9IHsKIAkuY2xvY2sgPSAzMzI2MCwKIAku
aGRpc3BsYXkgPSA4MDAsCkBAIC0zMzY5LDYgKzM0MDIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGli
bGUgPSAidG9zaGliYSxsdDA4OWFjMjkwMDAiLAogCQkuZGF0YSA9ICZ0b3NoaWJhX2x0MDg5YWMy
OTAwMCwKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gInRvc2hpYmEsbHRhMDg5YWMyOTAwMCIsCisJ
CS5kYXRhID0gJnRvc2hpYmFfbHRhMDg5YWMyOTAwMCwKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0g
InRwayxmMDdhLTAxMDIiLAogCQkuZGF0YSA9ICZ0cGtfZjA3YV8wMTAyLAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
