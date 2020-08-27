Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB80255535
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A546E508;
	Fri, 28 Aug 2020 07:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098696E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:00:40 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5BEFD5C8985852C2DA27;
 Thu, 27 Aug 2020 21:00:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 21:00:28 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <yanaijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: remove set but not used 'ulBestVCO'
Date: Thu, 27 Aug 2020 21:00:08 +0800
Message-ID: <20200827130008.428706-1-yanaijie@huawei.com>
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
b24K4oCYUHJvZ3JhbUNsb2Nr4oCZOgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMElu
aXREZXZpY2UuYzoxMjM6Njogd2FybmluZzogdmFyaWFibGUK4oCYdWxCZXN0VkNP4oCZIHNldCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgMTIzIHwgIHUzMiB1bEJl
c3RWQ08gPSAwLCB1bEJlc3RDbGsgPSAwLCB1bEJlc3RTY29yZSA9IDA7CiAgICAgIHwgICAgICBe
fn5+fn5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2ln
bmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMv
dmlkZW8vZmJkZXYva3lyby9TVEc0MDAwSW5pdERldmljZS5jIHwgNCArLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9reXJvL1NURzQwMDBJbml0RGV2aWNlLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2UuYwppbmRleCBlZGFlZWMyZDk1OTAuLjIxODc1ZDNj
MmRjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBJbml0RGV2
aWNlLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBJbml0RGV2aWNlLmMK
QEAgLTEyMCw3ICsxMjAsNyBAQCB1MzIgUHJvZ3JhbUNsb2NrKHUzMiByZWZDbG9jaywKIHsKIAl1
MzIgUiA9IDAsIEYgPSAwLCBPRCA9IDAsIE9ESW5kZXggPSAwOwogCXUzMiB1bEJlc3RSID0gMCwg
dWxCZXN0RiA9IDAsIHVsQmVzdE9EID0gMDsKLQl1MzIgdWxCZXN0VkNPID0gMCwgdWxCZXN0Q2xr
ID0gMCwgdWxCZXN0U2NvcmUgPSAwOworCXUzMiB1bEJlc3RDbGsgPSAwLCB1bEJlc3RTY29yZSA9
IDA7CiAJdTMyIHVsU2NvcmUsIHVsUGhhc2VTY29yZSwgdWxWY29TY29yZTsKIAl1MzIgdWxUbXAg
PSAwLCB1bFZDTzsKIAl1MzIgdWxTY2FsZUNsb2NrUmVxLCB1bE1pbkNsb2NrLCB1bE1heENsb2Nr
OwpAQCAtMTg5LDcgKzE4OSw2IEBAIHUzMiBQcm9ncmFtQ2xvY2sodTMyIHJlZkNsb2NrLAogCQkJ
CQkJdWxTY29yZSA9IHVsUGhhc2VTY29yZSArIHVsVmNvU2NvcmU7CiAKIAkJCQkJCWlmICghdWxC
ZXN0U2NvcmUpIHsKLQkJCQkJCQl1bEJlc3RWQ08gPSB1bFZDTzsKIAkJCQkJCQl1bEJlc3RPRCA9
IE9EOwogCQkJCQkJCXVsQmVzdEYgPSBGOwogCQkJCQkJCXVsQmVzdFIgPSBSOwpAQCAtMjA2LDcg
KzIwNSw2IEBAIHUzMiBQcm9ncmFtQ2xvY2sodTMyIHJlZkNsb2NrLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICBidXQgd2Ugc2hhbGwga2VlcCB0aGlzIGNvZGUgaW4gY2FzZSBuZXcgcmVzdHJp
Y3Rpb25zIGNvbWUgaW50byBwbGF5CiAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKi8KIAkJCQkJCWlmICgodWxTY29yZSA+PSB1bEJlc3RTY29yZSkgJiYgKE9EID4g
MCkpIHsKLQkJCQkJCQl1bEJlc3RWQ08gPSB1bFZDTzsKIAkJCQkJCQl1bEJlc3RPRCA9IE9EOwog
CQkJCQkJCXVsQmVzdEYgPSBGOwogCQkJCQkJCXVsQmVzdFIgPSBSOwotLSAKMi4yNS40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
