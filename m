Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019055ECC73
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 20:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670A410E0DB;
	Tue, 27 Sep 2022 18:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2C10E0DB;
 Tue, 27 Sep 2022 18:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664304887; x=1695840887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BRzPjBgpRkRytt55bPngEOHq5taXtIpvCpBb/Ud1WAk=;
 b=ilCyw+0RF/8jBtLs8MkHRWX0pSXfB2cKhFGIX/W0DyhFhsDG0OssIN5v
 JuD7YL1wPlR4MV8BI48k5+jInu88yQOy551Xn4upSKmPCRhvONdkd49J5
 zwX44kkx1Qq9BwS74QdkQOw5mycA9ogh8VjWs0aVg6Lf13MsA8PRCiRBq
 UR4n8EDfckPnk5ZJxJYeFBtOtx0jMl2zRg6jUuxmWe//vR2IPwK3TKRfw
 IuvSkHsnCcYgtzqM/zNxOixAc6lS0Dnn4bOcGGAX9ls6ZTwzKHKzgAgqE
 Y3DViEP2YCaLXXfV2y0cf3Q101wpOr2SAqfozzepQFil3P3xr643ZpsHf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281771407"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="281771407"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 11:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="763984141"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="763984141"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2022 11:54:46 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 11:54:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 11:54:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 11:54:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 11:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOVVMj7EOm9shEve2RPYlT5FDuXcKQal8p/pcr4B3LHG3PwfXYIpS8SeKsNI/G8X+xyl0XY25eacxlQ4xm9cdcCORVXT0R+7dyrFTCtYBLhwZvimSbc8C1jGlUYueRAUPqiTxu4D/Wq3dUzlzqbSdIjK0vWi6X7LBaLAPW76eHkq+H4kQiXh4i2Yws6rnWA8aMBV7Bb1BOHM0SctRvaO0MKjDbcm/AE8s4oVo4qylQnyDcDjkLclu3XQeW5IHApsAglkDOzGtbjz1Ju3kH69Rgcy0+aa6IS+DGBL5sSYhMK4XNqYW+dHh5DWHGhhj3UAt4jaZGZvMujSv2N5b3jvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRzPjBgpRkRytt55bPngEOHq5taXtIpvCpBb/Ud1WAk=;
 b=jZJ4a28vWThYo0YPG3H5CRa9kQX2uowKSgUFbSn+XzPLqeiSX4y8OGPmb1+YWek/uLj+un9+eDJZa2AJU+YjYW6+UvWClLXWLjOFQZ3OtTm6Gtc90MbscmTW6cE0c8hCj8ekSagnIZME+1/BW3uYn0XidKwnXJCF8x9dScCz99WOXms39Vv7YJBjIT4ljDywcZeBIDKARW2fmNxo9jrQ+giDKDe0zKtAg4HRWm5j6CtAwFQNIRxKUNBX3bISWL41fugRImYTfu8u9fDHPh25gQZzFJ+nrkeh02gPZdGK66fNZFxspWl5GuC4v3/lA4SnM58H7etLFwmIkdUx5c7wyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 18:54:44 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6f3a:c6aa:731c:d1fd]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6f3a:c6aa:731c:d1fd%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 18:54:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/huc: stall media submission until HuC is loaded
Thread-Topic: [PATCH] drm/i915/huc: stall media submission until HuC is loaded
Thread-Index: AQHYx8e3e0oNkBJqY0GwLo7X0xepCa3zti2A
Date: Tue, 27 Sep 2022 18:54:44 +0000
Message-ID: <7cdb86f1c1b3514257333b96407286369fca9a88.camel@intel.com>
References: <20220913005739.798337-13-daniele.ceraolospurio@intel.com>
 <20220913232212.894826-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220913232212.894826-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SN7PR11MB6849:EE_
x-ms-office365-filtering-correlation-id: c4738091-9471-4e05-fb60-08daa0b9be08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EPfk6rkV9BzsuTmpW+rJLEsNX6RjWe5HMNMXYw0hf6ii1UAg7kj2GQJqHinnFJWArf1+IdXKDS6+PR8gROXldkCto/sjTRmlyrjtJeViqm4C4ahhQ0zB/p10Txb07llQQKhdyUtrj9jCrGw/yUDFejzLRHhQVloZT0Q7iTvMZ8tJCbwWLV6dmd0zhlZZTcjFA03/YRr0BrSV+Kh+CpY6hmJoZvc/k9j3X/ESRkLVtcGqaNFLxfQPWnxsQqZ+PDLGt8c84uTcenwF1mbCvo669nt0DpfcAU/d2EriO7wnhNGr5dW4ckXz9zvVL3lzGamYBHtl2Y/bI8nR/mVV1qUjn8IuT502BdoHoHC6Qv2w8VOc0v61ZXERrhpcI7CRv0PXyVSNL4N6DP8E5Qs04QOT0MmLwknrlIReKfdBm9zYpjC5xRdjpwQrh2fkcaaz4S+rqeYpi7xa1Td44X4ylq8nIfaGYL54WORJkJq/B89aHcV2YlXdoim//Vlh+D9CTfQLvemn8IeNMq4PdetfJkdXPBFl0dWPH5kwQyd5UbDqwHCiGQYKqViICGSoXgXB4PUj2V7Zos9leIofV/fgqrrL0ztQDv7YjuWqnIELqNaLoLwL3+2XYeA/SQcV6H+r+aUAKUTVxRs4p86BW8TFalhLOKlP472EhdLakN2sZ1pSn8YGuNkViWVbLYFKCVxCWUmKf1TYH6pE6XfjqBm/Rs2xFFsLhVOwXAtiLoepQ7j1To3D6/68dmCG7W4zYHLwua69O9an/RDTdfuFGuxAB+/uZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(8936002)(2906002)(41300700001)(5660300002)(36756003)(8676002)(66446008)(66476007)(38100700002)(450100002)(4326008)(76116006)(91956017)(66946007)(110136005)(54906003)(71200400001)(38070700005)(64756008)(478600001)(316002)(66556008)(6486002)(86362001)(107886003)(2616005)(186003)(6506007)(122000001)(82960400001)(83380400001)(26005)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U09uZW9OZDk3aWlLSnNkOHBpRUpoLzhXQ255ZldZeVNLUHJRVDJOSTh1WHls?=
 =?utf-8?B?ems3cVJ1c3JySEo2V0wxeTBzS0NxM0RKQjJlMkVaQVdrWnBwVGhkOVA4Zith?=
 =?utf-8?B?UG4yeFBYbjZ2ajBhNS9nZ3YxQm10alV3UW05WUlzRjUzL3NvMStXVVZrYjVD?=
 =?utf-8?B?YTNsV1NjR3JDU01GdDkybnRITDZqaVBmSkoySlJLZHFERVlKNWlVZVE5UHEy?=
 =?utf-8?B?TUF5VVJvdDZVVk1nTS9RSlNGbnVoeTV0Ym1MWkYycmpSWW1tMy9YZ2pFL3FP?=
 =?utf-8?B?a295MFFIZlRVNjJrb2gyS1FqWFhNWjBWM1EzdDV2ZjJRQ1FZeEtlYk5NM1J5?=
 =?utf-8?B?eExaTnFPT3h2VFFNV1ErOVVHRk5nc3FCVmhSWU1abVduSGtCNTRRVnVnVWFi?=
 =?utf-8?B?WENWRkJIMm5LRitpNHdOZi9sa0prSFUybDdSM082M1M4UzN6T0lNajR0WU1w?=
 =?utf-8?B?WFpBT3JCQXFrZmZOZjdRNTQrK0pJcVBCb1pTcVZ3VEp1ZEgvWVVtZzA3WndF?=
 =?utf-8?B?RjBZVlVZRjlQU3h1WjZiWWtuZ05pejI2UW50RVNxVzF0K2FPeTNtejAvOGNl?=
 =?utf-8?B?K05yTlByMmZrdlRwNEI2NU5KTDhCZUhqUUx5MDYxUmlTRlYrWkFrRTUyN3Vv?=
 =?utf-8?B?V0wyRHViUmNoMnA0MThWUG1BdzVLUFBoeDdNOUdtRVhzNE5paTU4V01GQ3p2?=
 =?utf-8?B?TzJnbUorUWFyL2ZOUXpZZXN1OTFrNlVvbDZqUThMbVhrZ0ZzTUFQR0w0Zi8w?=
 =?utf-8?B?dGhyWDBKTVEwTUZRODVFbnh1MTdnNFlNM1JkZTBEQTd5SWUrdlREaFFIM1Fm?=
 =?utf-8?B?MmRWS3NudUlpazUzK2srQlF2UUZNY1lpaXJFZnVZQzNEdDV1ZWYxNHV4MU45?=
 =?utf-8?B?TUoxM1I1Q2h0QUhpVzFQSS9XMktGY3BMRW5YV3I4SnBlQ1NlWEl4WW8wNVBx?=
 =?utf-8?B?VUhsODFWSzMzWkYxZU1uZ3Y0KzA4Y2xtYStTQnFCcDJVZ2QxQVh1OEo5dkJJ?=
 =?utf-8?B?SzVoaEhXNitranNtOWJocmt5U0xscnVYSmdSUHlWT3lwWE5lTzh2UEluZ1ZZ?=
 =?utf-8?B?N08xamhBR0dSVG5UbTBPTU04MGwyV2ZSL2ZoeXppM3NCR2x4SGJZY0NLcTQx?=
 =?utf-8?B?N0t2YUhnMEhqaDd0M09UY0g2VHN5ZkNxM3VFTURKSGtBZkJNZXNXaWxKY002?=
 =?utf-8?B?dlgraUMrSmw2NmFpY296M25la1pSc0NmdFNVOVNFZklVQk1kTGttanJuK0ZR?=
 =?utf-8?B?RnczMWV5RFRlZVZYb055R2JheklnUXVjdnlhMTZnc3BIWk5xTDIwcENjZTV3?=
 =?utf-8?B?SkpiT2ova0lWSmhjMjdaT1BJaXF3cllrdkE5bnhzNXdrZUZQeFpJamFnY2NZ?=
 =?utf-8?B?Q2pWQnl5Y3NIRzdreFo0ZzUraEp5ZCtWMWx4eHZ6d1c0bW1QV0pndkt4bmFK?=
 =?utf-8?B?UVZKU3F5ekQ1eU5DNlpSRk42MXBhQnJBSXkxT04vNXQxdVpXRkJVV2M2YnEv?=
 =?utf-8?B?eitVb2FZMldiaEFWZk5nYUd5T09uYzYrcys0S294d013YTlLcDRkY2YwaG9w?=
 =?utf-8?B?NHdBZkwwYUp3bUdQWlNEbzVqSnJLUUVqaU8xS25vK1ZaTUxFNVBLUytZN0xw?=
 =?utf-8?B?Q1JsQTNFRTJ0Y05XTmNzTGZVM1BNZ0RKa0JkamZxbk1SanoxUk5oQzgzQnM1?=
 =?utf-8?B?Z2NKbzZyKzUxcEtlUDlCcXMwcjZmZnFmVHI1NzJiOTlCbG5paWc1d2IyeEgv?=
 =?utf-8?B?NVF6dm4yNTlBcE9iVmRBMUtCbmx0aU9mK0ZFQ0hxeWgwY2owd3FYTTZFMGVo?=
 =?utf-8?B?UnljZUNPNjl2SFVTV2FwM0sxRXJ0WGFJbVhkSk4ySnJDVDlTSHZNd2hDSU13?=
 =?utf-8?B?aEFhRmVPM3lHOFdtVjNTUFk5OElzMWd6TjJ0M0xPcVozY1p3SU1tWDRXMFpF?=
 =?utf-8?B?U0sydk9RWGZOUWhHbkhLOVFEQ1AwQ0lzOERnYUxkaXZYcDYxRXdMM2FQamhP?=
 =?utf-8?B?ODdSUEw5NytKT0RlQ2xwVERiaTdld01CY3YzWmhkS1FZNWpNaFVLeEI4dXgr?=
 =?utf-8?B?bUxXaEtaMHVjMzFrNXphWjRhc2Irc0s2MUdZbm4xTzVmcndSSW9rVzVsT3d2?=
 =?utf-8?B?bFNFOUdXc1BKSUFyd2FnR3RHWlVJbm43QkZKVkJxSkdNNndUTVRpUVVZVlFZ?=
 =?utf-8?Q?ezkuF6J19N8IDqKHvMTEsPE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <450C668839E63340B54981396ADFB8F8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4738091-9471-4e05-fb60-08daa0b9be08
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 18:54:44.3531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51D+t4D4XZl5/QwTgQWGZ/gkRquVA68Qo9EcmmmlvjDRx78zrhw8sx3SvD7+l7WMrDP3r0rLi9eO69tp29B4Z9+16iwsRxn0+eNmrL42paAwO7SuVsBjRqHR58CjAxjl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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
Cc: "Ye, Tony" <tony.ye@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIFR1ZSwgMjAyMi0wOS0xMyBhdCAxNjoyMiAtMDcwMCwgQ2VyYW9sbyBTcHVyaW8sIERh
bmllbGUgd3JvdGU6DQo+IFdhaXQgb24gdGhlIGZlbmNlIHRvIGJlIHNpZ25hbGxlZCB0byBhdm9p
ZCB0aGUgc3VibWlzc2lvbnMgZmluZGluZyBIdUMNCj4gbm90IHlldCBsb2FkZWQuDQo+IA0KPiB2
MjogdXNlIGRlZGljYWRlZCB3YWl0X3F1ZXVlX2VudHJ5IGZvciB3YWl0aW5nIGluIEh1QyBsb2Fk
LCBhcyBzdWJtaXRxDQo+IGNhbid0IGJlIHJlLXVzZWQgZm9yIGl0Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4NCj4gQ2M6IFRvbnkgWWUgPHRvbnkueWVAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTog
QWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+ICN2MQ0KPiBB
Y2tlZC1ieTogVG9ueSBZZSA8dG9ueS55ZUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmggfCAgNiArKysrKysNCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcmVxdWVzdC5jICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuaCAgICB8ICA1ICsrKysrDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gDQpbc25pcF0NCg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmggYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuaA0KPiBpbmRleCA0NzA0MWVjNjhkZjguLmY1ZTFiYjVl
ODU3YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmgNCj4gQEAgLTM0OCw2
ICszNDgsMTEgQEAgc3RydWN0IGk5MTVfcmVxdWVzdCB7DQo+ICAjZGVmaW5lCUdVQ19QUklPX0ZJ
TkkJMHhmZQ0KPiAgCXU4IGd1Y19wcmlvOw0KPiAgDQo+ICsJLyoqDQo+ICsJICogQGh1Y3E6IHdh
aXQgcXVldWUgZW50cnkgdXNlZCB0byB3YWl0IG9uIHRoZSBIdUMgbG9hZCB0byBjb21wbGV0ZQ0K
PiArCSAqLw0KPiArCXdhaXRfcXVldWVfZW50cnlfdCBodWNxOw0KPiArDQo+IA0KPiANCkkgYmVs
aWV2ZSB0aGF0IGluIGZ1dHVyZSBpZiB3ZSBoYXZlIG11bHRpcGxlIGVuZ2luZXMgdGhhdA0KcmVx
dWlyZXMgYSBzaW1pbGlhciBzdGFsbGVkIGluaXRpYWxpemF0aW9uIHdhaXQsIHdlIHNob3VsZA0K
aGF2ZSBhbiBhcnJheSBvZiBwdHJzIGhlcmUgYW5kIGEgbm90LWh1Yy1zcGVjaWZpYy1oZWxwZXIg
dGhhdA0KY2FuIHNvcnQgb3V0IGFkZGluZyBmZW5jZS1zaWduYWxsZWQtd2FpdGVycy4gQnV0IGZv
ciBub3cgdGhpcyBpcw0KYSB2ZXJ5IHJhcmUgcmFjZSBjb25kaXRpb24gdGhhdCBvbmx5IGhhcHBl
bnMgd2l0aCBIdUMgc28NCnRoaXMgaHVjcSBzcGVjaWZpYyB3YWl0LWVudHJ5IHdpbGwgZG8gZmlu
ZS4gVGh1czoNCg0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVz
LmFsZXhpc0BpbnRlbC5jb20+DQo=
