Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE06F649B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 08:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DB110E10E;
	Thu,  4 May 2023 06:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237510E10E;
 Thu,  4 May 2023 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683180098; x=1714716098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Vh0Z8S5QNWYUKuU2/IXzY1+/n1iu/eNi4VVRgtFgaRM=;
 b=eNhfEiASuEwpClVenTSRscFCJDrVg3PmxgG7NA2coYjQ129HIFwPNUmi
 ttbbhvlHmq8p2NsRDGCbXgDs7L2WGBIwNL7Y4AzBa4vz5KNFChiahfV/h
 Sn1jlSptMXuph4ytEaSPBf3DuE21GKkNt5rCXXjV+Y9CIPYDrSb/u0Iih
 fYaT0z5Znmw0F/bzkfK0NoeJQ0TLYsZUkccZxT2eT2xLZPCopjp5J+bTN
 /KKu6krayKSXvM86BMcCEhI3e4ahvt7jWFJ1OiQ47oADs2Xe1ceEEh/5S
 eiKFtWcYMVJnwwVjNjqCc2D354A+Ur7gKG70/fr25mTubJ4aGMM3euJPv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376907836"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="376907836"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 23:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="761776853"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="761776853"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2023 23:01:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 23:01:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 23:01:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 23:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=df7P+cVcca7yxEAPXTiZdqDLiYJh/VRDJUs1QhQs1+carPlPxkGI7wgfUV3yuQgZOn/KoZUTavzdAGQDFUbf5Vxm13bUbxrTSD+m6PWLPchnYqpcNSWeMeRexhntEQHDs3DLJyu9HtB+KkFhP0D+HcGUBBOsuswuZpMpotoITspk203dcTM/N4heOb996QCZC3Lu8p/Equ++0ZS0TP4xSpI298z7kFDCoMj0LQj25+/Lb1HKIh4CPyhXUpHdByeg5fo5AntWO21Lx5FDhd5OxtJRN6oOTpwyzIFcIseHVATjF6dk6achA7Z5UVl2r7gybgj8fjfN+GFHBjInFcyvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh0Z8S5QNWYUKuU2/IXzY1+/n1iu/eNi4VVRgtFgaRM=;
 b=PiZc5RKjfHQS9e1ZXkvLVkn7tdEidxXXOSsRSQ9uUxJ9jp2p5hwyMU3ok45gi45ilF9mhDUDdx0zrb36kqjqE7ZHCXYpMqWrdDXnRBCJwEI55TRBIPyQebk7WuJK3wjRZSq3aEX/Er5Fkqe5ErBIhzPO1FbnTHimOrAbTDdmRsB6Z4gnYqjprtVlge2C8EDnrZTrdhjhkXy4UZIkyp99dUv/Zuq7O2C8bdAFLoAtt5U7FGJW7T2HG59n4JSZieCbgX8qGFbHdw/YjbAxiFKJaKPWQiz6Zk9iGJzy3MEGNt0IwafbpwXKV4JzCh9oEcN8QWtyjM5FqSmN3urUDE+QGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 06:01:34 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 06:01:34 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/4] drm/i915/gsc: add initial support for GSC proxy
Thread-Topic: [PATCH v3 3/4] drm/i915/gsc: add initial support for GSC proxy
Thread-Index: AQHZfRSs3nB0j6l83E6BGnaXb8Nq6K9JoZeA
Date: Thu, 4 May 2023 06:01:34 +0000
Message-ID: <6b18fd3331ef9e54580f721660b4792fc7b593b8.camel@intel.com>
References: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
 <20230502163854.317653-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230502163854.317653-4-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN6PR11MB8172:EE_
x-ms-office365-filtering-correlation-id: 6b993b7a-3544-4957-ad89-08db4c650423
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5eyibHbi4h9ydiA2Hs5qPSlO1Y7uAgk9O2iAPmTRRMFwnM81kDfNuSE6MdrndFSMdlmuNI8B2UHaDJvB2BLQQlfP79ItkdXOKskbTdqcpB8u2qg1DHLX91cfvtJ9HqzeEPN8tU+LZKHphJEjeiTfVVxci+uoDEF/UrDYGx3M5PhzKsoUZFveA8YcpDbcV8bkqKDbdw/cjDeuKSS96qURXVV4P52y1FTc6AMaC23+TOJqqtR9oL+8cmS4fipER9Y4iB3axc4LyRtIwpgjfI6L+6keHsjP7r+QhJzZlArL7roLdQceHMW3glbkNwCGachfa2oMDbNBdyiDAG6C8wWinOYO1Pri6+3S3G+22uEQhpgJWbt2wiZVKPPjyTVfR5KSiCyWszkQGckuTkE7K8ZfkcfNcE1nQpCuAOupdsRJBzT/Q7SZNKNhgjDHOltypVOuS+DKXkzFkF1tDtjoUl9RbYjTOGu6yj8r6OlInEu7TCY3L3ZLt334IoZs+NHpf3l9cKGGuiXHzuOgCmUHP5UB0CUhRLGEBU64YKHAwXMvKV6j4PVX1D8vElNZG6US4J2wdpXPBAFqq/DObH7MamBxcFzPtFZge9huUmjxKw6Ubye34aQ/6c4lIc//k+ZSaDDc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(478600001)(122000001)(38100700002)(82960400001)(5660300002)(8676002)(8936002)(36756003)(2616005)(110136005)(6512007)(6506007)(26005)(86362001)(64756008)(66446008)(66476007)(66946007)(76116006)(91956017)(66556008)(4326008)(83380400001)(6486002)(316002)(2906002)(186003)(71200400001)(41300700001)(38070700005)(450100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bS9kdkZGMHJnbXlJZVpYY1o4dzU4K3dVZFBkdmZmRkVoODZHRmV4VkdIZVNh?=
 =?utf-8?B?NzBlM2QzYkdxR0ZETkhvRVk5NkFEWFZWQmtudHZVYkQ2MFg0MXdmbjdhSHE4?=
 =?utf-8?B?RllXZVkyY0g1U3ExSFVKVFRSdmJiVHNheXk4YTkyTWZhbldVSUdOb09oOHpl?=
 =?utf-8?B?aThBRy8zSmZ0NFh4RmdwdkN1VHNqclJ5OUVaK1ViMkdZUW1HVXN3dVBtaytS?=
 =?utf-8?B?NmhBM3dwblJPSFM3Zmw1UFNlQlZmem5Jd1ZqNW9JV01QM2xCM1JoeXR2Y0ho?=
 =?utf-8?B?VkJqMi9rZVBQTlJaYmJrZjZxL0cwaUhCSnUwZmhOVjB3dktHK2p1amtEWk5l?=
 =?utf-8?B?aGw3UllTNlBSNGhVVCttbk9nTmppbFM1MG1nRC9GRVFZUTFQZDRldjgzRWt0?=
 =?utf-8?B?RDZwcTJsUnJEUHhwNVdxWndTalZVTGsyOW5XckJkL0RxR1V3TEo0aDBZNXN3?=
 =?utf-8?B?WlRSUmxVb2E4djRBRm9jZTZ1R0F2OTlJYkY1WkxUaTRHVnU0dmRlNjFjMlZ3?=
 =?utf-8?B?MExRT2VxU1RaMGFXT2pNKzhYeS9tOW1RMGNNVEFlTlVJQVc5cEdMcUs4alpQ?=
 =?utf-8?B?ZmxrQ25ZQlphUTlqeDhJczQ4QzV6OTd2Q0FHbnJuaEtVZkNSaEprVWREc0xs?=
 =?utf-8?B?TzcvOEVKem9rMVhJT05VTWd5bkF6K1c0RWVzT3VWeFVLK3BGYXM1c0J2RHBY?=
 =?utf-8?B?OCs2YlRJN0pDT2dxbUt0Tjc1Y0d5aXhkWi81TzF2eVhKQkdLL3QzMmtvTmZ3?=
 =?utf-8?B?TmpOY2JzdG9oYVZmSjc0bGdFL1VjTDl1V3VIZTdaT3JVeHltdWFYRFpGdmhL?=
 =?utf-8?B?YlBRRURPbmV5TnZ5Y24rVVFmeEE1MndxQjhZMTBwYW5scFdxNVVud1dhREx5?=
 =?utf-8?B?cDAwRHBNaXdlOW1sN0lkZU9DQzZuSFFmYzJINFdZVzZPaDAwRDJJMTNzRVpC?=
 =?utf-8?B?dkhDMS8vZXgyRkY0M2FERlZjNWZ5U1FHd0xybnZ0L2NSelBtUkZDcnRqRzhG?=
 =?utf-8?B?YjZsUmRRWXFTZ1VPRXNsRW9yblk2TmMrNS95cGxxYWNkaXVFY1pBcU9pZTg3?=
 =?utf-8?B?YkQzbmhob3dMSlZmZnZ2Uk5VT29XRnRPMjRWTG12QnlVbHRNK3ZEeVlXczJz?=
 =?utf-8?B?dWtuN1cxQU1KbFA1Nk1PQnJOYkpQeGFwVHpVUE1oS2RzaXBwMTUrTExSSGRx?=
 =?utf-8?B?d1lOODFlQ3B2SC9KTkJvTGRiVXgvYksxY24zTnExNEUwd0lXYkx0V2JrcG9V?=
 =?utf-8?B?QkNzVFhvM0VwdnQzZGpUWVBMYTB4NXhrT1VBcU1DbGttUjFLNWxkd05Xcllw?=
 =?utf-8?B?cHNJSUlaazdUd083N0pGWlBlK2ZwTmJ5NkRPTWtpN2IvdjBiV1BlZ0orSHJq?=
 =?utf-8?B?SGxyT0hGSUtqaDI0Uk9WbzcvOVRIS25paXd4UU81aEY4T2U5WlN4clJwbUNq?=
 =?utf-8?B?UHRSYXQ3UTBYdU9zN1ZUNU1HNmxsbE81azhzRDRRQ2dwUmFabE8rKy9iSEF4?=
 =?utf-8?B?RFFmWks0NGFpekppYmp3bk1kWHpnbVFqeGFyZjBlak9NWlZWMjl0a1VtYnV5?=
 =?utf-8?B?TkxWMHJYdHFkRng4MGo3d0FIQzJLUk1WalBUNlRkSXFzSE9ZZnV2RStpNFky?=
 =?utf-8?B?RDZMZFI4b2E3bDZ0Nk1tSzBVZXVzTExRRWVZellMNlV4YUJ2UHJYU0JadmVM?=
 =?utf-8?B?VUNGeXRaeGo4NENJSURPcER2OGVjM25WbmdZeGxuZE5sdUUyOTd4UWtSUlor?=
 =?utf-8?B?QWt0cDUyc2hWVm1rMloraEdXdmJjRW5Kd01SUjlwUUhHMnhESHpTVFh0Yk1t?=
 =?utf-8?B?SDdka3hyR05URjBHZUZENTRpNzJnbDRTUURVSXgyUU5iTTZ4dXZRM1dhWk8x?=
 =?utf-8?B?NEgyVlFxdUVOQTQycU9rS3ErZFhoMVJKYlVhREgvKzhLQ1ZqR015TFdJRFMz?=
 =?utf-8?B?Z2pYUGhVSlE4M2pSdzBHbU9jUDJJRkNxTFFzTVBVTVA2cEdhYUpIL3lRZHVV?=
 =?utf-8?B?VXp5YzhvK0hZV0Y1Mm9QZ04vOWgxQ2ZnSHh4eDVCYXJWTUR6d2pVeDJzT2RW?=
 =?utf-8?B?M0FPK3E5aFEveDFHUE5sTWRmamErTTRwaWFTMklPTkJTTDRaMUY0OGlWbkhm?=
 =?utf-8?B?L0FKYjJsWUNCTGNCSzF1SXdtR28raEZnWUJVWkMvWHNTVkk1MzBHajBIQWZu?=
 =?utf-8?Q?iBm+DG0VPOVsYtShogWRksU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F12F6B0BDD78B46B70C150307DE0D3A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b993b7a-3544-4957-ad89-08db4c650423
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 06:01:34.7297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3q5/kszdFPl7nnc5zWmAZo65iXlNCNuXSJUDJRrVQZt2AbnvF4gWJ4g0eSDad4pgVm3rlgpnpLZ8vSEPl2tgnDv/Zk2KPmUy1ytmwHgVFFD4svEKAeFvCVdi4iMi+LOF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
X-OriginatorOrg: intel.com
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

DQpPbiBUdWUsIDIwMjMtMDUtMDIgYXQgMDk6MzggLTA3MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5p
ZWxlIHdyb3RlOg0KPiBUaGUgR1NDIHVDIG5lZWRzIHRvIGNvbW11bmljYXRlIHdpdGggdGhlIENT
TUUgdG8gcGVyZm9ybSBjZXJ0YWluDQo+IG9wZXJhdGlvbnMuIFNpbmNlIHRoZSBHU0MgY2FuJ3Qg
cGVyZm9ybSB0aGlzIGNvbW11bmljYXRpb24gZGlyZWN0bHkNCj4gb24gcGxhdGZvcm1zIHdoZXJl
IGl0IGlzIGludGVncmF0ZWQgaW4gR1QsIGk5MTUgbmVlZHMgdG8gdHJhbnNmZXIgdGhlDQo+IG1l
c3NhZ2VzIGZyb20gR1NDIHRvIENTTUUgYW5kIGJhY2suDQo+IA0KYWxhbjpzbmlwDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19mdy5jDQo+IEBAIC0xMyw2ICsx
Myw3IEBADQo+ICAjZGVmaW5lIEdTQ19GV19TVEFUVVNfUkVHCQkJX01NSU8oMHgxMTZDNDApDQo+
ICAjZGVmaW5lIEdTQ19GV19DVVJSRU5UX1NUQVRFCQkJUkVHX0dFTk1BU0soMywgMCkNCj4gICNk
ZWZpbmUgICBHU0NfRldfQ1VSUkVOVF9TVEFURV9SRVNFVAkJMA0KPiArI2RlZmluZSAgIEdTQ19G
V19QUk9YWV9TVEFURV9OT1JNQUwJCTUNCj4gICNkZWZpbmUgR1NDX0ZXX0lOSVRfQ09NUExFVEVf
QklUCQlSRUdfQklUKDkpDQo+ICANCj4gIHN0YXRpYyBib29sIGdzY19pc19pbl9yZXNldChzdHJ1
Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUpDQo+IEBAIC0yMyw2ICsyNCwxNSBAQCBzdGF0aWMgYm9v
bCBnc2NfaXNfaW5fcmVzZXQoc3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlKQ0KPiAgCSAgICAg
ICBHU0NfRldfQ1VSUkVOVF9TVEFURV9SRVNFVDsNCj4gIH0NCj4gIA0KPiArYm9vbCBpbnRlbF9n
c2NfdWNfZndfcHJveHlfaW5pdF9kb25lKHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYykNCj4gK3sN
Cj4gKwlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSBnc2NfdWNfdG9fZ3QoZ3NjKS0+dW5j
b3JlOw0KPiArCXUzMiBmd19zdGF0dXMgPSBpbnRlbF91bmNvcmVfcmVhZCh1bmNvcmUsIEdTQ19G
V19TVEFUVVNfUkVHKTsNCj4gKw0KPiArCXJldHVybiBSRUdfRklFTERfR0VUKEdTQ19GV19DVVJS
RU5UX1NUQVRFLCBmd19zdGF0dXMpID09DQo+ICsJICAgICAgIEdTQ19GV19QUk9YWV9TVEFURV9O
T1JNQUw7DQo+ICt9DQo+ICsNClNpbmNlIHRoaXMgZnVuY3Rpb24gd2FzIGFkZGVkIGhlcmUsIHJl
cGVhdGluZyByYjoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMu
YWxleGlzQGludGVsLmNvbT4NCg==
