Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF94A6206
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5AA10E6E3;
	Tue,  1 Feb 2022 17:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871F110E6E3;
 Tue,  1 Feb 2022 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643735618; x=1675271618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gh/R7MRaQ2a/ln9i6rrhbYffZQOqkPo0nwtwkODF5YE=;
 b=E1YhdAhvDsaMumNcjZbtoNgMub7pkw4cJrjDyfGr6UcqTun2q6IoWjJY
 1DeGjrxmT2EZWdixNX6sT+mjxKhH44rsYvx5qxh+4uRzOoVOpTDACSSci
 tNSX/ORzi2lplCpA80ISVH4NsFmsi/hv8Xtc21f9hWm5ruhYiVtIptZDr
 YWwo7ps7jiM173cRzJ1pArBVaqvjPgwlT1gklV3Hz46zXqB/7Odf0Pxmu
 WYaVkJug9w55hATEUY9uM4A0+NvyLcEcDGX9trVGkMZSKqOnAsRzwOeeF
 LnuIhf4JvqfSbpcay1Ev6SJtpseeZGxvHjaLPY95wanj4NxO6QNITjWnJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228398643"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="228398643"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 09:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="630468304"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 01 Feb 2022 09:12:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 09:12:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 09:12:57 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2308.020;
 Tue, 1 Feb 2022 09:12:57 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 2/3] drm/i915: Fix header test for !CONFIG_X86
Thread-Topic: [PATCH v3 2/3] drm/i915: Fix header test for !CONFIG_X86
Thread-Index: AQHYFsPmXTGoWeazuUy79mlSTJdmo6x/dwcA
Date: Tue, 1 Feb 2022 17:12:57 +0000
Message-ID: <4f941863da55f636ad29099b31163d56a0de5dee.camel@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
 <20220131165926.3230642-3-lucas.demarchi@intel.com>
In-Reply-To: <20220131165926.3230642-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAE6D5FF47104F408FAF380108022F4A@intel.com>
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
Cc: "Mullati, Siva" <siva.mullati@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAxLTMxIGF0IDA4OjU5IC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEFyY2hpdGVjdHVyZXMgb3RoZXJzIHRoYW4geDg2IGhhdmUgYSBzdHViIGltcGxlbWVudGF0
aW9uIGNhbGxpbmcNCj4gV0FSTl9PTl9PTkNFKCkuIFRoZSBhcHByb3ByaWF0ZSBoZWFkZXJzIG5l
ZWQgdG8gYmUgaW5jbHVkZWQsIG90aGVyd2lzZQ0KPiB0aGUgaGVhZGVyLXRlc3QgdGFyZ2V0IHdp
bGwgZmFpbCB3aXRoOg0KPiANCj4gICBIRFJURVNUIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
bW0uaA0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46DQo+IC4vZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9tbS5oOiBJbiBmdW5jdGlvbiDigJhyZW1hcF9pb19tYXBwaW5n
4oCZOg0KPiAuL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW0uaDoyNjoyOiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYV0FSTl9PTl9PTkNF4oCZIFstV2Vycm9y
PWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgICAyNiB8ICBXQVJOX09OX09OQ0Uo
MSk7DQo+ICAgICAgIHwgIF5+fn5+fn5+fn5+fg0KPiANCj4gdjI6IERvIG5vdCBpbmNsdWRlIDxs
aW51eC9wcmludGsuaD4gc2luY2UgY2FsbCB0byBwcl9lcnIoKSBoYXMgYmVlbg0KPiByZW1vdmVk
DQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4NCg0KPiANCj4gRml4ZXM6IDY3YzQzMGJiYWFlMSAoImRybS9pOTE1OiBTa2lwIHJlbWFw
X2lvX21hcHBpbmcoKSBmb3Igbm9uLXg4NiBwbGF0Zm9ybXMiKQ0KPiBDYzogU2l2YSBNdWxsYXRp
IDxzaXZhLm11bGxhdGlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJj
aGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+IA0KPiB2MzogTm8gY2hhbmdl
cyBmcm9tIHByZXZpb3VzIHZlcnNpb24sIGp1c3Qgc3VibWl0dGluZyB0byB0aGUgcmlnaHQNCj4g
bWFpbGluZyBsaXN0DQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9tbS5oIHwgMSAr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21tLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X21tLmgNCj4gaW5kZXggNzZmMWQ1M2JkZjM0Li4zYWQyMmJiZTgwZWIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW0uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X21tLmgNCj4gQEAgLTYsNiArNiw3IEBADQo+ICAjaWZuZGVmIF9fSTkxNV9NTV9I
X18NCj4gICNkZWZpbmUgX19JOTE1X01NX0hfXw0KPiAgDQo+ICsjaW5jbHVkZSA8bGludXgvYnVn
Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gIA0KPiAgc3RydWN0IHZtX2FyZWFf
c3RydWN0Ow0KDQo=
