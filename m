Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3D83D469
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 08:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8510E2A7;
	Fri, 26 Jan 2024 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120CE10E2A7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706253968; x=1737789968;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AXrYoHFE9KiuVDrOiek7cZodJo/Z9Z1l4GL0XUUdDqk=;
 b=CPpYifvDzrvHV/wqZXB9R5jbU+Pnb2aQeg+nnaqwpTatmH2R9HUc5BNa
 Mm80XuI+IPUg4znxO35OOUSDQE+IsZICyPRnojzLwYrGTHTVMq4HnjQn+
 DPDbnFogo9cxSxsMrXZX6GfybpqsPlqKRruonkOd2knRD1BhyloTVnRr8
 Wqw9kHKZ71KOP/n+vkSlqTsU6yX+tBm0sithJ2pu6AkE8BEM37ve1aEzU
 PEQ4WCnhAvazuwfxc23K3g8+9EeLc39muKnYd8Ujf5qVP8WPivKg4NVFn
 ji4NZYJsFY07R6vF3lCc2WfGMliHlQS09pAuuL7943PRuYw+A3fBKwCpp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1335713"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1335713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 23:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35359452"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 23:25:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 23:25:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 23:25:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 23:25:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 23:25:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu7wj5E3MPG7K/55EUUjlqThpEdC+MHZXh7aO6cCyl0oBSVKHKb9ulXM7E7oDYn15IwO1Ej1wmf3fWFm6etemvuldgYMHtdkD1WJsarwe9hQYvJeE7Ru+NkgsL3cBcfUC40ynTZSP1kD15lTpVdLp+KGfAjJnbxU7giGtJBXNYTLbOZFp1Q9/eKL6luQO+D2gbzPBiyQmDbCRv0+paWmzQ9b7BFJdWo3B/aa/eo4d/IoFoYTTTs0LVp3OeiN6+HwjN4aENMrTTNTrxEvAyBhrgP4LgCZtr+Dl+t1xVubtJIJ9K9VIW+qPRYbLakot7KYcylo+InOfZnETtCLpvfX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXrYoHFE9KiuVDrOiek7cZodJo/Z9Z1l4GL0XUUdDqk=;
 b=juyOy4qvd6tpVPojBufrOLntTbUb+NlCUFsFQrkvPxFqLHW5jxiWbN+nUuPSc4ikB0ioFnKBsgjubJu3CNahYRgDrq6JhPnkIGZ3fiw0zk2oNVcCDJFtMWMFvUwA7/ET2FaB/8eocPZ3isYAewFpOyQBo/DJvkwtx0m+rgppeUoCKMZ1blGqdJEwQACmHN/nIC1/rzYrCWQKSAdDKn6mTKqTNzcXhyq9CQyiFnmVc2Z14v5Blgxib2vRVaYEFA10hUHcwPu00Q4W9Se2oLy3A1SLgGlY/Sj3SO08TmUMU/cu29egYY1rAiXMpkji1C6TWBlWgNSSw20caTcJW5UHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB8116.namprd11.prod.outlook.com (2603:10b6:8:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Fri, 26 Jan
 2024 07:25:47 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df%4]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 07:25:47 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Paul Cercueil <paul@crapouillou.net>
Subject: RE: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Thread-Topic: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Thread-Index: AQHaTklVj+JfGoUYak+H25iUh1Y+RrDpk0JggAEbQoCAACQu4A==
Date: Fri, 26 Jan 2024 07:25:47 +0000
Message-ID: <IA0PR11MB7185C799B08748C87F215434F8792@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-2-afd@ti.com>
 <IA0PR11MB7185DDD7A972ED546B4CEA10F87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <7872f641-8a72-424f-b345-99c27403d7c6@ti.com>
In-Reply-To: <7872f641-8a72-424f-b345-99c27403d7c6@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB8116:EE_
x-ms-office365-filtering-correlation-id: b477310d-7be6-4a53-934d-08dc1e4003fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QErSzAASLuzybH4PZanGn8CRPeeX+D+7QoBB4NylT+wirRRLTrqhi0sBMXURdsm/7d8unHBJjSXYCJPL+BLB3NwPfBA7/ZGqsAgISli+B5wVjXL5WCcAO0+7iRi1MDBXgSKheolIHMrJaJxVTJ909XU634Znjr5zFQiorAh6fY2ovlxPfMKJsNycO4UAmf2XMdqaoKA2ldUTi9hbskWaxmvdNaFTC9cGnIN2/dseoTwTKemCelFzEvm7muXdGKJThdMBa9YbczNGqJ+LDixklYlrqkseF6eSaQoyyXkGl44WYZK7CCOnWZCZuCNLomRmGhrWq8nyJRpSOYzlC66xiLj1QYJ/qzl/zkLDnZr2odj1w5rCEERQkymRD6q2FvU5JNt9BWIe7FZlbPB9hU54pz2FC0B3GIhFnN4GbQHSdY8x5qKFrrZ1qsOjIku+1bQHyoXelr6tdwv60BunbvmcvPD4kp2QN0SPHwGlTsBfW/x0g8n0jcjzplS0X6Yvx30z8cpG3sHIEq4oaw/CoSI6p1D4q8Lhz7Z0TPnI7TzlWv7Uw8HWoTe0txur4rSdkcK7bad0fklcwjNbd/slojtVvjwbXgZIgkdJ+OLz26w9PIFqOyvs+9YytLuTPi3ny9clzQfPmhT0Gxu9NAf63VPAIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(6506007)(7696005)(71200400001)(9686003)(83380400001)(66476007)(2906002)(478600001)(66556008)(52536014)(316002)(8936002)(76116006)(966005)(110136005)(64756008)(54906003)(66446008)(8676002)(82960400001)(5660300002)(66946007)(4326008)(122000001)(86362001)(33656002)(38070700009)(38100700002)(41300700001)(26005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVAzMHgzY2xhSFNvNjVtTFdSdWVXWGp5ajVyT0JwVjNldmJSSkZ3cDR3ZS9X?=
 =?utf-8?B?bDNGMUJCVGwyd1YwZmNLbUR0aDlDOVZtME5XNmc3UWR6Mm9TcWxHMC8rVEZQ?=
 =?utf-8?B?UmlTQ2hWemdUODhTSTVTcW9BTERiMEQ3bHM4dThiNkljUUp3SHNTVUJySlBM?=
 =?utf-8?B?aGhMUDA3UmhncVpBZW9QY2dTc21ONGltanZFQk9vV2pBdGxSZWl2Q2ZtVU9w?=
 =?utf-8?B?RmZQZHpiMWMxMkNsdHhnaGNJUEtnSEFPMVpSSW5LZm5Ld0xZTXpkZnpvcDZh?=
 =?utf-8?B?UjhGNjNNVmRJa3pwbEsyQmpuZG9FQm5rNk5WRW1Pd0lteDFpclFCNXF4TWVx?=
 =?utf-8?B?Z1pvayt0YlF2alJhNDJ1SXVlMHZ4V0pXWExSK3M3R2x3VlljTHArMjlCNUg3?=
 =?utf-8?B?NHc5OW5OaXlTZ1NkMzdrNHNTaEUvMDlLZTg1bXBJY2lOVVN2M00xY2FlRmFj?=
 =?utf-8?B?SXVxelE4ZzlsUTVxQ09ZdjRYTmJtRWhIcU5sSG81eVlENGRjN1NlQUtOK1hJ?=
 =?utf-8?B?dU1tSm5kTFh4NmZVRDFxT0lFSXZ3MVA5NDhYSWx3YVU2WmZSK2JyYVNZQWgx?=
 =?utf-8?B?eEhXZWF6b1RwUzYwdGJQVFpRZEREdmk4MTlGVnM3cDFvQmVYWXN1WVc5QUp1?=
 =?utf-8?B?SkE1RGJJT3lSS0pnV1U5OE81RFhvalBVM2syOHR5Rmh0bVlNRXlSeGNPM2o0?=
 =?utf-8?B?NDRqRHVQbE02bXJwRlpjT2lDMHZqSmxSNmpmQkNyUDNIT3pIOHpJUGR5RGhl?=
 =?utf-8?B?LzJQYUxRRHBBeXNPNHh0bStQZmdOZExnQ01aMFJJbFBFTVlwZTFVTCt1SXdS?=
 =?utf-8?B?YWQydThjMVJpNzFKaklHakduTURZMXBYYnNnbndyWXZteG1WVHhtL3l1WVRX?=
 =?utf-8?B?QnBnOUhBaUhGOCtGdjJFVzBLRE9wMWxBbWI1TTl4V0YzeFdURlVHczFiK0pw?=
 =?utf-8?B?cG0zQXFkVWxVQ0RzN3hxck5RdDNoKzA2Wk9iZ003M0czVGNhRVJrdkdSd2Fh?=
 =?utf-8?B?QVBvNTRORG91b1IvNzlCc2wvcUNuTlljZGF5MjJGb0FrT1dtakhPK3BWRHlJ?=
 =?utf-8?B?TDgyUUI0TklrZExZL2J5Q1RGdXFvWXg5K1hwellvbTR3bjZkR3NqWFcwNjEy?=
 =?utf-8?B?clRFNFRPTmt3NXVrZVZTZzExK3pKYVJVa2pXd0Y3YjBYczFMR0ZnU3NpYmJQ?=
 =?utf-8?B?VnhoRGE4c3pRdlI1RTNpUEREN013bkxDYURwMHBnanFiYzJvbjc5YVdoaGNY?=
 =?utf-8?B?TVVDajdNZGphNVpoSmxpdGtrWHc5ZmhNdGZsYVlabEdrZmNwOFBxd3VlMUNs?=
 =?utf-8?B?eTN0SHN0OGZPT1Ewa09NelNUUks5Qmp2eUZuNVQ0QmR2TTdiWGZVNXRiSFNn?=
 =?utf-8?B?Y25mdGpjMHFRMExoS0JpUzFkcEZpY011S1U5ekxlUnd5VFdRU2FLakxENWJI?=
 =?utf-8?B?clVKQ1VWNmhDTk1zWUt4UzhGcmFubjBPWExUQWRveUpyZ2QwYlNiRWxaL2Vk?=
 =?utf-8?B?Uld1OTRKd2FWVHNTL2l1SzFOaVM4SUZlMk96c3pNR0VvUTh1SmVXcEVKSjVt?=
 =?utf-8?B?NXZYc1pDa1JvYnpRSzJUbFhzNWFXQXhjeGU3LzdMNzZVd2JKSWVhaDBiYmIy?=
 =?utf-8?B?a0lBRDVzc3pIdG8vMnFiTXlBN05qQjNzVXhHVFBacUUzUGdGTGtidHdzVlkw?=
 =?utf-8?B?QzA2ck1LbUpDMVVtSG9aeWppZm5sUjhpTXRZS0ZacWw4QkpVT2pkRWl3Y1hJ?=
 =?utf-8?B?YmtySHNvOFRNcEJGUTQrNUltaXF3d1Era2pzcUZFeTQvTjJjK2hTMEllUDI3?=
 =?utf-8?B?UnNoK2VjcGFBUHp5VmZqbDRvS3hVczQwRUd2aEtQWURyUmpuaU9uUDlERU80?=
 =?utf-8?B?UXp4bXV1OHdhUFRYVmNhdEx2TTNrSFh4S2c0aXJPRDQ1bzJnRm1VWTFVMWxm?=
 =?utf-8?B?UER1OEl3RXBiaEh5SkN5K2xHeEhzdjBHdWlwZVNXVTZ6NWYzZkhaVHRlRlFi?=
 =?utf-8?B?ZVNTYnFEY1hQamkvb0haRklFcDZCR3oxNmN6cEQzeWh3V2UzTXZVK1JtcjlU?=
 =?utf-8?B?dHk5WUd0aFdscEtMVkNUMEVveHh6YkdrOUJlYnZzN1piaFRwQ1JLZ1kwR1Jm?=
 =?utf-8?Q?6ZEmLj4q1uxvyhBEGuhfwx4qY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b477310d-7be6-4a53-934d-08dc1e4003fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 07:25:47.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4MWfevQpi0lDKXtSAikDaO0NwDAurfkwdVymohIPuuazBMSHxJItDOZY5PoABwfHQCYrci8nuZuI1G1C2o1IqqJo4lB6kD5l7J1rv/yrbRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8116
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+PiBDdXJyZW50bHkgdGhpcyBkcml2ZXIgY3JlYXRlcyBhIFNHVCB0YWJsZSB1c2luZyB0aGUg
Q1BVIGFzIHRoZQ0KPiA+PiB0YXJnZXQgZGV2aWNlLCB0aGVuIHBlcmZvcm1zIHRoZSBkbWFfc3lu
YyBvcGVyYXRpb25zIGFnYWluc3QNCj4gPj4gdGhhdCBTR1QuIFRoaXMgaXMgYmFja3dhcmRzIHRv
IGhvdyBETUEtQlVGcyBhcmUgc3VwcG9zZWQgdG8gYmVoYXZlLg0KPiA+PiBUaGlzIG1heSBoYXZl
IHdvcmtlZCBmb3IgdGhlIGNhc2Ugd2hlcmUgdGhlc2UgYnVmZmVycyB3ZXJlIGdpdmVuDQo+ID4+
IG9ubHkgYmFjayB0byB0aGUgc2FtZSBDUFUgdGhhdCBwcm9kdWNlZCB0aGVtIGFzIGluIHRoZSBR
RU1VIGNhc2UuDQo+ID4+IEFuZCBvbmx5IHRoZW4gYmVjYXVzZSB0aGUgb3JpZ2luYWwgYXV0aG9y
IGhhZCB0aGUgZG1hX3N5bmMNCj4gPj4gb3BlcmF0aW9ucyBhbHNvIGJhY2t3YXJkcywgc3luY2lu
ZyBmb3IgdGhlICJkZXZpY2UiIG9uIGJlZ2luX2NwdS4NCj4gPj4gVGhpcyB3YXMgbm90aWNlZCBh
bmQgImZpeGVkIiBpbiB0aGlzIHBhdGNoWzBdLg0KPiA+Pg0KPiA+PiBUaGF0IHRoZW4gbWVhbnQg
d2Ugd2VyZSBzeW5jJ2luZyBmcm9tIHRoZSBDUFUgdG8gdGhlIENQVSB1c2luZw0KPiA+PiBhIHBz
ZXVkby1kZXZpY2UgIm1pc2NkZXZpY2UiLiBXaGljaCB0aGVuIGNhdXNlZCBhbm90aGVyIGlzc3Vl
DQo+ID4+IGR1ZSB0byB0aGUgbWlzY2RldmljZSBub3QgaGF2aW5nIGEgcHJvcGVyIERNQSBtYXNr
IChhbmQgd2h5IHNob3VsZA0KPiA+PiBpdCwgdGhlIENQVSBpcyBub3QgYSBETUEgZGV2aWNlKS4g
VGhlIGZpeCBmb3IgdGhhdCB3YXMgYW4gZXZlbg0KPiA+PiBtb3JlIGVncmVnaW91cyBoYWNrWzFd
IHRoYXQgZGVjbGFyZXMgdGhlIENQVSBpcyBjb2hlcmVudCB3aXRoDQo+ID4+IGl0c2VsZiBhbmQg
Y2FuIGFjY2VzcyBpdHMgb3duIG1lbW9yeSBzcGFjZS4uDQo+ID4+DQo+ID4+IFVud2luZCBhbGwg
dGhpcyBhbmQgcGVyZm9ybSB0aGUgY29ycmVjdCBhY3Rpb24gYnkgZG9pbmcgdGhlIGRtYV9zeW5j
DQo+ID4+IG9wZXJhdGlvbnMgZm9yIGVhY2ggZGV2aWNlIGN1cnJlbnRseSBhdHRhY2hlZCB0byB0
aGUgYmFja2luZyBidWZmZXIuDQo+ID4gTWFrZXMgc2Vuc2UuDQo+ID4NCj4gPj4NCj4gPj4gWzBd
IGNvbW1pdCAxZmZlMDk1OTAxMjEgKCJ1ZG1hYnVmOiBmaXggZG1hLWJ1ZiBjcHUgYWNjZXNzIikN
Cj4gPj4gWzFdIGNvbW1pdCA5ZTlmYTZhOTE5OGIgKCJ1ZG1hYnVmOiBTZXQgdGhlIERNQSBtYXNr
IGZvciB0aGUgdWRtYWJ1Zg0KPiA+PiBkZXZpY2UgKHYyKSIpDQo+ID4+DQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVy
cy9kbWEtYnVmL3VkbWFidWYuYyB8IDQxICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVm
LmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ID4+IGluZGV4IDNhMjNmMGE3ZDExMmEu
LmFiNjc2NDMyMjUyM2MgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVm
LmMNCj4gPj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYw0KPiA+PiBAQCAtMjYsOCAr
MjYsNiBAQCBNT0RVTEVfUEFSTV9ERVNDKHNpemVfbGltaXRfbWIsICJNYXggc2l6ZSBvZiBhDQo+
ID4+IGRtYWJ1ZiwgaW4gbWVnYWJ5dGVzLiBEZWZhdWx0IGlzDQo+ID4+ICAgc3RydWN0IHVkbWFi
dWYgew0KPiA+PiAgIAlwZ29mZl90IHBhZ2Vjb3VudDsNCj4gPj4gICAJc3RydWN0IHBhZ2UgKipw
YWdlczsNCj4gPj4gLQlzdHJ1Y3Qgc2dfdGFibGUgKnNnOw0KPiA+PiAtCXN0cnVjdCBtaXNjZGV2
aWNlICpkZXZpY2U7DQo+ID4+ICAgCXN0cnVjdCBsaXN0X2hlYWQgYXR0YWNobWVudHM7DQo+ID4+
ICAgCXN0cnVjdCBtdXRleCBsb2NrOw0KPiA+PiAgIH07DQo+ID4+IEBAIC0xNjksMTIgKzE2Nyw4
IEBAIHN0YXRpYyB2b2lkIHVubWFwX3VkbWFidWYoc3RydWN0DQo+ID4+IGRtYV9idWZfYXR0YWNo
bWVudCAqYXQsDQo+ID4+ICAgc3RhdGljIHZvaWQgcmVsZWFzZV91ZG1hYnVmKHN0cnVjdCBkbWFf
YnVmICpidWYpDQo+ID4+ICAgew0KPiA+PiAgIAlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+
cHJpdjsNCj4gPj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB1YnVmLT5kZXZpY2UtPnRoaXNfZGV2
aWNlOw0KPiA+PiAgIAlwZ29mZl90IHBnOw0KPiA+Pg0KPiA+PiAtCWlmICh1YnVmLT5zZykNCj4g
Pj4gLQkJcHV0X3NnX3RhYmxlKGRldiwgdWJ1Zi0+c2csIERNQV9CSURJUkVDVElPTkFMKTsNCj4g
PiBXaGF0IGhhcHBlbnMgaWYgdGhlIGxhc3QgaW1wb3J0ZXIgbWFwcyB0aGUgZG1hYnVmIGJ1dCBl
cnJvbmVvdXNseQ0KPiA+IGNsb3NlcyBpdCBpbW1lZGlhdGVseT8gV291bGQgdW5tYXAgc29tZWhv
dyBnZXQgY2FsbGVkIGluIHRoaXMgY2FzZT8NCj4gPg0KPiANCj4gR29vZCBxdWVzdGlvbiwgaGFk
IHRvIHNjYW4gdGhlIGZyYW1ld29yayBjb2RlIGEgYml0IGhlcmUuIEkgdGhvdWdodA0KPiBjbG9z
aW5nIGEgRE1BQlVGIGhhbmRsZSB3b3VsZCBhdXRvbWF0aWNhbGx5IHVud2luZCBhbnkgY3VycmVu
dA0KPiBhdHRhY2htZW50cy9tYXBwaW5ncywgYnV0IGl0IHNlZW1zIG5vdGhpbmcgaW4gdGhlIGZy
YW1ld29yayBkb2VzIHRoYXQuDQo+IA0KPiBMb29rcyBsaWtlIHRoYXQgaXMgdXAgdG8gdGhlIGlt
cG9ydGluZyBkcml2ZXJzWzBdOg0KPiANCj4gPiBPbmNlIGEgZHJpdmVyIGlzIGRvbmUgd2l0aCBh
IHNoYXJlZCBidWZmZXIgaXQgbmVlZHMgdG8gY2FsbA0KPiA+IGRtYV9idWZfZGV0YWNoKCkgKGFm
dGVyIGNsZWFuaW5nIHVwIGFueSBtYXBwaW5ncykgYW5kIHRoZW4NCj4gPiByZWxlYXNlIHRoZSBy
ZWZlcmVuY2UgYWNxdWlyZWQgd2l0aCBkbWFfYnVmX2dldCgpIGJ5DQo+ID4gY2FsbGluZyBkbWFf
YnVmX3B1dCgpLg0KPiANCj4gU28gY2xvc2luZyBhIERNQUJVRiBhZnRlciBtYXBwaW5nIHdpdGhv
dXQgZmlyc3QgdW5tYXBwaW5nIGl0IHdvdWxkDQo+IGJlIGEgYnVnIGluIHRoZSBpbXBvcnRlciwg
aXQgaXMgbm90IHRoZSBleHBvcnRlcnMgcHJvYmxlbSB0byBjaGVjaw0KSXQgbWF5IGJlIGEgYnVn
IGluIHRoZSBpbXBvcnRlciBidXQgd291bGRuJ3QgdGhlIG1lbW9yeSBhc3NvY2lhdGVkDQp3aXRo
IHRoZSBzZyB0YWJsZSBhbmQgYXR0YWNobWVudCBnZXQgbGVha2VkIGlmIHVubWFwIGRvZXNuJ3Qg
Z2V0IGNhbGxlZA0KaW4gdGhpcyBzY2VuYXJpbz8NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiBmb3Ig
KGFsdGhvdWdoIHNvbWUgbW9yZSB3YXJuaW5ncyBpbiB0aGUgZnJhbWV3b3JrIGNoZWNraW5nIGZv
ciB0aGF0DQo+IG1pZ2h0IG5vdCBiZSBhIGJhZCBpZGVhLi4pLg0KPiANCj4gQW5kcmV3DQo+IA0K
PiBbMF0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92Ni43L2RyaXZlci1hcGkvZG1h
LWJ1Zi5odG1sDQo+IA0KPiA+IFRoYW5rcywNCj4gPiBWaXZlaw0KPiA+DQo+ID4+IC0NCj4gPj4g
ICAJZm9yIChwZyA9IDA7IHBnIDwgdWJ1Zi0+cGFnZWNvdW50OyBwZysrKQ0KPiA+PiAgIAkJcHV0
X3BhZ2UodWJ1Zi0+cGFnZXNbcGddKTsNCj4gPj4gICAJa2ZyZWUodWJ1Zi0+cGFnZXMpOw0KPiA+
PiBAQCAtMTg1LDMzICsxNzksMzEgQEAgc3RhdGljIGludCBiZWdpbl9jcHVfdWRtYWJ1ZihzdHJ1
Y3QgZG1hX2J1Zg0KPiA+PiAqYnVmLA0KPiA+PiAgIAkJCSAgICAgZW51bSBkbWFfZGF0YV9kaXJl
Y3Rpb24gZGlyZWN0aW9uKQ0KPiA+PiAgIHsNCj4gPj4gICAJc3RydWN0IHVkbWFidWYgKnVidWYg
PSBidWYtPnByaXY7DQo+ID4+IC0Jc3RydWN0IGRldmljZSAqZGV2ID0gdWJ1Zi0+ZGV2aWNlLT50
aGlzX2RldmljZTsNCj4gPj4gLQlpbnQgcmV0ID0gMDsNCj4gPj4gLQ0KPiA+PiAtCWlmICghdWJ1
Zi0+c2cpIHsNCj4gPj4gLQkJdWJ1Zi0+c2cgPSBnZXRfc2dfdGFibGUoZGV2LCBidWYsIGRpcmVj
dGlvbik7DQo+ID4+IC0JCWlmIChJU19FUlIodWJ1Zi0+c2cpKSB7DQo+ID4+IC0JCQlyZXQgPSBQ
VFJfRVJSKHVidWYtPnNnKTsNCj4gPj4gLQkJCXVidWYtPnNnID0gTlVMTDsNCj4gPj4gLQkJfQ0K
PiA+PiAtCX0gZWxzZSB7DQo+ID4+IC0JCWRtYV9zeW5jX3NnX2Zvcl9jcHUoZGV2LCB1YnVmLT5z
Zy0+c2dsLCB1YnVmLT5zZy0+bmVudHMsDQo+ID4+IC0JCQkJICAgIGRpcmVjdGlvbik7DQo+ID4+
IC0JfQ0KPiA+PiArCXN0cnVjdCB1ZG1hYnVmX2F0dGFjaG1lbnQgKmE7DQo+ID4+DQo+ID4+IC0J
cmV0dXJuIHJldDsNCj4gPj4gKwltdXRleF9sb2NrKCZ1YnVmLT5sb2NrKTsNCj4gPj4gKw0KPiA+
PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoYSwgJnVidWYtPmF0dGFjaG1lbnRzLCBsaXN0KQ0KPiA+
PiArCQlkbWFfc3luY19zZ3RhYmxlX2Zvcl9jcHUoYS0+ZGV2LCBhLT50YWJsZSwgZGlyZWN0aW9u
KTsNCj4gPj4gKw0KPiA+PiArCW11dGV4X3VubG9jaygmdWJ1Zi0+bG9jayk7DQo+ID4+ICsNCj4g
Pj4gKwlyZXR1cm4gMDsNCj4gPj4gICB9DQo+ID4+DQo+ID4+ICAgc3RhdGljIGludCBlbmRfY3B1
X3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwNCj4gPj4gICAJCQkgICBlbnVtIGRtYV9kYXRh
X2RpcmVjdGlvbiBkaXJlY3Rpb24pDQo+ID4+ICAgew0KPiA+PiAgIAlzdHJ1Y3QgdWRtYWJ1ZiAq
dWJ1ZiA9IGJ1Zi0+cHJpdjsNCj4gPj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB1YnVmLT5kZXZp
Y2UtPnRoaXNfZGV2aWNlOw0KPiA+PiArCXN0cnVjdCB1ZG1hYnVmX2F0dGFjaG1lbnQgKmE7DQo+
ID4+DQo+ID4+IC0JaWYgKCF1YnVmLT5zZykNCj4gPj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4+
ICsJbXV0ZXhfbG9jaygmdWJ1Zi0+bG9jayk7DQo+ID4+ICsNCj4gPj4gKwlsaXN0X2Zvcl9lYWNo
X2VudHJ5KGEsICZ1YnVmLT5hdHRhY2htZW50cywgbGlzdCkNCj4gPj4gKwkJZG1hX3N5bmNfc2d0
YWJsZV9mb3JfZGV2aWNlKGEtPmRldiwgYS0+dGFibGUsIGRpcmVjdGlvbik7DQo+ID4+ICsNCj4g
Pj4gKwltdXRleF91bmxvY2soJnVidWYtPmxvY2spOw0KPiA+Pg0KPiA+PiAtCWRtYV9zeW5jX3Nn
X2Zvcl9kZXZpY2UoZGV2LCB1YnVmLT5zZy0+c2dsLCB1YnVmLT5zZy0+bmVudHMsDQo+ID4+IGRp
cmVjdGlvbik7DQo+ID4+ICAgCXJldHVybiAwOw0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gQEAgLTMw
Nyw3ICsyOTksNiBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShzdHJ1Y3QgbWlzY2Rldmlj
ZQ0KPiA+PiAqZGV2aWNlLA0KPiA+PiAgIAlleHBfaW5mby5wcml2ID0gdWJ1ZjsNCj4gPj4gICAJ
ZXhwX2luZm8uZmxhZ3MgPSBPX1JEV1I7DQo+ID4+DQo+ID4+IC0JdWJ1Zi0+ZGV2aWNlID0gZGV2
aWNlOw0KPiA+PiAgIAlidWYgPSBkbWFfYnVmX2V4cG9ydCgmZXhwX2luZm8pOw0KPiA+PiAgIAlp
ZiAoSVNfRVJSKGJ1ZikpIHsNCj4gPj4gICAJCXJldCA9IFBUUl9FUlIoYnVmKTsNCj4gPj4gLS0N
Cj4gPj4gMi4zOS4yDQo+ID4NCg==
