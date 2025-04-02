Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DCBA79114
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980110E180;
	Wed,  2 Apr 2025 14:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="Bv92W5Xs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (mail1.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA4F10E180;
 Wed,  2 Apr 2025 14:23:07 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTP id 532ELdeE011735-532ELdeG011735
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Wed, 2 Apr 2025 17:21:39 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 2 Apr
 2025 17:21:40 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Wed, 2 Apr 2025 17:21:40 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
To: Harry Wentland <harry.wentland@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Hung
 <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>, Roman Li
 <roman.li@amd.com>, Ethan Carter Edwards <ethan@ethancedwards.com>, "Ivan
 Lipski" <ivlipski@amd.com>, Iswara Nagulendran <iswara.nagulendran@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Rafal Ostrowski <rostrows@amd.com>, "Alvin
 Lee" <alvin.lee2@amd.com>, Aric Cyr <aric.cyr@amd.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amd/display: Remove the redundant NULL check
Thread-Topic: [PATCH] drm/amd/display: Remove the redundant NULL check
Thread-Index: AQHbo9qMmPuxivrTRU6kDAkV7hJQVA==
Date: Wed, 2 Apr 2025 14:21:39 +0000
Message-ID: <20250402142134.375176-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 4/2/2025 11:23:00 AM
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
 bh=6PWrRiayky3wtjPN+LAvVDtngWKjutbwbMbRB4bNvY4=;
 b=Bv92W5XszD82x8OUXlHmeG3WxEyF8/J/xc7a3rLgP9XN7RvSRGP6LCf0oC8G0/C89pAE8sWkcJI/
 ObK291pMPuTLT4qUOmA8JeKaPiKmT76ztfqwuec3lwEv5EVctNjlVDZT0JETAvUhk23sXybV3lne
 McLGNotTjU2XjUiz6txO8BAfj0GAq7ZEPpGpcdIPQAKDwOCEe7Yrbhkb6AAynnaBr8zhJf2LOs3u
 i6yY09Dd+B6hDMA+PHsAkgn5Kpp7CSsP3TiHRahzwz6aEFvCPd2iQX0OEwUX6N3VlNhat/xfXRE2
 dQXjYOpr4gSH8qJcfT61QqqZlLaRa259dHuRYA==
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
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAidGltaW5nIiBjYW5ub3QgYmUgTlVMTCBiZWNhdXNl
IGl0DQpwb2ludHMgdG8gdGhlIG9iamVjdCAic3RydWN0IGRjX2NydGNfdGltaW5nIi4NCg0KUmVt
b3ZlIHRoZSBleHRyYSBOVUxMIGNoZWNrLiBJdCBpcyBtZWFuaW5nbGVzcyBhbmQgaGFybXMgdGhl
IHJlYWRhYmlsaXR5DQpvZiB0aGUgY29kZS4NCg0KRm91bmQgYnkgTGludXggVmVyaWZpY2F0aW9u
IENlbnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4NCg0KU2lnbmVkLW9mZi1ieTog
QW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9yZXNvdXJjZS9kY24zMC9kY24zMF9yZXNvdXJjZS5jIHwgMiAt
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL3Jlc291cmNlL2RjbjMwL2RjbjMwX3Jlc291cmNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvcmVzb3VyY2UvZGNuMzAvZGNuMzBfcmVz
b3VyY2UuYw0KaW5kZXggMTMyMDJjZTMwZDY2Li43NmU4YzRkY2YzMzkgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvcmVzb3VyY2UvZGNuMzAvZGNuMzBfcmVzb3Vy
Y2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL3Jlc291cmNlL2RjbjMw
L2RjbjMwX3Jlc291cmNlLmMNCkBAIC0xODkxLDggKzE4OTEsNiBAQCBzdGF0aWMgaW50IGdldF9y
ZWZyZXNoX3JhdGUoc3RydWN0IGRjX3N0YXRlICpjb250ZXh0KQ0KIA0KIAkvKiBjaGVjayBpZiBy
ZWZyZXNoIHJhdGUgYXQgbGVhc3QgMTIwaHogKi8NCiAJdGltaW5nID0gJmNvbnRleHQtPnN0cmVh
bXNbMF0tPnRpbWluZzsNCi0JaWYgKHRpbWluZyA9PSBOVUxMKQ0KLQkJcmV0dXJuIDA7DQogDQog
CWhfdl90b3RhbCA9IHRpbWluZy0+aF90b3RhbCAqIHRpbWluZy0+dl90b3RhbDsNCiAJaWYgKGhf
dl90b3RhbCA9PSAwKQ0KLS0gDQoyLjQzLjANCg==
