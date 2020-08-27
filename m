Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26EE255531
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1F6E506;
	Fri, 28 Aug 2020 07:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBEB6E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:00:59 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C3F82C315B0D3867DA47;
 Thu, 27 Aug 2020 21:00:57 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 21:00:46 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <yanaijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: remove set but not used 'ulCoreClock'
Date: Thu, 27 Aug 2020 21:00:28 +0800
Message-ID: <20200827130028.428893-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3aXRoICJtYWtlIFc9MSI6
Cgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2UuYzogSW4gZnVuY3Rp
b24K4oCYU2V0Q29yZUNsb2NrUExM4oCZOgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAw
MEluaXREZXZpY2UuYzoyNDc6Njogd2FybmluZzogdmFyaWFibGUK4oCYdWxDb3JlQ2xvY2vigJkg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0gLy8geWFuYWlqaWUK
Zml4ZWQKICAyNDcgfCAgdTMyIHVsQ29yZUNsb2NrOwogICAgICB8ICAgICAgXn5+fn5+fn5+fn4K
ClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1i
eTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJk
ZXYva3lyby9TVEc0MDAwSW5pdERldmljZS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2UuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9T
VEc0MDAwSW5pdERldmljZS5jCmluZGV4IDFkM2YyMDgwYWE2Zi4uZWRhZWVjMmQ5NTkwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2UuYworKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2UuYwpAQCAtMjQ0LDcg
KzI0NCw2IEBAIGludCBTZXRDb3JlQ2xvY2tQTEwodm9sYXRpbGUgU1RHNDAwMFJFRyBfX2lvbWVt
ICpwU1RHUmVnLCBzdHJ1Y3QgcGNpX2RldiAqcERldikKIHsKIAl1MzIgRiwgUiwgUDsKIAl1MTYg
Y29yZV9wbGwgPSAwLCBzdWI7Ci0JdTMyIHVsQ29yZUNsb2NrOwogCXUzMiB0bXA7CiAJdTMyIHVs
Q2hpcFNwZWVkOwogCkBAIC0yODIsNyArMjgxLDcgQEAgaW50IFNldENvcmVDbG9ja1BMTCh2b2xh
dGlsZSBTVEc0MDAwUkVHIF9faW9tZW0gKnBTVEdSZWcsIHN0cnVjdCBwY2lfZGV2ICpwRGV2KQog
CWlmICh1bENoaXBTcGVlZCA9PSAwKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXVsQ29yZUNsb2Nr
ID0gUHJvZ3JhbUNsb2NrKFJFRl9GUkVRLCBDT1JFX1BMTF9GUkVRLCAmRiwgJlIsICZQKTsKKwlQ
cm9ncmFtQ2xvY2soUkVGX0ZSRVEsIENPUkVfUExMX0ZSRVEsICZGLCAmUiwgJlApOwogCiAJY29y
ZV9wbGwgfD0gKChQKSB8ICgoRiAtIDIpIDw8IDIpIHwgKChSIC0gMikgPDwgMTEpKTsKIAotLSAK
Mi4yNS40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
