Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908497843CA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C91E10E37B;
	Tue, 22 Aug 2023 14:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A9610E378;
 Tue, 22 Aug 2023 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692713946; x=1724249946;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Achn6KjNSVDRO/xwapFB6J9YWb6B4xaPTkb1LZuUDM=;
 b=Bg1opSvrMnQ5dtV3/8XlAc+QCKbOyg3qbbrPBJ0qK3/JpyU0IPfL4qGr
 IOfHy+EyBkorWUc3TwlLyKwhg+h9HMNGwUoYErXwkMpXsaXaUsCjbB+qi
 7puL3nPD1hKp+sxyIKw7LCZLyWIJHO3HQjVpVOX8Q6sqC2OS2gOZqrhHn
 ON69e3aHmIN+GW6AtyOubV2X552We7wJDF+nqP3N7wZ/br1m2IIxtyOh0
 3z2byPi15cHSeGToV+AEGfscO6eDEwJpJFoFdkLxnFm/lrVLesMSBU1pu
 imGXV3Qw9JfVVj78tDkQ4hk9eethdlGt8H3WhInO8VAsBE5XtRPVgi9H5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364059931"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="364059931"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765748060"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="765748060"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 07:14:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:14:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:14:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 07:14:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 07:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J27YxZhMQdTsTeA8MSndRso/2SWTQnicAN7IWxDGB72G3MmDEc0Sxo+WesNqu6gvREcMpd1Rti/AFiDj7B3U8xE6ywy7cSCyZgD49uyYVQijOnWXuQUVEl/wNNSE54urlwzgMEYVI2NjypLRmat3FhDH+H3HdIHcDSYXjysGf0zxG1U3QJI24SBkOIFr3CTM61Zpa8kyuqA7NPfVDDpPKdsW51sJrjGvPZ44cp3YqFEEaXu87CcE2N1Hrwuj/pBabY0I4yF/ZBqvnEt2+E8/4G3RlDN73IZ86R9aEtfRpoR149MD41qs2NPEzpGNPkAWwrMf0EF/UlbVs1zcRJnRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Achn6KjNSVDRO/xwapFB6J9YWb6B4xaPTkb1LZuUDM=;
 b=OOfKR6O5oMuq786XjxeH+++5jt1u2RNYrrg+799ZsxYU80ErX6LLJg+uV+VKP7C5VUYQvlfGn3Y3EaFV+4Rr6NbaDkGoeH9i8CI6fD5Pi1vL+k4Y2C2LK5e08kAtYQ+a9r1K5EiavQxt41VU0gwExDfpdWkSqUB8WwWdA3+0I4GUtm+8HcOByL3N8lfoKeuCDQh6xbz8yQnn8QCSBWe3xXKJx2/di2JJV5D6Uly09x9/Om0QuSSJ9TYYNHGeEMJv2pzMDcJWl/m9nbpJyfNTwNT1qM8HWX3WmCFIx9SxCJoG3b2SxaEhc8MnuDbmf/tropH6oc3ELndzDypha/S1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by CH0PR11MB5473.namprd11.prod.outlook.com (2603:10b6:610:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:14:29 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:14:28 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v5] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Thread-Topic: [PATCH v5] drm/i915: Avoid circular locking dependency when
 flush delayed work on gt reset
Thread-Index: AQHZzICJnJlEJHZG2k+JHNJ2+mJOBq/2ZkqAgAACWeA=
Date: Tue, 22 Aug 2023 14:14:28 +0000
Message-ID: <SN6PR11MB26223C5DDEE01B6CF285532C8F1FA@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <ZOS9NURIoBK1lyi8@phenom.ffwll.local>
In-Reply-To: <ZOS9NURIoBK1lyi8@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2622:EE_|CH0PR11MB5473:EE_
x-ms-office365-filtering-correlation-id: 2ce6f11e-7ddb-4cab-5a13-08dba31a18ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HcKxiaul4DzcrsTFk+KnT2zd3anUhj1ps0RZ24UHLxj92P6vUdvoOWM2DrclFx5YhniLSR6oFqTd3Yxq+U+nJpLN8Q5fKKuqd/8wbCjHpPHc9jZy6cPM0mcuV6JYDT1GRU+iHiwW4rR4zOsAGoxGIInc46hK6XLUoV1a5hvqILULDytdXVcJTOxZPQmz8+cOq54GTBlKv0DUFeRXXCgeOeixsLfXpJEQ/K7vrTHtyx6gC28Ge5+t6FAJIymwk+jzKUfHiM80aCJZ61qmpgxdsu5xxuCl5qk8V/pUdxDz8saXzGRMdS2s3vgFpjJWvGGUSBv+4jMXYyyYTAx9pzjKDy9M/RtCACNzigKXvLWmBJh+FRwytMcOiLoa/lM0iH1dCS9M5h55zSzdTEhi4p18hOgXydf+tvTHV13UzlUlnHLIflYG6+F1rEbp2mG2cB2HZUxw0xYwgVWSJCkyotIEma4fcKo/4BHsXpP3fKaqw4U+SmwXaiMAv6H8vc2G4z+Y6oyC4JjD/ntrMb12MaMgDIdWnMkAQwozcB3Kd5Y/FmbQjcH9nJ9WWdMLrDG1/iD5vWQlzqGHXWU0c4HzALkuKxWROGmkwPMZb7TK9u65DIc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(76116006)(66446008)(6916009)(66476007)(66556008)(64756008)(316002)(66946007)(9686003)(82960400001)(8676002)(8936002)(4326008)(966005)(41300700001)(122000001)(478600001)(55016003)(71200400001)(38100700002)(38070700005)(53546011)(6506007)(83380400001)(2906002)(7696005)(86362001)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEV0dnFSOUR6bHcwS2RkR0xZZVhVL0R0MXBycGNZdkEza0JWbzVabFovK1NF?=
 =?utf-8?B?VGVOMGRBZ0Nwajd5RUs5VW45NWtUV05DTjVlMkpmMnUxVDVPUi92VlBmdkw3?=
 =?utf-8?B?SUxXb3cyNUZiUWZLSSs0TlZDbWRDRGtoMkJJUk1LZTIvUUE3RUM2WTJDYXB3?=
 =?utf-8?B?V1loRittazlmY0xBenBJYTBDSElOOGl2SFBwaVhOb3RwWG1sbnhmWW1uRDdK?=
 =?utf-8?B?eVBvK25iaFNwaTRBL01nZkw3dll1SlFCbGY1RThiZ0xhVXV1RzE0UDZWZGZH?=
 =?utf-8?B?em41VnlKSGpDV1FFL1pVa3VHS3o0WmdYWFE1Q3FlVzRUYmlMejNjWEdrWWFQ?=
 =?utf-8?B?ZUdrTm0xMXZuejYvZ254MzNTMGtmcEVYQnY2VVY5aGhpQU45dVRwUnhvWHQ4?=
 =?utf-8?B?ZG5oMzBIREpvUnhubkorcm1GamVSN2U1M3FEbFBBdGNJNkUwMlBJdTYxdXVM?=
 =?utf-8?B?S0F1TGxvZy9VRVJsS0IvTThRZ0dVZTZuTFNYaE9ZSU9oR1FXMVNnZzhkb0V5?=
 =?utf-8?B?ODRnbHNYRnZJcHdNbXR6cGoxZW92cFo2VGJsY3J2U3piOXhwNG13cFVFbWpZ?=
 =?utf-8?B?emVnMCtId3c4Zm9mK1VoTVkxbThTd1pZMFN4UjJKNmlQa3V1Vy9LMmNiQ2ZQ?=
 =?utf-8?B?T1ZDdmJHNFdzejV1UmpCbGllQmIxMms1TTBaSUhtTmFSTWkwSGh6TEVidW11?=
 =?utf-8?B?c3ZjVm1lbUpDR3Q3a2pMNk1hN2xSS2I4NnJ0aEExTmUxZkhTQ3d1YmErTWFu?=
 =?utf-8?B?K0V5dExKTjJiYWpsbGZDdWY1MjJrbGltSlk0azZyZ2ZLNGZwY3NoWU9pNWt2?=
 =?utf-8?B?OExxLytKdWM2KzRGQXg4aVFBRTlNODFKZU82VmJrUnBUTWZhZHRydDJVUlRU?=
 =?utf-8?B?RTh2SmRaajM1SEEyanoxN2FwYktjYmllTzhyazJVdmsyM1JEUjQwellxYVJX?=
 =?utf-8?B?dFRsYVdIdVY3WmxuSmEzNjZjK0hkTDhVTjJrOFRTZWtoMGdHM2pXS2o3OFAv?=
 =?utf-8?B?REYrUy85dTA2YWV0THZsS0tDd2xCVk1sWkxHWDN4OUJZRVN6U016YjlPVmpX?=
 =?utf-8?B?QWNhWjlxeTA0TDJGZGN5V05hVnRhbUJHV2VqNE5rN1NCbkExMHkvVDRlUFdn?=
 =?utf-8?B?b1NpZjhKNWQvMnZzcnQyNU9aRzgzNUdNa1VOUU9wNlBBQzNUOVl0ek9yTXdP?=
 =?utf-8?B?NUZvUFZlL1pvb00yb1dIU2xEUlExSFI5R0FMemlEWjd3TEY5VWFETTVpajYr?=
 =?utf-8?B?VHY3NHBTNldSZlp0VzNOOWNBNFowOENlZzRnUFZFZ3JNczBVVUxhYlI5OWdG?=
 =?utf-8?B?ZEwvM3R6RkdpUGJpTXJydFlyM2RaOHdOc3RESGJGOVd1eXpFL0tPVXBjb2JK?=
 =?utf-8?B?Skw0b25weTRGV2IxV3J6dzRBcSs5VWNGVE5NRk56MG5ic1pFY3czQTRhdlU3?=
 =?utf-8?B?UEFyWVdwZmFHVUYydk84S1A2ZFh0NUliSTJYd2laRXpwQTJ1YWhHK3d4YWdZ?=
 =?utf-8?B?Yy9mZ3FQWk4wSE9FRTdZSnJRVzlZRU96K2dsVWpHWmVscjZUY0RWQUVWSVA1?=
 =?utf-8?B?eEMyMWRsdG1Tanhhc3FIMkhGeGVWT3REeFJBRjh2OHg5OE9jbkdlZ0k4REZo?=
 =?utf-8?B?eXl0L0UydklUSkpEYi9CQVc0L0tVNWJ6WmF6RzhkSDR2MzQ3cUF3a3NCTlFU?=
 =?utf-8?B?Vmx3ZWtwazVyOGN4V0w0VjB1cThrd09DQ2lhT0w4TkZQUXprWkwxZFFwYXdS?=
 =?utf-8?B?TmNvMWliVTVXUzR4YWpDU0x3V2xzZmhkcVZ2dHRzQ1RpY2txclZqNFlGOUVw?=
 =?utf-8?B?VnNGYlp1c0I2WFdlS0VRU0Exa2k0S0JIZ0NMU2d2RGFEakpROEQxaW1ua2xm?=
 =?utf-8?B?UE1PQWhsUTkwdFZGODM0ejJlbjZXVDRpbXJZTUZveFV5Q3lZVUdDTzhOM2lE?=
 =?utf-8?B?aTU5U20wS0taQkV6dkVOdVZ3UUZoeUFkdVNSbXh6bHRtMFJqcDZvNkN3Skp5?=
 =?utf-8?B?V3dXQXZKWjM3Ykd0TitJb2MzSHNpdTR0TFlSOFFvRlNxMXBhMjR6YzV3cnk2?=
 =?utf-8?B?UDN0bnA3KzNtTmdSVTljamtBZzJmN1BWMCtzU0tYZWlIdWJPTEhnT0lBQ0Jp?=
 =?utf-8?Q?uoYPKAY8XRz34Eq1lQvsVqbfp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce6f11e-7ddb-4cab-5a13-08dba31a18ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 14:14:28.6741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/9TG2FEa/WkfVqiUFaJN5BqNqpvHvzCmdomC8ARMT8kdg5XQQVS9St5NZgWWcGpBKC/WKi99hOIYnFKAJSp8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5473
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPg0KPiBTZW50OiBBdWd1c3QgMjIsIDIwMjMgOTo1MSBBTQ0KPiBUbzog
RG9uZywgWmhhbmp1biA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gQ2M6IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEhh
cnJpc29uLA0KPiBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+OyBBbmRpIFNoeXRp
IDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT47DQo+IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NV0gZHJtL2k5MTU6IEF2b2lkIGNpcmN1
bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSB3aGVuDQo+IGZsdXNoIGRlbGF5ZWQgd29yayBvbiBndCBy
ZXNldA0KPiANCj4gT24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMTE6MjA6MTFBTSAtMDcwMCwgWmhh
bmp1biBEb25nIHdyb3RlOg0KPiA+IFRoaXMgYXR0ZW1wdHMgdG8gYXZvaWQgY2lyY3VsYXIgbG9j
a2luZyBkZXBlbmRlbmN5IGJldHdlZW4gZmx1c2ggZGVsYXllZA0KPiA+IHdvcmsgYW5kIGludGVs
X2d0X3Jlc2V0Lg0KPiA+IFdoZW4gaW50ZWxfZ3RfcmVzZXQgd2FzIGNhbGxlZCwgdGFzayB3aWxs
IGhvbGQgYSBsb2NrLg0KPiA+IFRvIGNhY2VsIGRlbGF5ZWQgd29yayBoZXJlLCB0aGUgX3N5bmMg
dmVyc2lvbiB3aWxsIGFsc28gYWNxdWlyZSBhIGxvY2ssDQo+ID4gd2hpY2ggbWlnaHQgdHJpZ2dl
ciB0aGUgcG9zc2libGUgY2lydWxhciBsb2NraW5nIGRlcGVuZGVuY3kgd2FybmluZy4NCj4gPiBX
aGVuIGludGVsX2d0X3Jlc2V0IGNhbGxlZCwgcmVzZXRfaW5fcHJvZ3Jlc3MgZmxhZyB3aWxsIGJl
IHNldCwgYWRkIGNvZGUNCj4gPiB0byBjaGVjayB0aGUgZmxhZywgY2FsbCBhc3luYyB2ZXJpb24g
aWYgcmVzZXQgaXMgaW4gcHJvZ3Jlc3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVu
IERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+ID4gQ2M6IEpvaG4gSGFycmlzb24gPEpv
aG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlA
bGludXguaW50ZWwuY29tPg0KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19zdWJt
aXNzaW9uLmMgfCAxMSArKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19zdWJtaXNzaW9uLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfc3VibWlzc2lvbi5jDQo+ID4gaW5kZXggYTBlM2VmMWM2
NWQyLi42MDAzODhjODQ5ZjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvdWMvaW50ZWxfZ3VjX3N1Ym1pc3Npb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX2d1Y19zdWJtaXNzaW9uLmMNCj4gPiBAQCAtMTM1OSw3ICsxMzU5LDE2
IEBAIHN0YXRpYyB2b2lkIGd1Y19lbmFibGVfYnVzeW5lc3Nfd29ya2VyKHN0cnVjdA0KPiBpbnRl
bF9ndWMgKmd1YykNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBndWNfY2FuY2VsX2J1c3luZXNzX3dv
cmtlcihzdHJ1Y3QgaW50ZWxfZ3VjICpndWMpDQo+ID4gIHsNCj4gPiAtCWNhbmNlbF9kZWxheWVk
X3dvcmtfc3luYygmZ3VjLT50aW1lc3RhbXAud29yayk7DQo+ID4gKwkvKg0KPiA+ICsJICogV2hl
biBpbnRlbF9ndF9yZXNldCB3YXMgY2FsbGVkLCB0YXNrIHdpbGwgaG9sZCBhIGxvY2suDQo+ID4g
KwkgKiBUbyBjYWNlbCBkZWxheWVkIHdvcmsgaGVyZSwgdGhlIF9zeW5jIHZlcnNpb24gd2lsbCBh
bHNvIGFjcXVpcmUgYSBsb2NrLA0KPiB3aGljaCBtaWdodA0KPiA+ICsJICogdHJpZ2dlciB0aGUg
cG9zc2libGUgY2lydWxhciBsb2NraW5nIGRlcGVuZGVuY3kgd2FybmluZy4NCj4gDQo+IFRoaXMg
aXMgbm90IGV2ZW4gY2xvc2UgdG8gYSBsb2NraW5nIGJ1Z2ZpeC4gQ29uc2lkZXIgdGhpcyBhIGZv
cm1hbCBuYWNrLA0KPiBiZWNhdXNlIHRoZSBpc3N1ZSBoZXJlIGlzIG5vdCBldmVuIGNsb3NlIHRv
ICJuZWVkcyBtb3JlIGNvbW1lbnRzIHRvDQo+IGV4cGxhaW4gd2hhdCdzIGdvaW5nIG9uIi4NCj4g
LURhbmllbA0KDQpUaGUgcHVycG9zZSBvZiB0aGUgY29tbWVudCBoZXJlIGl0IGlzIHRvIGV4cGxh
aW4gbG9ja2luZyBpc3N1ZSBjb25kaXRpb24NCj4gDQo+ID4gKwkgKiBDaGVjayB0aGUgcmVzZXRf
aW5fcHJvZ3Jlc3MgZmxhZywgY2FsbCBhc3luYyB2ZXJpb24gaWYgcmVzZXQgaXMgaW4NCj4gcHJv
Z3Jlc3MuDQoNCg0KVGhlIGNvbW1lbnQgaGVyZSBleHBsYWlucyBjaGVjayB3aXRoIHRoZSBmbGFn
IHRvIGF2b2lkIGxvY2tpbmcgY29uZGl0aW9uLg0KVGhlIHJlc2V0IHByb2Nlc3MgaXMgbm90IGNv
bnNpZGVyZWQgdG8gYmUgY29tcGxldGUgaW4gc2hvcnQgdGltZSwgb3RoZXIgdGhhbiB0aGF0LCBk
byB3ZSBtaXNzZWQgYW55dGhpbmc/DQoNCj4gPiArCSAqLw0KPiA+ICsJaWYgKGd1Y190b19ndChn
dWMpLT51Yy5yZXNldF9pbl9wcm9ncmVzcykNCj4gPiArCQljYW5jZWxfZGVsYXllZF93b3JrKCZn
dWMtPnRpbWVzdGFtcC53b3JrKTsNCj4gPiArCWVsc2UNCj4gPiArCQljYW5jZWxfZGVsYXllZF93
b3JrX3N5bmMoJmd1Yy0+dGltZXN0YW1wLndvcmspOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGlj
IHZvaWQgX19yZXNldF9ndWNfYnVzeW5lc3Nfc3RhdHMoc3RydWN0IGludGVsX2d1YyAqZ3VjKQ0K
PiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4gDQo+IC0tDQo+IERhbmllbCBWZXR0ZXINCj4gU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uDQo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNo
DQo=
