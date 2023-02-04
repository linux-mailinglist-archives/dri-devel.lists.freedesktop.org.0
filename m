Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3168A8EF
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 09:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9797110E9B6;
	Sat,  4 Feb 2023 08:19:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5D810E9B6;
 Sat,  4 Feb 2023 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675498784; x=1707034784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=v5tkoNneUgX46hcpQ/crYDdmfIbcZ4fZiMxkHlYwbWg=;
 b=h+0la6/2myoIXMtPopZhDh51CQwfcdxipYkvi2JnDFzrIqHqNLOEKTmy
 +cZv6JIAvla5+GLDwzRAliSfHg1VbtaVgMTl80MpbLnKUwnUoBpFZ6pwk
 QB+zu6G7H91z+Ra2BXLbKt2ZwxKiAcgps0My3mWNTifhPWEsiSfmGGVlM
 jdiExd388vYuxHVn7pPx2t09lK831Sc8h8tZK3es6cCMeDWpF3EPJCj8J
 LEaYqdms7rZ2nfHnyJJUlqpmM0Kd2NW52JY9svMlzbPhs3IY6X1thAZS7
 CeAT0jDKz7qnl0oiBqKUa5qojTLJWQCuMnHTwiHfm/bQt+z0XQqOZZ7W8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415142167"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="415142167"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2023 00:19:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="667888640"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="667888640"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2023 00:19:43 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 4 Feb 2023 00:19:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 4 Feb 2023 00:19:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 4 Feb 2023 00:19:43 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 4 Feb 2023 00:19:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA6eErbwwAOBma6s5xwyI8kpLvsnzrwDuIkLhDFJVtAGRI4JX7d+lb62Z2WYNqWcWbNBYSQinCy3IyVaEOtKYEFHtKuBeQNCIQqToqiEyAqCkqBhSsB++s4ZW7goTPgOxweENgs2q2HUY5fEjuio8kzLRacY0ADmxkcX15KplZk0CNpcFgnShj8RR+PPB9uPwhKtlodN8CL83yxzjxRD3eWVg3JjeOozq0jj75/e+a/jsW12TmBQ/pNhYsmYd/onOdiTrGxITeel5/X/p2yoSfTF4Am23NBCqthFK1URrKE+lwIv2OWt/0az1nZ7vopoD0DISQsEVwTvdwWUWDTBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5tkoNneUgX46hcpQ/crYDdmfIbcZ4fZiMxkHlYwbWg=;
 b=ZDh33NqAWhonSUGsRlLgKQVl7KYTzmE5+EGw3sBrOXjUvJxEI+z4WpaLaMciAF8XTuGdpSTtdRNUFspjf6djiuzSBIIQNA21TkH2ZerwxJVXIyWZCK/kwvsZDqWG+hCxCIxXm/hxl9X2HTDh3OJ0iMLDG8Nbok6j8l9aoiR2Mef5yF4wGAsnGJPup1+3btuxSLVvH6ehw6e50ZRmOqSqdnWAC6DXPCLEi07whP3HpKllbrFGduPyYX2+b6YI6MqEYsnik33jPbiKrH4GHsJBoM9M1GQZacHMQgyS83vHI1P98uRAe6FG2pOyzCxzr6WFNd0Gq1AN/YeCRcZkr5i9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Sat, 4 Feb
 2023 08:19:40 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::17f6:2dff:ce11:ff0d]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::17f6:2dff:ce11:ff0d%9]) with mapi id 15.20.6064.027; Sat, 4 Feb 2023
 08:19:40 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915/guc: More debug print updates -
 GuC reg capture
Thread-Topic: [Intel-gfx] [PATCH 3/6] drm/i915/guc: More debug print updates -
 GuC reg capture
Thread-Index: AQHZN2QqhF4KT/PyBUeo0aqCiwVQ0K6+dA6A
Date: Sat, 4 Feb 2023 08:19:39 +0000
Message-ID: <2436cd1682d0dc3d36900e6f2114d0ffcb823acb.camel@intel.com>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
 <20230203001143.3323433-4-John.C.Harrison@Intel.com>
In-Reply-To: <20230203001143.3323433-4-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|PH0PR11MB5127:EE_
x-ms-office365-filtering-correlation-id: 4c877817-56ff-47da-6a4f-08db06888f7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFb2ub8nrkugq35WJieZCaSSVlNS9hMzdxVpHqPLQY70ATbOzTyFXH9Hiju75QHibm49x4CKjIZX4nxgRLt9HXLLvI5fvFtsNB10sFu3FIsMfoqEMIGYDDrDd45XqvTsxZ2IbbEfXQGaE8sON47okiWGfx7rFMbCRO2nDOSOaenJN8Iw8p01Du6Y0QPZaHsOAjEc8NFMBToSmvDv0//Lry4K+7ymxpa4OrCCIxXRgty7mn8GUtNTBRCdzBeJb7nOMLUptwQ2r8/agjgb9tT1Z3/RNYUdfPcNTOSR8yKOlfnvBRjGY4uNC9Ve6Y6ItuaqiWBOxd+pB/Yy2/doBLpJw4PcO3tiV+vlzzh0OPL++OdXT5QePIiWR4qoGnz34mUfAMIoN3voNsbOoUgHJddtFsrFN9H1ueDyr92+rtu6sqoq5sqe6H0UaBZk45eww/XU60L8ABHQmjzWH5cMt2j08kSi4ZAIwWB3m04Cukycw4RXs/pnknKLxws5tdUGjvcQQp5Z/TLZYC5SHce8Dqj9LRJDVaBuqKe+hFExIBAkWGDm1rgYxgIAiAibsPXC+rmJJojN0ApYPgTRpK2839pKzp7lmqJf2JXeGPbS/Yo7wTF/4orL+x16OafYn8/Qrek9zuAJKwe5+XiuRwyUcpLlLKX3lshAaRjxWJjArmgcYrZNgcN59qnuKO9V/HT6qBaPzTd9y5UA2eM1STo0ETKx5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199018)(2616005)(122000001)(38100700002)(15650500001)(5660300002)(110136005)(316002)(82960400001)(83380400001)(38070700005)(36756003)(86362001)(71200400001)(2906002)(186003)(26005)(6512007)(478600001)(4744005)(6486002)(66476007)(66556008)(64756008)(66446008)(450100002)(4326008)(91956017)(76116006)(6506007)(41300700001)(8676002)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QU9tSjdQT3ZCN2t4MlQvSEVOcFU1cXFwOE9XQ2RJMm1rRmcwOTlVdE91N1Nn?=
 =?utf-8?B?dFBiY3JyTnRBeVNSRm4vQjJpaGhxajlIUjdxT0JrdWhlN1hDeDRHZW8rNm05?=
 =?utf-8?B?ekhCcnBiYnFXbE95TXM4d3JDRjF2a1ZaWTA5ZitjVHZINnFMNUFtV3VDcktj?=
 =?utf-8?B?NlNKc3h0UTBQYkVlVEJ6TERxVnRFRUsxYW9wTXdkTXhhWjVxZDduTHowTGd6?=
 =?utf-8?B?SDVyYnhJUXY3Y2NpdnRpSEpKRTl5UnJNZjB6QVFtek9VL2R0VCtmb1F2aGxS?=
 =?utf-8?B?Kzl6WUxXcFFqWXJNSXpPWDJzaS95SktLR3dMd1RvSWtMaWhaYUhLWFVlb01N?=
 =?utf-8?B?YmFWVGF6N0VaYzR0dHJ6T3ByQ2dnNk1OdkFXY1FCcnhsc3I2RkNyYkNKVWFJ?=
 =?utf-8?B?dktsR2NiRk1oTlVSQkxKdEJYcUZ1dVdNaUlxMWRlMUxZZHRNcHlXUm54T3BD?=
 =?utf-8?B?S0F6QmErNUp6bjk5ZmYyaEJheEVDSnZHdCt3aWpRRDZndFZ3ODNteldkcHkw?=
 =?utf-8?B?ZkFhVUVJTWdqT3BGV3AzUUN3cXVDZmVJQ1hGZFdOcWVvRVZkZW9mWGIvOU83?=
 =?utf-8?B?aFZqU0lBR3BoYWVadUFzclhMQ2Q3TUkxUXBFOE5JeSs4eWxGYUVPa29LQUNF?=
 =?utf-8?B?TXJtMUxsS0c2Sk1ndnpRbjh2VmV2TmhkWnBaUVl4NGdVZEpOMUJwNnB6TlhN?=
 =?utf-8?B?M2piYWdZMUhiY09oS2w1Z0UzVFpROEVVN1dQTm5Cb0ttVEpjNmx4SXU5U0tF?=
 =?utf-8?B?ZXFJSE5nWWpUSktrcE01NUJQOURtYTdLc2hjZGM5ZVoxY2RhQnpyNC9USXNv?=
 =?utf-8?B?ZWdZWEU5MVR4d2dmYjhTb3lxYitpUDJBUzZNUGF4VTVpeVRGOThqdHREcGt5?=
 =?utf-8?B?cVlNUzFFanJvTnJwRVpVaFRmQlIwbGdJdHloZDBmS3BtNTYrV1oyd1JMckY3?=
 =?utf-8?B?SzBrM1VLOUNpUC9HV01hdng5dDljV0lRNVFlTkxzRG54QzZBZi9DRnRDSmhr?=
 =?utf-8?B?d2JZWXNUdVJQa3BzNXFSeFhkLyt1UmtxRVUwam9NWnJ1NVJNWUZaUExZNmht?=
 =?utf-8?B?VWxTSGFNdFh5YW9Dcjl4U1VpNFB5TVFzWVkwb0FtRTcvZFo4MmhROUc1eXdl?=
 =?utf-8?B?RGZ3MDhISGZxYmpZK1k2MEpVR0xtODRUL0ZaZ3RkeUtPb3FVaVJhajJZQTVs?=
 =?utf-8?B?YXFsZXhVTVlZUkJTaExiL1dSdU1GWVFLZEtkbWp1VSs4V0IwT0FHZ1ZmYlpt?=
 =?utf-8?B?VHFzb0tNRkcvWlZBOWc3YnpyWDhXTEhQeG5ZZFdjaGtTQ1A2bXdUdmMyZ21H?=
 =?utf-8?B?U1dTSzFWaldOQk9uaXB5cHZlY3RxUDgzT2VDY2tpYmtjWFFSVExPalZ3SnZy?=
 =?utf-8?B?V2JoTTZrdVFucWVFeVhYKzhsSzdtNktFa0tWNlpwMDlyTFhBODU5YzIvLy9k?=
 =?utf-8?B?NkFLVkRIanMycHNtV24vVExkMysydld1Qy9SalNUVHJWYXBkYUVIYmJKZXE5?=
 =?utf-8?B?RmJvdHpEdWxMbjlBUCtPd1FxMFB2UXRvMHRWM3VsOG1RVHJZRnZmZHRac3ZP?=
 =?utf-8?B?WW02SEhaNWhuanN3dEZUbjVLN1hMVVZHS0tFSE9VYlJnWWlCL1RrZEVkUVpE?=
 =?utf-8?B?aGVvd1JpY2hKRlBteklicU01aXBnZFloWXNGdHFMTTUzSkpCNE93MXh0cFhH?=
 =?utf-8?B?NVQzanVRblBjL3IxNDlqN2NSb2pvUFJ3RlNHS0VGZi9TdFVOa2dhZkdRR0Y4?=
 =?utf-8?B?VTBsd05ncDBCZHJON1d6aXVBS1JLekxieFYxc29GU2NybWJvdkVBazVIdm9v?=
 =?utf-8?B?b3FBSTcwbUNYSnpDazhTNDZjVUVyZUVjcUFLVno0di9GeUFFanJLUGNkTFdo?=
 =?utf-8?B?OFZDc0tDNEVzcHdTRXlUaEV0NllGcUgvalpJQUw5SGh3Rkc2UUdZT3plL1Jv?=
 =?utf-8?B?TVRNMFU1Tzd5WDc1ckV0REg0OVJ1OXA4Z1B1dmdXaG5FTFQ0UkduREVhcGRs?=
 =?utf-8?B?bnI4RVQ2eFUyRk1DZUQ1QjhweVJ1ZzQvMW5uL0l0R09INmFTdGF3THcrSWRp?=
 =?utf-8?B?ckxqb1NKUldjYjhub0E2VjlIMjlMZW0vSmRtWFN3a2FiRXBmMm90T050UTI0?=
 =?utf-8?B?dWxjRDZtTGhpS1BaeFMrY010eVV2ZlFVSjFWSzBjRUFvbkRKN0VaT1hjOFY5?=
 =?utf-8?Q?cw8H9T0Lz5m7fLFKnVQLIhk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <457D88AE95509347B90C1A2CA145A9AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c877817-56ff-47da-6a4f-08db06888f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2023 08:19:39.5399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmx7jQnltOKv5VFLRp+pTdxAKdRIjO3i61y+IxzAI62OVAW1NzDfK9pgA+HTFqRfUiHUoIRD3tgSpUnMBSWjcfQI50HRnX6WooTbmRXnN1g3Oi6lYqN0mVEbYQQY4REu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
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

U28gaSBkbyBoYXZlIG9uZSByZXF1ZXN0IC0gYnV0IGl0cyBhIG5pdCAtIGZvciB0aGUgZm9sbG93
aW5nIGNhc2UsIHNob3VsZCBpdCBiZSBhIGd1Y193YXJuIGluc3RlYWQgb2YgYSBndWNfZGJnPw0K
KGxhc3QgaHVuayBpbiB0aGlzIHBhdGNoKQ0KCSJObyByZWdpc3RlciBjYXB0dXJlIG5vZGUgZm91
bmQgZm9yIDB4JTA0WCAvIDB4JTA4WFxuIiwNCgljZS0+Z3VjX2lkLmlkLCBjZS0+bHJjLmxyY2Ep
OyINCg0KT3RoZXJ3aXNlIExHVE0sDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJl
dmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCk9uIFRodSwgMjAyMy0wMi0wMiBhdCAxNjox
MSAtMDgwMCwgSm9obi5DLkhhcnJpc29uQEludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogSm9obiBI
YXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gDQo+IFVwZGF0ZSBhIGJ1bmNo
IG1vcmUgZGVidWcgcHJpbnRzIHRvIHVzZSB0aGUgbmV3IEdUIGJhc2VkIHNjaGVtZS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+
DQo+IC0tLQ0KPiAgLi4uL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jICAg
IHwgNTEgKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jDQo+IGluZGV4IGZjM2I5OTQ2MjZhNGYuLjVmNmUzNTk0
ZGRhNjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1
Y19jYXB0dXJlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3Vj
X2NhcHR1cmUuYw0KPiBAQCAtMTUsNiArMTUsNyBAQA0KDQphbGFuOnNuaXANCg==
