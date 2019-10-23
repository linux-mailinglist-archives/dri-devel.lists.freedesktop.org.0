Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D282E1FD2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0A6EB26;
	Wed, 23 Oct 2019 15:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374FA8959D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:35 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7181C28F90E;
 Wed, 23 Oct 2019 16:45:33 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 19/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Date: Wed, 23 Oct 2019 17:45:10 +0200
Message-Id: <20191023154512.9762-20-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IGVudHJ5IGZvciB0aGUgVG9zaGliYSBMVEEwODlBQzI5MDAwIHBhbmVsLgoKU2ln
bmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KLS0tCkNoYW5nZXMgaW4gdjM6CiogTm9uZQotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
CmluZGV4IDVkNDg3Njg2ZDI1Yy4uMjdjOTJiNDRiZDk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCkBAIC0yOTM3LDYgKzI5MzcsMzkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
YW5lbF9kZXNjIHRvc2hpYmFfbHQwODlhYzI5MDAwID0gewogCS5jb25uZWN0b3JfdHlwZSA9IERS
TV9NT0RFX0NPTk5FQ1RPUl9MVkRTLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIHRvc2hpYmFfbHRhMDg5YWMyOTAwMF9tb2RlID0geworCS5jbG9jayA9IDc5NTAw
LAorCS5oZGlzcGxheSA9IDEyODAsCisJLmhzeW5jX3N0YXJ0ID0gMTI4MCArIDE5MiwKKwkuaHN5
bmNfZW5kID0gMTI4MCArIDE5MiArIDEyOCwKKwkuaHRvdGFsID0gMTI4MCArIDE5MiArIDEyOCAr
IDY0LAorCS52ZGlzcGxheSA9IDc2OCwKKwkudnN5bmNfc3RhcnQgPSA3NjggKyAyMCwKKwkudnN5
bmNfZW5kID0gNzY4ICsgMjAgKyA3LAorCS52dG90YWwgPSA3NjggKyAyMCArIDcgKyAzLAorCS52
cmVmcmVzaCA9IDYwLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHRvc2hp
YmFfbHRhMDg5YWMyOTAwMCA9IHsKKwkubW9kZXMgPSAmdG9zaGliYV9sdGEwODlhYzI5MDAwX21v
ZGUsCisJLm51bV9tb2RlcyA9IDEsCisJLnNpemUgPSB7CisJCS53aWR0aCA9IDE5NCwKKwkJLmhl
aWdodCA9IDExNiwKKwl9LAorCS8qCisJICogRklYTUU6CisJICogVGhlIHBhbmVsIHN1cHBvcnRz
IDIgYnVzIGZvcm1hdHM6IGplaWRhLTI0IGFuZCBqZWlkYS0xOC4gVGhlCisJICogbW9kZSBpcyBz
ZWxlY3RlZCB0aHJvdWdoIHRoZSA4YjZiX1NFTCBwaW4uIElmIGFueW9uZSBldmVyIG5lZWRzCisJ
ICogc3VwcG9ydCBmb3IgamVpZGEtMTggd2Ugc2hvdWxkIHByb2JhYmx5IHBhcnNlIHRoZSAnZGF0
YS1tYXBwaW5nJworCSAqIHByb3BlcnR5LgorCSAqIEluIHRoZSB1bmxpa2VseSBldmVudCB3aGVy
ZSA4YjZiX1NFTCBpcyBjb25uZWN0ZWQgdG8gYSBHUElPLCB3ZSdkCisJICogbmVlZCBhIG5ldyBp
bmZyYSB0byBhbGxvdyBidXMgZm9ybWF0IG5lZ290aWF0aW9uIGF0IHRoZSBwYW5lbCBsZXZlbC4K
KwkgKi8KKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYN1g0X0pFSURBLAor
CS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRB
X0RSSVZFX1BPU0VER0UsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgdHBrX2YwN2FfMDEwMl9tb2RlID0gewogCS5jbG9jayA9IDMzMjYwLAogCS5oZGlzcGxheSA9
IDgwMCwKQEAgLTMzOTIsNiArMzQyNSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJ0b3No
aWJhLGx0MDg5YWMyOTAwMCIsCiAJCS5kYXRhID0gJnRvc2hpYmFfbHQwODlhYzI5MDAwLAorCX0s
IHsKKwkJLmNvbXBhdGlibGUgPSAidG9zaGliYSxsdGEwODlhYzI5MDAwIiwKKwkJLmRhdGEgPSAm
dG9zaGliYV9sdGEwODlhYzI5MDAwLAogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAidHBrLGYwN2Et
MDEwMiIsCiAJCS5kYXRhID0gJnRwa19mMDdhXzAxMDIsCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
