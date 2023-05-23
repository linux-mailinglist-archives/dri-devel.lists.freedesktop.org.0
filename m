Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A09170CEEB
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 02:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A2210E2E6;
	Tue, 23 May 2023 00:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAAB10E2D7;
 Tue, 23 May 2023 00:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684800848; x=1716336848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HQoiu0gL+dRX52vhvrI+9jZcGcEklZ8dMxoJs/3pg0w=;
 b=CJniYw00l6eE0TK6DDFwdLwfLEbNob93YiYqtTi9sWnWDcdFc5SPeLfC
 N5L4H46d/NFMg3N9/siHa3SIl2TcxpCnvWMe5ED7ecv5ZqA30QuqyFium
 eIaINl53956ppv3hFjU57uJn7Ljg9zgEh3ZBhnBBpgUXd0Wtb4bxX0Q1T
 wHOmO/ZAMq3PybqLOvgr9SO+HTM7+7nO0xpg+wZHsPqg+jVdd1ud05Xhd
 tRWpKYtDjzdr1BwZn32GlfTVSlhFJQ4QyL9i9I/uzasWxoKIhT5tmfyfJ
 TPHQZi6n2LVFDl0jCYsFUuzYxtOttBwwda7nQVSVkfyLdYxjnUeL0RRW8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418786201"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="418786201"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 17:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="736626977"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="736626977"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 22 May 2023 17:13:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 17:13:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 17:13:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 17:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs4hpqq89kB1CI1yTiFgQ4VZm91LofSZUGdSFpg5buifML0x/Y5KnMhjtIvMI6Ii7/IpU6q1Bl9wrbnsJv1JjjpHEQ5eUtCRMlKXZj3InrUt2NkoX4TnPmoEUxwjGWbif1gFPrxwjEkRsEeT/9Xj2YpM0cxVwlWaAl0OlCilVosiT8t+eb5Ap4S90qChseNqB+S9LsrETyZ1DV/TyZWFN7QsxLAABNynBHbOWjh3+hi47p6LZR9ritwQHZE04Uoisa/TgrzFtrZUFl1o+JGHssPCEbS+CPuV+ht8vk2Wu+GsAu2S8Ia4TNjgaGzqngaap1lU920obTauH6FPUUklDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQoiu0gL+dRX52vhvrI+9jZcGcEklZ8dMxoJs/3pg0w=;
 b=Z7O0+6a12mg+WnlIdetVr24Lq0CiSAl4cYWpo2O2vZlPfGWX14EynjQdcRdMy9YPSTN0NC93kv+3p4P7v/OXE1KNB07DLTszteeLE/dtAn+R3icmN9Q7IgTWgUgm31CAVKXd6VxKDW1XabXfjPOjFTug/V/s5CG1ifA0N1gOJE2wcbS57qYFszwJIX++P+NCLjXtUx2dmlY+Ghd8ZVWOqa0D6AwxnRE/rIuUvz1cOR/viSF5CAmqSdFziNAVU5YU2qAe2OfZnrRsdOGAZIavmOaVXfFfTnHEDt3noup8nRhmSDvBSOn5X7gKwaMazVnU4B/6uOBmSLqEn1n3ctUvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:13:50 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::d2f3:eff2:6b57:be21]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::d2f3:eff2:6b57:be21%5]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:13:50 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/i915/uc/gsc: fixes and updates for GSC memory
 allocation
Thread-Topic: [PATCH 2/6] drm/i915/uc/gsc: fixes and updates for GSC memory
 allocation
Thread-Index: AQHZf2tKJVttuq6OLk6EO4uhdG+8Jq9nGA0A
Date: Tue, 23 May 2023 00:13:50 +0000
Message-ID: <dc45dc7e07ebbbf5a0e40831ba44c206d86cc93a.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230505160415.889525-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|PH7PR11MB5863:EE_
x-ms-office365-filtering-correlation-id: 58e8caf5-680c-41de-6034-08db5b2295cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LowwWw4Ew4gsURamXeVteFTShXug1e/8znZRRWDB4Ot2YXoQpL0g/3IojLALvj5Fgs0GWPXR38E0iMw3xmThudsnee92qPWuSUu8ALMpcO/UvXFvi9vVUoH4EgbYDrvQ/WOsrbLxMAW9fT/ZVqWA05Xn2PIOkjNHku1NMPVskztGn97JpICdcR02dUijG81Fm36zGtfj7fvEVf/sfidoFKP5NKOmHC9xOcBFk+V0Q2v2AXszwCX9vh/a+q+dc+aKpu0Nc5GVi/1q5c5q86IB+e15/PARQi0G+iV2/PFTSfTAEwKIm1VVOuubOjLyl4SJc3g33pSIopb8Oby20TZ1xliBf3lypJ8v8Pn1SPm4peDTCw0VWLjg3VG5sBPRGToyBafdaky7RPyIDBl5GfTbnYopNRoPRRNLsv99leHKKd8tYfFu0RtABuDrO1o17Bl5UhXUGZVvl1ZtC+UdBbJtvFnHGalVWkajdIKpYCEvK3STAFbegSANeP6G2O1ozvI7P3yeu+hsgjKbTaQo28ypm6UJuwpt6KvrYjjBLiZ7Tr3Jj1iR+STv6OLwjbGfEb5DhnQih7gVNfUS1sZwr0FVvE6V1LBpKfzPAeTPnOlo+oiaVo4JmgQuka677J5W/9qF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(450100002)(66946007)(91956017)(76116006)(66556008)(64756008)(4326008)(66476007)(66446008)(6512007)(6506007)(26005)(15650500001)(71200400001)(54906003)(478600001)(6486002)(41300700001)(316002)(110136005)(8676002)(8936002)(5660300002)(107886003)(86362001)(2906002)(83380400001)(122000001)(38070700005)(38100700002)(186003)(2616005)(82960400001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUlPeUlrV2I4bG5XU3pidjNRRzV0Ui9WY29DVzRNRE9NN0piTVppeHM5SlY4?=
 =?utf-8?B?QzBiTVRKMWpSQ0lMdmZzaVJLbnc0WjJseU4yaDRLVlZUVnd4OEl0cTNWeWJ2?=
 =?utf-8?B?OXdIQ0Q1NiszYSt4VEdwd2RwQk9WdEhxUFAzZ2VEdzZVUW1VTndBaFIxdjN0?=
 =?utf-8?B?RHcyV2l2RFRSNG1EYnVraWRsSUI1eENtVWVmVTgyek1PUTZUT01nNXBoMG5X?=
 =?utf-8?B?RXBCUzhKUUpoaWl2Nm5Id3lkbHFOTXNSeWRtRCtkMFA0VE5oVVpHczl3S3pV?=
 =?utf-8?B?TkEvcEMrcFZtNC9SbnQzRGVnQzdyNjZyWlp0ZWhZRU1jSTRHV1diME1qRk9C?=
 =?utf-8?B?cFBpQjhxSDh5dHY5b1FpOVBrS3ZkbzBjNi94eE41R1FTb0xKWkloQkZQbndW?=
 =?utf-8?B?LzBOZXFRRmExZDlyQ3lzeTN1b0RoZC90TzlUejVDcVhpSFZkMGRBcEZXVStD?=
 =?utf-8?B?OXladG9tZzVndnk1d3YxRHJGU1doc1o2bUdTZVNrRFIySXdMY0U2R0lHYnZ6?=
 =?utf-8?B?S2EyQXBzVHcvaU50YjBjbnJUWFZZMm9YVFJBaEUwNjZ5QTJ1VlZHUEs5Skg1?=
 =?utf-8?B?V2FYWW02YnJJTjZRTVhmbUJMZG1ZRXBZdkZZSndwdzRyQ28zMm9sSGhkdjdr?=
 =?utf-8?B?U0d3c2plUGJncklmcENQVmxOU1ppWC90aVVQckxpeTFxV2hEV0p3M21SaFNV?=
 =?utf-8?B?bElvd1BJRHBPdDczcDFSemlyRi9PM2EwVXdwUXVuYzloZk5JdjMyYjhRc3pB?=
 =?utf-8?B?OGJqRVh0eEw2dklHTmQxU3AyeGxTZ2l3YWdtTFgwdkl0eTlwT0pXQU83VUdP?=
 =?utf-8?B?ckNpck9MM0FoUnRhbnppZmxwWGFSS2JUb05iRWg5S004VTJsRytiaTJWRTI4?=
 =?utf-8?B?am5XTlpneHNOS3kvdDVoMllzTVFyQ3JoN1BLYzV1Uk1ybVBIVXZxNmxGUnM5?=
 =?utf-8?B?VmpLamNmaDJIMzFrdU9jY1owa2tRd21CWDI3UzBrUW01ZDNvQ1RUVTdhWWpr?=
 =?utf-8?B?SE0xQXpIV2ZPZXYrU0gvMVY2cjRpRmFHVG5TTk5XT05qbm9nSWVnK3FiYlpC?=
 =?utf-8?B?YXcvbXpOaHl0cng1SjNyR2lYeURKL1ZYYTRLL0JiMnFHcCtOV1I3NkJnRXRX?=
 =?utf-8?B?bmlzVmN1SHVuMjlnbWVEVnFlN2NEUkVCRTN0TlIyTUY1Rlk1czFFb1RpR2l5?=
 =?utf-8?B?Und6elhDY3k1d1h3QmRweVNLbURVS3pXMzNMSlkzbDRETmVNdHpsQXpLUGgz?=
 =?utf-8?B?alBzWnEzN1EzcXExeDRPc2ZiNWlxamRLQ0VhUFkySGo0TWI0eHJxb0g0SzZS?=
 =?utf-8?B?THNGUnNMRzIrM0F6K0dMdG9RV2I3NTlxWmo3MGp0ZDg4VEVCMkJ6d1FVNU9F?=
 =?utf-8?B?WlQxQkNmcmVrbnphVmkvbG9hSnYzMFE1a0EwNlFWNWJhVVhnVFNzRlVtc1lK?=
 =?utf-8?B?TGFIRnZVUHBWc24yZjBXUEdnRDA0b2NDemc1OFZSSnVTSWZUMEJEWW45M01N?=
 =?utf-8?B?QjJ5K3lZc3M0T2RsWUo5YmtmbkFMUWlVUzdNamdCeVJkd0VRNWM2bDUwTmtC?=
 =?utf-8?B?QkhhNkpLRGJjMCtuNyszdEV6ZXh6UkFSYmJqd1VLam5DdlRXQThGaXAvNUhu?=
 =?utf-8?B?MHluSzhGekEraXREQ29tUHpTVVpxVlBudlBqcWZsY2NKNzRXQXlleVQ5VUxl?=
 =?utf-8?B?WU5iNUZEa3d5bTZKQjV1R1dJZnpDajhGTmR4WjVQNTQ0aklnWTVQZUJwSWR6?=
 =?utf-8?B?aG5idDNtQzZ6ejlISWRQSXJCWHlrZTFjQUpmWXloSGxIeW8yZHd4WXkzcnox?=
 =?utf-8?B?Z3kzYnZCTGV4Vk5NOGF5c1FRWHg2T0phVEZpdTVIMDlDekNCcjNWQXYwdkZs?=
 =?utf-8?B?MVVpZjIvSkJqYUdEVi9OMHdrWGxpR2YyMHBOMDFXUEZ3cThuMzlEd1NoZUZM?=
 =?utf-8?B?T1lPQU5NSEdBMU9BdFB4ZTVIZDNDOUxDVzhpMFZhcUFlQWRtQThkVUYxSEUz?=
 =?utf-8?B?WnNTY2NGaXRncnlieTYrOTRacGwrWXdrK0tqWmxmK0l3eFFEVVZ0V1BYbTB1?=
 =?utf-8?B?SHoxMHd6N2ZvMU9EZmVhazZEQWRHWnJzT1VnVTRoeVhsZUNVZXdwNzVmOEV4?=
 =?utf-8?B?RnRHdFdQUmdsMWlkYVE3YU14ZVc3MFByTU5YQnpwbG5QejNCdVMxVWo2SEsw?=
 =?utf-8?Q?js8Rrw2mRd21Vencb5k5PKQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA2004380ECD0469F80E551556FAB81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e8caf5-680c-41de-6034-08db5b2295cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:13:50.3333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PhWd34QYW4+yk1NGSioS0RVRpA6e+EFi+MkFC4Wm+OkOlUHVuOMxzFBicxgq/PW4nzK5XQu+ZbaA42Mp4tbxh/prl+MxV84oDhLEokmSSZjPIBTMLX4pHlMfnvcD/hr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5863
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDA5OjA0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gQSBmZXcgZml4ZXMvdXBkYXRlcyBhcmUgcmVxdWlyZWQgYXJvdW5kIHRoZSBH
U0MgbWVtb3J5IGFsbG9jYXRpb24gYW5kIGl0DQo+IGlzIGVhc2llciB0byBkbyB0aGVtIGFsbCBh
dCB0aGUgc2FtZSB0aW1lLiBUaGUgY2hhbmdlcyBhcmUgYXMgZm9sbG93czoNCg0KDQphbGFuOnNu
aXANCg0KPiBAQCAtMTA5LDM4ICsxMTAsMjEgQEAgc3RhdGljIGludCBnc2NfZndfbG9hZF9wcmVw
YXJlKHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYykNCj4gIHsNCj4gIAlzdHJ1Y3QgaW50ZWxfZ3Qg
Kmd0ID0gZ3NjX3VjX3RvX2d0KGdzYyk7DQo+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5
MTUgPSBndC0+aTkxNTsNCj4gLQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqOw0KPiAt
CXZvaWQgKnNyYywgKmRzdDsNCj4gKwl2b2lkICpzcmM7DQoNCg0KYWxhbjpzbmlwDQoNCj4gIA0K
PiAtCW1lbXNldChkc3QsIDAsIG9iai0+YmFzZS5zaXplKTsNCj4gLQltZW1jcHkoZHN0LCBzcmMs
IGdzYy0+Zncuc2l6ZSk7DQo+ICsJbWVtc2V0X2lvKGdzYy0+bG9jYWxfdmFkZHIsIDAsIGdzYy0+
bG9jYWwtPnNpemUpOw0KPiArCW1lbWNweV90b2lvKGdzYy0+bG9jYWxfdmFkZHIsIHNyYywgZ3Nj
LT5mdy5zaXplKTsNCmFsYW46IGkgd29uZGVyIGlmIGl0IHRoZXJlIGlzIGJlbmVmaXQgdG8gZG8g
dGhlIG1lbWNweV90b2lvIGZpcnN0DQphbmQgdGhlbiBkbyB0aGUgbWVtc2V0X2lvIGJ1dCBvbmx5
IGZvciB0aGUgYmFsYW5jZSBvZiBhcmVhIGZyb20NCm9mZnNldCAnZ3NjLT5mdy5zaXplJyBmb3Ig
KGdzYy0+bG9jYWwtPnNpemUgLSBnc2MtPmZ3LnNpemUpIGJ5dGVzLg0KDQphbGFuOnNuaXANCg0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYw0KPiBAQCAtMTMwLDI2
ICsxMzAsODUgQEAgdm9pZCBpbnRlbF9nc2NfdWNfaW5pdF9lYXJseShzdHJ1Y3QgaW50ZWxfZ3Nj
X3VjICpnc2MpDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50IGdzY19hbGxvY2F0ZV9h
bmRfbWFwX3ZtYShzdHJ1Y3QgaW50ZWxfZ3NjX3VjICpnc2MsIHUzMiBzaXplKQ0KYWxhbjpzbmlw
DQoNCj4gKwlvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihndC0+aTkxNSwgc2l6
ZSk7DQo+ICsJaWYgKElTX0VSUihvYmopKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihvYmopOw0KPiAr
DQo+ICsJdm1hID0gaTkxNV9nZW1fb2JqZWN0X2dndHRfcGluKG9iaiwgTlVMTCwgMCwgMCwgMCk7
DQphbGFuOiBzaG91bGQgd2UgYmUgcGFzc2luZyBpbiB0aGUgUElOX01BUFBBQkxFIGZsYWcgaW50
byB0aGUgbGFzdCBwYXJhbT8NCg0KDQphbGFuOnNuaXANCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC91Yy9pbnRlbF9nc2NfdWMuaA0KPiBpbmRleCBhMmEwODEzYjhhNzYuLmMwMTI4NmRkZGJk
YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3Vj
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmgNCj4g
QEAgLTE4LDYgKzE4LDcgQEAgc3RydWN0IGludGVsX2dzY191YyB7DQo+ICANCj4gIAkvKiBHU0Mt
c3BlY2lmaWMgYWRkaXRpb25zICovDQo+ICAJc3RydWN0IGk5MTVfdm1hICpsb2NhbDsgLyogcHJp
dmF0ZSBtZW1vcnkgZm9yIEdTQyB1c2FnZSAqLw0KPiArCXZvaWQgX19pb21lbSAqbG9jYWxfdmFk
ZHI7IC8qIHBvaW50ZXIgdG8gYWNjZXNzIHRoZSBwcml2YXRlIG1lbW9yeSAqLw0KYWxhbjpuaXQ6
IHJlbG9va2luZyBhdCB0aGUgdGhlc2UgdmFyaWFibGUgbmFtZXMgdGhhdCBvcmlnaW5hdGUgZnJv
bQ0KbGFzdCB5ZWFyJ3MgcGF0Y2ggeW91IHdvcmtlZCBvbiBpbnRyb2R1Y2luZyBnc2NfdWMsIGkg
YW0gd29uZGVyaW5nIG5vdw0KaWYgd2Ugc2hvdWxkIHJlbmFtZSAibG9jYWwiIHRvICJwcml2bWVt
IiBhbmQgbG9jYWxfdmFkZHIgYmVjb21lcyBwcml2bWVtX3ZhZGRyLg0KKG5vIHNpZ25pZmljYW50
IHJlYXNvbiBvdGhlciB0aGFuIGltcHJvdmluZyByZWFkaWJpbGl0eSBvZiB0aGUgY29kZSkNCg0K
DQo=
