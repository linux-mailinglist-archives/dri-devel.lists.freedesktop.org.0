Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBFCAD4D8
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B310E3E7;
	Mon,  8 Dec 2025 13:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 998 seconds by postgrey-1.36 at gabe;
 Mon, 08 Dec 2025 09:58:09 UTC
Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C789310E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:58:09 +0000 (UTC)
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dPxkp0TvQzYmbLG;
 Mon,  8 Dec 2025 17:38:58 +0800 (CST)
Received: from a009.hihonor.com (10.68.30.244) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 8 Dec
 2025 17:41:27 +0800
Received: from a008.hihonor.com (10.68.30.56) by a009.hihonor.com
 (10.68.30.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 8 Dec
 2025 17:41:27 +0800
Received: from a008.hihonor.com ([fe80::b6bf:fc6a:207:6851]) by
 a008.hihonor.com ([fe80::b6bf:fc6a:207:6851%6]) with mapi id 15.02.2562.027;
 Mon, 8 Dec 2025 17:41:27 +0800
From: gao xu <gaoxu2@honor.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "\"T.J. Mercier\""
 <tjmercier@google.com>, =?utf-8?B?IkNocmlzdGlhbiBLw7ZuaWci?=
 <christian.koenig@amd.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
 "surenb@google.com" <surenb@google.com>, zhouxiaolong
 <zhouxiaolong9@honor.com>
Subject: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
Thread-Topic: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
Thread-Index: AdxoJnlSUP8R1FJ1RaylLS1xKeCkOw==
Date: Mon, 8 Dec 2025 09:41:27 +0000
Message-ID: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.166.85.101]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Dec 2025 13:40:18 +0000
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

Y29tbWl0IDA0YzdhZGI1ODcxYSAoImRtYS1idWY6IHN5c3RlbV9oZWFwOiB1c2UgbGFyZ2VyIGNv
bnRpZ3VvdXMgbWFwcGluZ3MNCmluc3RlYWQgb2YgcGVyLXBhZ2UgbW1hcCIpIGZhY2lsaXRhdGVz
IHRoZSB1c2Ugb2YgUFRFX0NPTlQuIFRoZSBzeXN0ZW1faGVhcA0KYWxsb2NhdGVzIHBhZ2VzIG9m
IG9yZGVyIDQgYW5kIDggdGhhdCBtZWV0IHRoZSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzIGZvcg0K
UFRFX0NPTlQuIGVuYWJsaW5nIFBURV9DT05UIGZvciBsYXJnZXIgY29udGlndW91cyBtYXBwaW5n
cy4NCg0KQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgVExCIG1pc3NlcyBhcmUgcmVkdWNlZCBi
eSBhcHByb3hpbWF0ZWx5IDUlIHdoZW4NCm9wZW5pbmcgdGhlIGNhbWVyYSBvbiBBbmRyb2lkIHN5
c3RlbXMuDQoNClNpZ25lZC1vZmYtYnk6IGdhbyB4dSA8Z2FveHUyQGhvbm9yLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgNiArKysrKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jDQppbmRleCA0Yzc4MmZlMzMuLjEwM2IwNmY4OSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jDQorKysgYi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvc3lzdGVtX2hlYXAuYw0KQEAgLTIwMiwxMiArMjAyLDE2IEBAIHN0YXRpYyBpbnQg
c3lzdGVtX2hlYXBfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkNCiAJCXVuc2lnbmVkIGxvbmcgbiA9IChzZy0+bGVuZ3RoID4+IFBBR0VfU0hJ
RlQpIC0gcGdvZmY7DQogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHNnX3BhZ2Uoc2cpICsgcGdvZmY7
DQogCQl1bnNpZ25lZCBsb25nIHNpemUgPSBuIDw8IFBBR0VfU0hJRlQ7DQorCQlwZ3Byb3RfdCBw
cm90ID0gdm1hLT52bV9wYWdlX3Byb3Q7DQogDQogCQlpZiAoYWRkciArIHNpemUgPiB2bWEtPnZt
X2VuZCkNCiAJCQlzaXplID0gdm1hLT52bV9lbmQgLSBhZGRyOw0KIA0KKwkJaWYgKCgoYWRkciB8
IHNpemUpICYgfkNPTlRfUFRFX01BU0spID09IDApDQorCQkJcHJvdCA9IF9fcGdwcm90KHBncHJv
dF92YWwocHJvdCkgfCBQVEVfQ09OVCk7DQorDQogCQlyZXQgPSByZW1hcF9wZm5fcmFuZ2Uodm1h
LCBhZGRyLCBwYWdlX3RvX3BmbihwYWdlKSwNCi0JCQkJc2l6ZSwgdm1hLT52bV9wYWdlX3Byb3Qp
Ow0KKwkJCQlzaXplLCBwcm90KTsNCiAJCWlmIChyZXQpDQogCQkJcmV0dXJuIHJldDsNCiANCi0t
IA0KMi40Mi4wDQo=
