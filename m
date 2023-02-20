Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FBE69C56E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 07:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECB010E139;
	Mon, 20 Feb 2023 06:50:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5AB10E065;
 Mon, 20 Feb 2023 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676875817; x=1708411817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2dF7jbf4YkaipP0IWeWOhw4Ea3qCUwPoywieWvmx4zk=;
 b=PkMlP2lZKFyC35TvgkFUigiKYz+h1IyLjiRDCoPUGCwek2tVld4bjfwr
 /XQC4UIQG88NnW9EQiRUCnkfBRe5Aw33JnFDD+JxKux9vufgIV0scbwTn
 oGsWDq7vwJYTWAiUOJJGtSEveQobvphIXyuNcOB2ikkAFb+m+IjKZx3Qi
 yo7mNmkhzq9y9pX2mXGnGyIqi0x3U6IBKv0Y0FzRQ03JFFiunSb+JYsTd
 Y7JUPb04qcUnHEHXLnnuDcVsVTJ+fyOHSN0U5sLl+Ba4KljbkvnyiCrQ+
 8QeZl4+JNPNHbBiFvV2bIahHvfT0g7FjPv0ccsS1eghdHsBeySJQzjLcp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="397020700"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="397020700"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 22:50:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="621047317"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="621047317"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 19 Feb 2023 22:50:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 19 Feb 2023 22:50:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 19 Feb 2023 22:50:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 19 Feb 2023 22:50:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEvjEZClCrfw12NYs6DVU9Jw4nDG5wSQO+EeX9F7bEHV14mSN34LqAfEOzx03/A6V/z28l15Bb8p8BIAbM5dGngAAm1ftIIRD/dspFGAcUoX4DeIDYevUa+O5IZ42Tm0kGSLCZWAK9QYQo4Lu5dmOyrwz+1SSpqAraru6BEEbr7we+mNffIBoaJfCkix2LrX9ddePzzbOqVddo4l/kMjswW8AkzUBZHvDOiMqnmYQcOXdYp3rGDqSr/zW53uCCP7vOfJEOPvbMFdV40WGuMbf1dERfqgofhB2v/FurjhLR6UiaPFhOvSEVaFmzBydQ3fi4wuniK5OvrO5OyxkClIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dF7jbf4YkaipP0IWeWOhw4Ea3qCUwPoywieWvmx4zk=;
 b=gz8G0PSs4L3QcnFWiiIeHYBezPG1puZNanpHwzf7ZWoZneR/aUE+QQVChBglPewPv6W8G+zfqckdQ1wh1vS1AuM281DnWUEikG+dUbh3dca2mgWyXLzWPgd8kYj8E0DM1nuaHNLqWg71uNtYVnPTw1xsEcisvrgyhSMO4ubClbsCVg09nyoydEK+M+eQmONfBIdxdMfzIr7mOE4SqoL8RZnhTHitZOsk72d5a0lu/J7E9bSMuN/Iu42I22SsbS/AAEp19sZASImH5ob+wTczU/5OStW0cukJO4HUWL3H3+iQTkLpMr8C7T5Q9IUtkBN2nZujzPXQc2ys7McGIPEIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ0PR11MB5582.namprd11.prod.outlook.com (2603:10b6:a03:3aa::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Mon, 20 Feb 2023 06:50:08 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569%5]) with mapi id 15.20.6111.020; Mon, 20 Feb 2023
 06:50:08 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Thread-Topic: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Thread-Index: AQHZQaOw6xdxOPOm/UG+MwrtGUL7Rq7S00eAgACRR4CABAdJAA==
Date: Mon, 20 Feb 2023 06:50:08 +0000
Message-ID: <6f4a1a6515d7532949fd249b157e07c04962cbb3.camel@intel.com>
References: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
 <03de3c68458fd5c44e9fe1d4bba4687ea49c4788.camel@intel.com>
 <a202bf77-a5a4-b7cd-44a6-6ddfb3625e66@intel.com>
In-Reply-To: <a202bf77-a5a4-b7cd-44a6-6ddfb3625e66@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ0PR11MB5582:EE_
x-ms-office365-filtering-correlation-id: 8dae4156-eafd-40cf-f642-08db130eb471
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P2nyZ+kVTPTp+uQP5MKH7dW5fYSdCBDJZH37FS2rKDLog2NJlgwDnAQEQ2Cni0q/vRbIAKk5T8MNr0rInjdc7r5g4RJj5gmfv4V5dgX/8tEKtGM0fkoD00JfoKPT6AuuCQiIU4EaOqhHToardPdDyUnitAU2ueV8rvzB6OiLP8H+Is/PtJ8LnBDFzhFtujONytsT2l9h8HuPBZY1q5AtPcHJE2tmvcAJBz0rlqxf1TkZzbF/RXOniCPU1b5StusBPfumBT/+2KZ4AljfpavCq1DHVxPyFiLgdSXgFj2QKuSO/jAXeCZouTkplluf3a1nmxZhPrLhRRhtECvngj/r2ETFUH7NHUH2MJXiD5sxEkFKcaae0wklwVcRLbeQ7dvWYWm0UMJ8bHIzs6Tds798HnRm7tX3R7PbtNqn80rdinNzxMs0l2tM2F0jBvAcxT+LcZDVTGxAlmgKj42IJ34eJ0HNFBybsFqnpoFIQ63RKYZC8zn0Tb5xgzGPR+aNaQOMUQi2h/nL5V36QMMflOvQf11Ofsr9FedbCdaKLaQSWO1EHq9YDRid39oPZO5ap1B5NhYDGZwNyUOMGl3O8N1SYgxpWVuc8T6JtbI57EQp5W22DQ2BLXx/HGyA4/K5vSpv592lM85rkzCg8y4+4x2EUOdjF8cEEU0mZ7MOA9sSvHdGq3BR3/KDzpdeDnYDdNMO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(36756003)(5660300002)(478600001)(83380400001)(66574015)(6486002)(966005)(2616005)(53546011)(71200400001)(6506007)(186003)(26005)(6512007)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(450100002)(91956017)(86362001)(8936002)(38070700005)(41300700001)(110136005)(122000001)(38100700002)(82960400001)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFNZb1JwSkhsZGxNcFlBd2F2NENJbHk5WkhnYUlKVlNndlJ2bjl5V2p6WjBU?=
 =?utf-8?B?ZllLcG1MbDhpd2JaeUpabHdiMmRETnpmYWNMSXNFWGxzckFCR09wb0Rudlcy?=
 =?utf-8?B?K29WaGcwdWNKSjV1eTFRbnN5TERGZG9ZM29aVEtMdGJoZ00zNlZKdDlMWXdY?=
 =?utf-8?B?Z0tUTnJoaTlKSVpTVXh1NUM2YXlxU3BxbmZZS0JDVUNMTFVRd1dOOXRDanVy?=
 =?utf-8?B?OTNjQzNsbS9JdEI0TEhXV0NXWFB2ZXZtUzdUZjF2dDNYbVNwTWE0cTcvQjFE?=
 =?utf-8?B?M0gwTHpzQ25CVTErdTV6dFBEVnEvS3V4ZGNSYVhoNjkrUGNvamJRL05RSnJR?=
 =?utf-8?B?WWR0MWd0WlJqZFg1elJGZlFrRk9lSWt0SzJ3M2xXT3RIUUg5bVhrU01jZ3pV?=
 =?utf-8?B?eHZhMEF4eHhGcTVYT3BBaVVuTlVxZ1R5YlhZazVvSFJQdmxuU0xCQWtwaEFO?=
 =?utf-8?B?WnF5Ymx4RGhUcWozMnk3RzdsNUwzRFdzRTBhUkthZm4ydEFkdUI4TTlmZ2l4?=
 =?utf-8?B?eFBLazhFeVEzbWhqTithQlFPemN2dUczVU5LNnUyazh1QTN0SlJSZS9adVBI?=
 =?utf-8?B?TkcxalVyclptWURXTWZnL3Rud3YyY2JLYXN6NUhKbjIxbzZ5SlBqdVM1cTNJ?=
 =?utf-8?B?NnRZZXVLQkxINHE2V3lRQytjQmdGQmdJK0dWUlI0MWV4c0lINk5FUlZ0QTZP?=
 =?utf-8?B?b0pyMDVSMVlKc25qZW5nU1BnelQvVFRKRnZCM2dBZDdmNXBpWUc5b0NCRi9p?=
 =?utf-8?B?bFAzcXFUcHRUQ29sMkxoZGY0VW5TY1AybmZTcVZLZk4yQ094S2JSdEtCVGxV?=
 =?utf-8?B?ejJpc1lRZTVuK0ZoazMvWFdUZWl1aStscXFXZTRXR2IvNDE3R0FXQW5HRkNr?=
 =?utf-8?B?ZUFQbTJDelc4Rm5OcWlnQ2RvWi9uSFB3Y3VWeWNDWVlNTU1pbDAwaEJDOW9i?=
 =?utf-8?B?bmdsWFVvdDBTOCszaXFGWHh3Sk5Zd25BTUQxZ29WVHhrdlA1UW4zRzVuY3I5?=
 =?utf-8?B?TFFLcWRpMWhEV01vNkJWWVZYbExZMldOeDVJL042Q2tJKzloWmdBY1JXMnJZ?=
 =?utf-8?B?VzIza2ptdUNaQmpRQkcwandiU3BHVDZiai9xbzVYYjU0Y0xhQitsK09weGJM?=
 =?utf-8?B?bzdPL3NId1QvakIxaXZQZksveHhJdkhUdnpQY0MweG1TNlBlOE80K3ZTOTQ5?=
 =?utf-8?B?OWp5T0ZOM29DMVBKeGUrN3o1K3AyOTdKY08xM2Q3THg3Y25JOHpESmdLUHpr?=
 =?utf-8?B?TXBmdFBBRlJ2UmVWZm5yN1dEZmZ0YmxSZ1hnLzZXL2ZObkZCRGdOTnhFK01U?=
 =?utf-8?B?R0xFbEJUTFFTRU9BWUtsZEorQjFlcm5laHBBeUdrK3paN2dHblMzaWkvcWdB?=
 =?utf-8?B?Yy9nakg5d1N3US9UR0xUYUMxdDNDdWhuNDdqeEtrbWNwU3pUTWhRVXFxeTNZ?=
 =?utf-8?B?ZUZvVmpicXI2emhBMUx3YStTUlhMTndkbDV5b3ppdXVOSDViWE9tRW81TnNq?=
 =?utf-8?B?bVdUcmNNWlh1V1ovamg3ZkNaQ1RtTy9POGdEd3NobnVCTko5d2xzbXRXZnJo?=
 =?utf-8?B?S21McVZlR2pHem96Z1dFc05WVWdCUkUxbHMyZHcrTFdCc2hLeE0xWkxUbnR1?=
 =?utf-8?B?N3hyQWJWdVVvaFM4anV3d2FKWFYySmZmZXhSWnY3QlAvME9XRW9uQzhNb3di?=
 =?utf-8?B?L294OEZnUzdrWGxqelpKREcydjh2MzNKQjczdkxnRmlDOUd0SGZXeUwvZlR0?=
 =?utf-8?B?Y2dKdDR4SzlzYWM5czZLVWQ0UUdYTG8xWWdMeXlsQXp6dVBHUHBVOXd2dGVO?=
 =?utf-8?B?UzZCMmE0NGdLVUR6dEk5b3owL1ZiR0poOWNLQXJkaWVONDJqWlBRUmVFWXFY?=
 =?utf-8?B?TUlyVjdBTTE5bkxCVGZhWVVPckJGUnBmNTZTR2M4MGZXUWhpdDRoQTVyUHpi?=
 =?utf-8?B?SWFuRUtRZzRKMEhnZmxTOHhwNG85QmhwdXh1UythWWN1WXZ3RnU1MVhQeXJ4?=
 =?utf-8?B?dWZDUENVNHE4V3RrbmV1dWdWcHI5ZWV3VUdJd2NjRTBqOUl3di9rRFFJZ3Yw?=
 =?utf-8?B?bmxkZndJc00wc2ZKdWZINkZZSURLd0g2SUtraFJQOVo5RXVtVmlsMkRkYmNo?=
 =?utf-8?B?cnIvWGhPMThhQ1c1L011UElmVmtvZzk3YTdsQWkzejFDeUdqdDV0MEZuNnQ0?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC316C218B9FBE4B9C138E87359DE143@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dae4156-eafd-40cf-f642-08db130eb471
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 06:50:08.0738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5EpJ7vBiUn93A9O6trqIwCe4fv/l36ivdb2WoygyE6S3IQUdSKemOS1iWTdT0KzawV1I/lwHwCK0EMTYjGLu2Ur9I+njW60AlzkYFEN24E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5582
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

T24gRnJpLCAyMDIzLTAyLTE3IGF0IDA5OjE4IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAyLzE3LzIwMjMgMDA6MzksIEhvZ2FuZGVyLCBKb3VuaSB3cm90ZToNCj4gPiBPbiBXZWQs
IDIwMjMtMDItMTUgYXQgMTc6MTAgLTA4MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb23CoHdy
b3RlOg0KPiA+ID4gRnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNv
bT4NCj4gPiA+IA0KPiA+ID4gSW5zdHJ1Y3Rpb24gZnJvbSBoYXJkd2FyZSBhcmNoIGlzIHRoYXQg
c3RvbGVuIG1lbW9yeSBhbmQgQkFSDQo+ID4gPiBtYXBwaW5ncw0KPiA+ID4gYXJlIHVuc2FmZSBm
b3IgdXNlIGFzIHJpbmcgYnVmZmVycy4gVGhlcmUgY2FuIGJlIGlzc3VlcyB3aXRoDQo+ID4gPiBj
YWNoZQ0KPiA+ID4gYWxpYXNpbmcgZHVlIHRvIHRoZSBDUFUgYWNjZXNzIGdvaW5nIHRvIG1lbW9y
eSB2aWEgdGhlIEJBUi4gU28sDQo+ID4gPiBkb24ndA0KPiA+ID4gZG8gaXQuDQo+ID4gVGVzdGVk
IHRoZXNlIHBhdGNoZXMgZm9yIEdQVSBIYW5nIEkgd2FzIGRlYnVnZ2luZy4gU2VlbSB0byBmaXgg
dGhhdA0KPiA+IG9uZQ0KPiA+IGFzIHdlbGw6DQo+ID4gDQo+ID4gVGVzdGVkLWJ5OiBKb3VuaSBI
w7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU3dlZXQhIE91dCBvZiBpbnRl
cmVzdCwgd2hpY2ggcGxhdGZvcm0gd2FzIHRoYXQ/IEFuZCBob3cgcmVwcm9kdWNpYmxlDQo+IHdh
cyBpdD8gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8ga25vdyBpZiBhbiBJR1Qgd2FzIGFjdHVh
bGx5DQo+IHJlZ3VsYXJseSANCj4gc2hvd2luZyB0aGUgaXNzdWUgYW5kIHdlIGhhZCBqdXN0IGJl
ZW4gaWdub3JpbmcgaXQhDQoNCkl0IHdhcyBBbGRlcmxha2UuIEl0IHdhc24ndCBpZ3QgdGVzdC4g
T3BlbmVkIHNldmVyYWwgYnJvd3Nlcg0KaW5zdGFuY2VzOsKgDQoNCmh0dHBzOi8vd2ViZ2xzYW1w
bGVzLm9yZy9hcXVhcml1bS9hcXVhcml1bS5odG1sDQoNClRvb2sgbWF4LiBjb3VwbGUgb2YgbWlu
dXRlcyB0byByZXByb2R1Y2UuIEZvciBzb21lIHJlYXNvbiBQU1IyDQpERUVQX1NMRUVQIGVudHJ5
L2V4aXQgd2FzIHNvbWUga2luZCBvZiB0cmlnZ2VyIGZvciB0aGlzLiBXaXRob3V0IFBTUjINCkRF
RVBfU0xFRVAgSSBjb3VsZG4ndCByZXByb2R1Y2UgdGhlIGlzc3VlLg0KDQpCUiwNCg0KSm91bmkg
SMO2Z2FuZGVyDQoNCg0KPiBKb2huLg0KPiANCj4gPiANCj4gPiA+IHYyOiBEb250IHVzZSBCQVIg
bWFwcGluZ3MgZWl0aGVyLg0KPiA+ID4gTWFrZSBjb25kaXRpb25hbCBvbiBMTEMgc28gYXMgbm90
IHRvIGNoYW5nZSBwbGF0Zm9ybXMgdGhhdCBkb24ndA0KPiA+ID4gbmVlZA0KPiA+ID4gdG8gY2hh
bmdlIChEYW5pZWxlKS4NCj4gPiA+IEFkZCAnRml4ZXMnIHRhZ3MgKFR2cnRrbykuDQo+ID4gPiB2
MzogRml4IGR1bWIgdHlwby4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJy
aXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBK
b2huIEhhcnJpc29uICgyKToNCj4gPiA+IMKgwqAgZHJtL2k5MTU6IERvbid0IHVzZSBzdG9sZW4g
bWVtb3J5IGZvciByaW5nIGJ1ZmZlcnMgd2l0aCBMTEMNCj4gPiA+IMKgwqAgZHJtL2k5MTU6IERv
bid0IHVzZSBCQVIgbWFwcGluZ3MgZm9yIHJpbmcgYnVmZmVycyB3aXRoIExMQw0KPiA+ID4gDQo+
ID4gPiDCoMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZy5jIHwgNiArKystLS0N
Cj4gPiA+IMKgwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+ID4gDQo+IA0KDQo=
