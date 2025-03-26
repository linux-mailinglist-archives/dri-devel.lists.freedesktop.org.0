Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE970A7104D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EE010E078;
	Wed, 26 Mar 2025 06:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="CllUNNpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9A10E078;
 Wed, 26 Mar 2025 06:01:31 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTP id 52Q61Joa020126-52Q61Joc020126
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Wed, 26 Mar 2025 09:01:19 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 26 Mar
 2025 09:01:19 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Wed, 26 Mar 2025 09:01:19 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
To: Kenneth Feng <kenneth.feng@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri
 <sunil.khatri@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Tim Huang
 <tim.huang@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>, "chr[]"
 <chris@rudorff.com>, Yang Wang <kevinyang.wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amdgpu: Remove the redundant NULL check for the
 'dte_data' object
Thread-Topic: [PATCH] drm/amdgpu: Remove the redundant NULL check for the
 'dte_data' object
Thread-Index: AQHbnhR++EzAa3ZlHUaU6nruSXfbmA==
Date: Wed, 26 Mar 2025 06:01:19 +0000
Message-ID: <20250326060059.15335-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 3/25/2025 10:34:00 PM
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
 bh=SMaYKshq3acZS99u+26mBuayTpIg9iiDJLeo1mA0VVw=;
 b=CllUNNprfqAVkUe2LfYNfFiPe7WMQzwbnbuJtW0m+s8PkL+AJkIj+8zMRaAVBLiGsiJDtTrEFnJe
 EsS7DF4vmctwRzwIqkiUzmST1HJouD36NU6huwOlk87t+qWFiPQvDDWgcAIh2Udaw7X9LY/RczJ6
 T7eCVTeT4zU+rJqyLF/QxMNF/GOM6zz0y5QyT+jLDA2nmMJK2Pw2cf6+/UP23nzI54UoHKFxiCCB
 yAh0hEYvgylQbezRe7VFC46DeAmZpz+A4Fzvz3trCHSnDssFEe6HSoPbLA/z1W8Uxzv1dayWoLgz
 tHKH/9A1WnnIWfdfa94EFaNhirsQHC/C+Ho4DQ==
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
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAiZHRlX2RhdGEiIGNhbm5vdCBiZSBOVUxMIGJlY2F1
c2UgaXQgDQpwb2ludHMgdG8gdGhlIG9iamVjdCAic3RydWN0IHNpX2R0ZV9kYXRhIi4NCg0KUmVt
b3ZlIHRoZSBleHRyYSBOVUxMIGNoZWNrLiBJdCBpcyBtZWFuaW5nbGVzcyBhbmQgaGFybXMgdGhl
IHJlYWRhYmlsaXR5DQpvZiB0aGUgY29kZS4NCg0KRm91bmQgYnkgTGludXggVmVyaWZpY2F0aW9u
IENlbnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4NCg0KU2lnbmVkLW9mZi1ieTog
QW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9zaV9kcG0uYyB8IDMgLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xl
Z2FjeS1kcG0vc2lfZHBtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vc2lf
ZHBtLmMNCmluZGV4IGQ2ZGZlMjU5OWViZS4uMzJlNmE4MTVlNjA5IDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wbS9sZWdhY3ktZHBtL3NpX2RwbS5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vc2lfZHBtLmMNCkBAIC0yNTY3LDkgKzI1NjcsNiBAQCBz
dGF0aWMgaW50IHNpX2luaXRpYWxpemVfc21jX2R0ZV90YWJsZXMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQogCXU4IHRkZXBfY291bnQ7DQogCXUzMiBpOw0KIA0KLQlpZiAoZHRlX2RhdGEg
PT0gTlVMTCkNCi0JCXNpX3BpLT5lbmFibGVfZHRlID0gZmFsc2U7DQotDQogCWlmIChzaV9waS0+
ZW5hYmxlX2R0ZSA9PSBmYWxzZSkNCiAJCXJldHVybiAwOw0KIA0KLS0gDQoyLjQzLjANCg==
