Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9BB30C78
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 05:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D40310EA4D;
	Fri, 22 Aug 2025 03:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="Kmfe9i89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
 by gabe.freedesktop.org (Postfix) with SMTP id 1D4C810EA4D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:21:21 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.65.20])
 by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id C1CB418A9E0289;
 Fri, 22 Aug 2025 11:06:08 +0800 (CST)
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 22 Aug 2025 11:07:00 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 22 Aug 2025 11:06:59 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e%7]) with
 mapi id 15.02.1748.010; Fri, 22 Aug 2025 11:06:59 +0800
X-MD-Sfrom: chentaotao@didiglobal.com
X-MD-SrcIP: 10.79.65.20
From: =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "andi.shyti@linux.intel.com"
 <andi.shyti@linux.intel.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "chentao325@qq.com" <chentao325@qq.com>,
 =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>, "kernel
 test robot" <oliver.sang@intel.com>
Subject: [PATCH v2 1/2] drm/i915: set O_LARGEFILE in __create_shmem()
Thread-Topic: [PATCH v2 1/2] drm/i915: set O_LARGEFILE in __create_shmem()
Thread-Index: AQHcExHTV6aknsehhUav66+J8g4nVQ==
Date: Fri, 22 Aug 2025 03:06:59 +0000
Message-ID: <20250822030651.28099-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1755831980;
 bh=AI2NXEuZSrXFyuXRU2Crhiyj9UAYepnZ6UFWCV6Y56s=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=Kmfe9i89SD/NHI0zQwebi3n3VqJlroo2ggQQApJqoAnM3ytME55iZ6rrZRk6d4N5F
 aSaSDycAQDmjBmY8XhcVpFdv8oVZIwY1+abKyTkQmBO4QyyVijsMn3HKSIwrcbw3Kn
 LYTbEr6prts9d33j5FOQU9zSP7wHMggBg/7nrdb4=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNCldpdGhvdXQg
T19MQVJHRUZJTEUsIGZpbGUtPmZfb3AtPndyaXRlX2l0ZXIgY2FsbHMNCmdlbmVyaWNfd3JpdGVf
Y2hlY2tfbGltaXRzKCksIHdoaWNoIGVuZm9yY2VzIGEgMkdCIChNQVhfTk9OX0xGUykgbGltaXQs
DQpjYXVzaW5nIC1FRkJJRyBvbiBsYXJnZSB3cml0ZXMuDQoNCkluIHNobWVtX3B3cml0ZSgpLCB0
aGlzIGVycm9yIGlzIGxhdGVyIG1hc2tlZCBhcyAtRUlPIGR1ZSB0byB0aGUgZXJyb3INCmhhbmRs
aW5nIG9yZGVyLCBsZWFkaW5nIHRvIGlndCBmYWlsdXJlcyBsaWtlIGdlbjlfZXhlY19wYXJzZShi
Yi1sYXJnZSkuDQoNClNldCBPX0xBUkdFRklMRSBpbiBfX2NyZWF0ZV9zaG1lbSgpIHRvIHByZXZl
bnQgLUVGQklHIG9uIGxhcmdlIHdyaXRlcy4NCg0KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxvbGl2ZXIuc2FuZ0BpbnRlbC5jb20+DQpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29lLWxrcC8yMDI1MDgwODEwMjkuMzQzMTkyZWMtbGtwQGludGVsLmNvbQ0KRml4ZXM6IDA0
ODgzMmEzZjQwMCAoImRybS9pOTE1OiBSZWZhY3RvciBzaG1lbV9wd3JpdGUoKSB0byB1c2Uga2lv
Y2IgYW5kIHdyaXRlX2l0ZXIiKQ0KU2lnbmVkLW9mZi1ieTogVGFvdGFvIENoZW4gPGNoZW50YW90
YW9AZGlkaWdsb2JhbC5jb20+DQotLS0NCnYyOg0KIC0gQWRkIGZvcmNlX29fbGFyZ2VmaWxlKCkg
Z3VhcmQgYmVmb3JlIHNldHRpbmcgT19MQVJHRUZJTEUNCg0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9zaG1lbS5jIHwgNyArKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX3NobWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0K
aW5kZXggZTNkMTg4NDU1ZjY3Li5iOWRhZTE1YzFkMTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMNCkBAIC01MTQsNiArNTE0LDEzIEBAIHN0YXRpYyBpbnQg
X19jcmVhdGVfc2htZW0oc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsDQogCWlmIChJU19F
UlIoZmlscCkpDQogCQlyZXR1cm4gUFRSX0VSUihmaWxwKTsNCiANCisJLyoNCisJICogUHJldmVu
dCAtRUZCSUcgYnkgYWxsb3dpbmcgbGFyZ2Ugd3JpdGVzIGJleW9uZCBNQVhfTk9OX0xGUyBvbiBz
aG1lbQ0KKwkgKiBvYmplY3RzIGJ5IHNldHRpbmcgT19MQVJHRUZJTEUuDQorCSAqLw0KKwlpZiAo
Zm9yY2Vfb19sYXJnZWZpbGUoKSkNCisJCWZpbHAtPmZfZmxhZ3MgfD0gT19MQVJHRUZJTEU7DQor
DQogCW9iai0+ZmlscCA9IGZpbHA7DQogCXJldHVybiAwOw0KIH0NCi0tIA0KMi4zNC4xDQo=
