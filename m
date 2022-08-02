Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6CC588218
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 20:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA2D8FA10;
	Tue,  2 Aug 2022 18:54:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74823945DC;
 Tue,  2 Aug 2022 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659466461; x=1691002461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jmCPF5YccJLFFrx1n06ox/Ralagyrf0DUBxapVBSngo=;
 b=lNB33vddNlUpa0abM1fhrRMdWjh0V1rczhSR7ih5aUgdqyYvTtu7BGQP
 JLY32nq6wDBxOzz77FC0aRwLk0yQ1fIThqg2ub4e994XZMeGlYkOCNtrY
 +i78jITemCJRIbZmgAnBDmKoCF+9Ev33l6KdJLy3xTlus8zYz2euHdZzT
 cyzuSLcf0qV2ajq1/vRAHa1PZkMvYwgde1S+UsdnEERMQbKxqLwWrejw0
 UsmN6u40MNKin0gInu5u7A4CbPeW8g2kYwmOwv4RuQSM/CZ+1w4l2HVWN
 BH8PuXjURXlg3+6gVUMkDlYPHvVmpDds7JP/eagSD+Ocgx2wow8mZoPC/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="287054758"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="287054758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 11:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="705491434"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2022 11:54:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 11:54:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 11:54:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 11:54:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 11:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxuWgLi0y28rMq8J05QWDcGeqMXQi3PTcisF4X+aMRXzNQjTq26QIrWk+8ZXVxIEfhjkMY9QVsUfu4vbJGgDoUZx5i/wBf/+rmj3xa7NzIRkBSWvFM3gbBUCU/nupwDrpAXnhZLlyQClWwg3z4V6RvDO0zMV52ZWj2RwcF51K7Fs7jk7sGi9PKDXlAscz/zENT2GOKmPqRHutb2O2Eo1fW/ptYCry9w3kLNbj5HyndDLTDunVHt1MvxQFaEDd1TPwbZETBa8ztZQjbMx4qneoPwfHrLrHF6PurcPM1PuSjz0onJ2gPdZa9IhZO2ox2lHFbw/auSJeACTYrneMd+HTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmCPF5YccJLFFrx1n06ox/Ralagyrf0DUBxapVBSngo=;
 b=TU6/15qDLI40lA8G4GegZQ6INEAdqBpSsRLIqB4brd0wzWzUaXag2RETNbyX9/qQYTlq/fAv5kHZFYcr7l6U037FCUVCNfp/xhYSUFqPuG82njjlBMMtQ/BrEeDPbrbGH8fmLltZMnZgdvsm4LQRjvv9W/m9KK7H6XXoR3evgw4IywsNhqxKiZoQUBOxV73RgyCfXtxv+AEby5oOOjoC3QmCapYAMmcopNuBFEqBf9UyFNkh8kmGEusO9Lk6t6VARwuFLcALAWT3q7wi0vOLwezJGa0E6FzIUXtlGuu97SDShiZRytHzfbxCfxgRTogDrXOb07cvy3wEg2UymTcVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB5470.namprd11.prod.outlook.com (2603:10b6:5:39c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12; Tue, 2 Aug 2022 18:54:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 18:54:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915/guc: Reduce spam from error
 capture
Thread-Topic: [Intel-gfx] [PATCH 7/7] drm/i915/guc: Reduce spam from error
 capture
Thread-Index: AQHYoijhst6jeRekEEmSPnlVxppu562b/oWA
Date: Tue, 2 Aug 2022 18:54:17 +0000
Message-ID: <32398759c5c0e5113b7363128918758b45ff6075.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-8-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-8-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fffb26ac-06b7-48fc-4baa-08da74b86705
x-ms-traffictypediagnostic: DM4PR11MB5470:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHVEi4uunDaN4hOoGCVfn14zMOANpPjFKod1TmoWcMmVBCZARXoJBB2kSYFFfBGF8gUu4HcuSwj5bq/ysuX9w40qnAkqvoXLI+5ERzgKSFI2Gbc99sXi639siyCgjaEj6orUFj3VyI0spDDAdyMELpWK9aX8J743OasNm2grR8CAE9ahjtha3+P060UMX62s/gIVp9n3WMNUo1N2TJItym/bQltqGd82RWduw1+g4PjGWUUv5VTcLPOqh8Kjr7mgyq/g3ELtfo1vSEDCZ53kLebRoRc5L2IO38IMCFEkD2gC6DjMGf4I1hU3Tn0p0Uo9y5n3w/LJ1+iJACqAKqiiME6ARlwc8LXiff0gEC/xk3xjVZ5zyt1TohYgDgVUsNzuil000HeP4BSek5aqeRfkWBA9QlsnO7GVKNKhrkYyouTbMNsIVnWPwtFUSWyb79FaIqJuVFTiLE51VpPMY7apOd+4kZdOfQyi5OhwNXoClwz9vXyCDJISOR/s8erquHGxtLu/B06EcUyUcwtRK40OxGm8hC1RpeoSD5hj5PbIcmam75n9IMFq49jiy5x6WnPade/8wX9GAVUDvxbvnNrKOWcCDlc8a6huPkSx351KDZrxRrcUNntIVjP5qmiCHTM4ehoNIMbySuG1LH62lVGbXVq6Pcy/PBhOAAqkeC7w3fTi0uC691ZDetoJxMdfS59NMeLWGu5G9Rbb8U/d4FZiUj2xP1nXnovePS+ewE/jF1gJ9fYg64obEFD9WDmmFHC49mXGFTLC/RfVmeNuS8O07Jv8+6H8yHd8Kpp8gmYZLyyKKzXdugHmR6hbER1V447kzXm01m5JM6bJxEvylhSm4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(366004)(39860400002)(396003)(376002)(86362001)(83380400001)(26005)(6512007)(6506007)(186003)(2906002)(122000001)(38100700002)(41300700001)(38070700005)(66946007)(316002)(91956017)(76116006)(110136005)(450100002)(6486002)(71200400001)(66556008)(66446008)(82960400001)(64756008)(8676002)(36756003)(2616005)(4326008)(8936002)(478600001)(66476007)(5660300002)(81743001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3pPd1o3QW15TDVtMVJJVjdRamw5NzFqSVNpbkZ5RWVrUVlZZ2x6MzhCNTJk?=
 =?utf-8?B?YWZ6Q29CeHhUZm9xS2JSTVpyUUZoK3FtREI0aW02SUZHa0ZrdTZiZWJhbW1j?=
 =?utf-8?B?dCt5aENvTlpRR2pSYncvYWZtc3JjV0lsZUhKNUUrdTg0bkkzUHczVm91R0pQ?=
 =?utf-8?B?YlFOZFgxLzA1ZlVhVXZKenZYVVN2ZjFBNmZXVjF4YS9kemVKY0hVT1lOY1ND?=
 =?utf-8?B?Y3plRXJjTS9RN1l3ZU1MT2h3VnQvTit3M2l0eUFDZUdJaCtRUENhODFHQ0N4?=
 =?utf-8?B?OXRicHRUL3ptOWZDN3lDaExKS3Zsa3FsTlZtMlNYeVE2dmUyRWxLdkdqUTFN?=
 =?utf-8?B?UVhDVTAzZ21FQ1ZZZjljejlaaGkzTGVGeU9jOTRYTWpEdHM5ZEYzNXl3bFI2?=
 =?utf-8?B?SnVRUW9MLytpOG5jclluRVVuMzVQZzFOcTZzUkFVV0FEVlkvWENFNVlwMGJy?=
 =?utf-8?B?d1F3U3R0NU83dUMrdytVQlB2MlFGMmpiVUJleDYwN2ZiUldIUnlLenUydEdt?=
 =?utf-8?B?OGZpcWZLUGRFWWRPNDZ5UWZCWTZjVFl6bkVpeFQwTUVPOG5RSjJpMXhFTTlT?=
 =?utf-8?B?THBlZURZYXBrMWlUeG4vTjJXNTFsRFVjMllUTG5uaWljWXJ2OTl6eHdCTTMz?=
 =?utf-8?B?OVoybEUyZ2x3endvSStNTlVoR1ZFTGhwekY4ZHl4Ujhwdm5IR29hNjVjUDBm?=
 =?utf-8?B?N0gxMU5uTFhEQUlwOXBrVUNsUm5HMXBmODM2NmNEdGRhNVRSOW5nUWhNZHV5?=
 =?utf-8?B?QmxLOHMyQ3puaEVJampYdWdmRy9BVXlPSU1kTzVHWWtFckZWNnJmTWY2R3B4?=
 =?utf-8?B?b1hpQWtCejVyU2d1SktGRjAvSnFSRSs3dUxqL2lLSFlGcCtNRmh2Q25yR3p0?=
 =?utf-8?B?ZGdaZjBBT2ZJWUVXdUlyZFFJM3lycHVZSkMxdGJ0UHZmR0RvRlRVMGpHS1VB?=
 =?utf-8?B?aUptT0kvVXBrTG9DSkwyMU9yMXhkSVFTODY0WFFsd1ZLakJiaVNKU3RnNEll?=
 =?utf-8?B?Sm45eWI3ZGdORlZISFBSa0RCS0RrQk1VWTNiTGw1M0gyZHBUOUtMMHIvUU5D?=
 =?utf-8?B?Z2ZCa3FRcE04NGszbkhSVEtEMkJPZ3FSNldSS2UzTUdVRVowU3pnMkxLajMz?=
 =?utf-8?B?dWxyMDFNOWRYWlpESjZoeGNscGRFN2hvY2JCUnFCM2NNUEhSTnVxSDRQT3FL?=
 =?utf-8?B?Rjl5aTF5SktKczhLWWhTZlFSdERKSi9ybU9ZZWtHTDdvT25LdmkzcGRGU0J6?=
 =?utf-8?B?WE5nWnduZWwra0dEYzhIU0ZDdUo0amRqN3dvYlNsblFUTkZKbjJVYlcwazVI?=
 =?utf-8?B?bG4xZVc5OVB1TDVTcittWXE5L0VQcDUwa01WWmNqTUN5dWlDdlhtbWNMUnh0?=
 =?utf-8?B?SnpCTTB3b1JMdHhHVy90bkVZYWhJZUUwSTFNdFpHejA5MTlleVhTZ1hNV3hR?=
 =?utf-8?B?eHErckQ0RTE4OWZpWkFHQi9EeWZQemI1cE5ibkxyM1hXRTk5amJqUVJCMktQ?=
 =?utf-8?B?WklRNTE4NUVKN3N3SmFpQjc4ZVdvWFpLUzhTWWhjdzAzQ3hBVGNscERpYWx1?=
 =?utf-8?B?L2NPd1dRR1p5RE50Snc4aDlpdzBVUDhlcVlaeThhekkxKzVBNUtJNmJzZDM0?=
 =?utf-8?B?Sk1HMkpGYjJwWkdyVmxOVjdBSmxsd2x1ZDI1UWorbGlZOVhRR0FGQ3hrSVIw?=
 =?utf-8?B?K3BnbkxpVjZLbFhPMGZQdDBqajFNb0NxZ2RiVFFQcVJwZGQ5OXk5ZTJpZUth?=
 =?utf-8?B?VklkV0xSS1lLeXBWWmQ3bWtZbmFWSU5iMnBiQWIzTHRZeGRmV0pyMG9BOStx?=
 =?utf-8?B?dUdxZCtxSzNFZUJSSnJPU0tLcG11dXZOS3p4ejdLcmhudndtNGllc0VXeGRa?=
 =?utf-8?B?Qi83R0hJNWRDcGhqR1FKT1RGOS9WY1poT3k2Z0duU2d5WURURjlJWnJRMWJH?=
 =?utf-8?B?V3RPNTBxY0h1WnNOeTF4UStMTXExYjNSWmtKYlEyeUdWb2QwU05TVTZGc1Jh?=
 =?utf-8?B?eU5RUGg5ZytXSXBlTWRwdFh5bnNMRzNhUkkrY084T1ZKUHkwV3h6YVU5YUF4?=
 =?utf-8?B?R053dnZSWlB6OGdEa1FWUXNzSTVqQVlURnQrSkhtWU5VZjBIYUVQVFgzSkto?=
 =?utf-8?B?Ymx2WjgvYWtDM2hMaDEycGhSWUdIb01YcFVSSCsrb1NXNVM1T01NbEU1REM2?=
 =?utf-8?Q?dzKzb9RIaHarnZzUjXzvQu8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <673059C152B28C44A1D9028B0069B982@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fffb26ac-06b7-48fc-4baa-08da74b86705
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 18:54:17.7395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYAjXITLkG4fTV6pLlX1Md5tbNbibyp27ts4RvDV69P1s8/kwB8Y27IwzJdd4ANRhIkfeYguojb0I+aclkMvHVTx9cVVKkL6lFMayWrwaG8LdiXlM6R7Q5dNRAxXdISl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5470
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRl
bC5jb20+DQoNCk9uIFdlZCwgMjAyMi0wNy0yNyBhdCAxOToyMCAtMDcwMCwgSm9obi5DLkhhcnJp
c29uQEludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJp
c29uQEludGVsLmNvbT4NCj4gDQo+IFNvbWUgZGVidWcgY29kZSBnb3QgbGVmdCBpbiB3aGVuIHRo
ZSBHdUMgYmFzZWQgcmVnaXN0ZXIgc2F2ZSBmb3IgZXJyb3INCj4gY2FwdHVyZSB3YXMgYWRkZWQu
IFJlbW92ZSB0aGF0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5D
LkhhcnJpc29uQEludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vZ3B1L2RybS9pOTE1L2d0L3VjL2lu
dGVsX2d1Y19jYXB0dXJlLmMgICAgfCA2NyArKysrKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMNCj4gaW5kZXggZDJh
YzUzZDRmM2I2ZS4uOGYxMTY1MTQ2MDEzMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jDQo+IEBAIC0xMzgzLDMzICsxMzgzLDIyIEBA
IGd1Y19jYXB0dXJlX3JlZ190b19zdHIoY29uc3Qgc3RydWN0IGludGVsX2d1YyAqZ3VjLCB1MzIg
b3duZXIsIHUzMiB0eXBlLA0KPiAgCXJldHVybiBOVUxMOw0KPiAgfQ0KPiAgDQo+IC0jaWZkZWYg
Q09ORklHX0RSTV9JOTE1X0RFQlVHX0dVQw0KPiAtI2RlZmluZSBfX291dChhLCAuLi4pIFwNCj4g
LQlkbyB7IFwNCj4gLQkJZHJtX3dhcm4oKCYoYSktPmk5MTUtPmRybSksIF9fVkFfQVJHU19fKTsg
XA0KPiAtCQlpOTE1X2Vycm9yX3ByaW50ZigoYSksIF9fVkFfQVJHU19fKTsgXA0KPiAtCX0gd2hp
bGUgKDApDQo+IC0jZWxzZQ0KPiAtI2RlZmluZSBfX291dChhLCAuLi4pIFwNCj4gLQlpOTE1X2Vy
cm9yX3ByaW50ZihhLCBfX1ZBX0FSR1NfXykNCj4gLSNlbmRpZg0KPiAtDQo+ICAjZGVmaW5lIEdD
QVBfUFJJTlRfSU5URUxfRU5HX0lORk8oZWJ1ZiwgZW5nKSBcDQo+ICAJZG8geyBcDQo+IC0JCV9f
b3V0KGVidWYsICIgICAgaTkxNS1FbmctTmFtZTogJXMgY29tbWFuZCBzdHJlYW1cbiIsIFwNCj4g
LQkJICAgICAgKGVuZyktPm5hbWUpOyBcDQo+IC0JCV9fb3V0KGVidWYsICIgICAgaTkxNS1Fbmct
SW5zdC1DbGFzczogMHglMDJ4XG4iLCAoZW5nKS0+Y2xhc3MpOyBcDQo+IC0JCV9fb3V0KGVidWYs
ICIgICAgaTkxNS1FbmctSW5zdC1JZDogMHglMDJ4XG4iLCAoZW5nKS0+aW5zdGFuY2UpOyBcDQo+
IC0JCV9fb3V0KGVidWYsICIgICAgaTkxNS1FbmctTG9naWNhbE1hc2s6IDB4JTA4eFxuIiwgXA0K
PiAtCQkgICAgICAoZW5nKS0+bG9naWNhbF9tYXNrKTsgXA0KPiArCQlpOTE1X2Vycm9yX3ByaW50
ZihlYnVmLCAiICAgIGk5MTUtRW5nLU5hbWU6ICVzIGNvbW1hbmQgc3RyZWFtXG4iLCBcDQo+ICsJ
CQkJICAoZW5nKS0+bmFtZSk7IFwNCj4gKwkJaTkxNV9lcnJvcl9wcmludGYoZWJ1ZiwgIiAgICBp
OTE1LUVuZy1JbnN0LUNsYXNzOiAweCUwMnhcbiIsIChlbmcpLT5jbGFzcyk7IFwNCj4gKwkJaTkx
NV9lcnJvcl9wcmludGYoZWJ1ZiwgIiAgICBpOTE1LUVuZy1JbnN0LUlkOiAweCUwMnhcbiIsIChl
bmcpLT5pbnN0YW5jZSk7IFwNCj4gKwkJaTkxNV9lcnJvcl9wcmludGYoZWJ1ZiwgIiAgICBpOTE1
LUVuZy1Mb2dpY2FsTWFzazogMHglMDh4XG4iLCBcDQo+ICsJCQkJICAoZW5nKS0+bG9naWNhbF9t
YXNrKTsgXA0KPiAgCX0gd2hpbGUgKDApDQo+ICANCj4gICNkZWZpbmUgR0NBUF9QUklOVF9HVUNf
SU5TVF9JTkZPKGVidWYsIG5vZGUpIFwNCj4gIAlkbyB7IFwNCj4gLQkJX19vdXQoZWJ1ZiwgIiAg
ICBHdUMtRW5naW5lLUluc3QtSWQ6IDB4JTA4eFxuIiwgXA0KPiAtCQkgICAgICAobm9kZSktPmVu
Z19pbnN0KTsgXA0KPiAtCQlfX291dChlYnVmLCAiICAgIEd1Qy1Db250ZXh0LUlkOiAweCUwOHhc
biIsIChub2RlKS0+Z3VjX2lkKTsgXA0KPiAtCQlfX291dChlYnVmLCAiICAgIExSQ0E6IDB4JTA4
eFxuIiwgKG5vZGUpLT5scmNhKTsgXA0KPiArCQlpOTE1X2Vycm9yX3ByaW50ZihlYnVmLCAiICAg
IEd1Qy1FbmdpbmUtSW5zdC1JZDogMHglMDh4XG4iLCBcDQo+ICsJCQkJICAobm9kZSktPmVuZ19p
bnN0KTsgXA0KPiArCQlpOTE1X2Vycm9yX3ByaW50ZihlYnVmLCAiICAgIEd1Qy1Db250ZXh0LUlk
OiAweCUwOHhcbiIsIChub2RlKS0+Z3VjX2lkKTsgXA0KPiArCQlpOTE1X2Vycm9yX3ByaW50Zihl
YnVmLCAiICAgIExSQ0E6IDB4JTA4eFxuIiwgKG5vZGUpLT5scmNhKTsgXA0KPiAgCX0gd2hpbGUg
KDApDQo+ICANCj4gIGludCBpbnRlbF9ndWNfY2FwdHVyZV9wcmludF9lbmdpbmVfbm9kZShzdHJ1
Y3QgZHJtX2k5MTVfZXJyb3Jfc3RhdGVfYnVmICplYnVmLA0KPiBAQCAtMTQ0MSw1NyArMTQzMCw1
NyBAQCBpbnQgaW50ZWxfZ3VjX2NhcHR1cmVfcHJpbnRfZW5naW5lX25vZGUoc3RydWN0IGRybV9p
OTE1X2Vycm9yX3N0YXRlX2J1ZiAqZWJ1ZiwNCj4gIA0KPiAgCWd1YyA9ICZlZS0+ZW5naW5lLT5n
dC0+dWMuZ3VjOw0KPiAgDQo+IC0JX19vdXQoZWJ1ZiwgImdsb2JhbCAtLS0gR3VDIEVycm9yIENh
cHR1cmUgb24gJXMgY29tbWFuZCBzdHJlYW06XG4iLA0KPiAtCSAgICAgIGVlLT5lbmdpbmUtPm5h
bWUpOw0KPiArCWk5MTVfZXJyb3JfcHJpbnRmKGVidWYsICJnbG9iYWwgLS0tIEd1QyBFcnJvciBD
YXB0dXJlIG9uICVzIGNvbW1hbmQgc3RyZWFtOlxuIiwNCj4gKwkJCSAgZWUtPmVuZ2luZS0+bmFt
ZSk7DQo+ICANCj4gIAlub2RlID0gZWUtPmd1Y19jYXB0dXJlX25vZGU7DQo+ICAJaWYgKCFub2Rl
KSB7DQo+IC0JCV9fb3V0KGVidWYsICIgIE5vIG1hdGNoaW5nIGVlLW5vZGVcbiIpOw0KPiArCQlp
OTE1X2Vycm9yX3ByaW50ZihlYnVmLCAiICBObyBtYXRjaGluZyBlZS1ub2RlXG4iKTsNCj4gIAkJ
cmV0dXJuIDA7DQo+ICAJfQ0KPiAgDQo+IC0JX19vdXQoZWJ1ZiwgIkNvdmVyYWdlOiAgJXNcbiIs
IGdycHR5cGVbbm9kZS0+aXNfcGFydGlhbF0pOw0KPiArCWk5MTVfZXJyb3JfcHJpbnRmKGVidWYs
ICJDb3ZlcmFnZTogICVzXG4iLCBncnB0eXBlW25vZGUtPmlzX3BhcnRpYWxdKTsNCj4gIA0KPiAg
CWZvciAoaSA9IEdVQ19DQVBUVVJFX0xJU1RfVFlQRV9HTE9CQUw7IGkgPCBHVUNfQ0FQVFVSRV9M
SVNUX1RZUEVfTUFYOyArK2kpIHsNCj4gLQkJX19vdXQoZWJ1ZiwgIiAgUmVnTGlzdFR5cGU6ICVz
XG4iLA0KPiAtCQkgICAgICBkYXRhdHlwZVtpICUgR1VDX0NBUFRVUkVfTElTVF9UWVBFX01BWF0p
Ow0KPiAtCQlfX291dChlYnVmLCAiICAgIE93bmVyLUlkOiAlZFxuIiwgbm9kZS0+cmVnaW5mb1tp
XS52ZmlkKTsNCj4gKwkJaTkxNV9lcnJvcl9wcmludGYoZWJ1ZiwgIiAgUmVnTGlzdFR5cGU6ICVz
XG4iLA0KPiArCQkJCSAgZGF0YXR5cGVbaSAlIEdVQ19DQVBUVVJFX0xJU1RfVFlQRV9NQVhdKTsN
Cj4gKwkJaTkxNV9lcnJvcl9wcmludGYoZWJ1ZiwgIiAgICBPd25lci1JZDogJWRcbiIsIG5vZGUt
PnJlZ2luZm9baV0udmZpZCk7DQo+ICANCj4gIAkJc3dpdGNoIChpKSB7DQo+ICAJCWNhc2UgR1VD
X0NBUFRVUkVfTElTVF9UWVBFX0dMT0JBTDoNCj4gIAkJZGVmYXVsdDoNCj4gIAkJCWJyZWFrOw0K
PiAgCQljYXNlIEdVQ19DQVBUVVJFX0xJU1RfVFlQRV9FTkdJTkVfQ0xBU1M6DQo+IC0JCQlfX291
dChlYnVmLCAiICAgIEd1Qy1FbmctQ2xhc3M6ICVkXG4iLCBub2RlLT5lbmdfY2xhc3MpOw0KPiAt
CQkJX19vdXQoZWJ1ZiwgIiAgICBpOTE1LUVuZy1DbGFzczogJWRcbiIsDQo+IC0JCQkgICAgICBn
dWNfY2xhc3NfdG9fZW5naW5lX2NsYXNzKG5vZGUtPmVuZ19jbGFzcykpOw0KPiArCQkJaTkxNV9l
cnJvcl9wcmludGYoZWJ1ZiwgIiAgICBHdUMtRW5nLUNsYXNzOiAlZFxuIiwgbm9kZS0+ZW5nX2Ns
YXNzKTsNCj4gKwkJCWk5MTVfZXJyb3JfcHJpbnRmKGVidWYsICIgICAgaTkxNS1FbmctQ2xhc3M6
ICVkXG4iLA0KPiArCQkJCQkgIGd1Y19jbGFzc190b19lbmdpbmVfY2xhc3Mobm9kZS0+ZW5nX2Ns
YXNzKSk7DQo+ICAJCQlicmVhazsNCj4gIAkJY2FzZSBHVUNfQ0FQVFVSRV9MSVNUX1RZUEVfRU5H
SU5FX0lOU1RBTkNFOg0KPiAgCQkJZW5nID0gaW50ZWxfZ3VjX2xvb2t1cF9lbmdpbmUoZ3VjLCBu
b2RlLT5lbmdfY2xhc3MsIG5vZGUtPmVuZ19pbnN0KTsNCj4gIAkJCWlmIChlbmcpDQo+ICAJCQkJ
R0NBUF9QUklOVF9JTlRFTF9FTkdfSU5GTyhlYnVmLCBlbmcpOw0KPiAgCQkJZWxzZQ0KPiAtCQkJ
CV9fb3V0KGVidWYsICIgICAgaTkxNS1FbmctTG9va3VwIEZhaWwhXG4iKTsNCj4gKwkJCQlpOTE1
X2Vycm9yX3ByaW50ZihlYnVmLCAiICAgIGk5MTUtRW5nLUxvb2t1cCBGYWlsIVxuIik7DQo+ICAJ
CQlHQ0FQX1BSSU5UX0dVQ19JTlNUX0lORk8oZWJ1Ziwgbm9kZSk7DQo+ICAJCQlicmVhazsNCj4g
IAkJfQ0KPiAgDQo+ICAJCW51bXJlZ3MgPSBub2RlLT5yZWdpbmZvW2ldLm51bV9yZWdzOw0KPiAt
CQlfX291dChlYnVmLCAiICAgIE51bVJlZ3M6ICVkXG4iLCBudW1yZWdzKTsNCj4gKwkJaTkxNV9l
cnJvcl9wcmludGYoZWJ1ZiwgIiAgICBOdW1SZWdzOiAlZFxuIiwgbnVtcmVncyk7DQo+ICAJCWog
PSAwOw0KPiAgCQl3aGlsZSAobnVtcmVncy0tKSB7DQo+ICAJCQlyZWdzID0gbm9kZS0+cmVnaW5m
b1tpXS5yZWdzOw0KPiAgCQkJc3RyID0gZ3VjX2NhcHR1cmVfcmVnX3RvX3N0cihndWMsIEdVQ19D
QVBUVVJFX0xJU1RfSU5ERVhfUEYsIGksDQo+ICAJCQkJCQkgICAgIG5vZGUtPmVuZ19jbGFzcywg
MCwgcmVnc1tqXS5vZmZzZXQsICZpc19leHQpOw0KPiAgCQkJaWYgKCFzdHIpDQo+IC0JCQkJX19v
dXQoZWJ1ZiwgIiAgICAgIFJFRy0weCUwOHgiLCByZWdzW2pdLm9mZnNldCk7DQo+ICsJCQkJaTkx
NV9lcnJvcl9wcmludGYoZWJ1ZiwgIiAgICAgIFJFRy0weCUwOHgiLCByZWdzW2pdLm9mZnNldCk7
DQo+ICAJCQllbHNlDQo+IC0JCQkJX19vdXQoZWJ1ZiwgIiAgICAgICVzIiwgc3RyKTsNCj4gKwkJ
CQlpOTE1X2Vycm9yX3ByaW50ZihlYnVmLCAiICAgICAgJXMiLCBzdHIpOw0KPiAgCQkJaWYgKGlz
X2V4dCkNCj4gLQkJCQlfX291dChlYnVmLCAiWyVsZF1bJWxkXSIsDQo+IC0JCQkJICAgICAgRklF
TERfR0VUKEdVQ19SRUdTRVRfU1RFRVJJTkdfR1JPVVAsIHJlZ3Nbal0uZmxhZ3MpLA0KPiAtCQkJ
CSAgICAgIEZJRUxEX0dFVChHVUNfUkVHU0VUX1NURUVSSU5HX0lOU1RBTkNFLCByZWdzW2pdLmZs
YWdzKSk7DQo+IC0JCQlfX291dChlYnVmLCAiOiAgMHglMDh4XG4iLCByZWdzW2pdLnZhbHVlKTsN
Cj4gKwkJCQlpOTE1X2Vycm9yX3ByaW50ZihlYnVmLCAiWyVsZF1bJWxkXSIsDQo+ICsJCQkJCUZJ
RUxEX0dFVChHVUNfUkVHU0VUX1NURUVSSU5HX0dST1VQLCByZWdzW2pdLmZsYWdzKSwNCj4gKwkJ
CQkJRklFTERfR0VUKEdVQ19SRUdTRVRfU1RFRVJJTkdfSU5TVEFOQ0UsIHJlZ3Nbal0uZmxhZ3Mp
KTsNCj4gKwkJCWk5MTVfZXJyb3JfcHJpbnRmKGVidWYsICI6ICAweCUwOHhcbiIsIHJlZ3Nbal0u
dmFsdWUpOw0KPiAgCQkJKytqOw0KPiAgCQl9DQo+ICAJfQ0KPiAtLSANCj4gMi4zNy4xDQo+IA0K
DQo=
