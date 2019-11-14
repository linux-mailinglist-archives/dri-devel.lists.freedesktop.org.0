Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00BFC2CA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 10:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FDA6E153;
	Thu, 14 Nov 2019 09:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBD46E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 09:40:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e6Vt025264;
 Thu, 14 Nov 2019 03:40:06 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e6Ns123500;
 Thu, 14 Nov 2019 03:40:06 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:40:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:40:04 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjq085959;
 Thu, 14 Nov 2019 03:40:02 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive edge
Date: Thu, 14 Nov 2019 11:39:50 +0200
Message-ID: <20191114093950.4101-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114093950.4101-1-tomi.valkeinen@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573724406;
 bh=6LTnMb6e3K2BsU0Oe3+xvKa3TV0PwdvlajoGCs2MpqU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZJGUOmsrFH7KP0vRFaPawIbdpwPkW30RqaiaDif9zf6xu5FvgCZt6uY04+pmiofzv
 /9jnD1wXaQUapSMwz9L5bOysSGmP7NCoxcOtq+ObL3Fdr8GhPVsADjUpSHOHEBcfsy
 n7+Ah5/MkrxeA3U3FmLKEt/ApbcFjRja683S1mgQ=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsIGRhdGFzaGVldCBzYXlzIHRoYXQgdGhlIHBhbmVsIHNhbXBsZXMgYXQgZmFsbGlu
ZyBlZGdlLCBidXQKZG9lcyBub3Qgc2F5IGFueXRoaW5nIGFib3V0IGgvdiBzeW5jIHNpZ25hbHMu
IFRlc3Rpbmcgc2hvd3MgdGhhdCBpZiB0aGUKc3luYyBzaWduYWxzIGFyZSBkcml2ZW4gb24gZmFs
bGluZyBlZGdlLCB0aGUgcGljdHVyZSBvbiB0aGUgcGFuZWwgd2lsbApiZSBzbGlnaHRseSBzaGlm
dGVkIHJpZ2h0LgoKU2V0dGluZyBzeW5jIGRyaXZlIGVkZ2UgdG8gdGhlIHNhbWUgYXMgZGF0YSBk
cml2ZSBlZGdlIGZpeGVzIHRoaXMgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmluZGV4IDVkNDg3Njg2
ZDI1Yy4uMDc4NDUzNmFlNmFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBA
IC0yMzk3LDcgKzIzOTcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgb3NkZGlz
cGxheXNfb3NkMDcwdDE3MThfMTl0cyA9IHsKIAkJLmhlaWdodCA9IDkxLAogCX0sCiAJLmJ1c19m
b3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAotCS5idXNfZmxhZ3MgPSBEUk1fQlVT
X0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX1BPU0VER0UsCisJLmJ1
c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJ
VkVfUE9TRURHRSB8CisJCURSTV9CVVNfRkxBR19TWU5DX0RSSVZFX1BPU0VER0UsCiAJLmNvbm5l
Y3Rvcl90eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0RQSSwKIH07CiAKLS0gClRleGFzIEluc3Ry
dW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1
bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5r
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
