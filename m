Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01AA791CF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE98810E807;
	Wed,  2 Apr 2025 15:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="Vl+QS9kZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (mail1.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4010E856;
 Wed,  2 Apr 2025 15:06:08 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTP id 532F5uq5011368-532F5uq7011368
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Wed, 2 Apr 2025 18:05:56 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 2 Apr
 2025 18:05:55 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Wed, 2 Apr 2025 18:05:55 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
To: Kenneth Feng <kenneth.feng@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri
 <sunil.khatri@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Tim Huang
 <tim.huang@amd.com>, "chr[]" <chris@rudorff.com>, Boyuan Zhang
 <boyuan.zhang@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-patches@linuxtesting.org" <lvc-patches@linuxtesting.org>
Subject: [PATCH] drm/amdgpu: Remove the redundant NULL check for the 'table'
 object
Thread-Topic: [PATCH] drm/amdgpu: Remove the redundant NULL check for the
 'table' object
Thread-Index: AQHbo+C7eZhnXRFWGk6xqFGm4+h7bw==
Date: Wed, 2 Apr 2025 15:05:55 +0000
Message-ID: <20250402150551.388229-1-a.vatoropin@crpt.ru>
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
 bh=CIvEwGy1ZRedZYHOxGiz3Jd0L6LjT1+0QPHuGHOebBU=;
 b=Vl+QS9kZo0yTmuHLtzBDicCq6h0rx5fF3rSZez5KSNnqN7p3TI2tFGEw0o1UwihByu1OmKLKkSFt
 B4mz54E+B0x7blnIFL2XR6c6birkAyWCgw10wJJ/zh1dWdN98pSsNEoIH2Y0GS3RVroTtZUh7/rk
 UcuGet99JYg3aHB06uyXBdyF92jK5I3pDTsw2mumStPFNIdp4WA0lpaSBp6eqDZhJ7FJxMfARDo2
 iptxg2PNJd2VakdmlsI/SV1QDdx2PwszirUxOHbs1QID9Pu+kkpH5kxgD4XFXzZpibK2JWQqBCeU
 M+UaHUaslXbIbpwZqTNGv34xwNCnXpEmvDKtcg==
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
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAidGFibGUiIGNhbm5vdCBiZSBOVUxMIGJlY2F1c2Ug
aXQgDQpwb2ludHMgdG8gdGhlIG9iamVjdCAic3RydWN0IGFtZGdwdV9jYWNfbGVha2FnZV90YWJs
ZSIuDQoNClJlbW92ZSB0aGUgZXh0cmEgTlVMTCBjaGVjay4gSXQgaXMgbWVhbmluZ2xlc3MgYW5k
IGhhcm1zIHRoZSByZWFkYWJpbGl0eQ0Kb2YgdGhlIGNvZGUuDQoNCkZvdW5kIGJ5IExpbnV4IFZl
cmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQoNClNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBWYXRvcm9waW4gPGEudmF0b3JvcGluQGNycHQucnU+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vc2lfZHBtLmMgfCAzIC0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9sZWdhY3ktZHBtL3NpX2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdh
Y3ktZHBtL3NpX2RwbS5jDQppbmRleCAxYzI1ZjMwMjNlOTMuLmQ2YWI2ZDc3NzdmOSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9zaV9kcG0uYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdhY3ktZHBtL3NpX2RwbS5jDQpAQCAtMjYzMyw5ICsy
NjMzLDYgQEAgc3RhdGljIGludCBzaV9nZXRfY2FjX3N0ZF92b2x0YWdlX21heF9taW4oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCXUzMiBpOw0KIAl1MzIgdjBfbG9hZGxpbmU7DQogDQot
CWlmICh0YWJsZSA9PSBOVUxMKQ0KLQkJcmV0dXJuIC1FSU5WQUw7DQotDQogCSptYXggPSAwOw0K
IAkqbWluID0gMHhGRkZGOw0KIA0KLS0gDQoyLjQzLjANCg==
