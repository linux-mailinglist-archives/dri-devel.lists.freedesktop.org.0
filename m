Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF48767962
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 02:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44610E7AB;
	Sat, 29 Jul 2023 00:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC60610E7AB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 00:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690589317; x=1722125317;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tpQ4y7GqFSk1S3ZkSAttO3eBCMUT89jKjwyfmIjUDEg=;
 b=ZPhSX0tjrbt1lWHTv9BR+H6Df+4YPNdWnh27YrFzHTkr4FRW1fHaMP0d
 EOO2ZxM8ZFfUhkqskFnOtdDCxrp+y273YpWQHh0TNohuUluZAd3y1K8SC
 qzEQXUi+CU3JbdBBQgJ4Z40G9C0VtJvLA7+2Wx0eK5Kji7XI1fDpuNiGR
 ZivFIzTcDjX+ZrkmT5eqOiD5jAc2fnu2VOucMuszQxyhdO7zHpxcJPWmJ
 CPHMYvUb6EKSWymifwSftfC5aE0cvBEaCvsFpyftYVh4vSznB3o/KMAuR
 Wqu3yc77Sn0n0XrQmLKN7Y9tF8ivS/G6FwAB+2J36ruLwtZ8PPYyQZ9o6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="432519231"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="432519231"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 17:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="871006538"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 17:08:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 17:08:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 17:08:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 17:08:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 17:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtEzwWQ58ijFkngHNZ+u8oZtVN+NvPDgP0QzmuGH8Z+HNRBoi0LpG2r/lFdJw1Tztuq5ruM9FyjZh0x961JZZbSjp8LxJSFnrSQG3dFeSBfEtRM1Rt9VGSTW0ImypPSGSXCPJUXVly3YKRWMCFeTSRIdq7FGQhHpCXQepPKxoUMOA5MaDpJhWEHBDXktRkaaoFctmzgiY/w5ouNmTU3ZfR7uQ5iIw28GnbBZcR2UW1+o7jhxezimsY0WZqV3b2RPPInmmKET3p56lkPdl9n82kSjMTPKS/8gejcpLdmkW90ZJWLYq3w+1gqHXSK9b4vuDX3Ai2kvyoGcPFdgCNBKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpQ4y7GqFSk1S3ZkSAttO3eBCMUT89jKjwyfmIjUDEg=;
 b=d3M3lLn38YaP62Jsf190Y+rRyudRDzKWX07+gkfM/g0MvslU1Qip+9nAz5rNGlrtchGwx5jX9ABgei4XU+YDddLdxAaTEWfm3iBiG+1OL7Yjd3smxVlDkKl6Epxg51LvcFVbSP9UgJclZXgLRDIU/vXeTmqrduJY7MB87kk5rDCryKLqZEIGiCVqeSMOxMyPBgsN79Fi5PMnf3+g/n0eeet6+1VNQWWY3JIa4tryvpKGIoLOBGQWLxI0EFLeraD2F1sSo4Yze8gL4wlFea/YTBlNgeaQ3qxSsmG+9wC/YoA4qlKOd0sry2QNV47Jj4oHwIhmBVjwWCx3BaIDR855xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Sat, 29 Jul
 2023 00:08:26 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7%5]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 00:08:26 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IAAwXOAgADrBVCAA1oygIAAWIfA
Date: Sat, 29 Jul 2023 00:08:25 +0000
Message-ID: <CH3PR11MB7177832A92B4F550BF816E0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
 <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMLk8aMmpkK7ZCsW@x1n>
In-Reply-To: <ZMLk8aMmpkK7ZCsW@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|SJ0PR11MB4845:EE_
x-ms-office365-filtering-correlation-id: 432befbd-ff8b-4f25-7ea0-08db8fc7edcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w43UWyJCyS4lkkO1Q0Jha7A4t9+a2JPD8VwGBV2Ho4OBqexX6hvWxiooY7igpCXn7Eh+Un4gTlf4zstTVo2RerG7FIFHk7bEiA+N8LYCxT4KZqzcRsI8iatt4BEhuDYUakGWBO+940E7jh3Ro7eWAie5uFmi7qM+jOasA3/elK54PS4CVLMn/WOXWHbjborQj8cAROes4346qJa5/+AeRKZdat2mVxiHfyx/t6ywgvYfsZXyUE5wYcKCaHNj0G5xVnwu3OL1LBkPrL0x5PrB+fx5arTVftwJOwQc6K+x/xs5E76i8jjpPq7x/EPMcVIp8txOkWc0tkJiNcMP0vY1wnbob87VwLpnrzYClqm0/L6RswAkM60PztyKn9GTSIJy4RYv0LCyH2FrysoYR9BGZNWMU14I2d5t5s9IyQJ5socIeoi9DLQC/uugZkReFy7M3lCkCowoxzTOOCbhncTbhfeKGQuyX9AAy0X4yRDroVARsKoQWNt7vQmCKrZO2Y99stna9adsR53uW/27Cx2Spgnv0R5wzbTBDrjzuot03CYEH7Ci3H3aFJnDSQDHbd/ySpxY0SbKq/ZJIhBc8kX0HZGhW4gHqlMJ1KBY8xrLNbM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(7696005)(71200400001)(26005)(9686003)(6506007)(966005)(478600001)(82960400001)(122000001)(54906003)(186003)(6916009)(4326008)(83380400001)(64756008)(66476007)(66446008)(66946007)(66556008)(76116006)(38100700002)(5660300002)(52536014)(8676002)(8936002)(38070700005)(33656002)(15650500001)(41300700001)(2906002)(316002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlhwcExmSTdsNlpaRlNhTldrRlZybks5alRBZVJXT3lub2UxK1F1MGpuanMr?=
 =?utf-8?B?bDd1anlxdWZ3K1ZQbmpGOXJvUXNkL1A0UlJpUDM0QmtxQnVjTkZQU1hueXdG?=
 =?utf-8?B?UFZjVmtQNk9sZlJqQWd1cVNPRlFINGptYXF0QUE5K3JIWjZHQzJBQkhEY3FN?=
 =?utf-8?B?K0JMdWtUTndOUC82azNXc1dtOXZMbWNBK2ZLbHNPT3NBbnlqN2RYYTR2SDE0?=
 =?utf-8?B?QVlUeXdtUHlrSVVNaGhxTkI2cENjb3BlVzBIN1Bxb3M2Zk8wUHB4Mkhyb28z?=
 =?utf-8?B?UXFVdjhLZzArclBwc3NvUHFuSlRpVWpGbTRidlY3Z2xXaHgxaDU3cVMzS0JL?=
 =?utf-8?B?b24rNTUzQVNMZTVaVlkzTEVWekxQOHZtVkxFWThKeHMvWGhrVHkvUktYQi85?=
 =?utf-8?B?cTEweTh1RXZqLzVRMitXT0w0bG9YM2VsMjhidlUvRDV4UVJ1Z1Z5SE5JaXRs?=
 =?utf-8?B?bzRRTXNDbTVvYTd3SllUZWRPSWtxRW5ZbHlRNjZjVUhleXJGa2VZcERpM2Ur?=
 =?utf-8?B?REFuYjdRdyt4YnVXNjY5WFBJRFB3VnNBWEdVbHRqMDgxK0tmdE1rR1BYUTJM?=
 =?utf-8?B?ZURNWlh3THpuRytqWlQyMGY4V0ttY21iNnFnampWc3Z2OXJ6UElKN1NGYlJt?=
 =?utf-8?B?cWR4MGQyRDkwa0hUU2N2cVp1TmNWcWdQSHBQSXowak12NlJEQ0Ivc0Iwa1ht?=
 =?utf-8?B?N2R2bkgyNmtTRDgyVWpOSFhmdXRCVDBCUG9QU2pLdHpqNFZCSkpTQ2kvNFBZ?=
 =?utf-8?B?U05USFFBVUNHK1dYVGxhMyt5ZXZLSXNoRDVJaXVVR0lYZ0ZqZ1lzcHlRMjVX?=
 =?utf-8?B?ajArbU9xSnRGNkoxL1FKbGtNUjIwQUVXSWdtSTZic1RQeWJoOVFnNk5wa05C?=
 =?utf-8?B?N2RMSWhWYm9FSisvUWxoYVFYN3UrczZQTVZES1p4bXp0ZjRUQnBQRG9aVXBN?=
 =?utf-8?B?Vk11M2ZacFlkL0JteXhMMG8yNWpEV3ZCSWhJTU5STk1YQjFKeHZWdnhBbXAr?=
 =?utf-8?B?Q3hOR1hTdi9Da2gvMFZaSzBkY3JuV0dzZVQ5UTYyZ3F2d2dYZTdiMktvQ0l4?=
 =?utf-8?B?YVB1RDJoOUZuTmxEKzNqcXd4NDJDWWpTcWdhSitvN0VqWGJzLzE4M2pyZjhB?=
 =?utf-8?B?ZGVHRHFRRFhQak82OGFBekRUN1FLSmZDblFEem9XRU9INFU5NXBsOU16K2Ry?=
 =?utf-8?B?KzZrbGw1c3J3MXBKd0Faa2ZLUWlmdWQ1ejB3alhEYUdhK3IrUlhEbTkzUkll?=
 =?utf-8?B?M2VsRjZvaHFpKytxV1dUaEFMVlZicW1ScS8yNGFDNHozWWtSNEtWZ0JCMHFZ?=
 =?utf-8?B?TVFnbldwelN4SEkxaWpzMDQ0ei9ycDV3REdUaUt5c0I3enliSjRUenlwKzhP?=
 =?utf-8?B?Qjg0YUVOUUR3TWQ0c1J0SVI0LzhYTmdqRkdHNnFvWEE3Ynd5MjgrL2JPYnFW?=
 =?utf-8?B?cVpiVXNrRkFKR1RjV0ExVkRuUmtsZ2ppR0IxQzVVSEJGY3o4a0dOZjJnZ1VE?=
 =?utf-8?B?K2tnekluekpTdXZ6Q2lHODFvbjEvL0FOVDYwVVVWbjd0TTgrc0tJWnFTVEp5?=
 =?utf-8?B?YjJ1ZHdFUkpnZGlvc3pLQjVkTE9uRWJnc2s5UnFUMW1Vem96RkRrYVJHUHpy?=
 =?utf-8?B?VE1qcFVpUURqMGR5QjIvMTZTRWpTeXRkMHJxRUVoZytvWm1pakY5bU1nVUVy?=
 =?utf-8?B?M3B0MWorS3hsanZKUHhDS29COVQ3bUltUS9xTDYzbWdBWVRKNTFvcWhQejQx?=
 =?utf-8?B?ZXJuRktFamRkaVVxekQ1aWdjVjFERlBNM0dtZGdqaEFyMGRnTGFrUE1ySGh6?=
 =?utf-8?B?Slh0NEJhRXhZNGYzeW8zSS8zUzB1T1ZHRGFDZVpxZ1NjY3NRdlU1L2Vza2tG?=
 =?utf-8?B?NXo3TGVKd2pyd0dKcGxsMVdxcHZpbXd1Z2RseGo0ZzFMcGxCOEkvZWkxUFdX?=
 =?utf-8?B?cmtDb01ZVTZuSmJXWENpL3d5aXpzTFJ4YjAyUEhtVVZ2YUtXUFpMY2Jsek96?=
 =?utf-8?B?RFNzemhDMDVET293Sy9wNU1nZ1h3N0Z1aHd0WUpydlNRVFBhNE5wN2xEZnJr?=
 =?utf-8?B?cW5HelNtbzIwV25wcnNUamE0VnhqT0tMY2ZrcGN2cTZ2YzNJM1U3UlVtZUIy?=
 =?utf-8?Q?hFiuuQJgNS3FJRh6UQ1lUvWCX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432befbd-ff8b-4f25-7ea0-08db8fc7edcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 00:08:25.3674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VzmZwXMvmB0sYYTPOxwflzSOUd3oj+K+mL1DmKK7AVaw7XK3FR00hd66AZV9vNvKSg0F6Q/T7vK2WPeBXSF+yQYk384lIh+ChWy66oLbDv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsDQoNCj4gPiA+ID4gPiA+ID4gSSdtIG5vdCBhdCBhbGwgZmFtaWxpYXIgd2l0aCB0
aGUgdWRtYWJ1ZiB1c2UgY2FzZSBidXQgdGhhdCBzb3VuZHMNCj4gPiA+ID4gPiA+ID4gYnJpdHRs
ZSBhbmQgZWZmZWN0aXZlbHkgbWFrZXMgdGhpcyBub3RpZmllciB1ZG1hYnVmIHNwZWNpZmljIHJp
Z2h0Pw0KPiA+ID4gPiA+ID4gT2gsIFFlbXUgdXNlcyB0aGUgdWRtYWJ1ZiBkcml2ZXIgdG8gcHJv
dmlkZSBIb3N0IEdyYXBoaWNzDQo+ID4gPiBjb21wb25lbnRzDQo+ID4gPiA+ID4gPiAoc3VjaCBh
cyBTcGljZSwgR3N0cmVhbWVyLCBVSSwgZXRjKSB6ZXJvLWNvcHkgYWNjZXNzIHRvIEd1ZXN0IGNy
ZWF0ZWQNCj4gPiA+ID4gPiA+IGJ1ZmZlcnMuIEluIG90aGVyIHdvcmRzLCBmcm9tIGEgY29yZSBt
bSBzdGFuZHBvaW50LCB1ZG1hYnVmIGp1c3QNCj4gPiA+ID4gPiA+IGNvbGxlY3RzIGEgYnVuY2gg
b2YgcGFnZXMgKGFzc29jaWF0ZWQgd2l0aCBidWZmZXJzKSBzY2F0dGVyZWQgaW5zaWRlDQo+ID4g
PiA+ID4gPiB0aGUgbWVtZmQgKEd1ZXN0IHJhbSBiYWNrZWQgYnkgc2htZW0gb3IgaHVnZXRsYmZz
KSBhbmQgd3JhcHMNCj4gPiA+ID4gPiA+IHRoZW0gaW4gYSBkbWFidWYgZmQuIEFuZCwgc2luY2Ug
d2UgcHJvdmlkZSB6ZXJvLWNvcHkgYWNjZXNzLCB3ZQ0KPiA+ID4gPiA+ID4gdXNlIERNQSBmZW5j
ZXMgdG8gZW5zdXJlIHRoYXQgdGhlIGNvbXBvbmVudHMgb24gdGhlIEhvc3QgYW5kDQo+ID4gPiA+
ID4gPiBHdWVzdCBkbyBub3QgYWNjZXNzIHRoZSBidWZmZXIgc2ltdWx0YW5lb3VzbHkuDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBTbyB3aHkgZG8geW91IG5lZWQgdG8gdHJhY2sgdXBkYXRlcyBwcm9h
Y3RpdmVseSBsaWtlIHRoaXM/DQo+ID4gPiA+IEFzIERhdmlkIG5vdGVkIGluIHRoZSBlYXJsaWVy
IHNlcmllcywgaWYgUWVtdSBwdW5jaGVzIGEgaG9sZSBpbiBpdHMNCj4gbWVtZmQNCj4gPiA+ID4g
dGhhdCBnb2VzIHRocm91Z2ggcGFnZXMgdGhhdCBhcmUgcmVnaXN0ZXJlZCBhZ2FpbnN0IGEgdWRt
YWJ1ZiBmZCwgdGhlbg0KPiA+ID4gPiB1ZG1hYnVmIG5lZWRzIHRvIHVwZGF0ZSBpdHMgbGlzdCB3
aXRoIG5ldyBwYWdlcyB3aGVuIHRoZSBob2xlIGdldHMNCj4gPiA+ID4gZmlsbGVkIGFmdGVyIChn
dWVzdCkgd3JpdGVzLiBPdGhlcndpc2UsIHdlJ2QgcnVuIGludG8gdGhlIGNvaGVyZW5jeQ0KPiA+
ID4gPiBwcm9ibGVtIChiZXR3ZWVuIHVkbWFidWYgYW5kIG1lbWZkKSBhcyBkZW1vbnN0cmF0ZWQg
aW4gdGhlDQo+IHNlbGZ0ZXN0DQo+ID4gPiA+IChwYXRjaCAjMyBpbiB0aGlzIHNlcmllcykuDQo+
ID4gPg0KPiA+ID4gV291bGRuJ3QgdGhpcyBhbGwgYmUgdmVyeSBtdWNoIGJldHRlciBpZiBRZW11
IHN0b3BwZWQgcHVuY2hpbmcgaG9sZXMNCj4gdGhlcmU/DQo+ID4gSSB0aGluayBob2xlcyBjYW4g
YmUgcHVuY2hlZCBhbnl3aGVyZSBpbiB0aGUgbWVtZmQgZm9yIHZhcmlvdXMgcmVhc29ucy4NCj4g
U29tZQ0KPiANCj4gSSBqdXN0IHN0YXJ0IHRvIHJlYWQgdGhpcyB0aHJlYWQsIGV2ZW4gaGF2ZW4n
dCBmaW5pc2hlZCBhbGwgb2YgdGhlbS4uIGJ1dA0KPiBzbyBmYXIgSSdtIG5vdCBzdXJlIHdoZXRo
ZXIgdGhpcyBpcyByaWdodCBhdCBhbGwuLg0KPiANCj4gdWRtYWJ1ZiBpcyBhIGZpbGUsIGl0IG1l
YW5zIGl0IHNob3VsZCBmb2xsb3cgdGhlIGZpbGUgc2VtYW50aWNzLiBNbXUNClJpZ2h0LCBpdCBp
cyBhIGZpbGUgYnV0IGEgc3BlY2lhbCB0eXBlIG9mIGZpbGUgZ2l2ZW4gdGhhdCBpdCBpcyBhIGRt
YWJ1Zi4gU28sIEFGQUlLLA0Kb3BlcmF0aW9ucyBzdWNoIGFzIHRydW5jYXRlLCBGQUxMT0NfRkxf
UFVOQ0hfSE9MRSwgZXRjIGNhbm5vdCBiZSBkb25lDQpvbiBpdC4gQW5kLCBpbiBvdXIgdXNlLWNh
c2UsIHNpbmNlIHVkbWFidWYgZHJpdmVyIGlzIHNoYXJpbmcgKG9yIGV4cG9ydGluZykgaXRzDQpi
dWZmZXIgKHZpYSB0aGUgZmQpLCBjb25zdW1lcnMgKG9yIGltcG9ydGVycykgb2YgdGhlIGRtYWJ1
ZiBmZCBhcmUgZXhwZWN0ZWQNCnRvIG9ubHkgcmVhZCBmcm9tIGl0Lg0KDQo+IG5vdGlmaWVyIGlz
IHBlci1tbSwgb3RvaC4NCj4gDQo+IEltYWdpbmUgZm9yIHNvbWUgcmVhc29uIFFFTVUgbWFwcGVk
IHRoZSBndWVzdCBwYWdlcyB0d2ljZSwgdWRtYWJ1ZiBpcw0KPiBjcmVhdGVkIHdpdGggdm1hMSwg
c28gdWRtYWJ1ZiByZWdpc3RlcnMgdGhlIG1tIGNoYW5nZXMgb3ZlciB2bWExIG9ubHkuDQpVZG1h
YnVmcyBhcmUgY3JlYXRlZCB3aXRoIHBhZ2VzIG9idGFpbmVkIGZyb20gdGhlIG1hcHBpbmcgdXNp
bmcgb2Zmc2V0cw0KcHJvdmlkZWQgYnkgUWVtdS4gDQoNCj4gDQo+IEhvd2V2ZXIgdGhlIHNobWVt
L2h1Z2V0bGIgcGFnZSBjYWNoZSBjYW4gYmUgcG9wdWxhdGVkIGluIGVpdGhlciB2bWExLCBvcg0K
PiB2bWEyLiAgSXQgbWVhbnMgd2hlbiBwb3B1bGF0aW5nIG9uIHZtYTIgdWRtYWJ1ZiB3b24ndCBn
ZXQgdXBkYXRlIG5vdGlmeQ0KPiBhdA0KPiBhbGwsIHVkbWFidWYgcGFnZXMgY2FuIHN0aWxsIGJl
IG9ic29sZXRlLiAgU2FtZSB0aGluZyB0byB3aGVuIG11bHRpLXByb2Nlc3MNCkluIHRoaXMgKHVu
bGlrZWx5KSBzY2VuYXJpbyB5b3UgZGVzY3JpYmVkIGFib3ZlLCBJIHRoaW5rIHdlIGNvdWxkIHN0
aWxsIGZpbmQgYWxsIHRoZQ0KVk1BcyAoYW5kIHJhbmdlcykgd2hlcmUgdGhlIGd1ZXN0IGJ1ZmZl
ciBwYWdlcyBhcmUgbWFwcGVkIChhbmQgcmVnaXN0ZXINCmZvciBQVEUgdXBkYXRlcykgdXNpbmcg
UWVtdSdzIG1tX3N0cnVjdC4gVGhlIGJlbG93IGNvZGUgY2FuIGJlIG1vZGlmaWVkDQp0byBjcmVh
dGUgYSBsaXN0IG9mIFZNQXMgd2hlcmUgdGhlIGd1ZXN0IGJ1ZmZlciBwYWdlcyBhcmUgbWFwcGVk
Lg0Kc3RhdGljIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqZmluZF9ndWVzdF9yYW1fdm1hKHN0cnVj
dCB1ZG1hYnVmICp1YnVmLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKnZtbV9tbSkNCnsNCiAgICAgICAgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEgPSBOVUxMOw0KICAgICAgICBNQV9TVEFURShtYXMsICZ2bW1fbW0t
Pm1tX210LCAwLCAwKTsNCiAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOw0KICAgICAgICBwZ29m
Zl90IHBnOw0KDQogICAgICAgIG1hc19zZXQoJm1hcywgMCk7DQogICAgICAgIG1tYXBfcmVhZF9s
b2NrKHZtbV9tbSk7DQogICAgICAgIG1hc19mb3JfZWFjaCgmbWFzLCB2bWEsIFVMT05HX01BWCkg
ew0KICAgICAgICAgICAgICAgIGZvciAocGcgPSAwOyBwZyA8IHVidWYtPnBhZ2Vjb3VudDsgcGcr
Kykgew0KICAgICAgICAgICAgICAgICAgICAgICAgYWRkciA9IHBhZ2VfYWRkcmVzc19pbl92bWEo
dWJ1Zi0+cGFnZXNbcGddLCB2bWEpOw0KICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFkZHIg
PT0gLUVGQVVMVCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAg
ICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgIGlmIChhZGRyICE9IC1FRkFVTFQpDQogICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgfQ0KICAgICAgICBtbWFwX3JlYWRf
dW5sb2NrKHZtbV9tbSk7DQoNCiAgICAgICAgcmV0dXJuIHZtYTsNCn0NCg0KPiBRRU1VIGlzIHVz
ZWQsIHdoZXJlIHdlIGNhbiBoYXZlIHZtYTEgaW4gUUVNVSB3aGlsZSB2bWEyIGluIHRoZSBvdGhl
cg0KPiBwcm9jZXNzIGxpa2Ugdmhvc3QtdXNlci4NCj4gDQo+IEkgdGhpbmsgdGhlIHRyaWNrIGhl
cmUgaXMgd2UgdHJpZWQgdG8gImhpZGUiIHRoZSBmYWN0IHRoYXQgdGhlc2UgYXJlDQo+IGFjdHVh
bGx5IG5vcm1hbCBmaWxlIHBhZ2VzLCBidXQgd2UncmUgZG9pbmcgUEZOTUFQIG9uIHRoZW0uLi4g
dGhlbiB3ZSB3YW50DQo+IHRoZSBmaWxlIGZlYXR1cmVzIGJhY2ssIGxpa2UgaG9sZSBwdW5jaGlu
Zy4uDQo+IA0KPiBJZiB3ZSB1c2VkIG5vcm1hbCBmaWxlIG9wZXJhdGlvbnMsIGV2ZXJ5dGhpbmcg
d2lsbCBqdXN0IHdvcmsgZmluZTsgVFJVTkNBVEUNCj4gd2lsbCB1bm1hcCB0aGUgaG9zdCBtYXBw
ZWQgZnJhbWUgYnVmZmVycyB3aGVuIG5lZWRlZCwgYW5kIHdoZW4NCj4gYWNjZXNzZWQNCj4gaXQn
bGwgZmF1bHQgb24gZGVtYW5kIGZyb20gdGhlIHBhZ2UgY2FjaGUuICBXZSBzZWVtIHRvIGJlIHRy
eWluZyB0bw0KPiByZWludmVudCAidHJ1bmNhdGlvbiIgZm9yIHBmbm1hcCBidXQgbW11IG5vdGlm
aWVyIGRvZXNuJ3Qgc291bmQgcmlnaHQgdG8NCj4gdGhpcyBhdCBsZWFzdC4uDQpJZiB3ZSBjYW4g
ZmlndXJlIG91dCB0aGUgVk1BIHJhbmdlcyB3aGVyZSB0aGUgZ3Vlc3QgYnVmZmVyIHBhZ2VzIGFy
ZSBtYXBwZWQsDQp3ZSBzaG91bGQgYmUgYWJsZSB0byByZWdpc3RlciBtbXUgbm90aWZpZXJzIGZv
ciB0aG9zZSByYW5nZXMgcmlnaHQ/DQoNCj4gDQo+ID4gb2YgdGhlIHVzZS1jYXNlcyB3aGVyZSB0
aGlzIHdvdWxkIGJlIGRvbmUgd2VyZSBpZGVudGlmaWVkIGJ5IERhdmlkLiBIZXJlDQo+IGlzIHdo
YXQNCj4gPiBoZSBzYWlkIGluIGFuIGVhcmxpZXIgZGlzY3Vzc2lvbjoNCj4gPiAiVGhlcmUgYXJl
ICpwcm9iYWJseSogbW9yZSBpc3N1ZXMgb24gdGhlIFFFTVUgc2lkZSB3aGVuIHVkbWFidWYgaXMN
Cj4gcGFpcmVkDQo+ID4gd2l0aCB0aGluZ3MgbGlrZSBNQURWX0RPTlRORUVEL0ZBTExPQ19GTF9Q
VU5DSF9IT0xFIHVzZWQgZm9yDQo+ID4gdmlydGlvLWJhbGxvb24sIHZpcnRpby1tZW0sIHBvc3Rj
b3B5IGxpdmUgbWlncmF0aW9uLCAuLi4gZm9yIGV4YW1wbGUsIGluIg0KPiANCj4gTm93IGFmdGVy
IHNlZXRoaW5nIHRoaXMsIEknbSB0cnVseSB3b25kZXJpbmcgd2hldGhlciB3ZSBjYW4gc3RpbGwg
c2ltcGx5DQo+IHVzZSB0aGUgZmlsZSBzZW1hbnRpY3Mgd2UgYWxyZWFkeSBoYXZlIChmb3IgZWl0
aGVyIHNobWVtL2h1Z2V0bGIvLi4uKSwgb3INCj4gaXMgaXQgYSBtdXN0IHdlIG5lZWQgdG8gdXNl
IGEgc2luZ2xlIGZkIHRvIHJlcHJlc2VudCBhbGw/DQo+IA0KPiBTYXksIGNhbiB3ZSBqdXN0IHVz
ZSBhIHR1cGxlIChmZCwgcGFnZV9hcnJheSkgcmF0aGVyIHRoYW4gdGhlIHVkbWFidWYNCj4gaXRz
ZWxmIHRvIGRvIGhvc3QgemVyby1jb3B5IG1hcHBpbmc/ICB0aGUgcGFnZV9hcnJheSBjYW4gYmUg
ZS5nLiBhIGxpc3Qgb2YNClRoYXQgKHR1cGxlKSBpcyBlc3NlbnRpYWxseSB3aGF0IHdlIGFyZSBk
b2luZyAod2l0aCB1ZG1hYnVmKSBidXQgaW4gYQ0Kc3RhbmRhcmRpemVkIHdheSB0aGF0IGZvbGxv
d3MgY29udmVudGlvbiB1c2luZyB0aGUgZG1hYnVmIGJ1ZmZlciBzaGFyaW5nDQpmcmFtZXdvcmsg
dGhhdCBhbGwgdGhlIGltcG9ydGVycyAob3RoZXIgZHJpdmVycyBhbmQgdXNlcnNwYWNlIGNvbXBv
bmVudHMpDQprbm93IGFuZCB1bmRlcnN0YW5kLg0KDQo+IGZpbGUgb2Zmc2V0cyB0aGF0IHBvaW50
cyB0byB0aGUgcGFnZXMgKHJhdGhlciB0aGFuIHBpbm5pbmcgdGhlIHBhZ2VzIHVzaW5nDQpJZiB3
ZSBhcmUgdXNpbmcgdGhlIGRtYWJ1ZiBmcmFtZXdvcmssIHRoZSBwYWdlcyBtdXN0IGJlIHBpbm5l
ZCB3aGVuIHRoZQ0KaW1wb3J0ZXJzIG1hcCB0aGVtLg0KDQo+IEZPTExfR0VUKS4gIFRoZSBnb29k
IHRoaW5nIGlzIHRoZW4gdGhlIGZkIGNhbiBiZSB0aGUgZ3Vlc3QgbWVtb3J5IGZpbGUNCj4gaXRz
ZWxmLiAgV2l0aCB0aGF0LCB3ZSBjYW4gbW1hcCgpIG92ZXIgdGhlIHNobWVtL2h1Z2V0bGIgaW4g
d2hhdGV2ZXIgdm1hDQo+IGFuZCB3aGF0ZXZlciBwcm9jZXNzLiAgVHJ1bmNhdGlvbiAoYW5kIGFj
dHVhbGx5IGV2ZXJ5dGhpbmcuLi4gZS5nLiBwYWdlDQo+IG1pZ3JhdGlvbiwgc3dhcHBpbmcsIC4u
LiB3aGljaCB3aWxsIGJlIGRpc2FibGVkIGlmIHdlIHVzZSBQRk5NQVAgcGlucykgd2lsbA0KPiBq
dXN0IGFsbCBzdGFydCB0byB3b3JrLCBhZmFpdS4NCklJVUMsIHdlJ2Qgbm90IGJlIGFibGUgdG8g
dXNlIHRoZSBmZCBvZiB0aGUgZ3Vlc3QgbWVtb3J5IGZpbGUgYmVjYXVzZSB0aGUNCmRtYWJ1ZiBm
ZHMgYXJlIGV4cGVjdGVkIHRvIGhhdmUgY29uc3RhbnQgc2l6ZSB0aGF0IHJlZmxlY3RzIHRoZSBz
aXplIG9mIHRoZQ0KYnVmZmVyIHRoYXQgaXMgYmVpbmcgc2hhcmVkLiBJIGp1c3QgZG9uJ3QgdGhp
bmsgaXQnZCBiZSBmZWFzaWJsZSBnaXZlbiBhbGwgdGhlDQpvdGhlciByZXN0cmljdGlvbnM6DQpo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kcml2ZXItYXBpL2RtYS1idWYu
aHRtbD9oaWdobGlnaHQ9ZG1hX2J1ZiN1c2Vyc3BhY2UtaW50ZXJmYWNlLW5vdGVzDQoNClRoYW5r
cywNClZpdmVrDQoNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0NCj4gUGV0ZXIgWHUNCg0K
