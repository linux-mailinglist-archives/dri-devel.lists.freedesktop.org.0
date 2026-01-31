Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULCVAHMwf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2FC5A7B
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6EF10E163;
	Sun,  1 Feb 2026 10:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="TKDi+2So";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="TKDi+2So";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 954 seconds by postgrey-1.36 at gabe;
 Sat, 31 Jan 2026 10:38:52 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CF710E0A7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 10:38:52 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=wDs6942Cj/UVhdUys1MIucPzg0BeCUlH62s730LAQEo=;
 b=TKDi+2SomzIk2+qnlDaUTfdYqJZMp/EC92jrrEDfdjOn9Hnazms8rSRQKIVpSab1FYpOvviRp
 rLxIVsi71n6F1xJtoaAMwUN32pGg7atkgFYNocGsuKoiFTtD1Xil+5vgBgsMTO3uM1lQIMnv3FC
 t945YZ8SpV4TTC51hC8jlsU=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f387v0GmJz1BGBW
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 18:22:19 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=wDs6942Cj/UVhdUys1MIucPzg0BeCUlH62s730LAQEo=;
 b=TKDi+2SomzIk2+qnlDaUTfdYqJZMp/EC92jrrEDfdjOn9Hnazms8rSRQKIVpSab1FYpOvviRp
 rLxIVsi71n6F1xJtoaAMwUN32pGg7atkgFYNocGsuKoiFTtD1Xil+5vgBgsMTO3uM1lQIMnv3FC
 t945YZ8SpV4TTC51hC8jlsU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
 by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f383b65q4z1T4JF;
 Sat, 31 Jan 2026 18:18:35 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id A7FBC2021A;
 Sat, 31 Jan 2026 18:22:52 +0800 (CST)
Received: from kwepemq100006.china.huawei.com (7.202.195.243) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 18:22:50 +0800
Received: from kwepemh200008.china.huawei.com (7.202.181.115) by
 kwepemq100006.china.huawei.com (7.202.195.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 18:22:50 +0800
Received: from kwepemh200008.china.huawei.com ([7.202.181.115]) by
 kwepemh200008.china.huawei.com ([7.202.181.115]) with mapi id 15.02.1544.011; 
 Sat, 31 Jan 2026 18:22:50 +0800
From: "liukai (Y)" <liukai284@huawei.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "Chenhui (Judy)" <judy.chenhui@huawei.com>, "tanghui (C)"
 <tanghui20@huawei.com>, "Zhangqiao (2012 lab)" <zhangqiao22@huawei.com>
Subject: drm/atomic: KASAN: use-after-free in
 drm_atomic_helper_wait_for_vblanks
Thread-Topic: drm/atomic: KASAN: use-after-free in
 drm_atomic_helper_wait_for_vblanks
Thread-Index: AdySmxnx1Ev0mcgfQuGhvqwNO0MYBw==
Date: Sat, 31 Jan 2026 10:22:50 +0000
Message-ID: <06a8cb3f5da040c2a439f9f16d6abcec@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.111.106]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:51:49 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	DATE_IN_PAST(1.00)[24];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@linux.ie,m:daniel@ffwll.ch,m:linux-kernel@vger.kernel.org,m:judy.chenhui@huawei.com,m:tanghui20@huawei.com,m:zhangqiao22@huawei.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[liukai284@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liukai284@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A2D2FC5A7B
X-Rspamd-Action: no action

RGVhciBMaW51eCBLZXJuZWwgRGV2ZWxvcGVycywNCkmhr3ZlIGlkZW50aWZpZWQgYSB1c2UtYWZ0
ZXItZnJlZSAoVUFGKSBpbiB0aGUgRFJNIGF0b21pYyBjb3JlIHRoYXQNCm9jY3VycyB1bmRlciBh
IHNwZWNpZmljIHJhY2UgY29uZGl0aW9uIGJldHdlZW4gYSBub24tYmxvY2tpbmcgKGFzeW5jKQ0K
YXRvbWljIGNvbW1pdCBhbmQgYSBzeW5jaHJvbm91cyBvbmUuIFRoaXMgY2FuIGxlYWQgdG8gY3Jh
c2hlcyBsaWtlIHRoZQ0KS0FTQU4gcmVwb3J0IGJlbG93Lg0KDQpSZXByb2R1Y3Rpb24gU2NlbmFy
aW86DQpDUFUxOiBBIG5vbi1ibG9ja2luZyBhdG9taWMgY29tbWl0IChlLmcuLCBmcm9tIGRybV9t
b2RlX3BhZ2VfZmxpcF9pb2N0bCkNCjEuIENyZWF0ZXMgbmV3X2NydGNfc3RhdGUxIGJ5IGF0b21p
Y19kdXBsaWNhdGVfc3RhdGUoKQ0KMi4gQ2FsbHMgZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0
ZSgpLCBtYWtpbmcgY3J0Yy0+c3RhdGUgPSBuZXdfY3J0Y19zdGF0ZTENCjMuIFF1ZXVlcyBjb21t
aXRfd29yayBmb3IgZGVmZXJyZWQgZXhlY3V0aW9uICh2aWEgcXVldWVfd29yaykNCg0KQ1BVMjog
QSBzeW5jaHJvbm91cyBhdG9taWMgY29tbWl0IChlLmcuLCBmcm9tIGRybV9mYl9oZWxwZXJfZGFt
YWdlX3dvcmspDQpydW5zIGJlZm9yZSB0aGUgYXN5bmMgd29yayBzdGFydHM6DQoxLiBDYWxscyBk
cm1fYXRvbWljX2dldF9jcnRjX3N0YXRlKCksIHdoaWNoIHJlYWRzIGNydGMtPnN0YXRlICg9IG5l
d19jcnRjX3N0YXRlMSkgYXMgdGhlIGN1cnJlbnQgc3RhdGUNCjIuIER1cGxpY2F0ZXMgaXQgdG8g
Y3JlYXRlIG5ld19jcnRjX3N0YXRlMg0KMy4gU2V0cyBpdHMgaW50ZXJuYWwgY3J0Y3NbaV0ub2xk
X2NydGNfc3RhdGUgPSBjcnRjLT5zdGF0ZSAodG8gYmUgZGVzdHJveWVkIGxhdGVyKQ0KNC4gQ2Fs
bHMgZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0ZSgpLCBtYWtpbmcgY3J0Y3NbaV0uc3RhdGVf
dG9fZGVzdHJveSA9IG9sZF9jcnRjX3N0YXRlICg9IG5ld19jcnRjX3N0YXRlMSkNCjUuIENvbXBs
ZXRlcyBpbW1lZGlhdGVseSBhbmQgY2FsbHMgZHJtX2F0b21pY19zdGF0ZV9wdXQoKQ0KNS4gRHVy
aW5nIGNsZWFyLCBhdG9taWNfZGVzdHJveV9zdGF0ZSgpIGlzIGNhbGxlZCBvbiBjcnRjc1tpXS5z
dGF0ZV90b19kZXN0b3J5IKH6IG5ld19jcnRjX3N0YXRlMSBpcyBmcmVlZC4NCg0KQ1BVMzogVGhl
IGRlZmVycmVkIGNvbW1pdF93b3JrIGZyb20gQ1BVMSBmaW5hbGx5IHJ1bnMgYW5kIGFjY2Vzc2Vz
DQpzdGF0ZS0+Y3J0Y3NbaV0ubmV3X2NydGNfc3RhdGUgKHdoaWNoIHBvaW50cyB0byB0aGUgbm93
LWZyZWVkDQpuZXdfY3J0Y19zdGF0ZTEpIKH6IFVBRi4NCg0KVGhlIGNvcmUgcHJvYmxlbSBpcyB0
aGF0IHRoZSBEUk0gYXRvbWljIGZyYW1ld29yayBhc3N1bWVzIGNydGNfc3RhdGUNCm9iamVjdHMg
YXJlIG9ubHkgb3duZWQgYnkgYSBzaW5nbGUgZHJtX2F0b21pY19zdGF0ZS4gQnV0IG9uY2UgYSBz
dGF0ZQ0KYmVjb21lcyBjcnRjLT5zdGF0ZSwgaXQgY2FuIGJlIGNhcHR1cmVkIGFzIHRoZSAib2xk
IHN0YXRlIiBieSBhDQpzdWJzZXF1ZW50IGNvbW1pdCBhbmQgZGVzdHJveWVkIHByZW1hdHVyZWx5
Lg0KDQpUaGUgZ2VuZXJpYyBhdG9taWMgaGVscGVycyBkbyBub3QgcHJvdGVjdCBjcnRjX3N0YXRl
IGFjcm9zcyBjb21taXQNCmJvdW5kYXJpZXMuIFRoaXMgdmlvbGF0ZXMgdGhlIGltcGxpY2l0IGxp
ZmV0aW1lIGNvbnRyYWN0IGFuZCBsZWFkcyB0bw0KVUFGIGluIHRoZSBhc3luYyBwYXRoLg0KDQpQ
cm9wb3NlZCBmaXg6DQpGb3Igbm9uLWJsb2NraW5nIGNvbW1pdHMsIGV4cGxpY2l0bHkgdGFrZSBh
IGtyZWYgb24gZWFjaCBuZXdfY3J0Y19zdGF0ZQ0KYmVmb3JlIHF1ZXVpbmcgdGhlIHdvcmssIGFu
ZCByZWxlYXNlIGl0IG9ubHkgYWZ0ZXIgY29tbWl0X3RhaWwoKQ0KY29tcGxldGVzLiBUaGlzIGVu
c3VyZXMgdGhlIHN0YXRlIHJlbWFpbnMgdmFsaWQgZXZlbiBpZiBhbm90aGVyIGNvbW1pdA0KdHJp
ZXMgdG8gZGVzdHJveSBpdCBhcyBpdHMgInByZXZpb3VzIHN0YXRlIi4NCg0KSaGvbSBwcmVwYXJp
bmcgYSBwYXRjaCB0aGF0IGFkZHMgYSBrcmVmIHRvIGRybV9jcnRjX3N0YXRlIGFuZCBpbXBsZW1l
bnRzDQp0aGUgcmVmY291bnRpbmcgaW4gdGhlIGFzeW5jIGNvbW1pdCBwYXRoLg0KDQpJcyB0aGlz
IHRoZSByaWdodCBkaXJlY3Rpb24sIG9yIHNob3VsZCB3ZSBpbnN0ZWFkIGVuZm9yY2Ugc3RyaWN0
ZXINCnNlcmlhbGl6YXRpb24gYmV0d2VlbiBhc3luYyBhbmQgc3luYyBjb21taXRzIG9uIHRoZSBz
YW1lIENSVEM/DQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KQlVHOiBLQVNBTjogdXNlLWFmdGVyLWZyZWUgaW4gZHJt
X2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcy5wYXJ0LjArMHgxM2YvMHg1MzANClJlYWQg
b2Ygc2l6ZSAxIGF0IGFkZHIgZmZmZjg4ODEwZjFiNzgwOSBieSB0YXNrIGt3b3JrZXIvdTg6MC8z
NTA3MzcNCg0KQ2FsbCBUcmFjZToNCiBkdW1wX3N0YWNrKzB4YmUvMHhmZA0KIHByaW50X2FkZHJl
c3NfZGVzY3JpcHRpb24uY29uc3Rwcm9wLjArMHgxOS8weDE3MA0KID8gZHJtX2F0b21pY19oZWxw
ZXJfd2FpdF9mb3JfdmJsYW5rcy5wYXJ0LjArMHgxM2YvMHg1MzANCiBfX2thc2FuX3JlcG9ydC5j
b2xkKzB4NmMvMHg4NA0KID8gaXJxX2VudGVyX3JjdSsweDkwLzB4ZDANCiA/IGRybV9hdG9taWNf
aGVscGVyX3dhaXRfZm9yX3ZibGFua3MucGFydC4wKzB4MTNmLzB4NTMwDQoga2FzYW5fcmVwb3J0
KzB4M2EvMHg1MA0KIGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MucGFydC4wKzB4
MTNmLzB4NTMwDQogPyBkaXNhYmxlX291dHB1dHMrMHg3NjAvMHg3NjANCiA/IHN3YWtlX3VwX2Fs
bF9sb2NrZWQrMHgxZS8weGMwDQogPyBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHhlLzB4
MjANCiA/IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9od19kb25lKzB4Mjc2LzB4MzIwDQogZHJt
X2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwrMHg5OS8weGIwDQogY29tbWl0X3RhaWwrMHgxZjkv
MHgyNjANCiBwcm9jZXNzX29uZV93b3JrKzB4NDE0LzB4N2UwDQogd29ya2VyX3RocmVhZCsweDkz
LzB4NmYwDQogPyByZXNjdWVyX3RocmVhZCsweDdhMC8weDdhMA0KIGt0aHJlYWQrMHgxY2MvMHgy
MjANCiA/IGt0aHJlYWRfcGFyaysweDE1MC8weDE1MA0KIHJldF9mcm9tX2ZvcmsrMHgyMi8weDMw
DQoNCkFsbG9jYXRlZCBieSB0YXNrIDQ4NzEwMDoNCiBrYXNhbl9zYXZlX3N0YWNrKzB4MWIvMHg0
MA0KIF9fa2FzYW5fa21hbGxvYy5jb25zdHByb3AuMCsweGI1LzB4ZTANCiBkcm1fYXRvbWljX2hl
bHBlcl9jcnRjX2R1cGxpY2F0ZV9zdGF0ZSsweDRmLzB4OTANCiBkcm1fYXRvbWljX2dldF9jcnRj
X3N0YXRlKzB4ZWIvMHgxZjANCiBwYWdlX2ZsaXBfY29tbW9uKzB4NDYvMHgxYTANCiBkcm1fYXRv
bWljX2hlbHBlcl9wYWdlX2ZsaXArMHg3YS8weDEzMA0KIGRybV9tb2RlX3BhZ2VfZmxpcF9pb2N0
bCsweGIwMy8weGI3MA0KIGRybV9pb2N0bF9rZXJuZWwrMHgxYjMvMHgyMjANCiBkcm1faW9jdGwr
MHg0NTMvMHg2YzANCiBfX3NlX3N5c19pb2N0bCsweDExNC8weDE2MA0KIGRvX3N5c2NhbGxfNjQr
MHgyYi8weDQwDQogZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NmMvMHhkNg0KDQpG
cmVlZCBieSB0YXNrIDQxNzk1NToNCiBrYXNhbl9zYXZlX3N0YWNrKzB4MWIvMHg0MA0KIGthc2Fu
X3NldF90cmFjaysweDFjLzB4MzANCiBrYXNhbl9zZXRfZnJlZV9pbmZvKzB4MjAvMHg0MA0KIF9f
a2FzYW5fc2xhYl9mcmVlKzB4MTUxLzB4MTgwDQoga2ZyZWUrMHhhOS8weDVjMA0KIGRybV9hdG9t
aWNfc3RhdGVfZGVmYXVsdF9jbGVhcisweDI0OS8weDcxMA0KIF9fZHJtX2F0b21pY19zdGF0ZV9m
cmVlKzB4YmYvMHgxMjANCiBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiKzB4NGQ1LzB4NTAwDQog
ZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKzB4MWZlLzB4MjcwDQogcHJvY2Vzc19vbmVfd29yaysw
eDQxNC8weDdlMA0KIHdvcmtlcl90aHJlYWQrMHg5My8weDZmMA0KIGt0aHJlYWQrMHgxY2MvMHgy
MjANCiByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMA0KDQpUaGUgYnVnZ3kgYWRkcmVzcyBiZWxvbmdz
IHRvIHRoZSBvYmplY3QgYXQgZmZmZjg4ODEwZjFiNzgwMA0KIHdoaWNoIGJlbG9uZ3MgdG8gdGhl
IGNhY2hlIGttYWxsb2MtNTEyIG9mIHNpemUgNTEyDQpUaGUgYnVnZ3kgYWRkcmVzcyBpcyBsb2Nh
dGVkIDkgYnl0ZXMgaW5zaWRlIG9mDQogNTEyLWJ5dGUgcmVnaW9uIFtmZmZmODg4MTBmMWI3ODAw
LCBmZmZmODg4MTBmMWI3YTAwKQ0KVGhlIGJ1Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgcGFn
ZToNCnBhZ2U6MDAwMDAwMDBlYzJjZTA0NCByZWZjb3VudDoxIG1hcGNvdW50OjAgbWFwcGluZzow
MDAwMDAwMDAwMDAwMDAwIGluZGV4OjB4MCBwZm46MHgxMGYxYjQNCmhlYWQ6MDAwMDAwMDBlYzJj
ZTA0NCBvcmRlcjoyIGNvbXBvdW5kX21hcGNvdW50OjAgY29tcG91bmRfcGluY291bnQ6MA0KZmxh
Z3M6IDB4MTdmZmZmYzAwMTAyMDAoc2xhYnxoZWFkfG5vZGU9MHx6b25lPTJ8bGFzdGNwdXBpZD0w
eDFmZmZmZikNCnJhdzogMDAxN2ZmZmZjMDAxMDIwMCBkZWFkMDAwMDAwMDAwMTAwIGRlYWQwMDAw
MDAwMDAxMjIgZmZmZjg4ODEwMDA0MzQwMA0KcmF3OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAxMDAwMTAgMDAwMDAwMDFmZmZmZmZmZiAwMDAwMDAwMDAwMDAwMDAwDQpwYWdlIGR1bXBlZCBi
ZWNhdXNlOiBrYXNhbjogYmFkIGFjY2VzcyBkZXRlY3RlZA0KDQpNZW1vcnkgc3RhdGUgYXJvdW5k
IHRoZSBidWdneSBhZGRyZXNzOg0KIGZmZmY4ODgxMGYxYjc3MDA6IGZjIGZjIGZjIGZjIGZjIGZj
IGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjDQogZmZmZjg4ODEwZjFiNzc4MDogZmMgZmMg
ZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMNCj5mZmZmODg4MTBmMWI3
ODAwOiBmYSBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYg0KICAg
ICAgICAgICAgICAgICAgICAgIF4NCiBmZmZmODg4MTBmMWI3ODgwOiBmYiBmYiBmYiBmYiBmYiBm
YiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYg0KIGZmZmY4ODgxMGYxYjc5MDA6IGZiIGZi
IGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZiDQo9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0K
QmVzdCByZWdhcmRzLCBMaXUgS2FpDQo=
