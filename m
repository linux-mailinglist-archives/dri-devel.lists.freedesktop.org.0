Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD41761BB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DBA6ECC2;
	Fri, 26 Jul 2019 09:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E926ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 60CBBFB06;
 Fri, 26 Jul 2019 11:21:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFe4Rvb0O9iZ; Fri, 26 Jul 2019 11:21:43 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2988E46A9E; Fri, 26 Jul 2019 11:21:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/panel: jh057n00900: Move dsi init sequence to prepare
Date: Fri, 26 Jul 2019 11:21:40 +0200
Message-Id: <cover.1564132646.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIHBhbmVsIGlzIHdyYXBwZWQgaW4gYSBwYW5lbF9icmlkZ2UgaXQgZ2V0cyBwcmVwYXIo
KWVkIGJlZm9yZSB0aGUKdXBzdHJlYW0gRFNJIGJyaWRnZSB3aGljaCBjYW4gY2F1c2UgaGFuZ3Mg
KGUuZy4gd2l0aCBpbXgtbndsIHNpbmNlIGNsb2NrcwphcmUgbm90IGVuYWJsZWQgeWV0KS4gVG8g
YXZvaWQgdGhpcyBtb3ZlIHRoZSBwYW5lbCdzIGZpcnN0IERTSSBhY2Nlc3MgdG8KZW5hYmxlKCkg
c28gdGhlIHVwc3RyZWFtIGJyaWRnZSBjYW4gcHJlcGFyZSB0aGUgRFNJIGhvc3QgY29udHJvbGxl
ciBpbgppdCdzIHByZV9lbmFibGUoKS4KClRoZSBzZWNvbmQgcGF0Y2ggbWFrZXMgdGhlIGRpc2Fi
bGUoKSBjYWxsIHN5bW1ldHJpYyB0byB0aGUgYWJvdmUgYW5kIHRoZSB0aGlyZApvbmUganVzdCBl
YXNlcyBkZWJ1Z2dpbmcuCgpHdWlkbyBHw7xudGhlciAoMyk6CiAgZHJtL3BhbmVsOiBqaDA1N24w
MDkwMDogTW92ZSBwYW5lbCBEU0kgaW5pdCB0byBlbmFibGUoKQogIGRybS9wYW5lbDogamgwNTdu
MDA5MDA6IE1vdmUgbWlwaV9kc2lfZGNzX3NldF9kaXNwbGF5X29mZiB0byBkaXNhYmxlKCkKICBk
cm0vcGFuZWw6IGpoMDU3bjAwOTAwOiBQcmludCBlcnJvciBjb2RlIG9uIGFsbCBEUk1fREVWX0VS
Uk9SKClzCgogLi4uL2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jICAgIHwg
MzEgKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
