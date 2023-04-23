Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9C6EBD56
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0DC10E357;
	Sun, 23 Apr 2023 06:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF8810E044;
 Sun, 23 Apr 2023 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682230366; x=1713766366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WW4SsqSceCkfAMfnvkCbv50p2wK1yuvnIm6n35v+OAo=;
 b=KJdCmeHrVvaD47VwnLdUxka6XWexZdeFGp0gN6SmjNiO1gnNhi6slH/F
 DyJrt1LLYkISzrVgcfvcDRSNS5IcgXFH3BM0Ff2ldU/ysT8rNr9Fluscc
 vBzMlGTRSF6vQ3QM3T8Lt5Ll0i2Z77kqrgWHaA3FCKsXObuYYBieWAMRf
 fyNSKO6l6xZf7sJ3+qJtZVFepFP+Y60TEo1OiOezDGKgwjW4iTqdd274/
 I88ldiSzQOJXJ1H7Pq/SqH1JY/36NyMiNX0vmzRJ3C6MiYqik1wIiyYAK
 bxwpm6yIomNEtX9aEwerHuLKaUYosLu/q72RwYgSD4ZhJl4m4A3d2Xf1s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411523751"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="411523751"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 23:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="686304194"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="686304194"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 22 Apr 2023 23:12:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 23:12:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 23:12:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 23:12:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 23:12:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0j12p4Tgt8WO509E9d2+EepNgZjeQeUlT1sFsU0NjnHbA1aApivVIDf4p6ZBCyJ4IK+iGA+iJYCDTs6E8AwRxJZ7hOE2nkPCYcoFFicj8IpfZ9Xmj70ZQSe1u912N/kA2eGmENN0Cw3xofVZUZVCIHbkvr/QSlwav/TforxfiWBHjdvBX8Wrhwo0KzYxiMqI4Pz884pPrYqvP6orwbYrBc/Mlv50CyMwwmPJmVoPaWsWF6Ou5EeCUmhnhmku5sxSnybRSMTTMsc6jSh9UCFUCRzPFnzXHmvuCZC6X9kEQk47/FWKdvuQnoZWtqxkNNRBZEDdEyCmeSEg7OwgvB56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW4SsqSceCkfAMfnvkCbv50p2wK1yuvnIm6n35v+OAo=;
 b=gJWvHGs7T+3d9xjM24fJ8LiqHn9DFdOK3KYS9JvJqaAVRHMlpxP9DibjawAgUqR9eGFzEpkYpoQe0lUy6NaK5iZJdtVrFrT8FGF/CoSPtPXlpiU2tc1cJtkegy4ZVuDWiIJw0Zh60mTahvIPAXLO82HLbusv9iDpgu6oTxqFERUf5Q+3xE/3PmQlo4JxVdlsyug3J5T5EWRVhNCxk63wNmq1WLkYOdITxYZJvuGLqVc9vcd8lgaRYH8ujIin4rS9eZXMZkFpl1g285vOVuzgkoRGdOAwPV7aZ+NERG1o3T1eoC+bCC6OIX10Qq3jPjY6c6t9sq+OAeHT/9PYfQo8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH0PR11MB7165.namprd11.prod.outlook.com (2603:10b6:510:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sun, 23 Apr
 2023 06:12:41 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 06:12:41 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Thread-Topic: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Thread-Index: AQHZcxKpqVeDDseo0UC0W5tSiHqhU681jqwAgALeUSA=
Date: Sun, 23 Apr 2023 06:12:41 +0000
Message-ID: <BYAPR11MB25676CAFE8FA0CD0E6ED6EA69A669@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
 <705b5e5b-78cd-857f-ad26-80835217520c@linux.intel.com>
In-Reply-To: <705b5e5b-78cd-857f-ad26-80835217520c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH0PR11MB7165:EE_
x-ms-office365-filtering-correlation-id: 063e1dbe-68d0-4de7-bd62-08db43c1befc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ssnqLKr7bDwwZ0DADXHTq8mmsB8y7+WR500IQFe1bsImwoZuVolEZ944oyS7ihEagx80noTgjuvzCHWhXUEKOH9mS9+OLv0aSagqbf+qB04tNhXF4jTArk+zHFfPw65IWo4x3j9lPod6p6aiJfL6KQwmNyZ5LYaCyNp/bIzJLTRd7QP+wD+ixaAK3sfnLTP4/SlFOpwqHr6XKK2/1bT3MnfnS3iJ9fosjo6ujalugiOldH5nb+q6jPSH4sqE/7pHqgdguBRW/R39qjZgovxCP+fmxZro0CnD5D4e6SUy3CZ/Tu/fRiZM7j3J5MTwafFUhbvMx/NohP/JoIRDXD2LJqXFbtlmL/CPMiNgmDxoprwF01pVzmwk0EXFjasXdh4FhYQgUGaRiXzG9JLRjuHqUI2BPvFrNDL11v8SFghPL+QreLJDA0o3c/UNgB87ZAiaa+E/dIDFsHYzX6/Ug5/o88bA1H1cPeFz7Uzddr48UV9g6gMo4cwiTcgZUcavXiGC24ld9F6TwUbGhPjDT9ssBeJ0L7QfUqFQs1+zjqvLWmWNuM8VEkvFa2qWsU340FpRvwAb8EFNR1odJuw731NFXqIRSbkuqeEXeSVGVELKgBKX0ZWNqv4xAPMEeRP87Biq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(2906002)(26005)(6506007)(316002)(76116006)(52536014)(110136005)(54906003)(66446008)(66946007)(66556008)(4326008)(64756008)(66476007)(7696005)(71200400001)(478600001)(8676002)(41300700001)(82960400001)(8936002)(55016003)(5660300002)(38070700005)(33656002)(86362001)(38100700002)(9686003)(53546011)(186003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTBrMk5GbFRvWXBjaVVSbVFPL3l4ZER1ekJIcDg0RTl1cDR3cC9rL25xUmV4?=
 =?utf-8?B?bXpxVkNSUHN6S09uTURheVo3aDZCVUk1SHR6eCt4eTVGN2VRV0NCTWRXbmdo?=
 =?utf-8?B?MllYQ3lpOW9Ud1RjZUtUL2pkdUFnOSs1cXlBZjFzdVJ1LzZCWWhxOXRhNzJy?=
 =?utf-8?B?cTNnRGFNWHBENzlWZWw4TFFqdVl1Nkt4TU13ZkNReHhJYUoxaGUxWXJ6NUtm?=
 =?utf-8?B?SnpJZW81MTY1VlRqa1RGRXlZYzkvRVNNNEVLRlplN3BVZFFKaGcrZCtOWVBa?=
 =?utf-8?B?TTVHTVp1ODFpKzEwZmpVQmVHNkJTSm1zNEc0c0pPeDEzRGRwaS9USmxTaUlt?=
 =?utf-8?B?N2NuVnBkME5KQlRMdlFiU1pxdXJMRFY2dEpnQ3VqTEdLQjBkbnFQOVB3Vm9Q?=
 =?utf-8?B?VTQ1LzJ0Yk13WmZvUWNDTHREWGNDKzkxeHdpWDJjTWtJbS9xMHV2OEVCZDA4?=
 =?utf-8?B?NytkZ3MydTU0dTNMdHR3YVIxSmpianBJKzZLOS9CM3NreE1aVmJCTG9oWThI?=
 =?utf-8?B?TDRnSkR6TThRbEx3V28rdjVoSkNpbHpoU25uM3BXc3JSWGlmQzZQcXowbGI4?=
 =?utf-8?B?WXdzdUV5WS83Tm1nSmdWUGJHbnE5UFNTRTJnMFlMNGswZGZjUUI0aHBxVWg1?=
 =?utf-8?B?RUFBNS9HV3dxdFBMNVFyclg2K1p6V1FjZkFjdld2b044QzEvYjBHUW1qYkxB?=
 =?utf-8?B?d0pzZ1ZPS0orSi9DeWtQd1lMTWo2WjM1d09lV3l1bmFPV2hFSDJXOUVnL09k?=
 =?utf-8?B?OEZaWklIcHRtUlFnWHNoU1Q2ZzZscVM3ZDk0Z0dCOUYzdytDcjBaRFVKUGpa?=
 =?utf-8?B?TTFUN1Z1YTVHcWlPTWJmZmRHTDd0SjRMLy80YUZQMUFRcDVZRXRkWWJEcXI4?=
 =?utf-8?B?ckhVamxJLzZXZGpvNG15aktVZC9wM3haanF4V1RTaEtSQlpEaisxT3EyaVFE?=
 =?utf-8?B?U0ZuTW9xM2xrZDN3UnlRUUo4L1VCQm1lRG9WT1hmSlVXejh1Q3d3cmxhM1RJ?=
 =?utf-8?B?TEg0b0prWDhzWGRIQ0dxbytyV1pvV3pxTHlTTWpaTUI1UFpnb2d6QzRGaUFj?=
 =?utf-8?B?ZEMrZzdlUmwxNFdLQ2RGa2FSenpVQ1F2bW42eTFQMEpqUXhqaDJiY3dOSGZn?=
 =?utf-8?B?RVhIcXVRWDRqa2hpeG9vTjZ3N1dwRjNmNHA2dlh6a2hqeWd6OWlCNlBRN1d1?=
 =?utf-8?B?RkcxRmFYdG1pc2hXZVRld2dMYmE5VmVEM2EvUDlQNVBIeE93aE8zbklTMExG?=
 =?utf-8?B?QUJVUEE2VWplUlFDVTQ3Rm1QODBpYXVBczBZcHRWY01RNG8wZE5ZR1Mwc2ti?=
 =?utf-8?B?c25sa21yaTA4U25IUS9MWVk2QnZCZlUwdlEyTEdjcmVWYWJlTWZVTEFtZGVY?=
 =?utf-8?B?NFVzdHZ4WElCcElCVnFCZWQxRXROUFhBMmdRMTZ0TEVFUVV2S2ExQkFuaEZ5?=
 =?utf-8?B?Q09TQmNKcEx3TXJNeTYvbHhQMEhKeWhsRjVnZFN6NFRYQVlYTThmN3hkbkhY?=
 =?utf-8?B?Y0ZSS1ZvY2thZXhQdHdJOG5JZWpocE9vWkRKS3BVS2pLczhib2ZnNlMyS080?=
 =?utf-8?B?d2NpLzdTc0VNT2h4a0VwdWRuZmgxWjZIL2JWT3BYcGdCelorM0VXeHE3QWdP?=
 =?utf-8?B?SGtvMXdUMHlldzZIbFVvbjRoaXdSaGJuUzJBK0p6cmRxMDAzTmgxNHViUE85?=
 =?utf-8?B?UUFpNFZPc252MHl1Y0dmMTRWdHI5UlZCbXVrbkpXVWNvemFHUG5pQm9VL3dQ?=
 =?utf-8?B?MWU3WFZoaUlSNjVVdjgwVFlaKzd4MmVjN1BhQnhxZ1Y2UVNLS0x6VmpJdFk2?=
 =?utf-8?B?Q3dmTjRpeVFadlY2R2hnRzB2NUx3Njd6cVpZMFJ0MmFBQUVuUk5SSXJSMzVW?=
 =?utf-8?B?emxnV1doUmN1QVA1L045TS9xQXZ1R0FuYXloamp6K2p5eE5lWjErL1g1L1U4?=
 =?utf-8?B?SFN3RnMza29CZnpaVXQvNmE2SmtrMC83bEREbzg3em9IQ1NRSHoxUmFzNXZ1?=
 =?utf-8?B?UWt1V3BEZThWUGtFK0FLM0xWVmJ5ejc0OHhBUXE4aSsvQUM2anBVd3lGTjVh?=
 =?utf-8?B?TW9tbkNpOWJPL1FCdlJDTWZyb25XeHJTVmtTMExUcllnWFRZam1kRjJyUEt2?=
 =?utf-8?Q?6Wzg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e1dbe-68d0-4de7-bd62-08db43c1befc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 06:12:41.4925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNaMbfld8Q56fT9bYavlttcUUERQpP/1A9PoN470+hk5baAewTwN2dgXuqAHRVEfQ7gcbENVolWzrulxQjqxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7165
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiAyMC8wNC8yMDIzIDAwOjAwLCBmZWkueWFuZ0BpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9t
OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPj4NCj4+IEN1cnJlbnRseSB0aGUgS01E
IGlzIHVzaW5nIGVudW0gaTkxNV9jYWNoZV9sZXZlbCB0byBzZXQgY2FjaGluZyBwb2xpY3kNCj4+
IGZvciBidWZmZXIgb2JqZWN0cy4gVGhpcyBpcyBmbGFreSBiZWNhdXNlIHRoZSBQQVQgaW5kZXgg
d2hpY2ggcmVhbGx5DQo+PiBjb250cm9scyB0aGUgY2FjaGluZyBiZWhhdmlvciBpbiBQVEUgaGFz
IGZhciBtb3JlIGxldmVscyB0aGFuIHdoYXQncw0KPj4gZGVmaW5lZCBpbiB0aGUgZW51bS4gSW4g
YWRkaXRpb24sIHRoZSBQQVQgaW5kZXggaXMgcGxhdGZvcm0gZGVwZW5kZW50LA0KPj4gaGF2aW5n
IHRvIHRyYW5zbGF0ZSBiZXR3ZWVuIGk5MTVfY2FjaGVfbGV2ZWwgYW5kIFBBVCBpbmRleCBpcyBu
b3QNCj4+IHJlbGlhYmxlLCBhbmQgbWFrZXMgdGhlIGNvZGUgbW9yZSBjb21wbGljYXRlZC4NCj4+
DQo+PiBGcm9tIFVNRCdzIHBlcnNwZWN0aXZlIHRoZXJlIGlzIGFsc28gYSBuZWNlc3NpdHkgdG8g
c2V0IGNhY2hpbmcgcG9saWN5IGZvcg0KPj4gcGVyZm9ybWFuY2UgZmluZSB0dW5pbmcuIEl0J3Mg
bXVjaCBlYXNpZXIgZm9yIHRoZSBVTUQgdG8gZGlyZWN0bHkgdXNlDQo+PiBQQVQgaW5kZXggYmVj
YXVzZSB0aGUgYmVoYXZpb3Igb2YgZWFjaCBQQVQgaW5kZXggaXMgY2xlYXJseSBkZWZpbmVkIGlu
IEJzcGVjLg0KPj4gSGF2aW5nIHRoZSBhYnN0cmFjdGVkIGk5MTVfY2FjaGVfbGV2ZWwgc2l0dGlu
ZyBpbiBiZXR3ZWVuIHdvdWxkIG9ubHkNCj4+IGNhdXNlIG1vcmUgYW1iaWd1aXR5Lg0KPj4NCj4+
IEZvciB0aGVzZSByZWFzb25zIHRoaXMgcGF0Y2ggcmVwbGFjZXMgaTkxNV9jYWNoZV9sZXZlbCB3
aXRoIFBBVCBpbmRleC4NCj4+IEFsc28gbm90ZSwgdGhlIGNhY2hlX2xldmVsIGlzIG5vdCBjb21w
bGV0ZWx5IHJlbW92ZWQgeWV0LCBiZWNhdXNlIHRoZQ0KPj4gS01EIHN0aWxsIGhhcyB0aGUgbmVl
ZCBvZiBjcmVhdGluZyBidWZmZXIgb2JqZWN0cyB3aXRoIHNpbXBsZSBjYWNoZQ0KPj4gc2V0dGlu
Z3Mgc3VjaCBhcyBjYWNoZWQsIHVuY2FjaGVkLCBvciB3cml0ZXRocm91Z2guIEZvciBzdWNoIHNp
bXBsZQ0KPj4gY2FzZXMsIHVzaW5nIGNhY2hlX2xldmVsIHdvdWxkIGhlbHAgc2ltcGxpZnkgdGhl
IGNvZGUuDQo+Pg0KPj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXMucC53aWxzb25AbGludXguaW50
ZWwuY29tPg0KPj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPj4gUmV2aWV3
ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29tPg0KPg0KPiBbc25p
cF0NCj4NCj4+DQo+PiAgIGJvb2wgaTkxNV9nZW1fY3B1X3dyaXRlX25lZWRzX2NsZmx1c2goc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QNCj4+ICpvYmopIEBAIC0yNjcsNyArMjY3LDcgQEAgaW50
IGk5MTVfZ2VtX29iamVjdF9zZXRfY2FjaGVfbGV2ZWwoc3RydWN0IGRybV9pOTE1X2dlbV9vYmpl
Y3QgKm9iaiwNCj4+ICAgew0KPj4gICAgICBpbnQgcmV0Ow0KPj4NCj4+IC0gICAgaWYgKG9iai0+
Y2FjaGVfbGV2ZWwgPT0gY2FjaGVfbGV2ZWwpDQo+PiArICAgIGlmIChpOTE1X2dlbV9vYmplY3Rf
aGFzX2NhY2hlX2xldmVsKG9iaiwgY2FjaGVfbGV2ZWwpKQ0KPj4gICAgICAgICAgICAgIHJldHVy
biAwOw0KPg0KPiBXaGVuIHVzZXJzcGFjZSBjYWxscyBpOTE1X2dlbV9zZXRfY2FjaGluZ19pb2N0
bA0KDQpXZSBhcmUgZW5kaW5nIHRoZSBzdXBwb3J0IGZvciBzZXRfY2FjaGluZ19pb2N0bC4NCg0K
PiBhZnRlciBoYXZpbmcgc2V0IHRoZSBQQVQgaW5kZXggZXhwbGljaXRseSB0aGlzIHdpbGwgbWFr
ZSBpdCBzaWxlbnRseSBzdWNjZWVkDQo+IHJlZ2FyZGxlc3Mgb2YgdGhlIGNhY2hlIGxldmVsIHBh
c3NlZCBpbiwgbm8/IEJlY2F1c2Ugb2Y6DQoNClllcywgdGhhdCdzIHRoZSBwb2ludC4gRm9yIG9i
amVjdHMgY3JlYXRlZCBieSB1c2Vyc3BhY2Ugd2l0aCBQQVQgaW5kZXggc2V0LA0KS01EIGlzIG5v
dCBzdXBwb3NlZCB0byB0b3VjaCB0aGUgc2V0dGluZy4NCg0KPiArYm9vbCBpOTE1X2dlbV9vYmpl
Y3RfaGFzX2NhY2hlX2xldmVsKGNvbnN0IHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmos
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBpOTE1X2NhY2hlX2xl
dmVsIGx2bCkNCj4gK3sNCj4gKyAgICAgLyoNCj4gKyAgICAgICogY2FjaGVfbGV2ZWwgPT0gSTkx
NV9DQUNIRV9JTlZBTCBpbmRpY2F0ZXMgdGhlIFVNRCdzIGhhdmUgc2V0IHRoZQ0KPiArICAgICAg
KiBjYWNoaW5nIHBvbGljeSB0aHJvdWdoIHBhdF9pbmRleCwgaW4gd2hpY2ggY2FzZSB0aGUgS01E
IHNob3VsZA0KPiArICAgICAgKiBsZWF2ZSB0aGUgY29oZXJlbmN5IHRvIGJlIG1hbmFnZWQgYnkg
dXNlciBzcGFjZSwgc2ltcGx5IHJldHVybg0KPiArICAgICAgKiB0cnVlIGhlcmUuDQo+ICsgICAg
ICAqLw0KPiArICAgICBpZiAob2JqLT5jYWNoZV9sZXZlbCA9PSBJOTE1X0NBQ0hFX0lOVkFMKQ0K
PiArICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPg0KPiBJIHRoaW5rIHdlIG5lZWQgdG8gbGV0
IGl0IGtub3cgaXQgaXMgZG9pbmcgaXQgd3Jvbmcgd2l0aCBhbiBlcnJvci4NCg0KVGhpcyBpcyBu
b3QgYW4gZXJyb3IsIGJ5IGRlc2lnbiB1c2Vyc3BhY2Ugc2hvdWxkIGtub3cgZXhhY3RseSB3aGF0
IGl0J3MgZG9pbmcuDQoNCi1GZWkNCg0KPiBSZWdhcmRzLA0KPg0KPiBUdnJ0a28NCg==
