Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D712D9E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609C589F01;
	Fri,  3 May 2019 12:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8299089F01
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVCwa095230;
 Fri, 3 May 2019 07:31:12 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVC3h121951
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:10 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtv002029;
 Fri, 3 May 2019 07:31:08 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 13/23] drm/bridge: tc358767: remove unnecessary msleep
Date: Fri, 3 May 2019 15:29:39 +0300
Message-ID: <20190503122949.12266-14-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886672;
 bh=pDDzO/jPbrkRKCopvRcTDYyjV2PgCH6Qjag1F3IQaF0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZORd8Z36QGnlMUmq/iSUGOf5nYGhWwH11U7suDlwJngU222s7qZ9RNS1ry44kZTby
 GhUwpoao78M8cniHmm7ahSC77k09OT7NcMMBwotEPSYu3fVB5Bq07mFB9zFPpNabYo
 uzbLVoIGdqHT0dA2xN+wRBWYh2rEdRk/2l+vIZ7U=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHNvbWUgcmVhc29uIHRoZSBkcml2ZXIgaGFzIGEgbXNsZWVwKDEwMCkgYWZ0ZXIgd3JpdGlu
ZyB0bwpEUF9QSFlfQ1RSTC4gVG9zaGliYSdzIGRvY3VtZW50YXRpb24gZG9lc24ndCBzdWdnZXN0
IGFueSBkZWxheSBpcwpuZWVkZWQsIGFuZCBJIGhhdmUgbm90IHNlZW4gYW55IGlzc3VlcyB3aXRo
IHRoZSBzbGVlcCByZW1vdmVkLgoKRHJvcCBpdCwgYXMgbXNsZWVwKDEwMCkgaXMgYSByYXRoZXIg
YmlnIG9uZS4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0
aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV5IEd1c2Frb3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVk
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4
IGNlYzgyNTYwMDE1OC4uZWQzNDhlMDk1NzZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5j
CkBAIC04NzQsNyArODc0LDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxlKHN0cnVj
dCB0Y19kYXRhICp0YykKIAlpZiAodGMtPmxpbmsuYmFzZS5udW1fbGFuZXMgPT0gMikKIAkJZHBf
cGh5X2N0cmwgfD0gUEhZXzJMQU5FOwogCXRjX3dyaXRlKERQX1BIWV9DVFJMLCBkcF9waHlfY3Ry
bCk7Ci0JbXNsZWVwKDEwMCk7CiAKIAkvKiBQTEwgc2V0dXAgKi8KIAl0Y193cml0ZShEUDBfUExM
Q1RSTCwgUExMVVBEQVRFIHwgUExMRU4pOwotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBP
eSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElE
OiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
