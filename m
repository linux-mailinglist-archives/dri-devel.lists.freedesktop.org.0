Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25FD8001BA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 03:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1F510E7AD;
	Fri,  1 Dec 2023 02:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAA110E7AB;
 Fri,  1 Dec 2023 02:44:50 +0000 (UTC)
Received: from kwepemm000019.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ShHNW3f3QzNnd0;
 Fri,  1 Dec 2023 10:40:27 +0800 (CST)
Received: from kwepemm000018.china.huawei.com (7.193.23.4) by
 kwepemm000019.china.huawei.com (7.193.23.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Dec 2023 10:44:46 +0800
Received: from kwepemm000018.china.huawei.com ([7.193.23.4]) by
 kwepemm000018.china.huawei.com ([7.193.23.4]) with mapi id 15.01.2507.035;
 Fri, 1 Dec 2023 10:44:46 +0800
From: zhuweixi <weixi.zhu@huawei.com>
To: David Hildenbrand <david@redhat.com>, Dave Airlie <airlied@gmail.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: RE: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Thread-Topic: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Thread-Index: AQHaIfl9wrtrX0lryUy6fTQuS5BXZrCPLVeAgAEOlwCAALjigIABe6QAgAFK01A=
Date: Fri, 1 Dec 2023 02:44:46 +0000
Message-ID: <f4ec70345800432caa94d662f49370f6@huawei.com>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
 <CAPM=9tx-d-Au_bjX0vYxv6OwqiSjmbbMC7ebWpTsQgFNddWDuw@mail.gmail.com>
 <a07fd33c6f9e44418c528de06f89707e@huawei.com>
 <188814aa-4f55-40c6-961c-6105c89d76f3@redhat.com>
In-Reply-To: <188814aa-4f55-40c6-961c-6105c89d76f3@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.172]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mgorman@suse.de" <mgorman@suse.de>, "ziy@nvidia.com" <ziy@nvidia.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zeng,
 Oak" <oak.zeng@intel.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzISBJIGFtIHBsYW5uaW5nIHRvIHByZXNlbnQgR01FTSBpbiBMaW51eCBNTSBBbGlnbm1l
bnQgU2Vzc2lvbnMgc28gSSBjYW4gY29sbGVjdCBtb3JlIGlucHV0IGZyb20gdGhlIG1tIGRldmVs
b3BlcnMuDQoNCkBDaHJpc3RpYW4gQE9hayBJIHdpbGwgYWxzbyBzZW5kIHlvdSBpbnZpdGF0aW9u
cyBvbmNlIGEgcHJlc2VudGF0aW9uIGlzIHNjaGVkdWxlZC4gOikNCg0KLVdlaXhpDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMzAsIDIwMjMgMTA6NTUgUE0NClRv
OiB6aHV3ZWl4aSA8d2VpeGkuemh1QGh1YXdlaS5jb20+OyBEYXZlIEFpcmxpZSA8YWlybGllZEBn
bWFpbC5jb20+OyBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQpD
YzogbGludXgtbW1Aa3ZhY2sub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnOyB3ZWl4aS56aHVAb3BlbmV1bGVyLnNoOyBtZ29ybWFuQHN1
c2UuZGU7IGpnbGlzc2VAcmVkaGF0LmNvbTsgcmNhbXBiZWxsQG52aWRpYS5jb207IGpodWJiYXJk
QG52aWRpYS5jb207IGFwb3BwbGVAbnZpZGlhLmNvbTsgbWhhaXJncm92ZUBudmlkaWEuY29tOyB6
aXlAbnZpZGlhLmNvbTsgYWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbTsgWGluaHVpLlBhbkBhbWQu
Y29tOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRmVsaXguS3VlaGxpbmdAYW1kLmNv
bTsgb2dhYmJheUBrZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBq
Z2dAbnZpZGlhLmNvbTsgbGVvbnJvQG52aWRpYS5jb207IHpoZW55dXdAbGludXguaW50ZWwuY29t
OyB6aGkuYS53YW5nQGludGVsLmNvbTsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGphbmkubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbTsgam9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsgcm9kcmlnby52aXZpQGlu
dGVsLmNvbTsgdHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tDQpTdWJqZWN0OiBSZTogW1JG
QyBQQVRDSCAwLzZdIFN1cHBvcnRpbmcgR01FTSAoZ2VuZXJhbGl6ZWQgbWVtb3J5IG1hbmFnZW1l
bnQpIGZvciBleHRlcm5hbCBtZW1vcnkgZGV2aWNlcw0KDQpPbiAyOS4xMS4yMyAwOToyNywgemh1
d2VpeGkgd3JvdGU6DQo+IEdsYWQgdG8gaGVhciB0aGF0IG1vcmUgc2hhcmFibGUgY29kZSBpcyBk
ZXNpcmFibGUuDQo+IElNSE8sIGZvciBhIGNvbW1vbiBNTSBzdWJzeXN0ZW0sIGl0IGlzIG1vcmUg
YmVuZWZpY2lhbCBmb3IgR01FTSB0byANCj4gZXh0ZW5kIGNvcmUgTU0gaW5zdGVhZCBvZiBidWls
ZGluZyBhIHNlcGFyYXRlIG9uZS4NCg0KTW9yZSBjb3JlLW1tIGNvbXBsZXhpdHksIGF3ZXNvbWUs
IHdlIGFsbCBsb3ZlIHRoYXQhIDspDQoNCi0tDQpDaGVlcnMsDQoNCkRhdmlkIC8gZGhpbGRlbmIN
Cg0K
