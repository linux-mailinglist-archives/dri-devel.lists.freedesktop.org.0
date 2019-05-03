Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2812DA2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42DE89F2E;
	Fri,  3 May 2019 12:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B7289F27
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVLT3032439;
 Fri, 3 May 2019 07:31:21 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVL6X129129
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:21 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:20 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYu1002029;
 Fri, 3 May 2019 07:31:18 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 17/23] drm/bridge: tc358767: remove check for video mode in
 link enable
Date: Fri, 3 May 2019 15:29:43 +0300
Message-ID: <20190503122949.12266-18-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886681;
 bh=RHGs8qGQHJ82kep0L+Fdg3YefO6ZG1qAfVf81bx6JIY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=h/lkFr8ztJutn4IhyEhEVD887DQws/NMjiaccYPeVE+09vw7NmPCYSj/8HYuOL10n
 LwFmmWu3EP3K+PkePwbojnBANVGMdvC21HrTsLj7DHILuS1wcSyT3fpbWExuWktqD6
 Ry6Ncyxh0eYtoBx01tBDSkPZUo5LXWcJ5rFfjeco=
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

dGNfbWFpbl9saW5rX2VuYWJsZSgpIGNoZWNrcyBpZiB2aWRlb21vZGUgaGFzIGJlZW4gc2V0LCBh
bmQgZmFpbHMgaWYKdGhlcmUncyBubyB2aWRlb21vZGUuIEFzIHRjX21haW5fbGlua19lbmFibGUo
KSBubyBsb25nZXIgZGVwZW5kcyBvbiB0aGUKdmlkZW9tb2RlLCB3ZSBjYW4gZHJvcCB0aGUgY2hl
Y2suCgpBbHNvLCB3aGlsZSB0Y19zdHJlYW1fZW5hYmxlKCkgZG9lcyBkZXBlbmQgb24gdGhlIHZp
ZGVvbW9kZSwgd2UgY2FuCmV4cGVjdCB0aGF0IGEgbW9kZSBoYXMgYmVlbiBzZXQgYmVmb3JlIGRy
bV9icmlkZ2VfZnVuY3MuZW5hYmxlIGlzCmNhbGxlZCwgc28gd2UgZG9uJ3QgbmVlZCB0aGUgY2hl
Y2sgdGhlcmUgZWl0aGVyLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgNCAtLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
aW5kZXggODYxNzVlOGQwMWIzLi44MWUxMmYxN2IxNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKQEAgLTc3MywxMCArNzczLDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxl
KHN0cnVjdCB0Y19kYXRhICp0YykKIAlpbnQgcmV0OwogCXU4IHRtcFs4XTsKIAotCS8qIGRpc3Bs
YXkgbW9kZSBzaG91bGQgYmUgc2V0IGF0IHRoaXMgcG9pbnQgKi8KLQlpZiAoIXRjLT5tb2RlKQot
CQlyZXR1cm4gLUVJTlZBTDsKLQogCWRldl9kYmcodGMtPmRldiwgImxpbmsgZW5hYmxlXG4iKTsK
IAogCXRjX3JlYWQoRFAwQ1RMLCAmdmFsdWUpOwotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
