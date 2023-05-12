Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3F6FFEA2
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 03:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B7F10E612;
	Fri, 12 May 2023 01:58:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2467788FBD;
 Fri, 12 May 2023 01:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683856702; x=1715392702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yU60Ra2kHNU1mWLO69ZkMj+SFvGWC6Wg6aDHnFKpYbc=;
 b=eTfvn2Rd5SitlpNjOvfB5Q6+stn1sLjz3WghzugnSTVF6k0APwlKcO2u
 p9zeFdAWTwakU3lbFKMM0wEDMew3rRFd8XdkjK2+kNSCDtxkZX4X5tiNA
 m9nmVguSzL2eWlD6Sq+d0/sxzjpBcKfz2Bz81Guk/TC1Ex7aHV7h3mmp1
 OAjpG8Z/tbYjmfQZQN3Z+pKbo/NMYl6MlHTuXNJCfqF2n/6DanTCWcaSO
 Mbp83VMV9p6/RXM4DbWZdhx+abnqv/KtDVT4kBai9hovbDzA02bQ3KFRl
 r8+71EgPHVIxMvRwYQrg8y0Q+ocL4hUDN4ltGvwsVtQGqBPKeei3xV9s9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353806163"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="353806163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 18:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824194723"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="824194723"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 11 May 2023 18:58:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 18:58:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 18:58:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 18:58:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 18:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXcC0S+L723Rthm3MCRqXtqYIAfsXolmQwH+Y3Hcz0P0xdRVEGxjg077VMsfypBzFO5irz+fPZ9jomkO69G6ktTyHaXIBqT/p9nBiQ725jzV6AEgOG3RerU1w8QTlhdZ9cXpt5DCcu9Sue7uNo4sQfu/FoM+0uVroeQeVokbcJ0uN24ERpMbY8ZpXxFGA2WkD73y9fdtyYxj54I4yALKgIaAqdCY6iznEn0QwAZbF3b/+5vBB2YEtT9ae70EuyxXt7XPxn384W9fex7ju/PVGZVv+abxrdPYBDEZwtppHii08BFa2hS95coN8dlS3YsAQhUJ/HCKkstheVeq1aq45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU60Ra2kHNU1mWLO69ZkMj+SFvGWC6Wg6aDHnFKpYbc=;
 b=oH+pOSmp84HvFLE+xNQfJAYA1t1qOnmcu6TtR/bMXmq2+MLh9eCJfBipkRZQgXhN14WfQe6Npeo4RIRwmn45Ys8Dclav7khWqfSMv3h8wCty7obsu18HRGhrE1Ko1e0tmlV6Uu3WWARSgvaO6Mines4e7ZLSDa+eNPwqRtjr8i76m+g/I543mLQRxwfv7vD4vdjg6k8mphy+TNO4aKNI1Xd4hl7OyAuPnWDV4sLipz8osg2zu7dkawclsgJkoKTM4TBqsxFJm9x6tvOpq+Myv/KCt+MjfPGvAHPMrVwgI0W964stMpdKjMoTAodofoEFRl6Vwh439WdHV3j1KBa35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Fri, 12 May 2023 01:58:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 01:58:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix confused register capture
 list creation
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/guc: Fix confused register capture
 list creation
Thread-Index: AQHZhHIZJSRNzeqszkW+KrJiVPA8Cq9V4YmA
Date: Fri, 12 May 2023 01:58:16 +0000
Message-ID: <5c7ac1ff4fb10badccb636d4aea2ad86bc9bbd4e.camel@intel.com>
References: <20230512013544.3367606-1-John.C.Harrison@Intel.com>
In-Reply-To: <20230512013544.3367606-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB5125:EE_
x-ms-office365-filtering-correlation-id: 424363ef-9368-4f9e-9057-08db528c5a7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bEF1lynfhbZUcH8zoE0yE78tuyQGkuPYDn3MXstv1Qh/QPMk0NzsP5nNTU4r2+cpPaw0aPSJ19TvmWkzofm33ySDVpBLLcL9oN0LI+RgKUYc5zTvWfNG/IvbgAnoW8r3BsPbnexAlI4u8wyxLUSFPYuBEEELK74U+4RQEYhcGlQNPZior9TgfZP/ZhqjGOih23mBwS6w1E7KNeuZS1foxTsjP8a7TNB7SNnB7SWWP3Wp2kLlx3Ldc6ILf+3/9OO2PuY3BxTpp9x5K0dqGkASfjc5MJLnkjceBfRWh0OE/p5LZ6nln0+K0PMCA2coJE5c01lfuIkr4gFrgZpvoEwLpH2R6MFoBiPui0fPOgY9+cc85o09401+zgo4pbKsFhxQ//ukLVoOvBCxZ/zf/UIZNXvqezgnPrFDWGmRQ+JS448vm03HEO32vdGmeuHqHvB79/x6TY3sBek0IJjbIqRpG4hQ5AMpiV8jIuAXbiOQCtf6/Uqqm+dUMoSdvQi2bXpGFOhDD0rd7vFy2zquXWZEEP6bqP52ewRptEYc71VQHNHNIaPGWm2+qB4v+RkNeloSI9MMw6ql2kaKjB6AeXHDOuvddh+zNZiQ4ZdcUgAlOB/UEX5ybJl6osOOsAXG1Ekb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(86362001)(66946007)(71200400001)(91956017)(450100002)(478600001)(6486002)(6506007)(26005)(110136005)(2616005)(6512007)(186003)(66556008)(38100700002)(122000001)(36756003)(38070700005)(66476007)(2906002)(4326008)(64756008)(82960400001)(5660300002)(41300700001)(76116006)(66446008)(8936002)(316002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVJrdzgxZGJFWXprZW4yOGNPTGMyR1NOY21DeG5wcmtvbkw3MnhYeW5uZ20w?=
 =?utf-8?B?Q0tuWko4YkovTTNMLzBFWnpINDhYLzY5VUlpRVdzSmRIcEJIaU1ZcDM3YW9i?=
 =?utf-8?B?V2RCaTdUYzZmWDJQZkwxenVLZ0RIa24xVm1sUHZYMVZ2Ny92NS9OZ3RlZnMw?=
 =?utf-8?B?WmpDdGFocXNFYWU2V00yR1BZQ3dNOVBIaDBQNXFEZmpNV1ZSNEEwdSthNExj?=
 =?utf-8?B?aENQMytPaUwwY0dCMHdwSnVlQTZNb1lEeCs1VXRBOENWQkxaWmlLSmh3bVh6?=
 =?utf-8?B?SWNMVmlmTlpUWUNuUmorYStkRXpick92R29PSW4zdWZLSUlVYWZac0FZSlF4?=
 =?utf-8?B?eDdCYmJ0MXdaTktZMmk0ZHVvYWlUNGdITFVubXY1aWh0NG4wbFVybUh1NTJE?=
 =?utf-8?B?M0U5Tlc3cHA0eG95VVVZSERhd2ZjbG15TTYyZ0dHbkJYM0o5a3BDTzRUdE5t?=
 =?utf-8?B?MVdmNGRSVDBhamRjVm1DTkZybUs2WFNFTmhkK2NPQlZRUTlSV04vWDBQNFV4?=
 =?utf-8?B?cjY4OVQ1VkFIL054cmdkNm05YXFOalB6K0w4UGdMR0QzYU93aXJNV2hyeENM?=
 =?utf-8?B?UEJTSE9mM3lXNjJTNStadFNsUkYyaVY3VVdBRTg2Uy9QcWZ6TFJwM0JFd2g5?=
 =?utf-8?B?aTZkUWtyYkdDcVZLQTU2TVU0U1FNQVl5S2NOSHdkS2g3Z2Q4SDVVQW5aVGRU?=
 =?utf-8?B?ZzIzdGdQbTdHYU44OFNRdjNoZGVxOEEyU2FuRDlZQzluZkZqeVpiR2Ivb29S?=
 =?utf-8?B?SStqZkIyYUYvQXhxNTYyY3hyeWtIVDNsd0ZsdUtNMU41N0JzdnhRNXN3czB3?=
 =?utf-8?B?WnBHZ0pLQlNzbXJucmpCamFHSWRJQlhRM0Q4S3BmdVpyOGdKMXY1MXlGR2Vz?=
 =?utf-8?B?clhzUUpIVVpIalhNTzg0WlY3UDE4U01uVU5IWTlNS202YzV5RGR4OGlhMzZ3?=
 =?utf-8?B?QUhrMTd1UmRVc3JmTitOdExJTjlHWkhoNGVvdGEvVjV3c3FYRS9WdHJWaXZL?=
 =?utf-8?B?Q0V5Rnh1MWdZOThxUHRibnlEMzk3VWgxenp6NzZ5MGdXcGk0ZFBYeWhua2RD?=
 =?utf-8?B?YjRxNFBoWVdQTzdIN3h4V05vNU4vRU5ydVVrSForcVVOUkdVdW1HVkxtdTRW?=
 =?utf-8?B?RkJNWFhwa2x0OXR3NDZGa215UnRUT1YxM1BlL2RqakdrbVhGdEFiRGJyTVh4?=
 =?utf-8?B?SmU3ZGdialFPOWNXdHhFSEFxeHo4K3BicmdSeVdWRnU1U3JZVGw5dW5Jekpo?=
 =?utf-8?B?WEt0OGRuK0h2VzJSSmMyZHV0dGVMS1RlTlhOL1NIbHBaeC9seDlQU0ZBMGdG?=
 =?utf-8?B?dC8yY3RLbDBkb3hFUGhrTk95NTk3a25WVXJybndMQ3RjSEN6azFyNmYwd1hP?=
 =?utf-8?B?c0NoK2Zha0o4dXRpcGd4R29ZeTAvNTRzS0o0ZllqUXBLVVQvRktLcUZQbUwz?=
 =?utf-8?B?a0VGSnZUL0hONWZvc0syV0twOXdTVkdaTWhsSGNzUjdNY28rTzJ3QkdabGpw?=
 =?utf-8?B?WGtpbG5PNWVkK2x1b0doYWxRN0pjNUhvMFdvNnNlR2FsN1AwU082NXE5MEhI?=
 =?utf-8?B?OE1wU0RodjR5ajZGQnczaGNJczhZY1hzUlNjSnQ0T1Vod3IyUzFxUFZ3SG1N?=
 =?utf-8?B?OURWQVkyRnUrMDM4ODBxbGxwSkRNcDVHeVdzNTZBV1BBbzBGMWRzSU92MWgw?=
 =?utf-8?B?S3pleG5OeHBMQ0dwQmtxd0M3dWFQNWdXNWFQenlzd08yTzlFbnZwY1VnWnpH?=
 =?utf-8?B?MDhnYnZxM0lUQXp3RGRaLzZCa3lLY2d3RGVFK0RqQTJzSXFvdGx5VmkyMElk?=
 =?utf-8?B?aENyNFRUVUJFcXp6UTBhaDJVMHRobnZrOFV0UTUwOVJZMmtiUjRiUnV6dFVS?=
 =?utf-8?B?a05Rc3pZa0JpZE01SDZpcjVvb3ordzVNdTQ3UzBlZHdHdml1UGpCRDlwMDky?=
 =?utf-8?B?TEZTc3FNNXNOWXNkaEp4aThMSlN3RXprRzFKeGN6SGgxZ3lubStadWVjZytj?=
 =?utf-8?B?eWxxNmFVNld4YzRoRGtqdUFsNFpVRUdtQStFVHd3OEY4T0h1VDFLZHMrTkJC?=
 =?utf-8?B?ZCtQdXZiT2lVWTRkUzhTbWpUNm9VUFBZK2tlY0FKKzNyQVZrVFRxUlNMajQ2?=
 =?utf-8?B?YTZUd2c2TFU1VWNnYkJsQXVocUFEM1JQOXRRNDN5RDBoanR0eHpNRHpwcnA4?=
 =?utf-8?Q?vltK6xo2P68UN9O1oYKFK0k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E076CE9F3B9FF40B086E5CD583F9693@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424363ef-9368-4f9e-9057-08db528c5a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 01:58:16.9564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ooIc03x4RIIzVcIh/AnwFBKvBrlLkNCrxYnUU7o0Cef8CttjlMvtkQUyCiSR3vGSmDUw14LEIWha17yy92e/74E+AjcPMXo6mte7nQxHlpQU0TQSnykwKV4VbnrK3CVU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
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

T24gVGh1LCAyMDIzLTA1LTExIGF0IDE4OjM1IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlIEd1QyBoYXMgYSBjb21wbGV0ZWx5IHNlcGFyYXRlIGVuZ2luZSBjbGFz
cyBlbnVtIHdoZW4gcmVmZXJyaW5nIHRvDQo+IHJlZ2lzdGVyIGNhcHR1cmUgbGlzdHMsIHdoaWNo
IGNvbWJpbmVzIHJlbmRlciBhbmQgY29tcHV0ZS4gVGhlIGRyaXZlcg0KPiB3YXMgdXNpbmcgdGhl
ICdub3JtYWwnIEd1QyBzcGVjaWZpYyBlbmdpbmUgY2xhc3MgZW51bSBpbnN0ZWFkLiBUaGF0DQo+
IG1lYW50IHRoYXQgaXQgdGhvdWdodCBpdCB3YXMgZGVmaW5pbmcgYSBjYXB0dXJlIGxpc3QgZm9y
IGNvbXB1dGUNCj4gZW5naW5lcywgdGhlIGxpc3Qgd2FzIGFjdHVhbGx5IGJlaW5nIGFwcGxpZWQg
dG8gdGhlIEdTQyBlbmdpbmUuIEFuZCBpZg0KPiBhIHBsYXRmb3JtIGRpZG4ndCBoYXZlIGEgcmVu
ZGVyIGVuZ2luZSwgdGhlbiBpdCB3b3VsZCBnZXQgbm8gY29tcHV0ZQ0KPiByZWdpc3RlciBjYXB0
dXJlcyBhdCBhbGwuDQo+IA0KPiBGaXggdGhhdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4g
SGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQphbGFuOnNuaXAuDQoNCkxHVE0s
IHNpbXBsZSBhbmQgc3RyYWlnaHQtZm9yd2FyZCBwYXRjaCAtIGFsdGhvdWdoIGkgY2FuIG9ubHkg
aW1hZ2luZSB0aGUNCnBhaW4gb2YgZGVidWdnaW5nIHRoaXMgb25lLiBTbyBmb3IgdGhlIGJlbmVm
aXQgb2Ygb3RoZXJzIG9uIHRoZSBtYWlsaW5nDQpsaXN0LCBiZWNhdXNlIHRoZSBDT01QVVRFIGFu
ZCBSRU5ERVIgZW51bSBvZiB0aGUgaTkxNSAobm90LUd1Qy1BQkkpIHdhcw0KZGlmZmVyZW50LCBi
dXQgdGhlIEd1Qy1BQkkgb25lIHdhcyB1c2luZyB0aGUgaXRzIG93biBSZW5kZXIgZm9yIGJvdGgs
DQooY29pbmNpZGVudGlhbGx5ICcwJyA9PSByZW5kZXIgZm9yIGJvdGggR1VDLUFCSSBhbmQgaTkx
NSksIGl0IG1lYW5zIHRoYXQNCkFEUyBwb3B1bHRpb24gb2YgY2FwdHVyZS1yZWdpc3RlciBsaXN0
IHdvdWxkIG9ubHkgY2F1c2UgcHJvYmxlbXMgZm9yDQpkZXZpY2VzIHRoYXQgaGFkIG5vIHJlbmRl
ciBvciBoYXMgYSBHU0MgKGFsbCBoYXZlIFZEL1ZFL0JsdCkuIFNvIE1UTA0KaXMgbm90IHlldCBm
dWxseSBQT1IgYW5kIG5vbmUgb2YgdGhlIGV4aXN0aW5nIHVwc3RyZWFtIHN1cHBvcnRlZCBkZXZp
Y2VzDQpoYWQgbm8gcmVuZGVyIGVuZ2luZSBzbyB0aGVyZWZvcmUgdGhlICJGaXhlcyIgdGFnIGlz
bid0IG5lZWRlZCBJSVVDLg0KDQpUaGF0IHNhaWQsIHBlbmRpbmcgQ0kgcmVzdWx0cywNClJldmll
d2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4N
Cg==
