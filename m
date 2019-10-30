Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0ECEAC23
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185546EDD8;
	Thu, 31 Oct 2019 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649B6E9ED
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:55:55 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 02206D467BC788BFC20A;
 Wed, 30 Oct 2019 21:55:52 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 30 Oct 2019
 21:55:43 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <arnd@arndb.de>,
 <seanpaul@chromium.org>
Subject: [PATCH -next] gpu: host1x: Fix compile test failure
Date: Wed, 30 Oct 2019 21:54:58 +0800
Message-ID: <20191030135458.27960-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
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
Cc: linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgSU9NTVVfU1VQUE9SVCBpcyBub3Qgc2V0LCBidXQgSU9NTVVfSU9WQSBpcyBtIGFuZApDT01Q
SUxFX1RFU1QgaXMgeSwgYnVpbGRpbmcgZmFpbHM6Cgpkcml2ZXJzL2dwdS9ob3N0MXgvZGV2Lm86
IEluIGZ1bmN0aW9uIGBob3N0MXhfcmVtb3ZlJzoKZGV2LmM6KC50ZXh0KzB4NjI0KTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgcHV0X2lvdmFfZG9tYWluJwpkZXYuYzooLnRleHQrMHg2MjQpOiBy
ZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfQUFSQ0g2NF9DQUxMMjYgYWdhaW5zdCB1bmRl
ZmluZWQgc3ltYm9sIGBwdXRfaW92YV9kb21haW4nCmRldi5jOigudGV4dCsweDYyYyk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGlvdmFfY2FjaGVfcHV0JwpkZXYuYzooLnRleHQrMHg2MmMpOiBy
ZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfQUFSQ0g2NF9DQUxMMjYgYWdhaW5zdCB1bmRl
ZmluZWQgc3ltYm9sIGBpb3ZhX2NhY2hlX3B1dCcKClNlbGVjdCBJT01NVV9JT1ZBIHdoaWxlIENP
TVBJTEVfVEVTVCBpcyBzZXQgdG8gZml4IHRoaXMuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8
aHVsa2NpQGh1YXdlaS5jb20+CkZpeGVzOiA1MjQ5OWE2YWQyYWUgKCJncHU6IGhvc3QxeDogc2Vs
ZWN0IElPTU1VX0lPVkEiKQpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L0tjb25maWcgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9ob3N0MXgvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9LY29uZmlnCmluZGV4
IGNmOTg3YTMuLjM1NDIzMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9LY29uZmln
CisrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9LY29uZmlnCkBAIC0yLDcgKzIsNyBAQAogY29uZmln
IFRFR1JBX0hPU1QxWAogCXRyaXN0YXRlICJOVklESUEgVGVncmEgaG9zdDF4IGRyaXZlciIKIAlk
ZXBlbmRzIG9uIEFSQ0hfVEVHUkEgfHwgKEFSTSAmJiBDT01QSUxFX1RFU1QpCi0Jc2VsZWN0IElP
TU1VX0lPVkEgaWYgSU9NTVVfU1VQUE9SVAorCXNlbGVjdCBJT01NVV9JT1ZBIGlmIChJT01NVV9T
VVBQT1JUIHx8IENPTVBJTEVfVEVTVCkKIAloZWxwCiAJICBEcml2ZXIgZm9yIHRoZSBOVklESUEg
VGVncmEgaG9zdDF4IGhhcmR3YXJlLgogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
