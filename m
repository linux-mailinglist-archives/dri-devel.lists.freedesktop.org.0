Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AE53CB79
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D775B10E6BF;
	Fri,  3 Jun 2022 14:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571210E559;
 Fri,  3 Jun 2022 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654266375; x=1685802375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=L0ZyruoUX0xeeqVEacvovAPS/Pr+PJVDsOxo8aeKrSA=;
 b=i45idksQOsibLhgIbOO2jxOJKbAYOYu0nhxk/hf++fQzp9qK0YdFSTB/
 lJumLGm5RQ0zKeGWiU/M2hijs3Ynhaovziq+V4VWDkmzhFfRJKyOCwCES
 oAez5punzxSOTSRY9kOtm3imJfrwIDkGOqoQyYGgxK7WgoSEsLNIL5tEz
 PpkbmXwltGeVCGo55/f1TrQo3u8yxRVEnF0AyaJAhWDDAQ0WeNimaDJG8
 FVy43FK34tpwEYnHP16+4HeQa4fSHECxdYux+r4SxzswYQafjPNd7tD/C
 lFcydCEccQlxBqzfF3df3EFxq1D2yRgRx1Rg5caZ/G9TiHuKNmc7ND4Sv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301634841"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="301634841"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 07:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="824743686"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 03 Jun 2022 07:26:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 3 Jun 2022 07:26:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 3 Jun 2022 07:26:13 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Fri, 3 Jun 2022 07:26:13 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/pvc: GuC depriv applies to PVC
Thread-Topic: [PATCH] drm/i915/pvc: GuC depriv applies to PVC
Thread-Index: AQHYdti+jzwFZxNcdUakH9OcRXm8i60+M2cA
Date: Fri, 3 Jun 2022 14:26:13 +0000
Message-ID: <1d9962984a84999de2130f188c302758ec5e0bb7.camel@intel.com>
References: <20220602233019.1659283-1-matthew.d.roper@intel.com>
In-Reply-To: <20220602233019.1659283-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B00DD4745AFAF428B7CFDCA53C3558B@intel.com>
Content-Transfer-Encoding: base64
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA2LTAyIGF0IDE2OjMwIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBX
ZSBtaXNzZWQgdGhpcyBzZXR0aW5nIGluIHRoZSBpbml0aWFsIGRldmljZSBpbmZvIHBhdGNoJ3Mg
ZGVmaW5pdGlvbiBvZg0KPiBYRV9IUENfRkVBVFVSRVMuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3BjaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYw0KPiBpbmRleCAwNDdh
NmUzMjYwMzEuLmE1YTFhNzY0NzMyMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9wY2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jDQo+
IEBAIC0xMDg5LDYgKzEwODksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9p
bmZvIGF0c19tX2luZm8gPSB7DQo+ICAJWEVfSFBfRkVBVFVSRVMsIFwNCj4gIAkuZG1hX21hc2tf
c2l6ZSA9IDUyLCBcDQo+ICAJLmhhc18zZF9waXBlbGluZSA9IDAsIFwNCj4gKwkuaGFzX2d1Y19k
ZXByaXZpbGVnZSA9IDEsIFwNCj4gIAkuaGFzX2wzX2Njc19yZWFkID0gMSwgXA0KPiAgCS5oYXNf
b25lX2V1X3Blcl9mdXNlX2JpdCA9IDENCj4gIA0KDQo=
