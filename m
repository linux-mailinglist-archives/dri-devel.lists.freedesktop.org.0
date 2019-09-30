Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A8C1D79
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 10:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589788161;
	Mon, 30 Sep 2019 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AF988161
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:55:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U8t5dT053713;
 Mon, 30 Sep 2019 03:55:05 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8U8t54s079884
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 03:55:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 03:54:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 03:54:55 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8t2tF012944;
 Mon, 30 Sep 2019 03:55:03 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: am4372: Set memory bandwidth limit for DISPC
Date: Mon, 30 Sep 2019 11:54:50 +0300
Message-ID: <20190930085450.15874-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569833705;
 bh=rf3p0mpknyXNKqDFr2VJXMEUyHQI3pZIFENgUY5jlAE=;
 h=From:To:CC:Subject:Date;
 b=NkkPiC0o4fC2jUMZn6VmpV+P8GX4hHTtt/mKPPGFslszY6B2nqQYfdGOmYryvKTLo
 /ZnoluhuhXP+kk/n6hy5s2OeBKnF9GsL7CX8guPsHlHbSztOq6Y0G4X5QjBnpZZMnc
 UBfLHm5K4PX/HOopNTwvR2FCkZgm7251cXkhOn2E=
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KClNldCBtZW1vcnkg
YmFuZHdpZHRoIGxpbWl0IHRvIGZpbHRlciBvdXQgcmVzb2x1dGlvbnMgYWJvdmUgNzIwcEA2MEh6
IHRvCmF2b2lkIHVuZGVyZmxvdyBlcnJvcnMgZHVlIHRvIHRoZSBiYW5kd2lkdGggbmVlZHMgb2Yg
aGlnaGVyIHJlc29sdXRpb25zLgoKYW00M3h4IGNhbiBub3QgcHJvdmlkZSBlbm91Z2ggYmFuZHdp
ZHRoIHRvIERJU1BDIHRvIGNvcnJlY3RseSBoYW5kbGUKJ2hpZ2gnIHJlc29sdXRpb25zLgoKU2ln
bmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KU2lnbmVk
LW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9hbTQzNzIuZHRzaSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTQzNzIuZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2FtNDM3Mi5kdHNpCmluZGV4IDg0OGUyYTg4ODRlMi4uMTRiYmM0Mzgw
NTVmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTQzNzIuZHRzaQorKysgYi9hcmNo
L2FybS9ib290L2R0cy9hbTQzNzIuZHRzaQpAQCAtMzM3LDYgKzMzNyw4IEBACiAJCQkJdGksaHdt
b2RzID0gImRzc19kaXNwYyI7CiAJCQkJY2xvY2tzID0gPCZkaXNwX2Nsaz47CiAJCQkJY2xvY2st
bmFtZXMgPSAiZmNrIjsKKworCQkJCW1heC1tZW1vcnktYmFuZHdpZHRoID0gPDIzMDAwMDAwMD47
CiAJCQl9OwogCiAJCQlyZmJpOiByZmJpQDQ4MzJhODAwIHsKLS0gClRleGFzIEluc3RydW1lbnRz
IEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9C
dXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
