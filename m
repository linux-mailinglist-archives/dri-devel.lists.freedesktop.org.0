Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CC6B72E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2D56E25B;
	Wed, 17 Jul 2019 07:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E858915F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 05:09:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6H59Glh028098;
 Wed, 17 Jul 2019 00:09:16 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6H59GEG068346
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jul 2019 00:09:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 00:09:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 00:09:16 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6H59Dtw081819;
 Wed, 17 Jul 2019 00:09:14 -0500
From: Keerthy <j-keerthy@ti.com>
To: <jsarha@ti.com>, <tomi.valkeinen@ti.com>
Subject: [PATCH] gpu: drm/tilcdc: Fix switch case fallthrough
Date: Wed, 17 Jul 2019 10:39:46 +0530
Message-ID: <20190717050946.18488-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1563340156;
 bh=MXMho54RIQOfVsh8C9psx0LpQ4N7ZoANlBBQTCObflw=;
 h=From:To:CC:Subject:Date;
 b=Xfzpfw/X5LzRUAiFZ2SKz85KroyH6qJqRsSUoTIricRMSrr00/xLLrjGsIJCJ8Sdv
 WdK+8E1bIMkrWOBi1m6bFu7z3nWGpxYll6OoJCsSbETzSUlvglCl2CZh5TGavRMsdH
 7y6LaQl9WepkRBPbEXSiznMWBo0d6aXY22jjV3Ts=
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
Cc: airlied@linux.ie, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, t-kristo@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBiZWxvdyBidWlsZCB3YXJuaW5nL0Vycm9yCgpkcml2ZXJzL2dwdS9kcm0vdGlsY2Rj
L3RpbGNkY19jcnRjLmM6IEluIGZ1bmN0aW9uIOKAmHRpbGNkY19jcnRjX3NldF9tb2Rl4oCZOgpk
cml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmM6Mzg0Ojg6IGVycm9yOiB0aGlzIHN0
YXRlbWVudCBtYXkgZmFsbAp0aHJvdWdoIFstV2Vycm9yPWltcGxpY2l0LWZhbGx0aHJvdWdoPV0K
ICAgIHJlZyB8PSBMQ0RDX1YyX1RGVF8yNEJQUF9VTlBBQ0s7CiAgICB+fn5+Xn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmM6Mzg2OjM6IG5v
dGU6IGhlcmUKICAgY2FzZSBEUk1fRk9STUFUX0JHUjg4ODoKICAgXn5+fgpjYzE6IGFsbCB3YXJu
aW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzVdOiAqKiogW2RyaXZlcnMvZ3B1L2Ry
bS90aWxjZGMvdGlsY2RjX2NydGMub10gRXJyb3IgMQptYWtlWzRdOiAqKiogW2RyaXZlcnMvZ3B1
L2RybS90aWxjZGNdIEVycm9yIDIKbWFrZVs0XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQg
am9icy4uLi4KCkZpeGVzOiBmNjM4MmYxODZkMjk4Mjc1MCAoImRybS90aWxjZGM6IEFkZCB0aWxj
ZGNfY3J0Y19tb2RlX3NldF9ub2ZiKCkiKQpTaWduZWQtb2ZmLWJ5OiBLZWVydGh5IDxqLWtlZXJ0
aHlAdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2NydGMuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfY3J0Yy5jIGIvZHJpdmVycy9n
cHUvZHJtL3RpbGNkYy90aWxjZGNfY3J0Yy5jCmluZGV4IDY1MGQxNjJlMzc0Yi4uYzk1YjA2NTJj
NmFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfY3J0Yy5jCkBAIC0zODIsNyArMzgyLDgg
QEAgc3RhdGljIHZvaWQgdGlsY2RjX2NydGNfc2V0X21vZGUoc3RydWN0IGRybV9jcnRjICpjcnRj
KQogCQljYXNlIERSTV9GT1JNQVRfWEJHUjg4ODg6CiAJCWNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4
ODoKIAkJCXJlZyB8PSBMQ0RDX1YyX1RGVF8yNEJQUF9VTlBBQ0s7Ci0JCQkvKiBmYWxsdGhyb3Vn
aCAqLworCQkJcmVnIHw9IExDRENfVjJfVEZUXzI0QlBQX01PREU7CisJCQlicmVhazsKIAkJY2Fz
ZSBEUk1fRk9STUFUX0JHUjg4ODoKIAkJY2FzZSBEUk1fRk9STUFUX1JHQjg4ODoKIAkJCXJlZyB8
PSBMQ0RDX1YyX1RGVF8yNEJQUF9NT0RFOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
