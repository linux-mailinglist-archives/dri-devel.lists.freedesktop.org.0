Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639F28CBB8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3350E6E10B;
	Tue, 13 Oct 2020 10:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F206E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 1FA8DFB05;
 Tue, 13 Oct 2020 12:32:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVnsScNImAzv; Tue, 13 Oct 2020 12:32:50 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8CEE6402EC; Tue, 13 Oct 2020 12:32:48 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/panel: mantix: Don't dereference NULL mode
Date: Tue, 13 Oct 2020 12:32:46 +0200
Message-Id: <659158549f3c6cc1c71ceed0943e760e861c1206.1602584953.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602584953.git.agx@sigxcpu.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3QgZGVyZWZlcmVuY2UgbW9kZSB3aGljaCB3YXMganVzdCBOVUxMIGNoZWNrZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpSZXBvcnRlZC1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYwppbmRleCAzNDgyZTI4ZTMwZmMuLjRh
N2ZiZjY0YmI3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRp
eC1tbGFmMDU3d2U1MS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgt
bWxhZjA1N3dlNTEuYwpAQCAtMjA0LDcgKzIwNCw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X2dldF9t
b2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAlpZiAoIW1vZGUpIHsKIAkJZGV2X2Vycihj
dHgtPmRldiwgIkZhaWxlZCB0byBhZGQgbW9kZSAldXgldUAldVxuIiwKIAkJCWRlZmF1bHRfbW9k
ZS5oZGlzcGxheSwgZGVmYXVsdF9tb2RlLnZkaXNwbGF5LAotCQkJZHJtX21vZGVfdnJlZnJlc2go
bW9kZSkpOworCQkJZHJtX21vZGVfdnJlZnJlc2goJmRlZmF1bHRfbW9kZSkpOwogCQlyZXR1cm4g
LUVOT01FTTsKIAl9CiAKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
