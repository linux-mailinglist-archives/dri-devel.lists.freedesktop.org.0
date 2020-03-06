Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2317B801
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D3C6EC9E;
	Fri,  6 Mar 2020 08:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 938 seconds by postgrey-1.36 at gabe;
 Fri, 06 Mar 2020 04:14:36 UTC
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFFF6EC63
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 04:14:36 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id A2F262437629F8AAB41B;
 Fri,  6 Mar 2020 11:58:53 +0800 (CST)
Received: from dggeme711-chm.china.huawei.com (10.1.199.107) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 6 Mar 2020 11:58:53 +0800
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme711-chm.china.huawei.com (10.1.199.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Fri, 6 Mar 2020 11:58:53 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1713.004;
 Fri, 6 Mar 2020 11:58:53 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: "tiantao (H)" <tiantao6@hisilicon.com>, "Chenfeng (puck)"
 <puck.chen@hisilicon.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcm0vaGlzaWxpY29uOiBBZGQgdGhlIHNodXRkb3du?=
 =?gb2312?B?IGZvciBoaWJtY19wY2lfZHJpdmVy?=
Thread-Topic: [PATCH] drm/hisilicon: Add the shutdown for hibmc_pci_driver
Thread-Index: AQHV82lxn9gkibbLOEaVBpUdO8J6s6g6796g
Date: Fri, 6 Mar 2020 03:58:53 +0000
Message-ID: <063d5262b6f7401bb9a0bb2a52a123b2@hisilicon.com>
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
 <1583466184-7060-2-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1583466184-7060-2-git-send-email-tiantao6@hisilicon.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxso7oNCg0KCVNvcnJ5o6xwbGVhc2UgIGlnbm9yZSB0aGlzIHBhdGNoLg0KDQpCZXN0DQoN
Ci0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBMaW51eGFybSBbbWFpbHRvOmxpbnV4YXJtLWJv
dW5jZXNAaHVhd2VpLmNvbV0gtPqx7SBUaWFuIFRhbw0Kt6LLzcqxvOQ6IDIwMjDE6jPUwjbI1SAx
MTo0Mw0KytW8/sjLOiBDaGVuZmVuZyAocHVjaykgPHB1Y2suY2hlbkBoaXNpbGljb24uY29tPjsg
YWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyB0emltbWVybWFubkBzdXNlLmRlOyBr
cmF4ZWxAcmVkaGF0LmNvbTsgYWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbTsgdGdseEBsaW51dHJv
bml4LmRlOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyB4aW5saWFuZy5saXVAbGlu
YXJvLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0Ks63LzTogTGludXhhcm0gPGxp
bnV4YXJtQGh1YXdlaS5jb20+DQrW98ziOiBbUEFUQ0hdIGRybS9oaXNpbGljb246IEFkZCB0aGUg
c2h1dGRvd24gZm9yIGhpYm1jX3BjaV9kcml2ZXINCg0KYWRkIHRoZSBzaHV0ZG93biBmdW5jdGlv
biB0byByZWxlYXNlIHRoZSByZXNvdXJjZS4NCg0KU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRp
YW50YW82QGhpc2lsaWNvbi5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hp
Ym1jL2hpYm1jX2RybV9kcnYuYyB8IDEwICsrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYw0KaW5kZXggNTFmMWM3MC4uMGU1ODQ1NWQgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMN
CkBAIC0zNTcsOSArMzU3LDE0IEBAIHN0YXRpYyB2b2lkIGhpYm1jX3BjaV9yZW1vdmUoc3RydWN0
IHBjaV9kZXYgKnBkZXYpICB7DQogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2Ry
dmRhdGEocGRldik7DQogDQotCWRybV9kZXZfdW5yZWdpc3RlcihkZXYpOw0KLQloaWJtY191bmxv
YWQoZGV2KTsNCiAJZHJtX2Rldl9wdXQoZGV2KTsNCisJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYp
Ow0KKw0KK30NCisNCitzdGF0aWMgdm9pZCBoaWJtY19wY2lfc2h1dGRvd24oc3RydWN0IHBjaV9k
ZXYgKnBkZXYpIHsNCisJaGlibWNfcGNpX3JlbW92ZShwZGV2KTsNCiB9DQogDQogc3RhdGljIHN0
cnVjdCBwY2lfZGV2aWNlX2lkIGhpYm1jX3BjaV90YWJsZVtdID0geyBAQCAtMzcyLDYgKzM3Nyw3
IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBoaWJtY19wY2lfZHJpdmVyID0gew0KIAkuaWRf
dGFibGUgPQloaWJtY19wY2lfdGFibGUsDQogCS5wcm9iZSA9CWhpYm1jX3BjaV9wcm9iZSwNCiAJ
LnJlbW92ZSA9CWhpYm1jX3BjaV9yZW1vdmUsDQorCS5zaHV0ZG93biA9IGhpYm1jX3BjaV9zaHV0
ZG93biwNCiAJLmRyaXZlci5wbSA9ICAgICZoaWJtY19wbV9vcHMsDQogfTsNCiANCi0tDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KTGlu
dXhhcm0gbWFpbGluZyBsaXN0DQpMaW51eGFybUBodWF3ZWkuY29tDQpodHRwOi8vaHVsay5odWF3
ZWkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXhhcm0NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
