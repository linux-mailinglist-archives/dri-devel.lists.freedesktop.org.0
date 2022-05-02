Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7725176B3
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129910F33B;
	Mon,  2 May 2022 18:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F14D10F2F1;
 Mon,  2 May 2022 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651516860; x=1683052860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6XdJId5//Y0dl9hoVgfnHONtH+WYh7Q1dSO1WLSd6io=;
 b=i8XrpKAphPLmkf9Rp95I/FuUNVFt6h/insryREodXu0xXOU79zQ/s4DN
 D6YUXMbsxDYvHDLa5Gim+FnOSv2PxWwy1HOeoPAroaJmmD0VP9bGp0yl5
 W1WiePe/NxkzoEZlozq1wbQj2GZHjxRXIi8JvB5PRGDd4jkDBHGC9Ef+N
 4n3W6G96/y8sqMaop6pSseX7XhrNOtqOkN9tVppzCxFZjCG9yW8Xk19ox
 T7/e1jDPe1Pn1YeJiM+VxvWi+8f6zQXMmbKHMI3IiA0GBZxoFhOHvrSwQ
 xLRyPxUVF2U0aBhLfWw6zCk1IkQNdo8cRaRvbK5Rn7847Kzh8c4Kk10rz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267452541"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="267452541"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583849487"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 02 May 2022 11:40:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 11:40:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 11:40:58 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Mon, 2 May 2022 11:40:58 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 10/11] drm/i915/pvc: skip all copy engines
 from aux table invalidate
Thread-Topic: [Intel-gfx] [PATCH 10/11] drm/i915/pvc: skip all copy engines
 from aux table invalidate
Thread-Index: AQHYXkKPId1bikZLoEaLMnd75Z7rFq0MYWIA
Date: Mon, 2 May 2022 18:40:58 +0000
Message-ID: <6dbac2e2e2501c2c8f36cf83722582f43b5a93fb.camel@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-11-matthew.d.roper@intel.com>
In-Reply-To: <20220502163417.2635462-11-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E28D80BA7340D94DA27057D24A3AD52F@intel.com>
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA1LTAyIGF0IDA5OjM0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBG
cm9tOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gDQo+IEFz
IHdlIGhhdmUgbW9yZSBjb3B5IGVuZ2luZXMgbm93LCBtYXNrIGFsbCBvZiB0aGVtIGZyb20gYXV4
IHRhYmxlDQo+IGludmFsaWRhdGUuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gQ2M6IFByYXRoYXAgS3VtYXIgVmFs
c2FuIDxwcmF0aGFwLmt1bWFyLnZhbHNhbkBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEx1
Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2dlbjhfZW5naW5lX2NzLmMgfCAyICstDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW44X2VuZ2luZV9jcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvZ2VuOF9lbmdpbmVfY3MuYw0KPiBpbmRleCAwZGUxN2I1NjhiNDEuLmYyNjJhZWQ5
NGVmMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZ2VuOF9lbmdpbmVf
Y3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW44X2VuZ2luZV9jcy5jDQo+
IEBAIC0yNzUsNyArMjc1LDcgQEAgaW50IGdlbjEyX2VtaXRfZmx1c2hfeGNzKHN0cnVjdCBpOTE1
X3JlcXVlc3QgKnJxLCB1MzIgbW9kZSkNCj4gIAkJaWYgKCFIQVNfRkxBVF9DQ1MocnEtPmVuZ2lu
ZS0+aTkxNSkgJiYNCj4gIAkJICAgIChycS0+ZW5naW5lLT5jbGFzcyA9PSBWSURFT19ERUNPREVf
Q0xBU1MgfHwNCj4gIAkJICAgICBycS0+ZW5naW5lLT5jbGFzcyA9PSBWSURFT19FTkhBTkNFTUVO
VF9DTEFTUykpIHsNCj4gLQkJCWF1eF9pbnYgPSBycS0+ZW5naW5lLT5tYXNrICYgfkJJVChCQ1Mw
KTsNCj4gKwkJCWF1eF9pbnYgPSBycS0+ZW5naW5lLT5tYXNrICYgfkdFTk1BU0soQkNTOCwgQkNT
MCk7DQo+ICAJCQlpZiAoYXV4X2ludikNCj4gIAkJCQljbWQgKz0gNDsNCj4gIAkJfQ0KDQo=
