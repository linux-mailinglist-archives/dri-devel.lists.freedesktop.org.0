Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB312838FD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 17:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E9689CD8;
	Mon,  5 Oct 2020 15:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A3689CD8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:05:11 +0000 (UTC)
IronPort-SDR: nj3p4xXIkZg7Bp9YEVFvDkP8BtZzBKWbFeLmcvzwfdWfEKZ8pFSTGB0ke2D4AKicsJEhivmly6
 UJmQrn4B0t9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="225269965"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="225269965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 07:59:24 -0700
IronPort-SDR: NZ8juBHVVg1zG7MXUu//Gr72XnNjidXpDLAu4qp+Q7GmY6cE6w8sW/eorzUmtke9IHfmkkYPB2
 LvkFbggcq0Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="295772267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2020 07:59:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 07:59:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 07:59:22 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Mon, 5 Oct 2020 07:59:22 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ray.huang@amd.com" <ray.huang@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 1/8] drm/ttm: remove TTM_PAGE_FLAG_WRITE
Thread-Topic: [PATCH 1/8] drm/ttm: remove TTM_PAGE_FLAG_WRITE
Thread-Index: AQHWl+X77MYL+sSRZ0WTg7+LuOAuZ6mJIEOA
Date: Mon, 5 Oct 2020 14:59:22 +0000
Message-ID: <0882242367f944a68b90e837d1eb5059@intel.com>
References: <20201001112817.20967-1-christian.koenig@amd.com>
In-Reply-To: <20201001112817.20967-1-christian.koenig@amd.com>
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

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Q2hyaXN0aWFu
IEvDtm5pZw0KPlNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEsIDIwMjAgNzoyOCBBTQ0KPlRvOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyByYXkuaHVhbmdAYW1kLmNvbTsNCj5haXJs
aWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoDQo+U3ViamVjdDogW1BBVENIIDEvOF0gZHJt
L3R0bTogcmVtb3ZlIFRUTV9QQUdFX0ZMQUdfV1JJVEUNCj4NCj5Ob3QgdXNlZCBhbnkgbW9yZS4N
Cg0KUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
Pg0KDQptDQoNCj5TaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+LS0tDQo+IGluY2x1ZGUvZHJtL3R0bS90dG1fdHQuaCB8IDEgLQ0KPiAx
IGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX3R0LmggYi9pbmNsdWRlL2RybS90dG0vdHRtX3R0LmgNCj5pbmRleCA5MTY5MTI0
MGE1MDkuLjVkMTgzNWQ0NDA4NCAxMDA2NDQNCj4tLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX3R0
LmgNCj4rKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX3R0LmgNCj5AQCAtMzQsNyArMzQsNiBAQCBz
dHJ1Y3QgdHRtX3Jlc291cmNlOw0KPiBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Q7DQo+IHN0cnVj
dCB0dG1fb3BlcmF0aW9uX2N0eDsNCj4NCj4tI2RlZmluZSBUVE1fUEFHRV9GTEFHX1dSSVRFICAg
ICAgICAgICAoMSA8PCAzKQ0KPiAjZGVmaW5lIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCAgICAgICAg
ICgxIDw8IDQpDQo+ICNkZWZpbmUgVFRNX1BBR0VfRkxBR19aRVJPX0FMTE9DICAgICAgKDEgPDwg
NikNCj4gI2RlZmluZSBUVE1fUEFHRV9GTEFHX0RNQTMyICAgICAgICAgICAoMSA8PCA3KQ0KPi0t
DQo+Mi4xNy4xDQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj5kcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
