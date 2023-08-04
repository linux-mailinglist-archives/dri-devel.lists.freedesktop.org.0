Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D91770B42
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B82510E009;
	Fri,  4 Aug 2023 21:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B0410E009
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691186017; x=1722722017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GPUUg30oYAVK1BERlZzRsyD7rRLVFMzZT0V5A4L6IMk=;
 b=gZ5x6nYqsXF6Qx62imPYWCFd/XFFciC9kuXxOToOWWL8lx9Obhx4XI9p
 bveR1/nd5s9+FXmqQWYMpGfoqr7C8tma2C/dDS2fIHxzONZ0TXl4eTZ/B
 C11rtuXb+iPfWe9geijPdZMNFg9uVcj7Vuhw8lkKlXyGn6HUyvQ6gaGcZ
 nS4fDL//UL8DFc/JSL/ydW8texT/PwfXua7gxez9YqF7UD4NppAyiypgz
 k8i2eulhJEUCPQ9bY4TzoGW7FL0UPc3wem7378p9gVVZvmegbNP93vKzv
 eEfuih3kgy20dLiyahHkFFwWxjOK3zv9rO2Mw4BR6DQBdqH0AeOeWKwG7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372999963"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="372999963"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853953258"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="853953258"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 14:53:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 14:53:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 14:53:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 14:53:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 14:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Clf3bgWzJANXGcFu9US0g0gWeoMduN++UGJUCGBmYjVBMvWYfgKJKHMINSkkMMsnq0Ds/N7P9fyT4lYpq8U1c6Pi4ViWixuZUDRh5DbRC3lRymQ4PJkYPr303Bg3IUQKquW7RdezP/2nUp8SoQs6lj/A9sLTJsLDgw3qDsCeHQARA26madtbEXxEXEjHHE26hxA5QZd7s46j9m9rCkGdoeKVg2KTwFGyrYqtn9+rYTzmF8tpR4mi5f7P+cKzdJp4PB1W5ib5VFqkIiEN5eq5vQWoSDgykYSfI5JqdN+JKFK9pjnnSTsEHDQ1gGEoRjCuvpkiaGVxHkzPZz47Ta7Cng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPUUg30oYAVK1BERlZzRsyD7rRLVFMzZT0V5A4L6IMk=;
 b=FAG/4J8VoRu4yDsxAB6gtVOR05b4XJgA3U4Bxdla8ul9bzfQJVW2CKCElM0OBL2IHOi5aMFkSAoUDvi/RtCjUswUya4j4ePj0DooXoBcu9lQXHDJ6o2oZcl11s//rSM38frN5J4t8d/WcwfsPWe7G6ZVSK7kljrzTrCEBHlFs2rdb2sA+tPiMSW1LNH+lWEeJ2EbPqk3F6KGCXqgwkpjBKaL94a97iXRFJjEEc1HI0N5CZG5Q1ECvIQC6pZb+0X60Ih9JSGgU+nKGKc/EqzHNlcy33f3F1Z7mJnqLdqTjNewxQxhE4KVBcz7bcFfSwTT2+nuoV05HwII3z9QdOsOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Fri, 4 Aug
 2023 21:53:25 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 21:53:25 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264IAAOg+AgADx/wA=
Date: Fri, 4 Aug 2023 21:53:24 +0000
Message-ID: <IA0PR11MB7185EAF1C535DDA9EA351A38F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ed332536-6ee0-df36-c42a-5a1b5b12c71b@redhat.com>
In-Reply-To: <ed332536-6ee0-df36-c42a-5a1b5b12c71b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB7548:EE_
x-ms-office365-filtering-correlation-id: a65a101e-2150-4de9-6abd-08db95353a7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UqJN9HczFOxULpy7XJyb9+o/Grhjj7KF3uZlKad9zyqmpTu3OIDmjYsbiIKl9OEXkKiCertug49LBpMRFuGhRAIzcUH0thsQa9FkkjAKmFF/4kACQFO6I90ohN2kFQSv4XEnkLlbAreFldwjfdMl9ts6I4hbSDUxYmw9IYknBbRXUlLRQ0LZgevMyz+A2QzUuDyEp108+c+4n81nC5qZSZQw+CU4qEHNGwxD69rHkz2JKtPWmuGlwonD8WOKK/kMnn7SbAGBoAdtJOAINsyRO3qaxifecWlfdjtE1BkTb3A6f35zu0Pk5js+oPi3jMORRDFtJWmaSPcGEtOy5fJ5pT0UMguZHaXnRnRWAk3i3jKDijNIFuIN1g/aHrRRGmz0tkB6KD5I7QS0i7J1H1jiA5xz9p9xm6JooFmmzuPvb7eH5lxZnnLuerWRsboHUb55nhg9B3DtQxSAocWap3ydWtEvrkn1teeDZI1csxEYoHFpzDQ/bESomyN8ortNpbD6uc8p6s5RiGnBbUpVmlwv6TYchy4zEfGRyQJ7WB/JF5+kiKMThD7ZT72bHXxgHUxuVta8rTJ3oG26DJQ/kmtZun6kwowfapNrbW1p7DvpvJY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(186006)(1800799003)(451199021)(86362001)(66476007)(5660300002)(41300700001)(8676002)(66446008)(8936002)(64756008)(38100700002)(122000001)(52536014)(66946007)(54906003)(38070700005)(110136005)(4326008)(316002)(82960400001)(478600001)(66556008)(76116006)(2906002)(33656002)(71200400001)(966005)(9686003)(7696005)(26005)(6506007)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0FQUkxaV2lVQVMzd0R2YktJMHE0ZSt5emNGRGhvRjJuTHZYdGxrMDJJSXgv?=
 =?utf-8?B?WHZJQndTQlBZK0ZjUVNxNlUyM0lqTERmSDRaL3JwOW4vZ0RmYWxWcUhheWV5?=
 =?utf-8?B?aUx1NDhpOGsyeStnQzNrYUZIbTNtdk1pNUd5enhCZURra28wLzYxUDBVU1VI?=
 =?utf-8?B?ZE1PK2tKMmh0WXo2cjFoaTNRS0MyNnR3bGJQeFdsV1EyMTBWbXpnTFlWL0p0?=
 =?utf-8?B?VklBQ2FPY2UzaWF5UDhwVXpOR09vdlFaR2dockkzQVlINXJ0NmtmRDhHTHpq?=
 =?utf-8?B?d3NuTDZVRElKYk04NU9Xa2cwTU9ieDdvR0xLV0tsUzBwZ21PTkZQZGxvSWIw?=
 =?utf-8?B?S2NjTGU5MEdwMFR6VC9vQS9yZ0VhSVcwUjc1WjlaSTltbFQzRjJnZ2ZoYWI3?=
 =?utf-8?B?OHhpclB1U0RET2RSMVZlZHh1bUd4b240MTZPUUR4VC9PZHlqY3ZnNjNlOWxQ?=
 =?utf-8?B?Q3o4cmg4ZmVNZDBZVDFEVGtER292cUwwekJXY3JsUUpOQ2dmbmM1ZkFiZnkw?=
 =?utf-8?B?OG5vcy9MN0FXVEVRYUl1SU1VY2g3SGNzL3ZoVmlrd0pCb3lmcWsyZExNMWVo?=
 =?utf-8?B?SGVSMHVPSUgvTVBOa0JHYzhGNlNVbWZTYjAwakZQZXZQb1FvR3V5cWk3a0JO?=
 =?utf-8?B?eEdmR2pXaXR6YkRyeHZvdytnS3BnT2loajFLS0VYMG9rNVJoVG4zSkpQcU1a?=
 =?utf-8?B?bmpqWHNHWis3djlVNSszMks2cVRGUjJJbmhLNEZ3a1l2Y3ZyUkt2ajVBbDlo?=
 =?utf-8?B?N1dyZHVaVHgxend2T2pUWGVweHRNSm53YnN1MHdSMnlZU1I1YVpiQ0NkWFNE?=
 =?utf-8?B?VTZEbkwzRDJTOVU1WHVjejUwNkIyVDZzeVV4VE5xcjQ2MldtOEtqeGJXSEYr?=
 =?utf-8?B?SHZJMVBzUGg0ZU5jWTRmdEY5OE44TWdHSnpuaWsvbW9PK1NWbDBma3JCdWZL?=
 =?utf-8?B?cDBCVW4rTXFtUDJQYnUveVBzUFNxZ1ZuRU9JNXJOSWtzaGJqMnNxMHVGSElR?=
 =?utf-8?B?MUw1MHVNNzVxT21FWXF4dnVDeEU3b2c0ODRtejl0OTMwYTd4Nk8yeUxvNjBP?=
 =?utf-8?B?Q3hqYWxiQm5wQzNONFNtY0NTSXZnTmYxL0I4dGRPZzhxTnFYdENTU3l0dkI1?=
 =?utf-8?B?MDlhSEY4MzZwSFdWYzYwd0Z2QldrY055VEg5bnU5MTV1RlpnbDJ6eW1ZK1l0?=
 =?utf-8?B?Unh6d2xyTlVXMTVkU2Q4QXE3SzJlQWVhU0lXS1NnMTN0ek9ubS9PVU9Xa21x?=
 =?utf-8?B?WW1Mc0xMcDF6c3R3djV1Q3VqWjA5ZjNLTktzbFdLTjVvNnRpUVBTbm91TVkr?=
 =?utf-8?B?c2tsNE1BTlV5VGlmUHNwRmhyWXVucUpGRTFqUW16V1hlS3lIR0J2RXBtN0xu?=
 =?utf-8?B?L0VGZUppYWVmL0MyMzlpZVlxdDkrYVNRSUxkVFdMd3kydEhnN2tIYTVkanNa?=
 =?utf-8?B?bGZ2UkJyMjJCT1d6bjRzKzUzQnVLU3ZqOW9Da1ZYVysrOWxwN3ZMMTB2dG85?=
 =?utf-8?B?OEJwRGZ5NGNjVzhuVGM4aXdjK0RMbVF2d0ZCWWJnSDhTTlJ3a0RmeDJsZHow?=
 =?utf-8?B?V1hDTkZSOW1ObWpLQlQvMS9OZHVzVG5kVTlsMENucjVQb0pKQVplYU9lSU96?=
 =?utf-8?B?ZDZqaTdVN3AxSEtMUWZTeSt5VlZMOXAxb2RSMzR1N2dtbjdweWNZOExocVRa?=
 =?utf-8?B?dFhDVEZCQnpwYVdNSm9WOHJyMnpSbjVCbmdUejVUR1QzS3JSWXcrRkFiYTV4?=
 =?utf-8?B?cjlnSENsVnZDOGlqSWV1N1VQMmNGa0FTeE52WWloSDhTaGhMYjNsalpaR2dJ?=
 =?utf-8?B?bXFOQ0RaVWZhZ0pPL3dvTW5VMUcrckFXSE1xZUdMQzRtSTI4aUc5bmJnOWpB?=
 =?utf-8?B?UjFKeElzdmkvUktJQ0hZeE43OWs4NTNic3hGNzVlSENueXJDZHNzVjVKOENQ?=
 =?utf-8?B?YVY3bUVCNEU3MmVmblhkTzI5a2lDM1ROOHZXcDNrT3RxWjRBWStmK2NjejQr?=
 =?utf-8?B?aFJSWDRyQzFEUTVnTGtYaTJDSzJFckxUMXhTWDE1eEk1Wk1jRCs5RlpsRHA0?=
 =?utf-8?B?eEV6V1Y0TXlJTmFaNU14WTRvaVFTbm8zcVlmZkZjMHNTZnZndnk5UmFqZGZn?=
 =?utf-8?Q?HA1xdfnbTLlmxGGn8JvT2BKrj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65a101e-2150-4de9-6abd-08db95353a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 21:53:24.9828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrMO+WePc7RVNqSxcdx8WiuG3EutMiq/Bm00rYg46RRJF+1L+wY5k69iCYCKuvzH4opabOtdG9P5l3XbiW+AYLQ6DI/JHbPVBYLfTa1zIVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gPg0KPiA+Pj4+Pj4+PiBSaWdodCwgdGhlICJ0aGUgemVybyBwYWdlcyBh
cmUgY2hhbmdlZCBpbnRvIHdyaXRhYmxlIHBhZ2VzIiBpbiB5b3VyDQo+ID4+Pj4+Pj4+IGFib3Zl
IGNvbW1lbnQganVzdCBtaWdodCBub3QgYXBwbHksIGJlY2F1c2UgdGhlcmUgd29uJ3QgYmUgYW55
DQo+ID4+IHBhZ2UNCj4gPj4+Pj4+Pj4gcmVwbGFjZW1lbnQgKGhvcGVmdWxseSA6KSApLg0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+PiBJZiB0aGUgcGFnZSByZXBsYWNlbWVudCBkb2VzIG5vdCBoYXBwZW4g
d2hlbiB0aGVyZSBhcmUgbmV3DQo+IHdyaXRlcw0KPiA+PiB0byB0aGUNCj4gPj4+Pj4+PiBhcmVh
IHdoZXJlIHRoZSBob2xlIHByZXZpb3VzbHkgZXhpc3RlZCwgdGhlbiB3b3VsZCB3ZSBzdGlsbCBn
ZXQgYW4NCj4gPj4+Pj4+IGludmFsaWRhdGUNCj4gPj4+Pj4+PiB3aGVuIHRoaXMgaGFwcGVucz8g
SXMgdGhlcmUgYW55IG90aGVyIHdheSB0byBnZXQgbm90aWZpZWQgd2hlbiB0aGUNCj4gPj4gemVy
b2VkDQo+ID4+Pj4+Pj4gcGFnZSBpcyB3cml0dGVuIHRvIGlmIHRoZSBpbnZhbGlkYXRlIGRvZXMg
bm90IGdldCB0cmlnZ2VyZWQ/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gV2hhdCBEYXZpZCBpcyBzYXlp
bmcgaXMgdGhhdCBtZW1mZCBkb2VzIG5vdCB1c2UgdGhlIHplcm8gcGFnZQ0KPiA+Pj4+Pj4gb3B0
aW1pemF0aW9uIGZvciBob2xlIHB1bmNoZXMuIEFueSBhY2Nlc3MgdG8gdGhlIG1lbW9yeSwgaW5j
bHVkaW5nDQo+ID4+Pj4+PiByZWFkLW9ubHkgYWNjZXNzIHRocm91Z2ggaG1tX3JhbmdlX2ZhdWx0
KCkgd2lsbCBhbGxvY2F0ZSB1bmlxdWUNCj4gPj4+Pj4+IHBhZ2VzLiBTaW5jZSB0aGVyZSBpcyBu
byB6ZXJvIHBhZ2UgYW5kIG5vIHplcm8tcGFnZSByZXBsYWNlbWVudA0KPiB0aGVyZQ0KPiA+Pj4+
Pj4gaXMgbm8gaXNzdWUgd2l0aCBpbnZhbGlkYXRpb25zLg0KPiA+Pj4+DQo+ID4+Pj4+IEl0IGxv
b2tzIGxpa2UgZXZlbiB3aXRoIGhtbV9yYW5nZV9mYXVsdCgpLCB0aGUgaW52YWxpZGF0ZSBkb2Vz
IG5vdCBnZXQNCj4gPj4+Pj4gdHJpZ2dlcmVkIHdoZW4gdGhlIGhvbGUgaXMgcmVmaWxsZWQgd2l0
aCBuZXcgcGFnZXMgYmVjYXVzZSBvZiB3cml0ZXMuDQo+ID4+Pj4+IFRoaXMgaXMgcHJvYmFibHkg
YmVjYXVzZSBobW1fcmFuZ2VfZmF1bHQoKSBkb2VzIG5vdCBmYXVsdCBpbiBhbnkNCj4gcGFnZXMN
Cj4gPj4+Pj4gdGhhdCBnZXQgaW52YWxpZGF0ZWQgbGF0ZXIgd2hlbiB3cml0ZXMgb2NjdXIuDQo+
ID4+Pj4gaG1tX3JhbmdlX2ZhdWx0KCkgcmV0dXJucyB0aGUgY3VycmVudCBjb250ZW50IG9mIHRo
ZSBWTUFzLCBvciBpdA0KPiA+Pj4+IGZhdWx0cy4gSWYgaXQgcmV0dXJucyBwYWdlcyB0aGVuIGl0
IGNhbWUgZnJvbSBvbmUgb2YgdGhlc2UgdHdvIHBsYWNlcy4NCj4gPj4+PiBJZiB5b3VyIFZNQSBp
cyBpbmNvaGVyZW50IHdpdGggd2hhdCB5b3UgYXJlIGRvaW5nIHRoZW4geW91IGhhdmUNCj4gPj4+
PiBiaWdnZXINCj4gPj4+PiBwcm9ibGVtcywgb3IgbWF5YmUgeW91IGZvdW5kIGEgYnVnLg0KPiA+
Pg0KPiA+PiBOb3RlIGl0IHdpbGwgb25seSBmYXVsdCBpbiBwYWdlcyBpZiBITU1fUEZOX1JFUV9G
QVVMVCBpcyBzcGVjaWZpZWQuIFlvdQ0KPiA+PiBhcmUgc2V0dGluZyB0aGF0IGhvd2V2ZXIgeW91
IGFyZW4ndCBzZXR0aW5nIEhNTV9QRk5fUkVRX1dSSVRFIHdoaWNoDQo+IGlzDQo+ID4+IHdoYXQg
d291bGQgdHJpZ2dlciBhIGZhdWx0IHRvIGJyaW5nIGluIHRoZSBuZXcgcGFnZXMuIERvZXMgc2V0
dGluZyB0aGF0DQo+ID4+IGZpeCB0aGUgaXNzdWUgeW91IGFyZSBzZWVpbmc/DQo+ID4gTm8sIGFk
ZGluZyBITU1fUEZOX1JFUV9XUklURSBzdGlsbCBkb2Vzbid0IGhlbHAgaW4gZml4aW5nIHRoZSBp
c3N1ZS4NCj4gPiBBbHRob3VnaCwgSSBkbyBub3QgaGF2ZSBUSFAgZW5hYmxlZCAob3IgYnVpbHQt
aW4pLCBzaG1lbSBkb2VzIG5vdCBldmljdA0KPiA+IHRoZSBwYWdlcyBhZnRlciBob2xlIHB1bmNo
IGFzIG5vdGVkIGluIHRoZSBjb21tZW50IGluIHNobWVtX2ZhbGxvY2F0ZSgpOg0KPiA+ICAgICAg
ICAgICAgICAgICAgaWYgKCh1NjQpdW5tYXBfZW5kID4gKHU2NCl1bm1hcF9zdGFydCkNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5tYXBfbWFwcGluZ19yYW5nZShtYXBwaW5nLCB1bm1h
cF9zdGFydCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAxICsgdW5tYXBfZW5kIC0gdW5tYXBfc3RhcnQsIDApOw0KPiA+ICAgICAgICAgICAgICAgICAg
c2htZW1fdHJ1bmNhdGVfcmFuZ2UoaW5vZGUsIG9mZnNldCwgb2Zmc2V0ICsgbGVuIC0gMSk7DQo+
ID4gICAgICAgICAgICAgICAgICAvKiBObyBuZWVkIHRvIHVubWFwIGFnYWluOiBob2xlLXB1bmNo
aW5nIGxlYXZlcyBDT1dlZCBwYWdlcw0KPiAqLw0KPiA+DQo+ID4gQXMgYSByZXN1bHQsIHRoZSBw
Zm4gaXMgc3RpbGwgdmFsaWQgYW5kIHRoZSBwdGUgaXMgcHRlX3ByZXNlbnQoKSBhbmQgcHRlX3dy
aXRlKCkuDQo+ID4gVGhpcyBpcyB0aGUgcmVhc29uIHdoeSBhZGRpbmcgaW4gSE1NX1BGTl9SRVFf
V1JJVEUgZG9lcyBub3QgaGVscDsNCj4gDQo+IEp1c3QgdG8gdW5kZXJzdGFuZCB5b3VyIHNldHVw
OiB5b3UgYXJlIGRlZmluaXRlbHkgdXNpbmcgYSBNQVBfU0hBUkVEDQo+IHNobWVtIG1hcHBpbmcs
IGFuZCBub3QgYWNjaWRlbnRhbGx5IGEgTUFQX1BSSVZBVEUgbWFwcGluZz8NCkluIHRlcm1zIG9m
IHNldHVwLCBJIGFtIGp1c3QgcnVubmluZyB0aGUgdWRtYWJ1ZiBzZWxmdGVzdCAoc2htZW0tYmFz
ZWQpDQppbnRyb2R1Y2VkIGluIHBhdGNoICMzIG9mIHRoaXMgc2VyaWVzOg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMwNzE4MDgyODU4LjE1NzA4MDktNC12aXZlay5rYXNpcmVkZHlA
aW50ZWwuY29tLw0KDQpBbmQsIGl0IGluZGVlZCB1c2VzIGEgTUFQX1NIQVJFRCBtYXBwaW5nLg0K
DQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiAtLQ0KPiBDaGVlcnMsDQo+IA0KPiBEYXZpZCAvIGRo
aWxkZW5iDQoNCg==
