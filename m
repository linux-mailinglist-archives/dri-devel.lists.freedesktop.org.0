Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A25D285E5D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 13:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAB46E0BC;
	Wed,  7 Oct 2020 11:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCF86E0BC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 11:43:09 +0000 (UTC)
IronPort-SDR: T1gu22qWiO+/9AU7OG4WzV2t1aR4m5H6F1mcVulf3OpXmtHdvR5Od40p+dPfjYWjt6WCNOod3D
 mY9q2FHmxp6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="165040040"
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; d="scan'208";a="165040040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 04:43:09 -0700
IronPort-SDR: BpsqzP7meTrMAAZ+vaDWoPKgKu4uGekJqlZW80h5DrLXlp0IaJJeNLJlDwwXA95WeGSnqvxQMU
 HFj7Bcq8AJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; d="scan'208";a="353949295"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2020 04:43:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 04:43:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 04:43:08 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Wed, 7 Oct 2020 04:43:08 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "ray.huang@amd.com"
 <ray.huang@amd.com>
Subject: RE: [PATCH] drm/ttm: remove ttm_bo_unmap_virtual_locked declaration
Thread-Topic: [PATCH] drm/ttm: remove ttm_bo_unmap_virtual_locked declaration
Thread-Index: AQHWnIcvqttuECheOkK2nVpykxJVuamMBIMA
Date: Wed, 7 Oct 2020 11:43:07 +0000
Message-ID: <cb699f27e94f491db3e38f674815cbda@intel.com>
References: <20201007085222.16586-1-christian.koenig@amd.com>
In-Reply-To: <20201007085222.16586-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tv
ZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBPY3RvYmVy
IDcsIDIwMjAgNDo1MiBBTQ0KPlRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBh
aXJsaWVkQGdtYWlsLmNvbTsNCj5yYXkuaHVhbmdAYW1kLmNvbTsgUnVobCwgTWljaGFlbCBKIDxt
aWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+U3ViamVjdDogW1BBVENIXSBkcm0vdHRtOiByZW1v
dmUgdHRtX2JvX3VubWFwX3ZpcnR1YWxfbG9ja2VkDQo+ZGVjbGFyYXRpb24NCj4NCj5UaGF0IHdh
cyBtaXNzZWQgZHVyaW5nIHRoZSBjbGVhbnVwLg0KPg0KPlNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4tLS0NCj4gaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19kcml2ZXIuaCB8IDkgLS0tLS0tLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA5IGRl
bGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oDQo+Yi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oDQo+aW5kZXggOTg5N2ExNmMw
YTlkLi5iNThkZWRjZTcwNzkgMTAwNjQ0DQo+LS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19k
cml2ZXIuaA0KPisrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj5AQCAtNDQ5
LDE1ICs0NDksNiBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LA0KPiAgKi8NCj4gdm9pZCB0dG1fYm9fdW5tYXBfdmlydHVhbChzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvKTsNCj4NCj4tLyoqDQo+LSAqIHR0bV9ib191bm1hcF92aXJ0dWFsDQo+
LSAqDQo+LSAqIEBibzogdGVhciBkb3duIHRoZSB2aXJ0dWFsIG1hcHBpbmdzIGZvciB0aGlzIEJP
DQo+LSAqDQo+LSAqIFRoZSBjYWxsZXIgbXVzdCB0YWtlIHR0bV9tZW1faW9fbG9jayBiZWZvcmUg
Y2FsbGluZyB0aGlzIGZ1bmN0aW9uLg0KPi0gKi8NCj4tdm9pZCB0dG1fYm9fdW5tYXBfdmlydHVh
bF9sb2NrZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7DQoNCmdyZXBpbmcgZm9yIHR0
bV9ib191bm1hcF92aXJ0dWFsX2xvY2tlZCByZXZlYWxlZCB0aGlzOg0KDQpkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2RpcnR5LmM6ICogVGhpcyBpcyBzaW1pbGFyIHRvIHR0bV9i
b191bm1hcF92aXJ0dWFsX2xvY2tlZCgpIGV4Y2VwdCBpdCB0YWtlcyBhIHN1YnJhbmdlLg0KaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaDp2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsX2xv
Y2tlZChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsNCg0KU2hvdWxkIHlvdSBjbGVhbiB1
cCB0aGUgdm13Z3Z4IGNvbW1lbnQgdG8gYXZvaWQgY29uZnVzaW9uPyDwn5iKDQoNClJldmlld2Vk
LWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KbQ0KDQo+
LQ0KPiAvKioNCj4gICogdHRtX2JvX3Jlc2VydmU6DQo+ICAqDQo+LS0NCj4yLjE3LjENCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
