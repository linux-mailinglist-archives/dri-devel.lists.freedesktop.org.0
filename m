Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FEAEE9C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 17:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9C6E90F;
	Tue, 10 Sep 2019 15:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D836E912
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 15:36:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 79EF73AE9ED
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 15:34:48 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A030240002;
 Tue, 10 Sep 2019 15:34:23 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm: LogiCVC display controller support
Date: Tue, 10 Sep 2019 17:34:07 +0200
Message-Id: <20190910153409.111901-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciB0aGUgTG9naUNWQyBkaXNwbGF5IGNv
bnRyb2xsZXIuClRoZSBjb250cm9sbGVyIGlzIGEgYml0IHVudXN1YWwgc2luY2UgaXQgaXMgdXN1
YWxseSBsb2FkZWQgYXMKcHJvZ3JhbW1hYmxlIGxvZ2ljIG9uIFhpbGlueCBGUEdBcyBvciBaeW5x
LTcwMDAgU29Dcy4KTW9yZSBkZXRhaWxzIGFyZSBwcmVzZW50ZWQgb24gdGhlIG1haW4gY29tbWl0
IGZvciB0aGUgZHJpdmVyLgoKTW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgY29udHJvbGxlciBp
cyBhdmFpbGFibGUgb24gdGhlIGRlZGljYXRlZAp3ZWIgcGFnZTogaHR0cHM6Ly93d3cubG9naWNi
cmlja3MuY29tL1Byb2R1Y3RzL2xvZ2lDVkMtTUwuYXNweAoKQ2hlZXJzIQoKUGF1bCBLb2NpYWxr
b3dza2kgKDIpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgeHlsb24gbG9naWN2YyBiaW5k
aW5ncyBkb2N1bWVudGF0aW9uCiAgZHJtOiBBZGQgc3VwcG9ydCBmb3IgdGhlIExvZ2lDVkMgZGlz
cGxheSBjb250cm9sbGVyCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkveHlsb24sbG9naWN2Yy50eHQg
ICAgICAgIHwgMTg4ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9LY29uZmlnICAgICAgICAg
ICAgICAgfCAgIDggKwogZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvTWFrZWZpbGUgICAgICAgICAg
ICAgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2ljdmNfY3J0Yy5jICAgICAg
ICB8IDI3MiArKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19jcnRjLmgg
ICAgICAgIHwgIDI1ICsKIGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2ljdmNfZHJtLmMgICAg
ICAgICB8IDQ1NyArKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2
Y19kcm0uaCAgICAgICAgIHwgIDYwICsrCiBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9sb2dpY3Zj
X2ludGVyZmFjZS5jICAgfCAyMzUgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9n
aWN2Y19pbnRlcmZhY2UuaCAgIHwgIDMyICsKIGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2lj
dmNfbGF5ZXIuYyAgICAgICB8IDU5NCArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS9sb2dpY3ZjL2xvZ2ljdmNfbGF5ZXIuaCAgICAgICB8ICA2NSArKwogZHJpdmVycy9ncHUvZHJt
L2xvZ2ljdmMvbG9naWN2Y19tb2RlLmMgICAgICAgIHwgMTAzICsrKwogZHJpdmVycy9ncHUvZHJt
L2xvZ2ljdmMvbG9naWN2Y19tb2RlLmggICAgICAgIHwgIDE1ICsKIGRyaXZlcnMvZ3B1L2RybS9s
b2dpY3ZjL2xvZ2ljdmNfb2YuYyAgICAgICAgICB8IDIwNCArKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS9sb2dpY3ZjL2xvZ2ljdmNfb2YuaCAgICAgICAgICB8ICAyOCArCiBkcml2ZXJzL2dwdS9kcm0v
bG9naWN2Yy9sb2dpY3ZjX3JlZ3MuaCAgICAgICAgfCAgODggKysrCiAxOCBmaWxlcyBjaGFuZ2Vk
LCAyMzgxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS94eWxvbixsb2dpY3ZjLnR4dAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2ljdmNfY3J0Yy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19jcnRjLmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9sb2dpY3ZjX2RybS5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19kcm0uaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2ljdmNfaW50ZXJmYWNlLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9sb2dpY3ZjX2ludGVyZmFjZS5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19sYXllci5j
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19sYXll
ci5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19t
b2RlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9sb2dpY3Zj
X21vZGUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2lj
dmNfb2YuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2lj
dmNfb2YuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2lj
dmNfcmVncy5oCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
