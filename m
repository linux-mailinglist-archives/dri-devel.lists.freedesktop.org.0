Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA58A6ED51
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 11:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902810E0A5;
	Tue, 25 Mar 2025 10:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="RjGeU7e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195A10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 10:09:26 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTP id 52PA9FXR017359-52PA9FXT017359
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Tue, 25 Mar 2025 13:09:15 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 25 Mar
 2025 13:09:16 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Tue, 25 Mar 2025 13:09:16 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
To: Felix Kuehling <Felix.Kuehling@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amdkfd: Remove the redundant NULL check for the 'svms'
 object
Thread-Topic: [PATCH] drm/amdkfd: Remove the redundant NULL check for the
 'svms' object
Thread-Index: AQHbnW33CeLhAJikwUeO11Tuz1gnSA==
Date: Tue, 25 Mar 2025 10:09:15 +0000
Message-ID: <20250325100908.68325-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 3/24/2025 10:00:00 PM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.4
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru;
 c=relaxed/relaxed; 
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=S8ZTcQtvS2V8JjQOpgLS5GBUFk1XIB89xcUDwVmVR60=;
 b=RjGeU7e15VmA3QoUPYBidpFwzm6fOZoMgccWwzeAXxPH+LRrdeMZmoIRzoGbqCZI7KIsAeuw7UqK
 R6c42I69wLyOZzeSXFiJuiYZRaIHcr+DiO0mxHVZnpzS0mMAf30T0C2MqjxFJ+4/HwQEc0HLJpKb
 OLBoPjiXkNy0zd4Wr5XuKGupkg3gpy1Tk5rvADmy3iuMmYLr08c2NoRiqossJLU2uEeHQ/n9qFfk
 WRn7hhzvisIvj/499sk8H2vSbh1friBeesyI3ubP+3DW0pJdqGnFKSebR4xHemCyaZguosOnstPi
 JKZN0yD1Btp5ReqwuQSquTWOdJSPBd0uOpiaqg==
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

RnJvbTogQW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCg0KU3RhdGljIGFu
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAic3ZtcyIgY2Fubm90IGJlIE5VTEwgYmVjYXVzZSBp
dCBwb2ludHMNCnRvIHRoZSBvYmplY3QgInN0cnVjdCBzdm1fcmFuZ2VfbGlzdCIuDQoNClJlbW92
ZSB0aGUgZXh0cmEgTlVMTCBjaGVjay4gSXQgaXMgbWVhbmluZ2xlc3MgYW5kIGhhcm1zIHRoZSBy
ZWFkYWJpbGl0eQ0Kb2YgdGhlIGNvZGUuDQoNCkZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBD
ZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgVmF0b3JvcGluIDxhLnZhdG9yb3BpbkBjcnB0LnJ1Pg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3N2bS5jIHwgNCAtLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3Zt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMNCmluZGV4IGJkM2UyMGQ5
ODFlMC4uOWYwYzZiNjIzMTc2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3N2bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMN
CkBAIC00MDg5LDggKzQwODksNiBAQCBpbnQgc3ZtX3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRf
cHJvY2VzcyAqcCwgdWludDMyX3QgKm51bV9zdm1fcmFuZ2VzLA0KIAkqc3ZtX3ByaXZfZGF0YV9z
aXplID0gMDsNCiANCiAJc3ZtcyA9ICZwLT5zdm1zOw0KLQlpZiAoIXN2bXMpDQotCQlyZXR1cm4g
LUVJTlZBTDsNCiANCiAJbXV0ZXhfbG9jaygmc3Ztcy0+bG9jayk7DQogCWxpc3RfZm9yX2VhY2hf
ZW50cnkocHJhbmdlLCAmc3Ztcy0+bGlzdCwgbGlzdCkgew0KQEAgLTQxNDksOCArNDE0Nyw2IEBA
IGludCBrZmRfY3JpdV9jaGVja3BvaW50X3N2bShzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsDQogCXN0
cnVjdCBtbV9zdHJ1Y3QgKm1tOw0KIA0KIAlzdm1zID0gJnAtPnN2bXM7DQotCWlmICghc3ZtcykN
Ci0JCXJldHVybiAtRUlOVkFMOw0KIA0KIAltbSA9IGdldF90YXNrX21tKHAtPmxlYWRfdGhyZWFk
KTsNCiAJaWYgKCFtbSkgew0KLS0gDQoyLjQzLjANCg==
